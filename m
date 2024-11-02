Return-Path: <linux-leds+bounces-3238-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9489B9F3D
	for <lists+linux-leds@lfdr.de>; Sat,  2 Nov 2024 12:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B51FDB21252
	for <lists+linux-leds@lfdr.de>; Sat,  2 Nov 2024 11:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EB316EBEE;
	Sat,  2 Nov 2024 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="TjjFsGSg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC736A930
	for <linux-leds@vger.kernel.org>; Sat,  2 Nov 2024 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730546196; cv=none; b=ArwFWLM9Rfms1JRI9ql/11Zb6M+wEoQw/3kqxLhnfcnTVUV0AQ0NKxeXgNnLo+LoDBNrZTZzOzAoN571TlFvr8FIMOTJPUtd/XzDduiA8fgEK4kfzfcTUFe2z/xnP5MOncR9uFoajkky34e/Tb2T7Ju22T34i9eXAkXeLC9rI10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730546196; c=relaxed/simple;
	bh=WPNbLoP+OkzSHRPcG8xSzfnOIhX0oRArSCTOucZ7dXY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdW9hYe6jnOGvYWQiPnIBGldvyzoeVVSXYOqd11WDJhF7YRQX/C6xOalxPeC53glTRBZOY5o7SgEEfApCSCmZlA44CcMExIwJv6hPOLuifa4jxGEI2xgUMccaLNc3wjTM0M/qu7WY+IyDm3v4FNjpkc5gI5eo/Nv/lXtE7nlXmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=TjjFsGSg; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso326719366b.3
        for <linux-leds@vger.kernel.org>; Sat, 02 Nov 2024 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730546191; x=1731150991; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OadmGS+bfb6QoFtWtnGt2t9EfdZuOmWmRSDdqS3rKFA=;
        b=TjjFsGSgcGHRbVnx47evwci4jIBolzyjRGvZTMXgpohIqXPbhnYQpEA8EnvZw6YdTM
         WNzYDgPtO5BTSlL/NLQnkgzPvo4+HxPnTa3v3HZJkOAYqgv55hoycErsh/2zqZGRkOmP
         I/LmUv4jNG1cg6j0P3LA4ZgyY0CN6sqySmQIkr50Vi5g5ZITJ93LA8MHX3Lnl9E3wssu
         4wbeoa0/lOasCPimg8lAJe149+dGoAC+rKUaPiBDvlsVm9cIMrIuhWDTyv4SN6X2qw0x
         iT7cxFrn5Lnqfw47K2KJpnQ5/zawqFNNt54dUxFtQfUoQZyH3Rp7VpG3xiA/CF2wYcPB
         db1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730546191; x=1731150991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OadmGS+bfb6QoFtWtnGt2t9EfdZuOmWmRSDdqS3rKFA=;
        b=WR+22JjLpGa1d1JGVL4vZ9bQqJyu5gX6JIIxecYNve4BfQe+6PpfV0ormHU0Oh0R3r
         PS6nFG7XA4yHUzyxLOoEijwl/fPAcjNgcwA0f07rr/qZUkqz0wfp6HLizCfKbVHNpl3v
         c2BPadJHdUOwGDfLsr4GS32PZUgML9hf9QMXUtgqq1mQ7IlD4PjOMjjNLCAJYD7aQR6f
         c9ybVAK/OYVo5MX040p/zaHWyZ1JPMUI8HDJnZty9tsuzddaeqdwu5Nf12+L7cMcJL7P
         4ufYp04AeK7B+z9S6yiUF9vBOPinFo8xKB6XPk2uw94xRv3PsWl1EbxitC1O8Fx4NpRK
         wgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3aSVNLlbI/q5LDVZkvxrySNBMx9snW52EhPLCnd1oUMNt7FD5RFw1FY7TurERMCNeYj5uQBY9u1bE@vger.kernel.org
X-Gm-Message-State: AOJu0YwIc2oLq9N0h7QSqyVFvW9BvAdCHyAq7aN7rEBtTsXHO5cBwmxA
	xuVqhyf0eowtLrBjJ1vtRLWf/sqkz3gQqQT/YKerPV8iGRBbXLbNUsYmHAs/UozsJDas8SINPQN
	MgOYHFwhNStNIUco5r1FXxoYbQnyPAecMvZwnUCKDAFG7kepa0+XaidKk80RPUz5h2/u3fj74y0
	a24sNclexDdJ5vcbFKLqOzpfbgo4y6mpq7R0gKhA==
