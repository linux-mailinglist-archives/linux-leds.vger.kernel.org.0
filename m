Return-Path: <linux-leds+bounces-3666-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8C9F6D6D
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 19:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 673AF165F01
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 18:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A811FA8E9;
	Wed, 18 Dec 2024 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="cFVTNmmZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C401591EA
	for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546861; cv=none; b=FC4t76y74oNrgkkn9Kw1Hs+Bq4wf37kNsrVWPXLHsAAr+dybW2+/hS0cjIMAykxk9611C50PU+J3uy5dZVVmdLlI2kq1//CHvGbfUbTw5ebAYbgXZaJS6GZhFGCayjYYimVtIujnsWWpUGXTP9A2Qs/mHww0Ggve/qVz+E6aVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546861; c=relaxed/simple;
	bh=61D3znVcEG2VhHxa9evzmdFi7CxuHPIzVyy04Fv283U=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXu+Q4BlIRwUe1IB0uzNpUtsaHEWpCUvOXbKnnPiNJRxqi+6n19UNadr+bX4eBRB19tT4ydwJfw/bFJSXy9tHWs89L+AkVXdQkmvG1fZ5PgwJovE0TYGb/FvMh+FKdMvIi5KjTvJ6wbF8TA3qqJiqvCadir8msqwlpcpXB3lKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=cFVTNmmZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa6a92f863cso88567866b.1
        for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 10:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546856; x=1735151656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FBWBzt/Y+a9HE0tMTE1aAXIbLnP7RUj3xfftndrRYA=;
        b=cFVTNmmZmAyrN9CjeJY7DmY1XOTys2bmRpX10+DSZoR8wQbv19lSn2Dr63im2QXB/k
         mXP5m46JajhCJh304+pYKko0yQzCEP1ERz6Dhu3xN8G1rAReUf6PWuX0VxR13TOAGEEo
         YgRjM3EWW7fCQB1RuowCFbT1L9MC9X7yVOec0LV+xHYe0kZCWaqid41FwaQkLBw5VWEE
         Yxo3Dy+EZ9snU1ReuTfnVUlHGxijS+uzF+BTyqnCo/xanTfnJNJT6TS214QWuoSoKRXn
         cajWbTfIxZhgEMqcFc+Bzp1ghhShlQiqM3konmVnSDz1dsuExv4MOfaFGEIB8aq0pFaO
         tnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546856; x=1735151656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FBWBzt/Y+a9HE0tMTE1aAXIbLnP7RUj3xfftndrRYA=;
        b=YdLiEcKQ2hwNzItLQmTN/+fHPzWlpfSmSFFN20haMJoR/B+GjaEdj+G8HTuO5tQgZF
         M4UBpg6+LscIFZJ6/G1kmkYZCwue7tdCLMr4jkpOIJYoRkAJH8ucZsVetznM0O4y4qQn
         BJvHfCAemwxtXfKdBCmyV9NZzpVdf3XtDGszJJZWA7dCionMAp3Rtb/ZvsQYNHP1AZbM
         vtU89hzXxUPQkSG/kogI7Nrf8/cARaJXB49NKJv/baCt6cpOLlkR1pe7zZkE0YwCDYAG
         WtM7HguKCmBcO/Le19ZWhuZtvWob1SQCflMABXhJ5CM25xNtxDN8r6YrZfVYS6duW5KI
         iZhw==
X-Forwarded-Encrypted: i=1; AJvYcCULFj85d07irbr3hOrukrqNl0N8NQiHT9NJ6V9Z7KWoTBX0JRlkbYlswPVB+5h9AiS17s5awjZlts2H@vger.kernel.org
X-Gm-Message-State: AOJu0Yze1wkO+noCE4GRUFPcDiSj8lYONMMF4DUj/QoXSpjwSm2nCgMT
	sgK3wkHBWtM45w/TTZpO8EroCbDv5ImXS5EEJio9wnLsOlcOAJr6Hp7BdYlUAW0hTe/i0bT00i9
	qgSCs5YGVz+rFiuwWozhl03htDhM0lMab/svjR/0fFHnDvMTDUBBlv9l3IIs10ikXRWcxFCKuS5
	l79RFtcSut7favjdeTwt8PDOe/
X-Gm-Gg: ASbGncvv2wDr2DkRdOoItWOaZHRujW7fTjgAY6U/SdTtnd2P161sLumHEysDS+c2EqV
	VJxoTtJEb4AajsyDWR144j+hWeb4+Qq81UpmC+sbPp5EKxOzNRVx+z4HOsy4cOiWNmJK2PL5D/I
	qLUc/RY2+Y8tMbtKHVVeRaIoD8leDMnuArWwYi5MMJequev17r7nl9g47a4l3I63bUhDW9nHqg+
	2iqsqoYeGRGVRuIbURo+qxTdPJrKWp2c5qchmJ34+3yFnKJ+OR2Q7APSggNrfHZTdGL/yrAJBqd
	Xk4VGVyFEYCFHk4Ob6NugHOzF4q9nTBmLmhfg3DNsxMGQorYXQAAgRL9XtyzGCcfoM61ZckJ56L
	9
