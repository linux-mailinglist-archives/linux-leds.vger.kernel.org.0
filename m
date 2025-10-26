Return-Path: <linux-leds+bounces-5879-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFDC0A769
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 13:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0FF3AF1D6
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 12:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4E72D97B7;
	Sun, 26 Oct 2025 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxF1qCnC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AD42DA771
	for <linux-leds@vger.kernel.org>; Sun, 26 Oct 2025 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761482383; cv=none; b=gnN3afU6Vf+ZQGeWTs1A4LExHapIaW51GA9H7dSEelHOtlXC42jLUwt3Lk4RwDK7jgLDuXc8SFDLwgJoFodaHhIRtF65CGlUJsrIcB0wDNmFqglZNZBiNgxqUvUDaTa1PEe75NArES2DaSO5rQaC6oO7S1PCet+N7EfLTdUlzis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761482383; c=relaxed/simple;
	bh=izZFWlBFzA93xqBqEgTOf/ipx0zwcFA/NCL5JSiyWA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhACXv6sPqDryezaFDArBdvIMbZk+WNI0us7ZtZxqwG2X/gOkxL3C4Z9BFcx0bo4ASWJQiojR9GqD5EtF82wrVY2Qj0CMLnHuWe1IzlHYEeUJ4Iy2/OirSH8Pw0FPGSK1iw5obSi0fC4Y0Cy7mhAQpLec95i1Mfl4kYsEeazdts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxF1qCnC; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-33f9aec69b6so5175796a91.1
        for <linux-leds@vger.kernel.org>; Sun, 26 Oct 2025 05:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761482380; x=1762087180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc+8fpZOB5I/9IvnLSdfW8KMO+SGqBBnbxkKuG1XOSQ=;
        b=HxF1qCnC5Aq7ejk7a1eH7g36VZqjgMqlj1K5aHgZ64ii4C7jyynabsOVN6WdgezjU2
         SsI6kCE1JbSMcsEXt4mCj/1oeRGsFw9cgrZv2mzHukTlB38h2Gr4xMhyeGeCFPuvGYMy
         HsFc2tnfzFIQK67cDJ5G5vVWA8mTqQ6GcCdXVcrYzPe9aqUFTTMsdIzC5896q+cVGY7Y
         D1qd5wzwDkxOaftlaO7sPvsg28On/Dxks+5hsstYAEtjGSnNShxtOHdn2Rboxaal3NDx
         OoQaO4KkXqTYtycdVkUX+OYpHdl5i3wLS98ZjvFGRes2uZvrOsQOsp5lnjiKFkkhjlzt
         NI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761482380; x=1762087180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pc+8fpZOB5I/9IvnLSdfW8KMO+SGqBBnbxkKuG1XOSQ=;
        b=ZjHyIlsWwHZoVPu4UVjV2NCQTIKybv9Tcw9ff9a2sv5UnpAaRWaIZg3q5ccx7zNEX2
         iWLawuIy3Va7ekQJ2xvELhshU8yCZsw/nUfoVZMBjU8XLM7V1DXjGH8/YZ0ZXo45wTgr
         DiYzvysUQvieCtGm95frMxDCASyDC9f94403Ccb23BJA/Vyl32x/Xx/JkjM+o/XKKpFv
         8v6UIZ2US7OD+dpSaekt8X9kQqsfBFpZkMWO2BuCpvltPDLVPgcuwt7QeD4EnRqgGeTa
         xJ7l1o/7wAKvPyPhaScyM2ShwwGWj1pXJ5psohNz+yhLHQ2nUk3vHYzrf9SznBMQPpSl
         W5ag==
X-Forwarded-Encrypted: i=1; AJvYcCU5iyJSYB6z7zURAFwI/Owc1Yrl01XdxsECGvYFlbSKXQLfEOizB85VmJr2YZHvDysfGHmK2YLC/txp@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHn8u5PCqRzMK2/3WLia78CLMU2y1E4nvsE8ardum1Nk13MTN
	vryyt+zWdoPsevkden07/59TcdcDXlL3EfzyLCO/1d6HwzLdEIg3dlZ0
