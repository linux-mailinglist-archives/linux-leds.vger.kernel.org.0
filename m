Return-Path: <linux-leds+bounces-5127-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9DB11D3F
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 13:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1830D1C863C6
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 11:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D2C2E7177;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9sPIwOC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5942E5B3F;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441767; cv=none; b=EnFkMrn8DBKgI7/m+B7ba36AyBYiJpX9ytkhkyEOxY9crjkmspOyIyj3eo6dLbx1OqOYS811VpSMR1JL52JRpJzuJzT2+0mektQg0JRIz4a68XsqcT4ih6QOocT9yIoiMt3fD/Rto6hWNKV0dnflRwe06eJwnIOtn1wnRavIbiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441767; c=relaxed/simple;
	bh=KbANwn4NmNO7jNz4SGe7SAKLtyBDL4GI6/j143/N1/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F29d/5RLYPdyo/VHqw5G8d5sxlk/UqVWlO1Z0920kEOWzKeV7ooDjZa8naTSJiMbuF5y8NCiXabPWdMHGJs19r0JIMXn/GDAWZzDEVazbTyAcNuosLzEGnaUbn2+Yy/Uxz5eovM4f4YSly0otZZvKpSoaMSI2ZKQ9XhftNKzzas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9sPIwOC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD64DC4CEE7;
	Fri, 25 Jul 2025 11:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753441766;
	bh=KbANwn4NmNO7jNz4SGe7SAKLtyBDL4GI6/j143/N1/E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=W9sPIwOCB5dNs2yTE7GskZjS3l63MyPbMenDtqb2FOXjCWml2zp9FjDmsmuJ+QGEn
	 6yo9aMmWsR4WinMQt4VBv2eXbOD7modh25V/zbZ7tXfAt2qiFTEK0FzRI0MPMSxtnV
	 LiHjfmIw4C2CTVY4dIKYaKs+DE6SOsEU/Rb4Mczs8Mw41I3S2Tp/JEyrgDeGNpfWMc
	 XZ3owU0So9alJvD6pMSFMKuAijgYcqRpURpLZyOUeK+g7yv4874xrgKAzwZVEwzlRb
	 mDu6wcPrA9iOkKgFydnEk7ZQJw8EPW4spzrmdY14hLh9sxQCa9fjCZ6Z5BlsiMumxL
	 QPXqWBwUEpPZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88D7C87FCD;
	Fri, 25 Jul 2025 11:09:26 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH 0/4] backlight: add new max25014 backlight driver
Date: Fri, 25 Jul 2025 13:09:22 +0200
Message-Id: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJlg2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMz3dzECiDL0ETXxMjA3NTSMNUwMc1UCai8oCg1LbMCbFR0bG0tAB3
 YAxhaAAAA
X-Change-ID: 20250626-max25014-4207591e1af5
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 "Maud Spierings maudspierings"@gocontroll.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753441765; l=1452;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=KbANwn4NmNO7jNz4SGe7SAKLtyBDL4GI6/j143/N1/E=;
 b=PjTusrgPlZupmtwnWn9StKXy2DkRV3eFf5M+adbF+rEkvyz1mG3L2XP9PPZrorFH+PUwg5zR7
 EKaU2GeBddlCmwwgOer6BZEklYbXnOarE4DYHFsHnMYmH89T2htQs71
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

The Maxim MAX25014 is an automotive grade backlight driver IC. Its
datasheet can be found at [1].

With its integrated boost controller, it can power 4 channels (led
strings) and has a number of different modes using pwm and or i2c.
Currently implemented is only i2c control.

link: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX25014.pdf [1]

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Maud Spierings (4):
      dt-bindings: backlight: Add max25014 bindings
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    |  78 ++++
 MAINTAINERS                                        |   7 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  21 +
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  19 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 449 +++++++++++++++++++++
 include/linux/platform_data/max25014.h             |  24 ++
 8 files changed, 605 insertions(+), 1 deletion(-)
---
base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



