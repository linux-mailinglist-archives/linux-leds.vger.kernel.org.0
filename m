Return-Path: <linux-leds+bounces-3518-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E769E8011
	for <lists+linux-leds@lfdr.de>; Sat,  7 Dec 2024 14:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CDC418843F2
	for <lists+linux-leds@lfdr.de>; Sat,  7 Dec 2024 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B93153BC1;
	Sat,  7 Dec 2024 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfvKuj/r"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6C1482E1;
	Sat,  7 Dec 2024 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576702; cv=none; b=N7aMKunbrM9DOVCvCDJPk0UZ5vR335j4yasbuNHrn/8+/WHRbbDUpxs+gakKlF8HSMQ9uyMFN9fBn5yPrPSFAYoVTnJ/k3TaHoBZUkiVsNp1J9sjSzkywfnGwjZV8gUCZUMAqq/gCQTISeZMDAgD04z08CPZGFfGIx1Dz0mDCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576702; c=relaxed/simple;
	bh=1UUx9CtJHDQtABTlOcNtN/R3mQix+/51t9fd/QJmg84=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQTV6MrbVvr1V2ZVDXz+l+9URiQm+pi6uSWcavWhYKj1MlP51b4579NYmwFVbNlefVYO5EGOWvWMJdkTpLFbJ1SZh6Q0SuSVONf52YDhnzcftYh05iIEUGr7sxPK6FsONn1Ra1qoGfKMU8ot1NzD74dBGGdfAy7Ui58WTmo888M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfvKuj/r; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd10cd5b1aso2220453a12.2;
        Sat, 07 Dec 2024 05:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576699; x=1734181499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHIXzgbPPD4fstMUw0DICfprbDFs+kDoHZiZBpx82hE=;
        b=kfvKuj/rUkj7CGsrQt1Fo6tbxAHx5vwT7yuNC4G9vZujN0EiJKzVAE+IJO0XgYGhS/
         BvEsfeQQ+XXCKqS32CVKmhgMTg50gxpfWNI4e0/u7uQ993WC5x+AcnWcpEybUTFb7GVG
         LLgVM61vSC/koN/f9tX3OdcXCYoDEViXj1lbeHgjhOzylwveT6F4vqaehY+IE5Sf2/6e
         AwmGg04I2pQ+OM7oahjyeqlEnkptWF+FdQbo5Huv70LI2jKv0lU9h9hrF4JprvMx9gde
         Ia0WbdDKGTCdqELg11DIsd1brPN9LT0znROotIH7r1pEKc3wRMnE4JepTw6OlIUYhTtY
         kzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576699; x=1734181499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHIXzgbPPD4fstMUw0DICfprbDFs+kDoHZiZBpx82hE=;
        b=ur+97QFXwg2KRD0Xm8G4IEEbGlgU8IjdC6chj/U07/kFVtGdasRKD7UqxCv6a/xQ97
         RwIH5imR2oD2LQSPw2FsGAYMG9JXfpuGenxBt7+FZEpvx/OWooeyNyggYDcsffuyT42N
         fGsSKiZb2ffKMg1yIC3GubJCgAFhdqeHyEo5PCRnLw9zbZ9vCJJgUgo55sMEkgCbjhNM
         KZWd0owh8dZ2uvryztNOk5DWNqtEPWKFRBkJLVK6vQVGeVurIDNMRwH5jiyxKbw/a+Ww
         +SOhy+m3csKh5mkv9LJ6aVFBM5ZZJZpR3WxK0mFBdipm3VLsMLs4qBE53aoMfasyLhoH
         GfAg==
X-Forwarded-Encrypted: i=1; AJvYcCUj9WO5CGJ9S1w/S6msnYbfhAo0liYfeoi5EnCuCWEIuplBY5ASPhydRO3EKeLON/4CTPTiHse835YRjHU=@vger.kernel.org, AJvYcCX/5joQrk/zCyAmJMItizP9hb8S2T4+UsXL4hDeHLiqnlwjYzuxMqts7xCvggsSh6xf1bEESKvvTYjP@vger.kernel.org, AJvYcCX68Se7DTUX93lgXC1ddfxEZ288icnJmlHZXAZxeylcggeKPdZme8s3XGMczOj3CGMH7m9YgiPAeVTSqgTE@vger.kernel.org, AJvYcCXjbCyNt1nsOi24T/Jj94LnrwLMCYUQfJ3GSz0FAdTG67XeA5B9uvHKGt2a3/C76SLY7TjUeQEV5AUL3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEDAGNjY0pRo0+rhMUcN7VLcUTiUfT4aWNgt10uXWu9Ql2BYUe
	F97Mgl6R22O+08olZGsuvKxnCXN2o6eQiX6ADcsEKFhYsNCKoQwl
X-Gm-Gg: ASbGncsBw0uieWIlLFXuGA9txJRRLEIj2+C6/9b8os9xTWvz8xi/atYbxN1ZEVnMSFg
	Lk1fs1bPFWjGxQ0AxS58drY6yxRiCHgs09x2v1AzOI1HcN3qw3rP8Mr+zgKQMPK/R/i/nG61TR9
	ZDIZ2QpHd2BJbhXSVO+WjGQG+j+mX5HT1AKMX0u8+PXdUP2QK89XyHOIX0zQWL62fw7883UnPyj
	X9gxHvRbB5oeS/Twm+Hsl+hh6nasbKm9abSzRUDr5tq9EkqESOivkMipuTrmacgdQ==
X-Google-Smtp-Source: AGHT+IEDQeoGt4Ew7k231hhERT2d9WsKRLc2X38liJ7cpCgF7Y2V2yw87HksK3OB6TyrAZV3ss+7hw==
X-Received: by 2002:a17:902:dacd:b0:216:1b4c:7396 with SMTP id d9443c01a7336-2161b4c7520mr77087385ad.3.1733576699637;
        Sat, 07 Dec 2024 05:04:59 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:04:59 -0800 (PST)
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
Subject: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Sat,  7 Dec 2024 21:03:15 +0800
Message-ID: <20241207130433.30351-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
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
 drivers/video/backlight/dwi_bl.c | 124 +++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
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
index 000000000000..d4bfd74b3129
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,124 @@
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
+	if (IS_ERR(dwi_bl->base))
+		return PTR_ERR(dwi_bl->base);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+
+	bl = devm_backlight_device_register(&dev->dev, dev->name, &dev->dev,
+					dwi_bl, &dwi_bl_ops, &props);
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


