Return-Path: <linux-leds+bounces-3751-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17760A08E94
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jan 2025 11:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB9B3A99E9
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jan 2025 10:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D6720B809;
	Fri, 10 Jan 2025 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMH+7UMp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831220B7F1;
	Fri, 10 Jan 2025 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506421; cv=none; b=HA41hcxwJ3S0mmWSnBunk4Zykjbq18hOITg0Gcarogh5E7lCAypJ4MASJu0Q0YSq+IRFAsrKfvMMORKE/vbzs4lzKForuCtP2lGipFauiLcGzwzG+5Q008CPPSQa3M9zAXYNNNL1Co3ka/sp7CnBnpcDHHK3jTCoqfNq2JtekTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506421; c=relaxed/simple;
	bh=T3nIoIvI+u1NqhK6kudCx1n+RV/lbK+h9r8cakT62jQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyqvbB3y3iOGI1d6zVLJWqJ3IXq3Fn85RvtlRNwnXDIVShUK7UBEHHI4e6bbXKa6zFms5yJlfHiM6TUozQlYsnqRkqZVcpwbdtIQPFfs/tvCZmJciNQfSzXwOCECZAyI2r3EA8uNG6R4BlBajBoP/LECcrOgxTFqmpYsljyWyKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMH+7UMp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2162c0f6a39so52676715ad.0;
        Fri, 10 Jan 2025 02:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506419; x=1737111219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nh6xwMih9t2P8bSHc/qwvE7dR1ONV0eR5UnEn/Ji1oc=;
        b=AMH+7UMpAKE52tjn91JpmW3l8HH5s2Iz0mpNz2YebrIIu+2LXv8fv2xeRd/XJNrGyy
         m8xcoWNvwDqSUsMFa+cBT72BUDSlFHuLE8VuvCNfNqoN/Hn73Kbci7qvmaVw2WiIMLD6
         fLrNarFBKT+oyeFG6ezTfMaUqyADEKgfoBcGohTKhnpUNK8pHQHpxJXqITzXziJ9vLZ7
         OPzIjvyU0DT1j8hUHNozo0EI/gp17xv2AYnynn9zuuIp8YtQkriEf+LWrmRUt5SyCaih
         hkgdn372XeLYpyZbsZI1loepUJxBo4ipCJZVrpkrm6yeOzmZEe8zwqjwPPPxyMQgmuVh
         I+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506419; x=1737111219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nh6xwMih9t2P8bSHc/qwvE7dR1ONV0eR5UnEn/Ji1oc=;
        b=I70tKIBQhz0T0WLNA9Vd4Vt0C3bRIRYamiU5lRiDCrirHQv9Rr+0aIGMQFVPvavQDQ
         zsCNkUknAPqfdiz31QMrCvinb8SiWhenYeBjprwgBhDr9Tz5Ksabx3w/qtz5ngTnkrAy
         8Et/oVhQPV3OBvoda/AU/ePq6snO6PEhFwiIC4bq3Cmc9cWXzGMIMKkDpBhLI6UEHbqz
         sLGgDoKaM2bcQMjfzkYn7jF5GcbSe3RWnk75JVfcskbimTjWs9byFbuHi33N6uPlqwh0
         0Veb1D/Qt3exxD9AXsBjr4EatTt61cpuQ8U8UJgp5FYKq2zhhKXVBY+BnbCfGlrR75oI
         gP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/nwIV1FtpwR1jz91aUuDo9Nbr/95NxSksC6nUaBmUK+DrpZC90EOXvvZqOO62erB6ak0ONsVKpYpGnNY=@vger.kernel.org, AJvYcCUD2z/G+PdEwiRh6XO47wJJF132RgM7gzb/RFiEImK2WS9ldqB+1ebB60h/IN0pRqjlBAiSTudN3OUjulhv@vger.kernel.org, AJvYcCVbLOXuDK7XoAqWzjjWG4DegvzcQyEI/udfR4mt1Yb+WTCGiYGxjN8mOq0vPKmPUHKGjOAnZavYbx0C@vger.kernel.org, AJvYcCX08LhZxHRvgX7fT0aNLpWh/LECvjOKwM10cRVqzsdICeekSeofpcuLEw/qlvwB6vWEV5Kbzlnl7KTZmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGQ4H7oWdauc8Y89pWVoG+uUjmQiWDiUwZzRhx9LsmRPCwaJt2
	7Tv7qN6ysrXu/veyzn/3Ppbgx1i8MttTBkLgYlD/we0Itk6NYdaR
X-Gm-Gg: ASbGncv5i9JgTI8rMspkjbzCdLqOp8g4msXKs+OVDGbbc6Ie14jM2A4nm9xOeJ+N0mX
	57XkAWjAc4L41p1mkjs/FRTvSoaUTEzhKdghBxIcdM6pOPMJPvcCdYhh8D9+2F0V/ECdBHPi0BN
	+HmC1j1IHPiltG9g/wrC7Z3elN710HvTkWsJ5akHGlfj3rs8wAGQ+7+YYh3LK1T/X6es/1hs5Ff
	8NuLBkXBQyfIu3xcNZm/AKBYWNdKvi4bCFM+O14kDCzL+Mo6M7Gi8L/+A==
X-Google-Smtp-Source: AGHT+IFKPN2XI793AfBIiNWSp2Q2nh1umRCT8qWiYft+E5B1hLK6XOeAjDZY3jeTnrRaKDwUjRNE8g==
X-Received: by 2002:a05:6a00:3bc9:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-72d30301d86mr7980627b3a.1.1736506419152;
        Fri, 10 Jan 2025 02:53:39 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:38 -0800 (PST)
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
Subject: [PATCH v5 2/3] backlight: apple_dwi_bl: Add Apple DWI backlight driver
Date: Fri, 10 Jan 2025 18:52:05 +0800
Message-ID: <20250110105304.71142-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110105304.71142-1-towinchenmi@gmail.com>
References: <20250110105304.71142-1-towinchenmi@gmail.com>
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
2.47.1