X-Gm-Gg: ASbGncv/HxY6Cf5E6UwI+kQQVPTRWytwsuS+p5kAXsxOZHDP2HPcT7AZf22ZPvWJ/pp
	nM3v2EzRtP18BFSv1nUh8ln7t33JUpxcXvkOchUKui10UnF97BUErEOYcnbQ5MRmBkhB9VRoPli
	5ooDcSsiN6KoylDbnsY5h1r8QqS+u0i4RzJDvlwZjlvnpBYUY3bfz94O166fiSMOPgSMdtRVHha
	1sJRe53RR0Kt1LExmN8PGLiSIXrHZIp9jZknKE3czdGzlRZ7jeAEBOV7kv8vMNCRRdGdiLNCXeH
	zVfnsA2r58M9fCxLz2ta4T/yPeRc3TombQXMvMPyWVX0WG7jmKcY3ltqwyH6LkUrB1TIviTwWP5
	g6v+JX+pboY55sS2+7LhhEPCKBFRrp9WYCv0nlq4Kwowf6IB7LQigAvAQwlmVDQj4FOW1VlW0ic
	rfRaYJSwU=
X-Google-Smtp-Source: AGHT+IGbEnhg+iqvnLt2VCyWD8A5caky1VSS2V4/9SPR42mdqdV8DyNJUXIvLsgDMXvYzzIglugRTA==
X-Received: by 2002:a17:90b:5386:b0:32e:9281:7c7b with SMTP id 98e67ed59e1d1-33bcf85da05mr35598257a91.3.1761482379901;
        Sun, 26 Oct 2025 05:39:39 -0700 (PDT)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7d2869sm5119634a91.7.2025.10.26.05.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 05:39:39 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Junjie Cao <caojunjie650@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
Date: Sun, 26 Oct 2025 20:39:23 +0800
Message-ID: <20251026123923.1531727-3-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251026123923.1531727-1-caojunjie650@gmail.com>
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Awinic AW99706 backlight, which can be found in
tablet and notebook backlight, one case is the Lenovo Legion Y700
Gen4. This driver refers to the official datasheets and android
driver, they can be found in [1].

[1] https://www.awinic.com/en/productDetail/AW99706QNR

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 MAINTAINERS                       |   6 +
 drivers/video/backlight/Kconfig   |   8 +
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/aw99706.c | 503 ++++++++++++++++++++++++++++++
 4 files changed, 518 insertions(+)
 create mode 100644 drivers/video/backlight/aw99706.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ea78444f..cef23fcaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4132,6 +4132,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
+AWINIC AW99706 WLED BACKLIGHT DRIVER
+M:	Junjie Cao <caojunjie650@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
+F:	drivers/video/backlight/aw99706.c
+
 AX.25 NETWORK LAYER
 L:	linux-hams@vger.kernel.org
 S:	Orphan
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d9374d208..35c7bfad0 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -156,6 +156,14 @@ config BACKLIGHT_ATMEL_LCDC
 	  If in doubt, it's safe to enable this option; it doesn't kick
 	  in unless the board's description says it's wired that way.
 
