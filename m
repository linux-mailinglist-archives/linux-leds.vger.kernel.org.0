Return-Path: <linux-leds+bounces-6047-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F2CC43808
	for <lists+linux-leds@lfdr.de>; Sun, 09 Nov 2025 04:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859EA3B3484
	for <lists+linux-leds@lfdr.de>; Sun,  9 Nov 2025 03:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0FF2036E9;
	Sun,  9 Nov 2025 03:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNFlf1L/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E8E1FECD4
	for <linux-leds@vger.kernel.org>; Sun,  9 Nov 2025 03:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762658593; cv=none; b=fCG8t4tUWQBkE5LR+897AjI3DcRA9PcPFTqcqKwqKW3QgaMDmG2NfRnPOe/+87dPUbygXIcCRw93KiUJqFBPI5PsnEOjIWLv9Wf7EvEmazRsW5rhj02IXzkwpcXVa9hLP/4itbQcbeNiPR0MsePfti0LWEtiij32zwhUe+PMcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762658593; c=relaxed/simple;
	bh=YVLqfum1BAAKlGsSRZIjDSmyHOyPK1PdyQSPWYYd/fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=owkEfmTvu/bGOj0UrDj1ndrEC4/5aox3JKtjdXiHqg18S39qWwOkicCs4wJX9Jmtr1li6ng9sAe7bbR6THOrFwdmE8giGyickygcHyCCBJKngepFzZEbbcCqmhknWe25H3A7Xih22+1dT+ly5tmhxKkp0WciSKE+AQ8PpOC46K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNFlf1L/; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-29568d93e87so16615795ad.2
        for <linux-leds@vger.kernel.org>; Sat, 08 Nov 2025 19:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762658590; x=1763263390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8Lxev0djixy9MiMQMuaiErplBM2LofZg7oyG1h4PDM=;
        b=ZNFlf1L/RJQR+u+xDYzkkwC0sdfxComAb7J4XXnBtv1U7smL9sNrsBjrNVc4jBCK69
         ISTVvVvdhbvFpUvkjNChAs99YN9JXdhNphIUSxj1ReUI5JlJNoHBepV5+dJgjiS4/uUP
         OI58vOUpcrcvL+SwnQsty/+1NOCZ+sVvzqbuU9svRRZtbHRxTO6Pwy1s+2hTXAzVeav3
         kSRyz3ixaKrYcM9mcdALQzOTW96cV8gjc/8L7dWbBtuuawHlRiVU9iA4L1uYB8x9oAV2
         GotzEzxsPx8aU1dzjju/ZjvlbB+NxH+FwLxwPm9ZUtRbYsbxCWIc7as5MXlS0+4I91u2
         H6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762658590; x=1763263390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L8Lxev0djixy9MiMQMuaiErplBM2LofZg7oyG1h4PDM=;
        b=SujPmM4brI/A1Py9Ggu4xEuzjqe6SDjDMKG0/U+IVO8jSVEV84eTSTLhrO+dSMe20O
         rsV/FZXgiOwKxJVdL92hQJEcHNI7WhXY3BZvIpgM/W3IxF/Bq2XzTLEtdGf9tW2WuF/1
         mDCmS8UlHT/49MA2w2BWjYwQO/6u8qEGCgZi3dQf4VCtJt9DYdRf81VqjkBLLxKO0NYV
         mV/1E2KkVPBbMKpnZUL3bd6PW0tk0xzAY1MPWR6JBRUBeJH4XxYGXOaz9+oAL84lsFsD
         /oIu333tWmGUI1okbmMLPtlsuhCIWiSfqHLOdDDI0wkrM3PV7oqcf60hsG5TZ72Fxexu
         ZrRg==
X-Forwarded-Encrypted: i=1; AJvYcCUmkW/S9fhRBMvtICQBm91dRUbvRSu4rXxEDzWtXZ6IqRQB3cLSicqUvAOdeGIbFa8JB5viAk+xigAm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6vEbtS73D0en2xbzgTHoOpt05z6WHHkekIuwVRP5KzSbabdk
	EWeTk2U4GIF6HL+4IEOln+m64oo/BSCewmv0fZzrvWugUhqfHINLCT1V
