Return-Path: <linux-leds+bounces-3425-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA269D5124
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 18:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 281CBB25851
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 16:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9321A38D7;
	Thu, 21 Nov 2024 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="XFQGpFxz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960111C8FC6
	for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208330; cv=none; b=Tsf2DTsh1Qmk0ljJjZWi92B3U4CMpEzL5hDZupG87/MQhRPdX31SnHavVwq8W2ABm8L7L7uJ34F3+vbGXE+QV0GVoA9usU80JAudsJLNb6A2biXyhA2YUtaTFRv2/ffvkOFnr20LeV1M0B5RwHXykzikZmuBRcRcfGA5NY8wWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208330; c=relaxed/simple;
	bh=/NNrvb+PD9zGRD0wBIHPqWITm1PpZYsfThMBECA1goA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mw0cAwnStoUtQZvIh50+ZXTgm3SNTFTBBFkKTwZhKmmBlC8G/8qUnroKwPSF117dDX0/Ht7K3RgnqQSh46zpPUPOFbmTmr1HgPQZVsxFDJ++rmIcBstptBhMS6v9KnoVAtNU3aXsSHUf+VF6lSZ7tJ3eieoWa0Lf/OMEkmycs0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=XFQGpFxz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa4d257eb68so220561666b.0
        for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 08:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732208327; x=1732813127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydoLVXEDXvJRCedYc8280jsDjevAcd+mQM5b8Syno1A=;
        b=XFQGpFxzgMd5Pw8mySLDak3mMby1hL3+44B3RyGL2X+ang57TJea5kw1n7/zb4X7Cs
         ZpSm/vNK41TRWNDB/mRLpLcpdGmLRUVRrgWxLv/WMOZ8yihQjVTMTURKs16WlyT9XMN6
         PT1hp5HFQU93Y+6b9K+gK/aFd34cmplYzmEF+irghby3kDGPXVyCq3382yKf4gSkb/er
         8YTtnDQ/pcR8TqaHRCrxwTqh2tn4w4lZRjsjPO3pWjecdI2YCB6wY9izN+n0HKHikIv/
         /OcHX4dZXCOvks5YUcgG5EkTz+/h3HXyTXKRPGPBeCtOniXjDVJiVWOUDfomP/iGFt73
         prng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732208327; x=1732813127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydoLVXEDXvJRCedYc8280jsDjevAcd+mQM5b8Syno1A=;
        b=VmIdjaDp52pGbQ9xwRoFz94NWJSAmE7cTdC4Z1misU3wm4d/g0L0Hnu6hWc9qN62yw
         otmpVQUx5T+e2etwz7r3TKkiIfzJlovCphed4N8R7ZX1G0YavTCdCNbYMr7+BKhq6z6r
         +mWXEga2FoGfQM2vC36xuooh2ImNVGeeGTZEYwHTubhDMIkFqnwCKmo6AaRm8KXgJb9a
         fTrxq7FAbysT/Zyvuw1wwFNb4xcLp41TppbphaYbNnGRM0H9IHzzeALvJV/ZonLu4vFj
         9t+1TKqwkbkazRoJAMVR+LPFFlAiSiH05JgGIJaD0GqmvnBkzwkx5a8C43vNbqsZ0+/C
         nN7w==
X-Forwarded-Encrypted: i=1; AJvYcCWvzqi+8H20lM8zP+2I9WudBZtgQaK1H6sB5Wj+rfBFfB5SSc6o7TGQ6FXGCMvU4kx88cLGKAJa8796@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vpAZ/9UINoP6yeebd0JlEGL5nLZwMpalC1W4LeCbikUq/GQG
	sIShtHAWcUHJjHLm+y7tU5fcBRY8e9IMBqXaT8ic2zM95XRlaH8SdyzurSuwvMU4iwbzY4NbvBg
	J6P6bjWaBu5sfjNWjYaV9ZBKRlcvKvxZQhNPDDqd/H9eA5Fnr4fn1WTcebxQtWRpvdv/vqSA8Gb
	bV6ZP2Y1z+g8Kp7cU0CiJ61tMP
