Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35B413AB4F
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729905AbfFITIl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:41 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52726 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbfFITIj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:39 -0400
Received: by mail-wm1-f65.google.com with SMTP id s3so6487292wms.2;
        Sun, 09 Jun 2019 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4ZIxzOudT26p/HMKfLQvmOTq/X7HYzj3u4XTe7R8n+g=;
        b=pdbR7ZiZuB5f8t+ShX8LrEOAc7nSOzz/U/2NSZP8ODdZewrj1v+TRxRgDaHqJi/wiA
         QIITzLnH+TbSTvbsN4ZH073Odvnu8LatK4cCQWMGYN7EglTf06n78OzCZO1FbbPw2m1C
         UbFBTGM5gKMAj4VwjPNahz5/DIJ5lP6BsOFl1OMGgIQRoLRTd73evchG3YphXNNuGo99
         ejngyTpwZWQhdk3VC7/dV784x5JJ44AN36WtMaTc/1m/9NFW7l+vXbOLj4fa4knkyzmD
         wjye2wW+IcrIIx5h/OyEC5PeM/0SgV85EUWMHv8DeU2k9EGzBLmGOLuSy208HF3QqArV
         t/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4ZIxzOudT26p/HMKfLQvmOTq/X7HYzj3u4XTe7R8n+g=;
        b=fPPnKF7p7QnrpZFw34O0I3oas8+KLV75xAKOd2gLSG0nakxMMQvxD/QVYVEI0ufsvH
         3Hb93diUhwyFP8C4kWPGMnwPaRpXPXht4QQ/kpZKF5jnCCQAPVKcAy9YiBr3XRFZphhR
         j5RtMilcx2S+tZnxLqgzahyBPPN46SS7PrMZhqbVmiAx/qIDt1frZpuxNaHqSPx8tKDa
         b1wYL+2ryqa0P2qy6PTf1I2RaGHkZPujd7kKqZMQSkechCXKDFR+0nD3p4eU2hIXQtbd
         LRHyJBe0tOqtz/Bso8yeWzj3aYPUA61HgtEgqFSPtZS+GvLvMQdCYNzs+BjyQwyLZqza
         BcYA==
X-Gm-Message-State: APjAAAWljt/wHL6JSNKQPmPIgAhWCRRg3PEGWulXKchfkXqhGbphOwjw
        s3dlAVzF6m0fY6QuesucvDDi5UHD
X-Google-Smtp-Source: APXvYqwP/IGmFrGkVPcfTGdqErGXlBuVbu/+N6gQBBgzkQUd0tPPIaqfbZysBovgiEFl3q+0p5pp3A==
X-Received: by 2002:a05:600c:204c:: with SMTP id p12mr10873659wmg.121.1560107315421;
        Sun, 09 Jun 2019 12:08:35 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:34 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: [PATCH v5 05/26] leds: core: Add support for composing LED class device names
Date:   Sun,  9 Jun 2019 21:07:42 +0200
Message-Id: <20190609190803.14815-6-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add generic support for composing LED class device name. The newly
introduced led_compose_name() function composes device name according
to either <color:function> or <devicename:color:function> pattern,
depending on the configuration of initialization data.

Backward compatibility with in-driver hard-coded LED class device
names is assured thanks to the default_label and devicename properties
of newly introduced struct led_init_data.

In case none of the aforementioned properties was found, then, for OF
nodes, the node name is adopted for LED class device name.

At the occassion of amending the Documentation/leds/leds-class.txt
unify spelling: colour -> color.

Alongside these changes added is a new tool - tools/leds/get_led_device_info.sh.
The tool allows retrieving details of a LED class device's parent device,
which proves that using vendor or product name for devicename part
of LED name doesn't convey any added value since that information had been
already available in sysfs. The script performs also basic validation
of a LED class device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
---
 Documentation/leds/leds-class.txt |  67 ++++++++++++-
 drivers/leds/led-class.c          |  20 +++-
 drivers/leds/led-core.c           | 127 ++++++++++++++++++++++++
 drivers/leds/leds.h               |   1 +
 include/linux/leds.h              |  45 +++++++++
 tools/leds/get_led_device_info.sh | 201 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 455 insertions(+), 6 deletions(-)
 create mode 100755 tools/leds/get_led_device_info.sh

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index 8b39cc6b03ee..e7316e37b57d 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -43,9 +43,70 @@ LED Device Naming
 
 Is currently of the form:
 