X-Google-Smtp-Source: AGHT+IHDVLz8jGeVslnGTbrLMXW5rpembdge/fKeQmIqFpGsDaA9SsDjlmehX72taDQ11WzdfftY8A==
X-Received: by 2002:a17:907:7743:b0:aab:d8df:9bbb with SMTP id a640c23a62f3a-aac07a51ec1mr40943666b.41.1734546855552;
        Wed, 18 Dec 2024 10:34:15 -0800 (PST)
Received: from localhost.localdomain (ipb21b247d.dynamic.kabel-deutschland.de. [178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec53sm583873366b.156.2024.12.18.10.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:34:15 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v11 3/3] leds: Add LED1202 I2C driver
Date: Wed, 18 Dec 2024 18:33:59 +0000
Message-Id: <20241218183401.41687-4-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The output current can be adjusted separately for each channel by 8-bit
analog (current sink input) and 12-bit digital (PWM) dimming control. The
LED1202 implements 12 low-side current generators with independent dimming
control.
Internal volatile memory allows the user to store up to 8 different patterns,
each pattern is a particular output configuration in terms of PWM
duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
common to all patterns. Each device tree LED node will have a corresponding
entry in /sys/class/leds with the label name. The brightness property
corresponds to the per channel analog dimming, while the patterns[1-8] to the
PWM dimming control.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
    Changes in v10:
      - update description help in Kconfig
      - move st1202_led and st1202_chip into one line, declaration and definition
    Changes in v9:
      - log errors directly in st1202_write_reg and st1202_read_reg
      - use mutex guards instead of lock/unlock
      - remove i2c_set_clientdata
    Changes in v7:
      - fix st1202_brightness_get() error: uninitialized symbol 'value'
    Changes in v6:
      - fix build error
    Changes in v5:
      - remove unused macros
      - switch to using devm_led_classdev_register_ext (struct st1202_led update)
      - add prescalar_to_milliseconds (convert [22..5660]ms to [0..255] reg value)
      - remove register range check in dt_init (range protected by yaml)
      - address all review comments in v4
    Changes in v4:
      - Remove attributes/extended attributes implementation
      - Use /sys/class/leds/<led>/hw_pattern (Pavel suggestion)
      - Implement review findings of Christophe JAILLET
    Changes in v3:
      - Rename all ll1202 to st1202, including driver file name
      - Convert all magic numbers to defines
      - Refactor the show/store callbacks as per Lee's and Thomas's review
      - Remove ll1202_get_channel and use dev_ext_attributes instead
      - Log all error values for all the functions
      - Use sysfs_emit for show callbacks
    Changes in v2:
      - Fix build error for device_attribute modes

 drivers/leds/Kconfig       |  10 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-st1202.c | 416 +++++++++++++++++++++++++++++++++++++
 3 files changed, 427 insertions(+)
 create mode 100644 drivers/leds/leds-st1202.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b784bb74a837..c275963c498c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -931,6 +931,16 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_ST1202
+	tristate "LED Support for STMicroelectronics LED1202 I2C chips"
+	depends on LEDS_CLASS
+	depends on I2C
+	depends on OF
+	select LEDS_TRIGGERS
+	help
+	  Say Y to enable support for LEDs connected to LED1202
+	  LED driver chips accessed via the I2C bus.
+
 config LEDS_TPS6105X
 	tristate "LED support for TI TPS6105X"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 18afbb5a23ee..e8b39ef760cc 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
+obj-$(CONFIG_LEDS_ST1202)		+= leds-st1202.o
 obj-$(CONFIG_LEDS_SUN50I_A100)		+= leds-sun50i-a100.o
 obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
 obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
new file mode 100644
index 000000000000..b691c4886993
--- /dev/null
+++ b/drivers/leds/leds-st1202.c
@@ -0,0 +1,416 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LED driver for STMicroelectronics LED1202 chip
+ *
+ * Copyright (C) 2024 Remote-Tech Ltd. UK
+ */
+
+#include <linux/cleanup.h>
+#include <linux/ctype.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#define ST1202_CHAN_DISABLE_ALL            0x00
+#define ST1202_CHAN_ENABLE_HIGH            0x03
+#define ST1202_CHAN_ENABLE_LOW             0x02
+#define ST1202_CONFIG_REG                  0x04
+/* PATS: Pattern sequence feature enable */
+#define ST1202_CONFIG_REG_PATS             BIT(7)
+/* PATSR: Pattern sequence runs (self-clear when sequence is finished) */
+#define ST1202_CONFIG_REG_PATSR            BIT(6)
+#define ST1202_CONFIG_REG_SHFT             BIT(3)
+#define ST1202_DEV_ENABLE                  0x01
+#define ST1202_DEV_ENABLE_ON               BIT(0)
+#define ST1202_DEV_ENABLE_RESET            BIT(7)
+#define ST1202_DEVICE_ID                   0x00
+#define ST1202_ILED_REG0                   0x09
+#define ST1202_MAX_LEDS                    12
+#define ST1202_MAX_PATTERNS                8
+#define ST1202_MILLIS_PATTERN_DUR_MAX      5660
+#define ST1202_MILLIS_PATTERN_DUR_MIN      22
+#define ST1202_PATTERN_DUR                 0x16
+#define ST1202_PATTERN_PWM                 0x1E
+#define ST1202_PATTERN_REP                 0x15
+
+struct st1202_led {
+	struct fwnode_handle *fwnode;
+	struct led_classdev led_cdev;
+	struct st1202_chip *chip;
+	bool is_active;
+	int led_num;
+};
+
+struct st1202_chip {
+	struct i2c_client *client;
+	struct mutex lock;
+	struct st1202_led leds[ST1202_MAX_LEDS];
+};
+
+static struct st1202_led *cdev_to_st1202_led(struct led_classdev *cdev)
+{
+	return container_of(cdev, struct st1202_led, led_cdev);
+}
+
+static int st1202_read_reg(struct st1202_chip *chip, int reg, uint8_t *val)
+{
+	struct device *dev = &chip->client->dev;
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(chip->client, reg);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read register [0x%x]: %d\n", reg, ret);
+		return ret;
+	}
+
+	*val = (uint8_t)ret;
+	return 0;
+}
+
+static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
+{
+	struct device *dev = &chip->client->dev;
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(chip->client, reg, val);
+	if (ret != 0)
+		dev_err(dev, "Failed to write %d to register [0x%x]: %d\n", val, reg, ret);
+
+	return ret;
+}
+
+static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
+{
+	return value / ST1202_MILLIS_PATTERN_DUR_MIN - 1;
+}
+
+static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
+				int pattern, unsigned int value)
+{
+	u8 value_l, value_h;
+	int ret;
+
+	value_l = (u8)value;
+	value_h = (u8)(value >> 8);
+
+	/*
+	 *  Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
+	 *  where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh)
+	 *  and y is the pattern number in hexadecimal (y = 00h .. 07h)
+	 */
+	ret = st1202_write_reg(chip, (ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),
+				value_l);
+	if (ret != 0)
+		return ret;
+
+	/*
+	 * Datasheet: Register address high = 1Eh + 01h + 2(xh) +18h*(yh),
+	 * where x is the channel number in hexadecimal (x = 00h .. 0Bh)
+	 * and y is the pattern number in hexadecimal (y = 00h .. 07h)
+	 */
+	ret = st1202_write_reg(chip, (ST1202_PATTERN_PWM + 0x1 + (led_num * 2) + 0x18 * pattern),
+				value_h);
+	if (ret != 0)
+		return ret;
+
+	return 0;
+}
+
+static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
+					unsigned int value)
+{
+	return st1202_write_reg(chip, (ST1202_PATTERN_DUR + pattern),
+				st1202_prescalar_to_miliseconds(value));
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	u8 value = 0;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
+
+	return value;
+}
+
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	u8 chan_low, chan_high;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	if (led_num <= 7) {
+		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
+		if (ret < 0)
+			return ret;
+
+		chan_low = active ? chan_low | BIT(led_num) : chan_low & ~BIT(led_num);
+
+		ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_LOW, chan_low);
+		if (ret < 0)
+			return ret;
+
+	} else {
+		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_HIGH, &chan_high);
+		if (ret < 0)
+			return ret;
+
+		chan_high = active ? chan_high | (BIT(led_num) >> 8) :
+					chan_high & ~(BIT(led_num) >> 8);
+
+		ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_HIGH, chan_high);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(ldev);
+	struct st1202_chip *chip = led->chip;
+
+	return st1202_channel_set(chip, led->led_num, value == LED_OFF ? false : true);
+}
+
+static int st1202_led_pattern_clear(struct led_classdev *ldev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(ldev);
+	struct st1202_chip *chip = led->chip;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
+		if (ret != 0)
+			return ret;
+
+		ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
+		if (ret != 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int st1202_led_pattern_set(struct led_classdev *ldev,
+				struct led_pattern *pattern,
+				u32 len, int repeat)
+{
+	struct st1202_led *led = cdev_to_st1202_led(ldev);
+	struct st1202_chip *chip = led->chip;
+	int ret;
+
+	if (len > ST1202_MAX_PATTERNS)
+		return -EINVAL;
+
+	guard(mutex)(&chip->lock);
+
+	for (int patt = 0; patt < len; patt++) {
+		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
+				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
+			return -EINVAL;
+
+		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
+		if (ret != 0)
+			return ret;
+
+		ret = st1202_duration_pattern_write(chip, patt, pattern[patt].delta_t);
+		if (ret != 0)
+			return ret;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, repeat);
+	if (ret != 0)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PATSR |
+							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
+	if (ret != 0)
+		return ret;
+
+	return 0;
+}
+
+static int st1202_dt_init(struct st1202_chip *chip)
+{
+	struct device *dev = &chip->client->dev;
+	struct st1202_led *led;
+	int err, reg;
+
+	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
+		struct led_init_data init_data = {};
+
+		err = of_property_read_u32(child, "reg", &reg);
+		if (err)
+			return dev_err_probe(dev, err, "Invalid register\n");
+
+		led = &chip->leds[reg];
+		led->is_active = true;
+		led->fwnode = of_fwnode_handle(child);
+
+		led->led_cdev.max_brightness = U8_MAX;
+		led->led_cdev.brightness_set_blocking = st1202_led_set;
+		led->led_cdev.pattern_set = st1202_led_pattern_set;
+		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
+		led->led_cdev.default_trigger = "pattern";
+
+		init_data.fwnode = led->fwnode;
+		init_data.devicename = "st1202";
+		init_data.default_label = ":";
+
+		err = devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+		if (err < 0)
+			return dev_err_probe(dev, err, "Failed to register LED class device\n");
+
+		led->led_cdev.brightness_set = st1202_brightness_set;
+		led->led_cdev.brightness_get = st1202_brightness_get;
+	}
+
+	return 0;
+}
+
+static int st1202_setup(struct st1202_chip *chip)
+{
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	/*
+	 * Once the supply voltage is applied, the LED1202 executes some internal checks,
+	 * afterwords it stops the oscillator and puts the internal LDO in quiescent mode.
+	 * To start the device, EN bit must be set inside the “Device Enable” register at
+	 * address 01h. As soon as EN is set, the LED1202 loads the adjustment parameters
+	 * from the internal non-volatile memory and performs an auto-calibration procedure
+	 * in order to increase the output current precision.
+	 * Such initialization lasts about 6.5 ms.
+	 */
+
+	/* Reset the chip during setup */
+	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, ST1202_DEV_ENABLE_RESET);
+	if (ret < 0)
+		return ret;
+
+	/* Enable phase-shift delay feature */
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret < 0)
+		return ret;
+
+	/* Enable the device */
+	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, ST1202_DEV_ENABLE_ON);
+	if (ret < 0)
+		return ret;
+
+	/* Duration of initialization */
+	usleep_range(6500, 10000);
+
+	/* Deactivate all LEDS (channels) and activate only the ones found in Device Tree */
+	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_LOW, ST1202_CHAN_DISABLE_ALL);
+	if (ret < 0)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_HIGH, ST1202_CHAN_DISABLE_ALL);
+	if (ret < 0)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int st1202_probe(struct i2c_client *client)
+{
+	struct st1202_chip *chip;
+	struct st1202_led *led;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return dev_err_probe(&client->dev, -EIO, "SMBUS Byte Data not Supported\n");
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	devm_mutex_init(&client->dev, &chip->lock);
+	chip->client = client;
+
+	ret = st1202_dt_init(chip);
+	if (ret < 0)
+		return ret;
+
+	ret = st1202_setup(chip);
+	if (ret < 0)
+		return ret;
+
+	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
+		led = &chip->leds[i];
+		led->chip = chip;
+		led->led_num = i;
+
+		if (!led->is_active)
+			continue;
+
+		ret = st1202_channel_set(led->chip, led->led_num, true);
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret,
+					"Failed to activate LED channel\n");
+
+		ret = st1202_led_pattern_clear(&led->led_cdev);
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret,
+					"Failed to clear LED pattern\n");
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id st1202_id[] = {
+	{ "st1202-i2c" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, st1202_id);
+
+static const struct of_device_id st1202_dt_ids[] = {
+	{ .compatible = "st,led1202" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, st1202_dt_ids);
+
+static struct i2c_driver st1202_driver = {
+	.driver = {
+		.name = "leds-st1202",
+		.of_match_table = of_match_ptr(st1202_dt_ids),
+	},
+	.probe = st1202_probe,
+	.id_table = st1202_id,
+};
+module_i2c_driver(st1202_driver);
+
+MODULE_AUTHOR("Remote Tech LTD");
+MODULE_DESCRIPTION("STMicroelectronics LED1202 : 12-channel constant current LED driver");
+MODULE_LICENSE("GPL");
-- 
2.39.3 (Apple Git-145)


