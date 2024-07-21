Return-Path: <linux-leds+bounces-2287-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C5293845C
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2024 12:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D507B20A86
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2024 10:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB022EB02;
	Sun, 21 Jul 2024 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="pit1FRly"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A827453
	for <linux-leds@vger.kernel.org>; Sun, 21 Jul 2024 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721558035; cv=none; b=plEXHaZMJ6mWhFybK5fCE5pny56UOhjOZEUxHg6Opu/JRZKQcyUrtI7bHmQC67hurEVqmWfa4eV6AX5B1z8c5bRj4Mr1BNOffxyzuIjSOD6ZesbXKYQCaKeIWWjcwEhYY1orYpnj2shqpEuanOBThRZG7v/qEK22ksi1KMRgTzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721558035; c=relaxed/simple;
	bh=okWc05g4atX+m/9Sfs4UluuYWpqi23I/QCiQwRfioLk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sj72Yf+7n0Q9Bhe4VRwWdAwVEHqer4TkXByDOkQ0thz5BkcPDv5miI9Cfr+of4386MSK4GK3Wy3B6ucvW9INGFnl6YhHjl2X6v9b7ndf971gl4E28lbXk6/vaMy95mBXfbxjicEsiIecyc6l9iP0v0nehZ+5ynE1331kZtXizcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=pit1FRly; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a728f74c23dso347372466b.1
        for <linux-leds@vger.kernel.org>; Sun, 21 Jul 2024 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1721558031; x=1722162831; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgXEsShEwa7t9/QUQS1Qa2EfyIKyflMXCD7hhC57+Ao=;
        b=pit1FRlysna+ihwQDtp0yd91XvYkri7dzgzBrUzdVr6r5kSm9SKQ6JS44qRmolZOYd
         rmGC8DjXYck2i/qDZM9VQYRZpWZcT4WsIeGidX96iiVKhnbUUs/qcFx4dOapxevJb8pn
         Cmgy23zeJEzCDRUCLpjU2TgKA5V1zsDyZQinks6Aajhn+kPqjQaSl9278RD3p98g/xbV
         sSnbn47o9QOSrX9Lb6irXdZFS3bVHNlyEcJMXHktR1UPKf1urK+xwap8QBNfQm9borF4
         eZyoiLASPzhnvgDxPe/sVbaG1adUnSLv3tIcRaV/qQU/JGhhCbClkis9gTH7VgSPQlt3
         If7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721558031; x=1722162831;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgXEsShEwa7t9/QUQS1Qa2EfyIKyflMXCD7hhC57+Ao=;
        b=N37iTf29oeXazQaQrw0vPavWUWWmyRyLRH+iVITASq2RTxj8TtVpXrOF7E2yX4eOCr
         0/bZBqqoaa1B+20GR4swsXtUxsLD+jaYWxoGUro6Q56Jdrpj/n+khgwRbaV3TR6DNeG8
         1bJqQ6fa4dWtUenw3qEa0zn5gFTNS5RBXh3/zumkz03g+ZzpGVz2jcJw4jcBnOQRqCUt
         QYx3OWv2/M/QEmIokTCsSIXGmFnoPuJp4CXyE6O9c+BZHbK1zQrA4GzmRIEKL+67LoLN
         PMWTFz7OdEJphaXUatRXFW/ppYUVri9PkuPIxpGwycKqlCz9Z5PBn4BgkZm6uuU4tyLZ
         kAag==
X-Forwarded-Encrypted: i=1; AJvYcCXqHP9m6zRUs/4GOxTzIjY89v742Hgk2gXn9eu0XVtK2DJ047ffrc5o98MW7R3ZfX7s7jan/hgJU5imKi8MFJKvd0gw+ISiSt0Lfw==
X-Gm-Message-State: AOJu0YzzEWc0j8icP3fBbn8PTlKKEP1Fe1syHKQTAvDxgqWjyjlm/HvA
	6z0Bxa+RUEjPth3kn96Zp3kyAbLP88WSJL6Z+crLiGV3w4Plqv8BloQX2dv1fSQBNIJQZjEtzti
	qtyn9mQT6NSpD9ae5ywbMmxYjdXl+zaTTrj+vOArmd4Wi3gQcGFX2FeaIRkSFP3ITPjBwi/HauC
	KiWN9aHBf9vP1lBCbTErwlipL5
