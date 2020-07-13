Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399B121DA83
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 17:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729920AbgGMPqL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 11:46:11 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45360 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbgGMPqK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 11:46:10 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DFjvVF000723;
        Mon, 13 Jul 2020 10:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594655157;
        bh=uiOZOdtNnLqfwycJRLSLmvYuLU5Tv5fbJWq8m6PP2FM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GySxeQqIFw0OUg7rl1Gq0oVHBVd2Mww9R7yWgmIWVe15GwiifkYSP79bg8ZZVUTU4
         JCGFWlLDrRKLG0O6nKUN0JtclBFuJgPAbTXjo+O8OKxP4YS9ke5TRgMREtfhsc+uMp
         QzhBgOnstewri7hEY4H8cmodXy+b3uYKwwNoKI7k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06DFjvdd058385
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 10:45:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 10:45:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 10:45:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DFju7s032977;
        Mon, 13 Jul 2020 10:45:56 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v30 05/16] leds: multicolor: Introduce a multicolor class definition
Date:   Mon, 13 Jul 2020 10:45:33 -0500
Message-ID: <20200713154544.1683-6-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713154544.1683-1-dmurphy@ti.com>
References: <20200713154544.1683-1-dmurphy@ti.com>
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
controlled via the intensity file and the latter is controlled
via brightness file.

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../ABI/testing/sysfs-class-led-multicolor    |  35 +++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  86 ++++++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/led-class-multicolor.c           | 204 ++++++++++++++++++
 include/linux/led-class-multicolor.h          | 121 +++++++++++
 7 files changed, 458 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 include/linux/led-class-multicolor.h

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..40f96af06f44
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,35 @@
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
+		led_brightness = brightness * multi_intensity/max_brightness
+
+		For additional details please refer to
+		Documentation/leds/leds-class-multicolor.rst.
+
+		The value of the LED is from 0 to
+		/sys/class/leds/<led>/max_brightness.
+
+What:		/sys/class/leds/<led>/multi_index
+Date:		March 2020
+KernelVersion:	5.8
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read
+		The multi_index array, when read, will output the LED colors
+		as an array of strings as they are indexed in the
+		multi_intensity file.
+
+What:		/sys/class/leds/<led>/multi_intensity
+Date:		March 2020
+KernelVersion:	5.8
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		This file contains array of integers. Order of components is
+		described by the multi_index array. The maximum intensity should
+		not exceed /sys/class/leds/<led>/max_brightness.
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
index 000000000000..6204f391fd40
--- /dev/null
+++ b/Documentation/leds/leds-class-multicolor.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+MultiColor LED handling under Linux
+====================================
+
+Description
+===========
+The multicolor class groups monochrome LEDs and allows controlling two
+aspects of the final combined color: hue and lightness. The former is
+controlled via the multi_intensity array file and the latter is controlled
+via brightness file.
+
+Multicolor Class Control
+========================
+The multicolor class presents files that groups the colors as indexes in an
+array.  These files are children under the LED parent node created by the
+led_class framework.  The led_class framework is documented in led-class.rst
+within this documentation directory.
+
+Each colored LED will be indexed under the multi_* files. The order of the
+colors will be arbitrary. The multi_index file can be read to determine the
+color name to indexed value.
+
+The multi_index file is an array that contains the string list of the colors as
+they are defined in each multi_* array file.
+
+The multi_intensity is an array that can be read or written to for the
+individual color intensities.  All elements within this array must be written in
+order for the color LED intensities to be updated.
+
+Directory Layout Example
+========================
+root:/sys/class/leds/multicolor:status# ls -lR
+-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
+-r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightness
+-r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
+-rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intensity
+
+Multicolor Class Brightness Control
+===================================
+The brightness level for each LED is calculated based on the color LED
+intensity setting divided by the global max_brightness setting multiplied by
+the requested brightness.
+
+led_brightness = brightness * multi_intensity/max_brightness
+
+Example:
+A user first writes the multi_intensity file with the brightness levels
+for each LED that are necessary to achieve a certain color output from a
+multicolor LED group.
+
+cat /sys/class/leds/multicolor:status/multi_index
+green blue red
+
+echo 43 226 138 > /sys/class/leds/multicolor:status/multi_intensity
+
+red -
+	intensity = 138
+	max_brightness = 255
+green -
+	intensity = 43
+	max_brightness = 255
+blue -
+	intensity = 226
+	max_brightness = 255
+
+The user can control the brightness of that multicolor LED group by writing the
+global 'brightness' control.  Assuming a max_brightness of 255 the user
+may want to dim the LED color group to half.  The user would write a value of
+128 to the global brightness file then the values written to each LED will be
+adjusted base on this value.
+
+cat /sys/class/leds/multicolor:status/max_brightness
+255
+echo 128 > /sys/class/leds/multicolor:status/brightness
+
+adjusted_red_value = 128 * 138/255 = 69
+adjusted_green_value = 128 * 43/255 = 21
+adjusted_blue_value = 128 * 226/255 = 113
+
+Reading the global brightness file will return the current brightness value of
+the color LED group.
+
+cat /sys/class/leds/multicolor:status/brightness
+128
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ed943140e1fd..0d034453eeb9 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
 	  for the flash related features of a LED device. It can be built
 	  as a module.
 
