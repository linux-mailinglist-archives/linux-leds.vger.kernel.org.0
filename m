Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9B46E10D7
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 17:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbjDMPTB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 11:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjDMPS6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 11:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D8B9027
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681399096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bim9aFxJ1jiUJxY00YpYsm2y07+62n6FaYn2V6vbnTQ=;
        b=fkb5n/w1xWP8SqNf/ZNDFuZojwIqDZixirkkITKw7ydQE3mS2ul+9f+NYrHtiMluU+Bxqk
        fVdcyEKuSw/6AtZBacXq+yJUDuTBzaZ4N+hebI1bbrGJ+OL2HITabvO3/yG6l7PX/XM/O3
        n8F7aR8ebi8o7HnpzLXuQt8qBAFOq+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-tL4dSMluP5-CM5Od2hJ5SQ-1; Thu, 13 Apr 2023 11:18:13 -0400
X-MC-Unique: tL4dSMluP5-CM5Od2hJ5SQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A42C6885620;
        Thu, 13 Apr 2023 15:18:12 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.251])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 66D5B141511D;
        Thu, 13 Apr 2023 15:18:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
Subject: [PATCH 1/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
Date:   Thu, 13 Apr 2023 17:18:04 +0200
Message-Id: <20230413151808.20900-2-hdegoede@redhat.com>
In-Reply-To: <20230413151808.20900-1-hdegoede@redhat.com>
References: <20230413151808.20900-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Yauhen Kharuzhy <jekhor@gmail.com>

Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
PMIC. Charger and general-purpose leds are supported. Hardware blinking
is implemented, breathing is not.

This driver was tested with Lenovo Yoga Book notebook.

Changes by Hans de Goede (in response to review of v2):
- Since the PMIC is connected to the battery any changes we make to
  the LED settings are permanent, even surviving reboot / poweroff.
  Save LED1 register settings on probe() and if auto-/hw-control was
  enabled on probe() restore the settings on remove() and shutdown().
- Delay switching LED1 to software control mode to first brightness write.
- Use dynamically allocated drvdata instead of a global drvdata variable.
- Ensure the LED is on when activating blinking.
- Fix CHT_WC_LED_EFF_BREATHING val ((3 << 1) rather then BIT(3)).

Link: https://lore.kernel.org/r/20190212205901.13037-2-jekhor@gmail.com
Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/Kconfig          |  11 +
 drivers/leds/Makefile         |   1 +
 drivers/leds/leds-cht-wcove.c | 368 ++++++++++++++++++++++++++++++++++
 3 files changed, 380 insertions(+)
 create mode 100644 drivers/leds/leds-cht-wcove.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 9dbce09eabac..90835716f14a 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -122,6 +122,17 @@ config LEDS_BCM6358
 	  This option enables support for LEDs connected to the BCM6358
 	  LED HW controller accessed via MMIO registers.
 
+config LEDS_CHT_WCOVE
+	tristate "LED support for Intel Cherry Trail Whiskey Cove PMIC"
+	depends on LEDS_CLASS
+	depends on INTEL_SOC_PMIC_CHTWC
+	help
+	  This option enables support for charger and general purpose LEDs
+	  connected to the Intel Cherrytrail Whiskey Cove PMIC.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-cht-wcove.
+
 config LEDS_CPCAP
 	tristate "LED Support for Motorola CPCAP"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d30395d11fd8..78b5b69f9c54 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
 obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
+obj-$(CONFIG_LEDS_CHT_WCOVE)		+= leds-cht-wcove.o
 obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
 obj-$(CONFIG_LEDS_COBALT_QUBE)		+= leds-cobalt-qube.o
 obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
new file mode 100644
index 000000000000..06447804d050
--- /dev/null
+++ b/drivers/leds/leds-cht-wcove.c
@@ -0,0 +1,368 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for LEDs connected to the Intel Cherry Trail Whiskey Cove PMIC
+ *
+ * Copyright 2019 Yauhen Kharuzhy <jekhor@gmail.com>
+ * Copyright 2023 Hans de Goede <hansg@kernel.org>
+ *
+ * Based on Lenovo Yoga Book Android kernel sources
+ */
+
+#include <linux/kernel.h>
+#include <linux/mfd/intel_soc_pmic.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define CHT_WC_LED1_CTRL		0x5e1f
+#define CHT_WC_LED1_FSM			0x5e20
+#define CHT_WC_LED1_PWM			0x5e21
+
+#define CHT_WC_LED2_CTRL		0x4fdf
+#define CHT_WC_LED2_FSM			0x4fe0
+#define CHT_WC_LED2_PWM			0x4fe1
+
+/* HW or SW control of charging led */
+#define CHT_WC_LED1_SWCTL		BIT(0)
+#define CHT_WC_LED1_ON			BIT(1)
+
+#define CHT_WC_LED2_ON			BIT(0)
+#define CHT_WC_LED_I_MA2_5		(2 << 2)
+/* LED current limit */
+#define CHT_WC_LED_I_MASK		GENMASK(3, 2)
+
+#define CHT_WC_LED_F_1_4_HZ		(0 << 4)
+#define CHT_WC_LED_F_1_2_HZ		(1 << 4)
+#define CHT_WC_LED_F_1_HZ		(2 << 4)
+#define CHT_WC_LED_F_2_HZ		(3 << 4)
+#define CHT_WC_LED_F_MASK		GENMASK(5, 4)
+
+#define CHT_WC_LED_EFF_OFF		(0 << 1)
+#define CHT_WC_LED_EFF_ON		(1 << 1)
+#define CHT_WC_LED_EFF_BLINKING		(2 << 1)
+#define CHT_WC_LED_EFF_BREATHING	(3 << 1)
+#define CHT_WC_LED_EFF_MASK		GENMASK(2, 1)
+
+#define CHT_WC_LED_COUNT		2
+
+struct cht_wc_led_regs {
+	/* Register addresses */
+	u16 ctrl;
+	u16 fsm;
+	u16 pwm;
+	/* Mask + values for turning the LED on/off */
+	u8 on_off_mask;
+	u8 on_val;
+	u8 off_val;
+};
+
+struct cht_wc_led_saved_regs {
+	unsigned int ctrl;
+	unsigned int fsm;
+	unsigned int pwm;
+};
+
+struct cht_wc_led {
+	struct led_classdev cdev;
+	const struct cht_wc_led_regs *regs;
+	struct regmap *regmap;
+	struct mutex mutex;
+};
+
+struct cht_wc_leds {
+	struct cht_wc_led leds[CHT_WC_LED_COUNT];
+	/* Saved LED1 initial register values */
+	struct cht_wc_led_saved_regs led1_initial_regs;
+};
+
+static const struct cht_wc_led_regs cht_wc_led_regs[CHT_WC_LED_COUNT] = {
+	{
+		.ctrl		= CHT_WC_LED1_CTRL,
+		.fsm		= CHT_WC_LED1_FSM,
+		.pwm		= CHT_WC_LED1_PWM,
+		.on_off_mask	= CHT_WC_LED1_SWCTL | CHT_WC_LED1_ON,
+		.on_val		= CHT_WC_LED1_SWCTL | CHT_WC_LED1_ON,
+		.off_val	= CHT_WC_LED1_SWCTL,
+	},
+	{
+		.ctrl		= CHT_WC_LED2_CTRL,
+		.fsm		= CHT_WC_LED2_FSM,
+		.pwm		= CHT_WC_LED2_PWM,
+		.on_off_mask	= CHT_WC_LED2_ON,
+		.on_val		= CHT_WC_LED2_ON,
+		.off_val	= 0,
+	},
+};
+
+static const char * const cht_wc_leds_names[CHT_WC_LED_COUNT] = {
+	"cht-wc::" LED_FUNCTION_CHARGING,
+	"cht-wc::" LED_FUNCTION_INDICATOR,
+};
+
+static int cht_wc_leds_brightness_set(struct led_classdev *cdev,
+				      enum led_brightness value)
+{
+	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
+	int ret;
+
+	mutex_lock(&led->mutex);
+
+	if (!value) {
+		ret = regmap_update_bits(led->regmap, led->regs->ctrl,
+					 led->regs->on_off_mask, led->regs->off_val);
+		if (ret)
+			dev_err(cdev->dev, "Failed to turn off: %d\n", ret);
+
+		/* Disable HW blinking */
+		ret = regmap_update_bits(led->regmap, led->regs->fsm,
+					 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_ON);
+		if (ret < 0)
+			dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
+	} else {
+		ret = regmap_write(led->regmap, led->regs->pwm, value);
+		if (ret)
+			dev_err(cdev->dev, "Failed to set brightness: %d\n", ret);
+
+		ret = regmap_update_bits(led->regmap, led->regs->ctrl,
+					 led->regs->on_off_mask, led->regs->on_val);
+		if (ret)
+			dev_err(cdev->dev, "Failed to turn on: %d\n", ret);
+	}
+
+	mutex_unlock(&led->mutex);
+
+	return ret;
+}
+
+enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
+{
+	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
+	unsigned int val;
+	int ret;
+
+	mutex_lock(&led->mutex);
+
+	ret = regmap_read(led->regmap, led->regs->ctrl, &val);
+	if (ret < 0) {
+		dev_err(cdev->dev, "Failed to read LED CTRL reg: %d\n", ret);
+		ret = LED_OFF;
+		goto done;
+	}
+
+	val &= led->regs->on_off_mask;
+	if (val != led->regs->on_val) {
+		ret = LED_OFF;
+		goto done;
+	}
+
+	ret = regmap_read(led->regmap, led->regs->pwm, &val);
+	if (ret < 0) {
+		dev_err(cdev->dev, "Failed to read LED PWM reg: %d\n", ret);
+		ret = LED_ON;
+		goto done;
+	}
+
+	ret = val;
+done:
+	mutex_unlock(&led->mutex);
+
+	return ret;
+}
+
+/* Return blinking period for given CTRL reg value */
+static unsigned long cht_wc_leds_get_period(int ctrl)
+{
+	ctrl &= CHT_WC_LED_F_MASK;
+
+	switch (ctrl) {
+	case CHT_WC_LED_F_1_4_HZ:
+		return 1000 * 4;
+	case CHT_WC_LED_F_1_2_HZ:
+		return 1000 * 2;
+	case CHT_WC_LED_F_1_HZ:
+		return 1000;
+	case CHT_WC_LED_F_2_HZ:
+		return 1000 / 2;
+	};
+
+	return 0;
+}
+
+/*
+ * Find suitable hardware blink mode for given period.
+ * period < 750 ms - select 2 HZ
+ * 750 ms <= period < 1500 ms - select 1 HZ
+ * 1500 ms <= period < 3000 ms - select 1/2 HZ
+ * 3000 ms <= period < 5000 ms - select 1/4 HZ
+ * 5000 ms <= period - return -1
+ */
+static int cht_wc_leds_find_freq(unsigned long period)
+{
+	if (period < 750)
+		return CHT_WC_LED_F_2_HZ;
+	else if (period < 1500)
+		return CHT_WC_LED_F_1_HZ;
+	else if (period < 3000)
+		return CHT_WC_LED_F_1_2_HZ;
+	else if (period < 5000)
+		return CHT_WC_LED_F_1_4_HZ;
+	else
+		return -1;
+}
+
+static int cht_wc_leds_blink_set(struct led_classdev *cdev,
+				 unsigned long *delay_on,
+				 unsigned long *delay_off)
+{
+	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
+	unsigned int ctrl;
+	int ret;
+
+	mutex_lock(&led->mutex);
+
+	if (!*delay_on && !*delay_off)
+		*delay_on = *delay_off = 1000;
+
+	ctrl = cht_wc_leds_find_freq(*delay_on + *delay_off);
+	if (ctrl < 0) {
+		/* Disable HW blinking */
+		ret = regmap_update_bits(led->regmap, led->regs->fsm,
+					 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_ON);
+		if (ret < 0)
+			dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
+
+		/* Fallback to software timer */
+		*delay_on = *delay_off = 0;
+		ret = -EINVAL;
+		goto done;
+	}
+
+	ret = regmap_update_bits(led->regmap, led->regs->fsm,
+				 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_BLINKING);
+	if (ret < 0)
+		dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
+
+	/* Set the frequency and make sure the LED is on */
+	ret = regmap_update_bits(led->regmap, led->regs->ctrl,
+				 CHT_WC_LED_F_MASK | led->regs->on_off_mask,
+				 ctrl | led->regs->on_val);
+	if (ret < 0)
+		dev_err(cdev->dev, "Failed to update LED CTRL reg: %d\n", ret);
+
+	*delay_off = *delay_on = cht_wc_leds_get_period(ctrl) / 2;
+
+done:
+	mutex_unlock(&led->mutex);
+
+	return ret;
+}
+
+static int cht_wc_led_save_regs(struct cht_wc_led *led,
+				struct cht_wc_led_saved_regs *saved_regs)
+{
+	int ret;
+
+	ret = regmap_read(led->regmap, led->regs->ctrl, &saved_regs->ctrl);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(led->regmap, led->regs->fsm, &saved_regs->fsm);
+	if (ret < 0)
+		return ret;
+
+	return regmap_read(led->regmap, led->regs->pwm, &saved_regs->pwm);
+}
+
+static void cht_wc_led_restore_regs(struct cht_wc_led *led,
+				    const struct cht_wc_led_saved_regs *saved_regs)
+{
+	regmap_write(led->regmap, led->regs->ctrl, saved_regs->ctrl);
+	regmap_write(led->regmap, led->regs->fsm, saved_regs->fsm);
+	regmap_write(led->regmap, led->regs->pwm, saved_regs->pwm);
+}
+
+static int cht_wc_leds_probe(struct platform_device *pdev)
+{
+	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
+	struct cht_wc_leds *leds;
+	int ret;
+	int i;
+
+	leds = devm_kzalloc(&pdev->dev, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	/*
+	 * LED1 might be in hw-controlled mode when this driver gets loaded; and
+	 * since the PMIC is always powered by the battery any changes made are
+	 * permanent. Save LED1 regs to restore them on remove() or shutdown().
+	 */
+	leds->leds[0].regs = &cht_wc_led_regs[0];
+	leds->leds[0].regmap = pmic->regmap;
+	ret = cht_wc_led_save_regs(&leds->leds[0], &leds->led1_initial_regs);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < CHT_WC_LED_COUNT; i++) {
+		struct cht_wc_led *led = &leds->leds[i];
+
+		led->regs = &cht_wc_led_regs[i];
+		led->regmap = pmic->regmap;
+		mutex_init(&led->mutex);
+		led->cdev.name = cht_wc_leds_names[i];
+		led->cdev.brightness_set_blocking = cht_wc_leds_brightness_set;
+		led->cdev.brightness_get = cht_wc_leds_brightness_get;
+		led->cdev.blink_set = cht_wc_leds_blink_set;
+		led->cdev.max_brightness = 255;
+
+		ret = led_classdev_register(&pdev->dev, &led->cdev);
+		if (ret < 0)
+			return ret;
+	}
+
+	platform_set_drvdata(pdev, leds);
+	return 0;
+}
+
+static void cht_wc_leds_remove(struct platform_device *pdev)
+{
+	struct cht_wc_leds *leds = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < CHT_WC_LED_COUNT; i++)
+		led_classdev_unregister(&leds->leds[i].cdev);
+
+	/* Restore LED1 regs if hw-control was active, else leave LED1 off. */
+	if (!(leds->led1_initial_regs.ctrl & CHT_WC_LED1_SWCTL))
+		cht_wc_led_restore_regs(&leds->leds[0], &leds->led1_initial_regs);
+}
+
+static void cht_wc_leds_disable(struct platform_device *pdev)
+{
+	struct cht_wc_leds *leds = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < CHT_WC_LED_COUNT; i++)
+		cht_wc_leds_brightness_set(&leds->leds[i].cdev, LED_OFF);
+
+	/* Restore LED1 regs if hw-control was active, else leave LED1 off. */
+	if (!(leds->led1_initial_regs.ctrl & CHT_WC_LED1_SWCTL))
+		cht_wc_led_restore_regs(&leds->leds[0], &leds->led1_initial_regs);
+}
+
+static struct platform_driver cht_wc_leds_driver = {
+	.probe = cht_wc_leds_probe,
+	.remove_new = cht_wc_leds_remove,
+	.shutdown = cht_wc_leds_disable,
+	.driver = {
+		.name = "cht_wcove_leds",
+	},
+};
+module_platform_driver(cht_wc_leds_driver);
+
+MODULE_ALIAS("platform:cht_wcove_leds");
+MODULE_DESCRIPTION("Intel Cherry Trail Whiskey Cove PMIC LEDs driver");
+MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.39.1

