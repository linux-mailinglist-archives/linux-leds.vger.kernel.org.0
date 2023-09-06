Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63C27944E0
	for <lists+linux-leds@lfdr.de>; Wed,  6 Sep 2023 23:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244616AbjIFVAp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 Sep 2023 17:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbjIFVAo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Sep 2023 17:00:44 -0400
X-Greylist: delayed 135 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Sep 2023 14:00:39 PDT
Received: from smtprelay06.ispgateway.de (smtprelay06.ispgateway.de [80.67.31.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED9C10F1;
        Wed,  6 Sep 2023 14:00:39 -0700 (PDT)
Received: from [77.64.243.219] (helo=note-book.lan)
        by smtprelay06.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1qdzZ3-0003MR-TZ; Wed, 06 Sep 2023 22:55:54 +0200
From:   =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Date:   Wed, 06 Sep 2023 22:55:18 +0200
Subject: [PATCH v3 2/2] leds: add ktd202x driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230906-ktd202x-v3-2-7fcb91c65d3a@apitzsch.eu>
References: <20230906-ktd202x-v3-0-7fcb91c65d3a@apitzsch.eu>
In-Reply-To: <20230906-ktd202x-v3-0-7fcb91c65d3a@apitzsch.eu>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.12.3
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This commit adds support for Kinetic KTD2026/7 RGB/White LED driver.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/leds/rgb/Kconfig        |  13 +
 drivers/leds/rgb/Makefile       |   1 +
 drivers/leds/rgb/leds-ktd202x.c | 625 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 639 insertions(+)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 183bccc06cf3..a6a21f564673 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -14,6 +14,19 @@ config LEDS_GROUP_MULTICOLOR
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-group-multicolor.
 
+config LEDS_KTD202X
+	tristate "LED support for KTD202x Chips"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  This option enables support for the Kinetic KTD2026/KTD2027
+	  RGB/White LED driver found in different BQ mobile phones.
+	  It is a 3 or 4 channel LED driver programmed via an I2C interface.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-ktd202x.
+
 config LEDS_PWM_MULTICOLOR
 	tristate "PWM driven multi-color LED Support"
 	depends on PWM
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index c11cc56384e7..243f31e4d70d 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_LEDS_GROUP_MULTICOLOR)	+= leds-group-multicolor.o
+obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
 obj-$(CONFIG_LEDS_MT6370_RGB)		+= leds-mt6370-rgb.o
diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
new file mode 100644
index 000000000000..a61b21e99cce
--- /dev/null
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -0,0 +1,625 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Kinetic KTD2026/7 RGB/White LED driver with I2C interface
+ *
+ * Copyright 2023 André Apitzsch <git@apitzsch.eu>
+ *
+ * Datasheet: https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
+ */
+
+#include <linux/i2c.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define KTD2026_NUM_LEDS 3
+#define KTD2027_NUM_LEDS 4
+#define KTD202X_MAX_LEDS 4
+
+/* Register bank */
+#define KTD202X_REG_RESET_CONTROL	0x00
+#define KTD202X_REG_FLASH_PERIOD	0x01
+#define KTD202X_REG_PWM1_TIMER		0x02
+#define KTD202X_REG_PWM2_TIMER		0x03
+#define KTD202X_REG_CHANNEL_CTRL	0x04
+#define KTD202X_REG_TRISE_FALL		0x05
+#define KTD202X_REG_LED_IOUT(x)		(0x06 + (x))
+
+/* Register 0 */
+#define KTD202X_TIMER_SLOT_CONTROL_TSLOT1	0x00
+#define KTD202X_TIMER_SLOT_CONTROL_TSLOT2	0x01
+#define KTD202X_TIMER_SLOT_CONTROL_TSLOT3	0x02
+#define KTD202X_TIMER_SLOT_CONTROL_TSLOT4	0x03
+#define KTD202X_RSTR_RESET			0x07
+
+#define KTD202X_ENABLE_CTRL_WAKE	0x00 /* SCL High & SDA High */
+#define KTD202X_ENABLE_CTRL_SLEEP	0x08 /* SCL High & SDA Toggling */
+
+#define KTD202X_TRISE_FALL_SCALE_NORMAL		0x00
+#define KTD202X_TRISE_FALL_SCALE_SLOW_X2	0x20
+#define KTD202X_TRISE_FALL_SCALE_SLOW_X4	0x40
+#define KTD202X_TRISE_FALL_SCALE_FAST_X8	0x60
+
+/* Register 1 */
+#define KTD202X_FLASH_PERIOD_256_MS_LOG_RAMP	0x00
+
+/* Register 2-3 */
+#define KTD202X_FLASH_ON_TIME_0_4_PERCENT	0x01
+
+/* Register 4 */
+#define KTD202X_CHANNEL_CTRL_MASK(x) (BIT(2 * (x)) | BIT(2 * (x) + 1))
+#define KTD202X_CHANNEL_CTRL_OFF 0x00
+#define KTD202X_CHANNEL_CTRL_ON(x) BIT(2 * (x))
+#define KTD202X_CHANNEL_CTRL_PWM1(x) BIT(2 * (x) + 1)
+#define KTD202X_CHANNEL_CTRL_PWM2(x) (BIT(2 * (x)) | BIT(2 * (x) + 1))
+
+/* Register 5 */
+#define KTD202X_RAMP_TIMES_2_MS			0x00
+
+/* Register 6-9 */
+#define KTD202X_LED_CURRENT_10_mA		0x4f
+
+#define KTD202X_FLASH_PERIOD_MIN_MS 256
+#define KTD202X_FLASH_PERIOD_STEP_MS 128
+#define KTD202X_FLASH_PERIOD_MAX_STEPS 126
+#define KTD202X_FLASH_ON_MAX 256
+
+#define KTD202X_MAX_BRIGHTNESS 192
+
+static const struct reg_default ktd202x_reg_defaults[] = {
+	{ KTD202X_REG_RESET_CONTROL, KTD202X_TIMER_SLOT_CONTROL_TSLOT1 |
+		KTD202X_ENABLE_CTRL_WAKE | KTD202X_TRISE_FALL_SCALE_NORMAL },
+	{ KTD202X_REG_FLASH_PERIOD, KTD202X_FLASH_PERIOD_256_MS_LOG_RAMP },
+	{ KTD202X_REG_PWM1_TIMER, KTD202X_FLASH_ON_TIME_0_4_PERCENT },
+	{ KTD202X_REG_PWM2_TIMER, KTD202X_FLASH_ON_TIME_0_4_PERCENT },
+	{ KTD202X_REG_CHANNEL_CTRL, KTD202X_CHANNEL_CTRL_OFF },
+	{ KTD202X_REG_TRISE_FALL, KTD202X_RAMP_TIMES_2_MS },
+	{ KTD202X_REG_LED_IOUT(0), KTD202X_LED_CURRENT_10_mA },
+	{ KTD202X_REG_LED_IOUT(1), KTD202X_LED_CURRENT_10_mA },
+	{ KTD202X_REG_LED_IOUT(2), KTD202X_LED_CURRENT_10_mA },
+	{ KTD202X_REG_LED_IOUT(3), KTD202X_LED_CURRENT_10_mA },
+};
+
+struct ktd202x_led {
+	struct ktd202x *chip;
+	union {
+		struct led_classdev cdev;
+		struct led_classdev_mc mcdev;
+	};
+	u32 index;
+};
+
+struct ktd202x {
+	struct mutex mutex;
+	struct regulator_bulk_data regulators[2];
+	struct device *dev;
+	struct regmap *regmap;
+	bool enabled;
+	int num_leds;
+	struct ktd202x_led leds[];
+};
+
+static int ktd202x_chip_disable(struct ktd202x *chip)
+{
+	int ret;
+
+	if (!chip->enabled)
+		return 0;
+
+	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
+		     KTD202X_ENABLE_CTRL_SLEEP);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
+				     chip->regulators);
+	if (ret) {
+		dev_err(chip->dev, "Failed to disable regulators: %d\n", ret);
+		return ret;
+	}
+
+	chip->enabled = false;
+	return 0;
+}
+
+static int ktd202x_chip_enable(struct ktd202x *chip)
+{
+	int ret;
+
+	if (chip->enabled)
+		return 0;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
+				    chip->regulators);
+	if (ret) {
+		dev_err(chip->dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+	chip->enabled = true;
+
+	ret = regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
+			   KTD202X_ENABLE_CTRL_WAKE);
+
+	if (ret) {
+		dev_err(chip->dev, "Failed to enable the chip: %d\n", ret);
+		ktd202x_chip_disable(chip);
+	}
+
+	return ret;
+}
+
+static bool ktd202x_chip_in_use(struct ktd202x *chip)
+{
+	int i;
+
+	for (i = 0; i < chip->num_leds; i++) {
+		if (chip->leds[i].cdev.brightness)
+			return true;
+	}
+	return false;
+}
+
+static int ktd202x_brightness_set(struct ktd202x_led *led,
+				  struct mc_subled *subleds,
+				  unsigned int num_channels)
+{
+	enum led_brightness brightness;
+	bool mode_blink;
+	int common_mode;
+	int channel;
+	int state;
+	int mode;
+	int ret;
+	int i;
+
+	if (ktd202x_chip_in_use(led->chip)) {
+		ret = ktd202x_chip_enable(led->chip);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_read(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL, &state);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_channels; i++) {
+		channel = subleds[i].channel;
+		common_mode |= (state >> 2*channel) & (BIT(0) | BIT(1));
+	}
+	mode_blink = common_mode == KTD202X_CHANNEL_CTRL_PWM1(0);
+
+	for (i = 0; i < num_channels; i++) {
+		brightness = subleds[i].brightness;
+		channel = subleds[i].channel;
+
+		ret = regmap_write(led->chip->regmap,
+				   KTD202X_REG_LED_IOUT(channel),
+				   brightness ? brightness-1 : 0);
+		if (ret)
+			return ret;
+
+		if (brightness) {
+			if (mode_blink)
+				mode = KTD202X_CHANNEL_CTRL_PWM1(channel);
+			else
+				mode = KTD202X_CHANNEL_CTRL_ON(channel);
+		} else {
+			mode = KTD202X_CHANNEL_CTRL_OFF;
+		}
+		ret = regmap_update_bits(led->chip->regmap,
+					 KTD202X_REG_CHANNEL_CTRL,
+					 KTD202X_CHANNEL_CTRL_MASK(channel),
+					 mode);
+		if (ret)
+			return ret;
+	}
+
+	if (!ktd202x_chip_in_use(led->chip))
+		return ktd202x_chip_disable(led->chip);
+
+	return 0;
+}
+
+static int ktd202x_brightness_single_set(struct led_classdev *cdev,
+					 enum led_brightness value)
+{
+	struct ktd202x_led *led = container_of(cdev, struct ktd202x_led, cdev);
+	struct mc_subled info;
+	int ret;
+
+	cdev->brightness = value;
+
+	mutex_lock(&led->chip->mutex);
+
+	info.brightness = value;
+	info.channel = led->index;
+	ret = ktd202x_brightness_set(led, &info, 1);
+
+	mutex_unlock(&led->chip->mutex);
+
+	return ret;
+}
+
+static int ktd202x_brightness_mc_set(struct led_classdev *cdev,
+				     enum led_brightness value)
+{
+	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
+	struct ktd202x_led *led = container_of(mc, struct ktd202x_led, mcdev);
+	int ret;
+
+	cdev->brightness = value;
+
+	mutex_lock(&led->chip->mutex);
+
+	led_mc_calc_color_components(mc, value);
+	ret = ktd202x_brightness_set(led, mc->subled_info, mc->num_colors);
+
+	mutex_unlock(&led->chip->mutex);
+
+	return ret;
+}
+
+static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
+			     unsigned long *delay_off, struct mc_subled *subleds,
+			     unsigned int num_channels)
+{
+	unsigned long delay_total_ms;
+	int ret, num_steps, on;
+	u8 ctrl_mask = 0;
+	u8 ctrl_pwm1 = 0;
+	u8 ctrl_on = 0;
+	int i, channel;
+
+	mutex_lock(&led->chip->mutex);
+
+	for (i = 0; i < num_channels; i++) {
+		channel = subleds[i].channel;
+		ctrl_mask |= KTD202X_CHANNEL_CTRL_MASK(channel);
+		ctrl_on |= KTD202X_CHANNEL_CTRL_ON(channel);
+		ctrl_pwm1 |= KTD202X_CHANNEL_CTRL_PWM1(channel);
+	}
+
+	/* Never off - brightness is already set, disable blinking */
+	if (!*delay_off) {
+		ret = regmap_update_bits(led->chip->regmap,
+					 KTD202X_REG_CHANNEL_CTRL,
+					 ctrl_mask,
+					 ctrl_on);
+		goto out;
+	}
+
+	/* Convert into values the HW will understand. */
+	/* Integer representation of time of flash period */
+	num_steps = (*delay_on + *delay_off - KTD202X_FLASH_PERIOD_MIN_MS) /
+		    KTD202X_FLASH_PERIOD_STEP_MS;
+	num_steps = clamp(num_steps, 0, KTD202X_FLASH_PERIOD_MAX_STEPS);
+	/* Integer representation of percentage of LED ON time */
+	on = (*delay_on * KTD202X_FLASH_ON_MAX) / (*delay_on + *delay_off);
+
+	/* Actually used delay_{on,off} values */
+	delay_total_ms = num_steps * KTD202X_FLASH_PERIOD_STEP_MS +
+			 KTD202X_FLASH_PERIOD_MIN_MS;
+	*delay_on = (delay_total_ms * on) / KTD202X_FLASH_ON_MAX;
+	*delay_off = delay_total_ms - *delay_on;
+
+	/* Set timings */
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_FLASH_PERIOD,
+			   num_steps);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_PWM1_TIMER, on);
+	if (ret)
+		goto out;
+
+	ret = regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
+				 ctrl_mask,
+				 ctrl_pwm1);
+out:
+	mutex_unlock(&led->chip->mutex);
+	return ret;
+}
+
+static int ktd202x_blink_single_set(struct led_classdev *cdev,
+				    unsigned long *delay_on,
+				    unsigned long *delay_off)
+{
+	struct ktd202x_led *led = container_of(cdev, struct ktd202x_led, cdev);
+	struct mc_subled info;
+	int ret;
+
+	if (!cdev->brightness) {
+		ret = ktd202x_brightness_single_set(cdev, KTD202X_MAX_BRIGHTNESS);
+		if (ret)
+			return ret;
+	}
+
+	/* If no blink specified, default to 1 Hz. */
+	if (!*delay_off && !*delay_on) {
+		*delay_off = 500;
+		*delay_on = 500;
+	}
+
+	/* Never on - just set to off */
+	if (!*delay_on)
+		return ktd202x_brightness_single_set(cdev, LED_OFF);
+
+	info.channel = led->index;
+
+	return ktd202x_blink_set(led, delay_on, delay_off, &info, 1);
+}
+
+static int ktd202x_blink_mc_set(struct led_classdev *cdev,
+				unsigned long *delay_on,
+				unsigned long *delay_off)
+{
+	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
+	struct ktd202x_led *led = container_of(mc, struct ktd202x_led, mcdev);
+	int ret;
+
+	if (!cdev->brightness) {
+		ret = ktd202x_brightness_mc_set(cdev, KTD202X_MAX_BRIGHTNESS);
+		if (ret)
+			return ret;
+	}
+
+	/* If no blink specified, default to 1 Hz. */
+	if (!*delay_off && !*delay_on) {
+		*delay_off = 500;
+		*delay_on = 500;
+	}
+
+	/* Never on - just set to off */
+	if (!*delay_on)
+		return ktd202x_brightness_mc_set(cdev, LED_OFF);
+
+	return ktd202x_blink_set(led, delay_on, delay_off, mc->subled_info,
+				 mc->num_colors);
+}
+
+static int ktd202x_add_led(struct ktd202x *chip, struct device_node *np,
+			   unsigned int index)
+{
+	struct ktd202x_led *led = &chip->leds[index];
+	struct led_init_data init_data = {};
+	struct led_classdev *cdev;
+	struct device_node *child;
+	struct mc_subled *info;
+	int num_channels;
+	u32 color = 0;
+	u32 reg;
+	int ret;
+	int i;
+
+	/* Color property is optional in single color case */
+	ret = of_property_read_u32(np, "color", &color);
+	if (ret < 0 && ret != -EINVAL) {
+		dev_err(chip->dev, "failed to parse 'color' of %pOF\n", np);
+		return ret;
+	}
+
+	if (color == LED_COLOR_ID_RGB) {
+		num_channels = of_get_available_child_count(np);
+		if (!num_channels || num_channels > chip->num_leds)
+			return -EINVAL;
+	} else {
+		num_channels = 1;
+	}
+
+	led->chip = chip;
+
+	if (color == LED_COLOR_ID_RGB) {
+		info = devm_kcalloc(chip->dev, num_channels, sizeof(*info),
+				    GFP_KERNEL);
+		if (!info)
+			return -ENOMEM;
+
+		i = 0;
+		for_each_available_child_of_node(np, child) {
+			u32 mono_color = 0;
+
+			ret = of_property_read_u32(child, "reg", &reg);
+			if (ret != 0 || reg >= chip->num_leds) {
+				dev_err(chip->dev, "invalid 'reg' of %pOFn\n",
+					np);
+				return -EINVAL;
+			}
+
+			ret = of_property_read_u32(child, "color", &mono_color);
+			if (ret < 0 && ret != -EINVAL) {
+				dev_err(chip->dev,
+					"failed to parse 'color' of %pOF\n",
+					np);
+				return ret;
+			}
+
+			info[i].color_index = mono_color;
+			info[i].channel = reg;
+			info[i].intensity = 0;
+			i++;
+		}
+
+		led->mcdev.subled_info = info;
+		led->mcdev.num_colors = num_channels;
+
+		cdev = &led->mcdev.led_cdev;
+		cdev->brightness_set_blocking = ktd202x_brightness_mc_set;
+		cdev->blink_set = ktd202x_blink_mc_set;
+	} else {
+		ret = of_property_read_u32(np, "reg", &reg);
+		if (ret != 0 || reg >= chip->num_leds) {
+			dev_err(chip->dev, "invalid 'reg' of %pOFn\n", np);
+			return -EINVAL;
+		}
+		led->index = reg;
+
+		cdev = &led->cdev;
+		cdev->brightness_set_blocking = ktd202x_brightness_single_set;
+		cdev->blink_set = ktd202x_blink_single_set;
+	}
+
+	cdev->max_brightness = KTD202X_MAX_BRIGHTNESS;
+
+	init_data.fwnode = of_fwnode_handle(np);
+
+	if (color == LED_COLOR_ID_RGB)
+		ret = devm_led_classdev_multicolor_register_ext(chip->dev,
+								&led->mcdev,
+								&init_data);
+	else
+		ret = devm_led_classdev_register_ext(chip->dev, &led->cdev,
+						     &init_data);
+	if (ret) {
+		dev_err(chip->dev, "unable to register %s\n", cdev->name);
+		of_node_put(np);
+	}
+
+	return ret;
+}
+
+static int ktd202x_probe_dt(struct ktd202x *chip)
+{
+	struct device_node *np = dev_of_node(chip->dev), *child;
+	unsigned int i;
+	int count, ret;
+
+	chip->num_leds = (int)(unsigned long)of_device_get_match_data(chip->dev);
+
+	count = of_get_available_child_count(np);
+	if (!count || count > chip->num_leds)
+		return -EINVAL;
+
+	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
+		     KTD202X_RSTR_RESET);
+
+	/* Allow the device to execute the complete reset */
+	usleep_range(200, 300);
+
+	i = 0;
+	for_each_available_child_of_node(np, child) {
+		ret = ktd202x_add_led(chip, child, i);
+		if (ret)
+			return ret;
+		i++;
+	}
+
+	return 0;
+}
+
+static const struct regmap_config ktd202x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x09,
+	.cache_type = REGCACHE_FLAT,
+	.reg_defaults = ktd202x_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(ktd202x_reg_defaults),
+};
+
+static int ktd202x_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ktd202x *chip;
+	int count;
+	int ret;
+
+	count = device_get_child_node_count(dev);
+	if (!count || count > KTD202X_MAX_LEDS)
+		return dev_err_probe(dev, -EINVAL,
+				     "Incorrect number of leds (%d)", count);
+
+	chip = devm_kzalloc(dev, struct_size(chip, leds, count), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	mutex_init(&chip->mutex);
+
+	chip->dev = dev;
+	i2c_set_clientdata(client, chip);
+
+	chip->regmap = devm_regmap_init_i2c(client, &ktd202x_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map.\n");
+		goto error;
+	}
+
+	chip->regulators[0].supply = "vin";
+	chip->regulators[1].supply = "vio";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators),
+				      chip->regulators);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to request regulators.\n");
+		goto error;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
+				    chip->regulators);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to enable regulators.\n");
+		goto error;
+	}
+
+	ret = ktd202x_probe_dt(chip);
+	if (ret < 0)
+		goto error_reg;
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
+				     chip->regulators);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to disable regulators.\n");
+		goto error;
+	}
+
+	return 0;
+
+error_reg:
+	regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
+			       chip->regulators);
+
+error:
+	mutex_destroy(&chip->mutex);
+	return ret;
+}
+
+static void ktd202x_remove(struct i2c_client *client)
+{
+	struct ktd202x *chip = i2c_get_clientdata(client);
+
+	ktd202x_chip_disable(chip);
+
+	mutex_destroy(&chip->mutex);
+}
+
+static void ktd202x_shutdown(struct i2c_client *client)
+{
+	struct ktd202x *chip = i2c_get_clientdata(client);
+
+	/* Reset registers to make sure all off before shutdown */
+	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
+		     KTD202X_RSTR_RESET);
+}
+
+static const struct of_device_id ktd202x_match_table[] = {
+	{ .compatible = "kinetic,ktd2026", .data = (void *)KTD2026_NUM_LEDS },
+	{ .compatible = "kinetic,ktd2027", .data = (void *)KTD2027_NUM_LEDS },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, ktd202x_match_table);
+
+static struct i2c_driver ktd202x_driver = {
+	.driver = {
+		.name = "leds-ktd202x",
+		.of_match_table = ktd202x_match_table,
+	},
+	.probe = ktd202x_probe,
+	.remove = ktd202x_remove,
+	.shutdown = ktd202x_shutdown,
+};
+module_i2c_driver(ktd202x_driver);
+
+MODULE_AUTHOR("André Apitzsch <git@apitzsch.eu>");
+MODULE_DESCRIPTION("Kinetic KTD2026/7 LED driver");
+MODULE_LICENSE("GPL");

-- 
2.42.0

