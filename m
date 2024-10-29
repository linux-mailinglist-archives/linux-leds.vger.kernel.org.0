Return-Path: <linux-leds+bounces-3197-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B12AA9B543E
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 21:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AAFF1F23DEA
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 20:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5745A20A5FB;
	Tue, 29 Oct 2024 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="nLCG8YOx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C2A20A5EF;
	Tue, 29 Oct 2024 20:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730234527; cv=none; b=fRoMZfOwpu1DB+hXjh0v3fBGOplHWRwMEreZfylxpWJ9pFChh7i/itKjYR0Uyqg7BIGD9XhPRtwaKeSc8j7A0wJU41BeFfaEkDCxF3tq6sClbfxyWaDmT+Ol/LIkt4BLnn2DeLhKbfGf3E9IlI1Dgt/5heJbDwx+5+hz2o9Sre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730234527; c=relaxed/simple;
	bh=5vxa+Okx7IWKyZj5IBgn5D0sddHA16KpsHwM84srM9k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UKwz8SJ6bDBilV68h0hd71RTkzxUREi9X/qwdkYyuXYzFUbokg071p7wupljFA5Fq8G3Vc/qTX0CWFetxNV+fEBLzZHihNqjOaY/oXfLgpmBaNJUNmuxdsdkOZq9evLOhuIJYzvwEu+hI3NEDzAB4Fd2PbxlC7W1ldCkzs916F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=nLCG8YOx; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from fpc.intra.ispras.ru (unknown [10.10.165.10])
	by mail.ispras.ru (Postfix) with ESMTPSA id 066A440F1DD4;
	Tue, 29 Oct 2024 20:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 066A440F1DD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1730234521;
	bh=5vxa+Okx7IWKyZj5IBgn5D0sddHA16KpsHwM84srM9k=;
	h=From:To:Cc:Subject:Date:From;
	b=nLCG8YOxrIYNFlR1s/F2uD9474hPpzJTkG3l3QlaZ/dsp1IjYNH3HvjCpyurRmGgV
	 ivvegsS2Yh0E+Ng0V0iQ5P770Oru8ZYNBNhFPQ1KGzo17sP1AgbuFAGxH/zr5EYN91
	 EqDHbiZCcC0X3vrSJQR14QRdCUrd5eThIvN7+BJs=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Kalscheuer <stefan@stklcode.de>,
	lvc-project@linuxtesting.org
Subject: [PATCH 0/2] leds: spi-byte: fix regression introduced in stable kernels
Date: Tue, 29 Oct 2024 23:41:26 +0300
Message-Id: <20241029204128.527033-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream commit 7f9ab862e05c ("leds: spi-byte: Call of_node_put() on error path")
after being backported to 5.10/5.15/6.1/6.6 stable kernels introduced an
access-before-initialization error - it will most likely lead to a crash
in the probe function of the driver if there is no default zero
initialization for the stack values.

The commit moved the initialization of `struct device_node *child` lower
in code, while in stable kernels its value is used in between those places.
Git context of the patch does not cover the situation so it was applied
without any failures.

Upstream commit which removed that intermediate access to the variable is
ccc35ff2fd29 ("leds: spi-byte: Use devm_led_classdev_register_ext()").

I think it's worth a backport, too. The patches for the corresponding
stable trees follow in this thread.

Judging by Documentation/devicetree/bindings/leds/common.yaml, "label"
leds property is deprecated at least since the start of 2020. So there
should be no problem with switching from "label" to "function"+"color"
device name generation in kernels down to 5.10.y.

--
Fedor