-"devicename:colour:function"
-
-There have been calls for LED properties such as colour to be exported as
+"devicename:color:function"
+
+devicename: It should refer to a unique identifier created by the kernel,
+            like e.g. phyN for network devices or inputN for input devices,
+            rather than to the hardware. The information related to the product
+            and the bus to which given device is hooked is available in the
+            sysfs and can be retrieved using get_led_device_info.sh script
+            from tools/leds. Generally this section is expected mostly for
+            LEDs that are somehow associated with other devices.
+
+color: one of the color strings from led_colors array defined
+       in drivers/leds/led-core.c.
+
+function: one of the LED_FUNCTION* definitions from the header
+          include/dt-bindings/leds/common.h.
+
+If required color or function is missing, please submit a patch
+to linux-leds@vger.kernel.org, adding required entries.
+
+It is possible that more than one LED with the same color and function will
+be required for given platform, differing only with an ordinal number.
+In this case it is preferable to just concatenate the predefined LED_FUNCTION*
+name with required "-N" suffix in the driver. fwnode based drivers can use
+function-enumerator property for that and then the concatenation will be handled
+automatically by the LED core upon LED class device registration.
+
+LED subsystem has also a protection against name clash, that may occur
+when LED class device is created by a driver of hot-pluggable device and
+it doesn't provide unique devicename section. In this case numerical
+suffix (e.g. "_1", "_2", "_3" etc.) is added to the requested LED class
+device name.
+
+There might be still LED class drivers around using vendor or product name
+for devicename, but this approach is now deprecated as it doesn't convey
+any added value. Product information can be found in other places in sysfs
+(see tools/leds/get_led_device_info.sh).
+
+Examples of proper LED names:
+
+"red:disk"
+"white:flash"
+"red:indicator"
+"phy1:green:wlan"
+"phy3::wlan"
+":kbd_backlight"
+"input5::kbd_backlight"
+"input3::numlock"
+"input3::scrolllock"
+"input3::capslock"
+"mmc1::status"
+"white:status"
+
+get_led_device_info.sh script can be used for verifying if the LED name
+meets the requirements pointed out here. It performs validation of the LED class
+devicename sections and gives hints on expected value for a section in case
+the validation fails for it. So far the script supports validation
+of associations between LEDs and following types of devices:
+
+- input devices
+- ieee80211 compliant USB devices
+
+The script is open to extensions.
+
+There have been calls for LED properties such as color to be exported as
 individual led class attributes. As a solution which doesn't incur as much
 overhead, I suggest these become part of the device name. The naming scheme
 above leaves scope for further attributes should they be needed. If sections
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index a564948e5f53..e3af0b71c9a9 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -257,17 +257,31 @@ int led_classdev_register_ext(struct device *parent,
 			      struct led_classdev *led_cdev,
 			      struct led_init_data *init_data)
 {
-	char name[LED_MAX_NAME_SIZE];
+	char composed_name[LED_MAX_NAME_SIZE];
+	char final_name[LED_MAX_NAME_SIZE];
+	const char *proposed_name = composed_name;
 	int ret;
 
-	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
+	if (init_data) {
+		if (init_data->devname_mandatory && !init_data->devicename) {
+			dev_err(parent, "Mandatory device name is missing");
+			return -EINVAL;
+		}
+		ret = led_compose_name(parent, init_data, composed_name);
+		if (ret < 0)
+			return ret;
+	} else {
+		proposed_name = led_cdev->name;
+	}
+
+	ret = led_classdev_next_name(proposed_name, final_name, sizeof(final_name));
 	if (ret < 0)
 		return ret;
 
 	mutex_init(&led_cdev->led_access);
 	mutex_lock(&led_cdev->led_access);
 	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
-				led_cdev, led_cdev->groups, "%s", name);
+				led_cdev, led_cdev->groups, "%s", final_name);
 	if (IS_ERR(led_cdev->dev)) {
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index e3da7c03da1b..dcd14ea40687 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -17,8 +17,10 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
+#include <uapi/linux/uleds.h>
 #include "leds.h"
 
 DECLARE_RWSEM(leds_list_lock);
@@ -27,6 +29,18 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
 LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);
 
