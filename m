Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722F52A231E
	for <lists+linux-leds@lfdr.de>; Mon,  2 Nov 2020 03:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgKBCmi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Nov 2020 21:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgKBCmh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Nov 2020 21:42:37 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7D3C0617A6;
        Sun,  1 Nov 2020 18:42:36 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id o129so9804121pfb.1;
        Sun, 01 Nov 2020 18:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7SVckTxVDMTvg/U/qsnaPS1naHIO88EIEopclLYVbf4=;
        b=ke5p0OgH1JXJshBk1ahWSSHor0hTnVb2PFcwO+vNOYKAdY6HKsVvIEUHq4lV3A/UrT
         /DHkREAAxwNnNBaEyy+4nJn628WeVIgIbT+7aQW5U0QaqZ/Hk2cOAOvUa3CAFs1xigzm
         L90VZbCmu7HLU1kIW5gu1PVbLJeJRCGe2xkMklftWjBgBZqYXqN9VNEAeYrakf/yvkM2
         Fa9HXtGcb9BPi+ZBcaC9mIAKXWFXMjgOaL4P5Ej6xWDvG8xAhlkwtewdkZuSSgimKCRB
         14MGOCN8WFtZ8AgaZZyIm5f3Hxbg/X+9a9i2m1XbeTDmrG1A/skEQQ7Uj5WJOCcwI0Ox
         5TNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7SVckTxVDMTvg/U/qsnaPS1naHIO88EIEopclLYVbf4=;
        b=V7QqCfGP7N/FXcRjSYa8DsOSc8xyLr5wOsH8OJR69FfngDQ6yJ0N4xXuyJ9X1L3w7L
         O+a/oQd9Vk7E+YUtBda5eMCexC3XmZYiMfrmXJTDeujfBPX8u2PSjStgIhhom8NH8wYU
         UU0uFPuitzTFihvzNeEhYzDl0te0AQZeDsU1UvWLrAoZYQ+mcE28gQVAd3ZY1Erxh00o
         cxmi9aEz+0j0/yxwZwuXVZ2430xj/hPwNqMDggV3cDBFdo2zi3sO47YlDVhHXz171oYY
         mIgke7s1khvgUjjpcL0rqY0oUBC1J6JFJac0cnT0PkCMhC/otdr4QkY0/17tnCgWk56I
         7U6A==
X-Gm-Message-State: AOAM531vMdDmDmTXiXRbaG74xz7zlJl/3rUhvw1erDu1VlsZU91cFFGh
        oKskvkS/tk43fS0HhhroXBRJrluXf7Y=
X-Google-Smtp-Source: ABdhPJxCEKV8oBVicvHq4ZJ07S//j8+3yjUmBiWuFnNoGtM+FvGsy1x6exnAyErBwM1s9TL0ddzw+Q==
X-Received: by 2002:a17:90a:73c9:: with SMTP id n9mr15116695pjk.90.1604284955440;
        Sun, 01 Nov 2020 18:42:35 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57c:483e:4828:fb14:ce19:d9d0])
        by smtp.gmail.com with ESMTPSA id kr14sm10123441pjb.26.2020.11.01.18.42.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Nov 2020 18:42:34 -0800 (PST)
From:   cy_huang <u0084500@gmail.com>
To:     pavel@ucw.cz, dmurphy@ti.com, robh+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        cy_huang@richtek.com, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505 flash LED controller
Date:   Mon,  2 Nov 2020 10:42:25 +0800
Message-Id: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add support for RT4505 flash LED controller. It can support up to 1.5A
flash current with hardware timeout and low input voltage protection.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Changes since v1 to v2

- Create flash directory into drvers/leds.
- Coding style fix to meet 80 charactors per line limit.
- Refine the description in the Kconfig help text.
- Change all descriptions for 'led' text to uppercase 'LED'.

