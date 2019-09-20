Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA12AB9694
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 19:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392515AbfITRib (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 13:38:31 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42676 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391941AbfITRib (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 13:38:31 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KHcRnY109370;
        Fri, 20 Sep 2019 12:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569001107;
        bh=i7z0jXWu4h+QrK0kZmroswBdR0G0VTTgimDuX0YJcX8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BU7LNvKBptNengXiFCJSNEQN/A0ZpKazRL7yNhKye+9t5OlHceNxAXfaIkiVaYlmC
         w09trcgvwEF8BmlhpJRZuum0gQDhzAN2GkgMN1UgRxUth8b6Zx/xR5SPOFgK2z+/oe
         MuS1qiDbR785pXirrrlHjr7mQAqwwxS3O2nRW5Mc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KHcRPj013176
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:38:27 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:38:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:38:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KHcRlI075359;
        Fri, 20 Sep 2019 12:38:27 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v8 6/9] leds: multicolor: Introduce a multicolor class definition
Date:   Fri, 20 Sep 2019 12:41:36 -0500
Message-ID: <20190920174139.30079-7-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190920174139.30079-1-dmurphy@ti.com>
References: <20190920174139.30079-1-dmurphy@ti.com>
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
 drivers/leds/led-class-multicolor.c  | 316 +++++++++++++++++++++++++++
 include/linux/led-class-multicolor.h |  76 +++++++
 4 files changed, 403 insertions(+)
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 include/linux/led-class-multicolor.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6e7703fd03d0..cfb1ebb6517f 100644
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
+	  It wraps LED class and adds multicolor LED specific sysfs attributes
+	  and kernel internal API to it. You'll need this to provide support
+	  for multicolor LEDs that are grouped together. This class is not
+	  intended for single color LEDs. It can be built as a module.
+
 config LEDS_BRIGHTNESS_HW_CHANGED
 	bool "LED Class brightness_hw_changed attribute support"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2da39e896ce8..841038cfe35b 100644
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
index 000000000000..5e0e3fce482b
--- /dev/null
+++ b/drivers/leds/led-class-multicolor.c
@@ -0,0 +1,316 @@
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
+#define INTENSITY_NAME		"_intensity"
+#define MAX_INTENSITY_NAME	"_max_intensity"
+
+struct led_mc_color_entry {
+	struct led_classdev_mc *mcled_cdev;
+
+	struct device_attribute max_intensity_attr;
+	struct device_attribute intensity_attr;
+
+	enum led_brightness max_intensity;
+	enum led_brightness intensity;
+
+	struct list_head list;
+
+	int led_color_id;
+};
+
+void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
+			    enum led_brightness brightness,
+			    int brightness_val[])
+{
+	struct led_classdev_mc_data *data = mcled_cdev->data;
+	struct led_mc_color_entry *priv;
+	int i = 0;
+
+	list_for_each_entry(priv, &data->color_list, list) {
+		brightness_val[i] = brightness *
+				    priv->intensity / priv->max_intensity;
+		i++;
+	}
+}
+EXPORT_SYMBOL_GPL(led_mc_calc_brightness);
+
+static ssize_t intensity_store(struct device *dev,
+				struct device_attribute *intensity_attr,
+				const char *buf, size_t size)
+{
+	struct led_mc_color_entry *priv = container_of(intensity_attr,
+						    struct led_mc_color_entry,
+						      intensity_attr);
+	struct led_classdev_mc_data *data = priv->mcled_cdev->data;
+	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
+	struct led_classdev *led_cdev = priv->mcled_cdev->led_cdev;
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
+	priv->intensity = value;
+
+	if (mcled_cdev->set_color_brightness) {
+		ret = mcled_cdev->set_color_brightness(mcled_cdev,
+						       priv->led_color_id,
+						       priv->intensity);
+		if (ret)
+			goto unlock;
+	}
+
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
+	struct led_mc_color_entry *priv = container_of(intensity_attr,
+						    struct led_mc_color_entry,
+						      intensity_attr);
+
+	return sprintf(buf, "%d\n", priv->intensity);
+}
+
+static ssize_t max_intensity_show(struct device *dev,
+				   struct device_attribute *max_intensity_attr,
+				   char *buf)
+{
+	struct led_mc_color_entry *priv = container_of(max_intensity_attr,
+						    struct led_mc_color_entry,
+						      max_intensity_attr);
+
+	return sprintf(buf, "%d\n", priv->max_intensity);
+}
+
+static struct attribute *led_color_attrs[] = {
+	NULL,
+};
+
+static struct attribute_group led_color_group = {
+	.name = "colors",
+	.attrs = led_color_attrs,
+};
+
+static int led_multicolor_init_color(struct led_classdev_mc_data *data,
+				     struct led_classdev_mc *mcled_cdev,
+				     int color_id, int color_index)
+{
+	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
+	struct led_mc_color_entry *mc_priv;
+	char *intensity_file_name;
+	char *max_intensity_file_name;
+	size_t len;
+	int ret;
+
+	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
+	if (!mc_priv)
+		return -ENOMEM;
+
+	mc_priv->led_color_id = color_id;
+	mc_priv->mcled_cdev = mcled_cdev;
+
+	sysfs_attr_init(&mc_priv->intensity_attr.attr);
+	len = strlen(led_colors[color_id]) + strlen(INTENSITY_NAME) + 1;
+	intensity_file_name = kzalloc(len, GFP_KERNEL);
+	if (!intensity_file_name) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	snprintf(intensity_file_name, len, "%s%s",
+		 led_colors[color_id], INTENSITY_NAME);
+	mc_priv->intensity_attr.attr.name = intensity_file_name;
+	mc_priv->intensity_attr.attr.mode = 644;
+	mc_priv->intensity_attr.store = intensity_store;
+	mc_priv->intensity_attr.show = intensity_show;
+	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
+				      &mc_priv->intensity_attr.attr,
+				      led_color_group.name);
+	if (ret)
+		goto intensity_err_out;
+
+	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
+	len = strlen(led_colors[color_id]) + strlen(MAX_INTENSITY_NAME) + 1;
+	max_intensity_file_name = kzalloc(len, GFP_KERNEL);
+	if (!max_intensity_file_name) {
+		ret = -ENOMEM;
+		goto intensity_err_out;
+	}
+
+	snprintf(max_intensity_file_name, len, "%s%s",
+		 led_colors[color_id], MAX_INTENSITY_NAME);
+	mc_priv->max_intensity_attr.attr.name = max_intensity_file_name;
+	mc_priv->max_intensity_attr.attr.mode = 444;
+	mc_priv->max_intensity_attr.show = max_intensity_show;
+	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
+				      &mc_priv->max_intensity_attr.attr,
+				      led_color_group.name);
+	if (ret)
+		goto max_intensity_err_out;
+
+	mc_priv->max_intensity = LED_FULL;
+	list_add_tail(&mc_priv->list, &data->color_list);
+
+max_intensity_err_out:
+	kfree(max_intensity_file_name);
+intensity_err_out:
+	kfree(intensity_file_name);
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
+	data->mcled_cdev = mcled_cdev;
+
+	ret = sysfs_create_group(&led_cdev->dev->kobj, &led_color_group);
+	if (ret)
+		return ret;
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
+	return ret;
+}
+
+int led_classdev_multicolor_register_ext(struct device *parent,
+				     struct led_classdev_mc *mcled_cdev,
+				     struct led_init_data *init_data)
+{
+	struct led_classdev *led_cdev;
+	struct led_classdev_mc_data *data;
+	int ret;
+
+	if (!mcled_cdev)
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
+	sysfs_remove_group(&mcled_cdev->led_cdev->dev->kobj, &led_color_group);
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
index 000000000000..afcaf429fba5
--- /dev/null
+++ b/include/linux/led-class-multicolor.h
@@ -0,0 +1,76 @@
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
+	struct list_head color_list;
+};
+
+struct led_classdev_mc {
+	/* led class device */
+	struct led_classdev *led_cdev;
+
+	/* Set brightness for a specific color id */
+	int (*set_color_brightness)(struct led_classdev_mc *mcled_cdev,
+				    int color_id, int value);
+
+	struct led_classdev_mc_data *data;
+
+	unsigned long available_colors;
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
+extern void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
+			    enum led_brightness brightness,
+			    int brightness_val[]);
+
+#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
-- 
2.22.0.214.g8dca754b1e

