	by mail.lfdr.de (Postfix) with ESMTP id 74D3E749177
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jul 2023 01:13:46 +0200 (CEST)
        id S232326AbjGEXNp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jul 2023 19:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        with ESMTP id S230383AbjGEXNm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jul 2023 19:13:42 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819881BCB;
        Wed,  5 Jul 2023 16:13:39 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3E7DE85813;
        Thu,  6 Jul 2023 01:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688598817;
        bh=WjB8x2YEpHsB6EtGS4Y5dabSFrTWLR2s9M/BTnjAOj0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z5kWfn3a0lnDcysCRe2F+zEdd6t/fkykMYMvHwn66wZeInmVAfgBYjymygVNMotAe
         Kyg/5V8r6y6o8qVe2E4XM4zOYH2Oa3iajzFe+BiBkaF6dHz3awpvwxZd4KyjXJ+SpP
         IVRdg8dfo1V1KUYuQ3nsRnKf7gB/32oyUnYrJmUZvzCLvy8g4gsjXnM8OBeCSDBLwM
         xAti+HCG9TJk0rmcPoMkS9mq549SAb+O3vVLQXdAreBKq2Na5vuh5YkSuqhJlDZ7Lk
         DEKI+eQTxk9f3FkhK/OrPV4+2w8DRD8fi9f6t6p276VE4kdEWwHDctRSp/Zz66Aw6H
         g8wYoNf9ek1OQ==
From:   Marek Vasut <marex@denx.de>
Cc:     Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Marek Vasut <marex@denx.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] leds: pca995x: Add support for PCA995X chips
Date:   Thu,  6 Jul 2023 01:13:26 +0200
Message-Id: <20230705231326.232356-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230705231326.232356-1-marex@denx.de>
References: <20230705231326.232356-1-marex@denx.de>
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
From: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
The PCA995x chips are I2C controlled LED drivers. Each chip has
up to 16 outputs, each one with an individual 8-bit resolution
PWM for brightness control.
Signed-off-by: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
Signed-off-by: Marek Vasut <marex@denx.de> # Basically rewrite the driver
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org
---
V2: - Fix pca995x_probe() type
    - Fix device_get_match_data() cast
V3: - Drop of_match_ptr()
---
 drivers/leds/Kconfig        |   9 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-pca995x.c | 198 ++++++++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 drivers/leds/leds-pca995x.c
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6046dfeca16fc..b92208eccdea9 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -521,6 +521,15 @@ config LEDS_PCA963X
 	  LED driver chip accessed via the I2C bus. Supported
 	  devices include PCA9633 and PCA9634
 
+config LEDS_PCA995X
+	tristate "LED Support for PCA995x I2C chips"
+	depends on LEDS_CLASS
+	depends on I2C
+	help
+	  This option enables support for LEDs connected to PCA995x
+	  LED driver chips accessed via the I2C bus. Supported
+	  devices include PCA9955BTW, PCA9952TW and PCA9955TW.
+
 config LEDS_WM831X_STATUS
 	tristate "LED support for status LEDs on WM831x PMICs"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d71f1226540c2..d7348e8bc019a 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_LEDS_OT200)		+= leds-ot200.o
 obj-$(CONFIG_LEDS_PCA9532)		+= leds-pca9532.o
 obj-$(CONFIG_LEDS_PCA955X)		+= leds-pca955x.o
 obj-$(CONFIG_LEDS_PCA963X)		+= leds-pca963x.o
+obj-$(CONFIG_LEDS_PCA995X)		+= leds-pca995x.o
 obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