X-Google-Smtp-Source: AGHT+IGPN2Y8UQVxCwjd5l/tCxcmZBsnIOdgCZSGak3X19aDBeaXIBUwU/D8ciAVgSN9KD9jVheWLQ==
X-Received: by 2002:a17:906:6a1d:b0:a99:f91e:4abb with SMTP id a640c23a62f3a-a9e509390fbmr931910766b.27.1730546190890;
        Sat, 02 Nov 2024 04:16:30 -0700 (PDT)
Received: from admins-Air ([2a02:810d:aec0:2a54:1503:b482:265e:108c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c56acsm299487066b.77.2024.11.02.04.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:16:29 -0700 (PDT)
Date: Sat, 2 Nov 2024 12:16:24 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: pavel@ucw.cz, lee@kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 2/3] leds: Add LED1202 I2C driver
Message-ID: <ZyYKCMbviprVnoDK@admins-Air>
References: <Zx0A8ywBb9J65Rxl@admins-Air>
 <20241101170658.GA1807686@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101170658.GA1807686@google.com>


> 
> Alphabetical.
Done 
> > +#define ST1202_BUF_SIZE                    16
> 
> This appears to be unused.
Done
> Please make sure all of these defines are used or removed.
> 
> 
> I'm usually all for defines, but this one is a bit over the top.
Removed
> 
> 
> Why have you broken the line here and not 2 lines down?
Checkpatch was complaining
 
> 
> Do this during declaration.
Moved it inside for_each_available_child_of_node_scoped 

> Lee Jones [李琼斯]
Thank you for the review. I think corrected everything.

[PATCH v5 2/3] leds: Add LED1202 I2C driver

The output current can be adjusted separately for each channel by 8-bit
analog (current sink input) and 12-bit digital (PWM) dimming control. The
LED1202 implements 12 low-side current generators with independent dimming
control. Internal volatile memory allows the user to store up to 8 different
patterns, each pattern is a particular output configuration in terms of PWM
duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
common to all patterns. Each device tree LED node will have a corresponding
entry in /sys/class/leds with the label name. The brightness property
corresponds to the per channel analog dimming, while the patterns[1-8] to the
PWM dimming control.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
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

---
 drivers/leds/Kconfig       |  11 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-st1202.c | 508 +++++++++++++++++++++++++++++++++++++
 3 files changed, 520 insertions(+)
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
index 000000000000..2a9055c670c1
--- /dev/null
+++ b/drivers/leds/leds-st1202.c
@@ -0,0 +1,508 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LED driver for STMicroelectronics LED1202 chip
+ *
+ * Copyright (C) 2024 Remote-Tech Ltd. UK
+ */
+
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
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(chip->client, reg);
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
+static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
+{
+	return value/ST1202_MILLIS_PATTERN_DUR_MIN - 1;
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
+	/*
+	 *  Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
+	 *  where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh)
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
+	/*
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
+static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
+					unsigned int value)
+{
+	int ret;
+
+	ret = st1202_write_reg(chip, (ST1202_PATTERN_DUR + pattern), st1202_prescalar_to_miliseconds(value));
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Writing to register [0x%x] failed, value %u\n",
+			ST1202_PATTERN_DUR + pattern, value);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
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
+				&value);
+	if (ret != 0)
+		dev_err(&chip->client->dev, "Reading register [0x%x] failed, error: %d\n",
+			ST1202_ILED_REG0 + led->led_num, ret);
+
+	mutex_unlock(&chip->lock);
+
+	return value;
+}
+
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	u8 chan_low, chan_high;
+	int ret;
+
+	mutex_lock(&chip->lock);
+
+	if (led_num <= 7) {
+		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
+		if (ret < 0) {
+			dev_err(&chip->client->dev, "Failed reading register [0x%x], error: %d\n",
+				ST1202_CHAN_ENABLE_LOW, ret);
+			goto exit;
+		}
+
+		chan_low = active ? chan_low | BIT(led_num) : chan_low & ~BIT(led_num);
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
+
+		chan_high = active ? chan_high | (BIT(led_num) >> 8) :
+					chan_high & ~(BIT(led_num) >> 8);
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
+static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
+{
+	struct st1202_led *led;
+	struct st1202_chip *chip;
+	int ret;
+
+	led = cdev_to_st1202_led(ldev);
+	chip = led->chip;
+
+	ret = st1202_channel_set(chip, led->led_num, value == LED_OFF ? false : true);
+
+	return ret;
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
+	mutex_lock(&chip->lock);
+
+	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
+		if (ret != 0)
+			goto exit;
+
+		ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
+		if (ret != 0)
+			goto exit;
+	}
+
+exit:
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static int st1202_led_pattern_set(struct led_classdev *ldev,
+				  struct led_pattern *pattern,
+				  u32 len, int repeat)
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
+	mutex_lock(&chip->lock);
+
+	for (int patt = 0; patt < len; patt++) {
+		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
+			pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX) {
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
+		if (ret != 0)
+			goto exit;
+
+		ret = st1202_duration_pattern_write(chip, patt, pattern[patt].delta_t);
+		if (ret != 0)
+			goto exit;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, repeat);
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Writing register [0x%x] failed, error: %d\n",
+			ST1202_PATTERN_REP, ret);
+		goto exit;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				(ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
+				ST1202_CONFIG_REG_SHFT));
+	if (ret != 0) {
+		dev_err(&chip->client->dev, "Failed writing value %ld to register [0x%x], error: %d\n",
+			(ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT),
+			ST1202_CONFIG_REG, ret);
+		goto exit;
+	}
+
+exit:
+	mutex_unlock(&chip->lock);
+
+	return ret;
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
+		err = of_property_read_u32(child, "reg", &reg);
+		if (err) {
+			of_node_put(child);
+			return dev_err_probe(dev, err, "Invalid register, error: %d\n", err);
+		}
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
+		err = devm_led_classdev_register_ext(dev,
+					&led->led_cdev, &init_data);
+		if (err < 0) {
+			dev_err_probe(dev, err, "Failed to register LED class dev, error: %d\n", err);
+			return err;
+		}
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
+	mutex_lock(&chip->lock);
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
+	if (ret < 0) {
+		dev_err_probe(&chip->client->dev, -EIO,
+				"Failed to write to register [0x%x], error: %d\n",
+				ST1202_DEV_ENABLE, ret);
+		goto exit;
+	}
+
+	/* Enable phase-shift delay feature */
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret < 0) {
+		dev_err_probe(&chip->client->dev, -EIO,
+				"Failed to write to register [0x%x], error: %d\n",
+				ST1202_CONFIG_REG, ret);
+		goto exit;
+	}
+
+	/* Enable the device */
+	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, ST1202_DEV_ENABLE_ON);
+	if (ret < 0) {
+		dev_err_probe(&chip->client->dev, -EIO,
+				"Failed to write to register [0x%x], error: %d\n",
+				ST1202_DEV_ENABLE, ret);
+		goto exit;
+	}
+
+	/* Duration of initialization */
+	usleep_range(6500, 10000);
+
+	/* Deactivate all LEDS (channels) and activate only the ones found in Device Tree */
+	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_LOW, ST1202_CHAN_DISABLE_ALL);
+	if (ret < 0) {
+		dev_err_probe(&chip->client->dev, -EIO,
+				"Failed writing to register [0x%x], error: %d\n",
+				ST1202_CHAN_ENABLE_LOW, ret);
+		goto exit;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_HIGH, ST1202_CHAN_DISABLE_ALL);
+	if (ret < 0) {
+		dev_err_probe(&chip->client->dev, -EIO,
+				"Failed writing to register [0x%x], error: %d\n",
+				ST1202_CHAN_ENABLE_HIGH, ret);
+		goto exit;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
+	if (ret < 0) {
+		dev_err_probe(&chip->client->dev, -EIO,
+				"Failed writing to register [0x%lx], error: %d\n",
+				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR, ret);
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
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
+		return dev_err_probe(&client->dev, -EIO, "SMBUS Byte Data not Supported\n");
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
+			if (ret < 0) {
+				return dev_err_probe(&client->dev, -EIO,
+					"Failed to activate LED channel, error: %d\n", ret);
+			}
+
+			ret = st1202_led_pattern_clear(&led->led_cdev);
+			if (ret < 0) {
+				return dev_err_probe(&client->dev, -EIO,
+					"Failed to clear LED pattern, error: %d\n", ret);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id st1202_id[] = {
+	{ "st1202-i2c" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i2c, st1202_id);
+
+static const struct of_device_id st1202_dt_ids[] = {
+	{ .compatible = "st,led1202", },
+	{ /* sentinel */ },
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



