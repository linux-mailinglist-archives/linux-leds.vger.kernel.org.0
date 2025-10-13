Return-Path: <linux-leds+bounces-5769-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888CCBD58A0
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 19:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F3F3A7C74
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 17:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A009F3081CE;
	Mon, 13 Oct 2025 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+4txlu2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF329D297
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376975; cv=none; b=X5hcL9VXhxljhoUf/guvJ/XsnOVjE0SY2ZhnDnTvW+sgdWFxpAUZj/5vUB4B2CqljJ4Qx+rtXK2sG29VBYvbllu0x8HW/Dio0l52nbgm5mBwa4fHgb8PnLnJLAdO0yxsRibJXyVB1Wpegp5XQqsHHTv3EBonkE6EG1SYodvIWXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376975; c=relaxed/simple;
	bh=fwb6I8h0lwt3goIJzZZZLDpjtzyHI+QZugr3DipgbnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X0Zq2ty3vytMEdR5nrWYpm3kzW2q1rmrtiULK/TJFTMMtF+1fPxpCC6QGzU60Nd6XK1nvIiE0AvQUBZzZAdcHRUsf7JpllkhihOciLVCXh3O1AW92LR+q2kSyGcRqf3V8tPb9i26RR9b14ZArzXwP/H5T6ayNf/Wen8q7Srd+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+4txlu2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-782023ca359so4537679b3a.2
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760376972; x=1760981772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4GngNsyeVgT6DOuojtfbiPJiKElJeegy42aCcsIs3M=;
        b=e+4txlu2zklrtwpk9ncgTgBUvucyGMBi56UcoVZpn0TptheInr+NY54xq4//EL8xhP
         1XsSitoaRmeTnnuEvT6tgknJlsq9nqMauOQumwYIGGpbeXxPs4/FQYH8GFKIUTpIumSd
         CNikhuuwNBICD1QoFFX9pey+qVvRXhCj+q/DEUZjk2AdPynLxo1DTUL+1PDAMRdae97U
         LRW2a3yMZs7+WIOiuWyMWwlLQeziAYr7WrOU9rGnYw8NotrwftOUHHvSB6aeRaEYMFSz
         liT2nmWejbMPuJ7MkTM460EYrADHfM6+GzDkDdnFJ05GOoYFk5Wb07+Yu3MaH/FyeTu9
         pSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376972; x=1760981772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4GngNsyeVgT6DOuojtfbiPJiKElJeegy42aCcsIs3M=;
        b=WmqY7aXnSjjxNsMVaoiJV/7t+UoQRppqNMPAUyzxXhElZ+hjqlNIId6UsgCX5WaHS7
         E3D1HlxgYHvAKS/NShv9iBOULIe4kE8UJzDRLrCtsDRrvxFk5El6IVsLgapPnCIqIWAg
         1T3Hrpp46VDC+bRhkfuFT4fUj4h90ZSoohZqZocwf+EHLoyb7VWE2u7PdChNm7doRp5d
         CvA5+V6maegjpuk2J2LCeF1UuyVG/E9NQTnvp6AyLTeEOm/7mMGdjCvJFRbL8HuK86nD
         U+Lkv6knVGDxx1nX7Lv6IESh+WQRlB4h27GLooYv30V/t5gjtsmDoR+qx1dQMiKPu43/
         kXkg==
X-Forwarded-Encrypted: i=1; AJvYcCUGH+2gAp7l8T+IW9YfigSbvQhpdkbIdMnCp0pk8RmnQ5BoKPG2W9WIKvDp4znn/5pYHI0vdf/knQ2Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxVBfg0YXC4cQX+cPSJORquNaIN7woETb/bSP6D60fQRdK7G9w/
	kbKbvLPhHN8RMkaOgxhjYsotsvh5DbiQRModX7jU2H5UV0OxDyZ5JE4H
