Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19A41918D6
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2020 19:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbgCXSUq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Mar 2020 14:20:46 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44670 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbgCXSUq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Mar 2020 14:20:46 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02OIKell100610;
        Tue, 24 Mar 2020 13:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585074040;
        bh=t81Sh/r0jWv1mexZqPUtuXrx1ljJKiVpTUEb6h3w9ZQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HlFxG/bnb5Bjft/+54wDNFg3O3uPZrqDgKlU9IGfawF80lDWu8HAZM41UVHKpODog
         9vAbH2UZQHikazi5JmxTdI9RxfY4bQkpO5LjtHygXlWglw6T9sC+gCaWhc4hHsvQJU
         98QMFdtE9/9rQ7Ho/SBC5V3Hi/Oift8X3Nv0/ZS4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OIKeSh076995;
        Tue, 24 Mar 2020 13:20:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 13:20:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 13:20:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OIKeoU038014;
        Tue, 24 Mar 2020 13:20:40 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v18 4/4] leds: multicolor: Introduce a multicolor class definition
Date:   Tue, 24 Mar 2020 13:14:34 -0500
Message-ID: <20200324181434.24721-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324181434.24721-1-dmurphy@ti.com>
References: <20200324181434.24721-1-dmurphy@ti.com>
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

The multi color class groups monochrome LEDs and allows controlling two
aspects of the final combined color: hue and lightness. The former is
controlled via color_intensity files and the latter is controlled
via brightness file.

CC: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
A design alternative to having files that having multiple values written to a
single file is here:

https://lore.kernel.org/patchwork/patch/1186194/

 .../ABI/testing/sysfs-class-led-multicolor    |  51 ++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  | 110 +++++++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/led-class-multicolor.c           | 224 ++++++++++++++++++
 include/linux/led-class-multicolor.h          | 124 ++++++++++
 7 files changed, 521 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 include/linux/led-class-multicolor.h

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..a93772212c21
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,51 @@
+What:		/sys/class/leds/<led>/brightness
+Date:		March 2020
+KernelVersion:	5.8
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		Writing to this file will update all LEDs within the group to a
+		calculated percentage of what each color LED intensity is set
+		to. The percentage is calculated for each grouped LED via the
+		equation below:
+
+		led_brightness = brightness * <color>_intensity/<color>_max_intensity
+
+		For additional details please refer to
+		Documentation/leds/leds-class-multicolor.rst.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/max_brightness.
+
+What:		/sys/class/leds/<led>/color_index
+Date:		March 2020
+KernelVersion:	5.8
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read
+		The color_index array, when read, will output the LED colors
+		by name as they are indexed in the color_intensity array.
+
+What:		/sys/class/leds/<led>/num_color_leds
+Date:		March 2020
+KernelVersion:	5.8
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read
+		The num_color_leds indicates the number of LEDs defined in the
+		color_intensity, color_max_intensity and color_index arrays.
+
+What:		/sys/class/leds/<led>/color_max_intensity
+Date:		March 2020
+KernelVersion:	5.8
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read
+		Maximum intensity level for the LED color within the array.
+		The max intensities for each color must be entered based on the
+		color_index array.
+
+What:		/sys/class/leds/<led>/color_intensity
+Date:		March 2020
+KernelVersion:	5.8
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		Intensity level for the LED color within the array.
+		The intensities for each color must be entered based on the
+		color_index array.
diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 060f4e485897..bc70c6aa7138 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -9,6 +9,7 @@ LEDs
 
    leds-class
    leds-class-flash
+   leds-class-multicolor
    ledtrig-oneshot
    ledtrig-transient
    ledtrig-usbport
diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
new file mode 100644
index 000000000000..902a281a44d4
--- /dev/null
+++ b/Documentation/leds/leds-class-multicolor.rst
@@ -0,0 +1,110 @@
+====================================
+Multi Color LED handling under Linux
+====================================
+
+Description
+===========
+The multi color class groups monochrome LEDs and allows controlling two
+aspects of the final combined color: hue and lightness. The former is
+controlled via the color_intensity array file and the latter is controlled
+via brightness file.
+
+For more details on hue and lightness notions please refer to
+https://en.wikipedia.org/wiki/CIECAM02.
+
+Note that intensity file only caches the written values and the actual
+change of hardware state occurs upon writing brightness file. This
+allows for changing many factors of the perceived color in a virtually
+unnoticeable way for the human observer.
+
+Multicolor Class Control
+========================
+The multicolor class presents files that groups the colors as indexes in an
+array.  These files are children under the LED parent node created by the
+led_class framework.  The led_class framework is documented in led-class.rst
+within this documentation directory.
+
+Each colored LED will be indexed under the color_* files. The order of the
+colors are arbitrary the color_index file can be read to determine the color
+to index value.
+
+The color_index file is an array that contains the string list of the colors as
+they are defined in each color_* array file.
+
+The color_intensity is an array that can be read or written to for the
+individual color intensities.  All elements within this array must be written in
+order for the color LED intensities to be updated.
+
+The color_max_intensity is an array that can be read to indicate each color LED
+maximum intensity value.
+
+The num_color_leds file returns the total number of color LEDs that are
+presented in each color_* array.
+
+Directory Layout Example
+========================
+root:/sys/class/leds/multicolor:grouped_leds# ls -lR
+-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
+-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
+-rw-r--r--    1 root     root          4096 Oct 19 16:16 color_intensity
+-r--r--r--    1 root     root          4096 Oct 19 16:16 color_max_intensity
+-r--r--r--    1 root     root          4096 Oct 19 16:16 num_color_leds
+
+Multicolor Class Brightness Control
+===================================
+The multiclor class framework will calculate each monochrome LEDs intensity.
+
+The brightness level for each LED is calculated based on the color LED
+intensity setting divided by the color LED max intensity setting multiplied by
+the requested brightness.
+
+led_brightness = brightness * color_intensity/color_max_intensity
+
+It is important to note that for each LED within the cluster the
+color_max_intensity value should be the same. This will help maintain a
+consistent hue across brightness levels.
+
+Example:
+A user first writes the color LEDs intensity file with the brightness levels
+that for each LED that is necessary to achieve a blueish violet output from a
+RGB LED group.
+
+cat /sys/class/leds/multicolor:grouped_leds/color_index
+green blue red
+
+echo 43 226 138 > /sys/class/leds/multicolor:grouped_leds/color_intensity
+
+red -
+	intensity = 138
+	max_intensity = 255
+green -
+	intensity = 43
+	max_intensity = 255
+blue -
+	intensity = 226
+	max_intensity = 255
+
+The user can control the brightness of that RGB group by writing the parent
+'brightness' control.  Assuming a parent max_brightness of 255 the user may want
+to dim the LED color group to half.  The user would write a value of 128 to the
+parent brightness file then the values written to each LED will be adjusted
+base on this value
+
+cat /sys/class/leds/multicolor:grouped_leds/max_brightness
+255
+echo 128 > /sys/class/leds/multicolor:grouped_leds/brightness
+
+adjusted_red_value = 128 * 138/255 = 69
+adjusted_green_value = 128 * 43/255 = 21
+adjusted_blue_value = 128 * 226/255 = 113
+
+Reading the parent brightness file will return the current brightness value of
+the color LED group.
+
+cat /sys/class/leds/multicolor:grouped_leds/max_brightness
+255
+
+echo 128 > /sys/class/leds/multicolor:grouped_leds/brightness
+
+cat /sys/class/leds/multicolor:grouped_leds/brightness
+128
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d82f1dea3711..37dcdb06a29b 100644
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
index d7e1107753fb..310b5518783a 100644
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
index 000000000000..0dbafede6e58
--- /dev/null
+++ b/drivers/leds/led-class-multicolor.c
@@ -0,0 +1,224 @@
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
+int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
+				 enum led_brightness brightness)
+{
+	int i;
+
+	for (i = 0; i < mcled_cdev->num_colors; i++)
+		mcled_cdev->color_brightness[i] = brightness *
+					  mcled_cdev->color_led_intensity[i] /
+					  mcled_cdev->color_led_max_intensity[i];
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
+
+static ssize_t color_intensity_store(struct device *dev,
+				struct device_attribute *intensity_attr,
+				const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_classdev_mc *priv = lcdev_to_mccdev(led_cdev);
+	int nrchars, offset = 0;
+	int intensity_value[LED_COLOR_ID_MAX];
+	int i;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	for (i = 0; i < priv->num_colors; i++) {
+		ret = sscanf(buf + offset, "%i%n",
+			     &intensity_value[i], &nrchars);
+		if (ret != 1) {
+			dev_err(led_cdev->dev,
+				"Incorrect number of LEDs expected %i values intensity was not applied\n",
+				priv->num_colors);
+			goto err_out;
+		}
+		offset += nrchars;
+	}
+
+	memcpy(&priv->color_led_intensity, intensity_value,
+	       sizeof(intensity_value));
+err_out:
+	ret = size;
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+
+static ssize_t color_intensity_show(struct device *dev,
+			      struct device_attribute *intensity_attr,
+			      char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_classdev_mc *priv = lcdev_to_mccdev(led_cdev);
+	int len = 0;
+	int i;
+
+	for (i = 0; i < priv->num_colors; i++)
+		len += sprintf(buf + len, "%d ", priv->color_led_intensity[i]);
+
+	len += sprintf(buf + len, "%s", "\n");
+
+	return len;
+}
+static DEVICE_ATTR_RW(color_intensity);
+
+static ssize_t color_index_show(struct device *dev,
+			      struct device_attribute *color_index_attr,
+			      char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_classdev_mc *priv = lcdev_to_mccdev(led_cdev);
+	int len = 0;
+	int i;
+
+	for (i = 0; i < priv->num_colors; i++)
+		len += sprintf(buf + len, "%s ", priv->color_index[i]);
+
+	len += sprintf(buf + len, "%s", "\n");
+
+	return len;
+}
+static DEVICE_ATTR_RO(color_index);
+
+static ssize_t color_max_intensity_show(struct device *dev,
+				   struct device_attribute *max_intensity_attr,
+				   char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_classdev_mc *priv = lcdev_to_mccdev(led_cdev);
+	int len = 0;
+	int i;
+
+	for (i = 0; i < priv->num_colors; i++)
+		len += sprintf(buf + len, "%d ",
+			       priv->color_led_max_intensity[i]);
+
+	len += sprintf(buf + len, "%s", "\n");
+
+	return len;
+}
+static DEVICE_ATTR_RO(color_max_intensity);
+
+static ssize_t num_color_leds_show(struct device *dev,
+				   struct device_attribute *max_intensity_attr,
+				   char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_classdev_mc *priv = lcdev_to_mccdev(led_cdev);
+
+	return sprintf(buf, "%d\n", priv->num_colors);
+}
+static DEVICE_ATTR_RO(num_color_leds);
+
+static struct attribute *led_multicolor_attrs[] = {
+	&dev_attr_color_intensity.attr,
+	&dev_attr_color_index.attr,
+	&dev_attr_color_max_intensity.attr,
+	&dev_attr_num_color_leds.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(led_multicolor);
+
+int led_classdev_multicolor_register_ext(struct device *parent,
+				     struct led_classdev_mc *mcled_cdev,
+				     struct led_init_data *init_data)
+{
+	struct led_classdev *led_cdev;
+	int i;
+
+	if (!mcled_cdev)
+		return -EINVAL;
+
+	if (!mcled_cdev->num_colors)
+		return -EINVAL;
+
+	led_cdev = &mcled_cdev->led_cdev;
+
+	mcled_cdev->led_cdev.groups = led_multicolor_groups;
+
+	for (i = 0; i <= mcled_cdev->num_colors; i++)
+		if (!mcled_cdev->color_led_max_intensity[i])
+			mcled_cdev->color_led_max_intensity[i] = LED_FULL;
+
+	return led_classdev_register_ext(parent, &mcled_cdev->led_cdev,
+					 init_data);
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
+int devm_led_classdev_multicolor_register_ext(struct device *parent,
+					     struct led_classdev_mc *mcled_cdev,
+					      struct led_init_data *init_data)
+{
+	struct led_classdev_mc **dr;
+	int ret;
+
+	dr = devres_alloc(devm_led_classdev_multicolor_release,
+			  sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	ret = led_classdev_multicolor_register_ext(parent, mcled_cdev,
+						   init_data);
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
+EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register_ext);
+
+static int devm_led_classdev_multicolor_match(struct device *dev,
+					      void *res, void *data)
+{
+	struct led_classdev_mc **p = res;
+
+	if (WARN_ON(!p || !*p))
+		return 0;
+
+	return *p == data;
+}
+
+void devm_led_classdev_multicolor_unregister(struct device *dev,
+					     struct led_classdev_mc *mcled_cdev)
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
index 000000000000..bfbde2e98340
--- /dev/null
+++ b/include/linux/led-class-multicolor.h
@@ -0,0 +1,124 @@
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
+struct led_classdev_mc {
+	/* led class device */
+	struct led_classdev led_cdev;
+
+	struct device_attribute color_max_intensity_attr;
+	struct device_attribute color_intensity_attr;
+	struct device_attribute color_index_attr;
+
+	int color_brightness[LED_COLOR_ID_MAX];
+
+	int color_led_intensity[LED_COLOR_ID_MAX];
+	int color_led_max_intensity[LED_COLOR_ID_MAX];
+	const char *color_index[LED_COLOR_ID_MAX];
+
+	int num_colors;
+};
+
+static inline struct led_classdev_mc *lcdev_to_mccdev(
+						struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct led_classdev_mc, led_cdev);
+}
+
+#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
+/**
+ * led_classdev_multicolor_register_ext - register a new object of led_classdev
+ *				      class with support for multicolor LEDs
+ * @parent: the multicolor LED to register
+ * @mcled_cdev: the led_classdev_mc structure for this device
+ * @init_data: the LED class Multi color device initialization data
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+int led_classdev_multicolor_register_ext(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev,
+					    struct led_init_data *init_data);
+
+static inline int led_classdev_multicolor_register(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev)
+{
+	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
+}
+
+/**
+ * led_classdev_multicolor_unregister - unregisters an object of led_classdev
+ *					class with support for multicolor LEDs
+ * @mcled_cdev: the multicolor LED to unregister
+ *
+ * Unregister a previously registered via led_classdev_multicolor_register
+ * object
+ */
+void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
+
+/* Calculate brightness for the monochrome LED cluster */
+int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
+				 enum led_brightness brightness);
+
+int devm_led_classdev_multicolor_register_ext(struct device *parent,
+					  struct led_classdev_mc *mcled_cdev,
+					  struct led_init_data *init_data);
+
+static inline int devm_led_classdev_multicolor_register(struct device *parent,
+				     struct led_classdev_mc *mcled_cdev)
+{
+	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
+							 NULL);
+}
+
+void devm_led_classdev_multicolor_unregister(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev);
+#else
+
+static inline  int led_classdev_multicolor_register_ext(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev,
+					    struct led_init_data *init_data)
+{
+	return -EINVAL;
+}
+
+static inline int led_classdev_multicolor_register(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev)
+{
+	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
+}
+
+static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev) {};
+static inline int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
+					       enum led_brightness brightness,
+			     struct led_mc_color_conversion color_components[])
+{
+	return -EINVAL;
+}
+
+static inline int devm_led_classdev_multicolor_register_ext(struct device *parent,
+					  struct led_classdev_mc *mcled_cdev,
+					  struct led_init_data *init_data)
+{
+	return -EINVAL;
+}
+
+static inline int devm_led_classdev_multicolor_register(struct device *parent,
+					     struct led_classdev_mc *mcled_cdev)
+{
+	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
+							 NULL);
+}
+
+static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
+					    struct led_classdev_mc *mcled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR) */
+#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
-- 
2.25.1

