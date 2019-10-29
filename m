Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A8BE8896
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 13:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387498AbfJ2MrK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Oct 2019 08:47:10 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46590 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJ2MrK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Oct 2019 08:47:10 -0400
Received: by mail-lj1-f196.google.com with SMTP id w8so10603877lji.13;
        Tue, 29 Oct 2019 05:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6DepqQwG4GkcRobHeCqab9+JWW1EC1y6nJbqtRKAHCw=;
        b=edp+d9xWOx3p7AwFxO6p7qHEJ9hDg+o/0rO1rUiU+G5dBInaFeGacCp/zQQ+DG3xjE
         ENj2hVHMfHttmxIJzli3fAvl4763w9XVDM+GTL6LzsR+gZHdV9Y839QdXpHO9uoPHUrq
         uw7013QF+Pw2HbpBTQ6YneS0qTZDVNJKTE9lSRLdDeHJAiJV61t5V91B5bDi+nbDAGkX
         +YzlouQxM2XB9SdL91O29YeRy49NMjznD1mQcrVDCU0QHPUjyJzshdxby8ZBcaZmTkv6
         efAtWnq1ms8MHgfghk0RRK7p6qJOnta5I1J1yxTBjtM24+/TWz90pZgqXfJe8vSpNgZP
         XSXA==
X-Gm-Message-State: APjAAAUSsvkT1ZHWocsGMpJaPEnDONqjrBZ/aBtxWH/oIEYP3kLIW3ry
        M/cq9j1fILlPhJKisz/yoHU=
X-Google-Smtp-Source: APXvYqyYC6MX1SOev3BqMYbapowAjXShJq7l+EhuTObRCsvmMpBzKAkRNbpvj3B3vFrx5VI5wM+Wdg==
X-Received: by 2002:a2e:93d7:: with SMTP id p23mr2531643ljh.251.1572353225812;
        Tue, 29 Oct 2019 05:47:05 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id r22sm6050900ljk.31.2019.10.29.05.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:47:05 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:46:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/5] leds: Add common LED binding parsing support to LED
 class/core
Message-ID: <15562904205665d962240d6131c9958b49ecc7e3.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Qucik grep for 'for_each' or 'linux,default-trigger' or
'default-state' under drivers/leds can tell quite a lot. It seems
multiple LED controller drivers implement the very similar looping
through the child nodes in order to locate the LED nodes and read
and support the common LED dt bindings. Implementing this same
stuff for all LED controllers gets old pretty fast.

This commit adds support for locating the LED node (based on known
node names - this is one RFC item as it may not be optimal) and
parsing of a few common LED DT properties.

This is achieved via new API and old APIs are untouched. Ideally
the new API won't be introduced though but some of the existing
APIs could be converted to do the DT node lookup and parsing.

If no starting point for node lookup is given, (parent) device's
own DT node is used. If no node name match is given, then device's
own node or passed stating point are used as such.

linux,default-trigger,
default-state (with the exception of keep),

(in addition to already handled
function-enumerator,
function,
color
and label).

Additionally this commit gives a nudge towards transferring the
led_classdev ownership from led controller drivers to LED class.
New API no longer allows controller driver to provide the
led_classdev but only the required init_data and operations. In
general most of the drivers should not directly touch the
leds_classdev after it is initialized. LEDs class belongs to,
well, LEDs class.

This commit HAS NOT BEEN TESTED at all. Only compile tested.
This is only RFC - Eg, request for comments. If people see some
of the ideas as useful then properly tested patch can be provided.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/leds/led-class.c | 247 ++++++++++++++++++++++++++++++++++++++-
 drivers/leds/led-core.c  | 111 +++++++++++-------
 include/linux/leds.h     | 144 +++++++++++++++++++++--
 3 files changed, 451 insertions(+), 51 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 647b1263c579..ba5da3b49010 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -235,6 +235,206 @@ static int led_classdev_next_name(const char *init_name, char *name,
 	return i;
 }
 