X-Gm-Gg: ASbGnctrTGKR0BtvTKKJ7nrj9rXhL20KOLaAqY6HKtvw/tozuxg66vXdQ7woG14QErR
	BErPM/622Au3x7maZSsx+q4XRXR59HKt7ujpo/qozYOOZPqxTW2a/SNB4E038wc0yyiQBfzyWKJ
	QlQwdKffEE2kF9pLuZ88OSDUZ7xOZD/x+7g66ViLHcLcWotHWnpIlcnx2ZYv3C1TR9edBfR7gAl
	ryRLEyEcvyfHxPkZmqkyjASNexrYOUNNAZQIGTBjozUFB7KA8tkpPVaimokyA59DXKJCFBZIGrB
	vhluZh3rdn0tmeY4l5908MEwGhxXwSevUS5ygAVJt4e7bjPr2uyTrBsPwZsFHKMJ5Pyc+XnAtP6
	qH96mp/zbbvrhZZHvfIamHm6mb7x08ZOHonb4EVXXSAeOmeCF5PYm8kpEDpkWU3s=
X-Google-Smtp-Source: AGHT+IHcvBDQ1dwYCufpgJsDpZ6UjTSBp3XgiIKQFyOMsxTaxv/cGB2ZyrDT8DmUed/Y7auEOGwRoQ==
X-Received: by 2002:a05:6a20:7287:b0:2b6:3182:be1f with SMTP id adf61e73a8af0-32da845fddbmr30427613637.42.1760376972111;
        Mon, 13 Oct 2025 10:36:12 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.118.149.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060754sm12424546b3a.13.2025.10.13.10.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 10:36:10 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	gregkh@linuxfoundation.org,
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
Subject: [PATCH v16 2/3] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Tue, 14 Oct 2025 00:35:50 +0700
Message-Id: <20251013173551.108205-3-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013173551.108205-1-trannamatk@gmail.com>
References: <20251013173551.108205-1-trannamatk@gmail.com>
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
 MAINTAINERS                    |   4 +
 drivers/leds/rgb/Kconfig       |  13 +
 drivers/leds/rgb/Makefile      |   1 +
 drivers/leds/rgb/leds-lp5812.c | 726 +++++++++++++++++++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h | 197 +++++++++
 5 files changed, 941 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f94aa363e3a9..7166e80c189b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25418,6 +25418,10 @@ M:	Nam Tran <trannamatk@gmail.com>
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
index 000000000000..db72930d0b69
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5812.c
@@ -0,0 +1,726 @@
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
+static const struct lp5812_mode_mapping chip_mode_map[] = {
+	{"direct_mode", 0, 0, 0, 0, 0, 0},
+	{"tcm:1:0", 1, 0, 0, 0, 0, 0},
+	{"tcm:1:1", 1, 1, 0, 0, 0, 0},
+	{"tcm:1:2", 1, 2, 0, 0, 0, 0},
+	{"tcm:1:3", 1, 3, 0, 0, 0, 0},
+	{"tcm:2:0:1", 2, 0, 1, 0, 0, 0},
+	{"tcm:2:0:2", 2, 0, 2, 0, 0, 0},
+	{"tcm:2:0:3", 2, 0, 3, 0, 0, 0},
+	{"tcm:2:1:2", 2, 1, 2, 0, 0, 0},
+	{"tcm:2:1:3", 2, 1, 3, 0, 0, 0},
+	{"tcm:2:2:3", 2, 2, 3, 0, 0, 0},
+	{"tcm:3:0:1:2", 3, 0, 1, 2, 0, 0},
+	{"tcm:3:0:1:3", 3, 0, 1, 3, 0, 0},
+	{"tcm:3:0:2:3", 3, 0, 2, 3, 0, 0},
+	{"tcm:4:0:1:2:3", 4, 0, 1, 2, 3, 0},
+	{"mix:1:0:1", 5, 1, 0, 0, 0, 0},
+	{"mix:1:0:2", 5, 2, 0, 0, 0, 0},
+	{"mix:1:0:3", 5, 3, 0, 0, 0, 0},
+	{"mix:1:1:0", 5, 0, 0, 0, 0, 1},
+	{"mix:1:1:2", 5, 2, 0, 0, 0, 1},
+	{"mix:1:1:3", 5, 3, 0, 0, 0, 1},
+	{"mix:1:2:0", 5, 0, 0, 0, 0, 2},
+	{"mix:1:2:1", 5, 1, 0, 0, 0, 2},
+	{"mix:1:2:3", 5, 3, 0, 0, 0, 2},
+	{"mix:1:3:0", 5, 0, 0, 0, 0, 3},
+	{"mix:1:3:1", 5, 1, 0, 0, 0, 3},
+	{"mix:1:3:2", 5, 2, 0, 0, 0, 3},
+	{"mix:2:0:1:2", 6, 1, 2, 0, 0, 0},
+	{"mix:2:0:1:3", 6, 1, 3, 0, 0, 0},
+	{"mix:2:0:2:3", 6, 2, 3, 0, 0, 0},
+	{"mix:2:1:0:2", 6, 0, 2, 0, 0, 1},
+	{"mix:2:1:0:3", 6, 0, 3, 0, 0, 1},
+	{"mix:2:1:2:3", 6, 2, 3, 0, 0, 1},
+	{"mix:2:2:0:1", 6, 0, 1, 0, 0, 2},
+	{"mix:2:2:0:3", 6, 0, 3, 0, 0, 2},
+	{"mix:2:2:1:3", 6, 1, 3, 0, 0, 2},
+	{"mix:2:3:0:1", 6, 0, 1, 0, 0, 3},
+	{"mix:2:3:0:2", 6, 0, 2, 0, 0, 3},
+	{"mix:2:3:1:2", 6, 1, 2, 0, 0, 3},
+	{"mix:3:0:1:2:3", 7, 1, 2, 3, 0, 0},
+	{"mix:3:1:0:2:3", 7, 0, 2, 3, 0, 1},
+	{"mix:3:2:0:1:3", 7, 0, 1, 3, 0, 2},
+	{"mix:3:3:0:1:2", 7, 0, 1, 2, 0, 3}
+};
+
+static int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
+{
+	struct device *dev = &chip->client->dev;
+	struct i2c_msg msg;
+	u8 buf[LP5812_DATA_LENGTH];
+	u8 reg_addr_bit8_9;
+	int ret;
+
+	/* Extract register address bits 9 and 8 for Address Byte 1 */
+	reg_addr_bit8_9 = (reg >> LP5812_REG_ADDR_HIGH_SHIFT) & LP5812_REG_ADDR_BIT_8_9_MASK;
+
+	/* Prepare payload: Address Byte 2 (bits [7:0]) and value to write */
+	buf[LP5812_DATA_BYTE_0_IDX] = (u8)(reg & LP5812_REG_ADDR_LOW_MASK);
+	buf[LP5812_DATA_BYTE_1_IDX] = val;
+
+	/* Construct I2C message for a write operation */
+	msg.addr = (chip->client->addr << LP5812_CHIP_ADDR_SHIFT) | reg_addr_bit8_9;
+	msg.flags = 0;
+	msg.len = sizeof(buf);
+	msg.buf = buf;
+
+	ret = i2c_transfer(chip->client->adapter, &msg, 1);
+	if (ret == 1)
+		return 0;
+
+	dev_err(dev, "I2C write error, ret=%d\n", ret);
+	return ret < 0 ? ret : -EIO;
+}
+
+static int lp5812_read(struct lp5812_chip *chip, u16 reg, u8 *val)
+{
+	struct device *dev = &chip->client->dev;
+	struct i2c_msg msgs[LP5812_READ_MSG_LENGTH];
+	u8 ret_val;
+	u8 reg_addr_bit8_9;
+	u8 converted_reg;
+	int ret;
+
+	/* Extract register address bits 9 and 8 for Address Byte 1 */
+	reg_addr_bit8_9 = (reg >> LP5812_REG_ADDR_HIGH_SHIFT) & LP5812_REG_ADDR_BIT_8_9_MASK;
+
+	/* Lower 8 bits go in Address Byte 2 */
+	converted_reg = (u8)(reg & LP5812_REG_ADDR_LOW_MASK);
+
+	/* Prepare I2C write message to set register address */
+	msgs[LP5812_MSG_0_IDX].addr =
+		(chip->client->addr << LP5812_CHIP_ADDR_SHIFT) | reg_addr_bit8_9;
+	msgs[LP5812_MSG_0_IDX].flags = 0;
+	msgs[LP5812_MSG_0_IDX].len = 1;
+	msgs[LP5812_MSG_0_IDX].buf = &converted_reg;
+
+	/* Prepare I2C read message to retrieve register value */
+	msgs[LP5812_MSG_1_IDX].addr =
+		(chip->client->addr << LP5812_CHIP_ADDR_SHIFT) | reg_addr_bit8_9;
+	msgs[LP5812_MSG_1_IDX].flags = I2C_M_RD;
+	msgs[LP5812_MSG_1_IDX].len = 1;
+	msgs[LP5812_MSG_1_IDX].buf = &ret_val;
+
+	ret = i2c_transfer(chip->client->adapter, msgs, LP5812_READ_MSG_LENGTH);
+	if (ret == LP5812_READ_MSG_LENGTH) {
+		*val = ret_val;
+		return 0;
+	}
+
+	dev_err(dev, "I2C read error, ret=%d\n", ret);
+	*val = 0;
+	return ret < 0 ? ret : -EIO;
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
+	ret = lp5812_read_tsd_config_status(chip, &reg_val);
+	if (ret)
+		return ret;
+
+	return reg_val & LP5812_CFG_ERR_STATUS_MASK;
+}
+
+static ssize_t parse_drive_mode(struct lp5812_chip *chip, const char *str)
+{
+	int i;
+
+	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = false;
+	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = false;
+	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = false;
+	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = false;
+
+	if (sysfs_streq(str, LP5812_MODE_DIRECT_NAME)) {
+		chip->u_drive_mode.s_drive_mode.led_mode = LP5812_MODE_DIRECT_VALUE;
+		return 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(chip_mode_map); i++) {
+		if (sysfs_streq(str, chip_mode_map[i].mode_name)) {
+			chip->u_drive_mode.s_drive_mode.led_mode = chip_mode_map[i].mode;
+			chip->u_scan_order.s_scan_order.scan_order_0 =
+				chip_mode_map[i].scan_order_0;
+			chip->u_scan_order.s_scan_order.scan_order_1 =
+				chip_mode_map[i].scan_order_1;
+			chip->u_scan_order.s_scan_order.scan_order_2 =
+				chip_mode_map[i].scan_order_2;
+			chip->u_scan_order.s_scan_order.scan_order_3 =
+				chip_mode_map[i].scan_order_3;
+
+			switch (chip_mode_map[i].selection_led) {
+			case LP5812_MODE_MIX_SELECT_LED_0:
+				chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = true;
+				break;
+			case LP5812_MODE_MIX_SELECT_LED_1:
+				chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = true;
+				break;
+			case LP5812_MODE_MIX_SELECT_LED_2:
+				chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = true;
+				break;
+			case LP5812_MODE_MIX_SELECT_LED_3:
+				chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = true;
+				break;
+			default:
+				return -EINVAL;
+			}
+
+			return 0;
+		}
+	}
+
+	return -EINVAL;
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
+static int lp5812_set_led_mode(struct lp5812_chip *chip, int led_number,
+			       enum control_mode mode)
+{
+	u8 reg_val;
+	u16 reg;
+	int ret;
+
+	if (led_number < LP5812_NUMBER_LED_IN_REG)
+		reg = chip->cfg->reg_dev_config_3.addr;
+	else
+		reg = chip->cfg->reg_dev_config_4.addr;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret)
+		return ret;
+
+	if (mode == LP5812_MODE_MANUAL)
+		reg_val &= ~(1 << (led_number % LP5812_NUMBER_LED_IN_REG));
+	else
+		reg_val |= (1 << (led_number % LP5812_NUMBER_LED_IN_REG));
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
+			return ret;
+	}
+
+	return 0;
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
+	int i, ret;
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
+					chip->led_config[chan].color_id[i];
+			mc_led_info[i].channel =
+					chip->led_config[chan].led_id[i];
+		}
+
+		led->mc_cdev.subled_info = mc_led_info;
+	} else {
+		led->cdev.brightness_set_blocking = lp5812_set_brightness;
+	}
+
+	led->chan_nr = chan;
+
+	if (chip->led_config[chan].is_sc_led) {
+		ret = devm_led_classdev_register(dev, &led->cdev);
+		if (ret == 0)
+			led->cdev.dev->platform_data = led;
+	} else {
+		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
+		if (ret == 0)
+			led->mc_cdev.led_cdev.dev->platform_data = led;
+	}
+
+	return ret;
+}
+
+static int lp5812_register_leds(struct lp5812_led *led, struct lp5812_chip *chip)
+{
+	struct lp5812_led *each;
+	int num_channels = chip->num_channels;
+	u8 reg_val;
+	u16 reg;
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
+					     chip->led_config[i].max_current[j]);
+			if (ret)
+				goto err_init_led;
+
+			ret = lp5812_manual_dc_pwm_control(chip, chip->led_config[i].led_id[j],
+							   chip->led_config[i].max_current[j],
+							   LP5812_DIMMING_ANALOG);
+			if (ret)
+				goto err_init_led;
+
+			ret = lp5812_set_led_mode(chip, chip->led_config[i].led_id[j],
+						  LP5812_MODE_MANUAL);
+			if (ret)
+				goto err_init_led;
+
+			reg = (chip->led_config[i].led_id[j] < LP5812_NUMBER_LED_IN_REG) ?
+				chip->cfg->reg_led_en_1.addr :
+				chip->cfg->reg_led_en_2.addr;
+
+			ret = lp5812_read(chip, reg, &reg_val);
+			if (ret)
+				goto err_init_led;
+
+			reg_val |= (1 << (chip->led_config[i].led_id[j] %
+				LP5812_NUMBER_LED_IN_REG));
+
+			ret = lp5812_write(chip, reg, reg_val);
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
+static int lp5812_init_device(struct lp5812_chip *chip)
+{
+	int ret;
+
+	usleep_range(LP5812_WAIT_DEVICE_STABLE_MIN, LP5812_WAIT_DEVICE_STABLE_MAX);
+
+	ret = lp5812_write(chip, chip->cfg->reg_chip_en.addr, (u8)1);
+	if (ret) {
+		dev_err(&chip->client->dev, "lp5812_enable_disable failed\n");
+		return ret;
+	}
+
+	ret = lp5812_write(chip, chip->cfg->reg_dev_config_12.addr, LP5812_LSD_LOD_START_UP);
+	if (ret) {
+		dev_err(&chip->client->dev, "write 0x0B to DEV_CONFIG12 failed\n");
+		return ret;
+	}
+
+	ret = parse_drive_mode(chip, chip->scan_mode);
+	if (ret)
+		return ret;
+
+	ret = lp5812_set_drive_mode_scan_order(chip);
+	if (ret)
+		return ret;
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
+static void lp5812_deinit_device(struct lp5812_chip *chip)
+{
+	lp5812_write(chip, chip->cfg->reg_led_en_1.addr, 0);
+	lp5812_write(chip, chip->cfg->reg_led_en_2.addr, 0);
+	lp5812_write(chip, chip->cfg->reg_chip_en.addr, 0);
+}
+
+static int lp5812_parse_led_channel(struct device_node *np,
+				    struct lp5812_led_config *cfg,
+				    int led_index, int color_number)
+{
+	int color_id = 0, reg, ret;
+	u32 max_cur = 0;
+
+	ret = of_property_read_u32(np, "reg", &reg);
+	if (ret)
+		return ret;
+
+	cfg[led_index].led_id[color_number] = reg;
+
+	of_property_read_u32(np, "led-max-microamp", &max_cur);
+	cfg[led_index].max_current[color_number] = max_cur / 100;
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
+	of_property_read_string(np, "ti,scan-mode", &chip->scan_mode);
+	of_property_read_string(np, "label", &chip->label);
+	return 0;
+}
+
+static int lp5812_probe(struct i2c_client *client)
+{
+	struct lp5812_chip *chip;
+	struct device_node *np = dev_of_node(&client->dev);
+	struct lp5812_led *led;
+	int ret;
+
+	if (!np)
+		return -EINVAL;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cfg = i2c_get_match_data(client);
+	ret = lp5812_of_populate_pdata(&client->dev, np, chip);
+	if (ret)
+		return ret;
+
+	led = devm_kcalloc(&client->dev, chip->num_channels, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	chip->client = client;
+	mutex_init(&chip->lock);
+	i2c_set_clientdata(client, led);
+
+	ret = lp5812_init_device(chip);
+	if (ret)
+		return ret;
+
+	ret = lp5812_register_leds(led, chip);
+	if (ret)
+		goto err_out;
+
+	return 0;
+
+err_out:
+	lp5812_deinit_device(chip);
+	return ret;
+}
+
+static void lp5812_remove(struct i2c_client *client)
+{
+	struct lp5812_led *led = i2c_get_clientdata(client);
+
+	lp5812_deinit_device(led->chip);
+}
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
+	}
+};
+
+static const struct of_device_id of_lp5812_match[] = {
+	{ .compatible = "ti,lp5812", .data = &lp5812_cfg },
+	{/* NULL */}
+};
+
+MODULE_DEVICE_TABLE(of, of_lp5812_match);
+
+static struct i2c_driver lp5812_driver = {
+	.driver = {
+		.name   = "lp5812",
+		.of_match_table = of_lp5812_match,
+	},
+	.probe		= lp5812_probe,
+	.remove		= lp5812_remove,
+};
+
+module_i2c_driver(lp5812_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LP5812 LED Driver");
+MODULE_AUTHOR("Jared Zhou");
+MODULE_LICENSE("GPL");
diff --git a/drivers/leds/rgb/leds-lp5812.h b/drivers/leds/rgb/leds-lp5812.h
new file mode 100644
index 000000000000..bb0a9549c151
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5812.h
@@ -0,0 +1,197 @@
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
+#define LP5812_REG_ADDR_HIGH_SHIFT			8
+#define LP5812_REG_ADDR_BIT_8_9_MASK			0x03
+#define LP5812_REG_ADDR_LOW_MASK			0xFF
+#define LP5812_CHIP_ADDR_SHIFT				2
+#define LP5812_DATA_LENGTH				2
+#define LP5812_DATA_BYTE_0_IDX				0
+#define LP5812_DATA_BYTE_1_IDX				1
+
+#define LP5812_READ_MSG_LENGTH				2
+#define LP5812_MSG_0_IDX				0
+#define LP5812_MSG_1_IDX				1
+#define LP5812_CFG_ERR_STATUS_MASK			0x01
+#define LP5812_CFG_TSD_STATUS_SHIFT			1
+#define LP5812_CFG_TSD_STATUS_MASK			0x01
+
+#define LP5812_FAULT_CLEAR_LOD				0
+#define LP5812_FAULT_CLEAR_LSD				1
+#define LP5812_FAULT_CLEAR_TSD				2
+#define LP5812_FAULT_CLEAR_ALL				3
+#define LP5812_NUMBER_LED_IN_REG			8
+
+#define LP5812_WAIT_DEVICE_STABLE_MIN			1000
+#define LP5812_WAIT_DEVICE_STABLE_MAX			1100
+
+#define LP5812_LSD_LOD_START_UP				0x0B
+#define LP5812_MODE_NAME_MAX_LEN			20
+#define LP5812_MODE_DIRECT_NAME				"direct_mode"
+#define LP5812_MODE_DIRECT_VALUE			0
+#define LP5812_MODE_MIX_SELECT_LED_0			0
+#define LP5812_MODE_MIX_SELECT_LED_1			1
+#define LP5812_MODE_MIX_SELECT_LED_2			2
+#define LP5812_MODE_MIX_SELECT_LED_3			3
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
+struct lp5812_mode_mapping {
+	char mode_name[LP5812_MODE_NAME_MAX_LEN];
+	u8 mode;
+	u8 scan_order_0;
+	u8 scan_order_1;
+	u8 scan_order_2;
+	u8 scan_order_3;
+	u8 selection_led;
+};
+
+struct lp5812_led_config {
+	bool is_sc_led;
+	const char *name;
+	u8 color_id[LED_COLOR_ID_MAX];
+	u32 max_current[LED_COLOR_ID_MAX];
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
+	const char *scan_mode;
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
+};
+
+#endif /*_LP5812_H_*/
-- 
2.25.1


