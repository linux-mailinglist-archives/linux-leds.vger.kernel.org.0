Return-Path: <linux-leds+bounces-6283-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CF2C7E641
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 20:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904CA3A8CB3
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 19:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2309C223328;
	Sun, 23 Nov 2025 19:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcS4NAY7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AE2238C0D
	for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763925071; cv=none; b=B9Ro3RJNLkU4Tynn9HJcyu4DFKQAbbDdnTzO+mh7+SQZsw9HDHRguY1yfZhKMzWdI1/wsdaz/o4MfCPH+mfg/CbAhOEIW7mmbQOwoW52/VA7F90KG6IxbDFEpeHdhgCtMqLVs5G0wM9QeNO5mcLgvuR6naQoSy7elgZGODMVf28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763925071; c=relaxed/simple;
	bh=O18plpShV+fchMUltKYvzGY56U0ZJBnotTRON8MyPm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krcGbXkr4GLR90R6F/9yN7WYeFzXSYYwT0rwnkcNmFAqZTAqh2doj8KfQLSjG07A9linjvstZVC1r5oDcjsVQQYVBzLhHctBQuTkly8Sug6LT1/SAFMlnfsa5+Ojc7Hbg/ShoEdNZlEq/3n77OqEe3cpIeINawtoZy0zJtT9Yq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcS4NAY7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2984dfae0acso57101345ad.0
        for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 11:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763925067; x=1764529867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyY8yfoYlTTD3ZiROTexVERYQH2FovLAoeHxnuHoIL4=;
        b=YcS4NAY7kWUneQlvkTqVw9RmRdiBmVWiwfffEE0gQbg+4Vx4WSskEaXyknMnJDvmyy
         uWcEO2V78/QUeeepMoGBVoZX5SdnBhu/o3rllhjzi7KML5KXsSwtBzJQ9841KFwQuy+6
         0oVUcsS0tGX0CXLE4DntzK/U8dNycLQ4M8jtUIFG9TEmNwfVLk8dTWHSU8ryguPAZ3Fu
         PS+uuOdaAYoSGjd8HAWKxzsoeOatGBpAM8cIJtu9875iIVZLDwMWMGTlGz69t4xAXuKc
         ocl+U3AmLokJZLHR9twRjQSYhBdI5Y2nsWAELtaf0WJiRF/AW2Hfg668VRdQ+yOWv5Op
         tNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763925067; x=1764529867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyY8yfoYlTTD3ZiROTexVERYQH2FovLAoeHxnuHoIL4=;
        b=MgxNBgjmq5X+UVidX7orx5+tzFqTL5r8KMh8hZzbEfGT6ARbQw2JkKfL2wKtujRkCh
         lskak/gJafr5/dlfTwus4/cUnbgCruvTJFi4LBXVMQGdh28VVQyy55gVt5FYN93Hn3gl
         XzFV90+IjU2oG8tlLKyAcPVGVmSLZVcqOfJ3SKcosQvZ8738qRMFFaCNcQ62u9Eo7Xoo
         xLk2sJX8ntCvZmoZk3au1eszbnZDI5M6nvn9lb85dZ9B5PTyUQKkakbVbaHtGOwOvZEm
         NwxF6/5eHFHIT0mjTpKTunZekDqyMdgSdiPw+qKNYQgbRBD74U0NvFtqZeRMHIIzTEPp
         R9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXfHUpqinb1qd0HGa919MECd/eGJaCxB4jR/NPUqHhKxXBpmxBX6uROxuAwY3QCAbyRLZn0+GrDftga@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+LeiVRkSzgFg5Gr4yBVeqPStls8vxwbNkGaVYSRewjqHH7B/
	JFI0easWoBFvbVtY2nirFx5bbUzAQJSL/J59HEiNOVcUqSxBfdhGjXKy