+config BACKLIGHT_AW99706
+	tristate "Backlight Driver for Awinic AW99706"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you have a LCD backlight connected to the WLED output of AW99706
+	  WLED output, say Y here to enable this driver.
+
 config BACKLIGHT_EP93XX
 	tristate "Cirrus EP93xx Backlight Driver"
 	depends on FB_EP93XX
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index dfbb169bf..a5d62b018 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= apple_dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
+obj-$(CONFIG_BACKLIGHT_AW99706)		+= aw99706.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
new file mode 100644
index 000000000..8dafdea45
--- /dev/null
+++ b/drivers/video/backlight/aw99706.c
@@ -0,0 +1,503 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * aw99706 - Backlight driver for the AWINIC AW99706
+ *
+ * Copyright (C) 2025 Junjie Cao <caojunjie650@gmail.com>
+ * Copyright (C) 2025 Pengyu Luo <mitltlatltl@gmail.com>
+ *
+ * Based on vendor driver:
+ * Copyright (c) 2023 AWINIC Technology CO., LTD
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define AW99706_MAX_BRT_LVL		4095
+#define AW99706_REG_MAX			0x1F
+#define AW99706_ID			0x07
+
+/* registers list */
+#define AW99706_CFG0_REG			0x00
+#define AW99706_DIM_MODE_MASK			GENMASK(1, 0)
+
+#define AW99706_CFG1_REG			0x01
+#define AW99706_SW_FREQ_MASK			GENMASK(3, 0)
+#define AW99706_SW_ILMT_MASK			GENMASK(5, 4)
+
+#define AW99706_CFG2_REG			0x02
+#define AW99706_ILED_MAX_MASK			GENMASK(6, 0)
+#define AW99706_UVLOSEL_MASK			BIT(7)
+
+#define AW99706_CFG3_REG			0x03
+#define AW99706_CFG4_REG			0x04
+#define AW99706_BRT_MSB_MASK			GENMASK(3, 0)
+
+#define AW99706_CFG5_REG			0x05
+#define AW99706_BRT_LSB_MASK			GENMASK(7, 0)
+
+#define AW99706_CFG6_REG			0x06
+#define AW99706_FADE_TIME_MASK			GENMASK(2, 0)
+#define AW99706_SLOPE_TIME_MASK			GENMASK(5, 3)
+#define AW99706_RAMP_CTL_MASK			GENMASK(7, 6)
+
+#define AW99706_CFG7_REG			0x07
+#define AW99706_BRT_MODE_MASK			GENMASK(1, 0)
+
+#define AW99706_CFG8_REG			0x08
+#define AW99706_ONOFF_TIME_MASK			GENMASK(2, 0)
+
+#define AW99706_CFG9_REG			0x09
+#define AW99706_CFGA_REG			0x0A
+#define AW99706_CFGB_REG			0x0B
+#define AW99706_CFGC_REG			0x0C
+#define AW99706_CFGD_REG			0x0D
+#define AW99706_FLAG_REG			0x10
+#define AW99706_BACKLIGHT_EN_MASK		BIT(7)
+
+#define AW99706_CHIPID_REG			0x11
+#define AW99706_LED_OPEN_FLAG_REG		0x12
+#define AW99706_LED_SHORT_FLAG_REG		0x13
+#define AW99706_MTPLDOSEL_REG			0x1E
+#define AW99706_MTPRUN_REG			0x1F
+
+#define RESV	0
+
+/* Boost switching frequency table, in kHz */
+static const u32 aw99706_sw_freq_tbl[] = {
+	RESV, RESV, RESV, RESV, 300, 400, 500, 600,
+	660, 750, 850, 1000, 1200, 1330, 1500, 1700
+};
+
+/* Switching current limitation table, in mA */
+static const u32 aw99706_sw_ilmt_tbl[] = {
+	1500, 2000, 2500, 3000
+};
+
+/* ULVO threshold table, in mV */
+static const u32 aw99706_ulvo_thres_tbl[] = {
+	2200, 5000
+};
+
+/* Fade In/Out time table, in us */
+static const u32 aw99706_fade_time_tbl[] = {
+	8, 16, 32, 64, 128, 256, 512, 1024
+};
+
+/* Slope time table, in ms */
+static const u32 aw99706_slopetime_tbl[] = {
+	8, 24, 48, 96, 200, 300, 400, 500
+};
+
+/* Turn on/off time table, in ns */
+static const u32 aw99706_onoff_time_tbl[] = {
+	RESV, 250, 500, 1000, 2000, 4000, 8000, 16000
+};
+
+struct aw99706_device {
+	struct i2c_client *client;
+	struct device *dev;
+	struct regmap *regmap;
+	struct backlight_device *bl_dev;
+	struct gpio_desc *hwen_gpio;
+	bool bl_enable;
+};
+
+enum reg_access {
+	REG_NONE_ACCESS	= 0,
+	REG_RD_ACCESS	= 1,
+	REG_WR_ACCESS	= 2,
+};
+
+struct aw99706_reg {
+	u8 defval;
+	u8 access;
+};
+
+const struct aw99706_reg aw99706_regs[AW99706_REG_MAX + 1] = {
+	[AW99706_CFG0_REG]		= {0x65, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG1_REG]		= {0x39, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG2_REG]		= {0x1e, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG3_REG]		= {0x04, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG4_REG]		= {0x00, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG5_REG]		= {0x00, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG6_REG]		= {0xa9, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG7_REG]		= {0x04, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG8_REG]		= {0x0c, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFG9_REG]		= {0x4b, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFGA_REG]		= {0x72, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFGB_REG]		= {0x01, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFGC_REG]		= {0x6c, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_CFGD_REG]		= {0xfe, REG_RD_ACCESS | REG_WR_ACCESS},
+	[AW99706_FLAG_REG]		= {0x00, REG_RD_ACCESS},
+	[AW99706_CHIPID_REG]		= {AW99706_ID, REG_RD_ACCESS},
+	[AW99706_LED_OPEN_FLAG_REG]	= {0x00, REG_RD_ACCESS},
+	[AW99706_LED_SHORT_FLAG_REG]	= {0x00, REG_RD_ACCESS},
+
+	/*
+	 * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will unlock
+	 * Multi-time Programmable (MTP).
+	 */
+	[AW99706_MTPLDOSEL_REG]		= {0x00, REG_RD_ACCESS},
+	[AW99706_MTPRUN_REG]		= {0x00, REG_NONE_ACCESS},
+};
+
+static bool aw99706_readable_reg(struct device *dev, unsigned int reg)
+{
+	return aw99706_regs[reg].access & REG_RD_ACCESS;
+}
+
+static bool aw99706_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return aw99706_regs[reg].access & REG_WR_ACCESS;
+}
+
+static inline int aw99706_i2c_read(struct aw99706_device *aw, u8 reg,
+				   unsigned int *val)
+{
+	return regmap_read(aw->regmap, reg, val);
+}
+
+static inline int aw99706_i2c_write(struct aw99706_device *aw, u8 reg, u8 val)
+{
+	return regmap_write(aw->regmap, reg, val);
+}
+
+static inline int aw99706_i2c_update_bits(struct aw99706_device *aw, u8 reg,
+					  u8 mask, u8 val)
+{
+	return regmap_update_bits(aw->regmap, reg, mask, val);
+}
+
+struct aw99706_dt_prop {
+	const char * const name;
+	const u32 * const lookup_tbl;
+	u8 tbl_size;
+	u8 reg;
+	u8 mask;
+	u8 val;
+	u32 raw_val;
+};
+
+static struct aw99706_dt_prop aw99706_dt_props[] = {
+	{
+		"awinic,dim-mode", NULL,
+		0,
+		AW99706_CFG0_REG, AW99706_DIM_MODE_MASK
+	},
+	{
+		"awinic,sw-freq", aw99706_sw_freq_tbl,
+		ARRAY_SIZE(aw99706_sw_freq_tbl),
+		AW99706_CFG1_REG, AW99706_SW_FREQ_MASK
+	},
+	{
+		"awinic,sw-ilmt", aw99706_sw_ilmt_tbl,
+		ARRAY_SIZE(aw99706_sw_ilmt_tbl),
+		AW99706_CFG1_REG, AW99706_SW_ILMT_MASK
+	},
+	{
+		"awinic,iled-max", NULL,
+		0,
+		AW99706_CFG2_REG, AW99706_ILED_MAX_MASK
+
+	},
+	{
+		"awinic,uvlo-thres", aw99706_ulvo_thres_tbl,
+		ARRAY_SIZE(aw99706_ulvo_thres_tbl),
+		AW99706_CFG2_REG, AW99706_UVLOSEL_MASK
+	},
+	{
+		"awinic,fade-time", aw99706_fade_time_tbl,
+		ARRAY_SIZE(aw99706_fade_time_tbl),
+		AW99706_CFG6_REG, AW99706_FADE_TIME_MASK
+	},
+	{
+		"awinic,slope-time", aw99706_slopetime_tbl,
+		ARRAY_SIZE(aw99706_slopetime_tbl),
+		AW99706_CFG6_REG, AW99706_SLOPE_TIME_MASK
+	},
+	{
+		"awinic,ramp-ctl", NULL,
+		0,
+		AW99706_CFG6_REG, AW99706_RAMP_CTL_MASK
+	},
+	{
+		"awinic,brt-mode", NULL,
+		0,
+		AW99706_CFG7_REG, AW99706_BRT_MODE_MASK
+	},
+	{
+		"awinic,onoff-time", aw99706_onoff_time_tbl,
+		ARRAY_SIZE(aw99706_onoff_time_tbl),
+		AW99706_CFG8_REG, AW99706_ONOFF_TIME_MASK
+	},
+};
+
+static int aw99706_lookup(const u32 * const tbl, int size, u32 val)
+{
+	int i;
+
+	for (i = 0; i < size; i++)
+		if (tbl[i] == val)
+			return i;
+
+	return -1;
+}
+
+static inline void aw99706_prop_set_default(struct aw99706_dt_prop *prop)
+{
+	prop->val = prop->mask & aw99706_regs[prop->reg].defval;
+}
+
+static void aw99706_dt_property_convert(struct aw99706_dt_prop *prop)
+{
+	unsigned int val, shift;
+
+	if (prop->lookup_tbl) {
+		val = aw99706_lookup(prop->lookup_tbl, prop->tbl_size,
+				     prop->raw_val);
+		if (val < 0) {
+			aw99706_prop_set_default(prop);
+			return;
+		}
+
+	} else {
+		val = prop->raw_val;
+	}
+
+	shift = ffs(prop->mask) - 1;
+	val <<= shift;
+	prop->val = prop->mask & val;
+}
+
+static void aw99706_dt_parse(struct aw99706_device *aw)
+{
+	struct aw99706_dt_prop *prop;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
+		prop = &aw99706_dt_props[i];
+		ret = device_property_read_u32(aw->dev, prop->name,
+					       &prop->raw_val);
+		if (ret < 0) {
+			dev_warn(aw->dev, "Missing property %s: %d\n",
+				 prop->name, ret);
+
+			aw99706_prop_set_default(prop);
+		} else {
+			aw99706_dt_property_convert(prop);
+		}
+	}
+
+	/* This property requires a long linear array, using formula for now */
+	aw99706_dt_props[3].val = (aw99706_dt_props[3].raw_val - 5000) / 500;
+}
+
+static int aw99706_hw_init(struct aw99706_device *aw)
+{
+	int ret, i;
+
+	gpiod_set_value_cansleep(aw->hwen_gpio, 1);
+
+	for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
+		ret = aw99706_i2c_update_bits(aw, aw99706_dt_props[i].reg,
+					      aw99706_dt_props[i].mask,
+					      aw99706_dt_props[i].val);
+		if (ret < 0) {
+			dev_err(aw->dev, "Failed to write init data %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int aw99706_bl_enable(struct aw99706_device *aw, bool en)
+{
+	int ret;
+	u8 val;
+
+	FIELD_MODIFY(AW99706_BACKLIGHT_EN_MASK, &val, en);
+	ret = aw99706_i2c_update_bits(aw, AW99706_CFGD_REG,
+				      AW99706_BACKLIGHT_EN_MASK, val);
+	if (ret)
+		dev_err(aw->dev, "Failed to enable backlight!\n");
+
+	return ret;
+}
+
+static int aw99706_backlight_switch(struct aw99706_device *aw, u32 brt_lvl)
+{
+	bool bl_enable_now = !!brt_lvl;
+	int ret = 0;
+
+	if (aw->bl_enable != bl_enable_now) {
+		aw->bl_enable = bl_enable_now;
+		ret = aw99706_bl_enable(aw, bl_enable_now);
+	}
+
+	return ret;
+}
+
+static int aw99706_update_brightness(struct aw99706_device *aw, u32 brt_lvl)
+{
+	int ret;
+
+	ret = aw99706_i2c_write(aw, AW99706_CFG4_REG,
+				(brt_lvl >> 8) & AW99706_BRT_MSB_MASK);
+	if (ret < 0)
+		return ret;
+
+	ret = aw99706_i2c_write(aw, AW99706_CFG5_REG,
+				brt_lvl & AW99706_BRT_LSB_MASK);
+	if (ret < 0)
+		return ret;
+
+	return aw99706_backlight_switch(aw, brt_lvl);
+}
+
+static int aw99706_bl_update_status(struct backlight_device *bl)
+{
+	struct aw99706_device *aw = bl_get_data(bl);
+
+	return aw99706_update_brightness(aw, bl->props.brightness);
+}
+
+static const struct backlight_ops aw99706_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = aw99706_bl_update_status,
+};
+
+static const struct regmap_config aw99706_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AW99706_REG_MAX,
+	.writeable_reg = aw99706_writeable_reg,
+	.readable_reg = aw99706_readable_reg,
+};
+
+static int aw99706_chip_id_read(struct aw99706_device *aw)
+{
+	int ret;
+	unsigned int val;
+
+	ret = aw99706_i2c_read(aw, AW99706_CHIPID_REG, &val);
+	if (ret < 0)
+		return ret;
+
+	return val;
+}
+
+static int aw99706_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct aw99706_device *aw;
+	struct backlight_device *bl_dev;
+	struct backlight_properties props = {};
+	int ret = 0;
+
+	aw = devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
+	if (!aw)
+		return -ENOMEM;
+
+	aw->client = client;
+	aw->dev = dev;
+	i2c_set_clientdata(client, aw);
+
+	aw->regmap = devm_regmap_init_i2c(client, &aw99706_regmap_config);
+	if (IS_ERR(aw->regmap))
+		return dev_err_probe(dev, PTR_ERR(aw->regmap),
+				     "Failed to init regmap\n");
+
+	ret = aw99706_chip_id_read(aw);
+	if (ret != AW99706_ID)
+		return dev_err_probe(dev, ret,
+				     "Failed to validate chip id\n");
+
+	aw99706_dt_parse(aw);
+
+	aw->hwen_gpio = devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(aw->hwen_gpio))
+		return dev_err_probe(dev, PTR_ERR(aw->hwen_gpio),
+				     "Failed to get enable gpio\n");
+
+	ret = aw99706_hw_init(aw);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize the chip\n");
+
+	props.type = BACKLIGHT_RAW;
+	props.brightness = AW99706_MAX_BRT_LVL >> 1;
+	props.max_brightness = AW99706_MAX_BRT_LVL;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+
+	bl_dev = devm_backlight_device_register(dev, "aw99706-backlight", dev,
+						aw, &aw99706_bl_ops, &props);
+	if (IS_ERR(bl_dev))
+		return dev_err_probe(dev, PTR_ERR(bl_dev),
+				     "Failed to register backlight!\n");
+
+	aw->bl_dev = bl_dev;
+
+	return 0;
+}
+
+static void aw99706_remove(struct i2c_client *client)
+{
+	struct aw99706_device *aw = i2c_get_clientdata(client);
+
+	aw99706_update_brightness(aw, 0);
+
+	msleep(50);
+
+	gpiod_set_value_cansleep(aw->hwen_gpio, 0);
+}
+
+static int aw99706_suspend(struct device *dev)
+{
+	struct aw99706_device *aw = dev_get_drvdata(dev);
+
+	return aw99706_update_brightness(aw, 0);
+}
+
+static int aw99706_resume(struct device *dev)
+{
+	struct aw99706_device *aw = dev_get_drvdata(dev);
+
+	return aw99706_hw_init(aw);
+}
+
+static SIMPLE_DEV_PM_OPS(aw99706_pm_ops, aw99706_suspend, aw99706_resume);
+
+static const struct i2c_device_id aw99706_ids[] = {
+	{ "aw99706" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, aw99706_ids);
+
+static const struct of_device_id aw99706_match_table[] = {
+	{ .compatible = "awinic,aw99706", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aw99706_match_table);
+
+static struct i2c_driver aw99706_i2c_driver = {
+	.probe = aw99706_probe,
+	.remove = aw99706_remove,
+	.id_table = aw99706_ids,
+	.driver = {
+		.name = "aw99706",
+		.of_match_table = aw99706_match_table,
+		.pm = &aw99706_pm_ops,
+	},
+};
+
+module_i2c_driver(aw99706_i2c_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("BackLight driver for aw99706");
-- 
2.51.1.dirty