X-Google-Smtp-Source: AGHT+IETnVHBjm9mow3W3Z8rYxwv9QXIKxpLhpB7od17eJCqMlg3RD/eLO1A5N5cqVq3z70APli96A==
X-Received: by 2002:a17:907:9443:b0:a77:c002:e4ac with SMTP id a640c23a62f3a-a7a4bd0a73emr264484766b.0.1721558030712;
        Sun, 21 Jul 2024 03:33:50 -0700 (PDT)
Received: from admins-MacBook-Air.local ([2a02:2f07:600b:7c00:90e0:e51c:d0e7:eaf8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c7bdc03sm274840666b.54.2024.07.21.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 03:33:50 -0700 (PDT)
Date: Sun, 21 Jul 2024 13:33:40 +0300
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: pavel@ucw.cz, lee@kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 2/2] leds: Add LED1202 I2C driverr
Message-ID: <ZpzkBM_ZwM8hdwgP@admins-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

The LED1202 is a 12-channel low quiescent current LED driver.
The output current can be adjusted separately for each channel by
8-bit analog (current sink input) and 12-bit digital (PWM) dimming control.
The LED1202 implements 12 low-side current generators with independent dimming control.
Internal volatile memory allows the user to store up to 8 different patterns, each
pattern is a particular output configuration in terms of PWM duty-cycle (on 4096 steps).
Analog dimming (on 256 steps) is per channel but common to all patterns.
Each active=1 device tree LED node will have a corresponding entry in /sys/class/leds
with the label name.
The brightness property corresponds to the per channel analog dimming, while the
patterns[1-8] to the PWM dimming control.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
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
 drivers/leds/leds-st1202.c | 899 +++++++++++++++++++++++++++++++++++++
 3 files changed, 910 insertions(+)
 create mode 100644 drivers/leds/leds-st1202.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 8d9d8da376e4..2a601eecf183 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -923,6 +923,16 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_ST1202
+	tristate "LED Support for STMicroelectronics LED1202 I2C chips"
+	depends on LEDS_CLASS
+	depends on I2C
+	depends on OF
+	help
+	    Say Y to enable support for LEDs connected to LED1202
+	    LED driver chips accessed via the I2C bus.
+	    Supported devices include LED1202.
+
 config LEDS_TPS6105X
 	tristate "LED support for TI TPS6105X"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 18afbb5a23ee..e665af45e363 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
 obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
 obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
+obj-$(CONFIG_LEDS_ST1202)		+= leds-st1202.o
 obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
 obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
 obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
new file mode 100644
index 000000000000..2c1b3c918b2c
--- /dev/null
+++ b/drivers/leds/leds-st1202.c
@@ -0,0 +1,899 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LED driver for STMicroelectronics LED1202 chip
+ *
+ * Copyright (C) 2024 Remote-Tech Ltd. UK
+ */
+
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
+#define ST1202_DEVICE_ID		0x00
+#define ST1202_DEV_ENABLE		0x01
+#define ST1202_CHAN_ENABLE_LOW		0x02
+#define ST1202_CHAN_ENABLE_HIGH		0x03
+#define ST1202_CONFIG_REG		0x04
+#define ST1202_ILED_REG0		0x09
+#define ST1202_PATTERN_REP		0x15
+#define ST1202_PATTERN_DUR		0x16
+#define ST1202_PATTERN_PWM		0x1E
+#define ST1202_CLOCK_REG		0xE0
+
+/* PATS: Pattern sequence feature enable */
+#define ST1202_CONFIG_REG_PATS		BIT(7)
+/**
+ * PATSR: Pattern sequence runs (self-clear
+ * when sequence is finished)
+ */
+#define ST1202_CONFIG_REG_PATSR		BIT(6)
+#define ST1202_CHAN_DISABLE_ALL		0x00
+#define ST1202_PATTERN_REP_INF_LOOP	0xFF
+
+#define ST1202_NAME_LENGTH		32
+#define ST1202_CURRENT_AMPS_MAX		20
+#define ST1202_MILLIS_PATTERN_DUR	5660
+#define ST1202_UINT8_MAX		255
+#define ST1202_BUF_SIZE			16
+
+
+#define ST1202_LED_CHANNEL_0		0
+#define ST1202_LED_CHANNEL_1		1
+#define ST1202_LED_CHANNEL_2		2
+#define ST1202_LED_CHANNEL_3		3
+#define ST1202_LED_CHANNEL_4		4
+#define ST1202_LED_CHANNEL_5		5
+#define ST1202_LED_CHANNEL_6		6
+#define ST1202_LED_CHANNEL_7		7
+#define ST1202_LED_CHANNEL_8		8
+#define ST1202_LED_CHANNEL_9		9
+#define ST1202_LED_CHANNEL_10		10
+#define ST1202_LED_CHANNEL_11		11
+#define ST1202_MAX_LEDS			12
+
+#define ST1202_PATTERN_0		0
+#define ST1202_PATTERN_1		1
+#define ST1202_PATTERN_2		2
+#define ST1202_PATTERN_3		3
+#define ST1202_PATTERN_4		4
+#define ST1202_PATTERN_5		5
+#define ST1202_PATTERN_6		6
+#define ST1202_PATTERN_7		7
+#define ST1202_PATTERNS_NR		8
+
+/**
+ * There are 12 leds (channels) and 8 patterns
+ * create this struct as to represent the complete
+ * 12 X 8 matrix
+ */
+struct st1202_led_pattern_map {
+	u8 led_num;
+	u8 pattern;
+};
+
+struct st1202_led {
+	struct led_classdev led_cdev;
+	struct st1202_chip *chip;
+	int led_num;
+	char name[ST1202_NAME_LENGTH];
+	int is_active;
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
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(chip->client, reg);
+
+	if (ret < 0)
+		return ret;
+
+	*val = (uint8_t)ret;
+	return 0;
+}
+
+static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
+{
+	return i2c_smbus_write_byte_data(chip->client, reg, val);
+}
+
+static int st1202_prescalar_to_miliamps(u8 value)
+{
+	/**
+	 * Calculation for channel (led) x: ICS_SET = ILEDx_value/255 * 20 mA
+	 * Range: 1 mA to 20 mA (3.06 mA as default)
+	 */
+	return value * ST1202_CURRENT_AMPS_MAX / ST1202_UINT8_MAX;
+}
+
+static int st1202_prescalar_to_miliseconds(u8 value)
+{
+	/**
+	 * Pattern duration time calulation
+	 * Range: 22.2 ms to 5660 ms (690 ms as default)
+	 */
+	return value * ST1202_MILLIS_PATTERN_DUR / ST1202_UINT8_MAX;
+}
+
+static int st1202_pwm_pattern_read(struct st1202_chip *chip, int led_num,
+					int pattern, u16 *value)
+{
+	u8 value_l, value_h;
+	int ret;
+
+	/**
+	 *  Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
+	 *  where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh) and
+	 *  and y is the pattern number in hexadecimal (y = 00h .. 07h)
+	 */
+	ret = st1202_read_reg(chip, (ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),
+				&value_l);
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Reading pattern PWM register [0x%x] failed, error: %d\n",
+			(ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern), ret);
+		return ret;
+	}
+
+	/**
+	 * Datasheet: Register address high = 1Eh + 01h + 2(xh) +18h*(yh),
+	 * where x is the channel number in hexadecimal (x = 00h .. 0Bh)
+	 * and y is the pattern number in hexadecimal (y = 00h .. 07h)
+	 */
+	ret = st1202_read_reg(chip, (ST1202_PATTERN_PWM + 0x1 + (led_num * 2) + 0x18 * pattern),
+					&value_h);
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Reading pattern PWM register [0x%x] failed, error: %d\n",
+			(ST1202_PATTERN_PWM + 0x1 + (led_num * 2) + 0x18 * pattern), ret);
+		return ret;
+	}
+
+	*value = (u16)value_h << 8 | value_l;
+	return 0;
+}
+
+static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
+					int pattern, unsigned int value)
+{
+	u8 value_l, value_h;
+	int ret;
+
+	value_l = (u8)value;
+	value_h = (u8)(value >> 8);
+
+	/**
+	 *  Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
+	 *  where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh) and
+	 *  and y is the pattern number in hexadecimal (y = 00h .. 07h)
+	 */
+	ret = st1202_write_reg(chip, (ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),
+				value_l);
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Failed writing value %d to register [0x%x], error: %d\n",
+			value_l, ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern, ret);
+		return ret;
+	}
+
+	/**
+	 * Datasheet: Register address high = 1Eh + 01h + 2(xh) +18h*(yh),
+	 * where x is the channel number in hexadecimal (x = 00h .. 0Bh)
+	 * and y is the pattern number in hexadecimal (y = 00h .. 07h)
+	 */
+	ret = st1202_write_reg(chip, (ST1202_PATTERN_PWM + 0x1 + (led_num * 2) + 0x18 * pattern),
+				value_h);
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Failed writing value %d to register [0x%x], error: %d\n",
+			value_h, ST1202_PATTERN_PWM + 0x1 + (led_num * 2) + 0x18 * pattern, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int st1202_duration_pattern_read(struct st1202_chip *chip,
+					int pattern, u8 *value)
+{
+	u8 duration;
+	int ret;
+
+	ret = st1202_read_reg(chip, ST1202_PATTERN_DUR + pattern, &duration);
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Reading pattern durating register [0x%x] failed, error: %d\n",
+			ST1202_PATTERN_DUR + pattern, ret);
+		return ret;
+	}
+
+	*value = duration;
+	return 0;
+}
+
+static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
+						unsigned int value)
+{
+	int ret;
+
+	ret = st1202_write_reg(chip, (ST1202_PATTERN_DUR + pattern), value);
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Writing to register [0x%x] failed, value %u\n",
+			ST1202_PATTERN_DUR + pattern, value);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int st1202_channel_activate(struct st1202_chip *chip, int led_num)
+{
+	u8 chan_low, chan_high;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	/* the active bit of the 12 channels is across 2 8bit registers */
+	if (led_num <= ST1202_LED_CHANNEL_7) {
+		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
+		if (ret < 0) {
+			dev_err(&chip->client->dev, "Failed reading register [0x%x], error: %d\n",
+				ST1202_CHAN_ENABLE_LOW, ret);
+			goto exit;
+		}
+		chan_low = chan_low | BIT(led_num);
+
+		ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_LOW, chan_low);
+		if (ret < 0) {
+			dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
+				ST1202_CHAN_ENABLE_LOW, ret);
+			goto exit;
+		}
+	} else {
+		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_HIGH, &chan_high);
+		if (ret < 0) {
+			dev_err(&chip->client->dev, "Failed reading register [0x%x], error: %d\n",
+				ST1202_CHAN_ENABLE_HIGH, ret);
+			goto exit;
+		}
+		/* the high part register for active has only 4 channels: 8, 9, 10, 11 */
+		chan_high = chan_high | (BIT(led_num) >> 8);
+
+		ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_HIGH, chan_high);
+		if (ret < 0)
+			dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
+				ST1202_CHAN_ENABLE_HIGH, ret);
+	}
+
+exit:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+static ssize_t st1202_duration_pattern_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
+{
+	struct st1202_chip *chip;
+	struct dev_ext_attribute *eattr;
+	struct st1202_led_pattern_map *map;
+
+	u8 duration;
+	int led_num, pattern, ret;
+
+	chip = dev_get_drvdata(dev->parent);
+	eattr = container_of(attr, struct dev_ext_attribute, attr);
+	map = (struct st1202_led_pattern_map *)eattr->var;
+
+	led_num = (int)map->led_num;
+	pattern = (int)map->pattern;
+
+	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {
+		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
+			led_num);
+		goto validity_exit;
+	}
+
+	mutex_lock(&chip->lock);
+	ret = st1202_duration_pattern_read(chip, pattern, &duration);
+	if (ret != 0)
+		goto exit;
+
+exit:
+	mutex_unlock(&chip->lock);
+validity_exit:
+	return sysfs_emit(buf, "Pattern[%d][led(channel)%d]: DURATION = %d ms\n",
+		pattern, led_num, st1202_prescalar_to_miliseconds(duration));
+}
+
+static ssize_t st1202_duration_pattern_store(struct device *dev, struct device_attribute *attr,
+						const char *buf, size_t count)
+{
+	struct st1202_chip *chip;
+	struct dev_ext_attribute *eattr;
+	struct st1202_led_pattern_map *map;
+
+	unsigned long duration;
+	char duration_str[ST1202_BUF_SIZE];
+	int led_num, pattern, ret;
+
+	chip = dev_get_drvdata(dev->parent);
+	eattr = container_of(attr, struct dev_ext_attribute, attr);
+	map = (struct st1202_led_pattern_map *)eattr->var;
+
+	led_num = (int)map->led_num;
+	pattern = (int)map->pattern;
+
+	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {
+		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
+			led_num);
+		return count;
+	}
+
+	if (!count)
+		return -EINVAL;
+
+	ret = sscanf(buf, "%s", duration_str);
+	if (ret == 0) {
+		dev_err(dev, "sscanf failed with error :%d\n", ret);
+		return ret;
+	}
+
+	ret = kstrtoul(duration_str, 10, &duration);
+	if (ret)
+		return ret;
+
+	mutex_lock(&chip->lock);
+
+	ret = st1202_duration_pattern_write(chip, pattern, duration);
+	if (ret != 0)
+		goto exit;
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				(ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR | pattern));
+	if (ret != 0)
+		dev_err(dev, "Failed writing value %ld to register [0x%x], error: %d\n",
+			(ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR | pattern),
+			ST1202_CONFIG_REG, ret);
+
+exit:
+	mutex_unlock(&chip->lock);
+	return count;
+}
+
+static ssize_t st1202_patt_seq_rep_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
+{
+	struct st1202_chip *chip;
+	unsigned int ret;
+	u8 value;
+
+	chip = dev_get_drvdata(dev);
+
+	mutex_lock(&chip->lock);
+
+	ret = st1202_read_reg(chip, ST1202_PATTERN_REP, &value);
+	if (ret != 0)
+		dev_err(dev, "Reading register [0x%x] failed, error: %d\n",
+			ST1202_PATTERN_REP, ret);
+
+	mutex_unlock(&chip->lock);
+	return sysfs_emit(buf, "Pattern sequence register, repetition value = %d (times)\n",
+			 value);
+}
+
+static ssize_t st1202_patt_seq_rep_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct st1202_chip *chip;
+	unsigned int ret;
+	unsigned long duration;
+
+	chip = dev_get_drvdata(dev);
+
+	if (!count)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 10, &duration);
+	if (ret)
+		return ret;
+
+	mutex_lock(&chip->lock);
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, duration);
+	if (ret != 0)
+		dev_err(dev, "Writing register [0x%x] failed, error: %d\n",
+			ST1202_PATTERN_REP, ret);
+
+	mutex_unlock(&chip->lock);
+	return count;
+}
+
+static ssize_t st1202_channel_mA_current_show(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	struct st1202_chip *chip;
+	struct dev_ext_attribute *eattr;
+	u8 value;
+	int led_num, ret;
+
+	chip = dev_get_drvdata(dev->parent);
+	eattr = container_of(attr, struct dev_ext_attribute, attr);
+	led_num = (int)eattr->var;
+
+	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {
+		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
+				led_num);
+		return -EINVAL;
+	}
+
+	mutex_lock(&chip->lock);
+
+	ret = st1202_read_reg(chip, ST1202_ILED_REG0 + led_num, &value);
+	if (ret != 0)
+		dev_err(dev, "Reading analog dimming register [0x%x] failed, error: %d\n",
+			led_num, ret);
+
+	mutex_unlock(&chip->lock);
+	return sysfs_emit(buf, "Channel[%d] = %d mA\n", led_num,
+			 st1202_prescalar_to_miliamps(value));
+}
+
+static ssize_t st1202_pwm_pattern_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
+{
+	struct st1202_chip *chip;
+	struct dev_ext_attribute *eattr;
+	struct st1202_led_pattern_map *map;
+
+	u16 value;
+	int led_num, pattern, ret;
+
+	chip = dev_get_drvdata(dev->parent);
+	eattr = container_of(attr, struct dev_ext_attribute, attr);
+	map = (struct st1202_led_pattern_map *)eattr->var;
+
+	led_num = (int)map->led_num;
+	pattern = (int)map->pattern;
+
+	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {
+		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
+			led_num);
+		goto validity_exit;
+	}
+
+	mutex_lock(&chip->lock);
+
+	ret = st1202_pwm_pattern_read(chip, led_num, pattern, &value);
+	if (ret != 0)
+		goto exit;
+
+exit:
+	mutex_unlock(&chip->lock);
+validity_exit:
+	return sysfs_emit(buf, "Pattern[%d][led(channel) %d]: PWM = 0x%03X\n",
+		pattern, led_num, value);
+}
+
+static ssize_t st1202_pwm_pattern_store(struct device *dev, struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct st1202_chip *chip;
+	struct dev_ext_attribute *eattr;
+	struct st1202_led_pattern_map *map;
+	unsigned int pwm_value;
+	int led_num, pattern, ret;
+
+	chip = dev_get_drvdata(dev->parent);
+	eattr = container_of(attr, struct dev_ext_attribute, attr);
+	map = (struct st1202_led_pattern_map *)eattr->var;
+
+	led_num = (int)map->led_num;
+	pattern = (int)map->pattern;
+
+	if (led_num < 0 || led_num >= ST1202_MAX_LEDS) {
+		dev_err(dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
+			led_num);
+		return count;
+	}
+
+	if (!count)
+		return -EINVAL;
+
+	ret = sscanf(buf, "%X", &pwm_value);
+	if (ret == 0) {
+		dev_err(dev, "sscanf failed with error :%d\n", ret);
+		return ret;
+	}
+
+	mutex_lock(&chip->lock);
+
+	ret = st1202_pwm_pattern_write(chip, led_num, pattern, pwm_value);
+	if (ret != 0)
+		goto exit;
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				(ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR | pattern));
+	if (ret != 0)
+		dev_err(dev, "Failed writing value %ld to register [0x%x], error: %d\n",
+			(ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR | pattern),
+			ST1202_CONFIG_REG, ret);
+
+exit:
+	mutex_unlock(&chip->lock);
+	return count;
+}
+
+static struct device_attribute dev_attr_st1202_patt_seq_rep = __ATTR(pattern_seq_rep,
+								0644,
+								st1202_patt_seq_rep_show,
+								st1202_patt_seq_rep_store);
+
+#define ST1202_EXT_ATTR(patt, lednum)	\
+(&((struct st1202_led_pattern_map[]){	\
+	{.led_num = lednum,		\
+	.pattern = patt}		\
+})[0])
+
+#define ST1202_PATT_EXT_ATTR(pattern, led_num)							\
+static struct dev_ext_attribute dev_ext_attr_patt_pwm_##pattern##led_num = {			\
+	.attr =  __ATTR(pwm_pattern##pattern, 0644,						\
+			st1202_pwm_pattern##_show, st1202_pwm_pattern##_store),			\
+	.var = (void *) ST1202_EXT_ATTR(pattern, led_num),					\
+};												\
+static struct dev_ext_attribute dev_ext_attr_patt_duration_##pattern##led_num = {		\
+	.attr =  __ATTR(duration_pattern##pattern, 0644,					\
+			st1202_duration_pattern##_show, st1202_duration_pattern##_store),	\
+	.var = (void *) ST1202_EXT_ATTR(pattern, led_num),					\
+};
+
+#define ST1202_LED_CURRENT_EXTATTR(led_num)							\
+static struct dev_ext_attribute dev_attr_current_mA##led_num =  {				\
+	.attr = __ATTR(current_mA, 0444, st1202_channel_mA_current_show, NULL),		\
+	.var = (void *)led_num, };
+
+#define ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(led_num)		\
+ST1202_PATT_EXT_ATTR(0, led_num)				\
+ST1202_PATT_EXT_ATTR(1, led_num)				\
+ST1202_PATT_EXT_ATTR(2, led_num)				\
+ST1202_PATT_EXT_ATTR(3, led_num)				\
+ST1202_PATT_EXT_ATTR(4, led_num)				\
+ST1202_PATT_EXT_ATTR(5, led_num)				\
+ST1202_PATT_EXT_ATTR(6, led_num)				\
+ST1202_PATT_EXT_ATTR(7, led_num)				\
+ST1202_LED_CURRENT_EXTATTR(led_num)
+
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_0)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_1)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_2)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_3)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_4)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_5)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_6)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_7)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_8)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_9)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_10)
+ST1202_MAP_ALL_PATTERNS_TO_LEDNUM(ST1202_LED_CHANNEL_11)
+
+#define ST1202_EXT_ATTR_LED_PWM(patt, lednum)			\
+&dev_ext_attr_patt_pwm_##patt##lednum.attr.attr,		\
+&dev_ext_attr_patt_duration_##patt##lednum.attr.attr
+
+#define ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(lednum)			\
+static struct attribute *led_attrs##lednum[] = {				\
+	ST1202_EXT_ATTR_LED_PWM(0, lednum),					\
+	ST1202_EXT_ATTR_LED_PWM(1, lednum),					\
+	ST1202_EXT_ATTR_LED_PWM(2, lednum),					\
+	ST1202_EXT_ATTR_LED_PWM(3, lednum),					\
+	ST1202_EXT_ATTR_LED_PWM(4, lednum),					\
+	ST1202_EXT_ATTR_LED_PWM(5, lednum),					\
+	ST1202_EXT_ATTR_LED_PWM(6, lednum),					\
+	ST1202_EXT_ATTR_LED_PWM(7, lednum),					\
+	&dev_attr_current_mA##lednum.attr.attr,					\
+	NULL									\
+};										\
+static struct attribute_group led_attr_group##lednum = {			\
+	.attrs = led_attrs##lednum,						\
+};										\
+static const struct attribute_group *st1202_led_groups##lednum[] = {		\
+	&led_attr_group##lednum,						\
+	NULL									\
+};
+
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(0)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(1)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(2)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(3)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(4)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(5)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(6)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(7)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(8)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(9)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(10)
+ST1202_MAP_EXT_ATTR_TO_ALL_PATTERNS_ARRAY(11)
+
+static const struct attribute_group **st1202_led_groups[] = {
+	st1202_led_groups0,
+	st1202_led_groups1,
+	st1202_led_groups2,
+	st1202_led_groups3,
+	st1202_led_groups4,
+	st1202_led_groups5,
+	st1202_led_groups6,
+	st1202_led_groups7,
+	st1202_led_groups8,
+	st1202_led_groups9,
+	st1202_led_groups10,
+	st1202_led_groups11
+};
+
+static struct attribute *device_attrs[] = {
+	&dev_attr_st1202_patt_seq_rep.attr,
+	NULL
+};
+
+static struct attribute_group device_attr_group = {
+	.attrs = device_attrs,
+};
+
+static const struct attribute_group *st1202_device_groups[] = {
+	&device_attr_group,
+	NULL
+};
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+					enum led_brightness value)
+{
+	struct st1202_led *led;
+	struct st1202_chip *chip;
+	int ret;
+
+	led = cdev_to_st1202_led(led_cdev);
+	chip = led->chip;
+
+	mutex_lock(&chip->lock);
+
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	if (ret != 0)
+		dev_err(&chip->client->dev, "Reading register [0x%x] failed, error: %d\n",
+			ST1202_ILED_REG0 + led->led_num, ret);
+
+	mutex_unlock(&chip->lock);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led;
+	struct st1202_chip *chip;
+	u8 value;
+	int ret;
+
+	led = cdev_to_st1202_led(led_cdev);
+	chip = led->chip;
+
+	mutex_lock(&chip->lock);
+
+	ret = st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num,
+			      &value);
+	if (ret != 0)
+		dev_err(&chip->client->dev, "Reading register [0x%x] failed, error: %d\n",
+			ST1202_ILED_REG0 + led->led_num, ret);
+
+	mutex_unlock(&chip->lock);
+	return value;
+}
+
+static int st1202_dt_init(struct st1202_chip *chip)
+{
+	struct device_node *np, *child;
+	struct st1202_led *led;
+	int err, reg;
+
+	np = dev_of_node(&chip->client->dev);
+
+	for_each_child_of_node(np, child) {
+		err = of_property_read_u32(child, "reg", &reg);
+		if (err) {
+			of_node_put(child);
+			dev_err(&chip->client->dev, "Failed to get child node, error: %d\n", err);
+			return err;
+		}
+		if (reg < 0 || reg >= ST1202_MAX_LEDS) {
+			of_node_put(child);
+			dev_err(&chip->client->dev, "Invalid led number: %d (out of range). Possible values 0..11\n",
+				reg);
+			return -EINVAL;
+		}
+
+		led = &chip->leds[reg];
+		led->led_cdev.name = of_get_property(child, "label", NULL) ?:
+							child->name;
+
+		err = of_property_read_u32(child, "active", &led->is_active);
+		if (err) {
+			of_node_put(child);
+			dev_err(&chip->client->dev, "Failed to get child node, error: %d\n", err);
+			return err;
+		}
+		led->led_cdev.brightness_set = st1202_brightness_set;
+		led->led_cdev.brightness_get = st1202_brightness_get;
+	}
+	return 0;
+}
+
+static int st1202_setup(struct st1202_chip *chip)
+{
+	int ret;
+
+	mutex_lock(&chip->lock);
+
+	/**
+	 * Once the supply voltage is applied, the LED1202 executes some
+	 * internal checks, afterwords it stops the oscillator and puts
+	 * the internal LDO in quiescent mode.
+	 * To start the device, EN bit must be set inside the "Device Enable" register
+	 * at address 01h.
+	 * As soon as EN is set, the LED1202 loads the adjustment parameters from the internal
+	 * non-volatile memory and performs an auto-calibration procedure in order to increase
+	 * the output current precision.
+	 * Such initialization lasts about 6.5 ms.
+	 */
+
+	/* reset the chip during setup */
+	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, BIT(7));
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
+			ST1202_DEV_ENABLE, ret);
+	goto exit;
+	}
+
+	/* enable the device */
+	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, BIT(0));
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
+			ST1202_DEV_ENABLE, ret);
+		goto exit;
+	}
+
+	mutex_unlock(&chip->lock);
+
+	/* duration of initialization */
+	usleep_range(6500, 10000);
+
+	mutex_lock(&chip->lock);
+	/* set Pattern sequence repetition register to inifite loop */
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, ST1202_PATTERN_REP_INF_LOOP);
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
+			ST1202_PATTERN_REP, ret);
+		goto exit;
+	}
+	/* deactivate all leds (channels) and activate only the device tree active ones */
+	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_LOW, ST1202_CHAN_DISABLE_ALL);
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
+			ST1202_CHAN_ENABLE_LOW, ret);
+		goto exit;
+	}
+	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_HIGH, ST1202_CHAN_DISABLE_ALL);
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Failed writing to register [0x%x], error: %d\n",
+			ST1202_CHAN_ENABLE_HIGH, ret);
+		goto exit;
+	}
+
+exit:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+static int st1202_probe(struct i2c_client *client)
+{
+	struct st1202_chip *chip;
+	struct st1202_led *led;
+	int ret;
+	int i;
+
+	dev_info(&client->dev, "ST1202 I2C driver");
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
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
+	devm_mutex_init(&client->dev, &chip->lock);
+	chip->client = client;
+
+	/* Device tree setup */
+	ret = st1202_dt_init(chip);
+	if (ret < 0)
+		goto exit;
+
+	/* Configuration setup */
+	ret = st1202_setup(chip);
+	if (ret < 0)
+		goto exit;
+
+	for (i = 0; i < ST1202_MAX_LEDS; i++) {
+		led = &chip->leds[i];
+		led->chip = chip;
+		led->led_num = i;
+		if (led->is_active) {
+			ret = st1202_channel_activate(led->chip, led->led_num);
+			if (ret < 0) {
+				dev_err(&client->dev, "Failed to register LED class dev, error: %d\n",
+					ret);
+				goto exit;
+			}
+
+			led->led_cdev.groups = st1202_led_groups[i];
+
+			ret = devm_led_classdev_register(&client->dev,
+						    &led->led_cdev);
+			if (ret < 0) {
+				dev_err(&client->dev, "Failed to register LED class dev, error: %d\n",
+					ret);
+				goto exit;
+			}
+		}
+	}
+
+	client->dev.driver->dev_groups = st1202_device_groups;
+	return 0;
+
+exit:
+	for (i = 0; i < ST1202_MAX_LEDS; i++)
+		devm_led_classdev_unregister(&client->dev,  &chip->leds[i].led_cdev);
+	mutex_destroy(&chip->lock);
+	devm_kfree(&client->dev, chip);
+	return ret;
+}
+
+static const struct i2c_device_id st1202_id[] = {
+	{ "st1202-i2c", 0 },
+	{ /* sentinel */ },
+};
+
+MODULE_DEVICE_TABLE(i2c, st1202_id);
+
+static const struct of_device_id st1202_dt_ids[] = {
+	{ .compatible = "st,led1202", },
+	{ /* sentinel */ },
+};
+
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
+
+module_i2c_driver(st1202_driver);
+
+MODULE_AUTHOR("Remote Tech LTD");
+MODULE_DESCRIPTION("STMicroelectronics LED1202 : 12-channel constant current LED driver");
+MODULE_LICENSE("GPL");
-- 
2.39.3 (Apple Git-145)