+int led_of_required_props_found(struct led_properties *props)
+{
+	/* RFC_NOTE: Do we _require_ function or label if DT is used? */
+	return (props->function || props->label);
+}
+
+static void led_add_props(struct led_classdev *ld, struct led_properties *props)
+{
+	ld->default_trigger = props->default_trigger;
+	/*
+	 * According to binding docs the LED is by-default turned OFF unless
+	 * default_state is used to indicate it should be ON or that state
+	 * should be kept as is
+	 */
+	ld->brightness = LED_OFF;
+	if (props->default_state) {
+		if (!strcmp(props->default_state, "on"))
+			ld->brightness = LED_FULL;
+	/*
+	 * RFC_NOTE:
+	 * Do we need handling for 'keep'? We probably should not call the
+	 * brightness_get prior calling the of_parse_cb if one is provided.
+	 *
+	 * If handling 'keep' is needed then we can add a flag to
+	 * advertice that state should be queried and kept as-is. Else
+	 * the drivers should implement own of_parse_cb just for handling
+	 * the keep - which feels wrong... LED core could/should do it
+	 * automagically if brightness_get is provided.
+	 */
+	}
+}
+/*
+ * RFC_NOTE: Ideally we could have the pointer to a struct led_ops in struct
+ * led_classdev and we could just directly populate it. But I don't want to go
+ * through all the existing drivers for this change now.
+ */
+static void led_add_ops(struct led_classdev *ld, const struct led_ops *ops)
+{
+	ld->brightness_set = ops->brightness_set;
+	ld->brightness_set_blocking = ops->brightness_set_blocking;
+	ld->brightness_get = ops->brightness_get;
+	ld->blink_set = ops->blink_set;
+	ld->pattern_set = ops->pattern_set;
+	ld->pattern_clear = ops->pattern_clear;
+	ld->flash_resume = ops->flash_resume;
+}
+
+/*
+ * RFC_NOTE: Maybe the led drivers should initialize all fields in
+ * led_classdev struct by default. I guess big part of led_classdev should
+ * belong to LED-class and ideally drivers only provide const init data and ops
+ * for the class.
+ *
+ * We should not provide both led_classdev_register_dt and
+ * led_classdev_register_ext. These functions should be merged to do what is
+ * the best approach when we have fwnode.
+ */
+
+/**
+ * led_classdev_register_dt - register LED device with FW node 'match'
+ *
+ * @parent: LED controller device this LED is driven by
+ * @ops: LED control operations for this LED
+ * @init_data: the LED class device initialization data
+ *
+ * Returns a handle to use for unregistering or error ptr.
+ */
+void *led_classdev_register_dt(struct device *parent,
+				const struct led_ops *ops,
+				struct led_init_data *init_data)
+{
+	char composed_name[LED_MAX_NAME_SIZE];
+	char final_name[LED_MAX_NAME_SIZE];
+	const char *proposed_name = composed_name;
+	int ret;
+	struct led_properties props = {};
+	struct led_classdev *ld;
+	struct fwnode_handle *fw;
+
+	if (!init_data || !ops)
+		return ERR_PTR(-EINVAL);
+
+	if (init_data->devname_mandatory && !init_data->devicename) {
+		dev_err(parent, "Mandatory device name is missing");
+		return ERR_PTR(-EINVAL);
+	}
+
+	fw = led_find_fwnode(parent, init_data);
+	if (!fw) {
+		dev_err(parent, "No fwnode found\n");
+		return ERR_PTR(-ENOENT);
+	}
+
+	ret = led_parse_fwnode_props(parent, fw, &props);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	ret = led_of_required_props_found(&props);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ld = devm_kzalloc(parent, sizeof(*ld), GFP_KERNEL);
+	if (!ld)
+		return ERR_PTR(-ENOMEM);
+
+	ret = led_compose_name(parent, init_data, &props, composed_name);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	ret = led_classdev_next_name(proposed_name, final_name,
+				     sizeof(final_name));
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	/*
+	 * We don't want each driver to need to travel through the DT nodes in
+	 * order to locate correct. Call driver's fw node parsing callback and
+	 * pass it the node we already located if callback has been registered.
+	 * That way driver can easily skim through anydriver specific properties
+	 * it may have.
+	 *
+	 * Also add pointer to init_data so that driver can embed
+	 * it to it's own private data and obtain private data using offset_of.
+	 * This is needed if the driver no longer posses the led_classdev.
+	 */
+	ld->init_data = init_data;
+	if (init_data->of_parse_cb)
+		ret = init_data->of_parse_cb(ld, fw, &props);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	led_add_props(ld, &props);
+	led_add_ops(ld, ops);
+
+	mutex_init(&ld->led_access);
+	mutex_lock(&ld->led_access);
+	ld->dev = device_create_with_groups(leds_class, parent, 0,
+				ld, ld->groups, "%s", final_name);
+	if (IS_ERR(ld->dev)) {
+		mutex_unlock(&ld->led_access);
+		return ld->dev;
+	}
+	if (init_data && init_data->fwnode)
+		ld->dev->fwnode = fw;
+
+	if (ret)
+		dev_warn(parent, "Led %s renamed to %s due to name collision",
+				ld->name, dev_name(ld->dev));
+
+	if (ld->flags & LED_BRIGHT_HW_CHANGED) {
+		ret = led_add_brightness_hw_changed(ld);
+		if (ret) {
+			device_unregister(ld->dev);
+			ld->dev = NULL;
+			mutex_unlock(&ld->led_access);
+			return ERR_PTR(ret);
+		}
+	}
+
+	ld->work_flags = 0;
+#ifdef CONFIG_LEDS_TRIGGERS
+	init_rwsem(&ld->trigger_lock);
+#endif
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	ld->brightness_hw_changed = -1;
+#endif
+	/* add to the list of leds */
+	down_write(&leds_list_lock);
+	list_add_tail(&ld->node, &leds_list);
+	up_write(&leds_list_lock);
+
+	if (!ld->max_brightness)
+		ld->max_brightness = LED_FULL;
+
+	led_update_brightness(ld);
+
+	led_init_core(ld);
+
+#ifdef CONFIG_LEDS_TRIGGERS
+	led_trigger_set_default(ld);
+#endif
+
+	mutex_unlock(&ld->led_access);
+
+	dev_dbg(parent, "Registered led device: %s\n",
+			ld->name);
+
+	return ld;
+}
+EXPORT_SYMBOL_GPL(led_classdev_register_dt);
+
+void led_classdecv_unregister_dt(void *handle)
+{
+	return led_classdev_unregister((struct led_classdev *)handle);
+}
+EXPORT_SYMBOL_GPL(led_classdecv_unregister_dt);
+/*
+ * RFC_NOTE: We could perhaps merge this with 'led_classdev_register_dt'
+ * I don't think we should have two interfaces for same thing in the long run.
+ */
 /**
  * led_classdev_register_ext - register a new object of led_classdev class
  *			       with init data.
@@ -251,13 +451,17 @@ int led_classdev_register_ext(struct device *parent,
 	char final_name[LED_MAX_NAME_SIZE];
 	const char *proposed_name = composed_name;
 	int ret;
+	struct led_properties props = {};
 
 	if (init_data) {
 		if (init_data->devname_mandatory && !init_data->devicename) {
 			dev_err(parent, "Mandatory device name is missing");
 			return -EINVAL;
 		}
-		ret = led_compose_name(parent, init_data, composed_name);
+		led_parse_fwnode_props(parent, init_data->fwnode, &props);
+
+		ret = led_compose_name(parent, init_data, &props,
+				       composed_name);
 		if (ret < 0)
 			return ret;
 	} else {
@@ -370,6 +574,47 @@ static void devm_led_classdev_release(struct device *dev, void *res)
 	led_classdev_unregister(*(struct led_classdev **)res);
 }
 
+/**
+ * devm_led_classdev_register_dt - resource managed led_classdev_register_dt()
+ *
+ * @parent: parent of LED device
+ * @ops: the led_device operations
+ * @init_data: LED class device initialization data
+ */
+void *devm_led_classdev_register_dt(struct device *parent,
+				     const struct led_ops *ops,
+				     struct led_init_data *init_data)
+{
+	void **ptr, *handle;
+
+	ptr = devres_alloc(devm_led_classdev_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	handle = led_classdev_register_dt(parent, ops, init_data);
+	if (!IS_ERR(handle)) {
+		*ptr = handle;
+		devres_add(parent, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return handle;
+}
+EXPORT_SYMBOL_GPL(devm_led_classdev_register_dt);
+
+/**
+ * devm_led_classdev_unregister_dt - resource managed led_classdev_unregister_dt
+ * @dev: The device to unregister.
+ * @handle: The handle returned by devm_led_classdev_register_dt.
+ */
+void devm_led_classdev_unregister_dt(struct device *dev,
+				     void *handle)
+{
+	devm_led_classdev_unregister(dev, handle);
+}
+EXPORT_SYMBOL_GPL(devm_led_classdev_unregister_dt);
+
 /**
  * devm_led_classdev_register_ext - resource managed led_classdev_register_ext()
  *
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..d6217e807e70 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -365,70 +365,99 @@ void led_sysfs_enable(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_sysfs_enable);
 
-static void led_parse_fwnode_props(struct device *dev,
-				   struct fwnode_handle *fwnode,
-				   struct led_properties *props)
+int led_parse_fwnode_props(struct device *dev, struct fwnode_handle *fwnode,
+			   struct led_properties *props)
 {
-	int ret;
+	int ret = 0;
 
 	if (!fwnode)
-		return;
+		return -EINVAL;
 
 	if (fwnode_property_present(fwnode, "label")) {
 		ret = fwnode_property_read_string(fwnode, "label", &props->label);
 		if (ret)
 			dev_err(dev, "Error parsing 'label' property (%d)\n", ret);
-		return;
+		return ret;
 	}
 
+	/**
+	 * Please note, logic changed - if invalid property is found we bail
+	 * early out without parsing the rest of the properties. Originally
+	 * this was the case only for 'label' property. I don't know the
+	 * rationale behind original logic allowing invalid properties to be
+	 * given. If there is a reason then we should reconsider this.
+	 * Intuitively it feels correct to just yell and quit if we hit value we
+	 * don't understand - but intuition may be wrong at times :)
+	 */
 	if (fwnode_property_present(fwnode, "color")) {
 		ret = fwnode_property_read_u32(fwnode, "color", &props->color);
-		if (ret)
+		if (ret) {
 			dev_err(dev, "Error parsing 'color' property (%d)\n", ret);
-		else if (props->color >= LED_COLOR_ID_MAX)
+			return ret;
+		} else if (props->color >= LED_COLOR_ID_MAX) {
 			dev_err(dev, "LED color identifier out of range\n");
-		else
-			props->color_present = true;
+			return ret;
+		}
+		props->color_present = true;
 	}
 
+	if (fwnode_property_present(fwnode, "function")) {
+		ret = fwnode_property_read_string(fwnode, "function",
+						  &props->function);
+		if (ret) {
+			dev_err(dev,
+				"Error parsing 'function' property (%d)\n",
+				ret);
+			return ret;
+		}
+	}
 
-	if (!fwnode_property_present(fwnode, "function"))
-		return;
-
-	ret = fwnode_property_read_string(fwnode, "function", &props->function);
-	if (ret) {
-		dev_err(dev,
-			"Error parsing 'function' property (%d)\n",
-			ret);
+	if (fwnode_property_present(fwnode, "function-enumerator")) {
+		ret = fwnode_property_read_u32(fwnode, "function-enumerator",
+					       &props->func_enum);
+		if (ret) {
+			dev_err(dev,
+				"Error parsing 'function-enumerator' property (%d)\n",
+				ret);
+			return ret;
+		}
+		props->func_enum_present = true;
 	}
 
-	if (!fwnode_property_present(fwnode, "function-enumerator"))
-		return;
+	if (fwnode_property_present(fwnode, "default-state")) {
+		ret = fwnode_property_read_string(fwnode, "default-state",
+						  &props->default_state);
+		if (ret) {
+			dev_err(dev,
+				"Error parsing 'default-state' property (%d)\n",
+				ret);
+			return ret;
+		}
+	}
 
-	ret = fwnode_property_read_u32(fwnode, "function-enumerator",
-				       &props->func_enum);
-	if (ret) {
-		dev_err(dev,
-			"Error parsing 'function-enumerator' property (%d)\n",
-			ret);
-	} else {
-		props->func_enum_present = true;
+	if (fwnode_property_present(fwnode, "linux,default-trigger")) {
+		ret = fwnode_property_read_string(fwnode,
+						  "linux,default-trigger",
+						  &props->default_trigger);
+		if (ret)
+			dev_err(dev,
+				"Error parsing 'linux,default-trigger' property (%d)\n",
+				ret);
 	}
+	return ret;
 }
+EXPORT_SYMBOL_GPL(led_parse_fwnode_props);
 
 int led_compose_name(struct device *dev, struct led_init_data *init_data,
-		     char *led_classdev_name)
+		     struct led_properties *props, char *led_classdev_name)
 {
-	struct led_properties props = {};
 	struct fwnode_handle *fwnode = init_data->fwnode;
 	const char *devicename = init_data->devicename;
 
 	if (!led_classdev_name)
 		return -EINVAL;
 
-	led_parse_fwnode_props(dev, fwnode, &props);
-
-	if (props.label) {
+	if (props->label) {
 		/*
 		 * If init_data.devicename is NULL, then it indicates that
 		 * DT label should be used as-is for LED class device name.
@@ -436,23 +465,23 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 		 * the final LED class device name.
 		 */
 		if (!devicename) {
-			strscpy(led_classdev_name, props.label,
+			strscpy(led_classdev_name, props->label,
 				LED_MAX_NAME_SIZE);
 		} else {
 			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
-				 devicename, props.label);
+				 devicename, props->label);
 		}
-	} else if (props.function || props.color_present) {
+	} else if (props->function || props->color_present) {
 		char tmp_buf[LED_MAX_NAME_SIZE];
 
-		if (props.func_enum_present) {
+		if (props->func_enum_present) {
 			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
-				 props.color_present ? led_colors[props.color] : "",
-				 props.function ?: "", props.func_enum);
+				 props->color_present ? led_colors[props->color] : "",
+				 props->function ?: "", props->func_enum);
 		} else {
 			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
-				 props.color_present ? led_colors[props.color] : "",
-				 props.function ?: "");
+				 props->color_present ? led_colors[props->color] : "",
+				 props->function ?: "");
 		}
 		if (init_data->devname_mandatory) {
 			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
diff --git a/include/linux/leds.h b/include/linux/leds.h
index efb309dba914..bf254f271e31 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -13,6 +13,7 @@
 #include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/rwsem.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -20,6 +21,7 @@
 
 struct device;
 struct led_pattern;
+struct led_classdev;
 /*
  * LED Core
  */
@@ -31,7 +33,34 @@ enum led_brightness {
 	LED_FULL	= 255,
 };
 
+struct led_properties {
+	u32		color;
+	bool		color_present;
+	const char	*function;
+	u32		func_enum;
+	bool		func_enum_present;
+	const char	*label;
+	const char	*default_trigger;
+	const char	*default_state;
+};
+
+struct led_ops {
+	void (*brightness_set)(struct led_classdev *led_cdev,
+			       enum led_brightness brightness);
+	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
+				       enum led_brightness brightness);
+	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
+	int (*blink_set)(struct led_classdev *led_cdev,
+			 unsigned long *delay_on,
+			 unsigned long *delay_off);
+	int (*pattern_set)(struct led_classdev *led_cdev,
+			   struct led_pattern *pattern, u32 len, int repeat);
+	int (*pattern_clear)(struct led_classdev *led_cdev);
+	void (*flash_resume)(struct led_classdev *led_cdev);
+};
+
 struct led_init_data {
+	const char *of_match;
 	/* device fwnode handle */
 	struct fwnode_handle *fwnode;
 	/*
@@ -53,9 +82,31 @@ struct led_init_data {
 	 * set it to true
 	 */
 	bool devname_mandatory;
+	/*
+	 * RFC_NOTE: if led_classdev_register_ext is merged with
+	 * led_classdev_register_dt - then led_classdev_register_ext should
+	 * invoke this too.
+	 */
+	/*
+	 * Callback which a LED driver can register if it has own non-standard
+	 * DT properties. Core calls this with the located DT node during
+	 * class_device registration when led_classdev_register_dt API is used
+	 */
+	int (*of_parse_cb)(struct led_classdev *ld, struct fwnode_handle *fw,
+			    struct led_properties *props);
+	/*
+	 * RFC_NOTE: init data should probably also contain the flags entry
+	 * for some of the flags - but I don't think we should add all of them
+	 * right away - rather add new things to init data 'as needed' basis?
+	 *
+	 * And if not all of the flags are meant for drivers (but for core) -
+	 * then we might want to add independent bool entities rather than
+	 * 'flags' member here?
+	 */
 };
 
 struct led_classdev {
+	struct led_init_data	*init_data;
 	const char		*name;
 	enum led_brightness	 brightness;
 	enum led_brightness	 max_brightness;
@@ -150,6 +201,32 @@ struct led_classdev {
 	struct mutex		led_access;
 };
 
+/**
+ * led_classdev_register_dt - register LED device with FW node 'match'
+ *
+ * @parent: LED controller device this LED is driven by
+ * @ops: LED control operations for this LED
+ * @init_data: the LED class device initialization data
+ *
+ * Returns a handle to use for unregistering or error ptr.
+ */
+void *led_classdev_register_dt(struct device *parent,
+			       const struct led_ops *ops,
+			       struct led_init_data *init_data);
+
+/**
+ * devm_led_classdev_register_dt - resource managed led_classdev_register_dt()
+ *
+ * @parent: parent of LED device
+ * @ops: the led_device operations
+ * @init_data: LED class device initialization data
+ */
+void *devm_led_classdev_register_dt(struct device *parent,
+				    const struct led_ops *ops,
+				    struct led_init_data *init_data);
+
+void led_classdecv_unregister_dt(void *handle);
+void devm_led_classdev_unregister_dt(struct device *dev, void *handle);
 /**
  * led_classdev_register_ext - register a new object of LED class with
  *			       init data
@@ -302,6 +379,7 @@ extern void led_sysfs_enable(struct led_classdev *led_cdev);
  * led_compose_name - compose LED class device name
  * @dev: LED controller device object
  * @init_data: the LED class device initialization data
+ * @props: LED properties as parsed from fwnode.
  * @led_classdev_name: composed LED class device name
  *
  * Create LED class device name basing on the provided init_data argument.
@@ -311,6 +389,7 @@ extern void led_sysfs_enable(struct led_classdev *led_cdev);
  * Returns: 0 on success or negative error value on failure
  */
 extern int led_compose_name(struct device *dev, struct led_init_data *init_data,
+			    struct led_properties *props,
 			    char *led_classdev_name);
 
 /**
@@ -324,6 +403,62 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
 	return led_cdev->flags & LED_SYSFS_DISABLE;
 }
 
+/**
+ * led_find_fwnode - find fwnode matching given LED
+ * @parent: LED controller device this LED is driven by
+ * @init_data: the LED class device initialization data
+ *
+ * Find the fw node matching given LED init data.
+ *
+ * Returns: node handle or NULL if matching fw node was not found
+ */
+static inline struct fwnode_handle *led_find_fwnode(struct device *parent,
+						struct led_init_data *init_data)
+{
+	struct fwnode_handle *fw;
+
+	if (!init_data)
+		return dev_fwnode(parent);
+
+	if (!init_data->fwnode)
+		fw = dev_fwnode(parent);
+	else
+		fw = init_data->fwnode;
+
+	/*
+	 * Simple things are pretty. I think simplest is to use DT node-name
+	 * for matching the node with LED - same way regulators use the node
+	 * name to match with desc.
+	 *
+	 * This may not work with existing LED DT entries if the node name has
+	 * been freely selectible. In order to this to work the binding doc
+	 * for LED driver should define usable node names. This may also be
+	 * a problem if LED node name should reflect the actual LED HW (not
+	 * LED controller HW) because the LED controller binding should should
+	 * define the acceptable names. So maybe we should consider some other
+	 * matching mechanism? This function can do the matching anyways as
+	 * init data should contain some 'match' for DT - whether it is node
+	 * name or specific property needs to be evaluated.
+	 */
+	if (init_data->of_match)
+		fw = fwnode_get_named_child_node(fw, init_data->of_match);
+
+	return fw;
+}
+
+/**
+ * led_parse_fwnode_props - parse LED common properties from fwnode
+ * @dev: pointer to LED device.
+ * @fwnode: LED node containing the properties
+ * @props: structure where found property data is stored.
+ *
+ * Parse the common LED properties from fwnode.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+int led_parse_fwnode_props(struct device *dev, struct fwnode_handle *fwnode,
+			   struct led_properties *props);
+
 /*
  * LED Triggers
  */
@@ -490,15 +625,6 @@ struct led_platform_data {
 	struct led_info	*leds;
 };
 
-struct led_properties {
-	u32		color;
-	bool		color_present;
-	const char	*function;
-	u32		func_enum;
-	bool		func_enum_present;
-	const char	*label;
-};
-
 struct gpio_desc;
 typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 				unsigned long *delay_on,
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
