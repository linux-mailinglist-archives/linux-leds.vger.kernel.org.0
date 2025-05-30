Return-Path: <linux-leds+bounces-4732-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E662CAC95BB
	for <lists+linux-leds@lfdr.de>; Fri, 30 May 2025 20:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A89CA41CB0
	for <lists+linux-leds@lfdr.de>; Fri, 30 May 2025 18:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CE71A23A2;
	Fri, 30 May 2025 18:43:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B927877D;
	Fri, 30 May 2025 18:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748630581; cv=none; b=iMaVa54SfP65kU5f0CdqN80nRlR79lb5J5vSxlU94NJsBsWDClmX88c0D3irrLC3sqrjxLX8cSteblWUqsNd1hl/ZLIOxsyjoS3OUh70v0WPjR+zxZ/OM+S8x4NH544RgcYckKEijGOsjol/rKc7qS7Ttxi5N7oL05zQKept9mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748630581; c=relaxed/simple;
	bh=XxYpfbXOqgLEHMFvgFVs0ExnlLG8YryXquKfN1QFwH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NP9YS8XZsIm7rCrgWT9gISJg5Kf1dETddhVVFjXqQe9K69II1qNSACh+FJ6KMt2zVRkG1L45TXsfUschF97IkKCfI1qnLfyRq7I5ffOrnaWL1Ngc6aJWa7GcM+MFjDQYVGz6H9aFkHysuMDXL/uqWUx07PowKRWQGgYZh3l7P/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b8Btw1Ypwz9v0B;
	Fri, 30 May 2025 20:42:48 +0200 (CEST)
From: Lukas Timmermann <linux@timmermann.space>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>
Subject: [PATCH 0/2] Support for Osram as3668 LED driver
Date: Fri, 30 May 2025 20:42:19 +0200
Message-ID: <20250530184219.78085-3-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b8Btw1Ypwz9v0B

This patch adds basic support for the as3668 driver IC via I2C interface. The IC is capable of driving four individual LEDs up to 25.5mA per channel. Hardware blinking would be theoretically possible, but this chip only supports a few set on/off-delays which makes using that feature unfeasable, therefore my driver doesn't offer that capability. It's intended applications is in mobile devices such as phones, tablets and cameras.

Please note: This is my first suggested patch to the kernel. checkpatch.pl runs without warnings or errors. I've read the docs in regards to the led subsystem, coding style and submission of patches, but I'm still a bit unsure about the general workflow. I will try my best.

Lukas Timmermann (2):
  leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
  dt-bindings: leds: Add new as3668 support

 .../devicetree/bindings/leds/leds-as3668.yaml |  76 ++++++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-as3668.c                    | 178 ++++++++++++++++++
 4 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-as3668.yaml
 create mode 100644 drivers/leds/leds-as3668.c

-- 
2.49.0


