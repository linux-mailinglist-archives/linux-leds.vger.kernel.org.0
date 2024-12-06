Return-Path: <linux-leds+bounces-3500-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B79E7730
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93DD918858B0
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 17:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C2D1F3D5B;
	Fri,  6 Dec 2024 17:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6crsPCu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCACA220698;
	Fri,  6 Dec 2024 17:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506097; cv=none; b=WDV98C4BX14SwV0uJ3cywNQ2BOJJIQ+J0WA1N8isdxWFQ/FYUyWe0F9rcWafQntlxlo6HfCdaEGtP850RtSwLoY6DPWpgtgixbJ9+pyPC2mm5tjjKmMKhyIpzYRgV2brULj/b58rz+pCSOhmVCEuW7A9/iBpyEpJBZWbkho0rZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506097; c=relaxed/simple;
	bh=mMobX7/oh44I6gL0HhLv7iP0o+GmSInp/cnWKFSrhQs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODukGTX1Ai+nCSeNAFHM4LJgLfJkTCLicnVb/RM922sIOkW0O545yP8kTxutcooQhfJwj7+djjkiKqHSyKdtWiyEZVmo647xc2N81l/HeW+oMBwtCrinibt1nwYmkAB3R16tewwymfkbhc7Se0SRcEquh/HY93MWIq7ivpULI/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6crsPCu; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fcf59a41ddso1776920a12.3;
        Fri, 06 Dec 2024 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506095; x=1734110895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mhx+3SpE0HhgGnWW6FB4h1qjMppjxy5kVkibP++35Cs=;
        b=A6crsPCugNcsgY9rBJnXXiP/137/NfsDvGr0sn38AHYH+LSC66JSraTj9DraQa5Ix4
         lXHHsMybOFutn/CXPpi0D1hpuGFxoCAvKzypFCQPoQkQ5OAzYxIKoqnv4yHP/cWQBoR5
         vh2qgOC8CGm9WA0cWhDmByu+MsLQQqmQlOydJAyA6trsRb9dRyqsIJDjDvOwXt48p/TA
         HDz9zGO0QlJLtdLR8gPe8Lr+qIuRT57Y2q2gcHidUx3Z+N9gTxvJ+nYLbqslyHdqu+tr
         hjToQI6t6zaeiNf0Q13jkOr9jDkYyAQ/5miL7WdZUprBWBfmjClGdVVbaQLd13BDuweX
         SOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506095; x=1734110895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mhx+3SpE0HhgGnWW6FB4h1qjMppjxy5kVkibP++35Cs=;
        b=M1rQfErPpS//IgHlq38KB+/bAmVRXMgvAOSkQuGJdseat76KqBOp9VXi/d0o58U+e/
         jWgEJqtXFPBjAwte7qBuPIiB6el+gRk6lXrs2YXdNfz33hsDSEieFk75+YHOAx8Ut8rj
         hjDEx0yn8+c9Pow22wxA44rTVPlovSnTY7q6mdnwX9PP9llj/4Q5EcUGTK0EYwivrY4w
         ee8/XAjQ4/DxKYQintpxsCZ35BEV4M/unbEcgigzDjFybBaycdZ17qM1RpaKD11wZnWz
         759SNc36yRZwIOt6GSzFwkZ1WcV5qNuMWVFYZTmqLL/qw8gvbXU0uff2TVHVrxA2Uaju
         PSOA==
X-Forwarded-Encrypted: i=1; AJvYcCUSz9tE15QA4I9mflYhvLaxZqnmu9s/5DZwM/X2EqR+AaleSkkHph44Wwn1nkeikRQMYjEDoxpQ7DYRdg==@vger.kernel.org, AJvYcCVaCYvP6C3fQ7RgeJ22cvYTiZvNi2igoCx5Ku3FY0Km+tUWZr8EaeNa9h4lDgj131o4WLICjvwDjW7x@vger.kernel.org, AJvYcCXte5HvdYHYU3jT/R89Rc9ecuvrTcoKNB2zjum1e1PgQElgZfRGvXskBEVQtqhK9yQcGbay2y0g5AMPCk0=@vger.kernel.org, AJvYcCXvpZXcrIlMYME1g2v8DDWDYlR3Ic8ACy8Nt/bj26HYBU5H85wtGXX9v3atH3RrchWj5La/mYEfw8UzxNx9@vger.kernel.org
X-Gm-Message-State: AOJu0Yylz6AnSEPXIEjuHgaUy8aDDyx6K1toMRo0dYkz/3ZynnVns9tJ
	tPK9S7hiXSu8ALZlNBjGbhp8y3RuKeDnRIGJDHK11VaI8V7T9S7J
