Return-Path: <linux-leds+bounces-4777-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936BAD4112
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 19:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28AE33A3F58
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 17:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E947247280;
	Tue, 10 Jun 2025 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDNcxv8t"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011C6245038;
	Tue, 10 Jun 2025 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577429; cv=none; b=H2VTuiuAo/rv45S2N/SOwe8eCW5nqsxSWDBNmax0y7W9lpCkJHpODaC9weKozXKodtqWGmz9m/HgCv7GwZZCocqESi0g0O7GHlGt4Lhc2+yPH+FXpyqZVOKqINDIyyEobl3+9YneHht3h9XqfrWaUmcLtTXGuQZgQ1qddd79h0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577429; c=relaxed/simple;
	bh=A5tPkRGvZJgm+gTzBXZ+TaX3KruGvQJ7pgosTfV2m94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttdIJfWyENMcsPazzU8f+mCSVV4g1owa2GjpqJTA0N0kYo/0iAqu5oHbejEM1eo5lWh6dEshCMe5aLJeOgFZ5iiqFwOAnXtbJxyzPz678rlVlzZAd5kbltUnTgypc2fmnums+RwSlNu1R59NpBUFkaDpYryRDFZ6DxAs2tfW8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDNcxv8t; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so4673009a91.1;
        Tue, 10 Jun 2025 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749577425; x=1750182225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsijXrtvajxAdLgKuyIPgDIdU+gaLTwTdWA4gXslCX0=;
        b=WDNcxv8t9ttpg7iyXI85B0jRg4RZEe0rwjXZPI9ucDyLlkSdQuUxgClSREyruGcwwE
         h6VrSG5odbl1DaM20VKVK0sZ+gtMC7Fosv+Ojqfx9S2ZBPioVgT1hV75pFnBZaS2TWe5
         gqps7yn5CMwsYpLKRL4xyUlntF2dJe5R+uvyygHMaAnjT2vJMdt7aIl32OvvxVQsdpcj
         5s9GuPFAjwrRjW+wU5kgW30iId1sEAl5hFMTDLAGuvWSX9FtKn2qjnbnTmeiZQNx7Z+M
         x3fqeyERCyFhbL5A6B3W2et+Uhv+gDsu+KB19vPhYkPMfZfxqOCfHExvIplXiOuZVt4k
         ZFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749577425; x=1750182225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SsijXrtvajxAdLgKuyIPgDIdU+gaLTwTdWA4gXslCX0=;
        b=nfbInfR3YdyDcMp450JiE8LQlo/Ku7Yj/IYrUPYSJcsRlBZCJ9+RWC/o4fpkf0HBO0
         qRqOn5CI+S6ezYPl/uFWuF0apl+O1FK0YrJYgifhOSjJq3NAU236jegp1flDIL2xB+wC
         7iFvFpdxzzHcbuZt9Dkmse2e3EL3JCL2nkV51raeh+hflKmt1gdzOqLho5U9YOSgNIG3
         9r2+YDhVtnciCb8BVF5dUmoRBjLucHRq3t+TPGP202lYJoB5Lp3rFdh+POzMJTQHxdcb
         Pe3UCP0tIHYM+f4hllPNqknDSXJNH4AhgG9RZCaAQ0vIHbjJpsR71VtWvbQNQYMaB21y
         PPBA==
X-Forwarded-Encrypted: i=1; AJvYcCUDd9xgNX+We1ojIeEX3Di4Nfxo+v7ewio6HKxhkcTN7kwTjkywYN7bknIk1Ee618ZR702KS03oKGxg@vger.kernel.org, AJvYcCUoBGGrQylNLEtdqAjLwgWdp7e8CSigWfRP2d9dmcxfrwuUO3MZmeLzJlwyA1g2PGDDor42XhvzgWld1cek@vger.kernel.org, AJvYcCVqEpMT4YckglQzrmbAQDvVX8Nqe/0l1p2PLZ9CGn4FJwIusfOCX/SQT8Y3aDouxyWIbG2VRED6kXmvJQ==@vger.kernel.org, AJvYcCXV7sEEht0VI2aIldhdgFBZdsPGkV2ooz7dkW3idi1XNu7lofJGSRgYBhM9t+nvUAG+BQRDjeEdmzq9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Juo1acmqSlwZngRKUIVXc4XhAdYdH0N0CiXZA1B51y0X+FlY
	LpK9V59AqiZKOY6Vt649VWs5JdxUjptyeTJ/rvtPHLLWKaLzrAVM13ma
X-Gm-Gg: ASbGncu8GZhlZznWnOedkgAlscR1IUJC2aQjM4caxSFazV3Qi1I1tq5P6v9IbOTd2ge
	uZWdeGkQhnvStHY5UIf8RZMhCjBdA5MPbMAKU9dFzHhjGfaPHdGDsCBC2t+nTUgs6JAJ/WPBJgN
	yLn5/Ae+7Tfv6DQZSxaVhIab9cqUwk7cbBfv9GWXMsA/dwMVBcqtIDnM5byfqliWKgwEFwh5A8K
	0C6JkGLpGBvducAcSeiEktOqHOBQWOCEg/joUI3jUzeQSc7paPvExFe5rOvQKzhPdhvYVFuNfx2
	fQ/zgJT2+QMzaNLbPQbWfgZEokWxnaQqtu/NqER7h+tiRioF7NybIq1xy5v+KZli2KGfik9H
X-Google-Smtp-Source: AGHT+IEK3WLawIWgFyoeH8uLhZdOMkspPRhx8J3PvsGze4KMXviDdDOdqTHQ7r1z3J8D08XeqH7KeQ==
X-Received: by 2002:a17:90b:268e:b0:312:f263:954a with SMTP id 98e67ed59e1d1-313af0fce22mr534647a91.5.1749577424537;
        Tue, 10 Jun 2025 10:43:44 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b044d91sm7470668a91.2.2025.06.10.10.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:43:44 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED Driver