X-Gm-Gg: ASbGncuQoaUIkP8ifzhlB87ZhrzSne924WeiwNSc7JfKw8VHg9LqUeGDwqDQdSva5pp
	JMJxdkJSe8NjM/0WimhtA7xSn651fUquJ9iWIxokORbNyMHkmaMJbiC6GPRtVLelcCTc7yKOFQ+
	/Fl6DXdEa2iU8AS4HgiGxI9s0DRPTQ2Mkvx5AG1zvp44e74G85lP0LA3LQAwvunKqFbXWQ1g4Ag
	zMc/mNa6nmNvy9vU2cY2mTMbG3zZjmugMfXb29pNXuzdamQTZp6YJjpcVZShgII71R/q84hnouq
	qb8cbNe2MKjqtSSUXAV3aEsDAng8F31MJEkMSeBOu5UX7Fqe1EwkGRxoux24VcSKbZPjWmYn3Y5
	Kf78kd8L4sCjGsar8wmvNLGxKtoFU5RJ0KFHqcumaeQHxpuqVrbaKflD8Nq0+7XgpiFD4vdyRxI
	ym13ZoUiVjrfgL0Mv8q+NBdg==
X-Google-Smtp-Source: AGHT+IEdn990VS6mIQgE7tE5DSzyxK+qGQZSd+broKw5osyU92CnIjEPsGRx3SdB01/BLY7WtxSiZg==
X-Received: by 2002:a17:903:2985:b0:298:1830:6ada with SMTP id d9443c01a7336-29b6bf19c83mr111145565ad.30.1763925066725;
        Sun, 23 Nov 2025 11:11:06 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm109542655ad.42.2025.11.23.11.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 11:11:05 -0800 (PST)
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
Subject: [PATCH v18 2/3] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Mon, 24 Nov 2025 02:10:41 +0700
Message-Id: <20251123191042.116917-3-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123191042.116917-1-trannamatk@gmail.com>
References: <20251123191042.116917-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LP5812 is a 4x3 matrix RGB LED driver with an autonomous animation
engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
4 RGB LEDs. Each LED can be configured through the related registers
to realize vivid and fancy lighting effects.

This patch adds minimal driver support for the LP5812, implementing
only the essential functionality: I2C communication with the device,
LED registration, brightness control in manual mode, and basic sysfs
interfaces for LED configuration and fault monitoring.