new file mode 100644
index 0000000000000..dde99f4a4c1c7
--- /dev/null
+++ b/drivers/leds/leds-pca995x.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LED driver for PCA995x I2C LED drivers
+ *
+ * Copyright 2011 bct electronic GmbH
+ * Copyright 2013 Qtechnology/AS
+ * Copyright 2022 NXP
+ * Copyright 2023 Marek Vasut
+ */
+
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+/* Register definition */
+#define PCA995X_MODE1		0x00
+#define PCA995X_MODE2		0x01
+#define PCA995X_LEDOUT0		0x02
+#define PCA9955B_PWM0		0x08
+#define PCA9952_PWM0		0x0A
+#define PCA9952_IREFALL		0x43
+#define PCA9955B_IREFALL	0x45
+
+/* LED select registers determine the source that drives LED outputs */
+#define PCA995X_LED_OFF		0x0	/* LED driver off */
+#define PCA995X_LED_ON		0x1	/* LED driver on */
+#define PCA995X_LED_PWM		0x2	/* Controlled through PWM */
+#define PCA995X_LDRX_MASK	0x3	/* 2 bits per output state control */
+
+#define PCA995X_MODE_1_CFG	0x00	/* Auto-increment disabled. Normal mode */
+#define PCA995X_IREFALL_CFG	0x7F	/* Half of max current gain multiplier */
+
+#define PCA995X_MAX_OUTPUTS	16	/* Supported outputs */
+
+#define ldev_to_led(c)	container_of(c, struct pca995x_led, ldev)
+
+struct pca995x_led {
+	unsigned int led_no;
+	struct led_classdev ldev;
+	struct pca995x_chip *chip;
+};
+
+struct pca995x_chip {
+	struct regmap *regmap;
+	struct pca995x_led leds[PCA995X_MAX_OUTPUTS];
+	int btype;
+};
+
+static int pca995x_brightness_set(struct led_classdev *led_cdev,
+				  enum led_brightness brightness)
+{
+	struct pca995x_led *led = ldev_to_led(led_cdev);
+	struct pca995x_chip *chip = led->chip;
+	u8 ledout_addr, pwmout_addr;
+	int shift, ret;
+
+	pwmout_addr = (chip->btype ? PCA9955B_PWM0 : PCA9952_PWM0) + led->led_no;
+	ledout_addr = PCA995X_LEDOUT0 + (led->led_no / 4);
+	shift = 2 * (led->led_no % 4);
+
+	switch (brightness) {
+	case LED_FULL:
+		return regmap_update_bits(chip->regmap, ledout_addr,
+					  PCA995X_LDRX_MASK << shift,
+					  PCA995X_LED_ON << shift);
+	case LED_OFF:
+		return regmap_update_bits(chip->regmap, ledout_addr,
+					  PCA995X_LDRX_MASK << shift, 0);
+	default:
+		/* Adjust brightness as per user input by changing individual PWM */
+		ret = regmap_write(chip->regmap, pwmout_addr, brightness);
+		if (ret)
+			return ret;
+
+		/*
+		 * Change LDRx configuration to individual brightness via PWM.
+		 * Led will stop blinking if it's doing so
+		 */
+		return regmap_update_bits(chip->regmap, ledout_addr,
+					  PCA995X_LDRX_MASK << shift,
+					  PCA995X_LED_PWM << shift);
+	}
+}
+
+static const struct regmap_config pca995x_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x49,
+};
+
+static int pca995x_probe(struct i2c_client *client)
+{
+	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
+	struct fwnode_handle *np, *child;
+	struct device *dev = &client->dev;
+	struct pca995x_chip *chip;
+	struct pca995x_led *led;
+	int i, btype, reg, ret;
+
+	btype = (unsigned long)device_get_match_data(&client->dev);
+
+	np = dev_fwnode(dev);
+	if (!np)
+		return -ENODEV;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->btype = btype;
+	chip->regmap = devm_regmap_init_i2c(client, &pca995x_regmap);
+	if (IS_ERR(chip->regmap))
+		return PTR_ERR(chip->regmap);
+
+	i2c_set_clientdata(client, chip);
+
+	fwnode_for_each_available_child_node(np, child) {
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
+		}
+
+		if (reg < 0 || reg >= PCA995X_MAX_OUTPUTS || led_fwnodes[reg]) {
+			fwnode_handle_put(child);
+			return -EINVAL;
+		}
+
+		led = &chip->leds[reg];
+		led_fwnodes[reg] = child;
+		led->chip = chip;
+		led->led_no = reg;
+		led->ldev.brightness_set_blocking = pca995x_brightness_set;
+		led->ldev.max_brightness = 255;
+	}
+
+	for (i = 0; i < PCA995X_MAX_OUTPUTS; i++) {
+		struct led_init_data init_data = {};
+
+		if (!led_fwnodes[i])
+			continue;
+
+		init_data.fwnode = led_fwnodes[i];
+
+		ret = devm_led_classdev_register_ext(dev,
+						     &chip->leds[i].ldev,
+						     &init_data);
+		if (ret < 0) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, ret,
+					     "Could not register LED %s\n",
+					     chip->leds[i].ldev.name);
+		}
+	}
+
+	/* Disable LED all-call address and set normal mode */
+	ret = regmap_write(chip->regmap, PCA995X_MODE1, PCA995X_MODE_1_CFG);
+	if (ret)
+		return ret;
+
+	/* IREF Output current value for all LEDn outputs */
+	return regmap_write(chip->regmap,
+			    btype ? PCA9955B_IREFALL : PCA9952_IREFALL,
+			    PCA995X_IREFALL_CFG);
+}
+
+static const struct i2c_device_id pca995x_id[] = {
+	{ "pca9952", .driver_data = (kernel_ulong_t)0 /* non-B chip */ },
+	{ "pca9955b", .driver_data = (kernel_ulong_t)1 /* B-type chip */ },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, pca995x_id);
+
+static const struct of_device_id pca995x_of_match[] = {
+	{ .compatible = "nxp,pca9952",  .data = (void *)0 /* non-B chip */ },
+	{ .compatible = "nxp,pca9955b", .data = (void *)1 /* B-type chip */ },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, pca995x_of_match);
+
+static struct i2c_driver pca995x_driver = {
+	.driver = {
+		.name = "leds-pca995x",
+		.owner = THIS_MODULE,
+		.of_match_table = pca995x_of_match,
+	},
+	.probe = pca995x_probe,
+	.id_table = pca995x_id,
+};
+
+module_i2c_driver(pca995x_driver);
+
+MODULE_AUTHOR("Isai Gaspar <isaiezequiel.gaspar@nxp.com>");
+MODULE_DESCRIPTION("PCA995x LED driver");
+MODULE_LICENSE("GPL");
-- 
2.40.1