Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 365E128AFA
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 21:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388114AbfEWTv2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 15:51:28 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56300 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731843AbfEWTIn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 15:08:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NJ8cHu092494;
        Thu, 23 May 2019 14:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558638518;
        bh=K0QUxADDhzWMhFnBQF79VmvK/sQNpf3Di4j9Sp4aFeI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=A0sngGmGOJtfXhCysb9DhMe8dy+DY64nFF9jrkOBdh4VbJUGJrqMNa72HH32LT7/C
         tfMHZ9PnCC50U9coQ1b99P4+oV9EkqWaugdrofVyLTliEvtc6dTE2W/LziL9qTxvDN
         1+p9jQhoAMsLfkhvTBV283EnP4oHatR09+OvQjK0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NJ8cPC079038
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 May 2019 14:08:38 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 14:08:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 14:08:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NJ8bHJ095922;
        Thu, 23 May 2019 14:08:37 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 6/9] leds: multicolor: Introduce a multicolor class definition
Date:   Thu, 23 May 2019 14:08:17 -0500
Message-ID: <20190523190820.29375-7-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190523190820.29375-1-dmurphy@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce a multicolor class that groups colored LEDs
within a LED node.

The framework allows for dynamically setting individual LEDs
or setting brightness levels of LEDs and updating them virtually
simultaneously.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig                 |  10 +
 drivers/leds/Makefile                |   1 +
 drivers/leds/led-class-multicolor.c  | 421 +++++++++++++++++++++++++++
 include/linux/led-class-multicolor.h |  95 ++++++
 4 files changed, 527 insertions(+)
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 include/linux/led-class-multicolor.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 0414adebb177..0696a13c9527 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -29,6 +29,16 @@ config LEDS_CLASS_FLASH
 	  for the flash related features of a LED device. It can be built
 	  as a module.
 
+config LEDS_CLASS_MULTI_COLOR
+	tristate "LED Mulit Color LED Class Support"
+	depends on LEDS_CLASS
+	help
+	  This option enables the multicolor LED sysfs class in /sys/class/leds.
+	  It wraps LED Class and adds multicolor LED specific sysfs attributes
+	  and kernel internal API to it. You'll need this to provide support
+	  for multicolor LEDs that are grouped together. This class is not
+	  intended for single color LEDs.  It can be built as a module.
+
 config LEDS_BRIGHTNESS_HW_CHANGED
 	bool "LED Class brightness_hw_changed attribute support"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4c1b0054f379..c57c2aec9510 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -4,6 +4,7 @@
 obj-$(CONFIG_NEW_LEDS)			+= led-core.o
 obj-$(CONFIG_LEDS_CLASS)		+= led-class.o
 obj-$(CONFIG_LEDS_CLASS_FLASH)		+= led-class-flash.o
