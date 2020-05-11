Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD411CD75B
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2020 13:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbgEKLMl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 May 2020 07:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgEKLMk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 11 May 2020 07:12:40 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63D3C061A0C;
        Mon, 11 May 2020 04:12:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u6so8988479ljl.6;
        Mon, 11 May 2020 04:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MU8LrcluFlu/Ki50Lmb0GTvysLuE0WNTsR1bdknSIec=;
        b=FTFCqGqlV2A0FYLgnwOSyltrpOoarhHJ+N3jaWFmflBCzsVjKoJ2cl5lVRF8vO4hR8
         0X2OpYChgzfNUCDT7/iAND35LvsNCf56MD14YkA/kHa+j2G8KemIHgA5wR8+ai1sRhU1
         AQ6zWnS2MlwlaBJf8H2azbDx9kHktdKLVevnC3lxtGR9C01XQTKkX/zVyxBWzQgRzSqg
         a0FUu/i70a4Cd+SAK8kmJPJ7qKJTk8J7B8yycPmuTf+naw1ekuFUYX87jlfbGW8bKUSD
         UjFG82VCy7Y4IncEONTDJp+xytOeAJOPY3MLyHZxFR3rW5Hc/4ymnK3HLIyCarUpjqBj
         kwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MU8LrcluFlu/Ki50Lmb0GTvysLuE0WNTsR1bdknSIec=;
        b=oH4OTZoVMJe9aqb2p/r24+Uzdzha1C+r5uhEIDom7PqCX+BLfcZpKUJysE8469qUf0
         Af3pWz2BTGK21wuzvgUlFOEeLF9cgwqzNIZy6NileaqY9WXNQeCVOKyKHHZMMwtQ3Wha
         M0hxBFXXAp8hkjTp+0jOTp3hq5ovbIKrutP98isKE8emwGkKP7zBlCi8/wo+txf7/Io7
         CTT9ahmGPCIeggR2erKkK8gMX847fdZT/hiV61TFy8mCTGsphDlXDmX06kWTrVQ0e+cs
         Q4tgIduRL4zMCQmCG1CZsCBhUHBn1SpCR+0WGCfPJlKwt9E3qUZt+JBcM7peI0B5+PpG
         4GTQ==
X-Gm-Message-State: AOAM533PswujkxGF3RB43+c6qVAnVU/vL1u4kBwjWaQLAkmB2T5K1Bqn
        KEATbl7CGkEl8iAxWV0ZphDeRlrHDko=
X-Google-Smtp-Source: ABdhPJx3Fpx8L49kSDh2b/0MT8NsVPbc9dv8Hh1BR5b3Q1osOQmUFcbtMQk5LmVVFy4BXHHvTkMZNA==
X-Received: by 2002:a2e:5746:: with SMTP id r6mr9754978ljd.15.1589195558144;
        Mon, 11 May 2020 04:12:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:28d4:e600:cdb2:b5ce:8f29:26b7])
        by smtp.gmail.com with ESMTPSA id a10sm9498128ljp.16.2020.05.11.04.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:12:37 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     pavel@ucw.cz
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH v2 3/3] leds: add aw2013 driver
Date:   Mon, 11 May 2020 16:11:28 +0500
Message-Id: <20200511111128.16210-3-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511111128.16210-1-nikitos.tr@gmail.com>
References: <20200511111128.16210-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

This commit adds support for AWINIC AW2013 3-channel LED driver.
The chip supports 3 PWM channels and is controlled with I2C.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
Changes in v2:
  - Handling of situations where one of delays for brightness_set()
    was zero is fixed.
  - probe() is reworked to do led registration at the time of 
    dt parsing. Support for "default-state" property was removed:
    Keeping the old state properly appers to be tricky and
    doesn't worth the effort. For other state "default-on" trigger
    can be used.
---
 drivers/leds/Kconfig       |  10 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-aw2013.c | 436 +++++++++++++++++++++++++++++++++++++
 3 files changed, 447 insertions(+)
 create mode 100644 drivers/leds/leds-aw2013.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 9cdc4cfc5d11..ed943140e1fd 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -103,6 +103,16 @@ config LEDS_AS3645A
 	  controller. V4L2 flash API is provided as well if
 	  CONFIG_V4L2_FLASH_API is enabled.
 
