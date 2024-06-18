Return-Path: <linux-leds+bounces-1996-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E090D2E2
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 15:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A32B28208D
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 13:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5092112F398;
	Tue, 18 Jun 2024 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="CffBMMYO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9815CD61
	for <linux-leds@vger.kernel.org>; Tue, 18 Jun 2024 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717454; cv=none; b=abV1w9mDdX6X446lITXopsv5PfVqI2oOgXJYtYwsSSydgcDzApErOnJh6KU7u3TCm9lKHtRDjYZ2GCsX5I9uGP0AQYLl7x2i4k46mdodTJf6YEGJ1cKlkmckHxSOjMp/xaWRVepemXvtlP5KdxhsNRd0FU2Z7MPZdQ8zSuFjewY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717454; c=relaxed/simple;
	bh=r25A03eIraXTw41z9ZfZjV9Rr4CjZjbiVKC5IMJT0pI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVNQKtlPd3rTE5H/audre9F01eH+JJIyKcX/3qi4ax6M1RlSXVUU+TzQtILetTx7b0aQ+pwJw2diO3LEHumBlKyv6dwLGJsLy75TfVczc0dQ6xnpOq3FbfD9RMSeyBVKEZGbLzVx/P5t8MBkyz1S/GMxAYunzEhtopgkfmBFbZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=CffBMMYO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cad4475e0so9095979a12.1
        for <linux-leds@vger.kernel.org>; Tue, 18 Jun 2024 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1718717450; x=1719322250; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JcF9LGMhYeqqe8e6XFHkX4so/zLsXMeJT1kqXM73gBU=;
        b=CffBMMYO0Me+2OuhB1Ta/U37F37P9EhQytSAXIz0sNcY1yqI4QDDofZLQOCWPRDuy2
         H1N/Vry5HWw26oauAGbKds/pRs2n5Tzm6pt73wFwrBIfKjyV5UYXcooz1A7B6auecStR
         zzCdDuQJ7mfhoDc9/h+oL5bd/+kvUWRMJ2G9XUV8SmaXQFmC/307LFaABksYDzTrXLhV
         o4bpS2nBBSLMivGPQN0kcLo8xAwk6lTIRRvcOECCYZmrQd1udh+0Gcx7DmMPgztAaLhN
         jC51U5XMSouNzbMHK8dBVwPHdBFLpoBG0g5AJntRaJVH7Lf/zSKSKX41Lpj8ouCameKD
         +oVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717450; x=1719322250;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcF9LGMhYeqqe8e6XFHkX4so/zLsXMeJT1kqXM73gBU=;
        b=aRdvopOlcfVUh3t+UHy4WclWZ9oPC7P8IbXlBkNjpPAHomZ71PxtLN7FmyghLRB1N3
         XW5J56xG2RIp8twnKIqUmVeM6kK1d7xNcrgPM6jfcrMVgoYYZYixm1rcJB9mZypoVO++
         2ePcGEnJa8SUA5SwXFmEdPmb+Nwbc0hm7XpKHTejv/GjAAJ5Bps5bZ4muGgq//DFGKnS
         rIp+VEzV+37AALSDxTn60hsDDp8kuckoto/DGZPpl9dEF/SdfHQ2WLt4TscoQK5KfoJ4
         wpid6vB00sa5PKRq2u4hM0e5QJPeajBPTROoW2SxYm0PQ96HPnzMm//LLjL5UxQE5AS8
         4Tew==
X-Forwarded-Encrypted: i=1; AJvYcCUgXOIVdULKw9VA8Ch8an07PCKwfvMrfF+wuelXgeVzs5vyFypu62nyBy3iz3aXaCG1kXBx5QV2yA0mRzDfslRSe46pbCSq0MDyCw==
X-Gm-Message-State: AOJu0Yx24R8AdxWXSlknNrH7chsRrsA2KbFdaQbconiRoIuXYAXjHCu/
	RNF/qGcsuXIc+pfmBueRyYbdTPy8iEFM1930vtoFlEhilyPYYoGJHFj87G3zP14w45acryln0xr
	3wvXo7wol5lbQogT2mE3Ph/1NHLSH+5RIc+Fv8deYj3m6SIjXYpv1yuoRNyHXlzQoG2gRtStbmY
	M90NromUABWdPNck/uhqfPmFz5
