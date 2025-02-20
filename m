Return-Path: <linux-leds+bounces-4039-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD6BA3E39F
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 19:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F190F17241D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 18:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B7E1FDA7B;
	Thu, 20 Feb 2025 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0BGXkNm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB741DED51;
	Thu, 20 Feb 2025 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075411; cv=none; b=URiIDT5jYROrDnxj8C8dPkYR13h8Z59XKF7JEB5kp2FVW2tzjRVolF0WpCPswKxVc/+84prPMYTu2JIBpcYdMEk5bwtCVwUxMbINSoA4GakC6vbTn8V36CBoqqPr+NhQtvOKObFOd3h4ztkSAUYRf6a7we5JYsEwuEHKIqDWzUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075411; c=relaxed/simple;
	bh=f/KIm4hBIsAb+bVVgj0De9yCaLBsB3ypRcHHwm2rz1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j+sUsqyXPaSm+60uYuuj2qGSG+puj0YZkuZjbTRRC/A9A3xSKPMYlMUfVBtfJOPWu/tAsXpZPzs7/i200c13nbHmPue1ZmSMB7K2GDYy5OT4tfFuY4V8Aegs95qPDxu5TLfRkwy0CG1DteRkwviYFKm210tve8fR+8XTJK2+lU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0BGXkNm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220d28c215eso19987915ad.1;
        Thu, 20 Feb 2025 10:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740075406; x=1740680206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sr+R3M29tQ58HRvwV76/Gx7hSqKCX2Ei4fh0Zi5C9wU=;
        b=m0BGXkNmDHtxhIh+DVDI9VZawOjmbeWb/OuO2TL4f4uKELV84qaE9oJmeLZpO1SctS
         wNZ9fkoblZraySgsBn2qR3RmC01jXxrG9RJe7s09GUVuwXyuukuiJJLlCbVjteCsc9zU
         12IIYAirr37dY/vHnTIvfLxBYwtYbVaIKO6vFA7LTsphOXcJaTc29NF4ndpjA35fe6L3
         xHTyf5nXlo2UOWl8xtG36sjdNv/+IKluaK8SdcMWAcBBezvUuLi5gCNwQvtH4ui65IcC
         sg2Z4/DFUNlBkABuUxPAFBH+eFTwERDISxabxycoyRZ/RzrLXDjjd5SiecdlecUy0+HW
         1YYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075406; x=1740680206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sr+R3M29tQ58HRvwV76/Gx7hSqKCX2Ei4fh0Zi5C9wU=;
        b=ianAfMH0G/ob48jW2typVAp13nfbCAYa1QTd97n55/nbehvnVtqOfzEBwTJqkEMoWQ
         44wOlTyvMXu3DnFlCDrLQNwdMRkQVxUFLdH7JDqID+PMLdjrthqQXZTSea8ZNeS8dPzn
         Mm10Ua1cdM4SyGXUDMaaJBFCO7qGbulbALZ56ilhBAHDRsvto4mCicQiVSA6sEt7TT9V
         Cn+OOKlPJ8j6GDhLrRLJKnXMJQxa9S3RrK8edJo1qtEBdbfSUgRBxbqLUfheRJ3WVmMT
         SGpQvcY6ezpQEIFa+/1AvV/EUAb3C/5D0p6Tlhd5hLnqzTmq972fTDIDGyAbd69Wh0Fc
         v8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWciWmYbkvrMC6eUA5iqYMHFBTHTcNuBFgHD4uX4N5NZ4ufRpfEhymrvr+hFzNktP+aK/SQGIP9FypfbfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWW1kMAr0ioKTzvGm46PauOg+uD5XscMyOQbtHtyjsd5c4dNWa
	aJDSRjlYX8N6PziUsyGkjoCBKVTv9zQ+GFh0kEQnrDZgfBkRah0bsXhPMK1H
X-Gm-Gg: ASbGncuz+7JbjZcwls2nUMFdGpY9UasXxRz0kcm8ZkS86bGKyyhQcX+co4yj+O8nJTX
	e14SwaKaATt/+UhsiH2KeaqdigdIclIaQrgaMLo7gUikzk1kscdOg7qvQaZxRaVoDt4oqa3EUxA
	yRCUGcM3ApD3V2C1MU+HTwkHZhwsDKJTojUh+9f2xwTv9xrBI7zp12NsjB5Psr2SVE7/CCM3dZe
	mI5N9N4MV98tLBpmhREX085P/kOD/oGBqbX6hCxlGbYFdxrIiqgXS/+uNviTWNuWi7d4AEBfW+2
	csEe2toqxSXhKTYuujnUnrhEfKpKeAZr53eP
X-Google-Smtp-Source: AGHT+IFGGu1jt2mYpLYAnyfzNr5FGz630qV56L8sLMZuIFbpTqYU+gWKj3Q40ZFVkNFXKgHhd5WlxA==
X-Received: by 2002:a05:6a00:124f:b0:732:5935:c219 with SMTP id d2e1a72fcca58-7326177d652mr40349639b3a.3.1740075405114;
        Thu, 20 Feb 2025 10:16:45 -0800 (PST)