+config LEDS_AW2013
+	tristate "LED support for Awinic AW2013"
+	depends on LEDS_CLASS && I2C && OF
+	help
+	  This option enables support for the AW2013 3-channel
+	  LED driver.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-aw2013.
+
 config LEDS_BCM6328
 	tristate "LED Support for Broadcom BCM6328"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d0dff504f108..d6b8a792c936 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
 obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
 obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
+obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
new file mode 100644
index 000000000000..d709cc1f949e
--- /dev/null
+++ b/drivers/leds/leds-aw2013.c
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Driver for Awinic AW2013 3-channel LED driver
+
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define AW2013_MAX_LEDS 3
+
+/* Reset and ID register */
+#define AW2013_RSTR 0x00
+#define AW2013_RSTR_RESET 0x55
+#define AW2013_RSTR_CHIP_ID 0x33
+
+/* Global control register */
+#define AW2013_GCR 0x01
+#define AW2013_GCR_ENABLE BIT(0)
+
+/* LED channel enable register */
+#define AW2013_LCTR 0x30
+#define AW2013_LCTR_LE(x) BIT((x))
+
+/* LED channel control registers */
+#define AW2013_LCFG(x) (0x31 + (x))
+#define AW2013_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
+#define AW2013_LCFG_MD BIT(4)
+#define AW2013_LCFG_FI BIT(5)
+#define AW2013_LCFG_FO BIT(6)
+
+/* LED channel PWM registers */
+#define AW2013_REG_PWM(x) (0x34 + (x))
+
+/* LED channel timing registers */
+#define AW2013_LEDT0(x) (0x37 + (x) * 3)
+#define AW2013_LEDT0_T1(x) ((x) << 4) // Should be 0-7
+#define AW2013_LEDT0_T2(x) (x) // Should be 0-5
+
+#define AW2013_LEDT1(x) (0x38 + (x) * 3)
+#define AW2013_LEDT1_T3(x) ((x) << 4) // Should be 0-7
+#define AW2013_LEDT1_T4(x) (x) // Should be 0-7
+
+#define AW2013_LEDT2(x) (0x39 + (x) * 3)
+#define AW2013_LEDT2_T0(x) ((x) << 4) // Should be 0-8
+#define AW2013_LEDT2_REPEAT(x) (x) // Should be 0-15
+
+#define AW2013_REG_MAX 0x77
+
+#define AW2013_TIME_STEP 130 /* ms */
+
+struct aw2013;
+
+struct aw2013_led {
+	struct aw2013 *chip;
+	struct led_classdev cdev;
+	u32 num;
+	unsigned int imax;
+};
+
+struct aw2013 {
+	struct mutex mutex; /* held when writing to registers */
+	struct regulator *vcc_regulator;
+	struct i2c_client *client;
+	struct aw2013_led leds[AW2013_MAX_LEDS];
+	struct regmap *regmap;
+	int num_leds;
+	bool enabled;
+};
+
+static int aw2013_chip_init(struct aw2013 *chip)
+{
+	int i, ret;
+
+	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
+	if (ret) {
+		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
+			ret);
+		return ret;
+	}
+
+	for (i = 0; i < chip->num_leds; i++) {
+		ret = regmap_update_bits(chip->regmap,
+					 AW2013_LCFG(chip->leds[i].num),
+					 AW2013_LCFG_IMAX_MASK,
+					 chip->leds[i].imax);
+		if (ret) {
+			dev_err(&chip->client->dev,
+				"Failed to set maximum current for led %d: %d\n",
+				chip->leds[i].num, ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void aw2013_chip_disable(struct aw2013 *chip)
+{
+	int ret;
+
+	if (!chip->enabled)
+		return;
+
+	regmap_write(chip->regmap, AW2013_GCR, 0);
+
+	ret = regulator_disable(chip->vcc_regulator);
+	if (ret) {
+		dev_err(&chip->client->dev,
+			"Failed to disable regulator: %d\n", ret);
+		return;
+	}
+
+	chip->enabled = false;
+}
+
+static int aw2013_chip_enable(struct aw2013 *chip)
+{
+	int ret;
+
+	if (chip->enabled)
+		return 0;
+
+	ret = regulator_enable(chip->vcc_regulator);
+	if (ret) {
+		dev_err(&chip->client->dev,
+			"Failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+	chip->enabled = true;
+
+	ret = aw2013_chip_init(chip);
+	if (ret)
+		aw2013_chip_disable(chip);
+
+	return ret;
+}
+
+static bool aw2013_chip_in_use(struct aw2013 *chip)
+{
+	int i;
+
+	for (i = 0; i < chip->num_leds; i++)
+		if (chip->leds[i].cdev.brightness)
+			return true;
+
+	return false;
+}
+
+static int aw2013_brightness_set(struct led_classdev *cdev,
+				 enum led_brightness brightness)
+{
+	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
+	int ret, num;
+
+	mutex_lock(&led->chip->mutex);
+
+	if (aw2013_chip_in_use(led->chip)) {
+		ret = aw2013_chip_enable(led->chip);
+		if (ret)
+			goto error;
+	}
+
+	num = led->num;
+
+	ret = regmap_write(led->chip->regmap, AW2013_REG_PWM(num), brightness);
+	if (ret)
+		goto error;
+
+	if (brightness) {
+		ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
+					 AW2013_LCTR_LE(num), 0xFF);
+	} else {
+		ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
+					 AW2013_LCTR_LE(num), 0);
+		if (ret)
+			goto error;
+		ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
+					 AW2013_LCFG_MD, 0);
+	}
+	if (ret)
+		goto error;
+
+	if (!aw2013_chip_in_use(led->chip))
+		aw2013_chip_disable(led->chip);
+
+error:
+	mutex_unlock(&led->chip->mutex);
+
+	return ret;
+}
+
+static int aw2013_blink_set(struct led_classdev *cdev,
+			    unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
+	int ret, num = led->num;
+	unsigned long off = 0, on = 0;
+
+	/* If no blink specified, default to 1 Hz. */
+	if (!*delay_off && !*delay_on) {
+		*delay_off = 500;
+		*delay_on = 500;
+	}
+
+	if (!led->cdev.brightness) {
+		led->cdev.brightness = LED_FULL;
+		ret = aw2013_brightness_set(&led->cdev, led->cdev.brightness);
+		if (ret)
+			return ret;
+	}
+
+	/* Never on - just set to off */
+	if (!*delay_on) {
+		led->cdev.brightness = LED_OFF;
+		return aw2013_brightness_set(&led->cdev, LED_OFF);
+	}
+
+	mutex_lock(&led->chip->mutex);
+
+	/* Never off - brightness is already set, disable blinking */
+	if (!*delay_off) {
+		ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
+					 AW2013_LCFG_MD, 0);
+		goto out;
+	}
+
+	/* Convert into values the HW will understand. */
+	off = min(5, ilog2((*delay_off - 1) / AW2013_TIME_STEP) + 1);
+	on = min(7, ilog2((*delay_on - 1) / AW2013_TIME_STEP) + 1);
+
+	*delay_off = BIT(off) * AW2013_TIME_STEP;
+	*delay_on = BIT(on) * AW2013_TIME_STEP;
+
+	/* Set timings */
+	ret = regmap_write(led->chip->regmap,
+			   AW2013_LEDT0(num), AW2013_LEDT0_T2(on));
+	if (ret)
+		goto out;
+	ret = regmap_write(led->chip->regmap,
+			   AW2013_LEDT1(num), AW2013_LEDT1_T4(off));
+	if (ret)
+		goto out;
+
+	/* Finally, enable the LED */
+	ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
+				 AW2013_LCFG_MD, 0xFF);
+	if (ret)
+		goto out;
+
+	ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
+				 AW2013_LCTR_LE(num), 0xFF);
+
+out:
+	mutex_unlock(&led->chip->mutex);
+
+	return ret;
+}
+
+static int aw2013_probe_dt(struct aw2013 *chip)
+{
+	struct device_node *np = chip->client->dev.of_node, *child;
+	int count, ret = 0, i = 0;
+	struct aw2013_led *led;
+
+	count = of_get_child_count(np);
+	if (!count || count > AW2013_MAX_LEDS)
+		return -EINVAL;
+
+	regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
+
+	for_each_available_child_of_node(np, child) {
+		struct led_init_data init_data = {};
+		u32 source;
+		u32 imax;
+
+		ret = of_property_read_u32(child, "reg", &source);
+		if (ret != 0 || source >= AW2013_MAX_LEDS) {
+			dev_err(&chip->client->dev,
+				"Couldn't read LED address: %d\n", ret);
+			count--;
+			continue;
+		}
+
+		led = &chip->leds[i];
+		led->num = source;
+		led->chip = chip;
+		init_data.fwnode = of_fwnode_handle(child);
+
+		if (!of_property_read_u32(child, "led-max-microamp", &imax)) {
+			led->imax = min_t(u32, imax / 5000, 3);
+		} else {
+			led->imax = 1; // 5mA
+			dev_info(&chip->client->dev,
+				 "DT property led-max-microamp is missing\n");
+		}
+
+		of_property_read_string(child, "linux,default-trigger",
+					&led->cdev.default_trigger);
+
+		led->cdev.brightness_set_blocking = aw2013_brightness_set;
+		led->cdev.blink_set = aw2013_blink_set;
+
+		ret = devm_led_classdev_register_ext(&chip->client->dev,
+						     &led->cdev, &init_data);
+		if (ret < 0)
+			return ret;
+
+		i++;
+	}
+
+	if (!count)
+		return -EINVAL;
+
+	chip->num_leds = i;
+
+	return 0;
+}
+
+static const struct regmap_config aw2013_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AW2013_REG_MAX,
+};
+
+static int aw2013_probe(struct i2c_client *client)
+{
+	struct aw2013 *chip;
+	int ret;
+	unsigned int chipid;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	mutex_init(&chip->mutex);
+	mutex_lock(&chip->mutex);
+
+	chip->client = client;
+	i2c_set_clientdata(client, chip);
+
+	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		ret = PTR_ERR(chip->regmap);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			ret);
+		goto error;
+	}
+
+	chip->vcc_regulator = devm_regulator_get(&client->dev, "vcc");
+	ret = PTR_ERR_OR_ZERO(chip->vcc_regulator);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&client->dev,
+				"Failed to request regulator: %d\n", ret);
+		goto error;
+	}
+
+	ret = regulator_enable(chip->vcc_regulator);
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to enable regulator: %d\n", ret);
+		goto error;
+	}
+
+	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
+	if (ret) {
+		dev_err(&client->dev, "Failed to read chip ID: %d\n",
+			ret);
+		goto error_reg;
+	}
+
+	if (chipid != AW2013_RSTR_CHIP_ID) {
+		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
+			chipid);
+		ret = -ENODEV;
+		goto error_reg;
+	}
+
+	ret = aw2013_probe_dt(chip);
+	if (ret < 0)
+		goto error_reg;
+
+	ret = regulator_disable(chip->vcc_regulator);
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to disable regulator: %d\n", ret);
+		goto error;
+	}
+
+	mutex_unlock(&chip->mutex);
+
+	return 0;
+
+error_reg:
+	regulator_disable(chip->vcc_regulator);
+
+error:
+	mutex_destroy(&chip->mutex);
+	return ret;
+}
+
+static int aw2013_remove(struct i2c_client *client)
+{
+	struct aw2013 *chip = i2c_get_clientdata(client);
+
+	aw2013_chip_disable(chip);
+
+	mutex_destroy(&chip->mutex);
+
+	return 0;
+}
+
+static const struct of_device_id aw2013_match_table[] = {
+	{ .compatible = "awinic,aw2013", },
+	{ /* sentinel */ },
+};
+
+MODULE_DEVICE_TABLE(of, aw2013_match_table);
+
+static struct i2c_driver aw2013_driver = {
+	.driver = {
+		.name = "leds-aw2013",
+		.of_match_table = of_match_ptr(aw2013_match_table),
+	},
+	.probe_new = aw2013_probe,
+	.remove = aw2013_remove,
+};
+
+module_i2c_driver(aw2013_driver);
+
+MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
+MODULE_DESCRIPTION("AW2013 LED driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

