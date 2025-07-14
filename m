Return-Path: <linux-leds+bounces-5061-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F31B0466C
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 19:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35250189D9BC
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 17:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABD7265CB0;
	Mon, 14 Jul 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBrmteC9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C4F1DDC2B;
	Mon, 14 Jul 2025 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513868; cv=none; b=LapUJHH5REqW2ktFRnrY5ikEpZy0h94YPAxhVfiEOkp9FHvKclUIT8rXGev8HNQYWrpxx1FNkN8gUmJXox2GJPobLHIb7CNuYZL8Pt0zNGOxZsJQOmPLDWXBSeoi7tAWCZeV+8vst5CUvmcn+cMNjjBpghG/VKr1o4joftrJS5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513868; c=relaxed/simple;
	bh=EAsia60doYGd6pUHYPfsRSls6lWsXe2vv01T+sLet14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GAHMZygdQ3o56RuPu5bz8X6QyQn38Zuh7R5KNFGctyVR73Ct6UdRdRHSR6kq2+ro64TVjB2NmYg1WQY4Dg3oCGoRZdtmlTMC5aGuQW5FVI00J/fKpsYpCilDqhBq9snnEqHDuJRR/HpaHejFpKJLlB5oWx85xuBfhEjYCxxSjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBrmteC9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4984438b3a.0;
        Mon, 14 Jul 2025 10:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752513865; x=1753118665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITOc/vzbdxcYHfA7O2lNOHZFNQIUdnZgxToDafgif/4=;
        b=iBrmteC9WXuTL7QSAbxzX3C0BAOvCVZPKsl7jVa0EtTE8A0mzPA95CH2HEj3h8SQnP
         q47hruRnwqxlfs9HrFYiic0ei7Nup2nZvV9hwJBH4sfjrwOaNhXPMNRfgk6kWrqkiXUg
         L01kyVhGDbq463fuTYQcTpvvOxOp+hsCqCy87UcHL193oeYXFg2k/pvNdCddzbVFz2SH
         DkD+O6lkiW0yJxTieHfYr2emEOoWRtoE7Ejwd6ZoQFVHrWQGTTVR1XRK1P6W6KuR5v0c
         zRn4+IZM6iprICdMlXS/hhZ02XpZkks6micOiN4hGd5LJU5BQpKAFWnLDHNie+ilgmjX
         ADnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513865; x=1753118665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITOc/vzbdxcYHfA7O2lNOHZFNQIUdnZgxToDafgif/4=;
        b=ENr9dQkxe55awEZe0Ic95k+ifuAl3RXAeeuYolqvpsuS2UKBuvXF0uXu+dsZFzanDn
         1OdshEoesZGDKefG4uVj7UsR/9JIhCyqWuOGLZNM43G3foWgOgQ6Ueusp8YoqVJM/RRz
         FkzpSAilFsieMZUXwV+v44ZD7+7Wtek+UNOzpFGjCFBzIlK/tjsYmLaVUXVqwXcQSDtT
         xRhmRcVzSHv2TR0JHbGRy9PEDeG4qV9wlv2hqOEr1+TW5aJARrxxVdKNSB+S0hgfB3ls
         m+188OCpZBUqHiTvHVMblmmhBzbNwMWgDjr+qW3Btd6jQ8wFxNLietcGRA0Fk8Ns1jwX
         WnMw==
X-Forwarded-Encrypted: i=1; AJvYcCUX/PiIjZy33QS+oOQqVvHWucOf/dMzAyVYy7hyQDl6ca+ENz+CpjtS1BILq0xvngB3JzYWi3WlTrFi@vger.kernel.org, AJvYcCUkHIlOujFbWszKJVDNvKr8CKjTJthdGoLJnxxKK0ygRbjbP4GlHQSxBt/1L0jb4Mzn/xOridIe+91v@vger.kernel.org, AJvYcCWiDID7pJwrjdcS0dt6+XtPP7M5gZ2E2fmOi9a5znWy9i2yk2auJcE/ovuusQJQe2u/GEZ9ddkFqgJemfcB@vger.kernel.org, AJvYcCXak3HZ88nJAAJs+B3l6XycJCaL1qHoXzpgCpM/3/KOOLItHbT0sqfiV3ur4WfpMCbZnzcGX0M1j/qA7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+o1VxtigcjN1+r8quzM4djtdIpcf9Iym5U6t9HTNa/PDk2iY
	R28lUBNlEylEE8M8WBvTuW2yCbZbdgTdheT0diRDBWqPfDbSMP2IFlOh
X-Gm-Gg: ASbGncszZiUMRxtyPOa8CWpy08nopgiNBbkYt7a6lAh6IN3LtE6JzkPKll1zIvf+iyN
	2YmIupWpMA7ceiQt8WEiqBtcdkoX9i5u7UaMnPXlsg258/tURrCbirXDTD/Rg4Ird99GdzdM8Fk
	nhaUPyBah9Pnbq1J0RXUqccU98QVi2vNUiW1mmvLVKvIsyUqdRIY87xrqP/IJfC5BMBENDJ4dJz
	SjkRwqYH+YUkXV9/gAA1mLwAE74/3I+KA3b+K7+tgq1CGQVZv9R/yuam+jR//bH6FsBACY2nyeb
	TdXjtf0vfe6ELpRMzOFR+BHc8BAs9lwkPkXLwK2oYTPcQJNsqvEfS3TXy9KArqXDBhvBP7aEBXH
	MCf1xs0Za8AM+ZiZHtWBskRjVjebMbbH3u7MoYop1TMbp
X-Google-Smtp-Source: AGHT+IGjhm4UoT9sIRuMi6LJ3PckciFbedF155akQbB9Je1WUsPeFnWRyQM277JxKA2gk+2CA6BZEw==
X-Received: by 2002:a05:6a20:6a07:b0:233:f0c6:a89e with SMTP id adf61e73a8af0-233f0c6ab12mr11603467637.33.1752513864998;
        Mon, 14 Jul 2025 10:24:24 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.114.162.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06537sm10495468b3a.43.2025.07.14.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:24:24 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v11 2/4] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Tue, 15 Jul 2025 00:23:53 +0700
