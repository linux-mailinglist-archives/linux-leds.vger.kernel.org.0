Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C28756EE
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2019 20:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfGYS2s (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Jul 2019 14:28:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55940 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfGYS21 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Jul 2019 14:28:27 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PISNcM018041;
        Thu, 25 Jul 2019 13:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564079303;
        bh=7sgS3m1cyWR+3xDoqks5t8kPmu8zaNgGlxJv40VwGGQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sVNfZquG7j0tFii/0yOLYRJjZ/f8fX7QEY8NJoOzQj5qY2Cx7F616vEFFCMxfQnNS
         O0ATDMXTAPmPEryyk6pwR8EetlaZdnE79qSE1qYOdJUf2pYT6LbKeij87YzVQP5poX
         PQufEuFLG/ZZL+wRLq5d1XGlQwLDs6hrhFlajHO0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PISNUl036945
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jul 2019 13:28:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 13:28:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 13:28:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PISNlZ025738;
        Thu, 25 Jul 2019 13:28:23 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 6/9] leds: multicolor: Introduce a multicolor class definition
Date:   Thu, 25 Jul 2019 13:28:15 -0500
Message-ID: <20190725182818.29556-7-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190725182818.29556-1-dmurphy@ti.com>
References: <20190725182818.29556-1-dmurphy@ti.com>
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
 drivers/leds/led-class-multicolor.c  | 402 +++++++++++++++++++++++++++
 include/linux/led-class-multicolor.h |  96 +++++++
 4 files changed, 509 insertions(+)
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 include/linux/led-class-multicolor.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f7a3dd7ecf3d..7f780d5b8490 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
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
+	  intended for single color LEDs. It can be built as a module.
+
 config LEDS_BRIGHTNESS_HW_CHANGED
 	bool "LED Class brightness_hw_changed attribute support"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 41fb073a39c1..897b810257dd 100644
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
index 000000000000..123443e6d3eb
--- /dev/null
+++ b/drivers/leds/led-class-multicolor.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0
+// LED Multi Color class interface
+// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#include "leds.h"
+
+struct led_classdev_mc_priv {
+	struct led_classdev_mc *mcled_cdev;
+
+	struct device_attribute max_intensity_attr;
+	struct device_attribute intensity_attr;
+	struct device_attribute color_index_attr;
+
+	enum led_brightness max_intensity;
+	enum led_brightness intensity;
+	enum led_brightness new_intensity;
+
+	struct list_head list;
+
+	int color_id;
+	int color_index;
+};
+static int calculate_brightness(int brightness, int intensity, int max_intensity)
+{
+	if (brightness && intensity && max_intensity)
+		return brightness * intensity / max_intensity;
+
+	return LED_OFF;
+}
+
+void set_cluster_brightness(struct led_classdev_mc *mcled_cdev,
+			    enum led_brightness brightness, int adj_value[])
+{
+	struct led_classdev_mc_data *data = mcled_cdev->data;
+	struct led_classdev_mc_priv *priv;
+	int i = 0;
+
+	list_for_each_entry(priv, &data->color_list, list) {
+		adj_value[i] = calculate_brightness(brightness, priv->intensity,
+						    priv->max_intensity);
+		i++;
+	}
+
+	data->cluster_brightness = brightness;
+}
+
+void get_cluster_brightness(struct led_classdev_mc *mcled_cdev,
+				  int brightness_val[])
+{
+	struct led_classdev_mc_data *data = mcled_cdev->data;
+	struct led_classdev_mc_priv *priv;
+	int i = 0;
+
+	list_for_each_entry(priv, &data->color_list, list) {
+		brightness_val[i] = priv->intensity;
+		i++;
+	}
+}
+
+static ssize_t color_index_show(struct device *dev,
+				   struct device_attribute *color_index_attr,
+				   char *buf)
+{
+	struct led_classdev_mc_priv *priv = container_of(color_index_attr,
+						    struct led_classdev_mc_priv,
+						      color_index_attr);
+
+	return sprintf(buf, "%d\n", priv->color_id);
+}
+
+static ssize_t color_mix_store(struct device *dev,
+				struct device_attribute *color_mix_attr,
+				const char *buf, size_t size)
+{
+	struct led_classdev_mc_data *data = container_of(color_mix_attr,
+						    struct led_classdev_mc_data,
+						      color_mix_attr);
+	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
+	const struct led_multicolor_ops *ops = mcled_cdev->ops;
+	struct led_classdev_mc_priv *priv;
+	unsigned int value[LED_COLOR_ID_MAX];
+	int adj_brightness;
+	int nrchars, offset = 0;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < mcled_cdev->num_leds; i++) {
+		ret = sscanf(buf + offset, "%i%n", &value[i], &nrchars);
+		if (ret != 1)
+			break;
+
+		offset += nrchars;
+	}
+
+	if (i != mcled_cdev->num_leds) {
+		for (; i < LED_COLOR_ID_MAX; i++)
+			value[i] = 0;
+	}
+
+	list_for_each_entry(priv, &data->color_list, list) {
+		if (data->cluster_brightness) {
+			adj_brightness = calculate_brightness(data->cluster_brightness,
+							      value[priv->color_index],
+							     priv->max_intensity);
+			ret = ops->set_color_brightness(priv->mcled_cdev,
+							priv->color_id,
+							adj_brightness);
+			if (ret < 0)
+				goto done;
+		}
+
+		priv->intensity = value[priv->color_index];
+	}
+
+done:
+	return size;
+}
+
+static ssize_t intensity_store(struct device *dev,
+				struct device_attribute *intensity_attr,
+				const char *buf, size_t size)
+{
+	struct led_classdev_mc_priv *priv = container_of(intensity_attr,
+						    struct led_classdev_mc_priv,
+						      intensity_attr);
+	struct led_classdev_mc_data *data = priv->mcled_cdev->data;
+	struct led_classdev *led_cdev = priv->mcled_cdev->led_cdev;
+	struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
+	unsigned int adj_value;
+	unsigned long value;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	ret = kstrtoul(buf, 10, &value);
+	if (ret)
+		goto unlock;
+
+	if (value > priv->max_intensity) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	priv->new_intensity = value;
+
+	if (data->cluster_brightness) {
+		adj_value = calculate_brightness(data->cluster_brightness,
+					priv->new_intensity,
+					priv->max_intensity);
+		ret = ops->set_color_brightness(priv->mcled_cdev,
+						priv->color_id, adj_value);
+		if (ret < 0) {
+			priv->new_intensity = priv->intensity;
+			goto unlock;
+		}
+	}
+
+	priv->intensity = priv->new_intensity;
+	ret = size;
+
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+
+static ssize_t intensity_show(struct device *dev,
+			      struct device_attribute *intensity_attr,
+			      char *buf)
+{
+	struct led_classdev_mc_priv *priv = container_of(intensity_attr,
+						    struct led_classdev_mc_priv,
+						      intensity_attr);
+	const struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
+	int value = 0;
+
+	if (ops->get_color_brightness) {
+		value = ops->get_color_brightness(priv->mcled_cdev,
+						  priv->color_id);
+		priv->intensity = value;
+	} else {
+		value = priv->intensity;
+	}
+
+	return sprintf(buf, "%d\n", value);
+}
+
+static ssize_t max_intensity_show(struct device *dev,
+				   struct device_attribute *max_intensity_attr,
+				   char *buf)
+{
+	struct led_classdev_mc_priv *priv = container_of(max_intensity_attr,
+						    struct led_classdev_mc_priv,
+						      max_intensity_attr);
+
+	return sprintf(buf, "%d\n", priv->max_intensity);
+}
+
+static int led_multicolor_init_color(struct led_classdev_mc_data *data,
+				     struct led_classdev_mc *mcled_cdev,
+				     int color_id, int color_index)
+{
+	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
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
+	sysfs_attr_init(&mc_priv->intensity_attr.attr);
+	mc_priv->intensity_attr.attr.name = "intensity";
+	mc_priv->intensity_attr.attr.mode = S_IRUGO | S_IWUGO;
+	mc_priv->intensity_attr.store = intensity_store;
+	mc_priv->intensity_attr.show = intensity_show;
+	ret = sysfs_create_file(data->led_kobj,
+				&mc_priv->intensity_attr.attr);
+	if (ret)
+		goto err_out;
+
+	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
+	mc_priv->max_intensity_attr.attr.name = "max_intensity";
+	mc_priv->max_intensity_attr.attr.mode = S_IRUGO;
+	mc_priv->max_intensity_attr.show = max_intensity_show;
+	ret = sysfs_create_file(data->led_kobj,
+				&mc_priv->max_intensity_attr.attr);
+	if (ret)
+		goto err_out;
+
+	sysfs_attr_init(&mc_priv->color_index_attr.attr);
+	mc_priv->color_index_attr.attr.name = "color_id";
+	mc_priv->color_index_attr.attr.mode = S_IRUGO;
+	mc_priv->color_index_attr.show = color_index_show;
+	ret = sysfs_create_file(data->led_kobj,
+				&mc_priv->color_index_attr.attr);
+	if (ret)
+		goto err_out;
+
+	mc_priv->max_intensity = LED_FULL;
+	mc_priv->color_index = color_index;
+	list_add_tail(&mc_priv->list, &data->color_list);
+
+err_out:
+	return ret;
+}
+
+static int led_multicolor_init_color_dir(struct led_classdev_mc_data *data,
+					 struct led_classdev_mc *mcled_cdev)
+{
+	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
+	u32 color_id;
+	int ret;
+	int i, j = 0;
+
+	data->color_kobj = kobject_create_and_add("colors",
+						  &led_cdev->dev->kobj);
+	if (!data->color_kobj)
+		return -EINVAL;
+
+	data->mcled_cdev = mcled_cdev;
+
+	for (i = 0; i < LED_COLOR_ID_MAX; i++) {
+		color_id = (mcled_cdev->available_colors & (1 << i));
+		if (color_id) {
+			ret = led_multicolor_init_color(data, mcled_cdev, i, j);
+			if (ret)
+				break;
+
+			j++;
+		}
+	}
+
+	sysfs_attr_init(&data->color_mix_attr.attr);
+	data->color_mix_attr.attr.name = "color_mix";
+	data->color_mix_attr.attr.mode = S_IRUGO | S_IWUGO;
+	data->color_mix_attr.store = color_mix_store;
+	ret = sysfs_create_file(data->color_kobj,
+				&data->color_mix_attr.attr);
+
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
+	led_cdev = mcled_cdev->led_cdev;
+	INIT_LIST_HEAD(&data->color_list);
+
+	/* Register led class device */
+	ret = led_classdev_register_ext(parent, led_cdev, init_data);
+	if (ret)
+		return ret;
+
+	return led_multicolor_init_color_dir(data, mcled_cdev);
+}
+EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
+
+void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev)
+{
+	if (!mcled_cdev)
+		return;
+
+	led_classdev_unregister(mcled_cdev->led_cdev);
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
index 000000000000..082883606246
--- /dev/null
+++ b/include/linux/led-class-multicolor.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+	struct device_attribute color_mix_attr;
+
+	struct list_head color_list;
+
+	enum led_brightness cluster_brightness;
+};
+
+struct led_multicolor_ops {
+	/* Set brightness for a specific color id */
+	int (*set_color_brightness)(struct led_classdev_mc *mcled_cdev,
+				    int color_id, int value);
+	/* Read current color setting */
+	int (*get_color_brightness)(struct led_classdev_mc *mcled_cdev,
+				    int color_id);
+};
+
+struct led_classdev_mc {
+	/* led class device */
+	struct led_classdev *led_cdev;
+
+	/* multicolor led specific ops */
+	struct led_multicolor_ops *ops;
+
+	struct led_classdev_mc_data *data;
+
+	u32 available_colors;
+	int num_leds;
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
+/* Set brightness for the monochrome LED cluster */
+extern void set_cluster_brightness(struct led_classdev_mc *mcled_cdev,
+			    enum led_brightness brightness,
+			    int adj_value[]);
+
+/* Read current cluster brightness */
+extern void get_cluster_brightness(struct led_classdev_mc *mcled_cdev,
+				   int brightness_val[]);
+
+#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
-- 
2.22.0.214.g8dca754b1e