X-Gm-Gg: ASbGnctmEi72a9QnXC1qD7vlzQwKA5uibvoMQJnoy9jGJLxHlGkYYtdQeJAlpyAtZLk
	8jCzU/hgWDty8RslVb58qMvlTzf9taVLg/d0yolvJclZTIpbBSFHO9Pu9V7MV4C+padMTNmR2CV
	h1sW9Q5RkxzRfwO+fmRwrPJA4aq/ci0tlN8vGgg0wSIcKzgujok6NYXNR1O3aMLSU5L06wDHXOx
	0rR/FkgQGfD7n2YZBzX8bikMvicp4VCw1X4P3+PiWE3BdIQ4rx3GLQsJZaKV2MOrKwbPNyCoWRq
	5ZxiOhgvDC/BUoQ357zz
X-Google-Smtp-Source: AGHT+IHcKk45K85Mx3wQwkzo0V3zDJZGTTZch2rgrzwaMeUMDu6YrvkIzEDN5xpPbT/dytiom4/ZeQ==
X-Received: by 2002:a17:906:4fd4:b0:a9e:65a1:fdac with SMTP id a640c23a62f3a-aa4ef96ba56mr392540666b.7.1732208326772;
        Thu, 21 Nov 2024 08:58:46 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f41536d3sm101502766b.24.2024.11.21.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:46 -0800 (PST)
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
Subject: [PATCH v9] leds: Add LED1202 I2C driver
Date: Thu, 21 Nov 2024 16:58:25 +0000
Message-Id: <20241121165829.8210-4-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
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
 drivers/leds/Kconfig       |  11 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-st1202.c | 431 +++++++++++++++++++++++++++++++++++++
 3 files changed, 443 insertions(+)
 create mode 100644 drivers/leds/leds-st1202.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b784bb74a837..c4fdacc00066 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -931,6 +931,17 @@ config LEDS_LM36274
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
+	  Supported devices include LED1202.
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
index 000000000000..963e2b11758f
--- /dev/null
+++ b/drivers/leds/leds-st1202.c
@@ -0,0 +1,431 @@
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
+	struct device *dev;
+	int ret;
+
+	dev = &chip->client->dev;
+
+	ret = i2c_smbus_read_byte_data(chip->client, reg);
+	if (ret < 0) {
+		dev_err(&chip->client->dev, "Reading register [0x%x] failed, error: %d\n",
+				reg, ret);
+		return ret;
+	}
+
+	*val = (uint8_t)ret;
+	return 0;
+}
+
+static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
+{
+	struct device *dev;
+	int ret;
+
+	dev = &chip->client->dev;
+
+	ret = i2c_smbus_write_byte_data(chip->client, reg, val);
+	if (ret != 0)
+		dev_err(dev, "Failed writing value %d to register [0x%x], error: %d\n",
+				val, reg, ret);
+
+	return ret;
+}
+
+static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
+{
+	return value/ST1202_MILLIS_PATTERN_DUR_MIN - 1;
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
+	struct st1202_led *led;
+	struct st1202_chip *chip;
+
+	led = cdev_to_st1202_led(led_cdev);
+	chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led;
+	struct st1202_chip *chip;
+	u8 value = 0;
+
+	led = cdev_to_st1202_led(led_cdev);
+	chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
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
+	struct st1202_led *led;
+	struct st1202_chip *chip;
+
+	led = cdev_to_st1202_led(ldev);
+	chip = led->chip;
+
+	return st1202_channel_set(chip, led->led_num, value == LED_OFF ? false : true);
+}
+
+static int st1202_led_pattern_clear(struct led_classdev *ldev)
+{
+	struct st1202_led *led;
+	struct st1202_chip *chip;
+	int ret;
+
+	led = cdev_to_st1202_led(ldev);
+	chip = led->chip;
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
+	struct st1202_led *led;
+	struct st1202_chip *chip;
+	int ret;
+
+	led = cdev_to_st1202_led(ldev);
+	chip = led->chip;
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
+				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
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
+		if (led->is_active) {
+			ret = st1202_channel_set(led->chip, led->led_num, true);
+			if (ret < 0)
+				return dev_err_probe(&client->dev, ret,
+						"Failed to activate LED channel\n");
+
+			ret = st1202_led_pattern_clear(&led->led_cdev);
+			if (ret < 0)
+				return dev_err_probe(&client->dev, ret,
+						"Failed to clear LED pattern\n");
+		}
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


