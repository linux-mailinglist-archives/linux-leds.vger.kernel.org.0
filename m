Return-Path: <linux-leds+bounces-5493-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B63B52A92
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 09:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F37583431
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 07:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ABC2BE05B;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DF89uASQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E4A29E0FD;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577208; cv=none; b=hlIRtn2YBNapV78u4BnsMyUC5kcsgEo5YknxGQ82A+EI3+UQAi+SmZHhWRbLoB1vqIVZ6Z7Nt3B+vyQfOItknAypHPKhTYs3hShwY4buOTsPhgAlonVuTLKeYKZH9VJaCEuBneAv9onniZ0DtXGL/rqlzAHCZBZcRxurMhHFTpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577208; c=relaxed/simple;
	bh=JYHCDp0OgkgiBtsdNk57zUPJNY+sgFdo5atkZ1PTj6I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dev276oPKjzme7Djw73HvLvI/Hl9gqa9Oga50gw7wIetXTaTnx471EdSqCwYfF+WOnsXGx5dhXn4nR+ghBgbd6Sz9u4EjiJ/ubocWtHixqsQ2fwBUhaWCINHVgTvQCOopJ2NYIUSM7IPbjpVcnDtlUjgFf0A4NxEc7AC2pziL6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DF89uASQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24796C4CEF1;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757577208;
	bh=JYHCDp0OgkgiBtsdNk57zUPJNY+sgFdo5atkZ1PTj6I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DF89uASQ0pKbGOBT8kGdB5OHx1KXoX/LanwnwlK3O26IGXKZI1kyDtdKIQiie8rTT
	 9rIAHOdZv0YFKVbds816H2tqdSWQc6NCcuQz1opxa68TGZQZG0fGG+YFMGzZ7WXa4F
	 ZkRdg1IeblKqO402CJ4lepYUYPMAfasC5ts1WiWjHMcFdOA476t+HZZYiTTifp61cL
	 XZSr0n+t0K5UkEvufIIHu370FlfGezZM2JH4ZJKdt5C6pLq5VFOSJYQkhmWxW6X54O
	 NY2x0g2TOyAh/0/ngWY6EIpk0smtt7LGTjZCoY44Toza8I/MMzXNJlhwLUYJtHiP6a
	 2qTI+w+5RthRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11297CAC58D;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v3 0/4] backlight: add new max25014 backlight driver
Date: Thu, 11 Sep 2025 09:53:17 +0200
Message-Id: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO1/wmgC/2WMzQ6CMBAGX4X0bE13bfnx5HsYD7Us0ASoaUmDI
 by7BQ+YeNvZfDMLC+QtBXbNFuYp2mDdmOByypjp9NgSt3VihgKVyDHng57TBZJLFIWqgEA3iqX
 5y1Nj5z11fyTubJicf+/lCNv3GylQHZEIXHBBpTFUpV5Jt9YZN07e9f3ZuIFtpYiHXUL1Y2OyV
 VMXmp4ggfSfva7rB/TziWHjAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757577207; l=2445;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=JYHCDp0OgkgiBtsdNk57zUPJNY+sgFdo5atkZ1PTj6I=;
 b=ER/Kzm7DoOgVkXKYX+MdqwQXjjQApV1kMMRqwkbh8CLpSBQhucsjA4Basgm9YI9yzsW9EKfhk
 RmKTiMQfrHjCeUGX6NPAD3DJMSpDS4Nz7yEr9Ttu6NV1Zrp+einXBLA
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

 .../bindings/leds/backlight/maxim,max25014.yaml    |  81 +++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  21 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  19 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 394 +++++++++++++++++++++
 7 files changed, 528 insertions(+), 1 deletion(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