Received: from DESKTOP-P76LG1N.localdomain ([14.162.192.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326ea62b03sm9457853b3a.70.2025.02.20.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 10:16:44 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v1 2/2] leds: add new LED driver for TI LP5812
Date: Fri, 21 Feb 2025 01:15:41 +0700
Message-Id: <20250220181541.2341-3-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220181541.2341-1-trannamatk@gmail.com>
References: <20250220181541.2341-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chip can drive LED matrix 4x3.
This driver uses I2C to communicate with the chip.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 MAINTAINERS                       |    6 +
 drivers/leds/Kconfig              |   13 +
 drivers/leds/Makefile             |    2 +
 drivers/leds/leds-lp5812-common.c | 1097 ++++++++++++++
 drivers/leds/leds-lp5812-common.h |  323 ++++
 drivers/leds/leds-lp5812-regs.h   |   96 ++
 drivers/leds/leds-lp5812.c        | 2319 +++++++++++++++++++++++++++++
 7 files changed, 3856 insertions(+)
 create mode 100644 drivers/leds/leds-lp5812-common.c
 create mode 100644 drivers/leds/leds-lp5812-common.h
 create mode 100644 drivers/leds/leds-lp5812-regs.h
 create mode 100644 drivers/leds/leds-lp5812.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7efbd6f0c79e..d357383c2ad3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23494,6 +23494,12 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/leds-lp5812.yaml
+F:	drivers/leds/Kconfig
+F:	drivers/leds/Makefile
+F:	drivers/leds/leds-lp5812-common.c
+F:	drivers/leds/leds-lp5812-common.h
+F:	drivers/leds/leds-lp5812-regs.h
+F:	drivers/leds/leds-lp5812.c
 
 TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
 M:	Nishanth Menon <nm@ti.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 2b27d043921c..e43dbd5a4d8c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -483,6 +483,19 @@ config LEDS_LP5569
 	  Driver provides direct control via LED class and interface for
 	  programming the engines.
 
+config LEDS_LP5812
+	bool "Enable LP5812 support LED matrix 4x3"
+	depends on LEDS_CLASS && I2C
+	depends on LEDS_CLASS_MULTICOLOR
+	help
+	  If you say Y here you get support for TI LP5812 LED driver.
+
+	  The LP5812 is an I2C-based RGB LED driver that supports a 4x3 LED matrix.
+	  It provides independent brightness control and color mixing for each LED.
+	  This driver integrates with the Linux LED framework and LED multicolor class.
+
+	  If unsure, say N.
+
 config LEDS_LP8501
 	tristate "LED Support for TI LP8501 LED driver chip"
 	depends on LEDS_CLASS && I2C
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 6ad52e219ec6..2b95463c9ba7 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -54,6 +54,8 @@ obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
 obj-$(CONFIG_LEDS_LP5562)		+= leds-lp5562.o
 obj-$(CONFIG_LEDS_LP5569)		+= leds-lp5569.o
 obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
+obj-$(CONFIG_LEDS_LP5812) 		+= leds-lp5812.o
+leds-lp5812-objs				:= leds-lp5812.o leds-lp5812-common.o
 obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
 obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
diff --git a/drivers/leds/leds-lp5812-common.c b/drivers/leds/leds-lp5812-common.c
new file mode 100644
index 000000000000..b20e3c56e03b
--- /dev/null
+++ b/drivers/leds/leds-lp5812-common.c
@@ -0,0 +1,1097 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LP5812 Common Driver
+ *
+ * Copyright (C) 2025 Texas Instruments
+ *
+ * Author: Jared Zhou <jared-zhou@ti.com>
+ */
+
+#include "leds-lp5812-common.h"
+
+/*
+ * Function: lp5812_write
+ * Params:
+ * Return: 0 if success
+ */
+int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
+{
+	int ret;
+	u8 extracted_bits; /* save 9th and 8th bit of reg address */
+	struct i2c_msg msg;
+	u8 buf[2] = {(u8)(reg & 0xFF), val};
+
+	extracted_bits = (reg >> 8) & 0x03;
+	msg.addr = (chip->i2c_cl->addr << 2) | extracted_bits;
+	msg.flags = 0;
+	msg.len = sizeof(buf);
+	msg.buf = buf;
+
+	ret = i2c_transfer(chip->i2c_cl->adapter, &msg, 1);
+	if (ret != 1) {
+		pr_err("i2c write error, ret=%d\n", ret);
+		ret = ret < 0 ? ret : -EIO;
+	} else {
+		ret = 0;
+	}
+
+	return ret;
+}
+
+int lp5812_read(struct lp5812_chip *chip, u16 reg, u8 *val)
+{
+	int ret;
+	u8 ret_val;  /* lp5812_chip return value */
+	u8 extracted_bits; /* save 9th and 8th bit of reg address */
+	u8 converted_reg;  /* extracted 8bit from reg */
+	struct i2c_msg msgs[2];
+
+	extracted_bits = (reg >> 8) & 0x03;
+	converted_reg = (u8)(reg & 0xFF);
+
+	msgs[0].addr = (chip->i2c_cl->addr << 2) | extracted_bits;
+	msgs[0].flags = 0;
+	msgs[0].len = 1;
+	msgs[0].buf = &converted_reg;
+
+	msgs[1].addr = (chip->i2c_cl->addr << 2) | extracted_bits;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = 1;
+	msgs[1].buf = &ret_val;
+
+	ret = i2c_transfer(chip->i2c_cl->adapter, msgs, 2);
+	if (ret != 2) {
+		pr_err("Read reg value error, ret=%d\n", ret);
+		*val = 0;
+		ret = ret < 0 ? ret : -EIO;
+	} else {
+		*val = ret_val;
+		ret = 0;
+	}
+
+	return ret;
+}
+
+int lp5812_update_bit(struct lp5812_chip *chip, u16 reg, u8 mask, u8 val)
+{
+	int ret;
+	u8 tmp;
+
+	ret = lp5812_read(chip, reg, &tmp);
+	if (ret)
+		return ret;
+
+	tmp &= ~mask;
+	tmp |= val & mask;
+
+	return lp5812_write(chip, reg, tmp);
+}
+
+/*
+ * Function: lp5812_read_tsd_config_status
+ * Description: read tsd config status register
+ * Param: chip --> struct lp5812_chip itself
+ *        reg_val
+ * Return: 0 if success
+ */
+int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)
+{
+	int ret = 0;
+
+	if (!reg_val)
+		return -1;
+
+	ret = lp5812_read(chip, chip->regs->tsd_config_status_reg, reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed\n",
+				chip->regs->tsd_config_status_reg);
+	}
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_update_regs_config
+ * Description: update reg config register
+ * Param: chip --> struct lp5812_chip itself
+ * Return: 0 if success
+ */
+int lp5812_update_regs_config(struct lp5812_chip *chip)
+{
+	int ret;
+	u8 reg_val; /* save register value */
+
+	/* Send update command to update config setting */
+	ret = lp5812_write(chip, chip->regs->update_cmd_reg, UPDATE_CMD_VAL);
+	if (ret) {
+		pr_info("[DEBUG]: Send update command failed\n");
+		return ret;
+	}
+	/* check if the configuration is proper */
+	ret = lp5812_read_tsd_config_status(chip, &reg_val);
+	if (ret == 0) {
+		pr_info("[DEBUG]: tsd_config_status_reg: %d\n", (int)reg_val);
+		return (int)(reg_val & 0x01);
+	}
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_read_lod_status
+ * Description: read lod status register
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number --> int
+ *        val -> u8 *
+ * Return: 0 if success
+ */
+int lp5812_read_lod_status(struct lp5812_chip *chip, int led_number, u8 *val)
+{
+	int ret = 0;
+	u16 reg = 0;
+	u8 reg_val = 0;
+
+	if (!val)
+		return -1;
+
+	if (led_number < 0x8)
+		reg = LOD_STAT_1_REG;
+	else
+		reg = LOD_STAT_2_REG;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	*val = (reg_val & (1 << (led_number % 8))) ? 1 : 0;
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_read_lsd_status
+ * Description: read lsd status register
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number --> int
+ *        val -> u8 *
+ * Return: 0 if success
+ */
+int lp5812_read_lsd_status(struct lp5812_chip *chip, int led_number, u8 *val)
+{
+	int ret = 0;
+	u16 reg = 0;
+	u8 reg_val = 0;
+
+	if (!val)
+		return -1;
+
+	if (led_number < 0x8)
+		reg = LSD_STAT_1_REG;
+	else
+		reg = LSD_STAT_2_REG;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	*val = (reg_val & (1 << (led_number % 8))) ? 1 : 0;
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_read_auto_pwm_value
+ * Description: read pwm value in autonomous mode
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number --> int
+ *        val -> u8 *
+ * Return: 0 if success
+ */
+int lp5812_read_auto_pwm_value(struct lp5812_chip *chip, int led_number,
+		u8 *val)
+{
+	int ret = 0;
+	u16 reg = 0;
+	u8 reg_val = 0;
+
+	reg = AUTO_PWM_BASE_ADDR + led_number;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	*val = reg_val;
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_read_aep_status
+ * Description: read autonomous engine pattern status
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number --> int
+ *        val -> u8 *
+ * Return: 0 if success
+ */
+int lp5812_read_aep_status(struct lp5812_chip *chip, int led_number, u8 *val)
+{
+	int ret = 0;
+	u16 reg;
+	u8 reg_val;
+
+	switch (led_number / 2) {
+	case 0:
+		reg = AEP_STATUS_0_REG; // LED_0 and LED_1
+		break;
+	case 1:
+		reg = AEP_STATUS_1_REG; // LED_2 and LED_3
+		break;
+	case 2:
+		reg = AEP_STATUS_2_REG; // LED_A0 and LED_A1
+		break;
+	case 3:
+		reg = AEP_STATUS_3_REG; // LED_A2 and LED_B0
+		break;
+	case 4:
+		reg = AEP_STATUS_4_REG; // LED_B1 and LED_B2
+		break;
+	case 5:
+		reg = AEP_STATUS_5_REG; // LED_C0 and LED_C1
+		break;
+	case 6:
+		reg = AEP_STATUS_6_REG; // LED_C2 and LED_D0
+		break;
+	case 7:
+		reg = AEP_STATUS_7_REG; // LED_D1 and LED_D2
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	*val = (led_number % 2) ? ((reg_val >> 3) & 0x07) : (reg_val & 0x07);
+
+	return ret;
+}
+
+int lp5812_enable_disable(struct lp5812_chip *chip, int enable)
+{
+	return lp5812_write(chip, chip->regs->enable_reg, (u8)enable);
+}
+
+int lp5812_reset(struct lp5812_chip *chip)
+{
+	return lp5812_write(chip, chip->regs->reset_reg, RESET_REG_VAL);
+}
+
+int lp5812_fault_clear(struct lp5812_chip *chip, u8 value)
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
+	return lp5812_write(chip, chip->regs->fault_clear_reg, reg_val);
+}
+
+void lp5812_dump_regs(struct lp5812_chip *chip, u16 from_reg, u16 to_reg)
+{
+	u16 reg_addr;
+	u8 reg_val;
+
+	for (reg_addr = from_reg; reg_addr <= to_reg; reg_addr++) {
+		lp5812_read(chip, reg_addr, &reg_val);
+		pr_info("reg addr: 0x%02X, value: 0x%02X\n", reg_addr,
+				reg_val);
+	}
+}
+
+int lp5812_device_command(struct lp5812_chip *chip, enum device_command command)
+{
+	switch (command) {
+	case UPDATE:
+		return lp5812_write(chip, chip->regs->update_cmd_reg,
+				UPDATE_CMD_VAL);
+	case START:
+		return lp5812_write(chip, chip->regs->start_cmd_reg,
+				START_CMD_VAL);
+	case STOP:
+		return lp5812_write(chip, chip->regs->stop_cmd_reg,
+				STOP_CMD_VAL);
+	case PAUSE:
+		return lp5812_write(chip, chip->regs->pause_cmd_reg,
+				PAUSE_CMD_VAL);
+	case CONTINUE:
+		return lp5812_write(chip, chip->regs->continue_cmd_reg,
+				CONTINUE_CMD_VAL);
+	default:
+		return -EINVAL;
+	}
+}
+
+/*
+ * Function: lp5812_set_pwm_dimming_scale
+ * Description: set led as pwm Linear or exponential dimming scale
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number
+ *        scale: enum type (LINEAR or EXPONENTIAL)
+ * Return: 0 if success
+ */
+int lp5812_set_pwm_dimming_scale(struct lp5812_chip *chip, int led_number,
+		enum pwm_dimming_scale scale)
+{
+	int ret = 0;
+	u16 reg;
+	u8 reg_val;
+
+	if (led_number <= 7)
+		reg = (u16)DEV_CONFIG5;
+	else
+		reg = (u16)DEV_CONFIG6;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: Read register 0x%02X failed\n", reg);
+		return ret;
+	}
+	if (scale == LINEAR) {
+		reg_val &= ~(1 << (led_number % 8));
+		ret = lp5812_write(chip, reg, reg_val);
+		if (ret != 0) {
+			pr_info("[DEBUG]: set %d to reg 0x%X failed\n",
+					reg_val, reg);
+			return ret;
+		}
+	} else {
+		reg_val |= (1 << (led_number % 8));
+		ret = lp5812_write(chip, reg, reg_val);
+		if (ret != 0) {
+			pr_info("[DEBUG]: set %d to reg 0x%X failed\n",
+					reg_val, reg);
+			return ret;
+		}
+	}
+
+	ret = lp5812_update_regs_config(chip);
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_get_pwm_dimming_scale
+ * Description: get lp5812 led pwm dimming scale
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number
+ *        scale: enum type (LINEAR or EXPONENTIAL)
+ * Return: 0 if success
+ */
+int lp5812_get_pwm_dimming_scale(struct lp5812_chip *chip,
+		int led_number, enum pwm_dimming_scale *scale)
+{
+	int ret = 0;
+	u16 reg;
+	u8 reg_val;
+
+	if (led_number < 0x8)
+		reg = DEV_CONFIG5;
+	else
+		reg = DEV_CONFIG6;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	*scale = (reg_val & (1 << (led_number % 8))) ? EXPONENTIAL : LINEAR;
+
+	return 0;
+}
+
+/*
+ * Function: lp5812_set_phase_align
+ * Description: set phase align for led (forward, middle, backward)
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number
+ *        phase_align_val: 0,1,2,3
+ * Return: 0 if success
+ */
+int lp5812_set_phase_align(struct lp5812_chip *chip, int led_number,
+		int phase_align_val)
+{
+	int ret;
+	int bit_pos;
+	u16 reg;
+	u8 reg_val;
+
+	reg = DEV_CONFIG7 + (led_number / 4);
+	bit_pos = (led_number % 4) * 2;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed: %d\n", reg, ret);
+		return ret;
+	}
+	reg_val |= (phase_align_val << bit_pos);
+	ret = lp5812_write(chip, reg, reg_val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: set %d to reg 0x%X failed\n",
+				reg_val, reg);
+		return ret;
+	}
+	ret = lp5812_update_regs_config(chip);
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_get_phase_align
+ * Description: get phase align of led
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number
+ *        *phase_align_val: Return 0,1,2,3
+ * Return: 0 if success
+ */
+int lp5812_get_phase_align(struct lp5812_chip *chip, int led_number,
+		int *phase_align_val)
+{
+	int ret;
+	int bit_pos;
+	u16 reg;
+	u8 reg_val;
+
+	reg = DEV_CONFIG7 + (led_number / 4);
+	bit_pos = (led_number % 4) * 2;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	*phase_align_val = (reg_val >> bit_pos) & 0x03;
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_get_led_mode
+ * Description: get lp5812 led mode
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number
+ *        mode: enum type (MANUAL or AUTONOMOUS)
+ * Return: 0 if success
+ */
+int lp5812_get_led_mode(struct lp5812_chip *chip,
+		int led_number, enum control_mode *mode)
+{
+	int ret = 0;
+	u16 reg;
+	u8 reg_val;
+
+	if (led_number < 0x8)
+		reg = DEV_CONFIG3;
+	else
+		reg = DEV_CONFIG4;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret) {
+		pr_err("Read register 0x%02X failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	*mode = (reg_val & (1 << (led_number % 8))) ? AUTONOMOUS : MANUAL;
+
+	return 0;
+}
+
+/*
+ * Function: lp5812_set_led_mode
+ * Description: set lp5812 as manual or autonomous mode
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number
+ *        mode: enum type (MANUAL or AUTONOMOUS)
+ * Return: 0 if success
+ */
+int lp5812_set_led_mode(struct lp5812_chip *chip, int led_number,
+		enum control_mode mode)
+{
+	int ret = 0;
+	u16 reg;
+	u8 reg_val;
+
+	if (led_number <= 7)
+		reg = (u16)DEV_CONFIG3;
+	else
+		reg = (u16)DEV_CONFIG4;
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: Read register 0x%02X failed\n", reg);
+		return ret;
+	}
+	if (mode == MANUAL) {
+		reg_val &= ~(1 << (led_number % 8));
+		ret = lp5812_write(chip, reg, reg_val);
+		if (ret != 0) {
+			pr_info("[DEBUG]: set %d to reg 0x%X failed\n",
+					reg_val, reg);
+			return ret;
+		}
+	} else {
+		reg_val |= (1 << (led_number % 8));
+		ret = lp5812_write(chip, reg, reg_val);
+		if (ret != 0) {
+			pr_info("[DEBUG]: set %d to reg 0x%X failed\n",
+					reg_val, reg);
+			return ret;
+		}
+	}
+
+	ret = lp5812_update_regs_config(chip);
+
+	return ret;
+}
+
+/*
+ * Function: lp5812_manual_dc_pwm_control
+ * Description: manual control for analog or pwm dimming type
+ * Param: chip --> struct lp5812_chip itself
+ *        led_number --> led_number need to control (0,1,2,3)
+ *        val  --> 0 -> 255
+ *        dimming_type --> enum(ANALOG, PWM)
+ * Return: 0 if success
+ */
+int lp5812_manual_dc_pwm_control(struct lp5812_chip *chip,
+		int led_number, u8 val, enum dimming_type dimming_type)
+{
+	int ret;
+	u16 led_base_reg;
+
+	if (dimming_type == ANALOG)
+		led_base_reg = (u16)MANUAL_DC_LED_0_REG;
+	else
+		led_base_reg = (u16)MANUAL_PWM_LED_0_REG;
+	ret = lp5812_write(chip, led_base_reg + led_number, val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: write %d to register: %X failed\n", val,
+				led_base_reg + led_number);
+	}
+
+	return ret;
+}
+
+int lp5812_manual_dc_pwm_read(struct lp5812_chip *chip,
+		int led_number, u8 *val, enum dimming_type dimming_type)
+{
+	int ret;
+	u16 led_base_reg;
+
+	if (dimming_type == ANALOG)
+		led_base_reg = (u16)MANUAL_DC_LED_0_REG;
+	else
+		led_base_reg = (u16)MANUAL_PWM_LED_0_REG;
+	ret = lp5812_read(chip, led_base_reg + led_number, val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: read from register: %X failed\n",
+				led_base_reg + led_number);
+	}
+
+	return ret;
+}
+
+int lp5812_autonomous_dc_pwm_control(struct lp5812_chip *chip,
+		int led_number, u8 val, enum dimming_type dimming_type)
+{
+	int ret;
+	u16 led_base_reg;
+
+	led_base_reg = (u16)AUTO_DC_LED_0_REG;
+	ret = lp5812_write(chip, led_base_reg + led_number, val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: write %d to register: %X failed\n", val,
+				led_base_reg + led_number);
+	}
+
+	return ret;
+}
+
+int lp5812_autonomous_dc_pwm_read(struct lp5812_chip *chip,
+		int led_number, u8 *val, enum dimming_type dimming_type)
+{
+	int ret;
+	u16 led_base_reg;
+
+	led_base_reg = (u16)AUTO_DC_LED_0_REG;
+	ret = lp5812_read(chip, led_base_reg + led_number, val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: read from register: %X failed\n",
+				led_base_reg + led_number);
+	}
+
+	return ret;
+}
+
+int lp5812_disable_all_leds(struct lp5812_chip *chip)
+{
+	int ret = 0;
+
+	ret = lp5812_write(chip, (u16)LED_ENABLE_1_REG, 0x00);
+	if (ret != 0) {
+		pr_info("[DEBUG]: write 0x00 to LED_ENABLE_1_REG failed\n");
+		return ret;
+	}
+	ret = lp5812_write(chip, (u16)LED_ENABLE_2_REG, 0x00);
+	if (ret != 0) {
+		pr_info("[DEBUG]: write 0x00 to LED_ENABLE_2_REG failed\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+int lp5812_get_drive_mode_scan_order(struct lp5812_chip *chip)
+{
+	u8 val;
+	int ret = 0;
+
+	/* get led mode */
+	ret = lp5812_read(chip, (u16)DEV_CONFIG1, &val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: get value from reg DEV_CONFIG1 failed\n");
+		return ret;
+	}
+	chip->u_drive_mode.drive_mode_val = val;
+	pr_info("[DEBUG]: get drive_mode_val %d\n",
+		chip->u_drive_mode.drive_mode_val);
+
+	/* get scan order */
+	ret = lp5812_read(chip, (u16)DEV_CONFIG2, &val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: get value from reg DEV_CONFIG2 failed\n");
+		return ret;
+	}
+	chip->u_scan_order.scan_order_val = val;
+	pr_info("[DEBUG]: get scan_order_val: %d\n",
+		chip->u_scan_order.scan_order_val);
+
+	return ret;
+}
+
+int lp5812_set_drive_mode_scan_order(struct lp5812_chip *chip)
+{
+	u8 val;
+	int ret = 0;
+
+	/* Set led mode */
+	val = chip->u_drive_mode.drive_mode_val;
+	pr_info("[DEBUG]: set drive_mode_val: 0x%02X\n", val);
+	ret = lp5812_write(chip, (u16)DEV_CONFIG1, val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: write %d to DEV_CONFIG1 failed\n", val);
+		return ret;
+	}
+
+	/* Setup scan order */
+	val = chip->u_scan_order.scan_order_val;
+	pr_info("[DEBUG]: set scan_order_val: 0x%02X\n", val);
+	ret = lp5812_write(chip, (u16)DEV_CONFIG2, val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: write %d to DEV_CONFIG2 failed\n", val);
+		return ret;
+	}
+
+	return ret;
+}
+
+int lp5812_initialize(struct lp5812_chip *chip)
+{
+	int ret = 0;
+
+	/* wait for 1 ms */
+	usleep_range(1000, 1100);
+
+	/* enable the lp5812 */
+	ret = lp5812_enable_disable(chip, 1);
+	if (ret != 0) {
+		pr_info("[DEBUG]: lp5812_enable_disable failed\n");
+		return ret;
+	}
+	ret = lp5812_set_drive_mode_scan_order(chip);
+	if (ret != 0) {
+		pr_info("[DEBUG]: %s:\n", __func__);
+		pr_info("[DEBUG]:lp5812_set_drive_mode_scan_order failed\n");
+		return ret;
+	}
+
+	/* Set lsd_threshold = 3h to avoid incorrect LSD detection */
+	ret = lp5812_write(chip, (u16)DEV_CONFIG12, 0x0B);
+	if (ret != 0) {
+		pr_info("[DEBUG]: write 0x0B to DEV_CONFIG12 failed\n");
+		return ret;
+	}
+
+	/* Send update command to complete configuration settings */
+	ret = lp5812_update_regs_config(chip);
+	if (ret != 0) {
+		pr_info("[DEBUG]: lp5812_update_regs_config failed\n");
+		return ret;
+	}
+
+	/* Enable LED_A0 for testing */
+	ret = lp5812_write(chip, (u16)LED_ENABLE_1_REG, 0x20);
+	if (ret != 0) {
+		pr_info("[DEBUG]: write 0x10 to LED_ENABLE_1_REG failed\n");
+		return ret;
+	}
+	/* set max DC current for LED_A0 */
+	ret = lp5812_write(chip, (u16)0x35, 0x80);
+	if (ret != 0)
+		pr_info("[DEBUG]: write 0xFF to reg: 0x34 failed\n");
+
+	/* set 100% pwm cycle for LED_A0 */
+	ret = lp5812_write(chip, (u16)0x45, 0x80);
+	if (ret != 0)
+		pr_info("[DEBUG]: write 0xFF to reg: 0x44 failed\n");
+
+	return ret;
+}
+
+int led_set_autonomous_animation_config(struct lp5812_led *led)
+{
+	int ret;
+	u16 reg;
+	struct lp5812_chip *chip = led->priv;
+
+	/* Set start/end pause */
+	reg = led->anim_base_addr + AUTO_PAUSE;
+	ret = lp5812_write(chip, reg, led->start_stop_pause_time.time_val);
+	if (ret) {
+		pr_info("[DEBUG]: [%d] %s: lp5812_write failed\n", __LINE__,
+				__func__);
+		return ret;
+	}
+
+	/* Set led playback and AEU selection */
+	reg = led->anim_base_addr + AUTO_PLAYBACK;
+	ret = lp5812_write(chip, reg, led->led_playback.led_playback_val);
+	if (ret) {
+		pr_info("[DEBUG]: [%d] %s: lp5812_write failed\n", __LINE__,
+				__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+int led_get_autonomous_animation_config(struct lp5812_led *led)
+{
+	int ret;
+	u16 reg;
+	struct lp5812_chip *chip = led->priv;
+
+	/* Get start/end pause value */
+	reg = led->anim_base_addr + AUTO_PAUSE;
+	ret = lp5812_read(chip, reg, &led->start_stop_pause_time.time_val);
+	if (ret) {
+		pr_info("[DEBUG]: [%d] %s: lp5812_read failed\n", __LINE__,
+				__func__);
+		return ret;
+	}
+
+	/* Get led playback and AEU selection values */
+	reg = led->anim_base_addr + AUTO_PLAYBACK;
+	ret = lp5812_read(chip, reg, &led->led_playback.led_playback_val);
+	if (ret) {
+		pr_info("[DEBUG]: [%d] %s: lp5812_read failed\n", __LINE__,
+				__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+static u16 get_aeu_pwm_register(struct anim_engine_unit *aeu,
+		enum pwm_slope_time_num pwm_num)
+{
+	u16 reg;
+	struct lp5812_led *led = aeu->led;
+
+	switch (pwm_num) {
+	case PWM1:
+		if (aeu->aeu_number == 1)
+			reg = led->anim_base_addr + AEU1_PWM_1;
+		else if (aeu->aeu_number == 2)
+			reg = led->anim_base_addr + AEU2_PWM_1;
+		else
+			reg = led->anim_base_addr + AEU3_PWM_1;
+		break;
+	case PWM2:
+		if (aeu->aeu_number == 1)
+			reg = led->anim_base_addr + AEU1_PWM_2;
+		else if (aeu->aeu_number == 2)
+			reg = led->anim_base_addr + AEU2_PWM_2;
+		else
+			reg = led->anim_base_addr + AEU3_PWM_2;
+		break;
+	case PWM3:
+		if (aeu->aeu_number == 1)
+			reg = led->anim_base_addr + AEU1_PWM_3;
+		else if (aeu->aeu_number == 2)
+			reg = led->anim_base_addr + AEU2_PWM_3;
+		else
+			reg = led->anim_base_addr + AEU3_PWM_3;
+		break;
+	case PWM4:
+		if (aeu->aeu_number == 1)
+			reg = led->anim_base_addr + AEU1_PWM_4;
+		else if (aeu->aeu_number == 2)
+			reg = led->anim_base_addr + AEU2_PWM_4;
+		else
+			reg = led->anim_base_addr + AEU3_PWM_4;
+		break;
+	case PWM5:
+		if (aeu->aeu_number == 1)
+			reg = led->anim_base_addr + AEU1_PWM_5;
+		else if (aeu->aeu_number == 2)
+			reg = led->anim_base_addr + AEU2_PWM_5;
+		else
+			reg = led->anim_base_addr + AEU3_PWM_5;
+		break;
+	default:
+		reg = led->anim_base_addr;
+		break;
+	}
+
+	return reg;
+}
+
+static u16 get_aeu_slope_time_register(struct anim_engine_unit *aeu,
+		enum pwm_slope_time_num slope_time_num)
+{
+	u16 reg;
+	struct lp5812_led *led = aeu->led;
+
+	switch (slope_time_num) {
+	case SLOPE_T1:
+	case SLOPE_T2:
+		if (aeu->aeu_number == 1)
+			reg = led->anim_base_addr + AEU1_T12;
+		else if (aeu->aeu_number == 2)
+			reg = led->anim_base_addr + AEU2_T12;
+		else
+			reg = led->anim_base_addr + AEU3_T12;
+		break;
+	case SLOPE_T3:
+	case SLOPE_T4:
+		if (aeu->aeu_number == 1)
+			reg = led->anim_base_addr + AEU1_T34;
+		else if (aeu->aeu_number == 2)
+			reg = led->anim_base_addr + AEU2_T34;
+		else
+			reg = led->anim_base_addr + AEU3_T34;
+		break;
+	default:
+		reg = led->anim_base_addr;
+		break;
+	}
+
+	return reg;
+}
+
+static u16 get_aeu_playback_time_register(struct anim_engine_unit *aeu)
+{
+	u16 reg;
+	struct lp5812_led *led = aeu->led;
+
+	if (aeu->aeu_number == 1)
+		reg = led->anim_base_addr + AEU1_PLAYBACK;
+	else if (aeu->aeu_number == 2)
+		reg = led->anim_base_addr + AEU2_PLAYBACK;
+	else
+		reg = led->anim_base_addr + AEU3_PLAYBACK;
+
+	return reg;
+}
+
+/* Function: led_aeu_pwm_set_val
+ * Description: set led AEU pwm value
+ * Params: aeu -> struct anim_engine_unit itself
+ *         val: 0-255
+ *         pwm_num: enum(PWM1 ... PWM5)
+ * Return 0 if success
+ */
+int led_aeu_pwm_set_val(struct anim_engine_unit *aeu, u8 val,
+		enum pwm_slope_time_num pwm_num)
+{
+	int ret;
+	u16 reg;
+	struct lp5812_led *led = aeu->led;
+	struct lp5812_chip *chip = led->priv;
+
+	reg = get_aeu_pwm_register(aeu, pwm_num);
+	ret = lp5812_write(chip, reg, val);
+	if (ret != 0)
+		pr_info("[DEBUG]: %s: lp5812_write failed\n", __func__);
+
+	return ret;
+}
+
+/* Function: led_aeu_pwm_get_val
+ * Description: get led AEU pwm value
+ * Params: aeu -> struct anim_engine_unit itself
+ *         val: return back 0-255
+ *         pwm_num: enum(PWM1 ... PWM5)
+ * Return 0 if success
+ */
+int led_aeu_pwm_get_val(struct anim_engine_unit *aeu, u8 *val,
+		enum pwm_slope_time_num pwm_num)
+{
+	int ret;
+	u16 reg;
+	struct lp5812_led *led = aeu->led;
+	struct lp5812_chip *chip = led->priv;
+
+	reg = get_aeu_pwm_register(aeu, pwm_num);
+	ret = lp5812_read(chip, reg, val);
+	if (ret != 0)
+		pr_info("[DEBUG]: %s: lp5812_read failed\n", __func__);
+
+	return ret;
+}
+
+/* Function: led_aeu_slope_time_set_val
+ * Description: set led AEU slope time value
+ * Params: aeu -> struct anim_engine_unit itself
+ *         val: 0 -> 15
+ *         slope_time_num: enum(SLOPE_T1 ... SLOPE_T4)
+ * Return 0 if success
+ */
+int led_aeu_slope_time_set_val(struct anim_engine_unit *aeu, u8 val,
+		enum pwm_slope_time_num slope_time_num)
+{
+	int ret;
+	u16 reg;
+	union time slope_time_val;
+	struct lp5812_led *led = aeu->led;
+	struct lp5812_chip *chip = led->priv;
+
+	reg = get_aeu_slope_time_register(aeu, slope_time_num);
+
+	/* get original value of slope time */
+	ret = lp5812_read(chip, reg, &slope_time_val.time_val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: %s: lp5812_read failed\n", __func__);
+		return ret;
+	}
+
+	/* Update new value for slope time*/
+	if (slope_time_num == SLOPE_T1 || slope_time_num == SLOPE_T3)
+		slope_time_val.s_time.first = val;
+	if (slope_time_num == SLOPE_T2 || slope_time_num == SLOPE_T4)
+		slope_time_val.s_time.second = val;
+
+	/* Save updated value to hardware */
+	ret = lp5812_write(chip, reg, slope_time_val.time_val);
+	if (ret != 0)
+		pr_info("[DEBUG]: %s: lp5812_write failed\n", __func__);
+
+	return ret;
+}
+
+/* Function: led_aeu_slope_time_get_val
+ * Description: get led AEU slope time value
+ * Params: aeu -> struct anim_engine_unit itself
+ *         val: return back 0 -> 15
+ *         slope_time_num: enum(SLOPE_T1 ... SLOPE_T4)
+ * Return 0 if success
+ */
+int led_aeu_slope_time_get_val(struct anim_engine_unit *aeu, u8 *val,
+		enum pwm_slope_time_num slope_time_num)
+{
+	int ret = 0;
+	u16 reg;
+	union time slope_time_val;
+	struct lp5812_led *led = aeu->led;
+	struct lp5812_chip *chip = led->priv;
+
+	reg = get_aeu_slope_time_register(aeu, slope_time_num);
+	/* get slope time value */
+	ret = lp5812_read(chip, reg, &slope_time_val.time_val);
+	if (ret != 0) {
+		pr_info("[DEBUG]: %s: lp5812_read failed\n", __func__);
+		return ret;
+	}
+
+	if (slope_time_num == SLOPE_T1 || slope_time_num == SLOPE_T3)
+		*val = slope_time_val.s_time.first;
+
+	if (slope_time_num == SLOPE_T2 || slope_time_num == SLOPE_T4)
+		*val = slope_time_val.s_time.second;
+
+	return ret;
+}
+
+/* Function: led_aeu_playback_time_set_val
+ * Description: set aeu playback time value
+ * Params: aeu -> struct anim_engine_unit itself
+ *         val: 0 -> 3
+ * Return 0 if success
+ */
+int led_aeu_playback_time_set_val(struct anim_engine_unit *aeu, u8 val)
+{
+	int ret;
+	u16 reg;
+	struct lp5812_led *led = aeu->led;
+	struct lp5812_chip *chip = led->priv;
+
+	reg = get_aeu_playback_time_register(aeu);
+	ret = lp5812_write(chip, reg, val);
+	if (ret != 0)
+		pr_info("[DEBUG]: %s: lp5812_write failed\n", __func__);
+
+	return ret;
+}
+
+/* Function: led_aeu_playback_time_get_val
+ * Description: get aeu playback time value
+ * Params: aeu -> struct anim_engine_unit itself
+ *         val: return back 0 -> 3
+ * Return 0 if success
+ */
+int led_aeu_playback_time_get_val(struct anim_engine_unit *aeu, u8 *val)
+{
+	int ret;
+	u16 reg;
+	struct lp5812_led *led = aeu->led;
+	struct lp5812_chip *chip = led->priv;
+
+	reg = get_aeu_playback_time_register(aeu);
+	ret = lp5812_read(chip, reg, val);
+	if (ret != 0)
+		pr_info("[DEBUG]: %s: lp5812_read failed\n", __func__);
+
+	return ret;
+}
+
+MODULE_DESCRIPTION("Texas Instruments LP5812 Common Driver");
+MODULE_AUTHOR("Jared Zhou");
+MODULE_LICENSE("GPL");
diff --git a/drivers/leds/leds-lp5812-common.h b/drivers/leds/leds-lp5812-common.h
new file mode 100644
index 000000000000..cc9bba706d09
--- /dev/null
+++ b/drivers/leds/leds-lp5812-common.h
@@ -0,0 +1,323 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * LP5812 Common Driver Header
+ *
+ * Copyright (C) 2025 Texas Instruments
+ *
+ * Author: Jared Zhou <jared-zhou@ti.com>
+ */
+
+#ifndef _LEDS_LP5812_COMMON_H_
+#define _LEDS_LP5812_COMMON_H_
+
+#include <linux/kernel.h>
+#include <linux/i2c.h>
+#include <linux/sysfs.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/leds.h>
+#include <linux/delay.h>
+
+#include "leds-lp5812-regs.h"
+
+#define LED0        "led_0"
+#define LED1        "led_1"
+#define LED2        "led_2"
+#define LED3        "led_3"
+#define LED_A0      "led_A0"
+#define LED_A1      "led_A1"
+#define LED_A2      "led_A2"
+#define LED_B0      "led_B0"
+#define LED_B1      "led_B1"
+#define LED_B2      "led_B2"
+#define LED_C0      "led_C0"
+#define LED_C1      "led_C1"
+#define LED_C2      "led_C2"
+#define LED_D0      "led_D0"
+#define LED_D1      "led_D1"
+#define LED_D2      "led_D2"
+
+/* Below define time for (start/stop/slope time) */
+#define TIME0       "no time"
+#define TIME1       "0.09s"
+#define TIME2       "0.18s"
+#define TIME3       "0.36s"
+#define TIME4       "0.54s"
+#define TIME5       "0.80s"
+#define TIME6       "1.07s"
+#define TIME7       "1.52s"
+#define TIME8       "2.06s"
+#define TIME9       "2.50s"
+#define TIME10      "3.04s"
+#define TIME11      "4.02s"
+#define TIME12      "5.01s"
+#define TIME13      "5.99s"
+#define TIME14      "7.06s"
+#define TIME15      "8.05s"
+/* End define time for (start/stop/slope time) */
+
+#define AEU1        "AEU1"
+#define AEU2        "AEU2"
+#define AEU3        "AEU3"
+
+#define MAX_LEDS    16
+#define MAX_TIME    16
+#define MAX_AEU     3
+
+#define LP5812_DEV_ATTR_RW(name)   \
+	DEVICE_ATTR_RW(name)
+#define LP5812_DEV_ATTR_RO(name)          \
+	DEVICE_ATTR_RO(name)
+#define LP5812_DEV_ATTR_WO(name)         \
+	DEVICE_ATTR_WO(name)
+
+#define LP5812_KOBJ_ATTR(_name, _mode, _show, _store) \
+	struct kobj_attribute kobj_attr_##_name = __ATTR(_name, _mode, _show, _store)
+#define LP5812_KOBJ_ATTR_RW(name, show, store) \
+	LP5812_KOBJ_ATTR(name, 0644, show, store)
+#define LP5812_KOBJ_ATTR_RO(name, show) \
+	LP5812_KOBJ_ATTR(name, 0444, show, NULL)
+#define LP5812_KOBJ_ATTR_WO(name, store) \
+	LP5812_KOBJ_ATTR(name, 0200, NULL, store)
+
+enum pwm_slope_time_num {
+	PWM1 = 1,
+	PWM2,
+	PWM3,
+	PWM4,
+	PWM5,
+	SLOPE_T1,
+	SLOPE_T2,
+	SLOPE_T3,
+	SLOPE_T4
+};
+
+enum dimming_type {
+	ANALOG,
+	PWM
+};
+
+enum pwm_dimming_scale {
+	LINEAR = 0,
+	EXPONENTIAL
+};
+
+enum control_mode {
+	MANUAL = 0,
+	AUTONOMOUS
+};
+
+enum device_command {
+	NONE,
+	UPDATE,
+	START,
+	STOP,
+	PAUSE,
+	CONTINUE
+};
+
+enum animation_addr {
+	AUTO_PAUSE = 0,
+	AUTO_PLAYBACK,
+	AEU1_PWM_1,
+	AEU1_PWM_2,
+	AEU1_PWM_3,
+	AEU1_PWM_4,
+	AEU1_PWM_5,
+	AEU1_T12,
+	AEU1_T34,
+	AEU1_PLAYBACK,
+	AEU2_PWM_1,
+	AEU2_PWM_2,
+	AEU2_PWM_3,
+	AEU2_PWM_4,
+	AEU2_PWM_5,
+	AEU2_T12,
+	AEU2_T34,
+	AEU2_PLAYBACK,
+	AEU3_PWM_1,
+	AEU3_PWM_2,
+	AEU3_PWM_3,
+	AEU3_PWM_4,
+	AEU3_PWM_5,
+	AEU3_T12,
+	AEU3_T34,
+	AEU3_PLAYBACK
+};
+
+enum drive_mode {
+	DIRECT_MODE = 0,
+	TCM_1_SCAN,
+	TCM_2_SCAN,
+	TCM_3_SCAN,
+	TCM_4_SCAN,
+	MIX_1_SCAN,
+	MIX_2_SCAN,
+	MIX_3_SCAN
+};
+
+enum aeu_select {
+	ONLY_AEU1,
+	AEU1_AEU2,
+	AEU1_AEU2_AEU3
+};
+
+union time {
+	struct {
+		u8 first:4;
+		u8 second:4;
+	} __packed s_time;
+	u8 time_val;
+}; /* type for start/stop pause time and slope time */
+
+union led_playback {
+	struct {
+		u8 led_playback_time:4;
+		u8 aeu_selection:2;
+		u8 reserved:2;
+	} __packed s_led_playback;
+	u8 led_playback_val;
+};
+
+union scan_order {
+	struct {
+		u8 scan_order_0:2;
+		u8 scan_order_1:2;
+		u8 scan_order_2:2;
+		u8 scan_order_3:2;
+	} __packed s_scan_order;
+	u8 scan_order_val;
+};
+
+union drive_mode_info {
+	struct {
+		u8 mix_sel_led_0:1;
+		u8 mix_sel_led_1:1;
+		u8 mix_sel_led_2:1;
+		u8 mix_sel_led_3:1;
+		u8 led_mode:3;
+		u8 pwm_fre:1;
+	} __packed s_drive_mode;
+	u8 drive_mode_val;
+};
+
+struct drive_mode_led_map {
+	const char *drive_mode;
+	const char **led_arr;
+};
+
+struct lp5812_specific_regs {
+	u16 enable_reg;
+	u16 reset_reg;
+	u16 update_cmd_reg;
+	u16 start_cmd_reg;
+	u16 stop_cmd_reg;
+	u16 pause_cmd_reg;
+	u16 continue_cmd_reg;
+	u16 fault_clear_reg;
+	u16 tsd_config_status_reg;
+};
+
+struct anim_engine_unit {
+	struct kobject                        kobj;
+	struct lp5812_led                     *led;
+	struct attribute_group                attr_group;
+	const char                            *aeu_name;
+	int                                   aeu_number; /* start from 1 */
+
+	/* To know led using this AEU or not*/
+	int                                   enabled;
+};
+
+struct lp5812_led {
+	struct kobject                        kobj;
+	struct lp5812_chip                    *priv;
+	struct attribute_group                attr_group;
+	int                                   enable;
+	enum control_mode                     mode;
+	enum dimming_type                     dimming_type;
+	u8                                    lod_lsd;
+	u8                                    auto_pwm;
+	u8                                    aep_status;
+	u16                                   anim_base_addr;
+	int                                   led_number; /* start from 0 */
+	int                                   is_sysfs_created;
+	const char                            *led_name;
+
+	union led_playback                    led_playback;
+	union time                            start_stop_pause_time;
+
+	int                                   total_aeu;
+	struct anim_engine_unit               aeu[MAX_AEU];
+};
+
+struct lp5812_chip {
+	struct i2c_client                     *i2c_cl;
+	struct mutex                          lock; /* Protects access to device registers */
+	struct device                         *dev;
+	struct attribute_group                attr_group;
+	const struct lp5812_specific_regs     *regs;
+	const struct drive_mode_led_map       *chip_leds_map;
+	enum device_command                   command;
+	int                                   total_leds;
+	union scan_order                      u_scan_order;
+	union drive_mode_info                 u_drive_mode;
+
+	struct lp5812_led                     leds[MAX_LEDS]; /* MAX 16 LEDs */
+};
+
+int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val);
+int lp5812_read(struct lp5812_chip *chip, u16 reg, u8 *val);
+int lp5812_update_bit(struct lp5812_chip *chip, u16 reg, u8 mask, u8 val);
+
+int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val);
+int lp5812_read_lod_status(struct lp5812_chip *chip, int led_number, u8 *val);
+int lp5812_read_lsd_status(struct lp5812_chip *chip, int led_number, u8 *val);
+int lp5812_read_auto_pwm_value(struct lp5812_chip *chip, int led_number, u8 *val);
+int lp5812_read_aep_status(struct lp5812_chip *chip, int led_number, u8 *val);
+int lp5812_update_regs_config(struct lp5812_chip *chip);
+int lp5812_enable_disable(struct lp5812_chip *chip, int enable);
+int lp5812_reset(struct lp5812_chip *chip);
+int lp5812_fault_clear(struct lp5812_chip *chip, u8 value);
+int lp5812_device_command(struct lp5812_chip *chip, enum device_command command);
+void lp5812_dump_regs(struct lp5812_chip *chip, u16 from_reg, u16 to_reg);
+int lp5812_set_led_mode(struct lp5812_chip *chip, int led_number,
+		enum control_mode mode);
+int lp5812_get_led_mode(struct lp5812_chip *chip,
+		int led_number, enum control_mode *mode);
+int lp5812_set_pwm_dimming_scale(struct lp5812_chip *chip, int led_number,
+		enum pwm_dimming_scale scale);
+int lp5812_get_pwm_dimming_scale(struct lp5812_chip *chip,
+		int led_number, enum pwm_dimming_scale *scale);
+int lp5812_manual_dc_pwm_control(struct lp5812_chip *chip,
+		int led_number, u8 val, enum dimming_type dimming_type);
+int lp5812_manual_dc_pwm_read(struct lp5812_chip *chip,
+		int led_number, u8 *val, enum dimming_type dimming_type);
+int lp5812_autonomous_dc_pwm_control(struct lp5812_chip *chip,
+		int led_number, u8 val, enum dimming_type dimming_type);
+int lp5812_autonomous_dc_pwm_read(struct lp5812_chip *chip,
+		int led_number, u8 *val, enum dimming_type dimming_type);
+int lp5812_disable_all_leds(struct lp5812_chip *chip);
+int lp5812_set_drive_mode_scan_order(struct lp5812_chip *chip);
+int lp5812_get_drive_mode_scan_order(struct lp5812_chip *chip);
+int lp5812_get_phase_align(struct lp5812_chip *chip, int led_number,
+		int *phase_align_val);
+int lp5812_set_phase_align(struct lp5812_chip *chip, int led_number,
+		int phase_align_val);
+int lp5812_initialize(struct lp5812_chip *chip);
+
+int led_set_autonomous_animation_config(struct lp5812_led *led);
+int led_get_autonomous_animation_config(struct lp5812_led *led);
+
+int led_aeu_pwm_set_val(struct anim_engine_unit *aeu, u8 val,
+		enum pwm_slope_time_num pwm_num);
+int led_aeu_pwm_get_val(struct anim_engine_unit *aeu, u8 *val,
+		enum pwm_slope_time_num pwm_num);
+int led_aeu_slope_time_set_val(struct anim_engine_unit *aeu, u8 val,
+		enum pwm_slope_time_num slope_time_num);
+int led_aeu_slope_time_get_val(struct anim_engine_unit *aeu, u8 *val,
+		enum pwm_slope_time_num slope_time_num);
+int led_aeu_playback_time_set_val(struct anim_engine_unit *aeu, u8 val);
+int led_aeu_playback_time_get_val(struct anim_engine_unit *aeu, u8 *val);
+
+#endif /*_LEDS_LP5812_COMMON_H_*/
diff --git a/drivers/leds/leds-lp5812-regs.h b/drivers/leds/leds-lp5812-regs.h
new file mode 100644
index 000000000000..00aa073e8523
--- /dev/null
+++ b/drivers/leds/leds-lp5812-regs.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * LP5812 Register Header
+ *
+ * Copyright (C) 2025 Texas Instruments
+ *
+ * Author: Jared Zhou <jared-zhou@ti.com>
+ */
+
+#ifndef _LEDS_LP5812_REGS_H_
+#define _LEDS_LP5812_REGS_H_
+
+#define CHIP_EN_REG                     0x00
+
+#define DEV_CONFIG0                     0x01
+#define DEV_CONFIG1                     0x02
+#define DEV_CONFIG2                     0x03
+#define DEV_CONFIG3                     0x04
+#define DEV_CONFIG4                     0x05
+#define DEV_CONFIG5                     0x06
+#define DEV_CONFIG6                     0x07
+#define DEV_CONFIG7                     0x08
+#define DEV_CONFIG8                     0x09
+#define DEV_CONFIG9                     0x0A
+#define DEV_CONFIG10                    0x0B
+#define DEV_CONFIG11                    0x0c
+#define DEV_CONFIG12                    0x0D
+
+#define CMD_UPDATE_REG                  0x10
+#define CMD_START_REG                   0x11
+#define CMD_STOP_REG                    0x12
+#define CMD_PAUSE_REG                   0x13
+#define CMD_CONTINUE_REG                0x14
+
+#define LED_ENABLE_1_REG                0x20
+#define LED_ENABLE_2_REG                0x21
+
+#define FAULT_CLEAR_REG                 0x22
+#define RESET_REG                       0x23
+
+#define MANUAL_DC_LED_0_REG             0x30
+#define MANUAL_PWM_LED_0_REG            0x40
+#define AUTO_DC_LED_0_REG               0x50
+
+/* value for register */
+#define UPDATE_CMD_VAL                  0x55
+#define START_CMD_VAL                   0xFF
+#define STOP_CMD_VAL                    0xAA
+#define PAUSE_CMD_VAL                   0x33
+#define CONTINUE_CMD_VAL                0xCC
+
+#define CHIP_ENABLE                     0x01
+#define CHIP_DISABLE                    0x00
+
+#define FAULT_CLEAR_ALL                 0x07
+#define TSD_CLEAR_VAL                   0x04
+#define LSD_CLEAR_VAL                   0x02
+#define LOD_CLEAR_VAL                   0x01
+#define RESET_REG_VAL                   0x66
+
+#define LED0_AUTO_BASE_ADRR             0x80
+#define LED1_AUTO_BASE_ADRR             0x9A
+#define LED2_AUTO_BASE_ADRR             0xB4
+#define LED3_AUTO_BASE_ADRR             0xCE
+#define LED_A0_AUTO_BASE_ADRR           0xE8
+#define LED_A1_AUTO_BASE_ADRR           0x102
+#define LED_A2_AUTO_BASE_ADRR           0x11C
+#define LED_B0_AUTO_BASE_ADRR           0x136
+#define LED_B1_AUTO_BASE_ADRR           0x150
+#define LED_B2_AUTO_BASE_ADRR           0x16A
+#define LED_C0_AUTO_BASE_ADRR           0x184
+#define LED_C1_AUTO_BASE_ADRR           0x19E
+#define LED_C2_AUTO_BASE_ADRR           0x1B8
+#define LED_D0_AUTO_BASE_ADRR           0x1D2
+#define LED_D1_AUTO_BASE_ADRR           0x1EC
+#define LED_D2_AUTO_BASE_ADRR           0x206
+
+/* Flag Registers */
+#define TSD_CONFIG_STAT_REG             0x300
+#define LOD_STAT_1_REG                  0x301
+#define LOD_STAT_2_REG                  0x302
+#define LSD_STAT_1_REG                  0x303
+#define LSD_STAT_2_REG                  0x304
+
+#define AUTO_PWM_BASE_ADDR              0x305
+
+#define AEP_STATUS_0_REG                0x315
+#define AEP_STATUS_1_REG                0x316
+#define AEP_STATUS_2_REG                0x317
+#define AEP_STATUS_3_REG                0x318
+#define AEP_STATUS_4_REG                0x319
+#define AEP_STATUS_5_REG                0x31A
+#define AEP_STATUS_6_REG                0x31B
+#define AEP_STATUS_7_REG                0x31C
+
+#endif /*_LEDS_LP5812_REGS_H_ */
diff --git a/drivers/leds/leds-lp5812.c b/drivers/leds/leds-lp5812.c
new file mode 100644
index 000000000000..f76967a6f4b0
--- /dev/null
+++ b/drivers/leds/leds-lp5812.c
@@ -0,0 +1,2319 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LP5812 LED driver
+ *
+ * Copyright (C) 2025 Texas Instruments
+ *
+ * Author: Jared Zhou <jared-zhou@ti.com>
+ */
+
+#include <linux/version.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/mod_devicetable.h>
+#include <linux/string.h>
+
+#include "leds-lp5812-common.h"
+
+#define to_lp5812_led(x) container_of(x, struct lp5812_led, kobj)
+#define to_anim_engine_unit(x) container_of(x, struct anim_engine_unit, kobj)
+
+static int lp5812_init_dev_config(struct lp5812_chip *chip,
+		const char *drive_mode, int rm_led_sysfs);
+
+static struct drive_mode_led_map chip_leds_map[] = {
+	{
+		"direct_mode",
+		(const char *[]){LED0, LED1, LED2, LED3, NULL},
+	},
+	{
+		"tcmscan:1:0", /* tcm 1 scan; scan order 0 out0 */
+		(const char *[]){LED_A0, LED_A1, LED_A2, NULL},
+	},
+	{
+		"tcmscan:1:1", /* tcm 1 scan; scan order 0 out1 */
+		(const char *[]){LED_B0, LED_B1, LED_B2, NULL},
+	},
+	{
+		"tcmscan:1:2", /* tcm 1 scan; scan order 0 out2 */
+		(const char *[]){LED_C0, LED_C1, LED_C2, NULL},
+	},
+	{
+		"tcmscan:1:3", /* tcm 1 scan; scan order 0 out3 */
+		(const char *[]){LED_D0, LED_D1, LED_D2, NULL},
+	},
+	{ /* tcm 2 scan, scan order 0 out0; scan order 1 out1 */
+		"tcmscan:2:0:1",
+		(const char *[]){LED_A0, LED_A1, LED_A2, LED_B0, LED_B1, LED_B2,
+		NULL},
+	},
+	{ /* tcm 2 scan, scan order 0 out0; scan order 1 out2 */
+		"tcmscan:2:0:2",
+		(const char *[]){LED_A0, LED_A1, LED_A2, LED_C0, LED_C1, LED_C2,
+		NULL},
+	},
+	{ /* tcm 2 scan, scan order 0 out0; scan order 1 out3 */
+		"tcmscan:2:0:3",
+		(const char *[]){LED_A0, LED_A1, LED_A2, LED_D0, LED_D1, LED_D2,
+		NULL},
+	},
+	{ /* tcm 2 scan, scan order 0 out1; scan order 1 out2 */
+		"tcmscan:2:1:2",
+		(const char *[]){LED_B0, LED_B1, LED_B2, LED_C0, LED_C1, LED_C2,
+		NULL},
+	},
+	{ /* tcm 2 scan, scan order 0 out1; scan order 1 out3 */
+		"tcmscan:2:1:3",
+		(const char *[]){LED_B0, LED_B1, LED_B2, LED_D0, LED_D1, LED_D2,
+		NULL},
+	},
+	{ /* tcm 2 scan, scan order 0 out2; scan order 1 out3 */
+		"tcmscan:2:2:3",
+		(const char *[]){LED_C0, LED_C1, LED_C2, LED_D0, LED_D1, LED_D2,
+		NULL},
+	},
+	{ /* tcm 3 scan, scan order 0 out0; scan order 1 out1;
+	   * scan order 2 out2
+	   */
+		"tcmscan:3:0:1:2",
+		(const char *[]){LED_A0, LED_A1, LED_A2, LED_B0, LED_B1, LED_B2,
+		LED_C0, LED_C1, LED_C2, NULL},
+	},
+	{ /* tcm 3 scan, scan order 0 out0; scan order 1 out1;
+	   * scan order 2 out3
+	   */
+		"tcmscan:3:0:1:3",
+		(const char *[]){LED_A0, LED_A1, LED_A2, LED_B0, LED_B1, LED_B2,
+		LED_D0, LED_D1, LED_D2, NULL},
+	},
+	{ /* tcm 3 scan, scan order 0 out0; scan order 1 out2;
+	   * scan order 2 out3
+	   */
+		"tcmscan:3:0:2:3",
+		(const char *[]){LED_A0, LED_A1, LED_A2, LED_C0, LED_C1, LED_C2,
+		LED_D0, LED_D1, LED_D2, NULL},
+	},
+	{ /* tcm 4 scan, scan order 0 out0; scan order 1 out1;
+	   * scan order 2 out2; scan order 3 out3
+	   */
+		"tcmscan:4:0:1:2:3",
+		(const char *[]){LED_A0, LED_A1, LED_A2, LED_B0, LED_B1, LED_B2,
+		LED_C0, LED_C1, LED_C2, LED_D0, LED_D1, LED_D2, NULL},
+	},
+	{ /* mix 1 scan, direct connect out0; scan order 0 out1 */
+		"mixscan:1:0:1",
+		(const char *[]){LED0, LED_B0, LED_B1, NULL},
+	},
+	{ /* mix 1 scan, direct connect out0; scan order 0 out2 */
+		"mixscan:1:0:2",
+		(const char *[]){LED0, LED_C0, LED_C2, NULL},
+	},
+	{ /* mix 1 scan, direct connect out0; scan order 0 out3 */
+		"mixscan:1:0:3",
+		(const char *[]){LED0, LED_D1, LED_D2, NULL},
+	},
+	{ /* mix 1 scan, direct connect out1; scan order 0 out0 */
+		"mixscan:1:1:0",
+		(const char *[]){LED1, LED_A1, LED_A2, NULL},
+	},
+	{ /* mix 1 scan, direct connect out1; scan order 0 out2 */
+		"mixscan:1:1:2",
+		(const char *[]){LED1, LED_C0, LED_C1, NULL},
+	},
+	{ /* mix 1 scan, direct connect out1; scan order 0 out3 */
+		"mixscan:1:1:3",
+		(const char *[]){LED1, LED_D0, LED_D2, NULL},
+	},
+	{ /* mix 1 scan, direct connect out2; scan order 0 out0 */
+		"mixscan:1:2:0",
+		(const char *[]){LED2, LED_A0, LED_A2, NULL},
+	},
+	{ /* mix 1 scan, direct connect out2; scan order 0 out1 */
+		"mixscan:1:2:1",
+		(const char *[]){LED2, LED_B1, LED_B2, NULL},
+	},
+	{ /* mix 1 scan, direct connect out2; scan order 0 out3 */
+		"mixscan:1:2:3",
+		(const char *[]){LED2, LED_D0, LED_D1, NULL},
+	},
+	{ /* mix 1 scan, direct connect out3; scan order 0 out0 */
+		"mixscan:1:3:0",
+		(const char *[]){LED3, LED_A0, LED_A1, NULL},
+	},
+	{ /* mix 1 scan, direct connect out3; scan order 0 out1 */
+		"mixscan:1:3:1",
+		(const char *[]){LED3, LED_B0, LED_B2, NULL},
+	},
+	{ /* mix 1 scan, direct connect out3; scan order 0 out2 */
+		"mixscan:1:3:2",
+		(const char *[]){LED3, LED_C1, LED_C2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out0; scan order 0 out1;
+	   * scan order 1 out2
+	   */
+		"mixscan:2:0:1:2",
+		(const char *[]){LED0, LED_B0, LED_B1, LED_C0, LED_C2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out0; scan order 0 out1;
+	   * scan order 1 out3
+	   */
+		"mixscan:2:0:1:3",
+		(const char *[]){LED0, LED_B0, LED_B1, LED_D1, LED_D2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out0; scan order 0 out2;
+	   * scan order 1 out3
+	   */
+		"mixscan:2:0:2:3",
+		(const char *[]){LED0, LED_C0, LED_C2, LED_D1, LED_D2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out1; scan order 0 out0;
+	   * scan order 1 out2
+	   */
+		"mixscan:2:1:0:2",
+		(const char *[]){LED1, LED_A1, LED_A2, LED_C0, LED_C1, NULL},
+	},
+	{ /* mix 2 scan, direct connect out1; scan order 0 out0;
+	   * scan order 1 out3
+	   */
+		"mixscan:2:1:0:3",
+		(const char *[]){LED1, LED_A1, LED_A2, LED_D0, LED_D2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out1; scan order 0 out2;
+	   * scan order 1 out3
+	   */
+		"mixscan:2:1:2:3",
+		(const char *[]){LED1, LED_C0, LED_C1, LED_D0, LED_D2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out2; scan order 0 out0;
+	   * scan order 1 out1
+	   */
+		"mixscan:2:2:0:1",
+		(const char *[]){LED2, LED_A0, LED_A2, LED_B1, LED_B2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out2; scan order 0 out0;
+	   * scan order 1 out3
+	   */
+		"mixscan:2:2:0:3",
+		(const char *[]){LED2, LED_A0, LED_A2, LED_D0, LED_D1, NULL},
+	},
+	{ /* mix 2 scan, direct connect out2; scan order 0 out1;
+	   * scan order 1 out3
+	   */
+		"mixscan:2:2:1:3",
+		(const char *[]){LED2, LED_B1, LED_B2, LED_D0, LED_D1, NULL},
+	},
+	{ /* mix 2 scan, direct connect out3; scan order 0 out0;
+	   * scan order 1 out1
+	   */
+		"mixscan:2:3:0:1",
+		(const char *[]){LED3, LED_A0, LED_A1, LED_B0, LED_B2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out3; scan order 0 out0;
+	   * scan order 1 out2
+	   */
+		"mixscan:2:3:0:2",
+		(const char *[]){LED3, LED_A0, LED_A1, LED_C1, LED_C2, NULL},
+	},
+	{ /* mix 2 scan, direct connect out3; scan order 0 out1;
+	   * scan order 1 out2
+	   */
+		"mixscan:2:3:1:2",
+		(const char *[]){LED3, LED_B0, LED_B2, LED_C1, LED_C2, NULL},
+	},
+	{ /* mix 3 scan, direct connect out0; scan order 0 out1;
+	   * scan order 1 out2; scan order 2 out3
+	   */
+		"mixscan:3:0:1:2:3",
+		(const char *[]){LED0, LED_B0, LED_B1, LED_C0, LED_C2, LED_D1,
+		LED_D2, NULL},
+	},
+	{ /* mix 3 scan, direct connect out1; scan order 0 out0;
+	   * scan order 1 out2; scan order 2 out3
+	   */
+		"mixscan:3:1:0:2:3",
+		(const char *[]){LED1, LED_A1, LED_A2, LED_C0, LED_C1, LED_D0,
+		LED_D2, NULL},
+	},
+	{ /* mix 3 scan, direct connect out2; scan order 0 out0;
+	   * scan order 1 out1; scan order 2 out3
+	   */
+		"mixscan:3:2:0:1:3",
+		(const char *[]){LED2, LED_A0, LED_A2, LED_B1, LED_B2, LED_D0,
+		LED_D1, NULL},
+	},
+	{ /* mix 3 scan, direct connect out3; scan order 0 out0;
+	   * scan order 1 out1; scan order 2 out2
+	   */
+		"mixscan:3:3:0:1:2",
+		(const char *[]){LED3, LED_A0, LED_A1, LED_B0, LED_B2, LED_C1,
+		LED_C2, NULL},
+	},
+};
+
+static const char *led_name_array[MAX_LEDS] = {
+	LED0, LED1, LED2, LED3, LED_A0, LED_A1, LED_A2, LED_B0, LED_B1,
+	LED_B2, LED_C0, LED_C1, LED_C2, LED_D0, LED_D1, LED_D2
+};
+
+static u16 anim_base_addr_array[MAX_LEDS] = {
+	LED0_AUTO_BASE_ADRR, LED1_AUTO_BASE_ADRR, LED2_AUTO_BASE_ADRR,
+	LED3_AUTO_BASE_ADRR, LED_A0_AUTO_BASE_ADRR, LED_A1_AUTO_BASE_ADRR,
+	LED_A2_AUTO_BASE_ADRR, LED_B0_AUTO_BASE_ADRR, LED_B1_AUTO_BASE_ADRR,
+	LED_B2_AUTO_BASE_ADRR, LED_C0_AUTO_BASE_ADRR, LED_C1_AUTO_BASE_ADRR,
+	LED_C2_AUTO_BASE_ADRR, LED_D0_AUTO_BASE_ADRR, LED_D1_AUTO_BASE_ADRR,
+	LED_D2_AUTO_BASE_ADRR
+};
+
+static const char *time_name_array[MAX_TIME] = {
+	TIME0, TIME1, TIME2, TIME3, TIME4, TIME5, TIME6, TIME7, TIME8,
+	TIME9, TIME10, TIME11, TIME12, TIME13, TIME14, TIME15
+};
+
+static const char *led_playback_time_arr[MAX_TIME] = {
+	"0 time", "1 time", "2 times", "3 times", "4 times", "5 times",
+	"6 times", "7 times", "8 times", "9 times", "10 times", "11 times",
+	"12 times", "13 times", "14 times", "infinite times"
+};
+
+static const char *aeu_name_array[MAX_AEU] = {AEU1, AEU2, AEU3};
+
+static const struct lp5812_specific_regs regs = {
+	.enable_reg            = CHIP_EN_REG,
+	.reset_reg             = RESET_REG,
+	.update_cmd_reg        = CMD_UPDATE_REG,
+	.start_cmd_reg         = CMD_START_REG,
+	.stop_cmd_reg          = CMD_STOP_REG,
+	.pause_cmd_reg         = CMD_PAUSE_REG,
+	.continue_cmd_reg      = CMD_CONTINUE_REG,
+	.fault_clear_reg       = FAULT_CLEAR_REG,
+	.tsd_config_status_reg = TSD_CONFIG_STAT_REG,
+};
+
+static void led_kobj_release(struct kobject *kobj)
+{
+	pr_debug("(%p): %s\n", kobj, __func__);
+	kfree(kobj);
+}
+
+static void aeu_kobj_release(struct kobject *kobj)
+{
+	pr_debug("(%p): %s\n", kobj, __func__);
+	kfree(kobj);
+}
+
+static const struct kobj_type led_ktype = {
+	.release = led_kobj_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static const struct kobj_type aeu_ktype = {
+	.release = aeu_kobj_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static int aeu_create_sysfs_group(struct anim_engine_unit *aeu)
+{
+	int ret = 0;
+
+	ret = kobject_add(&aeu->kobj, &aeu->led->kobj, "%s",
+			aeu->aeu_name);
+	if (ret) {
+		pr_info("[DEBUG]: Failed to create kobject for AEU %s\n",
+		aeu->aeu_name);
+		return ret;
+	}
+	ret = sysfs_create_group(&aeu->kobj, &aeu->attr_group);
+	if (ret) {
+		pr_info("[DEBUG]: sysfs_create_group for AEU %s failed: %d\n",
+		aeu->aeu_name, ret);
+	}
+	aeu->enabled = 1;
+
+	return ret;
+}
+
+static void aeu_remove_sysfs_group(struct anim_engine_unit *aeu)
+{
+	aeu->enabled = 0;
+	sysfs_remove_group(&aeu->kobj, &aeu->attr_group);
+	kobject_del(&aeu->kobj);
+}
+
+/* Function to remove multiple sysfs group of AEU in one led */
+static void aeu_remove_multi_sysfs_groups(struct lp5812_led *led)
+{
+	int i;
+
+	for (i = 0; i < led->total_aeu; i++) {
+		if (led->aeu[i].enabled)
+			aeu_remove_sysfs_group(&led->aeu[i]);
+	}
+}
+
+/*
+ * Function to create multi sysfs group for specific led. it will
+ * check the mode of led and AEU number selection to create
+ * corresponding AEU interfaces
+ */
+static int aeu_create_multi_sysfs_groups(struct lp5812_led *led)
+{
+	int i;
+	int aeu_select;
+	enum control_mode mode;
+	struct lp5812_chip *chip = led->priv;
+
+	if (lp5812_get_led_mode(chip, led->led_number, &mode))
+		return -EIO;
+	if (mode == AUTONOMOUS) {
+		if (led_get_autonomous_animation_config(led))
+			return -EIO;
+		aeu_select = led->led_playback.s_led_playback.aeu_selection;
+		if (aeu_select == 3)
+			aeu_select = 2;
+		for (i = 0; i < aeu_select + 1; i++)
+			aeu_create_sysfs_group(&led->aeu[i]);
+	}
+
+	return 0;
+}
+
+static int lp5812_create_sysfs_group(struct lp5812_led *led)
+{
+	int ret = 0;
+
+	ret = kobject_add(&led->kobj, &led->priv->dev->kobj, "%s",
+			led->led_name);
+	if (ret) {
+		pr_info("[DEBUG]: Failed to create kobject for LED %s\n",
+		led->led_name);
+		return ret;
+	}
+	ret = sysfs_create_group(&led->kobj, &led->attr_group);
+	if (ret) {
+		pr_info("[DEBUG]: sysfs_create_group for LED %s failed: %d\n",
+		led->led_name, ret);
+		return ret;
+	}
+	led->is_sysfs_created = 1;
+
+	return ret;
+}
+
+static void lp5812_remove_sysfs_group(struct lp5812_led *led)
+{
+	int i;
+
+	/* remove sysfs group of AEU */
+	for (i = 0; i < led->total_aeu; i++) {
+		if (led->aeu[i].enabled)
+			aeu_remove_sysfs_group(&led->aeu[i]);
+	}
+	led->is_sysfs_created = 0;
+	sysfs_remove_group(&led->kobj, &led->attr_group);
+	kobject_del(&led->kobj);
+}
+
+static ssize_t device_enable_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t len)
+{
+	int enable;
+	int ret;
+	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+
+	ret = kstrtoint(buf, 0, &enable);
+	if (ret)
+		return ret;
+
+	if (enable != 0 && enable != 1)
+		return -EINVAL; /* Invalid argument */
+
+	/* set to hardware */
+	mutex_lock(&chip->lock);
+	if (lp5812_enable_disable(chip, enable)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return len;
+}
+
+static ssize_t device_enable_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	u8 enable;
+	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+
+	mutex_lock(&chip->lock);
+	if (lp5812_read(chip, chip->regs->enable_reg, &enable)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return sprintf(buf, "%d\n", enable);
+}
+
+static ssize_t device_command_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t len)
+{
+	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+
+	mutex_lock(&chip->lock);
+	if (sysfs_streq(buf, "update")) {
+		lp5812_device_command(chip, UPDATE);
+	} else if (sysfs_streq(buf, "start")) {
+		lp5812_device_command(chip, START);
+	} else if (sysfs_streq(buf, "stop")) {
+		lp5812_device_command(chip, STOP);
+	} else if (sysfs_streq(buf, "pause")) {
+		lp5812_device_command(chip, PAUSE);
+	} else if (sysfs_streq(buf, "continue")) {
+		lp5812_device_command(chip, CONTINUE);
+	} else {
+		mutex_unlock(&chip->lock);
+		return -EINVAL;
+	}
+	mutex_unlock(&chip->lock);
+
+	return len;
+}
+
+static ssize_t device_reset_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t len)
+{
+	int reset;
+	int ret;
+	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+
+	ret = kstrtoint(buf, 0, &reset);
+	if (ret)
+		return ret;
+
+	if (reset != 1)
+		return -EINVAL; /* Invalid argument */
+
+	/* reset hardware */
+	mutex_lock(&chip->lock);
+	lp5812_reset(chip);
+	msleep(1000);
+	/* set back manual mode as default for all LEDs */
+	lp5812_write(chip, (u16)DEV_CONFIG3, 0x00);
+	lp5812_write(chip, (u16)DEV_CONFIG4, 0x00);
+	lp5812_update_regs_config(chip);
+	mutex_unlock(&chip->lock);
+
+	/* Update sysfs based on default mode when hardware reseted*/
+	ret = lp5812_init_dev_config(chip, "direct_mode", 1);
+	if (ret) {
+		pr_info("[DEBUG]: %s: lp5812_init_dev_config failed\n",
+			__func__);
+		return ret;
+	}
+
+	return len;
+}
+
+static ssize_t fault_clear_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t len)
+{
+	int fault_clear;
+	int ret;
+	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+
+	ret = kstrtoint(buf, 0, &fault_clear);
+	if (ret)
+		return ret;
+
+	if (fault_clear != 0 && fault_clear != 1 && fault_clear != 2 &&
+			fault_clear != 3) {
+		return -EINVAL;
+	}
+	mutex_lock(&chip->lock);
+	if (lp5812_fault_clear(chip, fault_clear)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return len;
+}
+
+static void lp5812_create_sysfs_via_led_name(struct lp5812_chip *chip,
+		const char *led_name)
+{
+	int i;
+
+	for (i = 0; i < chip->total_leds; i++) {
+		if (sysfs_streq(led_name, chip->leds[i].led_name)) {
+			lp5812_create_sysfs_group(&chip->leds[i]);
+
+			/*
+			 * create AEU interface if current led mode is
+			 * autonomous
+			 */
+			aeu_create_multi_sysfs_groups(&chip->leds[i]);
+		}
+	}
+}
+
+static void set_mix_sel_led(struct lp5812_chip *chip, int mix_sel_led)
+{
+	if (mix_sel_led == 0) {
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 1;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
+	}
+	if (mix_sel_led == 1) {
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 1;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
+	}
+	if (mix_sel_led == 2) {
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 1;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
+	}
+	if (mix_sel_led == 3) {
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 1;
+	}
+}
+
+static void parse_drive_mode(struct lp5812_chip *chip, char *str)
+{
+	int ret;
+	char *sub_str;
+	int tcm_scan_num, mix_scan_num, mix_sel_led;
+	int scan_oder0, scan_oder1, scan_oder2, scan_oder3;
+
+	sub_str = strsep(&str, ":");
+	if (sysfs_streq(sub_str, "direct_mode")) {
+		chip->u_drive_mode.s_drive_mode.led_mode = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
+	}
+	if (sysfs_streq(sub_str, "tcmscan")) {
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
+		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
+
+		/* Get tcm scan number */
+		sub_str = strsep(&str, ":");
+		ret = kstrtoint(sub_str, 0, &tcm_scan_num);
+		if (ret)
+			return;
+		pr_info("tcm_scan_num: %d\n", tcm_scan_num);
+		chip->u_drive_mode.s_drive_mode.led_mode = tcm_scan_num;
+		switch (tcm_scan_num) {
+		case TCM_1_SCAN:
+			/* Get scan_oder0 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder0);
+			if (ret)
+				return;
+			pr_info("scan_oder0: %d\n", scan_oder0);
+			chip->u_scan_order.s_scan_order.scan_order_0 =
+				scan_oder0;
+			break;
+		case TCM_2_SCAN:
+			/* Get scan_order0 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder0);
+			if (ret)
+				return;
+			pr_info("scan_oder0: %d\n", scan_oder0);
+			/* Get scan_order1 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder1);
+			if (ret)
+				return;
+			pr_info("scan_oder1: %d\n", scan_oder1);
+			chip->u_scan_order.s_scan_order.scan_order_0 =
+				scan_oder0;
+			chip->u_scan_order.s_scan_order.scan_order_1 =
+				scan_oder1;
+			break;
+		case TCM_3_SCAN:
+			/* Get scan_order0 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder0);
+			if (ret)
+				return;
+			pr_info("scan_oder0: %d\n", scan_oder0);
+			/* Get scan_order1 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder1);
+			if (ret)
+				return;
+			pr_info("scan_oder1: %d\n", scan_oder1);
+			/* Get scan_order2 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder2);
+			if (ret)
+				return;
+			pr_info("scan_oder2: %d\n", scan_oder2);
+			chip->u_scan_order.s_scan_order.scan_order_0 =
+				scan_oder0;
+			chip->u_scan_order.s_scan_order.scan_order_1 =
+				scan_oder1;
+			chip->u_scan_order.s_scan_order.scan_order_2 =
+				scan_oder2;
+			break;
+		case TCM_4_SCAN:
+			/* Get scan_order0 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder0);
+			if (ret)
+				return;
+			pr_info("scan_oder0: %d\n", scan_oder0);
+			/* Get scan_order1 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder1);
+			if (ret)
+				return;
+			pr_info("scan_oder1: %d\n", scan_oder1);
+			/* Get scan_order2 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder2);
+			if (ret)
+				return;
+			pr_info("scan_oder2: %d\n", scan_oder2);
+			/* Get scan_order3 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder3);
+			if (ret)
+				return;
+			pr_info("scan_oder3: %d\n", scan_oder3);
+			chip->u_scan_order.s_scan_order.scan_order_0 =
+				scan_oder0;
+			chip->u_scan_order.s_scan_order.scan_order_1 =
+				scan_oder1;
+			chip->u_scan_order.s_scan_order.scan_order_2 =
+				scan_oder2;
+			chip->u_scan_order.s_scan_order.scan_order_3 =
+				scan_oder3;
+			break;
+		default:
+			pr_info("Invalid TCM scan number\n");
+			break;
+		}
+	}
+	if (sysfs_streq(sub_str, "mixscan")) {
+		/* Get mix scan number */
+		sub_str = strsep(&str, ":");
+		ret = kstrtoint(sub_str, 0, &mix_scan_num);
+		if (ret)
+			return;
+		pr_info("mix_scan_num: %d\n", mix_scan_num);
+		chip->u_drive_mode.s_drive_mode.led_mode = mix_scan_num + 4;
+		/* Get mix_sel_led */
+		sub_str = strsep(&str, ":");
+		ret = kstrtoint(sub_str, 0, &mix_sel_led);
+		if (ret)
+			return;
+		pr_info("mix_sel_led: %d\n", mix_sel_led);
+		set_mix_sel_led(chip, mix_sel_led);
+		if (mix_scan_num == 1) {
+			/* Get scan_order0 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder0);
+			if (ret)
+				return;
+			pr_info("scan_oder0: %d\n", scan_oder0);
+			chip->u_scan_order.s_scan_order.scan_order_0 =
+				scan_oder0;
+		}
+		if (mix_scan_num == 2) {
+			/* Get scan_order0 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder0);
+			if (ret)
+				return;
+			pr_info("scan_oder0: %d\n", scan_oder0);
+			/* Get scan_order1 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder1);
+			if (ret)
+				return;
+			pr_info("scan_oder1: %d\n", scan_oder1);
+			chip->u_scan_order.s_scan_order.scan_order_0 =
+				scan_oder0;
+			chip->u_scan_order.s_scan_order.scan_order_1 =
+				scan_oder1;
+		}
+		if (mix_scan_num == 3) {
+			/* Get scan_order0 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder0);
+			if (ret)
+				return;
+			pr_info("scan_oder0: %d\n", scan_oder0);
+			/* Get scan_order1 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder1);
+			if (ret)
+				return;
+			pr_info("scan_oder1: %d\n", scan_oder1);
+			/* Get scan_order2 */
+			sub_str = strsep(&str, ":");
+			ret = kstrtoint(sub_str, 0, &scan_oder2);
+			if (ret)
+				return;
+			pr_info("scan_oder2: %d\n", scan_oder2);
+			chip->u_scan_order.s_scan_order.scan_order_0 =
+				scan_oder0;
+			chip->u_scan_order.s_scan_order.scan_order_1 =
+				scan_oder1;
+			chip->u_scan_order.s_scan_order.scan_order_2 =
+				scan_oder2;
+		}
+	}
+}
+
+static void leds_remove_existed_sysfs(struct lp5812_chip *chip)
+{
+	int i;
+
+	for (i = 0; i < chip->total_leds; i++) {
+		if (chip->leds[i].is_sysfs_created)
+			lp5812_remove_sysfs_group(&chip->leds[i]);
+	}
+}
+
+/*
+ * Function to init scan order and drive mode and create sysfs
+ * for led.
+ * Params: chip -> lp5812 struct itself
+ *         drive_mode -> for EX: tcmscan:2:1:2
+ *         rm_led_sysfs -> 1 to remove, 0 -> else
+ */
+static int lp5812_init_dev_config(struct lp5812_chip *chip,
+		const char *drive_mode, int rm_led_sysfs)
+{
+	int i;
+	int num_drive_mode;
+	int is_valid_arg = 0;
+	char *str;
+	const char **led_ptr;
+
+	str = kmalloc(strlen(drive_mode) + 1, GFP_KERNEL);
+	if (!str)
+		return -ENOMEM;
+	strscpy(str, drive_mode, strlen(drive_mode) + 1);
+
+	num_drive_mode = ARRAY_SIZE(chip_leds_map);
+	for (i = 0; i < num_drive_mode; ++i) {
+		if (sysfs_streq(str, chip_leds_map[i].drive_mode)) {
+			if (rm_led_sysfs)
+				leds_remove_existed_sysfs(chip);
+			parse_drive_mode(chip, str);
+			led_ptr = chip_leds_map[i].led_arr;
+			while (*led_ptr) {
+				lp5812_create_sysfs_via_led_name(chip,
+						*led_ptr);
+				++led_ptr;
+			}
+			is_valid_arg = 1;
+			break;
+		}
+	}
+	kfree(str);
+	if (!is_valid_arg) {
+		pr_info("[DEBUG]: Invalid argument\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static ssize_t dev_config_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t len)
+{
+	int ret;
+	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+
+	mutex_lock(&chip->lock);
+	pr_info("User send: %s\n", buf);
+	ret = lp5812_init_dev_config(chip, buf, 1);
+	if (ret)
+		goto out;
+
+	/* set drive mode and scan order to hardware */
+	ret = lp5812_set_drive_mode_scan_order(chip);
+	if (ret) {
+		ret = -EIO;
+		goto out;
+	}
+	ret = lp5812_update_regs_config(chip);
+	if (ret) {
+		ret = -EIO;
+		goto out;
+	}
+
+	/* disable all LEDs that were previously enabled */
+	ret = lp5812_disable_all_leds(chip);
+	if (ret) {
+		ret = -EIO;
+		goto out;
+	}
+	mutex_unlock(&chip->lock);
+
+	return len;
+out:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+static char *parse_dev_config_info(struct lp5812_chip *chip)
+{
+	char *tmp;
+	int order_0, order_1, order_2, order_3;
+	char *scan_order_0 = " scan_order_0: ";
+	char *scan_order_1 = " scan_order_1: ";
+	char *scan_order_2 = " scan_order_2: ";
+	char *scan_order_3 = " scan_order_3: ";
+
+	tmp = kmalloc(128, GFP_KERNEL);
+	if (!tmp)
+		return NULL;
+
+	order_0 = chip->u_scan_order.s_scan_order.scan_order_0;
+	order_1 = chip->u_scan_order.s_scan_order.scan_order_1;
+	order_2 = chip->u_scan_order.s_scan_order.scan_order_2;
+	order_3 = chip->u_scan_order.s_scan_order.scan_order_3;
+
+	switch (chip->u_drive_mode.s_drive_mode.led_mode) {
+	case DIRECT_MODE:
+		sprintf(tmp, "%s", "Mode: direct mode;");
+		break;
+	case TCM_1_SCAN:
+		sprintf(tmp, "%s%s%d%s", "Mode: tcm 1 scan;", scan_order_0,
+			order_0, ";");
+		break;
+	case TCM_2_SCAN:
+		sprintf(tmp, "%s%s%d%s%s%d%s", "Mode: tcm 2 scan;",
+		scan_order_0, order_0, ";", scan_order_1, order_1, ";");
+		break;
+	case TCM_3_SCAN:
+		sprintf(tmp, "%s%s%d%s%s%d%s%s%d%s", "Mode: tcm 3 scan;",
+			scan_order_0, order_0, ";", scan_order_1, order_1,
+			";", scan_order_2, order_2, ";");
+		break;
+	case TCM_4_SCAN:
+		sprintf(tmp, "%s%s%d%s%s%d%s%s%d%s%s%d%s", "Mode: tcm 4 scan;",
+			scan_order_0, order_0, ";", scan_order_1, order_1, ";",
+			scan_order_2, order_2, ";", scan_order_3, order_3, ";");
+		break;
+	case MIX_1_SCAN:
+		sprintf(tmp, "%s%s%d%s", "Mode: mix 1 scan;", scan_order_0,
+			order_0, ";");
+		break;
+	case MIX_2_SCAN:
+		sprintf(tmp, "%s%s%d%s%s%d%s", "Mode: mix 2 scan;",
+		scan_order_0, order_0, ";", scan_order_1, order_1, ";");
+		break;
+	case MIX_3_SCAN:
+		sprintf(tmp, "%s%s%d%s%s%d%s%s%d%s", "Mode: mix 3 scan;",
+			scan_order_0, order_0, ";", scan_order_1, order_1,
+			";", scan_order_2, order_2, ";");
+		break;
+	}
+
+	if (chip->u_drive_mode.s_drive_mode.mix_sel_led_0)
+		strcat(tmp, " Direct output: OUT0;");
+	else if (chip->u_drive_mode.s_drive_mode.mix_sel_led_1)
+		strcat(tmp, " Direct output: OUT1;");
+	else if (chip->u_drive_mode.s_drive_mode.mix_sel_led_2)
+		strcat(tmp, " Direct output: OUT2;");
+	else if (chip->u_drive_mode.s_drive_mode.mix_sel_led_3)
+		strcat(tmp, " Direct output: OUT3;");
+	else
+		strcat(tmp, " Direct output: None;");
+	return tmp;
+}
+
+static ssize_t dev_config_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	int i;
+	int num_drive_mode;
+	char *mode_info;
+	char *total_str;
+	size_t total_length;
+	char *const_str = "\nPlease select below valid drive mode:\n";
+	char *const_ex_str = "For Ex: echo tcmscan:1:0 > dev_config\n";
+	int ret = 0;
+	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+
+	/* get drive mode and scan order */
+	mutex_lock(&chip->lock);
+	ret = lp5812_get_drive_mode_scan_order(chip);
+	mutex_unlock(&chip->lock);
+	if (ret)
+		return -EIO;
+
+	mode_info = parse_dev_config_info(chip);
+	if (!mode_info)
+		return -ENOMEM;
+
+	num_drive_mode = ARRAY_SIZE(chip_leds_map);
+	total_length = strlen(mode_info) + strlen(const_str) +
+			strlen(const_ex_str) + 1;
+	for (i = 0; i < num_drive_mode; ++i) {
+		total_length += strlen(chip_leds_map[i].drive_mode) +
+					strlen("\n");
+	}
+
+	total_str = kmalloc(total_length, GFP_KERNEL);
+	if (!total_str)
+		return -ENOMEM;
+
+	sprintf(total_str, "%s%s%s", mode_info, const_str, const_ex_str);
+	for (i = 0; i < num_drive_mode; ++i) {
+		strcat(total_str, chip_leds_map[i].drive_mode);
+		strcat(total_str, "\n");
+	}
+
+	ret = sprintf(buf, "%s", total_str);
+	kfree(mode_info);
+	kfree(total_str);
+
+	return ret;
+}
+
+static ssize_t tsd_config_status_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	int ret;
+	u8 reg_val;
+	int tsd_stat;
+	int config_stat;
+	struct lp5812_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_read(chip, (u16)TSD_CONFIG_STAT_REG, &reg_val);
+	mutex_unlock(&chip->lock);
+	if (ret)
+		return -EIO;
+	tsd_stat = (reg_val >> 1) & 0x01;
+	config_stat = reg_val & 0x01;
+
+	return sprintf(buf, "%d %d\n", tsd_stat, config_stat);
+}
+
+static LP5812_DEV_ATTR_RW(device_enable);
+static LP5812_DEV_ATTR_RW(dev_config);
+static LP5812_DEV_ATTR_WO(device_command);
+static LP5812_DEV_ATTR_WO(device_reset);
+static LP5812_DEV_ATTR_WO(fault_clear);
+static LP5812_DEV_ATTR_RO(tsd_config_status);
+
+static struct attribute *lp5812_chip_attributes[] = {
+	&dev_attr_device_enable.attr,
+	&dev_attr_device_command.attr,
+	&dev_attr_device_reset.attr,
+	&dev_attr_fault_clear.attr,
+	&dev_attr_dev_config.attr,
+	&dev_attr_tsd_config_status.attr,
+	NULL,
+};
+
+static ssize_t led_enable_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	u8 val = 0;
+	u16 reg = 0;
+	u8 reg_val = 0;
+	int ret = 0;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	if (led->led_number < 0x8)
+		reg = LED_ENABLE_1_REG;
+	else
+		reg = LED_ENABLE_2_REG;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_read(chip, reg, &reg_val);
+	mutex_unlock(&chip->lock);
+	if (ret)
+		return -EIO;
+
+	val = (reg_val & (1 << (led->led_number % 8))) ? 1 : 0;
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t led_enable_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	u16 reg = 0;
+	u8 reg_val = 0;
+	int ret = 0;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+
+	if (val != 0 && val != 1)
+		return -EINVAL;
+
+	pr_info("[DEBUG]: %s set %s\n", led->led_name,
+		val ? "enable" : "disable");
+
+	if (led->led_number < 0x8)
+		reg = LED_ENABLE_1_REG;
+	else
+		reg = LED_ENABLE_2_REG;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret != 0) {
+		pr_err("Read register 0x%02X failed\n", reg);
+	} else {
+		if (val == 0) {
+			ret = lp5812_write(chip, reg,
+				reg_val & (~(1 << (led->led_number % 8))));
+			if (ret != 0)
+				pr_err("Write register 0x%02X failed\n", reg);
+		} else {
+			ret = lp5812_write(chip, reg,
+				reg_val | (1 << (led->led_number % 8)));
+			if (ret != 0)
+				pr_err("Write register 0x%02X failed\n", reg);
+		}
+	}
+	mutex_unlock(&chip->lock);
+
+	if (ret)
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t led_mode_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	enum control_mode mode;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_get_led_mode(chip, led->led_number, &mode);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("lp5812_get_led_mode failed\n");
+		return -EIO;
+	}
+
+	return sprintf(buf, "%s\n", AUTONOMOUS == mode ? "autonomous" : "manual");
+}
+
+static ssize_t led_mode_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val, ret;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	if (sysfs_streq(buf, "manual")) {
+		/* Remove AEU sysfs interface for current led in manual mode */
+		aeu_remove_multi_sysfs_groups(led);
+		val = 0;
+	} else if (sysfs_streq(buf, "autonomous")) {
+		val = 1;
+	} else {
+		return -EINVAL;
+	}
+
+	pr_info("[DEBUG]: %s select mode %s\n", led->led_name,
+			val ? "autonomous" : "manual");
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_set_led_mode(chip, led->led_number,
+			val ? AUTONOMOUS : MANUAL);
+	if (ret) {
+		pr_err("lp5812_set_led_mode failed\n");
+		ret = -EIO;
+		goto out;
+	}
+
+	ret = aeu_create_multi_sysfs_groups(led);
+	if (ret) {
+		pr_err("%s: aeu_create_multi_sysfs_groups() failed\n",
+				__func__);
+		goto out;
+	}
+
+	mutex_unlock(&chip->lock);
+	return count;
+out:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+static ssize_t led_manual_dc_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int manual_dc;
+	int ret;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	ret = kstrtoint(buf, 0, &manual_dc);
+	if (ret)
+		return ret;
+
+	if (manual_dc < 0 || manual_dc > 255)
+		return -EINVAL; /* Invalid argument */
+
+	/* set to hardware */
+	mutex_lock(&chip->lock);
+	if (lp5812_manual_dc_pwm_control(chip, led->led_number,
+		manual_dc, ANALOG)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t led_manual_dc_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	u8 val;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	if (lp5812_manual_dc_pwm_read(chip, led->led_number, &val, ANALOG)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t led_manual_pwm_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int manual_pwm;
+	int ret;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	ret = kstrtoint(buf, 0, &manual_pwm);
+	if (ret)
+		return ret;
+
+	if (manual_pwm < 0 || manual_pwm > 255)
+		return -EINVAL; /* Invalid argument */
+
+	/* set to hardware */
+	mutex_lock(&chip->lock);
+	if (lp5812_manual_dc_pwm_control(chip, led->led_number,
+		manual_pwm, PWM)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t led_manual_pwm_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	u8 val;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	if (lp5812_manual_dc_pwm_read(chip, led->led_number, &val, PWM)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t led_auto_dc_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int auto_dc;
+	int ret;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	ret = kstrtoint(buf, 0, &auto_dc);
+	if (ret)
+		return ret;
+
+	if (auto_dc < 0 || auto_dc > 255)
+		return -EINVAL; /* Invalid argument */
+
+	/* set to hardware */
+	mutex_lock(&chip->lock);
+	if (lp5812_autonomous_dc_pwm_control(chip, led->led_number,
+			auto_dc, ANALOG)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t led_auto_dc_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	u8 val;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	if (lp5812_autonomous_dc_pwm_read(chip, led->led_number,
+			&val, ANALOG)) {
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+	return sprintf(buf, "%d\n", val);
+}
+
+static int parse_autonomous_animation_config(struct lp5812_led *led,
+		const char *user_buf)
+{
+	int ret;
+	int i;
+	char *str;
+	char *sub_str;
+	int aeu_select, start_pause_time, stop_pause_time, led_playback_time;
+
+	str = kmalloc(strlen(user_buf) + 1, GFP_KERNEL);
+	if (!str)
+		return -ENOMEM;
+	strscpy(str, user_buf, strlen(user_buf) + 1);
+
+	/* parse aeu_select */
+	sub_str = strsep(&str, ":");
+	pr_info("aeu_select: %s\n", sub_str);
+	ret = kstrtoint(sub_str, 0, &aeu_select);
+	if (ret)
+		return ret;
+	if (aeu_select < 1 || aeu_select > 3)
+		return -EINVAL;
+
+	aeu_remove_multi_sysfs_groups(led);
+
+	for (i = 0; i < aeu_select; i++)
+		aeu_create_sysfs_group(&led->aeu[i]);
+	led->led_playback.s_led_playback.aeu_selection = aeu_select - 1;
+
+	/* parse start_pause_time */
+	sub_str = strsep(&str, ":");
+	if (sub_str) {
+		pr_info("start_pause_time: %s\n", sub_str);
+		ret = kstrtoint(sub_str, 0, &start_pause_time);
+		if (ret)
+			return ret;
+		if (start_pause_time < 0 || start_pause_time > 15)
+			return -EINVAL;
+		led->start_stop_pause_time.s_time.second = start_pause_time;
+	} else {
+		pr_info("start_pause_time is max: %s\n", "8.05s");
+		led->start_stop_pause_time.s_time.second = 15;
+	}
+
+	/* parse stop_pause_time */
+	sub_str = strsep(&str, ":");
+	if (sub_str) {
+		pr_info("stop_pause_time: %s\n", sub_str);
+		ret = kstrtoint(sub_str, 0, &stop_pause_time);
+		if (ret)
+			return ret;
+		if (stop_pause_time < 0 || stop_pause_time > 15)
+			return -EINVAL;
+		led->start_stop_pause_time.s_time.first = stop_pause_time;
+	} else {
+		pr_info("stop_pause_time is max: %s\n", "8.05s");
+		led->start_stop_pause_time.s_time.first = 15;
+	}
+
+	/* parse led_playback_time */
+	sub_str = strsep(&str, ":");
+	if (sub_str) {
+		pr_info("led_playback_time: %s\n", sub_str);
+		ret = kstrtoint(sub_str, 0, &led_playback_time);
+		if (ret)
+			return ret;
+		if (led_playback_time < 0 || led_playback_time > 15)
+			return -EINVAL;
+		led->led_playback.s_led_playback.led_playback_time =
+			led_playback_time;
+	} else {
+		pr_info("led_playback_time is infinite times\n");
+		led->led_playback.s_led_playback.led_playback_time = 15;
+	}
+
+	return 0;
+}
+
+static ssize_t led_auto_animation_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int ret;
+	enum control_mode led_mode;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	/* First check the mode of led is manual or autonomous */
+	ret = lp5812_get_led_mode(chip, led->led_number, &led_mode);
+	if (ret) {
+		pr_err("[DEBUG]: %s: lp5812_get_led_mode failed\n", __func__);
+		ret = -EIO;
+		goto out;
+	}
+
+	if (led_mode == AUTONOMOUS) {
+		ret = parse_autonomous_animation_config(led, buf);
+		if (ret) {
+			pr_err("%s: parse_autonomous_animation_config failed\n",
+				__func__);
+			goto out;
+		}
+		/* Write data to hardware */
+		ret = led_set_autonomous_animation_config(led);
+		if (ret) {
+			ret = -EIO;
+			goto out;
+		}
+	}
+	mutex_unlock(&chip->lock);
+	return count;
+
+out:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+static ssize_t led_auto_animation_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	char tmp_str[256] = {};
+	char usage[128] = {};
+	char *aeu_select = "AEU Select: ";
+	char *start_pause_time = "Start pause time: ";
+	char *stop_pause_time = "; Stop pause time: ";
+	char *led_playback_time = "; LED Playback time: ";
+	int aeu_selection, playback_time, start_pause, stop_pause;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	sprintf(usage, "%s%s",
+	"Command usage: echo (aeu number):(start pause time):",
+	"(stop pause time):(playback time) > autonomous_animation");
+
+	mutex_lock(&chip->lock);
+	ret = led_get_autonomous_animation_config(led);
+	if (ret) {
+		ret = -EIO;
+		goto out;
+	}
+
+	/* parse config and feedback to userspace */
+	aeu_selection = led->led_playback.s_led_playback.aeu_selection;
+	playback_time = led->led_playback.s_led_playback.led_playback_time;
+	start_pause = led->start_stop_pause_time.s_time.second;
+	stop_pause = led->start_stop_pause_time.s_time.first;
+	if (aeu_selection == ONLY_AEU1) {
+		sprintf(tmp_str, "%s%s%s%s%s%s%s%s\n", aeu_select,
+		"Only use AEU1; ", start_pause_time,
+		time_name_array[start_pause], stop_pause_time,
+		time_name_array[stop_pause], led_playback_time,
+		led_playback_time_arr[playback_time]);
+	} else if (aeu_selection == AEU1_AEU2) {
+		sprintf(tmp_str, "%s%s%s%s%s%s%s%s\n", aeu_select,
+		"Use AEU1 and AEU2; ", start_pause_time,
+		time_name_array[start_pause], stop_pause_time,
+		time_name_array[stop_pause], led_playback_time,
+		led_playback_time_arr[playback_time]);
+	} else {
+		sprintf(tmp_str, "%s%s%s%s%s%s%s%s\n", aeu_select,
+		"Use AEU1,AEU2 and AEU3; ", start_pause_time,
+		time_name_array[start_pause], stop_pause_time,
+		time_name_array[stop_pause], led_playback_time,
+		led_playback_time_arr[playback_time]);
+	}
+	strcat(tmp_str, usage);
+	mutex_unlock(&chip->lock);
+	return sprintf(buf, "%s\n", tmp_str);
+
+out:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+static ssize_t led_lod_lsd_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 lsd_status, lod_status;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_read_lsd_status(chip, led->led_number, &lsd_status);
+	if (ret) {
+		pr_err("lp5812_read_lsd_status failed\n");
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+
+	ret = lp5812_read_lod_status(chip, led->led_number, &lod_status);
+	if (ret) {
+		pr_err("lp5812_read_lod_status failed\n");
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return sprintf(buf, "%d %d\n", lod_status, lsd_status);
+}
+
+static ssize_t led_auto_pwm_val_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 auto_pwm_val;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_read_auto_pwm_value(chip, led->led_number, &auto_pwm_val);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("lp5812_read_auto_pwm_value failed\n");
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", auto_pwm_val);
+}
+
+static ssize_t led_aep_status_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 aep_status;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_read_aep_status(chip, led->led_number, &aep_status);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("lp5812_read_auto_pwm_value failed\n");
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", aep_status);
+}
+
+static ssize_t led_pwm_phase_align_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val, ret;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	if (sysfs_streq(buf, "forward"))
+		val = 0;
+	else if (sysfs_streq(buf, "middle"))
+		val = 2;
+	else if (sysfs_streq(buf, "backward"))
+		val = 3;
+	else
+		return -EINVAL;
+	mutex_lock(&chip->lock);
+	ret = lp5812_set_phase_align(chip, led->led_number, val);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("lp5812_set_phase_align failed\n");
+		return -EIO;
+	}
+
+	return count;
+}
+
+static ssize_t led_pwm_phase_align_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int val, ret;
+	char *str;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_get_phase_align(chip, led->led_number, &val);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("lp5812_get_phase_align failed\n");
+		return -EIO;
+	}
+	if (val == 0 || val == 1)
+		str = "forward";
+	else if (val == 2)
+		str = "middle";
+	else
+		str = "backward";
+
+	return sprintf(buf, "%s\n", str);
+}
+
+static ssize_t led_pwm_dimming_scale_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val, ret;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	if (sysfs_streq(buf, "linear"))
+		val = 0;
+	else if (sysfs_streq(buf, "exponential"))
+		val = 1;
+	else
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_set_pwm_dimming_scale(chip, led->led_number,
+			val ? EXPONENTIAL : LINEAR);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("lp5812_set_pwm_dimming_scale failed\n");
+		return -EIO;
+	}
+
+	return count;
+}
+
+static ssize_t led_pwm_dimming_scale_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	enum pwm_dimming_scale scale;
+	struct lp5812_led *led = to_lp5812_led(kobj);
+	struct lp5812_chip *chip = led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = lp5812_get_pwm_dimming_scale(chip, led->led_number, &scale);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("lp5812_get_pwm_dimming_scale failed\n");
+		return -EIO;
+	}
+
+	return sprintf(buf, "%s\n",
+		scale == EXPONENTIAL ? "exponential" : "linear");
+}
+
+static LP5812_KOBJ_ATTR_RW(enable, led_enable_show, led_enable_store);
+static LP5812_KOBJ_ATTR_RW(mode, led_mode_show, led_mode_store);
+static LP5812_KOBJ_ATTR_RW(manual_dc, led_manual_dc_show,
+		led_manual_dc_store);
+static LP5812_KOBJ_ATTR_RW(manual_pwm, led_manual_pwm_show,
+		led_manual_pwm_store);
+static LP5812_KOBJ_ATTR_RW(autonomous_dc, led_auto_dc_show,
+		led_auto_dc_store);
+static LP5812_KOBJ_ATTR_RW(autonomous_animation, led_auto_animation_show,
+		led_auto_animation_store);
+static LP5812_KOBJ_ATTR_RW(pwm_phase_align, led_pwm_phase_align_show,
+		led_pwm_phase_align_store);
+static LP5812_KOBJ_ATTR_RW(pwm_dimming_scale, led_pwm_dimming_scale_show,
+		led_pwm_dimming_scale_store);
+static LP5812_KOBJ_ATTR_RO(lod_lsd, led_lod_lsd_show);
+static LP5812_KOBJ_ATTR_RO(auto_pwm_val, led_auto_pwm_val_show);
+static LP5812_KOBJ_ATTR_RO(aep_status, led_aep_status_show);
+
+static struct attribute *led_kobj_attributes[] = {
+	&kobj_attr_enable.attr,
+	&kobj_attr_mode.attr,
+	&kobj_attr_manual_dc.attr,
+	&kobj_attr_manual_pwm.attr,
+	&kobj_attr_autonomous_dc.attr,
+	&kobj_attr_autonomous_animation.attr,
+	&kobj_attr_lod_lsd.attr,
+	&kobj_attr_auto_pwm_val.attr,
+	&kobj_attr_aep_status.attr,
+	&kobj_attr_pwm_phase_align.attr,
+	&kobj_attr_pwm_dimming_scale.attr,
+	NULL,
+};
+
+static ssize_t aeu_pwm1_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+	if (val < 0 || val > 255)
+		return -EINVAL; /* Invalid argument */
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_set_val(aeu, val, PWM1);
+	if (ret != 0) {
+		pr_err("Failed to set aeu pwm1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_pwm1_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_get_val(aeu, &val, PWM1);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu pwm1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_pwm2_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+	if (val < 0 || val > 255)
+		return -EINVAL; /* Invalid argument */
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_set_val(aeu, val, PWM2);
+	if (ret != 0) {
+		pr_err("Failed to set aeu pwm1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_pwm2_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_get_val(aeu, &val, PWM2);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu pwm1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_pwm3_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+	if (val < 0 || val > 255)
+		return -EINVAL; /* Invalid argument */
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_set_val(aeu, val, PWM3);
+	if (ret != 0) {
+		pr_err("Failed to set aeu pwm1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_pwm3_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_get_val(aeu, &val, PWM3);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu pwm1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_pwm4_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+	if (val < 0 || val > 255)
+		return -EINVAL; /* Invalid argument */
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_set_val(aeu, val, PWM4);
+	if (ret != 0) {
+		pr_err("Failed to set aeu pwm1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_pwm4_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_get_val(aeu, &val, PWM4);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu pwm1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_pwm5_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+	if (val < 0 || val > 255)
+		return -EINVAL; /* Invalid argument */
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_set_val(aeu, val, PWM5);
+	if (ret != 0) {
+		pr_err("Failed to set aeu pwm1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_pwm5_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_pwm_get_val(aeu, &val, PWM5);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu pwm1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_slope_time_t1_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+
+	if (val < 0x00 || val > 0x0F)
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_slope_time_set_val(aeu, val, SLOPE_T1);
+	if (ret != 0) {
+		pr_err("Failed to set aeu slope time t1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_slope_time_t1_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_slope_time_get_val(aeu, &val, SLOPE_T1);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu slope time t1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_slope_time_t2_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+
+	if (val < 0x00 || val > 0x0F)
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_slope_time_set_val(aeu, val, SLOPE_T2);
+	if (ret != 0) {
+		pr_err("Failed to set aeu slope time t1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_slope_time_t2_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_slope_time_get_val(aeu, &val, SLOPE_T2);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu slope time t1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_slope_time_t3_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+
+	if (val < 0x00 || val > 0x0F)
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_slope_time_set_val(aeu, val, SLOPE_T3);
+	if (ret != 0) {
+		pr_err("Failed to set aeu slope time t1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_slope_time_t3_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_slope_time_get_val(aeu, &val, SLOPE_T3);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu slope time t1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_slope_time_t4_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+
+	if (val < 0x00 || val > 0x0F)
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_slope_time_set_val(aeu, val, SLOPE_T4);
+	if (ret != 0) {
+		pr_err("Failed to set aeu slope time t1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_slope_time_t4_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_slope_time_get_val(aeu, &val, SLOPE_T4);
+	mutex_unlock(&chip->lock);
+	if (ret) {
+		pr_err("Failed to get aeu slope time t1 for %s",
+				aeu->led->led_name);
+		return -EIO;
+	}
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t aeu_playback_time_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int val = 0;
+	int ret = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return -EINVAL;
+
+	if (val < 0 || val > 3)
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_playback_time_set_val(aeu, val);
+	if (ret != 0) {
+		pr_err("Failed to set aeu playback time t1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return count;
+}
+
+static ssize_t aeu_playback_time_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	int ret = 0;
+	u8 val = 0;
+	struct anim_engine_unit *aeu = to_anim_engine_unit(kobj);
+	struct lp5812_chip *chip = aeu->led->priv;
+
+	mutex_lock(&chip->lock);
+	ret = led_aeu_playback_time_get_val(aeu, &val);
+	if (ret != 0) {
+		pr_err("Failed to get aeu playback time t1 for %s",
+				aeu->led->led_name);
+		mutex_unlock(&chip->lock);
+		return -EIO;
+	}
+	mutex_unlock(&chip->lock);
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static LP5812_KOBJ_ATTR_RW(pwm1, aeu_pwm1_show, aeu_pwm1_store);
+static LP5812_KOBJ_ATTR_RW(pwm2, aeu_pwm2_show, aeu_pwm2_store);
+static LP5812_KOBJ_ATTR_RW(pwm3, aeu_pwm3_show, aeu_pwm3_store);
+static LP5812_KOBJ_ATTR_RW(pwm4, aeu_pwm4_show, aeu_pwm4_store);
+static LP5812_KOBJ_ATTR_RW(pwm5, aeu_pwm5_show, aeu_pwm5_store);
+static LP5812_KOBJ_ATTR_RW(slope_time_t1, aeu_slope_time_t1_show,
+		aeu_slope_time_t1_store);
+static LP5812_KOBJ_ATTR_RW(slope_time_t2, aeu_slope_time_t2_show,
+		aeu_slope_time_t2_store);
+static LP5812_KOBJ_ATTR_RW(slope_time_t3, aeu_slope_time_t3_show,
+		aeu_slope_time_t3_store);
+static LP5812_KOBJ_ATTR_RW(slope_time_t4, aeu_slope_time_t4_show,
+		aeu_slope_time_t4_store);
+static LP5812_KOBJ_ATTR_RW(playback_time, aeu_playback_time_show,
+		aeu_playback_time_store);
+
+static struct attribute *aeu_kobj_attributes[] = {
+	&kobj_attr_pwm1.attr,
+	&kobj_attr_pwm2.attr,
+	&kobj_attr_pwm3.attr,
+	&kobj_attr_pwm4.attr,
+	&kobj_attr_pwm5.attr,
+	&kobj_attr_slope_time_t1.attr,
+	&kobj_attr_slope_time_t2.attr,
+	&kobj_attr_slope_time_t3.attr,
+	&kobj_attr_slope_time_t4.attr,
+	&kobj_attr_playback_time.attr,
+	NULL,
+};
+
+static void aeu_init_properties(struct lp5812_led *led)
+{
+	int i;
+
+	for (i = 0; i < MAX_AEU; i++) {
+		led->aeu[i].aeu_name = aeu_name_array[i];
+		led->aeu[i].aeu_number = i + 1;
+		led->aeu[i].led = led;
+		led->aeu[i].enabled = 0;
+		led->aeu[i].attr_group.attrs = aeu_kobj_attributes;
+		kobject_init(&led->aeu[i].kobj, &aeu_ktype);
+	}
+}
+
+static int lp5812_probe(struct i2c_client *client,
+		const struct i2c_device_id *id)
+{
+	struct lp5812_chip *chip;
+	int i;
+	int ret;
+	u8 val;
+
+	chip = devm_kzalloc(&client->dev, sizeof(struct lp5812_chip),
+			GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+	mutex_init(&chip->lock);
+	chip->i2c_cl = client;
+	chip->dev = &client->dev;
+	chip->regs = &regs;
+	chip->command = NONE;
+	chip->total_leds = MAX_LEDS;
+	chip->attr_group.name = "lp5812_chip_setup";
+	chip->attr_group.attrs = lp5812_chip_attributes;
+	chip->chip_leds_map = chip_leds_map;
+	chip->u_drive_mode.drive_mode_val = 0x10;
+	chip->u_scan_order.scan_order_val = 0x00;
+
+	/* initialize property for each led */
+	for (i = 0; i < MAX_LEDS; i++) {
+		chip->leds[i].led_name = led_name_array[i];
+		chip->leds[i].led_number = i;
+		chip->leds[i].anim_base_addr = anim_base_addr_array[i];
+		chip->leds[i].enable = 0; /* LED disable as default */
+		chip->leds[i].mode = MANUAL; /* manual mode as default */
+		chip->leds[i].priv = chip;
+		chip->leds[i].total_aeu = MAX_AEU;
+		chip->leds[i].led_playback.led_playback_val = 0;
+		chip->leds[i].start_stop_pause_time.time_val = 0;
+		/* sysfs for this led not be created */
+		chip->leds[i].is_sysfs_created = 0;
+		chip->leds[i].attr_group.attrs = led_kobj_attributes;
+		kobject_init(&chip->leds[i].kobj, &led_ktype);
+
+		/* init animation engine unit properties */
+		aeu_init_properties(&chip->leds[i]);
+
+		/* set autonomous animation config as default for all LEDs */
+		led_set_autonomous_animation_config(&chip->leds[i]);
+	}
+
+	i2c_set_clientdata(client, chip);
+
+	ret = sysfs_create_group(&chip->dev->kobj, &chip->attr_group);
+	if (ret) {
+		pr_info("[DEBUG]: sysfs_create_group failed\n");
+		return ret;
+	}
+	pr_info("[DEBUG]: sysfs_create_group successfully\n");
+
+	ret = lp5812_init_dev_config(chip, "tcmscan:4:0:1:2:3", 0);
+	if (ret) {
+		pr_info("[DEBUG]: %s: lp5812_init_dev_config failed\n",
+			__func__);
+		return ret;
+	}
+	pr_info("[DEBUG]: lp5812_init_dev_config successfully\n");
+	/* initialize lp5812 chip */
+	ret = lp5812_initialize(chip);
+
+	/* code to verify i2c read/write ok or not */
+	lp5812_read(chip, (u16)DEV_CONFIG2, &val);
+	pr_info("[DEBUG]: DEV_CONFIG2 value: 0x%02X\n", val);
+
+	lp5812_write(chip, (u16)LED_A1_AUTO_BASE_ADRR, 0x14);
+	lp5812_read(chip, (u16)LED_A1_AUTO_BASE_ADRR, &val);
+	pr_info("[DEBUG]: LED_A1_AUTO_BASE_ADRR value: 0x%02X\n", val);
+	/* End code to verify i2c read/write*/
+
+	return 0;
+}
+
+static void lp5812_remove(struct i2c_client *client)
+{
+	struct lp5812_chip *chip = i2c_get_clientdata(client);
+
+	mutex_destroy(&chip->lock);
+	leds_remove_existed_sysfs(chip);
+	sysfs_remove_group(&chip->dev->kobj, &chip->attr_group);
+
+	/* Disable all Leds */
+	lp5812_disable_all_leds(chip);
+
+	/* Disable lp5812 device */
+	lp5812_enable_disable(chip, 0);
+}
+
+static const struct i2c_device_id lp5812_id[] = {
+	{ "lp5812", 0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, lp5812_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_lp5812_match[] = {
+	{ .compatible = "ti,lp5812", },
+	{/* NULL */},
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
+	.probe          = lp5812_probe,
+	.remove         = lp5812_remove,
+	.id_table       = lp5812_id,
+};
+
+module_i2c_driver(lp5812_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LP5812 LED Driver");
+MODULE_AUTHOR("Jared Zhou");
+MODULE_LICENSE("GPL");
-- 
2.25.1


