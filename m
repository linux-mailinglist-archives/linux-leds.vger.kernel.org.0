Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF8C0B54BD
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2019 19:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfIQR5j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 13:57:39 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45554 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfIQR5j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 13:57:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HHvZBS042795;
        Tue, 17 Sep 2019 12:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568743055;
        bh=tciJSoDWtZeTRSoG2p0AAhcQxyCLLjVxDEZ+JoyfXRA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hTgqx2rUdEt4lUzW+bw7niWZ27nKLU/RTar7Yvdrk0i6YLjHLO1+3UWCXGUyHXRNG
         eh0XWukoyhvt4h1fTl2fkZL+rD/cRI8lTreH5sCEn/9MzJztMXibHRXjGSDKuAgiYE
         fk+aGK8gtSCMBohFHmzOg6hHhVQpXuoHanl5xsBg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HHvZSh116927
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Sep 2019 12:57:35 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 17
 Sep 2019 12:57:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 17 Sep 2019 12:57:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HHvZYT110339;
        Tue, 17 Sep 2019 12:57:35 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v6 6/9] leds: multicolor: Introduce a multicolor class definition
Date:   Tue, 17 Sep 2019 12:59:34 -0500
Message-ID: <20190917175937.13872-6-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190917175937.13872-1-dmurphy@ti.com>
References: <20190917175937.13872-1-dmurphy@ti.com>
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

v6 removed color_id and color_mix files, used sysfs_create_groups instead of
kobject call for LED color directory, kept kobject_create for the "colors" directory,
removed the calculate function, updated the export for the intensity calculations.


 drivers/leds/Kconfig                 |  10 +
 drivers/leds/Makefile                |   1 +
 drivers/leds/led-class-multicolor.c  | 306 +++++++++++++++++++++++++++
 include/linux/led-class-multicolor.h |  90 ++++++++
 4 files changed, 407 insertions(+)
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 include/linux/led-class-multicolor.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1988de1d64c0..71e7fd4f6f15 100644
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
index 000000000000..d43bd344ed4c
--- /dev/null
+++ b/drivers/leds/led-class-multicolor.c
@@ -0,0 +1,306 @@
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
+	if (mcled_cdev->ops) {
+		ret = mcled_cdev->ops->set_color_brightness(mcled_cdev,
+							    priv->led_color_id,
+							    priv->intensity);
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
+	const struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
+	int value = 0;
+
+	if (ops->get_color_brightness) {
+		value = ops->get_color_brightness(priv->mcled_cdev,
+						  priv->led_color_id);
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
+	.attrs = led_color_attrs,
+};
+
+static int led_multicolor_init_color(struct led_classdev_mc_data *data,
+				     struct led_classdev_mc *mcled_cdev,
+				     int color_id, int color_index)
+{
+	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
+	struct led_mc_color_entry *mc_priv;
+	int ret;
+
+	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
+	if (!mc_priv)
+		return -ENOMEM;
+
+	mc_priv->led_color_id = color_id;
+	mc_priv->mcled_cdev = mcled_cdev;
+
+	led_color_group.name = led_colors[color_id];
+	ret = sysfs_create_group(data->color_kobj, &led_color_group);
+	if (ret)
+		return ret;
+
+	sysfs_attr_init(&mc_priv->intensity_attr.attr);
+	mc_priv->intensity_attr.attr.name = "intensity";
+	mc_priv->intensity_attr.attr.mode = 666;
+	mc_priv->intensity_attr.store = intensity_store;
+	mc_priv->intensity_attr.show = intensity_show;
+	ret = sysfs_add_file_to_group(data->color_kobj,
+				      &mc_priv->intensity_attr.attr,
+				      led_color_group.name);
+	if (ret)
+		return ret;
+
+	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
+	mc_priv->max_intensity_attr.attr.name = "max_intensity";
+	mc_priv->max_intensity_attr.attr.mode = 444;
+	mc_priv->max_intensity_attr.show = max_intensity_show;
+	ret = sysfs_add_file_to_group(data->color_kobj,
+				      &mc_priv->max_intensity_attr.attr,
+				      led_color_group.name);
+	if (ret)
+		goto err_out;
+
+	mc_priv->max_intensity = LED_FULL;
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
+	sysfs_remove_group(mcled_cdev->data->color_kobj, &led_color_group);
+
+	kobject_del(mcled_cdev->data->color_kobj);
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
index 000000000000..43270b3b7736
--- /dev/null
+++ b/include/linux/led-class-multicolor.h
@@ -0,0 +1,90 @@
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