Date: Wed, 11 Jun 2025 00:43:17 +0700
Message-Id: <20250610174319.183375-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610174319.183375-1-trannamatk@gmail.com>
References: <20250610174319.183375-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LP5812 is a 4×3 matrix RGB LED driver with an autonomous animation
engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
4 RGB LEDs. Each LED can be configured through the related registers
to realize vivid and fancy lighting effects.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 MAINTAINERS                    |    4 +
 drivers/leds/rgb/Kconfig       |   13 +
 drivers/leds/rgb/Makefile      |    1 +
 drivers/leds/rgb/leds-lp5812.c | 1946 ++++++++++++++++++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h |  228 ++++
 5 files changed, 2192 insertions(+)
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
index 222d943d826a..becee5c1d21c 100644
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
+	  The LP5812 is a 4 × 3 matrix RGB LED driver with autonomous
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
index 000000000000..00d33286414e
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5812.c
@@ -0,0 +1,1946 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LP5812 LED driver
+ *
+ * Copyright (C) 2025 Texas Instruments
+ *
+ * Author: Jared Zhou <jared-zhou@ti.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/sysfs.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/leds.h>
+#include <linux/delay.h>
+#include <linux/led-class-multicolor.h>
+#include "leds-lp5812.h"
+
+#define LP5812_SC_LED "SC_LED"
+#define LP5812_MC_LED "MC_LED"
+
+#define LP5812_AUTO_PAUSE_ADDR(chan)  (LP5812_AEU_BASE + (chan) * 26)
+#define LP5812_AUTO_PLAYBACK_ADDR(chan)  (LP5812_AEU_BASE + (chan) * 260 + 1)
+#define LP5812_AEU_PWM_ADDR(chan, aeu, pwm_chan)  \
+	(LP5812_AEU_BASE + (chan) * 26 + ((aeu) - 1) * 8 + 2 + (pwm_chan) - 1)
+#define LP5812_AEU_SLOPE_TIME_ADDR(chan, aeu, slope_chan)  \
+	(LP5812_AEU_BASE + (chan) * 26 + ((aeu) - 1) * 8 + 2 + 5 + ((slope_chan) / 2))
+#define LP5812_AEU_PLAYBACK_ADDR(chan, aeu)  \
+	(LP5812_AEU_BASE + (chan) * 26 + ((aeu) - 1) * 8 + 2 + 5 + 2)
+
+#define to_lp5812_led(x) container_of(x, struct lp5812_data, kobj)
+#define to_anim_engine_unit(x) container_of(x, struct anim_engine_unit, kobj)
+
+static int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val);
+
+/* Begin common functions */
+static struct lp5812_led *cdev_to_lp5812_led(struct led_classdev *cdev)
+{
+	return container_of(cdev, struct lp5812_led, cdev);
+}
+
+static struct lp5812_led *mcled_cdev_to_lp5812_led(struct led_classdev_mc *mc_cdev)
+{
+	return container_of(mc_cdev, struct lp5812_led, mc_cdev);
+}
+
+static struct lp5812_led *dev_to_lp5812_led(struct device *dev)
+{
+	return cdev_to_lp5812_led(dev_get_drvdata(dev));
+}
+
+static struct lp5812_led *dev_to_lp5812_led_mc(struct device *dev)
+{
+	return mcled_cdev_to_lp5812_led(dev_get_drvdata(dev));
+}
+
+static int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
+{
+	int ret;
+	struct i2c_msg msg;
+	struct device *dev = &chip->i2c_cl->dev;
+	u8 extracted_bits; /* save 9th and 8th bit of reg address */
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
+		dev_err(dev, "i2c write error, ret=%d\n", ret);
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
+	int ret;
+	u8 ret_val;  /* lp5812_chip return value */
+	u8 extracted_bits; /* save 9th and 8th bit of reg address */
+	u8 converted_reg;  /* extracted 8bit from reg */
+	struct device *dev = &chip->i2c_cl->dev;
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
+		dev_err(dev, "Read reg value error, ret=%d\n", ret);
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
+static int lp5812_parse_common_child(struct device_node *child,
+				     struct lp5812_led_config *cfg,
+				     int child_number, int color_number)
+{
+	int reg, ret;
+
+	ret = of_property_read_u32(child, "reg", &reg);
+	if (ret)
+		return ret;
+
+	cfg[child_number].led_id[color_number] = reg;
+
+	of_property_read_u8(child, "led-cur", &cfg[child_number].led_current[color_number]);
+	of_property_read_u8(child, "max-cur", &cfg[child_number].max_current[color_number]);
+
+	return 0;
+}
+
+static int lp5812_parse_multi_led_child(struct device_node *child,
+					struct lp5812_led_config *cfg,
+					int child_number, int color_number)
+{
+	int color_id, ret;
+
+	ret = of_property_read_u32(child, "color", &color_id);
+	if (ret)
+		return ret;
+
+	cfg[child_number].color_id[color_number] = color_id;
+	return 0;
+}
+
+static int lp5812_parse_multi_led(struct device_node *np,
+				  struct lp5812_led_config *cfg,
+				  int child_number)
+{
+	int num_colors = 0, ret;
+
+	for_each_available_child_of_node_scoped(np, child) {
+		ret = lp5812_parse_common_child(child, cfg,
+						child_number, num_colors);
+		if (ret)
+			return ret;
+
+		ret = lp5812_parse_multi_led_child(child, cfg, child_number,
+						   num_colors);
+		if (ret)
+			return ret;
+
+		num_colors++;
+	}
+
+	cfg[child_number].num_colors = num_colors;
+	cfg[child_number].is_sc_led = 0;
+
+	return 0;
+}
+
+static int lp5812_parse_single_led(struct device_node *np,
+				   struct lp5812_led_config *cfg,
+				   int child_number)
+{
+	int ret;
+
+	ret = lp5812_parse_common_child(np, cfg, child_number, 0);
+	if (ret)
+		return ret;
+
+	cfg[child_number].num_colors = 1;
+	cfg[child_number].is_sc_led = 1;
+
+	return 0;
+}
+
+static int lp5812_parse_logical_led(struct device_node *np,
+				    struct lp5812_led_config *cfg,
+				    int child_number)
+{
+	int chan_nr, ret;
+
+	of_property_read_string(np, "label", &cfg[child_number].name);
+
+	ret = of_property_read_u32(np, "reg", &chan_nr);
+	if (ret)
+		return ret;
+
+	cfg[child_number].chan_nr = chan_nr;
+
+	if (of_node_name_eq(np, "multi-led"))
+		return lp5812_parse_multi_led(np, cfg, child_number);
+	else
+		return lp5812_parse_single_led(np, cfg, child_number);
+}
+
+static struct lp5812_data *lp5812_of_populate_pdata(struct device *dev,
+						    struct device_node *np,
+						    struct lp5812_chip *chip)
+{
+	struct device_node *child;
+	struct lp5812_data *pdata;
+	struct lp5812_led_config *cfg;
+	int num_channels, i = 0, ret;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	num_channels = of_get_available_child_count(np);
+	if (num_channels == 0) {
+		dev_err(dev, "no LED channels\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->led_config = &cfg[0];
+	pdata->num_channels = num_channels;
+
+	for_each_available_child_of_node(np, child) {
+		ret = lp5812_parse_logical_led(child, cfg, i);
+		if (ret) {
+			of_node_put(child);
+			return ERR_PTR(-EINVAL);
+		}
+		i++;
+	}
+
+	of_property_read_string(np, "label", &pdata->label);
+
+	return pdata;
+}
+
+/* End common functions */
+
+/* Begin device functions */
+static int lp5812_update_regs_config(struct lp5812_chip *chip)
+{
+	int ret;
+	u8 reg_val; /* save register value */
+
+	ret = lp5812_write(chip, chip->cfg->reg_cmd_update.addr, LP5812_UPDATE_CMD_VAL);
+	if (ret)
+		return ret;
+
+	ret = lp5812_read_tsd_config_status(chip, &reg_val);
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
+static int lp5812_device_command(struct lp5812_chip *chip, enum device_command command)
+{
+	switch (command) {
+	case LP5812_DEV_CMD_UPDATE:
+		return lp5812_write(chip, chip->cfg->reg_cmd_update.addr, LP5812_UPDATE_CMD_VAL);
+	case LP5812_DEV_CMD_START:
+		return lp5812_write(chip, chip->cfg->reg_cmd_start.addr, LP5812_START_CMD_VAL);
+	case LP5812_DEV_CMD_STOP:
+		return lp5812_write(chip, chip->cfg->reg_cmd_stop.addr, LP5812_STOP_CMD_VAL);
+	case LP5812_DEV_CMD_PAUSE:
+		return lp5812_write(chip, chip->cfg->reg_cmd_pause.addr, LP5812_PAUSE_CMD_VAL);
+	case LP5812_DEV_CMD_CONTINUE:
+		return lp5812_write(chip, chip->cfg->reg_cmd_continue.addr,
+			LP5812_CONTINUE_CMD_VAL);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)
+{
+	return lp5812_read(chip, chip->cfg->reg_tsd_config_status.addr, reg_val);
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
+	int ret;
+	struct lp5812_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp5812_chip *chip = led->chip;
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
+	ret = lp5812_disable_all_leds(chip);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static ssize_t device_command_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t len)
+{
+	struct lp5812_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp5812_chip *chip = led->chip;
+	enum device_command cmd;
+
+	if (sysfs_streq(buf, "update"))
+		cmd = LP5812_DEV_CMD_UPDATE;
+	else if (sysfs_streq(buf, "start"))
+		cmd = LP5812_DEV_CMD_START;
+	else if (sysfs_streq(buf, "stop"))
+		cmd = LP5812_DEV_CMD_STOP;
+	else if (sysfs_streq(buf, "pause"))
+		cmd = LP5812_DEV_CMD_PAUSE;
+	else if (sysfs_streq(buf, "continue"))
+		cmd = LP5812_DEV_CMD_CONTINUE;
+	else
+		return -EINVAL;
+
+	guard(mutex)(&chip->lock);
+	lp5812_device_command(led->chip, cmd);
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
+	u8 reg_val;
+	int tsd_stat, config_stat, ret;
+	struct lp5812_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp5812_chip *chip = led->chip;
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
+	int reset, ret;
+	struct lp5812_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp5812_chip *chip = led->chip;
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
+		dev_err(&chip->i2c_cl->dev, "lp5812_enable_disable failed\n");
+		return ret;
+	}
+
+	ret = lp5812_write(chip, chip->cfg->reg_dev_config_12.addr, 0x0B);
+	if (ret) {
+		dev_err(&chip->i2c_cl->dev, "write 0x0B to DEV_CONFIG12 failed\n");
+		return ret;
+	}
+
+	ret = lp5812_update_regs_config(chip);
+	if (ret) {
+		dev_err(&chip->i2c_cl->dev, "lp5812_update_regs_config failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/* End device functions */
+
+/* Begin led functions*/
+static int lp5812_read_lod_status(struct lp5812_chip *chip, int led_number, u8 *val)
+{
+	int ret;
+	u16 reg;
+	u8 reg_val;
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
+	int ret;
+	u16 reg;
+	u8 reg_val;
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
+	int ret;
+	u16 reg;
+	u8 reg_val;
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
+	int ret;
+	u16 reg;
+	u8 reg_val;
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
+static int lp5812_set_pwm_dimming_scale(struct lp5812_chip *chip, int led_number,
+					enum pwm_dimming_scale scale)
+{
+	int ret;
+	u16 reg;
+	u8 reg_val;
+
+	if (led_number <= 7)
+		reg = chip->cfg->reg_dev_config_5.addr;
+	else
+		reg = chip->cfg->reg_dev_config_6.addr;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret)
+		return ret;
+	if (scale == LP5812_PWM_DIMMING_SCALE_LINEAR)
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
+static int lp5812_set_phase_align(struct lp5812_chip *chip, int led_number,
+				  int phase_align_val)
+{
+	int ret, bit_pos;
+	u16 reg;
+	u8 reg_val;
+
+	reg = chip->cfg->reg_dev_config_7.addr + (led_number / 4);
+	bit_pos = (led_number % 4) * 2;
+
+	ret = lp5812_read(chip, reg, &reg_val);
+	if (ret)
+		return ret;
+	reg_val |= (phase_align_val << bit_pos);
+	ret = lp5812_write(chip, reg, reg_val);
+	if (ret)
+		return ret;
+	ret = lp5812_update_regs_config(chip);
+
+	return ret;
+}
+
+static ssize_t lp5812_auto_time_pause_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t len, bool start)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	u8 chan_nr = 0, curr_val;
+	int i, ret, val[LED_COLOR_ID_MAX];
+	char *sub_str, *str = (char *)buf;
+	u16 reg;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (kstrtoint(sub_str, 0, &val[i]))
+			return -EINVAL;
+	}
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		reg = LP5812_AUTO_PAUSE_ADDR(led_cfg->led_id[i]);
+
+		/* get original value of slope time */
+		ret = lp5812_read(chip, reg, &curr_val);
+		if (ret)
+			return ret;
+
+		if (start == 1)
+			curr_val = (curr_val & 0x0F) | (val[i] << 4);
+		else
+			curr_val = (curr_val & 0xF0) | (val[i]);
+
+		ret = lp5812_write(chip, reg, curr_val);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static int lp5812_manual_dc_pwm_control(struct lp5812_chip *chip, int led_number,
+					u8 val, enum dimming_type dimming_type)
+{
+	int ret;
+	u16 led_base_reg;
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
+	struct lp5812_chip *chip = led->chip;
+	int ret, i;
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
+	led_cfg = &chip->pdata->led_config[led->chan_nr];
+
+	guard(mutex)(&chip->lock);
+	ret = lp5812_manual_dc_pwm_control(chip, led_cfg->led_id[0],
+					   led->brightness, LP5812_DIMMING_PWM);
+
+	return ret;
+}
+
+static ssize_t mode_parse(const char *buf, enum control_mode *val)
+{
+	if (sysfs_streq(buf, "manual"))
+		*val = LP5812_MODE_MANUAL;
+	else if (sysfs_streq(buf, "autonomous"))
+		*val = LP5812_MODE_AUTONOMOUS;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static ssize_t mode_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	u8 chan_nr = 0;
+	enum control_mode val[LED_COLOR_ID_MAX];
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (!sub_str)
+			return -EINVAL;
+		if (mode_parse(sub_str, &val[i]))
+			return -EINVAL;
+	}
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		ret = lp5812_set_led_mode(chip, led_cfg->led_id[i], val[i]);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t activate_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	int val[LED_COLOR_ID_MAX];
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+	u16 reg;
+	u8 reg_val, chan_nr = 0;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
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
+		ret = lp5812_read(chip, reg, &reg_val);
+		if (ret == 0) {
+			if (val[i] == 0) {
+				ret = lp5812_write(chip, reg,
+						   reg_val & (~(1 << (led_cfg->led_id[i] % 8))));
+			} else {
+				ret = lp5812_write(chip, reg,
+						   reg_val | (1 << (led_cfg->led_id[i] % 8)));
+			}
+		} else {
+			return -EIO;
+		}
+	}
+
+	return len;
+}
+
+static ssize_t pwm_dimming_parse(const char *buf, enum pwm_dimming_scale *val)
+{
+	if (sysfs_streq(buf, "linear"))
+		*val = LP5812_PWM_DIMMING_SCALE_LINEAR;
+	else if (sysfs_streq(buf, "exponential"))
+		*val = LP5812_PWM_DIMMING_SCALE_EXPONENTIAL;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static ssize_t pwm_dimming_scale_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	u8 chan_nr = 0;
+	enum pwm_dimming_scale val[LED_COLOR_ID_MAX];
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (!sub_str)
+			return -EINVAL;
+		if (pwm_dimming_parse(sub_str, &val[i]))
+			return -EINVAL;
+	}
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		ret = lp5812_set_pwm_dimming_scale(chip, led_cfg->led_id[i], val[i]);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t pwm_align_parse(const char *buf, enum control_mode *val)
+{
+	if (sysfs_streq(buf, "forward"))
+		*val = 0;
+	else if (sysfs_streq(buf, "middle"))
+		*val = 2;
+	else if (sysfs_streq(buf, "backward"))
+		*val = 3;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static ssize_t pwm_phase_align_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	u8 chan_nr = 0;
+	enum control_mode val[LED_COLOR_ID_MAX];
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (!sub_str)
+			return -EINVAL;
+		if (pwm_align_parse(sub_str, &val[i]))
+			return -EINVAL;
+	}
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		ret = lp5812_set_phase_align(chip, led_cfg->led_id[i], val[i]);
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
+	const char *name = dev->platform_data;
+	u8 chan_nr = 0;
+	enum control_mode mode;
+	int val[LED_COLOR_ID_MAX];
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
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
+	const char *name = dev->platform_data;
+	u8 chan_nr = 0, i, lsd_status, lod_status;
+	int size = 0, ret;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
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
+	const char *name = dev->platform_data;
+	u8 val;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+	lp5812_read(chip, chip->cfg->reg_dev_config_0.addr, &val);
+	return sysfs_emit(buf, "%d\n", (val & 0x01));
+}
+
+static ssize_t auto_time_pause_at_start_store(struct device *dev,
+					      struct device_attribute *attr,
+					      const char *buf, size_t len)
+{
+	return lp5812_auto_time_pause_store(dev, attr, buf, len, 1);
+}
+
+static ssize_t auto_time_pause_at_stop_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t len)
+{
+	return lp5812_auto_time_pause_store(dev, attr, buf, len, 0);
+}
+
+static ssize_t auto_playback_eau_number_store(struct device *dev,
+					      struct device_attribute *attr,
+					      const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	u8 chan_nr = 0, curr_val;
+	int val[LED_COLOR_ID_MAX];
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+	u16 reg;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
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
+		reg = LP5812_AUTO_PLAYBACK_ADDR(led_cfg->led_id[i]);
+
+		/* get original value of slope time */
+		ret = lp5812_read(chip, reg, &curr_val);
+		if (ret)
+			return ret;
+
+		curr_val = (curr_val & 0x0F) | (val[i] << 4);
+
+		ret = lp5812_write(chip, reg, curr_val);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t auto_playback_time_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	u8 chan_nr = 0, curr_val;
+	int val[LED_COLOR_ID_MAX];
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+	u16 reg;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
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
+		reg = LP5812_AUTO_PLAYBACK_ADDR(led_cfg->led_id[i]);
+
+		/* get original value of slope time */
+		ret = lp5812_read(chip, reg, &curr_val);
+		if (ret)
+			return ret;
+
+		curr_val = (curr_val & 0xF0) | (val[i]);
+
+		ret = lp5812_write(chip, reg, curr_val);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t aeu_playback_time_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	int val[LED_COLOR_ID_MAX];
+	int aeu;
+	u8 chan_nr = 0, curr_val;
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+	u16 reg;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
+
+	sub_str = strsep(&str, ":");
+	if (!sub_str)
+		return -EINVAL;
+	if (kstrtoint(&sub_str[3], 0, &aeu))
+		return -EINVAL;
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (!sub_str)
+			return -EINVAL;
+		if (kstrtoint(sub_str, 0, &val[i]))
+			return -EINVAL;
+		if (val[i] < 0 || val[i] > 3)
+			return -EINVAL;
+
+		reg = LP5812_AEU_PLAYBACK_ADDR(led_cfg->led_id[i], aeu);
+
+		ret = lp5812_read(chip, reg, &curr_val);
+		if (ret)
+			return ret;
+
+		ret = lp5812_write(chip, reg, (curr_val & 0xFC) | val[i]);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t lp5812_aeu_pwm_store(struct device *dev,
+				    struct device_attribute *attr,
+				    u8 pwm_chan,
+				    const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	int val[LED_COLOR_ID_MAX];
+	int aeu;
+	u8 chan_nr = 0;
+	char *sub_str, *str = (char *)buf;
+	int i, ret;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
+
+	sub_str = strsep(&str, ":");
+	if (!sub_str)
+		return -EINVAL;
+	if (kstrtoint(&sub_str[3], 0, &aeu))
+		return -EINVAL;
+
+	pr_info("AEU = %d", aeu);
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (!sub_str)
+			return -EINVAL;
+		if (kstrtoint(sub_str, 0, &val[i]))
+			return -EINVAL;
+		if (val[i] < 0 || val[i] > 255)
+			return -EINVAL;
+
+		ret = lp5812_write(chip,
+				   LP5812_AEU_PWM_ADDR(led_cfg->led_id[i], aeu, pwm_chan),
+				   val[i]);
+		if (ret)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t aeu_pwm1_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t len)
+{
+	return lp5812_aeu_pwm_store(dev, attr, LP5812_AEU_PWM1, buf, len);
+}
+
+static ssize_t aeu_pwm2_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t len)
+{
+	return lp5812_aeu_pwm_store(dev, attr, LP5812_AEU_PWM2, buf, len);
+}
+
+static ssize_t aeu_pwm3_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t len)
+{
+	return lp5812_aeu_pwm_store(dev, attr, LP5812_AEU_PWM3, buf, len);
+}
+
+static ssize_t aeu_pwm4_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t len)
+{
+	return lp5812_aeu_pwm_store(dev, attr, LP5812_AEU_PWM4, buf, len);
+}
+
+static ssize_t aeu_pwm5_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t len)
+{
+	return lp5812_aeu_pwm_store(dev, attr, LP5812_AEU_PWM5, buf, len);
+}
+
+static ssize_t lp5812_aeu_slope_time(struct device *dev,
+				     struct device_attribute *attr,
+				     enum slope_time_num slope_chan,
+				     const char *buf, size_t len)
+{
+	struct lp5812_led *led;
+	struct lp5812_chip *chip;
+	struct lp5812_led_config *led_cfg;
+	const char *name = dev->platform_data;
+	int val[LED_COLOR_ID_MAX];
+	u8 chan_nr = 0;
+	char *sub_str, *str = (char *)buf;
+	int i, ret, aeu;
+	union slope_time slope_time_val;
+	u16 reg;
+
+	if (strcmp(name, LP5812_SC_LED) == 0)
+		led = dev_to_lp5812_led(dev);
+	else
+		led = dev_to_lp5812_led_mc(dev);
+
+	chan_nr = led->chan_nr;
+	chip = led->chip;
+	led_cfg = &chip->pdata->led_config[chan_nr];
+
+	sub_str = strsep(&str, ":");
+	if (!sub_str)
+		return -EINVAL;
+	if (kstrtoint(&sub_str[3], 0, &aeu))
+		return -EINVAL;
+
+	pr_info("AEU = %d", aeu);
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led_cfg->num_colors; i++) {
+		sub_str = strsep(&str, " ");
+		if (!sub_str)
+			return -EINVAL;
+		if (kstrtoint(sub_str, 0, &val[i]))
+			return -EINVAL;
+		if (val[i] < 0 || val[i] > 15)
+			return -EINVAL;
+
+		reg = LP5812_AEU_SLOPE_TIME_ADDR(led_cfg->led_id[i], aeu, slope_chan);
+
+		/* get original value of slope time */
+		ret = lp5812_read(chip, reg, &slope_time_val.time_val);
+		if (ret)
+			return ret;
+
+		/* Update new value for slope time*/
+		if (slope_chan == LP5812_SLOPE_TIME_T1 || slope_chan == LP5812_SLOPE_TIME_T3)
+			slope_time_val.s_time.first = val[i];
+		if (slope_chan == LP5812_SLOPE_TIME_T2 || slope_chan == LP5812_SLOPE_TIME_T4)
+			slope_time_val.s_time.second = val[i];
+
+		/* Save updated value to hardware */
+		ret = lp5812_write(chip, reg, slope_time_val.time_val);
+	}
+
+	return len;
+}
+
+static ssize_t aeu_slop_time_t1_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t len)
+{
+	return lp5812_aeu_slope_time(dev, attr, LP5812_SLOPE_TIME_T1, buf, len);
+}
+
+static ssize_t aeu_slop_time_t2_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t len)
+{
+	return lp5812_aeu_slope_time(dev, attr, LP5812_SLOPE_TIME_T2, buf, len);
+}
+
+static ssize_t aeu_slop_time_t3_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t len)
+{
+	return lp5812_aeu_slope_time(dev, attr, LP5812_SLOPE_TIME_T3, buf, len);
+}
+
+static ssize_t aeu_slop_time_t4_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t len)
+{
+	return lp5812_aeu_slope_time(dev, attr, LP5812_SLOPE_TIME_T4, buf, len);
+}
+
+/* End led function */
+
+static DEVICE_ATTR_WO(led_current);
+static DEVICE_ATTR_RO(max_current);
+static DEVICE_ATTR_WO(mode);
+static DEVICE_ATTR_WO(activate);
+static DEVICE_ATTR_WO(pwm_dimming_scale);
+static DEVICE_ATTR_WO(pwm_phase_align);
+static DEVICE_ATTR_WO(auto_time_pause_at_start);
+static DEVICE_ATTR_WO(auto_time_pause_at_stop);
+static DEVICE_ATTR_WO(auto_playback_eau_number);
+static DEVICE_ATTR_WO(auto_playback_time);
+static DEVICE_ATTR_WO(aeu_playback_time);
+static DEVICE_ATTR_WO(aeu_pwm1);
+static DEVICE_ATTR_WO(aeu_pwm2);
+static DEVICE_ATTR_WO(aeu_pwm3);
+static DEVICE_ATTR_WO(aeu_pwm4);
+static DEVICE_ATTR_WO(aeu_pwm5);
+static DEVICE_ATTR_WO(aeu_slop_time_t1);
+static DEVICE_ATTR_WO(aeu_slop_time_t2);
+static DEVICE_ATTR_WO(aeu_slop_time_t3);
+static DEVICE_ATTR_WO(aeu_slop_time_t4);
+static DEVICE_ATTR_RO(lod_lsd);
+
+static struct attribute *lp5812_led_attrs[] = {
+	&dev_attr_led_current.attr,
+	&dev_attr_max_current.attr,
+	&dev_attr_mode.attr,
+	&dev_attr_activate.attr,
+	&dev_attr_pwm_dimming_scale.attr,
+	&dev_attr_pwm_phase_align.attr,
+	&dev_attr_auto_time_pause_at_start.attr,
+	&dev_attr_auto_time_pause_at_stop.attr,
+	&dev_attr_auto_playback_eau_number.attr,
+	&dev_attr_auto_playback_time.attr,
+	&dev_attr_aeu_playback_time.attr,
+	&dev_attr_aeu_pwm1.attr,
+	&dev_attr_aeu_pwm2.attr,
+	&dev_attr_aeu_pwm3.attr,
+	&dev_attr_aeu_pwm4.attr,
+	&dev_attr_aeu_pwm5.attr,
+	&dev_attr_aeu_slop_time_t1.attr,
+	&dev_attr_aeu_slop_time_t2.attr,
+	&dev_attr_aeu_slop_time_t3.attr,
+	&dev_attr_aeu_slop_time_t4.attr,
+	&dev_attr_lod_lsd.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(lp5812_led);
+
+static int lp5812_set_brightness(struct led_classdev *cdev,
+				 enum led_brightness brightness)
+{
+	struct lp5812_led *led = cdev_to_lp5812_led(cdev);
+	const struct lp5812_device_config *cfg = led->chip->cfg;
+
+	led->brightness = (u8)brightness;
+	return cfg->brightness_fn(led);
+}
+
+static int lp5812_set_mc_brightness(struct led_classdev *cdev,
+				    enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
+	struct lp5812_led *led = mcled_cdev_to_lp5812_led(mc_dev);
+	const struct lp5812_device_config *cfg = led->chip->cfg;
+
+	led_mc_calc_color_components(&led->mc_cdev, brightness);
+	return cfg->multicolor_brightness_fn(led);
+}
+
+static int lp5812_init_led(struct lp5812_led *led, struct lp5812_chip *chip, int chan)
+{
+	struct lp5812_data *pdata = chip->pdata;
+	struct device *dev = &chip->i2c_cl->dev;
+	struct mc_subled *mc_led_info;
+	struct led_classdev *led_cdev;
+	char name[32];
+	int i, ret = 0;
+
+	if (pdata->led_config[chan].name) {
+		led->cdev.name = pdata->led_config[chan].name;
+	} else {
+		snprintf(name, sizeof(name), "%s:channel%d",
+			 pdata->label ? : chip->i2c_cl->name, chan);
+		led->cdev.name = name;
+	}
+
+	if (pdata->led_config[chan].is_sc_led == 0) {
+		mc_led_info = devm_kcalloc(dev,
+					   pdata->led_config[chan].num_colors,
+					   sizeof(*mc_led_info), GFP_KERNEL);
+		if (!mc_led_info)
+			return -ENOMEM;
+
+		led_cdev = &led->mc_cdev.led_cdev;
+		led_cdev->name = led->cdev.name;
+		led_cdev->brightness_set_blocking = lp5812_set_mc_brightness;
+		led->mc_cdev.num_colors = pdata->led_config[chan].num_colors;
+		for (i = 0; i < led->mc_cdev.num_colors; i++) {
+			mc_led_info[i].color_index =
+				pdata->led_config[chan].color_id[i];
+			mc_led_info[i].channel =
+					pdata->led_config[chan].led_id[i];
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
+	if (pdata->led_config[chan].is_sc_led) {
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
+	int num_channels = chip->pdata->num_channels;
+	struct lp5812_led *each;
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
+		for (j = 0; j < chip->pdata->led_config[i].num_colors; j++) {
+			ret = lp5812_auto_dc(chip, chip->pdata->led_config[i].led_id[j],
+					     chip->pdata->led_config[i].led_id[j]);
+			if (ret)
+				goto err_init_led;
+
+			ret = lp5812_manual_dc_pwm_control(chip,
+							chip->pdata->led_config[i].led_id[j],
+							chip->pdata->led_config[i].led_current[j],
+							LP5812_DIMMING_ANALOG);
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
+	struct device *dev = &chip->i2c_cl->dev;
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
+	struct device *dev = &chip->i2c_cl->dev;
+	const struct lp5812_device_config *cfg = chip->cfg;
+	struct lp5812_led *each;
+	int i;
+
+	sysfs_remove_group(&dev->kobj, cfg->dev_attr_group);
+
+	for (i = 0; i < chip->pdata->num_channels; i++) {
+		if (!chip->pdata->led_config[i].is_sc_led) {
+			each = led + i;
+			sysfs_remove_groups(&each->mc_cdev.led_cdev.dev->kobj, lp5812_led_groups);
+		}
+	}
+}
+
+static int lp5812_probe(struct i2c_client *client)
+{
+	struct lp5812_chip *chip;
+	int ret;
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	struct lp5812_data *pdata = dev_get_platdata(&client->dev);
+	struct device_node *np = dev_of_node(&client->dev);
+	struct lp5812_led *led;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cfg = i2c_get_match_data(client);
+
+	if (!pdata) {
+		if (np) {
+			pdata = lp5812_of_populate_pdata(&client->dev, np,
+							 chip);
+			if (IS_ERR(pdata))
+				return PTR_ERR(pdata);
+		} else {
+			return dev_err_probe(&client->dev, -EINVAL, "no platform data\n");
+		}
+	}
+
+	led = devm_kcalloc(&client->dev,
+			   pdata->num_channels, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	chip->i2c_cl = client;
+	chip->pdata = pdata;
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
+		dev_err_probe(&client->dev, ret, "registering sysfs failed\n");
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
+static LP5812_DEV_ATTR_WO(device_command);
+static LP5812_DEV_ATTR_WO(sw_reset);
+static LP5812_DEV_ATTR_WO(fault_clear);
+static LP5812_DEV_ATTR_RO(tsd_config_status);
+
+static struct attribute *lp5812_chip_attributes[] = {
+	&dev_attr_device_command.attr,
+	&dev_attr_fault_clear.attr,
+	&dev_attr_sw_reset.attr,
+	&dev_attr_dev_config.attr,
+	&dev_attr_tsd_config_status.attr,
+	NULL,
+};
+
+static const struct attribute_group lp5812_group = {
+	.name = "lp5812_chip_setup",
+	.attrs = lp5812_chip_attributes,
+};
+
+/* Chip specific configurations */
+static struct lp5812_device_config lp5812_cfg = {
+	.reg_reset = {
+		.addr = LP5812_REG_RESET,
+		.val  = LP5812_RESET,
+	},
+	.reg_chip_en = {
+		.addr = LP5812_REG_ENABLE,
+		.val  = LP5812_ENABLE_DEFAULT,
+	},
+	.reg_dev_config_0 = {
+		.addr = LP5812_DEV_CONFIG0,
+		.val  = 0,
+	},
+	.reg_dev_config_1 = {
+		.addr = LP5812_DEV_CONFIG1,
+		.val  = 0,
+	},
+	.reg_dev_config_2 = {
+		.addr = LP5812_DEV_CONFIG2,
+		.val  = 0,
+	},
+	.reg_dev_config_3 = {
+		.addr = LP5812_DEV_CONFIG3,
+		.val  = 0,
+	},
+	.reg_dev_config_4 = {
+		.addr = LP5812_DEV_CONFIG4,
+		.val  = 0,
+	},
+	.reg_dev_config_5 = {
+		.addr = LP5812_DEV_CONFIG5,
+		.val  = 0,
+	},
+	.reg_dev_config_6 = {
+		.addr = LP5812_DEV_CONFIG6,
+		.val  = 0,
+	},
+	.reg_dev_config_7 = {
+		.addr = LP5812_DEV_CONFIG7,
+		.val  = 0,
+	},
+	.reg_dev_config_12 = {
+		.addr = LP5812_DEV_CONFIG12,
+		.val  = LP5812_DEV_CONFIG12_DEFAULT,
+	},
+	.reg_cmd_update = {
+		.addr = LP5812_CMD_UPDATE,
+		.val  = 0,
+	},
+	.reg_cmd_start = {
+		.addr = LP5812_CMD_START,
+		.val  = 0,
+	},
+	.reg_cmd_stop = {
+		.addr = LP5812_CMD_STOP,
+		.val  = 0,
+	},
+	.reg_cmd_pause = {
+		.addr = LP5812_CMD_PAUSE,
+		.val  = 0,
+	},
+	.reg_cmd_continue = {
+		.addr = LP5812_CMD_CONTINUE,
+		.val  = 0,
+	},
+	.reg_tsd_config_status = {
+		.addr = LP5812_TSD_CONFIG_STATUS,
+		.val  = 0,
+	},
+	.reg_led_en_1 = {
+		.addr = LP5812_LED_EN_1,
+		.val  = 0,
+	},
+	.reg_led_en_2 = {
+		.addr = LP5812_LED_EN_2,
+		.val  = 0,
+	},
+	.reg_fault_clear = {
+		.addr = LP5812_FAULT_CLEAR,
+		.val  = 0,
+	},
+	.reg_manual_dc_base  = {
+		.addr = LP5812_MANUAL_DC_BASE,
+		.val  = 0,
+	},
+	.reg_auto_dc_base  = {
+		.addr = LP5812_AUTO_DC_BASE,
+		.val  = 0,
+	},
+	.reg_manual_pwm_base  = {
+		.addr = LP5812_MANUAL_PWM_BASE,
+		.val  = 0,
+	},
+	.reg_aeu_base  = {
+		.addr = LP5812_AEU_BASE,
+		.val  = 0,
+	},
+	.reg_lod_status_base  = {
+		.addr = LP5812_LOD_STATUS,
+		.val  = 0,
+	},
+	.reg_lsd_status_base  = {
+		.addr = LP5812_LSD_STATUS,
+		.val  = 0,
+	},
+
+	.brightness_fn	  = lp5812_led_brightness,
+	.multicolor_brightness_fn = lp5812_multicolor_brightness,
+
+	.dev_attr_group = &lp5812_group
+};
+
+static const struct i2c_device_id lp5812_id[] = {
+	{ "lp5812", .driver_data = (kernel_ulong_t)&lp5812_cfg, },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, lp5812_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_lp5812_match[] = {
+	{ .compatible = "ti,lp5812", .data = &lp5812_cfg, },
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
+	.id_table	= lp5812_id
+};
+
+module_i2c_driver(lp5812_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LP5812 LED Driver");
+MODULE_AUTHOR("Jared Zhou");
+MODULE_LICENSE("GPL");
diff --git a/drivers/leds/rgb/leds-lp5812.h b/drivers/leds/rgb/leds-lp5812.h
new file mode 100644
index 000000000000..64ae452a3891
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5812.h
@@ -0,0 +1,228 @@
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
+#include <linux/kernel.h>
+#include <linux/i2c.h>
+#include <linux/sysfs.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/leds.h>
+#include <linux/delay.h>
+#include <linux/led-class-multicolor.h>
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
+#define LP5812_CMD_START				0x0011
+#define LP5812_CMD_STOP					0x0012
+#define LP5812_CMD_PAUSE				0x0013
+#define LP5812_CMD_CONTINUE				0x0014
+#define LP5812_LED_EN_1					0x0020
+#define LP5812_LED_EN_2					0x0021
+#define LP5812_FAULT_CLEAR				0x0022
+#define LP5812_MANUAL_DC_BASE				0x0030
+#define LP5812_AUTO_DC_BASE				0x0050
+#define LP5812_MANUAL_PWM_BASE				0x0040
+#define LP5812_AEU_BASE					0x0080
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
+#define LP5812_START_CMD_VAL				0xFF
+#define LP5812_STOP_CMD_VAL				0xAA
+#define LP5812_PAUSE_CMD_VAL				0x33
+#define LP5812_CONTINUE_CMD_VAL				0xCC
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
+enum pwm_dimming_scale {
+	LP5812_PWM_DIMMING_SCALE_LINEAR = 0,
+	LP5812_PWM_DIMMING_SCALE_EXPONENTIAL
+};
+
+enum device_command {
+	LP5812_DEV_CMD_NONE,
+	LP5812_DEV_CMD_UPDATE,
+	LP5812_DEV_CMD_START,
+	LP5812_DEV_CMD_STOP,
+	LP5812_DEV_CMD_PAUSE,
+	LP5812_DEV_CMD_CONTINUE
+};
+
+enum slope_time_num {
+	LP5812_SLOPE_TIME_T1 = 0,
+	LP5812_SLOPE_TIME_T2,
+	LP5812_SLOPE_TIME_T3,
+	LP5812_SLOPE_TIME_T4
+};
+
+enum aeu_pwm_num {
+	LP5812_AEU_PWM1 = 1,
+	LP5812_AEU_PWM2,
+	LP5812_AEU_PWM3,
+	LP5812_AEU_PWM4,
+	LP5812_AEU_PWM5
+};
+
+union slope_time {
+	struct {
+		u8 first:4;
+		u8 second:4;
+	} __packed s_time;
+	u8 time_val;
+}; /* type for start/stop pause time and slope time */
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
+struct lp5812_led;
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
+	const struct lp5812_reg reg_cmd_start;
+	const struct lp5812_reg reg_cmd_stop;
+	const struct lp5812_reg reg_cmd_pause;
+	const struct lp5812_reg reg_cmd_continue;
+
+	const struct lp5812_reg reg_led_en_1;
+	const struct lp5812_reg reg_led_en_2;
+	const struct lp5812_reg reg_fault_clear;
+	const struct lp5812_reg reg_manual_dc_base;
+	const struct lp5812_reg reg_auto_dc_base;
+	const struct lp5812_reg reg_manual_pwm_base;
+	const struct lp5812_reg reg_tsd_config_status;
+	const struct lp5812_reg reg_aeu_base;
+	const struct lp5812_reg reg_lod_status_base;
+	const struct lp5812_reg reg_lsd_status_base;
+
+	/* set LED brightness */
+	int (*brightness_fn)(struct lp5812_led *led);
+
+	/* set multicolor LED brightness */
+	int (*multicolor_brightness_fn)(struct lp5812_led *led);
+
+	/* additional device specific attributes */
+	const struct attribute_group *dev_attr_group;
+};
+
+struct lp5812_led_config {
+	const char *name;
+	int led_id[LED_COLOR_ID_MAX];
+	u8 color_id[LED_COLOR_ID_MAX];
+	u8 led_current[LED_COLOR_ID_MAX];
+	u8 max_current[LED_COLOR_ID_MAX];
+	int num_colors;
+	u8 chan_nr;
+	bool is_sc_led;
+};
+
+struct lp5812_data {
+	struct lp5812_led_config *led_config;
+	u8 num_channels;
+	const char *label;
+};
+
+struct lp5812_chip {
+	struct i2c_client *i2c_cl;
+	struct mutex lock; /* Protects reg access */
+	struct lp5812_data *pdata;
+	const struct lp5812_device_config *cfg;
+	union u_scan_order u_scan_order;
+	union u_drive_mode u_drive_mode;
+};
+
+struct lp5812_led {
+	int chan_nr;
+	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
+	u8 brightness;
+	struct lp5812_chip *chip;
+};
+
+#endif /*_LP5812_H_*/
-- 
2.25.1