X-Gm-Gg: ASbGnctLhzQTKUcMQtGxlicNPsgdyXoynNJ+DnHana54scjfsFuC2eQkkrbxGMfg0YQ
	Zs0BzRHPBYKpFXaayhtKdADY4/2nniXso4LuvUDnN6IYWUTMnvGWu7xLXeUKZDxAg0tWHj+6y6K
	5hNr7o7E+nR+jFgD/ZYMD7toPKcMaDfDw9QI/eN4A8EELPsbwFnORLTaHQk0iLUa5h4VO6HWeDY
	J++qW7A6noGHMsht5yQ3XZov/2XLNbFvBuuxJwiE1f3n0JnJOVp8+Kr+fWZdGnP
X-Google-Smtp-Source: AGHT+IHmRnmelG8M99ofNXhJAhbZ1joLqatv/c5LTXmUbLyOedvxPVbkzChlDj9sArumdzcvk7YaUg==
X-Received: by 2002:a17:90a:c105:b0:2ee:db8a:29d0 with SMTP id 98e67ed59e1d1-2ef6ab07f61mr5535784a91.26.1733506094955;
        Fri, 06 Dec 2024 09:28:14 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Sat,  7 Dec 2024 01:24:34 +0800
Message-ID: <20241206172735.4310-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for backlight controllers attached via Apple DWI 2-wire
interface, which is found on some Apple iPhones, iPads and iPod touches
with a LCD display.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig  |  12 +++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/dwi_bl.c | 123 +++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 drivers/video/backlight/dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..e64cc3d51ac5 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
 	  To compile this driver as a module, choose M here: the module will
 	  be called ep93xx_bl.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+          Say Y to enable the backlight driver for backlight controllers
+          attached via the Apple DWI 2-wire interface which is found in some
+          Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dwi_bl.
+
 config BACKLIGHT_IPAQ_MICRO
 	tristate "iPAQ microcontroller backlight driver"
 	depends on MFD_IPAQ_MICRO
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..0a569d7f0210 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
 obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
 obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
new file mode 100644
index 000000000000..6dd7edf661fd
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for backlight controllers attached via Apple DWI 2-wire interface
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/backlight.h>
+
+#define DWI_BL_CTL			0x0
+#define DWI_BL_CTL_SEND1		BIT(0)
+#define DWI_BL_CTL_SEND2		BIT(4)
+#define DWI_BL_CTL_SEND3		BIT(5)
+#define DWI_BL_CTL_LE_DATA		BIT(6)
+/* Only used on Apple A9 and later */
+#define DWI_BL_CTL_SEND4		BIT(12)
+
+#define DWI_BL_CMD			0x4
+#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
+#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
+#define DWI_BL_CMD_DATA			GENMASK(10, 0)
+
+#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
+					 DWI_BL_CTL_SEND2 | \
+					 DWI_BL_CTL_SEND3 | \
+					 DWI_BL_CTL_LE_DATA | \
+					 DWI_BL_CTL_SEND4)
+
+#define DWI_BL_MAX_BRIGHTNESS		2047
+
+struct apple_dwi_bl {
+	void __iomem *base;
+};
+
+static int dwi_bl_update_status(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	int brightness = backlight_get_brightness(bl);
+
+	u32 cmd = 0;
+
+	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
+	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
+
+	writel(cmd, dwi_bl->base + DWI_BL_CMD);
+	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
+
+	return 0;
+}
+
+static int dwi_bl_get_brightness(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
+
+	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
+}
+
+static const struct backlight_ops dwi_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.get_brightness = dwi_bl_get_brightness,
+	.update_status	= dwi_bl_update_status
+};
+
+static int dwi_bl_probe(struct platform_device *dev)
+{
+	struct apple_dwi_bl *dwi_bl;
+	struct backlight_device *bl;
+	struct backlight_properties props;
+	struct resource *res;
+
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
+
+	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+
+	bl = devm_backlight_device_register(&dev->dev, dev->name, &dev->dev,
+					dwi_bl, &dwi_bl_ops, &props);
+
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
+
+	platform_set_drvdata(dev, dwi_bl);
+
+	bl->props.brightness = dwi_bl_get_brightness(bl);
+
+	return 0;
+}
+
+static const struct of_device_id dwi_bl_of_match[] = {
+	{ .compatible = "apple,dwi-bl" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, dwi_bl_of_match);
+
+static struct platform_driver dwi_bl_driver = {
+	.driver		= {
+		.name	= "dwi-bl",
+		.of_match_table = dwi_bl_of_match
+	},
+	.probe		= dwi_bl_probe,
+};
+
+module_platform_driver(dwi_bl_driver);
+
+MODULE_DESCRIPTION("Apple DWI Backlight Driver");
+MODULE_AUTHOR("Nick Chan <towinchenmi@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.47.1