Message-Id: <20250714172355.84609-3-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714172355.84609-1-trannamatk@gmail.com>
References: <20250714172355.84609-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP5812 is a 4x3 matrix RGB LED driver with an autonomous animation
engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
4 RGB LEDs. Each LED can be configured through the related registers
to realize vivid and fancy lighting effects.

This patch adds minimal driver support for the LP5812, implementing
only the essential functionality: I2C communication with the device,
LED registration, brightness control in manual mode, and basic sysfs
interfaces for LED configuration and fault monitoring.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 MAINTAINERS                    |    4 +
 drivers/leds/rgb/Kconfig       |   13 +
 drivers/leds/rgb/Makefile      |    1 +
 drivers/leds/rgb/leds-lp5812.c | 1147 ++++++++++++++++++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h |  164 +++++
 5 files changed, 1329 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 83a779dc9bcd..b4eb3265c800 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24566,6 +24566,10 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	drivers/leds/rgb/Kconfig
+F:	drivers/leds/rgb/Makefile
+F:	drivers/leds/rgb/leds-lp5812.c
+F:	drivers/leds/rgb/leds-lp5812.h
 
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 222d943d826a..28ef4c487367 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -26,6 +26,19 @@ config LEDS_KTD202X
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-ktd202x.
 
+config LEDS_LP5812
+	tristate "LED support for Texas Instruments LP5812"
+	depends on I2C
+	help
+	  If you say Y here you get support for TI LP5812 LED driver.
+	  The LP5812 is a 4x3 matrix RGB LED driver with autonomous
+	  animation engine control.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-lp5812.
+
+	  If unsure, say N.
+
 config LEDS_NCP5623
 	tristate "LED support for NCP5623"
 	depends on I2C
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index a501fd27f179..be45991f63f5 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_LEDS_GROUP_MULTICOLOR)	+= leds-group-multicolor.o
 obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
+obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
 obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
