Return-Path: <linux-leds+bounces-4952-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4431AEFA8E
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 15:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70A6B1679D1
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 13:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD5827604B;
	Tue,  1 Jul 2025 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdyzdHX9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B6E277006;
	Tue,  1 Jul 2025 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376400; cv=none; b=Gv4rM34u/Rd2A2tQMSoM306adN1IqEnV4CsF07izsyvDvyuYPDvGDuzJ+DyJyX3hGjfBqZpIa3MtuG/eTJlz7xWfs2Sw8olCi+RzwdkPM5dz5h2ROL/qjEbRNL2h79ogqdawiZ+esMUigvrSOGJz1g5hI5+zXgcZs+wZ8Fg0FeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376400; c=relaxed/simple;
	bh=vV9Bf9gI0qcNXgyISm0/GnqlPhG/JQB131ijFCdEd20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t8HnJziZTgeezB1+1srxfTaLDaKUKPeaGbrC+ogc5OP6Qf5fbIp0mtAdu5ymB7lYjkVzMndVohDT/ylW+nPMRLdBUZ4+QnTv5zzZYFPL5QLaEu8DUyTNy7uABSJT+GT1MC+KBCA8o17ygbZTAFxH7EOgJ7Lw9BUGg3TR3O/MJF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdyzdHX9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0E4C4CEED;
	Tue,  1 Jul 2025 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376399;
	bh=vV9Bf9gI0qcNXgyISm0/GnqlPhG/JQB131ijFCdEd20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pdyzdHX9Adv02RtBGkL+PaLA3/FnCOkIAoS+jys0QeNjCsKWm06LOm/GHJkqP7A51
	 oGNtQ6xGrMRYwCJ/ALGgaSw+vGUGy5owtjBTbVvqABZBReiC5o2BkhuL4gIfP6fK3G
	 4BEjqKKyxZwKQ1aR1mXdYmuAnnECohk3vg3QEdiyOIUF18/PaGQeDBoFEzm/GnakAP
	 Tw3OYIik05lrRyS7W6CuvG+adXAmZrn9nex6ePj3nIevpJG/3BMHQyuJOjwQKA4uOx
	 I/JIUatiVqrGrASUEW2ceaDaxxa0AnUGgqd44cJ8dxUNhLGf4xRDd5Xyje2cYrTjT+
	 6b7jxMPUbkujA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250620114440.4080938-1-arnd@kernel.org>
References: <20250620114440.4080938-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] leds: tps6131x: add V4L2_FLASH_LED_CLASS
 dependency
Message-Id: <175137639786.2318853.6677778376417525201.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 14:26:37 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 20 Jun 2025 13:43:58 +0200, Arnd Bergmann wrote:
> This driver can optionally use the v4l2_flash infrastructure, but fails to
> link built=in if that is in a loadable module:
> 
> ld.lld-21: error: undefined symbol: v4l2_flash_release
> >>> referenced by leds-tps6131x.c:792 (drivers/leds/flash/leds-tps6131x.c:792)
> 
> Add the usual Kconfig dependency for it, still allowing it to be built when
> CONFIG_V4L2_FLASH_LED_CLASS is disabled.
> 
> [...]

Applied, thanks!

[1/1] leds: tps6131x: add V4L2_FLASH_LED_CLASS dependency
      commit: c3c38e80016548685e439b23999b4f0bd0ad7e05

--
Lee Jones [李琼斯]