This patch adds minimal driver support for the LP5812, implementing
only the essential functionality: I2C communication with the device,
LED registration, brightness control in manual mode, and basic sysfs
interfaces for LED configuration and fault monitoring.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 MAINTAINERS                    |   4 +
 drivers/leds/rgb/Kconfig       |  13 +
 drivers/leds/rgb/Makefile      |   1 +
 drivers/leds/rgb/leds-lp5812.c | 646 +++++++++++++++++++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h | 172 +++++++++
 5 files changed, 836 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 22da152c3c87..9a7ae1794328 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25453,6 +25453,10 @@ M:	Nam Tran <trannamatk@gmail.com>
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
index 000000000000..21515d97913e
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5812.c
@@ -0,0 +1,646 @@
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
+	return lp5812_read(chip, LP5812_TSD_CONFIG_STATUS, reg_val);
+}
+
+static int lp5812_update_regs_config(struct lp5812_chip *chip)
+{
+	u8 reg_val;
+	int ret;
+
+	ret = lp5812_write(chip, LP5812_CMD_UPDATE, LP5812_UPDATE_CMD_VAL);
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
+		if (!sysfs_streq(str, chip_mode_map[i].mode_name))
+			continue;
+
+		chip->u_drive_mode.s_drive_mode.led_mode = chip_mode_map[i].mode;
+		chip->u_scan_order.s_scan_order.scan_order_0 = chip_mode_map[i].scan_order_0;
+		chip->u_scan_order.s_scan_order.scan_order_1 = chip_mode_map[i].scan_order_1;
+		chip->u_scan_order.s_scan_order.scan_order_2 = chip_mode_map[i].scan_order_2;
+		chip->u_scan_order.s_scan_order.scan_order_3 = chip_mode_map[i].scan_order_3;
+
+		switch (chip_mode_map[i].selection_led) {
+		case LP5812_MODE_MIX_SELECT_LED_0:
+			chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = true;
+			break;
+		case LP5812_MODE_MIX_SELECT_LED_1:
+			chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = true;
+			break;
+		case LP5812_MODE_MIX_SELECT_LED_2:
+			chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = true;
+			break;
+		case LP5812_MODE_MIX_SELECT_LED_3:
+			chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = true;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		return 0;
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
+	val = chip->u_drive_mode.drive_mode_val;
+	ret = lp5812_write(chip, LP5812_DEV_CONFIG1, val);
+	if (ret)
+		return ret;
+
+	val = chip->u_scan_order.scan_order_val;
+	ret = lp5812_write(chip, LP5812_DEV_CONFIG2, val);
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
+	/*
+	 * Select device configuration register.
+	 * Reg3 for LED_0–LED_3, LED_A0–A2, LED_B0
+	 * Reg4 for LED_B1–B2, LED_C0–C2, LED_D0–D2
+	 */
+	if (led_number < LP5812_NUMBER_LED_IN_REG)
+		reg = LP5812_DEV_CONFIG3;
+	else
+		reg = LP5812_DEV_CONFIG4;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret)
+		return ret;
+
+	if (mode == LP5812_MODE_MANUAL)
+		reg_val &= ~(LP5812_ENABLE << (led_number % LP5812_NUMBER_LED_IN_REG));
+	else
+		reg_val |= (LP5812_ENABLE << (led_number % LP5812_NUMBER_LED_IN_REG));
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
+		led_base_reg = LP5812_MANUAL_DC_BASE;
+	else
+		led_base_reg = LP5812_MANUAL_PWM_BASE;
+
+	ret = lp5812_write(chip, led_base_reg + led_number, val);
+
+	return ret;
+}
+
+static int lp5812_multicolor_brightness(struct lp5812_led *led)
+{
+	struct lp5812_chip *chip = led->chip;
+	int ret, i;
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
+
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
+
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
+		mc_led_info = devm_kcalloc(dev, chip->led_config[chan].num_colors,
+					   sizeof(*mc_led_info), GFP_KERNEL);
+		if (!mc_led_info)
+			return -ENOMEM;
+
+		led_cdev = &led->mc_cdev.led_cdev;
+		led_cdev->name = led->cdev.name;
+		led_cdev->brightness_set_blocking = lp5812_set_mc_brightness;
+		led->mc_cdev.num_colors = chip->led_config[chan].num_colors;
+
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
+static int lp5812_register_leds(struct lp5812_led *leds, struct lp5812_chip *chip)
+{
+	struct lp5812_led *led;
+	int num_channels = chip->num_channels;
+	u8 reg_val;
+	u16 reg;
+	int ret, i, j;
+
+	for (i = 0; i < num_channels; i++) {
+		led = &leds[i];
+		ret = lp5812_init_led(led, chip, i);
+		if (ret)
+			goto err_init_led;
+
+		led->chip = chip;
+
+		for (j = 0; j < chip->led_config[i].num_colors; j++) {
+			ret = lp5812_write(chip,
+					   LP5812_AUTO_DC_BASE + chip->led_config[i].led_id[j],
+					   chip->led_config[i].max_current[j]);
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
+				LP5812_LED_EN_1 : LP5812_LED_EN_2;
+
+			ret = lp5812_read(chip, reg, &reg_val);
+			if (ret)
+				goto err_init_led;
+
+			reg_val |= (LP5812_ENABLE << (chip->led_config[i].led_id[j] %
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
+	ret = lp5812_write(chip, LP5812_REG_ENABLE, LP5812_ENABLE);
+	if (ret) {
+		dev_err(&chip->client->dev, "failed to enable LP5812 device\n");
+		return ret;
+	}
+
+	ret = lp5812_write(chip, LP5812_DEV_CONFIG12, LP5812_LSD_LOD_START_UP);
+	if (ret) {
+		dev_err(&chip->client->dev, "failed to configure device safety thresholds\n");
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
+		dev_err(&chip->client->dev, "failed to apply configuration updates\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void lp5812_deinit_device(struct lp5812_chip *chip)
+{
+	lp5812_write(chip, LP5812_LED_EN_1, LP5812_DISABLE);
+	lp5812_write(chip, LP5812_LED_EN_2, LP5812_DISABLE);
+	lp5812_write(chip, LP5812_REG_ENABLE, LP5812_DISABLE);
+}
+
+static int lp5812_parse_led_channel(struct device_node *np,
+				    struct lp5812_led_config *cfg,
+				    int color_number)
+{
+	int color_id, reg, ret;
+	u32 max_cur;
+
+	ret = of_property_read_u32(np, "reg", &reg);
+	if (ret)
+		return ret;
+
+	cfg->led_id[color_number] = reg;
+
+	ret = of_property_read_u32(np, "led-max-microamp", &max_cur);
+	if (ret)
+		max_cur = 0;
+	/* Convert microamps to driver units */
+	cfg->max_current[color_number] = max_cur / 100;
+
+	ret = of_property_read_u32(np, "color", &color_id);
+	if (ret)
+		color_id = 0;
+	cfg->color_id[color_number] = color_id;
+
+	return 0;
+}
+
+static int lp5812_parse_led(struct device_node *np,
+			    struct lp5812_led_config *cfg,
+			    int led_index)
+{
+	int num_colors, ret;
+
+	ret = of_property_read_string(np, "label", &cfg[led_index].name);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "reg", &cfg[led_index].chan_nr);
+	if (ret)
+		return ret;
+
+	num_colors = 0;
+	for_each_available_child_of_node_scoped(np, child) {
+		ret = lp5812_parse_led_channel(child, &cfg[led_index], num_colors);
+		if (ret)
+			return ret;
+
+		num_colors++;
+	}
+
+	if (num_colors == 0) {
+		ret = lp5812_parse_led_channel(np, &cfg[led_index], 0);
+		if (ret)
+			return ret;
+
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
+static int lp5812_of_probe(struct device *dev,
+			   struct device_node *np,
+			   struct lp5812_chip *chip)
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
+	ret = of_property_read_string(np, "ti,scan-mode", &chip->scan_mode);
+	if (ret)
+		chip->scan_mode = LP5812_MODE_DIRECT_NAME;
+
+	of_property_read_string(np, "label", &chip->label);
+
+	return 0;
+}
+
+static int lp5812_probe(struct i2c_client *client)
+{
+	struct lp5812_chip *chip;
+	struct device_node *np = dev_of_node(&client->dev);
+	struct lp5812_led *leds;
+	int ret;
+
+	if (!np)
+		return -EINVAL;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	ret = lp5812_of_probe(&client->dev, np, chip);
+	if (ret)
+		return ret;
+
+	leds = devm_kcalloc(&client->dev, chip->num_channels, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	chip->client = client;
+	mutex_init(&chip->lock);
+	i2c_set_clientdata(client, chip);
+
+	ret = lp5812_init_device(chip);
+	if (ret)
+		return ret;
+
+	ret = lp5812_register_leds(leds, chip);
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
+	struct lp5812_chip *chip = i2c_get_clientdata(client);
+
+	lp5812_deinit_device(chip);
+}
+
+static const struct of_device_id of_lp5812_match[] = {
+	{ .compatible = "ti,lp5812" },
+	{ /* sentinel */ }
+};
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
+module_i2c_driver(lp5812_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LP5812 LED Driver");
+MODULE_AUTHOR("Jared Zhou <jared-zhou@ti.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/leds/rgb/leds-lp5812.h b/drivers/leds/rgb/leds-lp5812.h
new file mode 100644
index 000000000000..d86af233d57d
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5812.h
@@ -0,0 +1,172 @@
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
+#define LP5812_ENABLE					0x01
+#define LP5812_DISABLE					0x00
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
+#endif /*_LP5812_H_*/
-- 
2.25.1