+const char *led_colors[LED_COLOR_ID_MAX] = {
+	[LED_COLOR_ID_WHITE] = "white",
+	[LED_COLOR_ID_RED] = "red",
+	[LED_COLOR_ID_GREEN] = "green",
+	[LED_COLOR_ID_BLUE] = "blue",
+	[LED_COLOR_ID_AMBER] = "amber",
+	[LED_COLOR_ID_VIOLET] = "violet",
+	[LED_COLOR_ID_YELLOW] = "yellow",
+	[LED_COLOR_ID_IR] = "ir",
+};
+EXPORT_SYMBOL_GPL(led_colors);
+
 static int __led_set_brightness(struct led_classdev *led_cdev,
 				enum led_brightness value)
 {
@@ -357,3 +371,116 @@ void led_sysfs_enable(struct led_classdev *led_cdev)
 	led_cdev->flags &= ~LED_SYSFS_DISABLE;
 }
 EXPORT_SYMBOL_GPL(led_sysfs_enable);
+
+static void led_parse_fwnode_props(struct device *dev,
+				   struct fwnode_handle *fwnode,
+				   struct led_properties *props)
+{
+	int ret;
+
+	if (!fwnode)
+		return;
+
+	if (fwnode_property_present(fwnode, "label")) {
+		ret = fwnode_property_read_string(fwnode, "label", &props->label);
+		if (ret)
+			dev_err(dev, "Error parsing \'label\' property (%d)\n", ret);
+		return;
+	}
+
+	if (fwnode_property_present(fwnode, "color")) {
+		ret = fwnode_property_read_u32(fwnode, "color", &props->color);
+		if (ret)
+			dev_err(dev, "Error parsing \'color\' property (%d)\n", ret);
+		else if (props->color >= LED_COLOR_ID_MAX)
+			dev_err(dev, "LED color identifier out of range\n");
+		else
+			props->color_present = true;
+	}
+
+
+	if (fwnode_property_present(fwnode, "function")) {
+		ret = fwnode_property_read_string(fwnode, "function", &props->function);
+		if (ret) {
+			dev_err(dev,
+				"Error parsing \'function\' property (%d)\n",
+				ret);
+		}
+	} else {
+		return;
+	}
+
+	if (fwnode_property_present(fwnode, "function-enumerator")) {
+		ret = fwnode_property_read_u32(fwnode, "function-enumerator",
+					       &props->func_enum);
+		if (ret) {
+			dev_err(dev,
+				"Error parsing \'function-enumerator\' property (%d)\n",
+				ret);
+		} else {
+			props->func_enum_present = true;
+		}
+	}
+}
+
+int led_compose_name(struct device *dev, struct led_init_data *init_data,
+		     char *led_classdev_name)
+{
+	struct led_properties props = {};
+	struct fwnode_handle *fwnode = init_data->fwnode;
+	const char *devicename = init_data->devicename;
+
+	if (!led_classdev_name)
+		return -EINVAL;
+
+	led_parse_fwnode_props(dev, fwnode, &props);
+
+	if (props.label) {
+		/*
+		 * If init_data.devicename is NULL, then it indicates that
+		 * DT label should be used as-is for LED class device name.
+		 * Otherwise the label is prepended with devicename to compose
+		 * the final LED class device name.
+		 */
+		if (!devicename) {
+			strncpy(led_classdev_name, props.label,
+				LED_MAX_NAME_SIZE);
+		} else {
+			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+				 devicename, props.label);
+		}
+	} else if (props.function || props.color_present) {
+		char tmp_buf[LED_MAX_NAME_SIZE];
+
+		if (props.func_enum_present) {
+			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
+				 props.color_present ? led_colors[props.color] : "",
+				 props.function ?: "", props.func_enum);
+		} else {
+			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
+				 props.color_present ? led_colors[props.color] : "",
+				 props.function ?: "");
+		}
+		if (init_data->devname_mandatory) {
+			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+				 devicename, tmp_buf);
+		} else {
+			strncpy(led_classdev_name, tmp_buf, LED_MAX_NAME_SIZE);
+
+		}
+	} else if (init_data->default_label) {
+		if (!devicename) {
+			dev_err(dev, "Legacy LED naming requires devicename segment");
+			return -EINVAL;
+		}
+		snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+			 devicename, init_data->default_label);
+	} else if (is_of_node(fwnode)) {
+		strncpy(led_classdev_name, to_of_node(fwnode)->name,
+			LED_MAX_NAME_SIZE);
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(led_compose_name);
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 7d38e6b9a740..0d223c1f93b2 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -31,5 +31,6 @@ void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
 extern struct list_head trigger_list;
+extern const char *led_colors[LED_COLOR_ID_MAX];
 
 #endif	/* __LEDS_H_INCLUDED */
diff --git a/include/linux/leds.h b/include/linux/leds.h
index fab83a2d7bff..03e9795fa23b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -12,6 +12,7 @@
 #ifndef __LINUX_LEDS_H_INCLUDED
 #define __LINUX_LEDS_H_INCLUDED
 
+#include <dt-bindings/leds/common.h>
 #include <linux/device.h>
 #include <linux/kernfs.h>
 #include <linux/list.h>
@@ -37,6 +38,25 @@ enum led_brightness {
 struct led_init_data {
 	/* device fwnode handle */
 	struct fwnode_handle *fwnode;
+	/*
+	 * default <color:function> tuple, for backward compatibility
+	 * with in-driver hard-coded LED names used as a fallback when
+	 * DT "label" property is absent; it should be set to NULL
+	 * in new LED class drivers.
+	 */
+	const char *default_label;
+	/*
+	 * string to be used for devicename section of LED class device
+	 * either for label based LED name composition path or for fwnode
+	 * based when devname_mandatory is true
+	 */
+	const char *devicename;
+	/*
+	 * indicates if LED name should always comprise devicename section;
+	 * only LEDs exposed by drivers of hot-pluggable devices should
+	 * set it to true
+	 */
+	bool devname_mandatory;
 };
 
 struct led_classdev {
@@ -262,6 +282,22 @@ extern void led_sysfs_disable(struct led_classdev *led_cdev);
 extern void led_sysfs_enable(struct led_classdev *led_cdev);
 
 /**
+ * led_compose_name - compose LED class device name
+ * @dev: LED controller device object
+ * @child: child fwnode_handle describing a LED or a group of synchronized LEDs;
+ *	   it must be provided only for fwnode based LEDs
+ * @led_classdev_name: composed LED class device name
+ *
+ * Create LED class device name basing on the provided init_data argument.
+ * The name can have <devicename:color:function> or <color:function>.
+ * form, depending on the init_data configuration.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+extern int led_compose_name(struct device *dev, struct led_init_data *init_data,
+			    char *led_classdev_name);
+
+/**
  * led_sysfs_is_disabled - check if LED sysfs interface is disabled
  * @led_cdev: the LED to query
  *
@@ -438,6 +474,15 @@ struct led_platform_data {
 	struct led_info	*leds;
 };
 
+struct led_properties {
+	u32		color;
+	bool		color_present;
+	const char	*function;
+	u32		func_enum;
+	bool		func_enum_present;
+	const char	*label;
+};
+
 struct gpio_desc;
 typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 				unsigned long *delay_on,
diff --git a/tools/leds/get_led_device_info.sh b/tools/leds/get_led_device_info.sh
new file mode 100755
index 000000000000..ccfa442db5fe
--- /dev/null
+++ b/tools/leds/get_led_device_info.sh
@@ -0,0 +1,201 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+led_common_defs_path="include/dt-bindings/leds/common.h"
+
+num_args=$#
+if [ $num_args -eq 1 ]; then
+        linux_top=$(dirname `realpath $0` | awk -F/     \
+                        '{                              \
+                                i=1;                    \
+                                while (i <= NF - 2) {   \
+                                        printf $i"/";   \
+                                        i++;            \
+                                };                      \
+                        }')
+	led_defs_path=$linux_top/$led_common_defs_path
+elif [ $num_args -eq 2 ]; then
+        led_defs_path=`realpath $2`
+else
+	echo "Usage: get_led_device_info.sh LED_CDEV_PATH [LED_COMMON_DEFS_PATH]"
+	exit 1
+fi
+
+if [ ! -f $led_defs_path ]; then
+	echo "$led_defs_path doesn't exist"
+	exit 1
+fi
+
+led_cdev_path=`echo $1 | sed s'/\/$//'`
+
+ls "$led_cdev_path/brightness" > /dev/null 2>&1
+if [ $? -ne 0 ]; then
+	echo "Device \"$led_cdev_path\" does not exist."
+	exit 1
+fi
+
+bus=`readlink $led_cdev_path/device/subsystem | sed s'/.*\///'`
+usb_subdev=`readlink $led_cdev_path | grep usb | sed s'/\(.*usb[0-9]*\/[0-9]*-[0-9]*\)\/.*/\1/'`
+ls "$led_cdev_path/device/of_node/compatible" > /dev/null 2>&1
+of_node_missing=$?
+
+if [ "$bus" = "input" ]; then
+	input_node=`readlink $led_cdev_path/device | sed s'/.*\///'`
+	if [ ! -z "$usb_subdev" ]; then
+		bus="usb"
+	fi
+fi
+
+if [ "$bus" = "usb" ]; then
+	usb_interface=`readlink $led_cdev_path | sed s'/.*\(usb[0-9]*\)/\1/' | cut -d\/ -f3`
+	cd $led_cdev_path/../$usb_subdev
+	driver=`readlink $usb_interface/driver | sed s'/.*\///'`
+	if [ -d "$usb_interface/ieee80211" ]; then
+		wifi_phy=`ls -l $usb_interface/ieee80211 | grep phy | awk '{print $9}'`
+	fi
+	idVendor=`cat idVendor`
+	idProduct=`cat idProduct`
+	manufacturer=`cat manufacturer`
+	product=`cat product`
+elif [ "$bus" = "input" ]; then
+	cd $led_cdev_path
+	product=`cat device/name`
+	driver=`cat device/device/driver/description`
+elif [ $of_node_missing -eq 0 ]; then
+	cd $led_cdev_path
+	compatible=`cat device/of_node/compatible`
+	if [ "$compatible" = "gpio-leds" ]; then
+		driver="leds-gpio"
+	elif [ "$compatible" = "pwm-leds" ]; then
+		driver="leds-pwm"
+	else
+		manufacturer=`echo $compatible | awk -F, '{print $1}'`
+		product=`echo $compatible | awk -F, '{print $2}'`
+	fi
+else
+	echo "Unknown device type."
+	exit 1
+fi
+
+printf "\n#####################################\n"
+printf "# LED class device hardware details #\n"
+printf "#####################################\n\n"
+
+printf "bus:\t\t\t$bus\n"
+
+if [ ! -z "$idVendor" ]; then
+	printf "idVendor:\t\t$idVendor\n"
+fi
+
+if [ ! -z "$idProduct" ]; then
+	printf "idProduct:\t\t$idProduct\n"
+fi
+
+if [ ! -z "$manufacturer" ]; then
+	printf "manufacturer:\t\t$manufacturer\n"
+fi
+
+if [ ! -z "$product" ]; then
+	printf "product:\t\t$product\n"
+fi
+
+if [ ! -z "$driver" ]; then
+	printf "driver:\t\t\t$driver\n"
+fi
+
+if [ ! -z "$input_node" ]; then
+	printf "associated input node:\t$input_node\n"
+fi
+
+printf "\n####################################\n"
+printf "# LED class device name validation #\n"
+printf "####################################\n\n"
+
+led_name=`echo $led_cdev_path | sed s'/.*\///'`
+
+num_sections=`echo $led_name | awk -F: '{print NF}'`
+
+if [ $num_sections -eq 1 ]; then
+	printf "\":\" delimiter not detected.\t[ FAILED ]\n"
+	exit 1
+elif [ $num_sections -eq 2 ]; then
+	color=`echo $led_name | cut -d: -f1`
+	function=`echo $led_name | cut -d: -f2`
+elif [ $num_sections -eq 3 ]; then
+	devicename=`echo $led_name | cut -d: -f1`
+	color=`echo $led_name | cut -d: -f2`
+	function=`echo $led_name | cut -d: -f3`
+else
+	printf "Detected %d sections in the LED class device name - should the script be updated?\n" $num_sections
+	exit 1
+fi
+
+S_DEV="devicename"
+S_CLR="color     "
+S_FUN="function  "
+status_tab=20
+
+print_msg_ok()
+{
+	local section_name="$1"
+	local section_val="$2"
+	local msg="$3"
+	printf "$section_name :\t%-${status_tab}.${status_tab}s %s %s\n" "$section_val" "[ OK ]    " "$msg"
+}
+
+print_msg_failed()
+{
+	local section_name="$1"
+	local section_val="$2"
+	local msg="$3"
+	printf "$section_name :\t%-${status_tab}.${status_tab}s %s %s\n" "$section_val" "[ FAILED ]" "$msg"
+}
+
+if [ ! -z "$input_node" ]; then
+	expected_devname=$input_node
+elif [ ! -z "$wifi_phy" ]; then
+	expected_devname=$wifi_phy
+fi
+
+if [ ! -z "$devicename" ]; then
+	if [ ! -z "$expected_devname" ]; then
+		if [ "$devicename" = "$expected_devname" ]; then
+			print_msg_ok "$S_DEV" "$devicename"
+		else
+			print_msg_failed "$S_DEV" "$devicename" "Expected: $expected_devname"
+		fi
+	else
+		if [ "$devicename" = "$manufacturer" ]; then
+			print_msg_failed "$S_DEV" "$devicename" "Redundant: use of vendor name is discouraged"
+		elif [ "$devicename" = "$product" ]; then
+			print_msg_failed "$S_DEV" "$devicename" "Redundant: use of product name is discouraged"
+		else
+			print_msg_failed "$S_DEV" "$devicename" "Unknown devicename - should the script be updated?"
+		fi
+	fi
+elif [ ! -z "$expected_devname" ]; then
+	print_msg_failed "$S_DEV" "blank" "Expected: $expected_devname"
+fi
+
+if [ ! -z "$color" ]; then
+	color_upper=`echo $color | tr [:lower:] [:upper:]`
+	color_id_definition=$(cat $led_defs_path | grep "_$color_upper\s" | awk '{print $2}')
+	if [ ! -z "$color_id_definition" ]; then
+		print_msg_ok "$S_CLR" "$color" "Matching definition: $color_id_definition"
+	else
+		print_msg_failed "$S_CLR" "$color" "Definition not found in $led_defs_path"
+	fi
+
+fi
+
+if [ ! -z "$function" ]; then
+	# strip optional enumerator
+	function=`echo $function | sed s'/\(.*\)-[0-9]*$/\1/'`
+	fun_definition=$(cat $led_defs_path | grep "\"$function\"" | awk '{print $2}')
+	if [ ! -z "$fun_definition" ]; then
+		print_msg_ok "$S_FUN" "$function" "Matching definition: $fun_definition"
+	else
+		print_msg_failed "$S_FUN" "$function" "Definition not found in $led_defs_path"
+	fi
+
+fi
-- 
2.11.0