X-Gm-Gg: ASbGncthl6GPTwk/76LlE0CzjiQUUpDysXXoiDEPddSXRVXXEhkNqdQBAO3YynuSPzi
	uabV8JJvzR9k0Ncs9SLgwoOJaGXXU560H6CmjuGfqUY9FxIDmbRXl6VqL4H2PuiOsL4wpt+coe6
	9DyMkA5UVaD+DvMRty8yAprOsfu5OC8k7ajBEmqZNjpPBKvIswMOhGtizlxmRfmmLHuLMbOvVvA
	mR6jHjBZbfYN98bX3LtrTM+iLz2AdkUk22ldukIgSdGEq/iqoaVoEvbWRRwFj0JsbD2Z3DoREgd
	1euNm46Ey6lkLpNfxI30WwRtEvrZIPxkM0e7V7M9Z21HQW0e8CV1/cON7eJNg498jfmXhu0nlHY
	PmuavZte6TC64LtMDX6xbW06mjCSg4mSv19Cro+kbDwj04+OjeS4RwhrfF6Hn0L/e0Ca/EIMoXG
	RfjmLGtyiEaDVCiT6FXw==
X-Google-Smtp-Source: AGHT+IHWyxEth7lvLIjHWsWLpxJukt5TrFTFGxSDRl3q2aJOImJwMSGsB7mtDtH/MmgVzF1+nMDHJg==
X-Received: by 2002:a17:902:e5cb:b0:296:3f23:b93b with SMTP id d9443c01a7336-297e5403a5bmr62045855ad.2.1762658590115;
        Sat, 08 Nov 2025 19:23:10 -0800 (PST)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509682casm101941215ad.22.2025.11.08.19.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 19:23:09 -0800 (PST)
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
Subject: [PATCH v3 2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
Date: Sun,  9 Nov 2025 11:22:40 +0800
Message-ID: <20251109032240.3422503-3-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251109032240.3422503-1-caojunjie650@gmail.com>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
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

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
Tested-by: Pengyu Luo <mitltlatltl@gmail.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v3:
- remove the shift field (Daniel)
- use FIELD_PREP() to replace FIELD_MODIFY() (Daniel)
- include init table into aw99706_device (Daniel)
- make aw99706_regs static (Krzysztof)
- return -ENODEV if it is a unknown chip id (Krzysztof)
- use __ffs() to handle shift, since mask is not compiletime in for loop
- reorder functions and structs
- Link to v2: https://lore.kernel.org/linux-leds/20251103110648.878325-3-caojunjie650@gmail.com

Changes in v2:
- add handler for max-brightness and default-brightness
- use proper units for properties (Krzysztof)
- drop non-fixed properties (Krzysztof)
- include default values in the aw99706_dt_props table (Daniel)
- warn when a property value from DT is invalid (Daniel)
- drop warning when optional properties are missing (Daniel)
- add a function pointer into the aw99706_dt_props table to handle lookup (Daniel)
- use a lookup function instead of hardcoding the formula for the iLED max (Daniel)
- move BL enalbe handler into aw99706_update_brightness (Daniel)
- Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-3-caojunjie650@gmail.com

 MAINTAINERS                       |   6 +
 drivers/video/backlight/Kconfig   |   8 +
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/aw99706.c | 471 ++++++++++++++++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 drivers/video/backlight/aw99706.c

diff --git a/MAINTAINERS b/MAINTAINERS
index be21f1fa8..551d8328e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4140,6 +4140,12 @@ S:	Maintained
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
index 000000000..b7c1d24b1
--- /dev/null
+++ b/drivers/video/backlight/aw99706.c
@@ -0,0 +1,471 @@
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
+#define AW99706_RAMP_CTL_MASK			GENMASK(7, 6)
+
+#define AW99706_CFG7_REG			0x07
+#define AW99706_CFG8_REG			0x08
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
+/* Boost switching frequency table, in Hz */
+static const u32 aw99706_sw_freq_tbl[] = {
+	RESV, RESV, RESV, RESV, 300000, 400000, 500000, 600000,
+	660000, 750000, 850000, 1000000, 1200000, 1330000, 1500000, 1700000
+};
+
+/* Switching current limitation table, in uA */
+static const u32 aw99706_sw_ilmt_tbl[] = {
+	1500000, 2000000, 2500000, 3000000
+};
+
+/* ULVO threshold table, in uV */
+static const u32 aw99706_ulvo_thres_tbl[] = {
+	2200000, 5000000
+};
+
+struct aw99706_dt_prop {
+	const char * const name;
+	int (*lookup)(const struct aw99706_dt_prop *prop, u32 dt_val, u8 *val);
+	const u32 * const lookup_tbl;
+	u8 tbl_size;
+	u8 reg;
+	u8 mask;
+	u32 def_val;
+};
+
+static int aw99706_dt_property_lookup(const struct aw99706_dt_prop *prop,
+				      u32 dt_val, u8 *val)
+{
+	int i;
+
+	if (!prop->lookup_tbl) {
+		*val = dt_val;
+		return 0;
+	}
+
+	for (i = 0; i < prop->tbl_size; i++)
+		if (prop->lookup_tbl[i] == dt_val)
+			break;
+
+	*val = i;
+
+	return i == prop->tbl_size ? -1 : 0;
+}
+
+#define MIN_ILED_MAX	5000
+#define MAX_ILED_MAX	50000
+#define STEP_ILED_MAX	500
+
+static int
+aw99706_dt_property_iled_max_convert(const struct aw99706_dt_prop *prop,
+				     u32 dt_val, u8 *val)
+{
+	if (dt_val > MAX_ILED_MAX || dt_val < MIN_ILED_MAX)
+		return -1;
+
+	*val = (dt_val - MIN_ILED_MAX) / STEP_ILED_MAX;
+
+	return (dt_val - MIN_ILED_MAX) % STEP_ILED_MAX;
+}
+
+static const struct aw99706_dt_prop aw99706_dt_props[] = {
+	{
+		"awinic,dim-mode", aw99706_dt_property_lookup,
+		NULL, 0,
+		AW99706_CFG0_REG, AW99706_DIM_MODE_MASK, 1,
+	},
+	{
+		"awinic,sw-freq", aw99706_dt_property_lookup,
+		aw99706_sw_freq_tbl, ARRAY_SIZE(aw99706_sw_freq_tbl),
+		AW99706_CFG1_REG, AW99706_SW_FREQ_MASK, 750000,
+	},
+	{
+		"awinic,sw-ilmt", aw99706_dt_property_lookup,
+		aw99706_sw_ilmt_tbl, ARRAY_SIZE(aw99706_sw_ilmt_tbl),
+		AW99706_CFG1_REG, AW99706_SW_ILMT_MASK, 3000000,
+	},
+	{
+		"awinic,iled-max", aw99706_dt_property_iled_max_convert,
+		NULL, 0,
+		AW99706_CFG2_REG, AW99706_ILED_MAX_MASK, 20000,
+
+	},
+	{
+		"awinic,uvlo-thres", aw99706_dt_property_lookup,
+		aw99706_ulvo_thres_tbl, ARRAY_SIZE(aw99706_ulvo_thres_tbl),
+		AW99706_CFG2_REG, AW99706_UVLOSEL_MASK, 2200000,
+	},
+	{
+		"awinic,ramp-ctl", aw99706_dt_property_lookup,
+		NULL, 0,
+		AW99706_CFG6_REG, AW99706_RAMP_CTL_MASK, 2,
+	}
+};
+
+struct reg_init_data {
+	u8 reg;
+	u8 mask;
+	u8 val;
+};
+
+struct aw99706_device {
+	struct i2c_client *client;
+	struct device *dev;
+	struct regmap *regmap;
+	struct backlight_device *bl_dev;
+	struct gpio_desc *hwen_gpio;
+	struct reg_init_data init_tbl[ARRAY_SIZE(aw99706_dt_props)];
+	bool bl_enable;
+};
+
+enum reg_access {
+	REG_NONE_ACCESS	= 0,
+	REG_RD_ACCESS	= 1,
+	REG_WR_ACCESS	= 2,
+};
+
+static const u8 aw99706_regs[AW99706_REG_MAX + 1] = {
+	[AW99706_CFG0_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG1_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG2_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG3_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG4_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG5_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG6_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG7_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG8_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFG9_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFGA_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFGB_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFGC_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_CFGD_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
+	[AW99706_FLAG_REG]		= REG_RD_ACCESS,
+	[AW99706_CHIPID_REG]		= REG_RD_ACCESS,
+	[AW99706_LED_OPEN_FLAG_REG]	= REG_RD_ACCESS,
+	[AW99706_LED_SHORT_FLAG_REG]	= REG_RD_ACCESS,
+
+	/*
+	 * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will unlock
+	 * Multi-time Programmable (MTP).
+	 */
+	[AW99706_MTPLDOSEL_REG]		= REG_RD_ACCESS,
+	[AW99706_MTPRUN_REG]		= REG_NONE_ACCESS,
+};
+
+static bool aw99706_readable_reg(struct device *dev, unsigned int reg)
+{
+	return aw99706_regs[reg] & REG_RD_ACCESS;
+}
+
+static bool aw99706_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return aw99706_regs[reg] & REG_WR_ACCESS;
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
+static void aw99706_dt_parse(struct aw99706_device *aw,
+			     struct backlight_properties *bl_props)
+{
+	const struct aw99706_dt_prop *prop;
+	u32 dt_val;
+	int ret, i;
+	u8 val;
+
+	for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
+		prop = &aw99706_dt_props[i];
+		ret = device_property_read_u32(aw->dev, prop->name, &dt_val);
+		if (ret < 0)
+			dt_val = prop->def_val;
+
+		if (prop->lookup(prop, dt_val, &val)) {
+			dev_warn(aw->dev, "invalid value %d for property %s, using default value %d\n",
+				 dt_val, prop->name, prop->def_val);
+
+			prop->lookup(prop, prop->def_val, &val);
+		}
+
+		aw->init_tbl[i].reg = prop->reg;
+		aw->init_tbl[i].mask = prop->mask;
+		aw->init_tbl[i].val = val << __ffs(prop->mask);
+	}
+
+	bl_props->brightness = AW99706_MAX_BRT_LVL >> 1;
+	bl_props->max_brightness = AW99706_MAX_BRT_LVL;
+	device_property_read_u32(aw->dev, "default-brightness",
+				 &bl_props->brightness);
+	device_property_read_u32(aw->dev, "max-brightness",
+				 &bl_props->max_brightness);
+
+	if (bl_props->max_brightness > AW99706_MAX_BRT_LVL)
+		bl_props->max_brightness = AW99706_MAX_BRT_LVL;
+
+	if (bl_props->brightness > bl_props->max_brightness)
+		bl_props->brightness = bl_props->max_brightness;
+}
+
+static int aw99706_hw_init(struct aw99706_device *aw)
+{
+	int ret, i;
+
+	gpiod_set_value_cansleep(aw->hwen_gpio, 1);
+
+	for (i = 0; i < ARRAY_SIZE(aw->init_tbl); i++) {
+		ret = aw99706_i2c_update_bits(aw, aw->init_tbl[i].reg,
+					      aw->init_tbl[i].mask,
+					      aw->init_tbl[i].val);
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
+	val = FIELD_PREP(AW99706_BACKLIGHT_EN_MASK, en);
+	ret = aw99706_i2c_update_bits(aw, AW99706_CFGD_REG,
+				      AW99706_BACKLIGHT_EN_MASK, val);
+	if (ret)
+		dev_err(aw->dev, "Failed to enable backlight!\n");
+
+	return ret;
+}
+
+static int aw99706_update_brightness(struct aw99706_device *aw, u32 brt_lvl)
+{
+	bool bl_enable_now = !!brt_lvl;
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
+	if (aw->bl_enable != bl_enable_now) {
+		ret = aw99706_bl_enable(aw, bl_enable_now);
+		if (!ret)
+			aw->bl_enable = bl_enable_now;
+	}
+
+	return ret;
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
+		return dev_err_probe(dev, -ENODEV,
+				     "Unknown chip id 0x%02x\n", ret);
+
+	aw99706_dt_parse(aw, &props);
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


