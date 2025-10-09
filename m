Return-Path: <linux-leds+bounces-5680-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 382EABC790D
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 08:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E10FD342229
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 06:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D92D0610;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6ZZ2hOk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F442848A0;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759992508; cv=none; b=uuwGQnkKs/j99d86Tv9Ykc3Aqj7N3AvfUMYlZEDH6FM9hVNdzjqE4TJH8Jpx2OwuJT/1Ie5IMbtkcxj7zkAJkRonyxTdgTy8qf03Hc80DPUaOQknbbwFHmIYsRzHSH9OgEbtMqr5j6rk96WAU2nj7AQn/6IGFC6O1pMq6XqBVTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759992508; c=relaxed/simple;
	bh=YvCdpNxP7NaYCSCzTAxqQo43I2kRITJnvwPMfac8Qvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qvDdTvd6/6N7brCSYNg5z1HPkRov2N1thQoFE1HhnLvdFPhB8dMiGBB/N2TI8B1TXoB1G+9oYis/Kn6UL1amZNrHsDWFZ4yHhf6ehhD26Xia2jGrRvLUXsQSnnwNmT0eoPIDPEcy2oyU2t6Vu24V7B1txwSZ1gjuQHXM9pGgeuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6ZZ2hOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEE04C4CEE7;
	Thu,  9 Oct 2025 06:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759992508;
	bh=YvCdpNxP7NaYCSCzTAxqQo43I2kRITJnvwPMfac8Qvw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=p6ZZ2hOkXv2b3TsJ2txsu3peoMrhDJ4cUp9EJVd9UTd5LCX1k4+pEaue94OzPTMyR
	 vYs8KRXSASV/F3VcyKFFvIqxVsvN8VhC9F3Frfr2mnytTVCykDUfBKjlwITrytRJ3C
	 +he4GWLoGxVMgam8CFKDsY7AfDvTwTf2Wn0L+/Cg496o2EYIweJ7uTF7XXQdDz2ERZ
	 BiOlaGt+EtF4zsvSqop6JsV1c60GMsBbcJhO1dF+QOVbnmecJ/ihrwVzijaK7O9xxQ
	 RdTiK85LmFgtZ/SGVgHI7dj1Y8LtdFM7aIhrNCKpIps/QIEurWVeUtPW0RP3h1Z9QR
	 YHgz8kdZ8NVGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C959ECCA472;
	Thu,  9 Oct 2025 06:48:27 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v4 0/4] backlight: add new max25014 backlight driver
Date: Thu, 09 Oct 2025 08:48:24 +0200
Message-Id: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALha52gC/22NQQ6DIBAAv2I4l4ZFEOmp/2h6QFyVRKVBY2yMf
 y/agybtbWezM7uQAYPDgdyShQSc3OB8H0FcEmIb09dIXRmZcMYly3hGOzPHCQQVnCmpAcFUksT
 zV8DKzXvq8YzcuGH04b2XJ9i234ji8ohMQBllmFuLOvZyvNfe+n4Mvm2v1ndkK038sHPQJ5tHW
 1alMliAADR/7fSwNcDJTqNdsrQSWJhUyd/f67p+ANmSlfshAQAA
X-Change-ID: 20250626-max25014-4207591e1af5
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759992506; l=2923;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=YvCdpNxP7NaYCSCzTAxqQo43I2kRITJnvwPMfac8Qvw=;
 b=eC4PsaECsTf07ZDbdKRBsRMKmT6s+SJTW/b+N6Fx7HNp1/fJT5JOKouBKqoJ6Gk50fAUFilgk
 AKjbBdYWCuwAfayOo2hHv8NUCPBXp5nCHhLgeNCkDZOOSFc8ArxewsG
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
Changes in v4:
- use a led node to describe the backlight
- use led-sources to enable specific channels
- also wait 2ms when there is a supply but no enable
- change dev_warn() to dev_err() in error path in max25014_check_errors()
- set backlight_properties.scale to BACKLIGHT_SCALE_LINEAR
- rebase latest next
- add address-cells and size-cells to i2c4 in av101hdt-a10.dtso
- Link to v3: https://lore.kernel.org/r/20250911-max25014-v3-0-d03f4eba375e@gocontroll.com

Changes in v3:
- fixed commit message type intgrated -> integrated
- added maximum and description to maxim,iset-property
- dropped unused labels and pinctrl in bindings example
- put the compatible first in the bindings example and dts
- removed brackets around defines
- removed the leftover pdata struct field
- removed the initial_brightness struct field
- Link to v2: https://lore.kernel.org/r/20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com

Changes in v2:
- Remove leftover unused property from the bindings example
- Complete the bindings example with all properties
- Remove some double info from the maxim,iset property
- Remove platform_data header, fold its data into the max25014 struct
- Don't force defines to be unsigned
- Remove stray struct max25014 declaration
- Remove chipname and device from the max25014 struct
- Inline the max25014_backlight_register() and strings_mask() functions
- Remove CONFIG_OF ifdef
- Link to v1: https://lore.kernel.org/r/20250725-max25014-v1-0-0e8cce92078e@gocontroll.com

---
Maud Spierings (4):
      dt-bindings: backlight: Add max25014 bindings
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    | 109 ++++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  32 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  27 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 409 +++++++++++++++++++++
 7 files changed, 590 insertions(+), 1 deletion(-)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