X-Google-Smtp-Source: AGHT+IHGVOZVtR8gCHcLlnUxsWDmdchCnQ3xw52Oigqnui3voSbUrIN7ASVpHkmfUW2lIxO70uInog==
X-Received: by 2002:a17:906:813:b0:a6f:881a:cd52 with SMTP id a640c23a62f3a-a6f94f2ab30mr165854966b.17.1718717449638;
        Tue, 18 Jun 2024 06:30:49 -0700 (PDT)
Received: from admins-Air ([2a02:810d:aec0:2a54:d850:f114:6022:6ebb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42badsm617510166b.184.2024.06.18.06.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:30:49 -0700 (PDT)
Date: Tue, 18 Jun 2024 15:30:40 +0200
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: pavel@ucw.cz, lee@kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 2/2] leds: Add LED1202 I2C driver
Message-ID: <ZnGMAK9bd3pZjWmG@admins-Air>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The LED1202 is a 12-channel low quiescent 
current LED driver. The output current can 
be adjusted separately for each channel by 
8-bit analog (current sink input) and 
12-bit digital (PWM) dimming control.

The LED1202 implements 12 low-side current 
generators with independent dimming control.
Internal volatile memory allows the user 
to store up to 8 different patterns, each 
pattern is a particular output configuration 
in terms of PWM duty-cycle (on 4096 steps).
Analog dimming (on 256 steps) is 
per channel but common to all patterns.

Each active=1 device tree LED node will
have a corresponding entry in /sys/class/leds
with the label name.
The brightness property corresponds to the
per channel analog dimming, while the 
patterns[1-8] to the PWM dimming control.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---

Changes in v2:
  - Fix build error for device_attribute modes

 drivers/leds/Kconfig        |  10 +
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-led1202.c | 617 ++++++++++++++++++++++++++++++++++++
 3 files changed, 628 insertions(+)
 create mode 100644 drivers/leds/leds-led1202.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 05e6af88b88c..c65f2b1bbe30 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -899,6 +899,16 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_LED1202
+	tristate "LED Support for LED1202 I2C chips"
+	depends on LEDS_CLASS
+	depends on I2C
+	depends on OF
+	help
+	  Say Y to enable support for LEDs connected to LED1202
+	  LED driver chips accessed via the I2C bus.
+	  Supported devices include LED1202.
+
 config LEDS_TPS6105X
 	tristate "LED support for TI TPS6105X"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index effdfc6f1e95..80423fa8818e 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
 obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
 obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
+obj-$(CONFIG_LEDS_LED1202)		+= leds-led1202.o
 obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
 obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
 obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
diff --git a/drivers/leds/leds-led1202.c b/drivers/leds/leds-led1202.c
new file mode 100644
index 000000000000..4e82f0e66168
--- /dev/null
+++ b/drivers/leds/leds-led1202.c
@@ -0,0 +1,617 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Simple LED driver for ST LED1202 chip
+ *
+ * Copyright (C) 2024 Remote-Tech Ltd. UK
+ */
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/ctype.h>
+#include <linux/leds.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
+
+#define DRIVER_NAME "led-driver-1202"
+#define DRIVER_VERSION "0.0.1"
+
+#define LL1202_MAX_LEDS 12
+
+#define LL1202_DEVICE_ID 0x00
+#define LL1202_DEV_ENABLE 0x01
+#define LL1202_CHAN_ENABLE_LOW 0x02
+#define LL1202_CHAN_ENABLE_HIGH 0x03
+#define LL1202_CONFIG_REG 0x04
+#define LL1202_ILED_REG0 0x09
+#define LL1202_PATTERN_REP 0x15
+#define LL1202_PATTERN_DUR 0x16
+#define LL1202_PATTERN_PWM 0x1E
+#define LL1202_CLOCK_REG 0xE0
+
+struct ll1202_led {
+	struct led_classdev led_cdev;
+	struct ll1202_chip *chip;
+	int led_num;
+	char name[32];
+	int is_active;
+};
+
+struct ll1202_chip {
+	struct i2c_client *client;
+	struct mutex lock;
+	struct ll1202_led leds[LL1202_MAX_LEDS];
+};
+
+static struct ll1202_led *cdev_to_ll1202_led(struct led_classdev *cdev)
+{
+	return container_of(cdev, struct ll1202_led, led_cdev);
+}
+
+static int ll1202_read_reg(struct ll1202_chip *chip, int reg, uint8_t *val)
+{
+	int ret = i2c_smbus_read_byte_data(chip->client, reg);
+
+	if (ret < 0)
+		return ret;
+
+	*val = (uint8_t)ret;
+	return 0;
+}
+
+static int ll1202_write_reg(struct ll1202_chip *chip, int reg, uint8_t val)
+{
+	return i2c_smbus_write_byte_data(chip->client, reg, val);
+}
+
+static int ll1202_get_channel(struct device *dev)
+{
+	struct device_node *np = dev->parent->of_node, *child;
+	int err, ret = -1;
+
+	for_each_child_of_node(np, child) {
+		if (strncmp(dev->kobj.name,
+			    of_get_property(child, "label", NULL),
+			    strnlen(dev->kobj.name, MAX_INPUT)) == 0) {
+			err = of_property_read_u32(child, "reg", &ret);
+			if (err) {
+				of_node_put(child);
+				pr_err(DRIVER_NAME
+				       ": Failed to read property %s", child->name);
+				return ret;
+			}
+			break;
+		}
+	}
+	return ret;
+}
+
+static ssize_t ll1202_show_all_registers(struct device *dev,
+					 struct device_attribute *devattr,
+					 char *buf)
+{
+	struct ll1202_chip *chip = dev_get_drvdata(dev);
+	uint8_t reg_value = 0;
+	int ret, i;
+	char *bufp = buf;
+
+	mutex_lock(&chip->lock);
+
+	for (i = LL1202_DEVICE_ID; i <= LL1202_CLOCK_REG; i++) {
+		ret = ll1202_read_reg(chip, i, &reg_value);
+		if (ret != 0)
+			dev_err(&chip->client->dev,
+				"Reading register [0x%x] failed.\n", i);
+
+		bufp += snprintf(bufp, PAGE_SIZE, "Addr[0x%x] = 0x%x\n", i,
+				 reg_value);
+	}
+
+	mutex_unlock(&chip->lock);
+	return strlen(buf);
+}
+
+static ssize_t
+ll1202_show_patt_sequence_repetition(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct ll1202_chip *chip = dev_get_drvdata(dev);
+	unsigned int ret;
+	uint8_t reg_value;
+	char *bufp = buf;
+
+	mutex_lock(&chip->lock);
+	ret = ll1202_read_reg(chip, LL1202_PATTERN_REP, &reg_value);
+	if (ret != 0)
+		dev_err(&chip->client->dev, "Reading register [0x%x] failed\n", LL1202_PATTERN_REP);
+	mutex_unlock(&chip->lock);
+	bufp += snprintf(bufp, PAGE_SIZE,
+			 "Pattern sequence register, repetition value = %d (times)\n",
+			 reg_value);
+	return strlen(buf);
+}
+
+static ssize_t
+ll1202_store_patt_sequence_repetition(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct ll1202_chip *chip = dev_get_drvdata(dev);
+	unsigned int ret;
+	unsigned long duration;
+
+	if (!count)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 10, &duration);
+	if (ret) {
+		dev_err(&chip->client->dev, "sscanf failed with error :%d\n",
+			ret);
+		return ret;
+	}
+
+	mutex_lock(&chip->lock);
+	ret = ll1202_write_reg(chip, LL1202_PATTERN_REP, duration);
+	if (ret != 0)
+		dev_err(&chip->client->dev, "Writing register [0x%x] failed\n",
+			LL1202_PATTERN_REP);
+	mutex_unlock(&chip->lock);
+	return count;
+}
+
+static int ll1202_prescalar_to_miliamps(uint8_t reg_value)
+{
+	return reg_value * 20 / 255;
+}
+
+static int ll1202_prescalar_to_miliseconds(uint8_t reg_value)
+{
+	return reg_value * 5660 / 255;
+}
+
+static ssize_t ll1202_show_channel_mA_current(struct device *dev,
+					      struct device_attribute *attr,
+					      char *buf)
+{
+	struct ll1202_chip *chip = dev_get_drvdata(dev->parent);
+	unsigned int ret;
+	uint8_t reg_value;
+	char *bufp = buf;
+	int led_num = ll1202_get_channel(dev);
+
+	if (led_num < 0 || led_num >= LL1202_MAX_LEDS) {
+		dev_err(&chip->client->dev,
+			"Invalid register [0x%x] (out of range)\n",
+			led_num);
+	}
+	mutex_lock(&chip->lock);
+	ret = ll1202_read_reg(chip, LL1202_ILED_REG0 + led_num, &reg_value);
+	if (ret != 0)
+		dev_err(&chip->client->dev, "Reading analog dimming register [0x%x] failed\n",
+			led_num);
+	mutex_unlock(&chip->lock);
+	bufp += snprintf(bufp, PAGE_SIZE, "Channel[%d] = %d mA\n", led_num,
+			 ll1202_prescalar_to_miliamps(reg_value));
+	return strlen(buf);
+}
+
+static int ll1202_channel_activate(struct ll1202_led *led)
+{
+	struct ll1202_chip *chip;
+	uint8_t reg_chan_low, reg_chan_high;
+	int ret = 0;
+
+	chip = led->chip;
+	if (led->is_active) {
+		mutex_lock(&chip->lock);
+
+		ret = ll1202_read_reg(chip, LL1202_CHAN_ENABLE_LOW,
+				      &reg_chan_low);
+		if (ret < 0) {
+			dev_err(&chip->client->dev,
+				"Failed reading register [0x%x]\n", LL1202_CHAN_ENABLE_LOW);
+		}
+
+		ret = ll1202_read_reg(chip, LL1202_CHAN_ENABLE_HIGH,
+				      &reg_chan_high);
+		if (ret < 0) {
+			dev_err(&chip->client->dev,
+				"Failed reading register [0x%x]\n", LL1202_CHAN_ENABLE_HIGH);
+		}
+
+		reg_chan_low = reg_chan_low | BIT(led->led_num);
+		ret = ll1202_write_reg(chip, LL1202_CHAN_ENABLE_LOW,
+				       reg_chan_low);
+		if (ret < 0) {
+			dev_err(&chip->client->dev,
+				"Failed writing to register [0x%x]\n", LL1202_CHAN_ENABLE_LOW);
+		}
+		reg_chan_high = reg_chan_high | (BIT(led->led_num) >> 7);
+		ret = ll1202_write_reg(chip, LL1202_CHAN_ENABLE_HIGH,
+				       reg_chan_high);
+		if (ret < 0) {
+			dev_err(&chip->client->dev,
+				"Failed writing to register [0x%x]\n", LL1202_CHAN_ENABLE_HIGH);
+		}
+		mutex_unlock(&chip->lock);
+	}
+	return ret;
+}
+
+#define LL1202_PWM_PATTERN_ATTR(pattern)                                          \
+	static ssize_t ll1202_show_pwm_pattern##pattern(                          \
+		struct device *dev, struct device_attribute *attr, char *buf)     \
+	{                                                                         \
+		struct ll1202_chip *chip = dev_get_drvdata(dev->parent);          \
+		uint8_t duration = 0;                                             \
+		uint8_t reg_value_l = 0;                                          \
+		uint8_t reg_value_h = 0;                                          \
+		uint16_t reg_value = 0;                                           \
+		int ret;                                                          \
+		char *bufp = buf;                                                 \
+		int led_num = ll1202_get_channel(dev);                            \
+		if (led_num < 0 || led_num >= LL1202_MAX_LEDS) {                  \
+			dev_err(&chip->client->dev,                               \
+				"Invalid register [0x%x] (out of range)\n",  \
+				led_num);                                         \
+		}                                                                 \
+		mutex_lock(&chip->lock);                                          \
+		ret = ll1202_read_reg(                                            \
+			chip,                                                     \
+			(LL1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),    \
+			&reg_value_l);                                            \
+		if (ret != 0)                                                     \
+			dev_err(&chip->client->dev,                               \
+				"Reading pattern PWM register [0x%x] failed\n", led_num);     \
+		ret = ll1202_read_reg(chip,                                       \
+				      (LL1202_PATTERN_PWM + 0x1 +                 \
+				       (led_num * 2) + 0x18 * pattern),           \
+				      &reg_value_h);                              \
+		if (ret != 0)                                                     \
+			dev_err(&chip->client->dev,                               \
+				"Reading pattern PWM register [0x%x] failed\n", led_num);     \
+		reg_value = (uint16_t)reg_value_h << 8 | reg_value_l;             \
+		ret = ll1202_read_reg(chip, (LL1202_PATTERN_DUR + pattern),       \
+				      &duration);                                 \
+		if (ret != 0)                                                     \
+			dev_err(&chip->client->dev,                               \
+				"Reading pattern durating register [0x%x] failed\n", led_num);     \
+		bufp += snprintf(                                                 \
+			bufp, PAGE_SIZE,                                          \
+			"Pattern[%d][cs%d]: PWM = 0x%03X; DURATION = %d ms\n",    \
+			pattern, led_num, reg_value,                              \
+			ll1202_prescalar_to_miliseconds(duration));               \
+		mutex_unlock(&chip->lock);                                        \
+		return strlen(buf);                                               \
+	}                                                                         \
+	static ssize_t ll1202_store_pwm_pattern##pattern(                         \
+		struct device *dev, struct device_attribute *attr,                \
+		const char *buf, size_t count)                                    \
+	{                                                                         \
+		struct ll1202_chip *chip = dev_get_drvdata(dev->parent);          \
+		unsigned int ret, reg_value;                                      \
+		unsigned long duration;                                           \
+		char buf_u8[16];                                                  \
+		uint8_t reg_value_l = 0;                                          \
+		uint8_t reg_value_h = 0;                                          \
+		int led_num = ll1202_get_channel(dev);                            \
+		if (led_num < 0 || led_num >= LL1202_MAX_LEDS) {                  \
+			dev_err(&chip->client->dev,                               \
+				"Invalid register [0x%x] (out of range)\n",  \
+				led_num);                                         \
+			return count;                                             \
+		}                                                                 \
+		if (!count)                                                       \
+			return -EINVAL;                                           \
+		ret = sscanf(buf, "%X %s", &reg_value, buf_u8);                   \
+		if (ret == 0) {                                                   \
+			dev_err(&chip->client->dev,                               \
+				"sscanf failed with error :%d\n", ret);           \
+			return ret;                                               \
+		}                                                                 \
+		ret = kstrtoul(buf_u8, 10, &duration);                            \
+		if (ret)                                                          \
+			return ret;                                               \
+		reg_value_l = (uint8_t)reg_value;                                 \
+		reg_value_h = (uint8_t)(reg_value >> 8);                          \
+		mutex_lock(&chip->lock);                                          \
+		ret = ll1202_write_reg(                                           \
+			chip,                                                     \
+			(LL1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),    \
+			(uint8_t)reg_value_l);                                    \
+		if (ret != 0)                                                     \
+			dev_err(&chip->client->dev,                               \
+				"Writing to register [0x%x] failed, value %d\n",  \
+				LL1202_PATTERN_PWM + (led_num * 2) +              \
+					0x18 * pattern,                           \
+				reg_value_l);                                     \
+		ret = ll1202_write_reg(chip,                                      \
+				       (LL1202_PATTERN_PWM + 0x1 +                \
+					(led_num * 2) + 0x18 * pattern),          \
+				       (uint8_t)reg_value_h);                     \
+		if (ret != 0)                                                     \
+			dev_err(&chip->client->dev,                               \
+				"Writing to register [0x%x] failed, value %d\n",  \
+				(LL1202_PATTERN_PWM + 0x1 + (led_num * 2) +       \
+				 0x18 * pattern),                                 \
+				reg_value_h);                                     \
+		ret = ll1202_write_reg(chip, (LL1202_PATTERN_DUR + pattern),      \
+				       (u8)duration);                             \
+		if (ret != 0)                                                     \
+			dev_err(&chip->client->dev,                               \
+				"Writing to register [0x%x] failed, value %d\n", \
+				(LL1202_PATTERN_DUR + pattern), (u8)duration);    \
+		ret = ll1202_write_reg(chip, LL1202_CONFIG_REG,                   \
+				       (0xC0 | pattern));                         \
+		if (ret != 0) {                                                   \
+			dev_err(&chip->client->dev,                               \
+				"Failed writing to reg [0x%x]\n", LL1202_CONFIG_REG);     \
+		}                                                                 \
+		mutex_unlock(&chip->lock);                                        \
+		ll1202_channel_activate(&chip->leds[led_num]);                    \
+		return count;                                                     \
+	}                                                                         \
+	static struct device_attribute dev_attr_led_pwm_pattern##pattern = {		\
+	.attr = {							\
+	.name = __stringify(pwm_pattern##pattern),					\
+	.mode =  00444 | 00200,						\
+	},								\
+	.show = ll1202_show_pwm_pattern##pattern,				\
+	.store = ll1202_store_pwm_pattern##pattern,				\
+}
+
+LL1202_PWM_PATTERN_ATTR(0);
+LL1202_PWM_PATTERN_ATTR(1);
+LL1202_PWM_PATTERN_ATTR(2);
+LL1202_PWM_PATTERN_ATTR(3);
+LL1202_PWM_PATTERN_ATTR(4);
+LL1202_PWM_PATTERN_ATTR(5);
+LL1202_PWM_PATTERN_ATTR(6);
+LL1202_PWM_PATTERN_ATTR(7);
+
+static DEVICE_ATTR(led_device_regsdump, 00444, ll1202_show_all_registers,
+		   NULL);
+static DEVICE_ATTR(patt_sequence_repetition, 00444 | 00200,
+		   ll1202_show_patt_sequence_repetition,
+		   ll1202_store_patt_sequence_repetition);
+static DEVICE_ATTR(current_mA, 00444, ll1202_show_channel_mA_current, NULL);
+
+static struct attribute *led_attrs[] = {
+	&dev_attr_led_device_regsdump.attr,
+	&dev_attr_patt_sequence_repetition.attr,
+	NULL,
+};
+
+static struct attribute *led_group_attrs[] = {
+	&dev_attr_led_pwm_pattern0.attr, &dev_attr_led_pwm_pattern1.attr,
+	&dev_attr_led_pwm_pattern2.attr, &dev_attr_led_pwm_pattern3.attr,
+	&dev_attr_led_pwm_pattern4.attr, &dev_attr_led_pwm_pattern5.attr,
+	&dev_attr_led_pwm_pattern6.attr, &dev_attr_led_pwm_pattern7.attr,
+	&dev_attr_current_mA.attr,	 NULL,
+};
+
+static struct attribute_group attr_group = {
+	.attrs = led_attrs,
+};
+
+static struct attribute_group attr_pat_group = {
+	.attrs = led_group_attrs,
+};
+
+static const struct attribute_group *ll1202_groups[] = { &attr_pat_group,
+							 NULL };
+
+static void ll1202_brightness_set(struct led_classdev *led_cdev,
+				  enum led_brightness value)
+{
+	struct ll1202_led *led = cdev_to_ll1202_led(led_cdev);
+	struct ll1202_chip *chip = led->chip;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = ll1202_write_reg(chip, LL1202_ILED_REG0 + led->led_num, value);
+	if (ret != 0)
+		dev_err(&chip->client->dev, "Reading register [0x%x] failed\n",
+			LL1202_ILED_REG0 + led->led_num);
+	mutex_unlock(&chip->lock);
+}
+
+static enum led_brightness ll1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct ll1202_led *led = cdev_to_ll1202_led(led_cdev);
+	struct ll1202_chip *chip = led->chip;
+	uint8_t reg_value;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = ll1202_read_reg(chip, LL1202_ILED_REG0 + led->led_num,
+			      &reg_value);
+	if (ret != 0)
+		dev_err(&chip->client->dev, "Reading register [0x%x] failed\n",
+			LL1202_ILED_REG0 + led->led_num);
+
+	mutex_unlock(&chip->lock);
+	return reg_value;
+}
+
+static int ll1202_dt_init(struct ll1202_chip *chip)
+{
+	struct device_node *np = chip->client->dev.of_node, *child;
+	struct ll1202_led *led;
+	int err, reg;
+
+	for_each_child_of_node(np, child) {
+		err = of_property_read_u32(child, "reg", &reg);
+		if (err) {
+			of_node_put(child);
+			pr_err(DRIVER_NAME ": Failed to get child node");
+			return err;
+		}
+		if (reg < 0 || reg >= LL1202_MAX_LEDS) {
+			of_node_put(child);
+			pr_err(DRIVER_NAME ": Invalid register value [0x%x] (out of range)", reg);
+			return -EINVAL;
+		}
+
+		led = &chip->leds[reg];
+		led->led_cdev.name = of_get_property(child, "label", NULL) ?:
+					     child->name;
+
+		err = of_property_read_u32(child, "active", &led->is_active);
+		if (err) {
+			of_node_put(child);
+			pr_err(DRIVER_NAME ": Failed to get child node");
+			return err;
+		}
+
+		led->led_cdev.brightness_set = ll1202_brightness_set;
+		led->led_cdev.brightness_get = ll1202_brightness_get;
+		led->led_cdev.groups = ll1202_groups;
+	}
+	return 0;
+}
+
+static int ll1202_setup(struct ll1202_chip *chip)
+{
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = ll1202_write_reg(chip, LL1202_DEV_ENABLE, 0x1);
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Failed writing to register [0x%x]\n",
+			LL1202_DEV_ENABLE);
+	}
+	mutex_unlock(&chip->lock);
+	usleep_range(6500, 10000);
+	mutex_lock(&chip->lock);
+	ret = ll1202_write_reg(chip, LL1202_DEV_ENABLE, 0x80);
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Failed writing to register [0x%x]\n",
+			LL1202_DEV_ENABLE);
+	}
+	mutex_unlock(&chip->lock);
+	usleep_range(6500, 10000);
+	mutex_lock(&chip->lock);
+	ret = ll1202_write_reg(chip, LL1202_PATTERN_REP, 0xFF);
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Failed writing to register [0x%x]\n",
+			LL1202_PATTERN_REP);
+		return ret;
+	}
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+static int ll1202_probe(struct i2c_client *client)
+{
+	struct ll1202_chip *chip;
+	struct ll1202_led *led;
+	int ret, err;
+	int i;
+
+	pr_info(DRIVER_NAME ": (I2C) " DRIVER_VERSION "\n");
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_BYTE_DATA)) {
+		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
+		return -EIO;
+	}
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, chip);
+
+	mutex_init(&chip->lock);
+	chip->client = client;
+
+	/* Device tree setup */
+	ret = ll1202_dt_init(chip);
+	if (ret < 0)
+		goto exit;
+
+	/* Configuration setup */
+	ret = ll1202_setup(chip);
+	if (ret < 0)
+		goto exit;
+
+	for (i = 0; i < LL1202_MAX_LEDS; i++) {
+		led = &chip->leds[i];
+		led->chip = chip;
+		led->led_num = i;
+		if (led->is_active) {
+			err = led_classdev_register(&client->dev,
+						    &led->led_cdev);
+			if (err < 0) {
+				pr_err(DRIVER_NAME
+				       ": Failed to register LED class dev");
+				goto exit;
+			}
+		}
+	}
+
+	ret = sysfs_create_group(&client->dev.kobj, &attr_group);
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to create sysfs group for ll1202\n");
+		goto err_setup;
+	}
+
+	return 0;
+
+err_setup:
+	for (i = 0; i < LL1202_MAX_LEDS; i++)
+		led_classdev_unregister(&chip->leds[i].led_cdev);
+exit:
+	mutex_destroy(&chip->lock);
+	devm_kfree(&client->dev, chip);
+	return ret;
+}
+
+static void ll1202_remove(struct i2c_client *client)
+{
+	struct ll1202_chip *dev = i2c_get_clientdata(client);
+	int i;
+
+	for (i = 0; i < LL1202_MAX_LEDS; i++)
+		led_classdev_unregister(&dev->leds[i].led_cdev);
+
+	sysfs_remove_group(&client->dev.kobj, &attr_group);
+
+	mutex_destroy(&dev->lock);
+	devm_kfree(&client->dev, dev->leds);
+	devm_kfree(&client->dev, dev);
+}
+
+static const struct i2c_device_id ll1202_id[] = {
+	{ DRIVER_NAME "-i2c", 0 },
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, ll1202_id);
+
+static const struct of_device_id ll1202_dt_ids[] = {
+	{
+		.compatible = "st,led1202",
+	},
+};
+
+MODULE_DEVICE_TABLE(of, ll1202_dt_ids);
+
+static struct i2c_driver ll1202_driver = {
+	.driver = {
+		.name = "ll1202",
+		.of_match_table = of_match_ptr(ll1202_dt_ids),
+	},
+	.probe = ll1202_probe,
+	.remove = ll1202_remove,
+	.id_table = ll1202_id,
+};
+
+module_i2c_driver(ll1202_driver);
+
+MODULE_AUTHOR("Remote Tech LTD");
+MODULE_DESCRIPTION("LED1202 : 12-channel constant current LED driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


