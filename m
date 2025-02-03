Return-Path: <linux-leds+bounces-3871-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7A7A25898
	for <lists+linux-leds@lfdr.de>; Mon,  3 Feb 2025 12:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB93162261
	for <lists+linux-leds@lfdr.de>; Mon,  3 Feb 2025 11:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB80204592;
	Mon,  3 Feb 2025 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkzS/afA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127EF20409B;
	Mon,  3 Feb 2025 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583555; cv=none; b=A9VbOyttcm5Kd6i3TRf5UtjVBywwLsrX+LH6gtWzaLFLS9Bw3V4/x7wE3z1j5PNd6BhX+p664usMfH7n55RTg+eWkfNA6OzcKsGgSh8Nh1hXgZdgu3e9gskxglyBib6a6Fz8E4prvn7x7pcimy2x3dZOkTBhEFhiW8KSv+AWJ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583555; c=relaxed/simple;
	bh=QwDgbG+tY6+So94gundvFXsu5ZWRLKety0hbMOMSb2A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgigmH69/uxfgUY55rfXvZE/05/XjDjJZ3c0RwerOB4QBaWFW7mwrboFft6hY7JOMOBAPzZDUHtpo9GRnXKiqv/TZZKIsee1Tcgloe07JKl+yEKdS1blrql8fY/6PsJ2Cw216ks++dMpaln36gDOqN+ynz9TY3mZ1SNRwV1UeXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkzS/afA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2166f1e589cso3678285ad.3;
        Mon, 03 Feb 2025 03:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583553; x=1739188353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuVUwIb3ATElWRb+tDZLU6hMx05qo8CzOAa+DShnxhY=;
        b=JkzS/afAc2T12gfO9gpd7TCt3IUDOaZ+NBNiQyN50Ks1IqA3DKiBTMbWKkNWzv6XTB
         FLwZqE2xcIOTtrtjm0eupfJrxg8uKRPqWWzJ/ZmzdCwnA6qNFH4zEytpcam6YLCsVZw9
         GqRCNLok4utRKmEBBnbu3rDGeZ0H8wSZiyOvMHYBo00Ex41axsHQrL49U7/I885urawA
         cMuOF3zKPMCpymPNy4Qyvlj17HG+bvMGswf8kXQcZBkaEBnDCyBsMN1+aFBahD/zPdj/
         xTphR/1ed+gcSTLSRE00Y1mp7LRwD9Jv77cw84nLYPkSA2S7TDPFfY07pINOfTPeK7mF
         ip3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583553; x=1739188353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuVUwIb3ATElWRb+tDZLU6hMx05qo8CzOAa+DShnxhY=;
        b=WnUvz/xVzmSF/AuQTrxe5tlRuHvzxMuYCI8qIXkqEgB5HEzdr7bOp3qGic3EPb72vq
         IirWU3T1PbGpU7ernG8hVR28ZuUY+NzkgmCynqRfSpe2b3cOHQB4hjt55RjbAQXSUdXm
         BvuJMIPIXF0/LYzylvRowDc7gMb7EiI68NAC8hNxdrd2wcB29GC/BmscgKH6H4ZRjK3w
         CKEmF5xOfrpSO444ZrnVw6MdmeN8jMmuSzQRgTBemPcJ/QYWlgX+RC9uFUF3NDInJKXp
         aU3x8APRurNGuK5IdtRl8Gb1+iNCKUkkrDsl03s7q+VFYCZbs0aS3RFbhX2d/xw485i8
         FZwg==
X-Forwarded-Encrypted: i=1; AJvYcCUopLi84F72MwKUMAgKAFtPDcq1kCwJ6ywUwqgOzYFC7QUTu2ih78IxyOj7X+7v0TA0KB7Js+Dr4iBt6GTW@vger.kernel.org, AJvYcCUwzfWJMFq/ACJDkvMsuGndrnpSgvCGpRtcahBLY5Tanwgl7HdG8ntYfn9j18FfuGaU07oIn1T4X7zrlXI=@vger.kernel.org, AJvYcCVnkP1VpzrtWckWHLA36dmDWpVoVA/xYDxh9fmCVU3awD8Nq4Z9gmewrOpLPmkB35cJSFh25sPqhdawnQ==@vger.kernel.org, AJvYcCX+yorpw+5a2cEkHHmyjDi387Yhm6p8FkA8z/GiApiou16TSzs407OU1gMgPM8dXJBJtJF6GkeFVs9g@vger.kernel.org
X-Gm-Message-State: AOJu0YyK05COs5yCMlFYDlq2qiS6GESFPQm1bTBwQwfXNbGOD/RcnNtv
	SFw46ZBtEd06bAL7yyRrKDvICHgxPAPSgV5z8nRgik/kIBUYhC3D
X-Gm-Gg: ASbGnctCBCF1HZ6J+QHbqrw1DpFyVArjdepUxLLqJ7CAY8Njjy/av6Pl+RPzltxO5cl
	tHKjubLdl07nE+qG6QV32yWkVhqU6EY2psowM2aP4fu2LG9sm5zPP7vdo0oCTvgQtHKgmAuMWsK
	+unQx+yJFM3wmgZ6folpSuO2LAkculnD56EQBqEFK9g4uq9UXvx5R7mFDR8kPc1rCP3cs1EsvqZ
	aVFZ/xkNBrAIJOy2DLyNVXkXXPcphukKjb6X5dXMSViAOXIFjWSLRidpEFxbU+pBMkfVDMr/UhG
	fw7a/oOZ35N5CbcO
X-Google-Smtp-Source: AGHT+IHAUg+jBA6FADxyc/xDCHiXuFU49eYPAhY7dRRNEYaiurAK+cyssoskPZL1rJkF+Q3jR0YDHw==
X-Received: by 2002:a05:6a00:2e14:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72fd0bf7126mr31273767b3a.6.1738583553324;
        Mon, 03 Feb 2025 03:52:33 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:32 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 RESEND 2/3] backlight: apple_dwi_bl: Add Apple DWI backlight driver
Date: Mon,  3 Feb 2025 19:50:33 +0800
Message-ID: <20250203115156.28174-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
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

Although there is an existing apple_bl driver, it is for backlight
controllers on Intel Macs attached via PCI, which is completely different
from the Samsung-derived DWI block.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig        |  12 +++
 drivers/video/backlight/Makefile       |   1 +
 drivers/video/backlight/apple_dwi_bl.c | 123 +++++++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..c6168727900a 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -290,6 +290,18 @@ config BACKLIGHT_APPLE
 	  If you have an Intel-based Apple say Y to enable a driver for its
 	  backlight.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+	  Say Y to enable the backlight driver for backlight controllers
+	  attached via the Apple DWI 2-wire interface which is found in some
+	  Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called apple_dwi_bl.
+
 config BACKLIGHT_QCOM_WLED
 	tristate "Qualcomm PMIC WLED Driver"
 	select REGMAP
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..156ff9461fb3 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_BACKLIGHT_ADP5520)		+= adp5520_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8860)		+= adp8860_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= apple_dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
diff --git a/drivers/video/backlight/apple_dwi_bl.c b/drivers/video/backlight/apple_dwi_bl.c
new file mode 100644
index 000000000000..93bd744972d6
--- /dev/null
+++ b/drivers/video/backlight/apple_dwi_bl.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for backlight controllers attached via Apple DWI 2-wire interface
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
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
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
+	if (IS_ERR(dwi_bl->base))
+		return PTR_ERR(dwi_bl->base);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
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
+		.name	= "apple-dwi-bl",
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
2.48.1