---
 drivers/leds/Kconfig             |   2 +
 drivers/leds/Makefile            |   3 +
 drivers/leds/flash/Kconfig       |  17 ++
 drivers/leds/flash/Makefile      |   2 +
 drivers/leds/flash/leds-rt4505.c | 430 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 454 insertions(+)
 create mode 100644 drivers/leds/flash/Kconfig
 create mode 100644 drivers/leds/flash/Makefile
 create mode 100644 drivers/leds/flash/leds-rt4505.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 849d3c5..e4ad5ab 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -30,6 +30,8 @@ config LEDS_CLASS_FLASH
 	  for the flash related features of a LED device. It can be built
 	  as a module.
 
+source "drivers/leds/flash/Kconfig"
+
 config LEDS_CLASS_MULTICOLOR
 	tristate "LED Multicolor Class Support"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 73e603e..1564a83 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -103,5 +103,8 @@ obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
 # LED Userspace Drivers
 obj-$(CONFIG_LEDS_USER)			+= uleds.o
 
+# LED Flash Drivers
+obj-y					+= flash/
+
 # LED Triggers
 obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
new file mode 100644
index 00000000..df32764
--- /dev/null
+++ b/drivers/leds/flash/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "LED Flash Chip support"
+	depends on LEDS_CLASS_FLASH
+
+config LEDS_RT4505
+	tristate "LED support for RT4505 flashlight controller"
+	depends on I2C && OF
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	select REGMAP_I2C
+	help
+	  This option enables support for the RT4505 flash LED controller.
+	  RT4505 includes torch and flash functions with programmable current.
+	  And it's commonly used to compensate the illuminance for the camera
+	  inside the mobile product like as phones or tablets.
+
+endmenu
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
new file mode 100644
index 00000000..1b2eded
--- /dev/null
+++ b/drivers/leds/flash/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_LEDS_RT4505)		+= leds-rt4505.o
diff --git a/drivers/leds/flash/leds-rt4505.c b/drivers/leds/flash/leds-rt4505.c
new file mode 100644
index 00000000..ee129ab
--- /dev/null
+++ b/drivers/leds/flash/leds-rt4505.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitops.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/led-class-flash.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <media/v4l2-flash-led-class.h>
+
+#define RT4505_REG_RESET	0x0
+#define RT4505_REG_CONFIG	0x8
+#define RT4505_REG_ILED		0x9
+#define RT4505_REG_ENABLE	0xA
+#define RT4505_REG_FLAGS	0xB
+
+#define RT4505_RESET_MASK	BIT(7)
+#define RT4505_FLASHTO_MASK	GENMASK(2, 0)
+#define RT4505_ITORCH_MASK	GENMASK(7, 5)
+#define RT4505_ITORCH_SHIFT	5
+#define RT4505_IFLASH_MASK	GENMASK(4, 0)
+#define RT4505_ENABLE_MASK	GENMASK(5, 0)
+#define RT4505_TORCH_SET	(BIT(0) | BIT(4))
+#define RT4505_FLASH_SET	(BIT(0) | BIT(1) | BIT(2) | BIT(4))
+#define RT4505_EXT_FLASH_SET	(BIT(0) | BIT(1) | BIT(4) | BIT(5))
+#define RT4505_FLASH_GET	(BIT(0) | BIT(1) | BIT(4))
+#define RT4505_OVP_MASK		BIT(3)
+#define RT4505_SHORT_MASK	BIT(2)
+#define RT4505_OTP_MASK		BIT(1)
+#define RT4505_TIMEOUT_MASK	BIT(0)
+
+#define RT4505_ITORCH_MINUA	46000
+#define RT4505_ITORCH_MAXUA	375000
+#define RT4505_ITORCH_STPUA	47000
+#define RT4505_IFLASH_MINUA	93750
+#define RT4505_IFLASH_MAXUA	1500000
+#define RT4505_IFLASH_STPUA	93750
+#define RT4505_FLASHTO_MINUS	100000
+#define RT4505_FLASHTO_MAXUS	800000
+#define RT4505_FLASHTO_STPUS	100000
+
+struct rt4505_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex lock;
+	struct led_classdev_flash flash;
+	struct v4l2_flash *v4l2_flash;
+};
+
+static int rt4505_torch_brightness_set(struct led_classdev *lcdev,
+				       enum led_brightness level)
+{
+	struct rt4505_priv *priv =
+		container_of(lcdev, struct rt4505_priv, flash.led_cdev);
+	u32 val = 0;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	if (level != LED_OFF) {
+		ret = regmap_update_bits(priv->regmap,
+					 RT4505_REG_ILED, RT4505_ITORCH_MASK,
+					 (level - 1) << RT4505_ITORCH_SHIFT);
+		if (ret)
+			goto unlock;
+
+		val = RT4505_TORCH_SET;
+	}
+
+	ret = regmap_update_bits(priv->regmap, RT4505_REG_ENABLE,
+				 RT4505_ENABLE_MASK, val);
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static enum led_brightness rt4505_torch_brightness_get(
+						struct led_classdev *lcdev)
+{
+	struct rt4505_priv *priv =
+		container_of(lcdev, struct rt4505_priv, flash.led_cdev);
+	u32 val;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = regmap_read(priv->regmap, RT4505_REG_ENABLE, &val);
+	if (ret) {
+		dev_err(lcdev->dev, "Failed to get LED enable\n");
+		ret = LED_OFF;
+		goto unlock;
+	}
+
+	if ((val & RT4505_ENABLE_MASK) != RT4505_TORCH_SET) {
+		ret = LED_OFF;
+		goto unlock;
+	}
+
+	ret = regmap_read(priv->regmap, RT4505_REG_ILED, &val);
+	if (ret) {
+		dev_err(lcdev->dev, "Failed to get LED brightness\n");
+		ret = LED_OFF;
+		goto unlock;
+	}
+
+	ret = ((val & RT4505_ITORCH_MASK) >> RT4505_ITORCH_SHIFT) + 1;
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int rt4505_flash_brightness_set(struct led_classdev_flash *fled_cdev,
+				       u32 brightness)
+{
+	struct rt4505_priv *priv =
+		container_of(fled_cdev, struct rt4505_priv, flash);
+	struct led_flash_setting *s = &fled_cdev->brightness;
+	u32 val = (brightness - s->min) / s->step;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = regmap_update_bits(priv->regmap, RT4505_REG_ILED,
+				 RT4505_IFLASH_MASK, val);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int rt4505_flash_strobe_set(struct led_classdev_flash *fled_cdev,
+				   bool state)
+{
+	struct rt4505_priv *priv =
+		container_of(fled_cdev, struct rt4505_priv, flash);
+	u32 val = state ? RT4505_FLASH_SET : 0;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = regmap_update_bits(priv->regmap, RT4505_REG_ENABLE,
+				 RT4505_ENABLE_MASK, val);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int rt4505_flash_strobe_get(struct led_classdev_flash *fled_cdev,
+				   bool *state)
+{
+	struct rt4505_priv *priv =
+		container_of(fled_cdev, struct rt4505_priv, flash);
+	u32 val;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = regmap_read(priv->regmap, RT4505_REG_ENABLE, &val);
+	if (ret)
+		goto unlock;
+
+	*state = (val & RT4505_FLASH_GET) == RT4505_FLASH_GET;
+
+unlock:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int rt4505_flash_timeout_set(struct led_classdev_flash *fled_cdev,
+				    u32 timeout)
+{
+	struct rt4505_priv *priv =
+		container_of(fled_cdev, struct rt4505_priv, flash);
+	struct led_flash_setting *s = &fled_cdev->timeout;
+	u32 val = (timeout - s->min) / s->step;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = regmap_update_bits(priv->regmap, RT4505_REG_CONFIG,
+				 RT4505_FLASHTO_MASK, val);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int rt4505_fault_get(struct led_classdev_flash *fled_cdev, u32 *fault)
+{
+	struct rt4505_priv *priv =
+		container_of(fled_cdev, struct rt4505_priv, flash);
+	u32 val, led_faults = 0;
+	int ret;
+
+	ret = regmap_read(priv->regmap, RT4505_REG_FLAGS, &val);
+	if (ret)
+		return ret;
+
+	if (val & RT4505_OVP_MASK)
+		led_faults |= LED_FAULT_OVER_VOLTAGE;
+
+	if (val & RT4505_SHORT_MASK)
+		led_faults |= LED_FAULT_SHORT_CIRCUIT;
+
+	if (val & RT4505_OTP_MASK)
+		led_faults |= LED_FAULT_OVER_TEMPERATURE;
+
+	if (val & RT4505_TIMEOUT_MASK)
+		led_faults |= LED_FAULT_TIMEOUT;
+
+	*fault = led_faults;
+	return 0;
+}
+
+static const struct led_flash_ops rt4505_flash_ops = {
+	.flash_brightness_set = rt4505_flash_brightness_set,
+	.strobe_set = rt4505_flash_strobe_set,
+	.strobe_get = rt4505_flash_strobe_get,
+	.timeout_set = rt4505_flash_timeout_set,
+	.fault_get = rt4505_fault_get,
+};
+
+static bool rt4505_is_accessible_reg(struct device *dev, unsigned int reg)
+{
+	if (reg == RT4505_REG_RESET ||
+		(reg >= RT4505_REG_CONFIG && reg <= RT4505_REG_FLAGS))
+		return true;
+	return false;
+}
+
+static const struct regmap_config rt4505_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = RT4505_REG_FLAGS,
+
+	.readable_reg = rt4505_is_accessible_reg,
+	.writeable_reg = rt4505_is_accessible_reg,
+};
+
+#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
+static int rt4505_flash_external_strobe_set(struct v4l2_flash *v4l2_flash,
+					    bool enable)
+{
+	struct led_classdev_flash *flash = v4l2_flash->fled_cdev;
+	struct rt4505_priv *priv =
+		container_of(flash, struct rt4505_priv, flash);
+	u32 val = enable ? RT4505_EXT_FLASH_SET : 0;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = regmap_update_bits(priv->regmap, RT4505_REG_ENABLE,
+				 RT4505_ENABLE_MASK, val);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static const struct v4l2_flash_ops v4l2_flash_ops = {
+	.external_strobe_set = rt4505_flash_external_strobe_set,
+};
+
+static void rt4505_init_v4l2_config(struct rt4505_priv *priv,
+				    struct v4l2_flash_config *config)
+{
+	struct led_classdev_flash *flash = &priv->flash;
+	struct led_classdev *lcdev = &flash->led_cdev;
+	struct led_flash_setting *s;
+
+	strscpy(config->dev_name, lcdev->dev->kobj.name,
+		sizeof(config->dev_name));
+
+	s = &config->intensity;
+	s->min = RT4505_ITORCH_MINUA;
+	s->step = RT4505_ITORCH_STPUA;
+	s->max = s->val = s->min + (lcdev->max_brightness - 1) * s->step;
+
+	config->flash_faults = LED_FAULT_OVER_VOLTAGE |
+			       LED_FAULT_SHORT_CIRCUIT |
+			       LED_FAULT_LED_OVER_TEMPERATURE |
+			       LED_FAULT_TIMEOUT;
+	config->has_external_strobe = 1;
+}
+#else
+static const struct v4l2_flash_ops v4l2_flash_ops;
+static void rt4505_init_v4l2_config(struct rt4505_priv *priv,
+				    struct v4l2_flash_config *config)
+{
+}
+#endif
+
+static void rt4505_init_flash_properties(struct rt4505_priv *priv,
+					 struct fwnode_handle *child)
+{
+	struct led_classdev_flash *flash = &priv->flash;
+	struct led_classdev *lcdev = &flash->led_cdev;
+	struct led_flash_setting *s;
+	u32 val;
+	int ret;
+
+	ret = fwnode_property_read_u32(child, "led-max-microamp", &val);
+	if (ret) {
+		dev_warn(priv->dev, "led-max-microamp DT property missing\n");
+		val = RT4505_ITORCH_MINUA;
+	} else
+		val = clamp_val(val, RT4505_ITORCH_MINUA, RT4505_ITORCH_MAXUA);
+
+	lcdev->max_brightness =
+		(val - RT4505_ITORCH_MINUA) / RT4505_ITORCH_STPUA + 1;
+	lcdev->brightness_set_blocking = rt4505_torch_brightness_set;
+	lcdev->brightness_get = rt4505_torch_brightness_get;
+	lcdev->flags |= LED_DEV_CAP_FLASH;
+
+	ret = fwnode_property_read_u32(child, "flash-max-microamp", &val);
+	if (ret) {
+		dev_warn(priv->dev, "flash-max-microamp DT property missing\n");
+		val = RT4505_IFLASH_MINUA;
+	} else
+		val = clamp_val(val, RT4505_IFLASH_MINUA, RT4505_IFLASH_MAXUA);
+
+	s = &flash->brightness;
+	s->min = RT4505_IFLASH_MINUA;
+	s->step = RT4505_IFLASH_STPUA;
+	s->max = s->val = val;
+
+	ret = fwnode_property_read_u32(child, "flash-max-timeout-us", &val);
+	if (ret) {
+		dev_warn(priv->dev,
+			 "flash-max-timeout-us DT property missing\n");
+		val = RT4505_FLASHTO_MINUS;
+	} else
+		val = clamp_val(val, RT4505_FLASHTO_MINUS,
+				RT4505_FLASHTO_MAXUS);
+
+	s = &flash->timeout;
+	s->min = RT4505_FLASHTO_MINUS;
+	s->step = RT4505_FLASHTO_STPUS;
+	s->max = s->val = val;
+
+	flash->ops = &rt4505_flash_ops;
+}
+
+static int rt4505_probe(struct i2c_client *client)
+{
+	struct rt4505_priv *priv;
+	struct fwnode_handle *child;
+	struct led_init_data init_data = {};
+	struct v4l2_flash_config v4l2_config = {};
+	int ret;
+
+	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &client->dev;
+	mutex_init(&priv->lock);
+
+	priv->regmap = devm_regmap_init_i2c(client, &rt4505_regmap_config);
+	if (IS_ERR(priv->regmap)) {
+		dev_err(priv->dev, "Failed to allocate register map\n");
+		return PTR_ERR(priv->regmap);
+	}
+
+	ret = regmap_write(priv->regmap, RT4505_REG_RESET, RT4505_RESET_MASK);
+	if (ret) {
+		dev_err(priv->dev, "Failed to reset registers\n");
+		return ret;
+	}
+
+	child = fwnode_get_next_available_child_node(client->dev.fwnode, NULL);
+	if (!child) {
+		dev_err(priv->dev, "Failed to get child node\n");
+		return -EINVAL;
+	}
+	init_data.fwnode = child;
+
+	rt4505_init_flash_properties(priv, child);
+	ret = devm_led_classdev_flash_register_ext(priv->dev, &priv->flash,
+						   &init_data);
+	if (ret) {
+		dev_err(priv->dev, "Failed to register flash\n");
+		return ret;
+	}
+
+	rt4505_init_v4l2_config(priv, &v4l2_config);
+	priv->v4l2_flash = v4l2_flash_init(priv->dev, init_data.fwnode,
+					   &priv->flash, &v4l2_flash_ops,
+					   &v4l2_config);
+	if (IS_ERR(priv->v4l2_flash)) {
+		dev_err(priv->dev, "Failed to register v4l2 flash\n");
+		return PTR_ERR(priv->v4l2_flash);
+	}
+
+	i2c_set_clientdata(client, priv);
+	return 0;
+}
+
+static int rt4505_remove(struct i2c_client *client)
+{
+	struct rt4505_priv *priv = i2c_get_clientdata(client);
+
+	v4l2_flash_release(priv->v4l2_flash);
+	return 0;
+}
+
+static void rt4505_shutdown(struct i2c_client *client)
+{
+	struct rt4505_priv *priv = i2c_get_clientdata(client);
+
+	/* Reset registers to make sure all off before shutdown */
+	regmap_write(priv->regmap, RT4505_REG_RESET, RT4505_RESET_MASK);
+}
+
+static const struct of_device_id __maybe_unused rt4505_leds_match[] = {
+	{ .compatible = "richtek,rt4505", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt4505_leds_match);
+
+static struct i2c_driver rt4505_driver = {
+	.driver = {
+		.name = "rt4505",
+		.of_match_table = of_match_ptr(rt4505_leds_match),
+	},
+	.probe_new = rt4505_probe,
+	.remove = rt4505_remove,
+	.shutdown = rt4505_shutdown,
+};
+module_i2c_driver(rt4505_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