+config LEDS_CLASS_MULTI_COLOR
+	tristate "LED MultiColor Class Support"
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
index d6b8a792c936..53a752c32e67 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -4,6 +4,7 @@
 obj-$(CONFIG_NEW_LEDS)			+= led-core.o
 obj-$(CONFIG_LEDS_CLASS)		+= led-class.o
 obj-$(CONFIG_LEDS_CLASS_FLASH)		+= led-class-flash.o
+obj-$(CONFIG_LEDS_CLASS_MULTI_COLOR)	+= led-class-multicolor.o
 obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
 
 # LED Platform Drivers (keep this sorted, M-| sort)
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
new file mode 100644
index 000000000000..c0fe679438bd
--- /dev/null
+++ b/drivers/leds/led-class-multicolor.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+// LED Multi Color class interface
+// Copyright (C) 2019-20 Texas Instruments Incorporated - http://www.ti.com/
+// Author: Dan Murphy <dmurphy@ti.com>
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
+	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
+	int i;
+
+	for (i = 0; i < mcled_cdev->num_colors; i++)
+		mcled_cdev->subled_info[i].brightness = brightness *
+					mcled_cdev->subled_info[i].intensity /
+					led_cdev->max_brightness;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
+
+static ssize_t multi_intensity_store(struct device *dev,
+				struct device_attribute *intensity_attr,
+				const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
+	int nrchars, offset = 0;
+	int intensity_value[LED_COLOR_ID_MAX];
+	int i;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	for (i = 0; i < mcled_cdev->num_colors; i++) {
+		ret = sscanf(buf + offset, "%i%n",
+			     &intensity_value[i], &nrchars);
+		if (ret != 1) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+		offset += nrchars;
+	}
+
+	/* account for the new line at the end of the buffer */
+	offset++;
+	if (offset < size) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	for (i = 0; i < mcled_cdev->num_colors; i++)
+		mcled_cdev->subled_info[i].intensity = intensity_value[i];
+
+	led_set_brightness(led_cdev, led_cdev->brightness);
+	ret = size;
+err_out:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+
+static ssize_t multi_intensity_show(struct device *dev,
+			      struct device_attribute *intensity_attr,
+			      char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
+	int len = 0;
+	int i;
+
+	for (i = 0; i < mcled_cdev->num_colors; i++) {
+		len += sprintf(buf + len, "%d",
+			       mcled_cdev->subled_info[i].intensity);
+		if (i < mcled_cdev->num_colors - 1)
+			len += sprintf(buf + len, " ");
+	}
+
+	len += sprintf(buf + len, "\n");
+	return len;
+}
+static DEVICE_ATTR_RW(multi_intensity);
+
+static ssize_t multi_index_show(struct device *dev,
+			      struct device_attribute *multi_index_attr,
+			      char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
+	int len = 0;
+	int index;
+	int i;
+
+	for (i = 0; i < mcled_cdev->num_colors; i++) {
+		index = mcled_cdev->subled_info[i].color_index;
+		len += sprintf(buf + len, "%s", led_colors[index]);
+		if (i < mcled_cdev->num_colors - 1)
+			len += sprintf(buf + len, " ");
+	}
+
+	len += sprintf(buf + len, "\n");
+	return len;
+}
+static DEVICE_ATTR_RO(multi_index);
+
+static struct attribute *led_multicolor_attrs[] = {
+	&dev_attr_multi_intensity.attr,
+	&dev_attr_multi_index.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(led_multicolor);
+
+int led_classdev_multicolor_register_ext(struct device *parent,
+				     struct led_classdev_mc *mcled_cdev,
+				     struct led_init_data *init_data)
+{
+	struct led_classdev *led_cdev;
+
+	if (!mcled_cdev)
+		return -EINVAL;
+
+	if (mcled_cdev->num_colors <= 0)
+		return -EINVAL;
+
+	if (mcled_cdev->num_colors > LED_COLOR_ID_MAX)
+		return -EINVAL;
+
+	led_cdev = &mcled_cdev->led_cdev;
+	mcled_cdev->led_cdev.groups = led_multicolor_groups;
+
+	return led_classdev_register_ext(parent, led_cdev, init_data);
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
+					     struct led_init_data *init_data)
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
+MODULE_LICENSE("GPL v2+");
diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
new file mode 100644
index 000000000000..5dae7f5abb70
--- /dev/null
+++ b/include/linux/led-class-multicolor.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* LED Multicolor class interface
+ * Copyright (C) 2019-20 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#ifndef _LINUX_MULTICOLOR_LEDS_H_INCLUDED
+#define _LINUX_MULTICOLOR_LEDS_H_INCLUDED
+
+#include <linux/leds.h>
+#include <dt-bindings/leds/common.h>
+
+struct mc_subled {
+	unsigned int color_index;
+	unsigned int brightness;
+	unsigned int intensity;
+	unsigned int channel;
+};
+
+struct led_classdev_mc {
+	/* led class device */
+	struct led_classdev led_cdev;
+	unsigned int num_colors;
+
+	struct mc_subled *subled_info;
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
+static inline int led_classdev_multicolor_register_ext(struct device *parent,
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
+					       enum led_brightness brightness)
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
+#endif	/* _LINUX_MULTICOLOR_LEDS_H_INCLUDED */
-- 
2.27.0