+obj-$(CONFIG_LEDS_CLASS_MULTI_COLOR)	+= led-class-multicolor.o
 obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
 
 # LED Platform Drivers
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
new file mode 100644
index 000000000000..3f989e552d09
--- /dev/null
+++ b/drivers/leds/led-class-multicolor.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0
+// LED Multi Color class interface
+// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include "leds.h"
+
+struct led_classdev_mc_priv {
+	struct led_classdev_mc *mcled_cdev;
+
+	struct device_attribute max_brightness_attr;
+	struct device_attribute brightness_attr;
+
+	enum led_brightness max_brightness;
+	enum led_brightness brightness;
+	enum led_brightness new_brightness;
+	struct list_head list;
+
+	int color_id;
+};
+
+static ssize_t sync_store(struct device *dev,
+			  struct device_attribute *sync_attr,
+			  const char *buf, size_t size)
+{
+	struct led_classdev_mc_data *data = container_of(sync_attr,
+						    struct led_classdev_mc_data,
+						      sync_attr);
+	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
+	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
+	struct led_classdev_mc_priv *priv;
+	unsigned long sync_value;
+	ssize_t ret = -EINVAL;
+
+	mutex_lock(&led_cdev->led_access);
+
+	if (!mcled_cdev->sync_enabled)
+		goto unlock;
+
+	ret = kstrtoul(buf, 0, &sync_value);
+	if (ret)
+		goto unlock;
+
+	if (!sync_value) {
+		ret = size;
+		goto unlock;
+	}
+
+	list_for_each_entry(priv, &data->color_list, list)
+		priv->brightness = priv->new_brightness;
+
+	ret = size;
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+
+static ssize_t sync_enable_store(struct device *dev,
+				 struct device_attribute *sync_enable_attr,
+				 const char *buf, size_t size)
+{
+	struct led_classdev_mc_data *data = container_of(sync_enable_attr,
+						    struct led_classdev_mc_data,
+						      sync_enable_attr);
+	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
+	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
+	unsigned long sync_value;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	ret = kstrtoul(buf, 0, &sync_value);
+	if (ret)
+		goto unlock;
+
+	mcled_cdev->sync_enabled = sync_value;
+
+	ret = size;
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+
+static ssize_t sync_enable_show(struct device *dev,
+				struct device_attribute *sync_enable_attr,
+				char *buf)
+{
+	struct led_classdev_mc_data *data = container_of(sync_enable_attr,
+						    struct led_classdev_mc_data,
+						      sync_enable_attr);
+	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
+
+	return sprintf(buf, "%d\n", mcled_cdev->sync_enabled);
+}
+
+static ssize_t brightness_store(struct device *dev,
+				struct device_attribute *brightness_attr,
+				const char *buf, size_t size)
+{
+	struct led_classdev_mc_priv *priv = container_of(brightness_attr,
+						    struct led_classdev_mc_priv,
+						      brightness_attr);
+	struct led_classdev *led_cdev = &priv->mcled_cdev->led_cdev;
+	struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
+
+	unsigned long value;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	ret = kstrtoul(buf, 10, &value);
+	if (ret)
+		goto unlock;
+
+	if (value > priv->max_brightness) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	priv->new_brightness = value;
+
+	if (priv->mcled_cdev->sync_enabled) {
+		ret = size;
+		goto unlock;
+	}
+
+	ret = ops->set_color_brightness(priv->mcled_cdev,
+					priv->color_id, value);
+	if (ret < 0)
+		goto unlock;
+
+	priv->brightness = priv->new_brightness;
+
+	ret = size;
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+
+static ssize_t brightness_show(struct device *dev,
+			      struct device_attribute *brightness_attr,
+			      char *buf)
+{
+	struct led_classdev_mc_priv *priv = container_of(brightness_attr,
+						    struct led_classdev_mc_priv,
+						      brightness_attr);
+	const struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
+	int value = 0;
+
+	if (priv->mcled_cdev->sync_enabled) {
+		value = priv->brightness;
+		goto sync_enabled;
+	}
+
+	if (ops->get_color_brightness) {
+		value = ops->get_color_brightness(priv->mcled_cdev,
+						  priv->color_id);
+		priv->brightness = value;
+	} else {
+		value = priv->brightness;
+	}
+
+sync_enabled:
+	return sprintf(buf, "%d\n", value);
+}
+
+static ssize_t max_brightness_show(struct device *dev,
+				   struct device_attribute *max_brightness_attr,
+				   char *buf)
+{
+	struct led_classdev_mc_priv *priv = container_of(max_brightness_attr,
+						    struct led_classdev_mc_priv,
+						      max_brightness_attr);
+
+	return sprintf(buf, "%d\n", priv->max_brightness);
+}
+
+static int multicolor_set_brightness(struct led_classdev *led_cdev,
+			     enum led_brightness brightness)
+{
+	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
+	struct led_classdev_mc_data *data = mcled_cdev->data;
+	struct led_multicolor_ops *ops = mcled_cdev->ops;
+	struct led_classdev_mc_priv *priv;
+	unsigned long state = brightness;
+	int adj_value;
+	ssize_t ret = -EINVAL;
+
+	mutex_lock(&led_cdev->led_access);
+
+	if (ops->set_module_brightness) {
+		ret = ops->set_module_brightness(mcled_cdev, state);
+		goto unlock;
+	}
+
+	list_for_each_entry(priv, &data->color_list, list) {
+		if (state && priv->brightness && priv->max_brightness) {
+			adj_value = state * ((priv->brightness * 100) / priv->max_brightness);
+			adj_value = adj_value / 100;
+		} else
+			adj_value = LED_OFF;
+
+		ret = ops->set_color_brightness(priv->mcled_cdev,
+						priv->color_id,	adj_value);
+		if (ret < 0)
+			goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+
+static int led_multicolor_init_color(struct led_classdev_mc_data *data,
+				     struct led_classdev_mc *mcled_cdev,
+				     int color_id)
+{
+	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
+	struct led_classdev_mc_priv *mc_priv;
+	int ret;
+
+	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
+	if (!mc_priv)
+		return -ENOMEM;
+
+	mc_priv->color_id = color_id;
+	mc_priv->mcled_cdev = mcled_cdev;
+
+	data->led_kobj = kobject_create_and_add(led_colors[color_id],
+						data->color_kobj);
+	if (!data->led_kobj)
+		return -EINVAL;
+
+	sysfs_attr_init(&mc_priv->brightness_attr.attr);
+	mc_priv->brightness_attr.attr.name = "brightness";
+	mc_priv->brightness_attr.attr.mode = S_IRUGO | S_IWUGO;
+	mc_priv->brightness_attr.store = brightness_store;
+	mc_priv->brightness_attr.show = brightness_show;
+	ret = sysfs_create_file(data->led_kobj,
+				&mc_priv->brightness_attr.attr);
+	if (ret)
+		goto err_out;
+
+	sysfs_attr_init(&mc_priv->max_brightness_attr.attr);
+	mc_priv->max_brightness_attr.attr.name = "max_brightness";
+	mc_priv->max_brightness_attr.attr.mode = S_IRUGO;
+	mc_priv->max_brightness_attr.show = max_brightness_show;
+	ret = sysfs_create_file(data->led_kobj,
+				&mc_priv->max_brightness_attr.attr);
+	if (ret)
+		goto err_out;
+
+	mc_priv->max_brightness = LED_FULL;
+	list_add_tail(&mc_priv->list, &data->color_list);
+
+err_out:
+	return ret;
+}
+
+static int led_multicolor_init_color_dir(struct led_classdev_mc_data *data,
+					 struct led_classdev_mc *mcled_cdev)
+{
+	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
+	int ret;
+
+	data->color_kobj = kobject_create_and_add("colors",
+						  &led_cdev->dev->kobj);
+	if (!data->color_kobj)
+		return -EINVAL;
+
+	sysfs_attr_init(&data->sync_enable_attr.attr);
+	data->sync_enable_attr.attr.name = "sync_enable";
+	data->sync_enable_attr.attr.mode = S_IRUGO | S_IWUGO;
+	data->sync_enable_attr.show = sync_enable_show;
+	data->sync_enable_attr.store = sync_enable_store;
+	ret = sysfs_create_file(data->color_kobj,
+				&data->sync_enable_attr.attr);
+	if (ret)
+		goto err_out;
+
+	sysfs_attr_init(&data->sync_attr.attr);
+	data->sync_attr.attr.name = "sync";
+	data->sync_attr.attr.mode = S_IWUGO;
+	data->sync_attr.store = sync_store;
+	ret = sysfs_create_file(data->color_kobj,
+				&data->sync_attr.attr);
+	if (ret)
+		goto err_out;
+
+	data->mcled_cdev = mcled_cdev;
+err_out:
+	return ret;
+}
+
+int led_classdev_multicolor_register_ext(struct device *parent,
+				     struct led_classdev_mc *mcled_cdev,
+				     struct led_init_data *init_data)
+{
+	struct led_classdev *led_cdev;
+	struct led_multicolor_ops *ops;
+	struct led_classdev_mc_data *data;
+	int ret;
+	int i;
+
+	if (!mcled_cdev)
+		return -EINVAL;
+
+	ops = mcled_cdev->ops;
+	if (!ops || !ops->set_color_brightness)
+		return -EINVAL;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mcled_cdev->data = data;
+	led_cdev = &mcled_cdev->led_cdev;
+
+	if (led_cdev->brightness_set_blocking)
+		led_cdev->brightness_set_blocking = multicolor_set_brightness;
+
+	INIT_LIST_HEAD(&data->color_list);
+
+	/* Register led class device */
+	ret = led_classdev_register_ext(parent, led_cdev, init_data);
+	if (ret)
+		return ret;
+
+	ret = led_multicolor_init_color_dir(data, mcled_cdev);
+	if (ret)
+		return ret;
+
+	/* Select the sysfs attributes to be created for the device */
+	for (i = 0; i < mcled_cdev->num_leds; i++) {
+		ret = led_multicolor_init_color(data, mcled_cdev,
+						mcled_cdev->available_colors[i]);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
+
+void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev)
+{
+	if (!mcled_cdev)
+		return;
+
+	led_classdev_unregister(&mcled_cdev->led_cdev);
+}
+EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
+
+static void devm_led_classdev_multicolor_release(struct device *dev, void *res)
+{
+	led_classdev_multicolor_unregister(*(struct led_classdev_mc **)res);
+}
+
+/**
+ * devm_of_led_classdev_register - resource managed led_classdev_register()
+ *
+ * @parent: parent of LED device
+ * @led_cdev: the led_classdev structure for this device.
+ */
+int devm_led_classdev_multicolor_register(struct device *parent,
+					  struct led_classdev_mc *mcled_cdev)
+{
+	struct led_classdev_mc **dr;
+	int ret;
+
+	dr = devres_alloc(devm_led_classdev_multicolor_release,
+			  sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	ret = led_classdev_multicolor_register(parent, mcled_cdev);
+	if (ret) {
+		devres_free(dr);
+		return ret;
+	}
+
+	*dr = mcled_cdev;
+	devres_add(parent, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register);
+
+static int devm_led_classdev_multicolor_match(struct device *dev,
+					      void *res, void *data)
+{
+	struct mcled_cdev **p = res;
+
+	if (WARN_ON(!p || !*p))
+		return 0;
+
+	return *p == data;
+}
+
+/**
+ * devm_led_classdev_multicolor_unregister() - resource managed
+ *					led_classdev_multicolor_unregister()
+ * @parent: The device to unregister.
+ * @mcled_cdev: the led_classdev_mc structure for this device.
+ */
+void devm_led_classdev_multicolor_unregister(struct device *dev,
+				  struct led_classdev_mc *mcled_cdev)
+{
+	WARN_ON(devres_release(dev,
+			       devm_led_classdev_multicolor_release,
+			       devm_led_classdev_multicolor_match, mcled_cdev));
+}
+EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_unregister);
+
+MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
+MODULE_DESCRIPTION("Multi Color LED class interface");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
new file mode 100644
index 000000000000..f9e71d984b03
--- /dev/null
+++ b/include/linux/led-class-multicolor.h
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* LED Multicolor class interface
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
+#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
+
+#include <linux/leds.h>
+#include <dt-bindings/leds/common.h>
+
+struct led_classdev_mc;
+
+struct led_classdev_mc_data {
+	struct led_classdev_mc *mcled_cdev;
+
+	struct kobject *color_kobj;
+	struct kobject *led_kobj;
+
+	struct device_attribute sync_attr;
+	struct device_attribute sync_enable_attr;
+
+	struct list_head color_list;
+};
+
+struct led_multicolor_ops {
+	/* Set brightness for a specific color id */
+	int (*set_color_brightness)(struct led_classdev_mc *mcled_cdev,
+				    int color_id, int value);
+	/* Read current color setting */
+	int (*get_color_brightness)(struct led_classdev_mc *mcled_cdev,
+				    int color_id);
+	/* Set brightness for the color module */
+	int (*set_module_brightness)(struct led_classdev_mc *mcled_cdev,
+				     int value);
+	/* Read current module brightness */
+	int (*get_module_brightness)(struct led_classdev_mc *mcled_cdev,
+				     int color_id);
+};
+
+struct led_classdev_mc {
+	/* led class device */
+	struct led_classdev led_cdev;
+
+	/* multicolor led specific ops */
+	struct led_multicolor_ops *ops;
+
+	struct led_classdev_mc_data *data;
+
+	u32 available_colors[LED_COLOR_ID_COUNT];
+	int num_leds;
+
+	bool sync_enabled;
+};
+
+static inline struct led_classdev_mc *lcdev_to_mccdev(
+						struct led_classdev *lcdev)
+{
+	return container_of(lcdev, struct led_classdev_mc, led_cdev);
+}
+
+/**
+ * led_classdev_multicolor_register_ext - register a new object of led_classdev
+ *				      class with support for multicolor LEDs
+ * @parent: the multicolor LED to register
+ * @mcled_cdev: the led_classdev_mc structure for this device
+ * @init_data: the LED class Multi color device initialization data
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+extern int led_classdev_multicolor_register_ext(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev,
+					    struct led_init_data *init_data);
+
+#define led_classdev_multicolor_register(parent, mcled_cdev)		\
+	led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL)
+
+/**
+ * led_classdev_multicolor_unregister - unregisters an object of led_classdev
+ *					class with support for multicolor LEDs
+ * @mcled_cdev: the multicolor LED to unregister
+ *
+ * Unregister a previously registered via led_classdev_multicolor_register
+ * object
+ */
+extern void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
+
+extern int devm_led_classdev_multicolor_register(struct device *parent,
+					struct led_classdev_mc *mcled_cdev);
+
+extern void devm_led_classdev_multicolor_unregister(struct device *parent,
+					   struct led_classdev_mc *mcled_cdev);
+
+#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
-- 
2.21.0.5.gaeb582a983