diff --git a/drivers/leds/rgb/leds-lp5812.c b/drivers/leds/rgb/leds-lp5812.c
new file mode 100644
index 000000000000..278c0a09e7c4
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5812.c
@@ -0,0 +1,1147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LP5812 LED driver
+ *
+ * Copyright (C) 2025 Texas Instruments
+ *
+ * Author: Jared Zhou <jared-zhou@ti.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include "leds-lp5812.h"
+
+#define LP5812_SC_LED "SC_LED"
+#define LP5812_MC_LED "MC_LED"
+
+static int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
+{
+	struct device *dev = &chip->client->dev;
+	struct i2c_msg msg;
+	u8 buf[2];
+	u8 extracted_bits;
+	int ret;
+
+	/* Extract register address bits 9 and 8 for Address Byte 1 */
+	extracted_bits = (reg >> 8) & 0x03;
+
+	/* Prepare payload: Address Byte 2 (bits [7:0]) and value to write */
+	buf[0] = (u8)(reg & 0xFF);
+	buf[1] = val;
+
+	/* Construct I2C message for a write operation */
+	msg.addr = (chip->client->addr << 2) | extracted_bits;
+	msg.flags = 0;
+	msg.len = sizeof(buf);
+	msg.buf = buf;
+
+	ret = i2c_transfer(chip->client->adapter, &msg, 1);
+	if (ret != 1) {
+		dev_err(dev, "I2C write error, ret=%d\n", ret);
+		ret = ret < 0 ? ret : -EIO;
+	} else {
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static int lp5812_read(struct lp5812_chip *chip, u16 reg, u8 *val)
+{
+	struct device *dev = &chip->client->dev;
+	struct i2c_msg msgs[2];
+	u8 ret_val;
+	u8 extracted_bits;
+	u8 converted_reg;
+	int ret;
+
+	/* Extract register address bits 9 and 8 for Address Byte 1 */
+	extracted_bits = (reg >> 8) & 0x03;
+
+	/* Lower 8 bits go in Address Byte 2 */
+	converted_reg = (u8)(reg & 0xFF);
+
+	/* Prepare I2C write message to set register address */
+	msgs[0].addr = (chip->client->addr << 2) | extracted_bits;
+	msgs[0].flags = 0;
+	msgs[0].len = 1;
+	msgs[0].buf = &converted_reg;
+
+	/* Prepare I2C read message to retrieve register value */
+	msgs[1].addr = (chip->client->addr << 2) | extracted_bits;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = 1;
+	msgs[1].buf = &ret_val;
+
+	ret = i2c_transfer(chip->client->adapter, msgs, 2);
+	if (ret != 2) {
+		dev_err(dev, "I2C read error, ret=%d\n", ret);
+		*val = 0;
+		ret = ret < 0 ? ret : -EIO;
+	} else {
+		/* Store the value retrieved from the hardware */
+		*val = ret_val;
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static int lp5812_parse_led_channel(struct device_node *np,
+				    struct lp5812_led_config *cfg,
+				    int led_index, int color_number)
+{
+	int color_id = 0, reg, ret;
+
+	ret = of_property_read_u32(np, "reg", &reg);
+	if (ret)
+		return ret;
+
+	cfg[led_index].led_id[color_number] = reg;
+
+	of_property_read_u8(np, "led-max-microamp",
+			    &cfg[led_index].max_current[color_number]);
+
+	of_property_read_u32(np, "color", &color_id);
+	cfg[led_index].color_id[color_number] = color_id;
+
+	return 0;
+}
+
+static int lp5812_parse_led(struct device_node *np,
+			    struct lp5812_led_config *cfg,
+			    int led_index)
+{
+	int num_colors = 0, ret;
+
+	of_property_read_string(np, "label", &cfg[led_index].name);
+
+	ret = of_property_read_u32(np, "reg", &cfg[led_index].chan_nr);
+	if (ret)
+		return ret;
+
+	for_each_available_child_of_node_scoped(np, child) {
+		ret = lp5812_parse_led_channel(child, cfg, led_index, num_colors);
+		if (ret)
+			return ret;
+		num_colors++;
+	}
+
+	if (num_colors == 0) {
+		ret = lp5812_parse_led_channel(np, cfg, led_index, 0);
+		if (ret)
+			return ret;
+		num_colors = 1;
+		cfg[led_index].is_sc_led = true;
+	} else {
+		cfg[led_index].is_sc_led = false;
+	}
+
+	cfg[led_index].num_colors = num_colors;
+
+	return 0;
+}
+
+static int lp5812_of_populate_pdata(struct device *dev,
+				    struct device_node *np,
+				    struct lp5812_chip *chip)
+{
+	struct lp5812_led_config *cfg;
+	int num_channels, i = 0, ret;
+
+	num_channels = of_get_available_child_count(np);
+	if (num_channels == 0) {
+		dev_err(dev, "no LED channels\n");
+		return -EINVAL;
+	}
+
+	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	chip->led_config = &cfg[0];
+	chip->num_channels = num_channels;
+
+	for_each_available_child_of_node_scoped(np, child) {
+		ret = lp5812_parse_led(child, cfg, i);
+		if (ret)
+			return -EINVAL;
+		i++;
+	}
+
+	of_property_read_string(np, "label", &chip->label);
+	return 0;
+}
+
+static int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)
+{
+	return lp5812_read(chip, chip->cfg->reg_tsd_config_status.addr, reg_val);
+}
+
+static int lp5812_update_regs_config(struct lp5812_chip *chip)
+{
+	u8 reg_val;
+	int ret;
+
+	ret = lp5812_write(chip, chip->cfg->reg_cmd_update.addr, LP5812_UPDATE_CMD_VAL);
+	if (ret)
+		return ret;
+
+	ret = lp5812_read_tsd_config_status(chip, &reg_val); /* Save register value */
+	if (ret == 0)
+		return (int)(reg_val & 0x01);
+
+	return ret;
+}
+
+static int lp5812_disable_all_leds(struct lp5812_chip *chip)
+{
+	int ret;
+
+	ret = lp5812_write(chip, chip->cfg->reg_led_en_1.addr, 0x00);
+	if (ret)
+		return ret;
+	ret = lp5812_write(chip, chip->cfg->reg_led_en_2.addr, 0x00);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int lp5812_fault_clear(struct lp5812_chip *chip, u8 value)
+{
+	u8 reg_val;
+
+	if (value == 0)
+		reg_val = LOD_CLEAR_VAL;
+	else if (value == 1)
+		reg_val = LSD_CLEAR_VAL;
+	else if (value == 2)
+		reg_val = TSD_CLEAR_VAL;
+	else if (value == 3)
+		reg_val = FAULT_CLEAR_ALL;
+	else
+		return -EINVAL;
+
+	return lp5812_write(chip, chip->cfg->reg_reset.addr, reg_val);
+}
+
+static void set_mix_sel_led(struct lp5812_chip *chip, int mix_sel_led)
+{
+	if (mix_sel_led == 0)
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 1;
+
+	if (mix_sel_led == 1)
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 1;
+
+	if (mix_sel_led == 2)
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 1;
+
+	if (mix_sel_led == 3)
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 1;
+}
+
+static ssize_t parse_drive_mode(struct lp5812_chip *chip, char *str)
+{
+	char *sub_str;
+	int tcm_scan_num, mix_scan_num, mix_sel_led, scan_oder[4], i, ret;
+
+	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
+	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
+	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
+	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
+
+	sub_str = strsep(&str, ":");
+	if (sysfs_streq(sub_str, "direct_mode")) {
+		chip->u_drive_mode.s_drive_mode.led_mode = 0;
+	} else if (sysfs_streq(sub_str, "tcmscan")) {
+		/* Get tcm scan number */
+		sub_str = strsep(&str, ":");
+		if (!sub_str)
+			return -EINVAL;
+		ret = kstrtoint(sub_str, 0, &tcm_scan_num);
+		if (ret)
+			return ret;
+		if (tcm_scan_num < 0 || tcm_scan_num > 4)
+			return -EINVAL;
+		chip->u_drive_mode.s_drive_mode.led_mode = tcm_scan_num;
+
+		for (i = 0; i < tcm_scan_num; i++) {
+			sub_str = strsep(&str, ":");
+			if (!sub_str)
+				return -EINVAL;
+			ret = kstrtoint(sub_str, 0, &scan_oder[i]);
+			if (ret)
+				return ret;
+		}
+
+		chip->u_scan_order.s_scan_order.scan_order_0 = scan_oder[0];
+		chip->u_scan_order.s_scan_order.scan_order_1 = scan_oder[1];
+		chip->u_scan_order.s_scan_order.scan_order_2 = scan_oder[2];
+		chip->u_scan_order.s_scan_order.scan_order_3 = scan_oder[3];
+	} else if (sysfs_streq(sub_str, "mixscan")) {
+		/* Get mix scan number */
+		sub_str = strsep(&str, ":");
+		if (!sub_str)
+			return -EINVAL;
+		ret = kstrtoint(sub_str, 0, &mix_scan_num);
+		if (ret)
+			return ret;
+		if (mix_scan_num < 0 || mix_scan_num > 3)
+			return -EINVAL;
+
+		chip->u_drive_mode.s_drive_mode.led_mode = mix_scan_num + 4;
+		/* Get mix_sel_led */
+		sub_str = strsep(&str, ":");
+		if (!sub_str)
+			return -EINVAL;
+		ret = kstrtoint(sub_str, 0, &mix_sel_led);
+		if (ret)
+			return ret;
+		if (mix_sel_led < 0 || mix_sel_led > 3)
+			return -EINVAL;
+		set_mix_sel_led(chip, mix_sel_led);
+
+		for (i = 0; i < mix_scan_num; i++) {
+			sub_str = strsep(&str, ":");
+			if (!sub_str)
+				return -EINVAL;
+			ret = kstrtoint(sub_str, 0, &scan_oder[i]);
+			if (ret)
+				return ret;
+			if (scan_oder[i] == mix_sel_led || scan_oder[i] < 0 || scan_oder[i] > 3)
+				return -EINVAL;
+		}
+		chip->u_scan_order.s_scan_order.scan_order_0 = scan_oder[0];
+		chip->u_scan_order.s_scan_order.scan_order_1 = scan_oder[1];
+		chip->u_scan_order.s_scan_order.scan_order_2 = scan_oder[2];
+		chip->u_scan_order.s_scan_order.scan_order_3 = scan_oder[3];
+	} else {
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int lp5812_set_drive_mode_scan_order(struct lp5812_chip *chip)
+{
+	u8 val;
+	int ret;
+
+	/* Set led mode */
+	val = chip->u_drive_mode.drive_mode_val;
+	ret = lp5812_write(chip, chip->cfg->reg_dev_config_1.addr, val);
+	if (ret)
+		return ret;
+
+	/* Setup scan order */
+	val = chip->u_scan_order.scan_order_val;
+	ret = lp5812_write(chip, chip->cfg->reg_dev_config_2.addr, val);
+
+	return ret;
+}
+
+static ssize_t dev_config_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t len)
+{
+	struct lp5812_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp5812_chip *chip = led->chip;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+	ret = parse_drive_mode(chip, (char *)buf);
+	if (ret)
+		return ret;
+
+	ret = lp5812_set_drive_mode_scan_order(chip);
+	if (ret)
+		return ret;
+
+	ret = lp5812_update_regs_config(chip);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static ssize_t fault_clear_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t len)
+{
+	struct lp5812_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp5812_chip *chip = led->chip;
+	int fault_clear, ret;
+
+	ret = kstrtoint(buf, 0, &fault_clear);
+	if (ret)
+		return ret;
+
+	if (fault_clear < 0 || fault_clear > 3)
+		return -EINVAL;
+
+	guard(mutex)(&chip->lock);
+	ret = lp5812_fault_clear(chip, fault_clear);
+	if (ret)
+		return -EIO;
+
+	return len;
+}
+
+static ssize_t tsd_config_status_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct lp5812_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp5812_chip *chip = led->chip;
+	int tsd_stat, config_stat, ret;
+	u8 reg_val;
+
+	guard(mutex)(&chip->lock);
+	ret = lp5812_read(chip, chip->cfg->reg_tsd_config_status.addr, &reg_val);
+	if (ret)
+		return -EIO;
+	tsd_stat = (reg_val >> 1) & 0x01;
+	config_stat = reg_val & 0x01;
+
+	return sysfs_emit(buf, "%d %d\n", tsd_stat, config_stat);
+}
+
+static ssize_t sw_reset_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t len)
+{
+	struct lp5812_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp5812_chip *chip = led->chip;
+	int reset, ret;
+
+	ret = kstrtoint(buf, 0, &reset);
+	if (ret)
+		return ret;
+
+	if (reset != 1)
+		return -EINVAL;
+
+	guard(mutex)(&chip->lock);
+	ret = lp5812_write(chip, chip->cfg->reg_reset.addr, LP5812_RESET);
+	if (ret)
+		return -EIO;
+
+	return len;
+}
+
+static void lp5812_deinit_device(struct lp5812_chip *chip)
+{
+	(void)lp5812_disable_all_leds(chip);
+	(void)lp5812_write(chip, chip->cfg->reg_chip_en.addr, (u8)0);
+}
+
+static int lp5812_init_device(struct lp5812_chip *chip)
+{
+	int ret;
+
+	usleep_range(1000, 1100);
+
+	ret = lp5812_write(chip, chip->cfg->reg_chip_en.addr, (u8)1);
+	if (ret) {
+		dev_err(&chip->client->dev, "lp5812_enable_disable failed\n");
+		return ret;
+	}
+
+	ret = lp5812_write(chip, chip->cfg->reg_dev_config_12.addr, 0x0B);
+	if (ret) {
+		dev_err(&chip->client->dev, "write 0x0B to DEV_CONFIG12 failed\n");
+		return ret;
+	}
+
+	ret = lp5812_update_regs_config(chip);
+	if (ret) {
+		dev_err(&chip->client->dev, "lp5812_update_regs_config failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct lp5812_led *lp5812_dev_to_led(struct device *dev)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	const char *name = dev->platform_data;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		return container_of(cdev, struct lp5812_led, cdev);
+
+	return container_of((struct led_classdev_mc *)cdev, struct lp5812_led, mc_cdev);
+}
+
+static int lp5812_read_lod_status(struct lp5812_chip *chip, int led_number, u8 *val)
+{
+	u8 reg_val;
+	u16 reg;
+	int ret;
+
+	if (!val)
+		return -1;
+
+	if (led_number < 0x8)
+		reg = chip->cfg->reg_lod_status_base.addr;
+	else
+		reg = chip->cfg->reg_lod_status_base.addr + 1;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret)
+		return ret;
+
+	*val = (reg_val & (1 << (led_number % 8))) ? 1 : 0;
+
+	return ret;
+}
+
+static int lp5812_read_lsd_status(struct lp5812_chip *chip, int led_number, u8 *val)
+{
+	u8 reg_val;
+	u16 reg;
+	int ret;
+
+	if (!val)
+		return -1;
+
+	if (led_number < 0x8)
+		reg = chip->cfg->reg_lsd_status_base.addr;
+	else
+		reg = chip->cfg->reg_lsd_status_base.addr + 1;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret)
+		return ret;
+
+	*val = (reg_val & (1 << (led_number % 8))) ? 1 : 0;
+
+	return ret;
+}
+
+static int lp5812_set_led_mode(struct lp5812_chip *chip, int led_number,
+			       enum control_mode mode)
+{
+	u8 reg_val;
+	u16 reg;
+	int ret;
+
+	if (led_number <= 7)
+		reg = chip->cfg->reg_dev_config_3.addr;
+	else
+		reg = chip->cfg->reg_dev_config_4.addr;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret)
+		return ret;
+
+	if (mode == LP5812_MODE_MANUAL)
+		reg_val &= ~(1 << (led_number % 8));
+	else
+		reg_val |= (1 << (led_number % 8));
+
+	ret = lp5812_write(chip, reg, reg_val);
+	if (ret)
+		return ret;
+
+	ret = lp5812_update_regs_config(chip);
+
+	return ret;
+}
+
+static int lp5812_get_led_mode(struct lp5812_chip *chip, int led_number,
+			       enum control_mode *mode)
+{
+	u8 reg_val;
+	u16 reg;
+	int ret;
+
+	if (led_number <= 7)
+		reg = chip->cfg->reg_dev_config_3.addr;
+	else
+		reg = chip->cfg->reg_dev_config_4.addr;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret)
+		return ret;
+
+	*mode = (reg_val & (1 << (led_number % 8))) ? LP5812_MODE_AUTONOMOUS : LP5812_MODE_MANUAL;
+	return 0;
+}
+
+static int lp5812_manual_dc_pwm_control(struct lp5812_chip *chip, int led_number,
+					u8 val, enum dimming_type dimming_type)
+{
+	u16 led_base_reg;
+	int ret;
+
+	if (dimming_type == LP5812_DIMMING_ANALOG)
+		led_base_reg = chip->cfg->reg_manual_dc_base.addr;
+	else
+		led_base_reg = chip->cfg->reg_manual_pwm_base.addr;
+	ret = lp5812_write(chip, led_base_reg + led_number, val);
+
+	return ret;
+}
+
+static int lp5812_auto_dc(struct lp5812_chip *chip,
+			  int led_number, u8 val)
+{
+	return lp5812_write(chip, chip->cfg->reg_auto_dc_base.addr + led_number, val);
+}
+
+static int lp5812_multicolor_brightness(struct lp5812_led *led)
+{
+	int ret, i;
+	struct lp5812_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_colors; i++) {
+		ret = lp5812_manual_dc_pwm_control(chip, led->mc_cdev.subled_info[i].channel,
+						   led->mc_cdev.subled_info[i].brightness,
+						   LP5812_DIMMING_PWM);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static int lp5812_led_brightness(struct lp5812_led *led)
+{
+	struct lp5812_chip *chip = led->chip;
+	struct lp5812_led_config *led_cfg;
+	int ret;
+
+	led_cfg = &chip->led_config[led->chan_nr];
+
+	guard(mutex)(&chip->lock);
+	ret = lp5812_manual_dc_pwm_control(chip, led_cfg->led_id[0],
+					   led->brightness, LP5812_DIMMING_PWM);
+
+	return ret;
+}
+
+static ssize_t activate_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	char *sub_str, *str = (char *)buf;
+	u8 reg_val, chan_nr = 0;
+	u16 reg;
+	int val[LED_COLOR_ID_MAX];
+	int i, ret;
+
+	led = lp5812_dev_to_led(dev);
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->led_config[chan_nr];
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (!sub_str)
+			return -EINVAL;
+		if (kstrtoint(sub_str, 0, &val[i]))
+			return -EINVAL;
+		if (val[i] != 0 && val[i] != 1)
+			return -EINVAL;
+	}
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		if (led_cfg->led_id[i] < 0x8)
+			reg = chip->cfg->reg_led_en_1.addr;
+		else
+			reg = chip->cfg->reg_led_en_2.addr;
+
+		ret = lp5812_read(chip, reg, &reg_val);
+		if (ret)
+			return -EIO;
+
+		if (val[i] == 0)
+			reg_val &= ~(1 << (led_cfg->led_id[i] % 8));
+		else
+			reg_val |= (1 << (led_cfg->led_id[i] % 8));
+
+		ret = lp5812_write(chip, reg, reg_val);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t led_current_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	enum control_mode mode;
+	char *sub_str, *str = (char *)buf;
+	u8 chan_nr = 0;
+	int val[LED_COLOR_ID_MAX];
+	int i, ret;
+
+	led = lp5812_dev_to_led(dev);
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->led_config[chan_nr];
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (!sub_str)
+			return -EINVAL;
+		if (kstrtoint(sub_str, 0, &val[i]))
+			return -EINVAL;
+	}
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		ret = lp5812_get_led_mode(chip, led_cfg->led_id[i], &mode);
+		if (ret)
+			return -EIO;
+
+		if (mode == 1)
+			ret = lp5812_auto_dc(chip, led_cfg->led_id[i], val[i]);
+		else
+			ret = lp5812_manual_dc_pwm_control(chip, led_cfg->led_id[i],
+							   val[i], LP5812_DIMMING_ANALOG);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t lod_lsd_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	u8 chan_nr = 0, i, lsd_status, lod_status;
+	int size = 0, ret;
+
+	led = lp5812_dev_to_led(dev);
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->led_config[chan_nr];
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		ret = lp5812_read_lsd_status(chip, led_cfg->led_id[i], &lsd_status);
+		if (!ret)
+			ret = lp5812_read_lod_status(chip, led_cfg->led_id[i], &lod_status);
+		if (ret)
+			return -EIO;
+
+		size += sysfs_emit_at(buf, size, "%d:%d %d\n",
+			led_cfg->led_id[i], lod_status, lsd_status);
+	}
+	return size;
+}
+
+static ssize_t max_current_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	u8 val;
+	int ret;
+
+	led = lp5812_dev_to_led(dev);
+	chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+	ret = lp5812_read(chip, chip->cfg->reg_dev_config_0.addr, &val);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", (val & 0x01));
+}
+
+static DEVICE_ATTR_WO(led_current);
+static DEVICE_ATTR_RO(max_current);
+static DEVICE_ATTR_WO(activate);
+static DEVICE_ATTR_RO(lod_lsd);
+
+static struct attribute *lp5812_led_attrs[] = {
+	&dev_attr_led_current.attr,
+	&dev_attr_max_current.attr,
+	&dev_attr_activate.attr,
+	&dev_attr_lod_lsd.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(lp5812_led);
+
+static int lp5812_set_brightness(struct led_classdev *cdev,
+				 enum led_brightness brightness)
+{
+	struct lp5812_led *led = container_of(cdev, struct lp5812_led, cdev);
+
+	led->brightness = (u8)brightness;
+	return lp5812_led_brightness(led);
+}
+
+static int lp5812_set_mc_brightness(struct led_classdev *cdev,
+				    enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
+	struct lp5812_led *led = container_of(mc_dev, struct lp5812_led, mc_cdev);
+
+	led_mc_calc_color_components(&led->mc_cdev, brightness);
+	return lp5812_multicolor_brightness(led);
+}
+
+static int lp5812_init_led(struct lp5812_led *led, struct lp5812_chip *chip, int chan)
+{
+	struct device *dev = &chip->client->dev;
+	struct mc_subled *mc_led_info;
+	struct led_classdev *led_cdev;
+	int i, ret = 0;
+
+	if (chip->led_config[chan].name) {
+		led->cdev.name = chip->led_config[chan].name;
+	} else {
+		led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s:channel%d",
+						chip->label ? : chip->client->name, chan);
+		if (!led->cdev.name)
+			return -ENOMEM;
+	}
+
+	if (!chip->led_config[chan].is_sc_led) {
+		mc_led_info = devm_kcalloc(dev,
+					   chip->led_config[chan].num_colors,
+					   sizeof(*mc_led_info), GFP_KERNEL);
+		if (!mc_led_info)
+			return -ENOMEM;
+
+		led_cdev = &led->mc_cdev.led_cdev;
+		led_cdev->name = led->cdev.name;
+		led_cdev->brightness_set_blocking = lp5812_set_mc_brightness;
+		led->mc_cdev.num_colors = chip->led_config[chan].num_colors;
+		for (i = 0; i < led->mc_cdev.num_colors; i++) {
+			mc_led_info[i].color_index =
+				chip->led_config[chan].color_id[i];
+			mc_led_info[i].channel =
+					chip->led_config[chan].led_id[i];
+		}
+
+		led->mc_cdev.subled_info = mc_led_info;
+	} else {
+		led->cdev.brightness_set_blocking = lp5812_set_brightness;
+	}
+
+	led->cdev.groups = lp5812_led_groups;
+	led->chan_nr = chan;
+
+	if (chip->led_config[chan].is_sc_led) {
+		ret = devm_led_classdev_register(dev, &led->cdev);
+		if (ret == 0) {
+			led->cdev.dev->platform_data = devm_kstrdup(dev, LP5812_SC_LED, GFP_KERNEL);
+			if (!led->cdev.dev->platform_data)
+				return -ENOMEM;
+		}
+	} else {
+		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
+		if (ret == 0) {
+			led->mc_cdev.led_cdev.dev->platform_data =
+				devm_kstrdup(dev, LP5812_MC_LED, GFP_KERNEL);
+			if (!led->mc_cdev.led_cdev.dev->platform_data)
+				return -ENOMEM;
+
+			ret = sysfs_create_groups(&led->mc_cdev.led_cdev.dev->kobj,
+						  lp5812_led_groups);
+			if (ret)
+				dev_err(dev, "sysfs_create_groups failed\n");
+		}
+	}
+
+	if (ret) {
+		dev_err(dev, "led register err: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int lp5812_register_leds(struct lp5812_led *led, struct lp5812_chip *chip)
+{
+	struct lp5812_led *each;
+	int num_channels = chip->num_channels;
+	int ret, i, j;
+
+	for (i = 0; i < num_channels; i++) {
+		each = led + i;
+		ret = lp5812_init_led(each, chip, i);
+		if (ret)
+			goto err_init_led;
+
+		each->chip = chip;
+
+		for (j = 0; j < chip->led_config[i].num_colors; j++) {
+			ret = lp5812_auto_dc(chip, chip->led_config[i].led_id[j],
+					     chip->led_config[i].led_id[j]);
+			if (ret)
+				goto err_init_led;
+
+			ret = lp5812_set_led_mode(chip, chip->led_config[i].led_id[j],
+						  LP5812_MODE_MANUAL);
+			if (ret)
+				goto err_init_led;
+		}
+	}
+
+	return 0;
+
+err_init_led:
+	return ret;
+}
+
+static int lp5812_register_sysfs(struct lp5812_chip *chip)
+{
+	struct device *dev = &chip->client->dev;
+	const struct lp5812_device_config *cfg = chip->cfg;
+	int ret;
+
+	ret = sysfs_create_group(&dev->kobj, cfg->dev_attr_group);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void lp5812_unregister_sysfs(struct lp5812_led *led, struct lp5812_chip *chip)
+{
+	struct device *dev = &chip->client->dev;
+	const struct lp5812_device_config *cfg = chip->cfg;
+	struct lp5812_led *each;
+	int i;
+
+	sysfs_remove_group(&dev->kobj, cfg->dev_attr_group);
+
+	for (i = 0; i < chip->num_channels; i++) {
+		if (!chip->led_config[i].is_sc_led) {
+			each = led + i;
+			sysfs_remove_groups(&each->mc_cdev.led_cdev.dev->kobj, lp5812_led_groups);
+		}
+	}
+}
+
+static int lp5812_probe(struct i2c_client *client)
+{
+	struct lp5812_chip *chip;
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	struct device_node *np = dev_of_node(&client->dev);
+	struct lp5812_led *led;
+	int ret;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cfg = i2c_get_match_data(client);
+
+	if (np) {
+		ret = lp5812_of_populate_pdata(&client->dev, np, chip);
+		if (ret)
+			goto err_init;
+	} else {
+		return dev_err_probe(&client->dev, -EINVAL, "No platform data\n");
+	}
+
+	led = devm_kcalloc(&client->dev, chip->num_channels, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	chip->client = client;
+
+	mutex_init(&chip->lock);
+
+	i2c_set_clientdata(client, led);
+
+	ret = lp5812_init_device(chip);
+	if (ret)
+		goto err_init;
+
+	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
+
+	ret = lp5812_register_leds(led, chip);
+	if (ret)
+		goto err_out;
+
+	ret = lp5812_register_sysfs(chip);
+	if (ret) {
+		dev_err_probe(&client->dev, ret, "Registering sysfs failed\n");
+		goto err_out;
+	}
+
+	return 0;
+
+err_out:
+	lp5812_deinit_device(chip);
+err_init:
+	return ret;
+}
+
+static void lp5812_remove(struct i2c_client *client)
+{
+	struct lp5812_led *led = i2c_get_clientdata(client);
+
+	lp5812_unregister_sysfs(led, led->chip);
+	lp5812_deinit_device(led->chip);
+
+	dev_info(&client->dev, "Removed driver\n");
+}
+
+static LP5812_DEV_ATTR_WO(dev_config);
+static LP5812_DEV_ATTR_WO(sw_reset);
+static LP5812_DEV_ATTR_WO(fault_clear);
+static LP5812_DEV_ATTR_RO(tsd_config_status);
+
+static struct attribute *lp5812_chip_attributes[] = {
+	&dev_attr_fault_clear.attr,
+	&dev_attr_sw_reset.attr,
+	&dev_attr_dev_config.attr,
+	&dev_attr_tsd_config_status.attr,
+	NULL
+};
+
+static const struct attribute_group lp5812_group = {
+	.name = "lp5812_chip_setup",
+	.attrs = lp5812_chip_attributes
+};
+
+/* Chip specific configurations */
+static struct lp5812_device_config lp5812_cfg = {
+	.reg_reset = {
+		.addr = LP5812_REG_RESET,
+		.val  = LP5812_RESET
+	},
+	.reg_chip_en = {
+		.addr = LP5812_REG_ENABLE,
+		.val  = LP5812_ENABLE_DEFAULT
+	},
+	.reg_dev_config_0 = {
+		.addr = LP5812_DEV_CONFIG0,
+		.val  = 0
+	},
+	.reg_dev_config_1 = {
+		.addr = LP5812_DEV_CONFIG1,
+		.val  = 0
+	},
+	.reg_dev_config_2 = {
+		.addr = LP5812_DEV_CONFIG2,
+		.val  = 0
+	},
+	.reg_dev_config_3 = {
+		.addr = LP5812_DEV_CONFIG3,
+		.val  = 0
+	},
+	.reg_dev_config_4 = {
+		.addr = LP5812_DEV_CONFIG4,
+		.val  = 0
+	},
+	.reg_dev_config_5 = {
+		.addr = LP5812_DEV_CONFIG5,
+		.val  = 0
+	},
+	.reg_dev_config_6 = {
+		.addr = LP5812_DEV_CONFIG6,
+		.val  = 0
+	},
+	.reg_dev_config_7 = {
+		.addr = LP5812_DEV_CONFIG7,
+		.val  = 0
+	},
+	.reg_dev_config_12 = {
+		.addr = LP5812_DEV_CONFIG12,
+		.val  = LP5812_DEV_CONFIG12_DEFAULT
+	},
+	.reg_cmd_update = {
+		.addr = LP5812_CMD_UPDATE,
+		.val  = 0
+	},
+	.reg_tsd_config_status = {
+		.addr = LP5812_TSD_CONFIG_STATUS,
+		.val  = 0
+	},
+	.reg_led_en_1 = {
+		.addr = LP5812_LED_EN_1,
+		.val  = 0
+	},
+	.reg_led_en_2 = {
+		.addr = LP5812_LED_EN_2,
+		.val  = 0
+	},
+	.reg_fault_clear = {
+		.addr = LP5812_FAULT_CLEAR,
+		.val  = 0
+	},
+	.reg_manual_dc_base  = {
+		.addr = LP5812_MANUAL_DC_BASE,
+		.val  = 0
+	},
+	.reg_auto_dc_base  = {
+		.addr = LP5812_AUTO_DC_BASE,
+		.val  = 0
+	},
+	.reg_manual_pwm_base  = {
+		.addr = LP5812_MANUAL_PWM_BASE,
+		.val  = 0
+	},
+	.reg_lod_status_base  = {
+		.addr = LP5812_LOD_STATUS,
+		.val  = 0
+	},
+	.reg_lsd_status_base  = {
+		.addr = LP5812_LSD_STATUS,
+		.val  = 0
+	},
+
+	.dev_attr_group = &lp5812_group
+};
+
+static const struct i2c_device_id lp5812_id[] = {
+	{ "lp5812", .driver_data = (kernel_ulong_t)&lp5812_cfg },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, lp5812_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_lp5812_match[] = {
+	{ .compatible = "ti,lp5812", .data = &lp5812_cfg },
+	{/* NULL */}
+};
+
+MODULE_DEVICE_TABLE(of, of_lp5812_match);
+#endif
+
+static struct i2c_driver lp5812_driver = {
+	.driver = {
+		.name   = "lp5812",
+		.of_match_table = of_match_ptr(of_lp5812_match),
+	},
+	.probe		= lp5812_probe,
+	.remove		= lp5812_remove,
+	.id_table	= lp5812_id,
+};
+
+module_i2c_driver(lp5812_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LP5812 LED Driver");
+MODULE_AUTHOR("Jared Zhou");
+MODULE_LICENSE("GPL");
diff --git a/drivers/leds/rgb/leds-lp5812.h b/drivers/leds/rgb/leds-lp5812.h
new file mode 100644
index 000000000000..c98bbb8ced9d
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5812.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * LP5812 Driver Header
+ *
+ * Copyright (C) 2025 Texas Instruments
+ *
+ * Author: Jared Zhou <jared-zhou@ti.com>
+ */
+
+#ifndef _LP5812_H_
+#define _LP5812_H_
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define LP5812_REG_ENABLE				0x0000
+#define LP5812_REG_RESET				0x0023
+#define LP5812_DEV_CONFIG0				0x0001
+#define LP5812_DEV_CONFIG1				0x0002
+#define LP5812_DEV_CONFIG2				0x0003
+#define LP5812_DEV_CONFIG3				0x0004
+#define LP5812_DEV_CONFIG4				0x0005
+#define LP5812_DEV_CONFIG5				0x0006
+#define LP5812_DEV_CONFIG6				0x0007
+#define LP5812_DEV_CONFIG7				0x0008
+#define LP5812_DEV_CONFIG8				0x0009
+#define LP5812_DEV_CONFIG9				0x000A
+#define LP5812_DEV_CONFIG10				0x000B
+#define LP5812_DEV_CONFIG11				0x000c
+#define LP5812_DEV_CONFIG12				0x000D
+#define LP5812_CMD_UPDATE				0x0010
+#define LP5812_LED_EN_1					0x0020
+#define LP5812_LED_EN_2					0x0021
+#define LP5812_FAULT_CLEAR				0x0022
+#define LP5812_MANUAL_DC_BASE				0x0030
+#define LP5812_AUTO_DC_BASE				0x0050
+#define LP5812_MANUAL_PWM_BASE				0x0040
+
+#define LP5812_TSD_CONFIG_STATUS			0x0300
+#define LP5812_LOD_STATUS				0x0301
+#define LP5812_LSD_STATUS				0x0303
+
+#define LP5812_ENABLE_DEFAULT				0x01
+#define FAULT_CLEAR_ALL					0x07
+#define TSD_CLEAR_VAL					0x04
+#define LSD_CLEAR_VAL					0x02
+#define LOD_CLEAR_VAL					0x01
+#define LP5812_RESET					0x66
+#define LP5812_DEV_CONFIG12_DEFAULT			0x08
+
+#define LP5812_UPDATE_CMD_VAL				0x55
+
+#define LP5812_DEV_ATTR_RW(name)  \
+	DEVICE_ATTR_RW(name)
+#define LP5812_DEV_ATTR_RO(name)  \
+	DEVICE_ATTR_RO(name)
+#define LP5812_DEV_ATTR_WO(name)  \
+	DEVICE_ATTR_WO(name)
+
+enum control_mode {
+	LP5812_MODE_MANUAL = 0,
+	LP5812_MODE_AUTONOMOUS
+};
+
+enum dimming_type {
+	LP5812_DIMMING_ANALOG,
+	LP5812_DIMMING_PWM
+};
+
+union u_scan_order {
+	struct {
+		u8 scan_order_0:2;
+		u8 scan_order_1:2;
+		u8 scan_order_2:2;
+		u8 scan_order_3:2;
+	} s_scan_order;
+	u8 scan_order_val;
+};
+
+union u_drive_mode {
+	struct {
+		u8 mix_sel_led_0:1;
+		u8 mix_sel_led_1:1;
+		u8 mix_sel_led_2:1;
+		u8 mix_sel_led_3:1;
+		u8 led_mode:3;
+		u8 pwm_fre:1;
+	} s_drive_mode;
+	u8 drive_mode_val;
+};
+
+struct lp5812_reg {
+	u16 addr;
+	union {
+		u8 val;
+		u8 mask;
+		u8 shift;
+	};
+};
+
+struct lp5812_led_config {
+	bool is_sc_led;
+	const char *name;
+	u8 color_id[LED_COLOR_ID_MAX];
+	u8 max_current[LED_COLOR_ID_MAX];
+	int chan_nr;
+	int num_colors;
+	int led_id[LED_COLOR_ID_MAX];
+};
+
+struct lp5812_chip {
+	u8 num_channels;
+	struct i2c_client *client;
+	struct mutex lock; /* Protects register access */
+	struct lp5812_led_config *led_config;
+	const char *label;
+	const struct lp5812_device_config *cfg;
+	union u_scan_order u_scan_order;
+	union u_drive_mode u_drive_mode;
+};
+
+struct lp5812_led {
+	u8 brightness;
+	int chan_nr;
+	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
+	struct lp5812_chip *chip;
+};
+
+struct lp5812_device_config {
+	const struct lp5812_reg reg_reset;
+	const struct lp5812_reg reg_chip_en;
+	const struct lp5812_reg reg_dev_config_0;
+	const struct lp5812_reg reg_dev_config_1;
+	const struct lp5812_reg reg_dev_config_2;
+	const struct lp5812_reg reg_dev_config_3;
+	const struct lp5812_reg reg_dev_config_4;
+	const struct lp5812_reg reg_dev_config_5;
+	const struct lp5812_reg reg_dev_config_6;
+	const struct lp5812_reg reg_dev_config_7;
+	const struct lp5812_reg reg_dev_config_12;
+	const struct lp5812_reg reg_cmd_update;
+
+	const struct lp5812_reg reg_led_en_1;
+	const struct lp5812_reg reg_led_en_2;
+	const struct lp5812_reg reg_fault_clear;
+	const struct lp5812_reg reg_manual_dc_base;
+	const struct lp5812_reg reg_auto_dc_base;
+	const struct lp5812_reg reg_manual_pwm_base;
+	const struct lp5812_reg reg_tsd_config_status;
+	const struct lp5812_reg reg_lod_status_base;
+	const struct lp5812_reg reg_lsd_status_base;
+
+	/* Additional device specific attributes */
+	const struct attribute_group *dev_attr_group;
+};
+
+#endif /*_LP5812_H_*/
-- 
2.25.1


