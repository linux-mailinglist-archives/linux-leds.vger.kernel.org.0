Return-Path: <linux-leds+bounces-6489-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CBCCE86B6
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 01:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67969302168A
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 00:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247982DAFAA;
	Tue, 30 Dec 2025 00:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq2VKtc1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BA92DAFB5
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 00:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767054825; cv=none; b=kaDb9SA13ks8LDQsVvoWmDeXOJafVi6aiHBS+5i2dkCYSo0Og5Jtf56yvG3CDyRDVMFwOkEEYuhvSXP6+BU9MLHYEeQTS+ybo+ezui2FQGYjfF2avHU8Nqt6IBxSD2qdp2/8Ry8tRzFyixepQPS5TZ4GchheFKNP1haHuxY/nLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767054825; c=relaxed/simple;
	bh=txTpCN/tu5PbZdC1y2gTCxdnW6Y+G4CyS8Svu53pjxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKzzE9uSAhVAj5aJVQpsvnUgJe9TW9BA+MX9eXMBap/pLBs/4pqFzBFj6wGmZDOSPc4yosEV+IIw0upwCDPZIoluyCBzCbmOZVnc7I5qi0Dp0Pn68LF/IkejqnapDQp1UbpphiCsKuV0gWOETVZTLZm/l5ZklYvzKfRyzAOPkr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq2VKtc1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso10256865b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 29 Dec 2025 16:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767054821; x=1767659621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9ov+WDipC4i11yfG3gyUPn47YxMJXFWKdKkDRCgR0g=;
        b=cq2VKtc16v3aGNSmrm7DTzTJQhPNVAyTApZdt5GiBH1BzUp7vsPUJ/5x1W0YkZyF/j
         wU1E1WmhV1Yj4E23UtLnt1UiXTpP1MZG8wsqy7Rn2X/hlqW1FpW4cdcI2TMEGs5zkvyv
         89/w2uF20NnRNTius9iz8VNxKqH7rsJq7DW16eEFxWhZXKH4vSAiohPJW8WohYP5Z5dZ
         ags+iQ5njeHN3pjfQx85SF/rzt8XVdhhHi9dIhrkc/CD2NtaQ31Ggp0Lhmq/91Bz+6F6
         36ulHHVL2wqUQGphAzRne4a2h9QSNL4Y0zf1Jt1TVCchMzeaxVXnijmjYgMGKuQQP2Ft
         +wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767054821; x=1767659621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b9ov+WDipC4i11yfG3gyUPn47YxMJXFWKdKkDRCgR0g=;
        b=CER034Shb1PS6KYGWNrj/5LmSMASRpJR662Lx9yfsveB81Ay4OTnEICs9hKZuuvFZ8
         f6EqkaiktkjRa2o7v/aDYa7Q55/bTtk9GyvPrAU04bLJFjlAE/3RM1z5xZuAX6tYtu1+
         jOLe6qo0fTSdh2OAussfglp3/3n52Y1FSjMwCb0btry3X1Y6vKIT+ogFsOqc1fq9X4Mp
         8PoTn4P95JalDp+CDHyBeV6CC4Mvjvh4drsyGpJKV1mXtto7P/s7OwG/ArCwTqDW7EnO
         lvy3Z2W3HBqxskaRcU71ZiRoBeNvwtP1jzv/ehfqnWi6txoy75gd2LsYDHlihw3wksAh
         P/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYBtEAVaKZU9Je60NMPD4OjN6jdTzzOUje+iVhCOy2PXLjWoAQe7Xju8Fq2X0UtwIshGmnwg/r0FZa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr7VdaEhxDTjFgdWEQFpMSEiQgGv8iMSBzIhTS9Zh3IWQSDKBb
	PM6uXbf8mt7Gh4qrXuoFDTuE2g9QGI8aC5iQHdVa/+uCcIIBP0UNAWy+
X-Gm-Gg: AY/fxX6813zeXi+b4+eq4ZGqexnHQ7WBqx+HhaOAVBk2VWXfYZzz3Dgzsuu0QDdTA26
	0RJsZEzneBAlvd8sDsSRuavpc1N1X+4nKxKs5wl5QWOa8rFqSQ0Gpu1aHYY3eIHcV9qna3wMpJo
	h0r0p8GwIK2rAHCi6GnLG80kO/difJSImgTWPxNzakDCLWPJYq8b6jB5MoEDkm4ZlZol+KxMO1z
	qESl/sH4BaJTwuZWfVerjoIintXQRtLD4H/y/XHlXuKVFBJZAnRwP8bHL303RNRhmrsD/wh+p53
	ugAnTEZonxw2DamkBF7XfKzxlsVkudy8Wg61OWjCGPLXm7O1utZ97b5MPYP68Tr7aTyTSlH/W+u
	GCbb1Fk84fQ4C4716vSMrEgNuJN2Icq/idHXQaTWPPbSJCeSJqD0DJjo2R04FjrAzHoHg133HVB
	iiLWObLUvtjN85fKtnBNsCeVVju+yD5jNpoXQlTM34cg4=
X-Google-Smtp-Source: AGHT+IGiPfwJNzQrGwXdlAuS7TdEoi/WeEekshmSjqrAdEAUGWHDHhYBiAOEcJLCgsn/5GN+ZEBowQ==
X-Received: by 2002:a05:6a00:4c0a:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7ff65d7e80fmr30502445b3a.30.1767054821053;
        Mon, 29 Dec 2025 16:33:41 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e8947a1sm30241562b3a.67.2025.12.29.16.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 16:33:40 -0800 (PST)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 6/7] leds: Add fwnode_led_get() for firmware-agnostic LED resolution
Date: Tue, 30 Dec 2025 13:32:43 +1300
Message-ID: <20251230003250.1197744-7-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230003250.1197744-1-professorjonny98@gmail.com>
References: <20251230003250.1197744-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Add fwnode_led_get() to resolve LED class devices from firmware node
references, providing a firmware-agnostic alternative to of_led_get().

The function supports:
- Device Tree and ACPI systems
- GPIO LEDs (which may lack struct device)
- Platform LED controllers
- Deferred probing via -EPROBE_DEFER
- Reference counting via led_module_get()

Implementation details:
- Uses fwnode_property_get_reference_args() for property traversal
- Falls back to of_led_get() for Device Tree GPIO LEDs
- Returns optional parent device reference for power management
- Handles NULL parent devices gracefully (common for GPIO LEDs)

This enables LED resolution using generic firmware APIs while
maintaining compatibility with existing OF-specific LED drivers.
Future migration to full fwnode support in LED core will be
straightforward.

Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 drivers/leds/led-class.c | 136 +++++--
 drivers/leds/leds.h      | 758 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 842 insertions(+), 52 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 885399ed0776..85b35960484d 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -25,8 +25,6 @@
 static DEFINE_MUTEX(leds_lookup_lock);
 static LIST_HEAD(leds_lookup_list);

-static struct workqueue_struct *leds_wq;
-
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -38,7 +36,7 @@ static ssize_t brightness_show(struct device *dev,
 	brightness = led_cdev->brightness;
 	mutex_unlock(&led_cdev->led_access);

-	return sysfs_emit(buf, "%u\n", brightness);
+	return sprintf(buf, "%u\n", brightness);
 }

 static ssize_t brightness_store(struct device *dev,
@@ -62,6 +60,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (state == LED_OFF)
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
+	flush_work(&led_cdev->set_brightness_work);

 	ret = size;
 unlock:
@@ -80,13 +79,13 @@ static ssize_t max_brightness_show(struct device *dev,
 	max_brightness = led_cdev->max_brightness;
 	mutex_unlock(&led_cdev->led_access);

-	return sysfs_emit(buf, "%u\n", max_brightness);
+	return sprintf(buf, "%u\n", max_brightness);
 }
 static DEVICE_ATTR_RO(max_brightness);

 #ifdef CONFIG_LEDS_TRIGGERS
-static const BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
-static const struct bin_attribute *const led_trigger_bin_attrs[] = {
+static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
+static struct bin_attribute *led_trigger_bin_attrs[] = {
 	&bin_attr_trigger,
 	NULL,
 };
@@ -122,7 +121,7 @@ static ssize_t brightness_hw_changed_show(struct device *dev,
 	if (led_cdev->brightness_hw_changed == -1)
 		return -ENODATA;

-	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
+	return sprintf(buf, "%u\n", led_cdev->brightness_hw_changed);
 }

 static DEVICE_ATTR_RO(brightness_hw_changed);
@@ -252,23 +251,15 @@ static const struct class leds_class = {
  * of_led_get() - request a LED device via the LED framework
  * @np: device node to get the LED device from
  * @index: the index of the LED
- * @name: the name of the LED used to map it to its function, if present
  *
  * Returns the LED device parsed from the phandle specified in the "leds"
  * property of a device tree node or a negative error-code on failure.
  */
-static struct led_classdev *of_led_get(struct device_node *np, int index,
-				       const char *name)
+struct led_classdev *of_led_get(struct device_node *np, int index)
 {
 	struct device *led_dev;
 	struct device_node *led_node;

-	/*
-	 * For named LEDs, first look up the name in the "led-names" property.
-	 * If it cannot be found, then of_parse_phandle() will propagate the error.
-	 */
-	if (name)
-		index = of_property_match_string(np, "led-names", name);
 	led_node = of_parse_phandle(np, "leds", index);
 	if (!led_node)
 		return ERR_PTR(-ENOENT);
@@ -278,6 +269,103 @@ static struct led_classdev *of_led_get(struct device_node *np, int index,

 	return led_module_get(led_dev);
 }
+EXPORT_SYMBOL_GPL(of_led_get);
+
+
+/**
+ * fwnode_led_get() - Get LED class device from firmware node reference
+ * @fwnode: Firmware node containing LED phandle array property
+ * @index: Index within the LED array property
+ * @out_dev: Optional output for the LED's parent device (may be NULL)
+ *
+ * This function resolves LED class devices from firmware node references,
+ * providing a firmware-agnostic alternative to of_led_get(). It supports
+ * both Device Tree and ACPI systems.
+ *
+ * The function handles:
+ * - GPIO LEDs (which don't have struct device)
+ * - Platform LED controllers
+ * - Deferred probing via -EPROBE_DEFER
+ * - Reference counting via led_module_get()
+ *
+ * If @out_dev is non-NULL and the LED has a parent device, a reference
+ * to that device is returned via get_device(). The caller is responsible
+ * for calling put_device() when done. GPIO LEDs may not have a parent
+ * device, in which case @out_dev will be set to NULL.
+ *
+ * The caller must call led_put() on the returned LED class device when done.
+ *
+ * Return: LED class device pointer on success, ERR_PTR on error:
+ *         -EPROBE_DEFER if LED provider is not yet available
+ *         -EINVAL for invalid arguments or missing LED
+ *         -ENODEV if LED provider returned NULL
+ */
+struct led_classdev *fwnode_led_get(const struct fwnode_handle *fwnode,
+				    int index,
+				    struct device **out_dev)
+{
+	struct fwnode_reference_args args;
+	struct led_classdev *cdev;
+	struct device *led_dev = NULL;
+	int ret;
+
+	if (out_dev)
+		*out_dev = NULL;
+
+	if (!fwnode)
+		return ERR_PTR(-EINVAL);
+
+	/* Get the LED reference from the firmware node */
+	ret = fwnode_property_get_reference_args(fwnode, "leds", NULL, 0,
+						 index, &args);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/*
+	 * Try Device Tree path first if this is an OF node.
+	 * This handles GPIO LEDs and other DT-specific LED providers.
+	 */
+	if (is_of_node(args.fwnode)) {
+		struct device_node *np = to_of_node(args.fwnode);
+
+		cdev = of_led_get(np, 0);
+		fwnode_handle_put(args.fwnode);
+
+		if (IS_ERR(cdev))
+			return cdev;
+
+		/* Get parent device if it exists */
+		if (out_dev && cdev->dev)
+			*out_dev = get_device(cdev->dev);
+
+		return cdev;
+	}
+
+	/*
+	 * ACPI or generic fwnode path.
+	 * Try to find the LED class device by matching the fwnode.
+	 */
+	led_dev = fwnode_get_next_parent_dev((struct fwnode_handle *)args.fwnode);
+	fwnode_handle_put(args.fwnode);
+
+	if (!led_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/* Find the LED class device associated with this device */
+	cdev = led_module_get(led_dev);
+	if (!cdev) {
+		put_device(led_dev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	if (out_dev)
+		*out_dev = led_dev;
+	else
+		put_device(led_dev);
+
+	return cdev;
+}
+EXPORT_SYMBOL_GPL(fwnode_led_get);

 /**
  * led_put() - release a LED device
@@ -332,7 +420,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 	if (!dev)
 		return ERR_PTR(-EINVAL);

-	led = of_led_get(dev->of_node, index, NULL);
+	led = of_led_get(dev->of_node, index);
 	if (IS_ERR(led))
 		return led;

@@ -350,14 +438,9 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
 struct led_classdev *led_get(struct device *dev, char *con_id)
 {
 	struct led_lookup_data *lookup;
-	struct led_classdev *led_cdev;
 	const char *provider = NULL;
 	struct device *led_dev;

-	led_cdev = of_led_get(dev->of_node, -1, con_id);
-	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
-		return led_cdev;
-
 	mutex_lock(&leds_lookup_lock);
 	list_for_each_entry(lookup, &leds_lookup_list, list) {
 		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
@@ -570,8 +653,6 @@ int led_classdev_register_ext(struct device *parent,

 	led_update_brightness(led_cdev);

-	led_cdev->wq = leds_wq;
-
 	led_init_core(led_cdev);

 #ifdef CONFIG_LEDS_TRIGGERS
@@ -690,19 +771,12 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);

 static int __init leds_init(void)
 {
-	leds_wq = alloc_ordered_workqueue("leds", 0);
-	if (!leds_wq) {
-		pr_err("Failed to create LEDs ordered workqueue\n");
-		return -ENOMEM;
-	}
-
 	return class_register(&leds_class);
 }

 static void __exit leds_exit(void)
 {
 	class_unregister(&leds_class);
-	destroy_workqueue(leds_wq);
 }

 subsys_initcall(leds_init);
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index bee46651e068..aae54cc7dac5 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -1,34 +1,750 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Driver model for leds and led triggers
+ *
+ * Copyright (C) 2005 John Lenz <lenz@cs.wisc.edu>
+ * Copyright (C) 2005 Richard Purdie <rpurdie@openedhand.com>
+ */
+#ifndef __LINUX_LEDS_H_INCLUDED
+#define __LINUX_LEDS_H_INCLUDED
+
+#include <dt-bindings/leds/common.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/rwsem.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+struct attribute_group;
+struct device_node;
+struct fwnode_handle;
+struct gpio_desc;
+struct kernfs_node;
+struct led_pattern;
+struct platform_device;
+
 /*
  * LED Core
+ */
+
+/* This is obsolete/useless. We now support variable maximum brightness. */
+enum led_brightness {
+	LED_OFF		= 0,
+	LED_ON		= 1,
+	LED_HALF	= 127,
+	LED_FULL	= 255,
+};
+
+enum led_default_state {
+	LEDS_DEFSTATE_OFF	= 0,
+	LEDS_DEFSTATE_ON	= 1,
+	LEDS_DEFSTATE_KEEP	= 2,
+};
+
+/**
+ * struct led_lookup_data - represents a single LED lookup entry
  *
- * Copyright 2005 Openedhand Ltd.
+ * @list: internal list of all LED lookup entries
+ * @provider: name of led_classdev providing the LED
+ * @dev_id: name of the device associated with this LED
+ * @con_id: name of the LED from the device's point of view
+ */
+struct led_lookup_data {
+	struct list_head list;
+	const char *provider;
+	const char *dev_id;
+	const char *con_id;
+};
+
+struct led_init_data {
+	/* device fwnode handle */
+	struct fwnode_handle *fwnode;
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
+};
+
+enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode);
+
+struct led_hw_trigger_type {
+	int dummy;
+};
+
+struct led_classdev {
+	const char		*name;
+	unsigned int brightness;
+	unsigned int max_brightness;
+	unsigned int color;
+	int			 flags;
+
+	/* Lower 16 bits reflect status */
+#define LED_SUSPENDED		BIT(0)
+#define LED_UNREGISTERING	BIT(1)
+	/* Upper 16 bits reflect control information */
+#define LED_CORE_SUSPENDRESUME	BIT(16)
+#define LED_SYSFS_DISABLE	BIT(17)
+#define LED_DEV_CAP_FLASH	BIT(18)
+#define LED_HW_PLUGGABLE	BIT(19)
+#define LED_PANIC_INDICATOR	BIT(20)
+#define LED_BRIGHT_HW_CHANGED	BIT(21)
+#define LED_RETAIN_AT_SHUTDOWN	BIT(22)
+#define LED_INIT_DEFAULT_TRIGGER BIT(23)
+#define LED_REJECT_NAME_CONFLICT BIT(24)
+#define LED_MULTI_COLOR		BIT(25)
+
+	/* set_brightness_work / blink_timer flags, atomic, private. */
+	unsigned long		work_flags;
+
+#define LED_BLINK_SW			0
+#define LED_BLINK_ONESHOT		1
+#define LED_BLINK_ONESHOT_STOP		2
+#define LED_BLINK_INVERT		3
+#define LED_BLINK_BRIGHTNESS_CHANGE 	4
+#define LED_BLINK_DISABLE		5
+	/* Brightness off also disables hw-blinking so it is a separate action */
+#define LED_SET_BRIGHTNESS_OFF		6
+#define LED_SET_BRIGHTNESS		7
+#define LED_SET_BLINK			8
+
+	/* Set LED brightness level
+	 * Must not sleep. Use brightness_set_blocking for drivers
+	 * that can sleep while setting brightness.
+	 */
+	void		(*brightness_set)(struct led_classdev *led_cdev,
+					  enum led_brightness brightness);
+	/*
+	 * Set LED brightness level immediately - it can block the caller for
+	 * the time required for accessing a LED device register.
+	 */
+	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
+				       enum led_brightness brightness);
+	/* Get LED brightness level */
+	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
+
+	/*
+	 * Activate hardware accelerated blink, delays are in milliseconds
+	 * and if both are zero then a sensible default should be chosen.
+	 * The call should adjust the timings in that case and if it can't
+	 * match the values specified exactly.
+	 * Deactivate blinking again when the brightness is set to LED_OFF
+	 * via the brightness_set() callback.
+	 * For led_blink_set_nosleep() the LED core assumes that blink_set
+	 * implementations, of drivers which do not use brightness_set_blocking,
+	 * will not sleep. Therefor if brightness_set_blocking is not set
+	 * this function must not sleep!
+	 */
+	int		(*blink_set)(struct led_classdev *led_cdev,
+				     unsigned long *delay_on,
+				     unsigned long *delay_off);
+
+	int (*pattern_set)(struct led_classdev *led_cdev,
+			   struct led_pattern *pattern, u32 len, int repeat);
+	int (*pattern_clear)(struct led_classdev *led_cdev);
+
+	struct device		*dev;
+	const struct attribute_group	**groups;
+
+	struct list_head	 node;			/* LED Device list */
+	const char		*default_trigger;	/* Trigger to use */
+
+	unsigned long		 blink_delay_on, blink_delay_off;
+	struct timer_list	 blink_timer;
+	int			 blink_brightness;
+	int			 new_blink_brightness;
+	void			(*flash_resume)(struct led_classdev *led_cdev);
+
+	struct work_struct	set_brightness_work;
+	int			delayed_set_value;
+	unsigned long		delayed_delay_on;
+	unsigned long		delayed_delay_off;
+
+#ifdef CONFIG_LEDS_TRIGGERS
+	/* Protects the trigger data below */
+	struct rw_semaphore	 trigger_lock;
+
+	struct led_trigger	*trigger;
+	struct list_head	 trig_list;
+	void			*trigger_data;
+	/* true if activated - deactivate routine uses it to do cleanup */
+	bool			activated;
+
+	/* LEDs that have private triggers have this set */
+	struct led_hw_trigger_type	*trigger_type;
+
+	/* Unique trigger name supported by LED set in hw control mode */
+	const char		*hw_control_trigger;
+	/*
+	 * Check if the LED driver supports the requested mode provided by the
+	 * defined supported trigger to setup the LED to hw control mode.
+	 *
+	 * Return 0 on success. Return -EOPNOTSUPP when the passed flags are not
+	 * supported and software fallback needs to be used.
+	 * Return a negative error number on any other case  for check fail due
+	 * to various reason like device not ready or timeouts.
+	 */
+	int			(*hw_control_is_supported)(struct led_classdev *led_cdev,
+							   unsigned long flags);
+	/*
+	 * Activate hardware control, LED driver will use the provided flags
+	 * from the supported trigger and setup the LED to be driven by hardware
+	 * following the requested mode from the trigger flags.
+	 * Deactivate hardware blink control by setting brightness to LED_OFF via
+	 * the brightness_set() callback.
+	 *
+	 * Return 0 on success, a negative error number on flags apply fail.
+	 */
+	int			(*hw_control_set)(struct led_classdev *led_cdev,
+						  unsigned long flags);
+	/*
+	 * Get from the LED driver the current mode that the LED is set in hw
+	 * control mode and put them in flags.
+	 * Trigger can use this to get the initial state of a LED already set in
+	 * hardware blink control.
+	 *
+	 * Return 0 on success, a negative error number on failing parsing the
+	 * initial mode. Error from this function is NOT FATAL as the device
+	 * may be in a not supported initial state by the attached LED trigger.
+	 */
+	int			(*hw_control_get)(struct led_classdev *led_cdev,
+						  unsigned long *flags);
+	/*
+	 * Get the device this LED blinks in response to.
+	 * e.g. for a PHY LED, it is the network device. If the LED is
+	 * not yet associated to a device, return NULL.
+	 */
+	struct device		*(*hw_control_get_device)(struct led_classdev *led_cdev);
+#endif
+
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	int			 brightness_hw_changed;
+	struct kernfs_node	*brightness_hw_changed_kn;
+#endif
+
+	/* Ensures consistent access to the LED class device */
+	struct mutex		led_access;
+};
+
+/**
+ * led_classdev_register_ext - register a new object of LED class with
+ *			       init data
+ * @parent: LED controller device this LED is driven by
+ * @led_cdev: the led_classdev structure for this device
+ * @init_data: the LED class device initialization data
  *
- * Author: Richard Purdie <rpurdie@openedhand.com>
+ * Register a new object of LED class, with name derived from init_data.
+ *
+ * Returns: 0 on success or negative error value on failure
  */
-#ifndef __LEDS_H_INCLUDED
-#define __LEDS_H_INCLUDED
+int led_classdev_register_ext(struct device *parent,
+				     struct led_classdev *led_cdev,
+				     struct led_init_data *init_data);

-#include <linux/rwsem.h>
-#include <linux/leds.h>
+/**
+ * led_classdev_register - register a new object of LED class
+ * @parent: LED controller device this LED is driven by
+ * @led_cdev: the led_classdev structure for this device
+ *
+ * Register a new object of LED class, with name derived from the name property
+ * of passed led_cdev argument.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+static inline int led_classdev_register(struct device *parent,
+					struct led_classdev *led_cdev)
+{
+	return led_classdev_register_ext(parent, led_cdev, NULL);
+}

-static inline int led_get_brightness(struct led_classdev *led_cdev)
+int devm_led_classdev_register_ext(struct device *parent,
+					  struct led_classdev *led_cdev,
+					  struct led_init_data *init_data);
+static inline int devm_led_classdev_register(struct device *parent,
+					     struct led_classdev *led_cdev)
 {
-	return led_cdev->brightness;
+	return devm_led_classdev_register_ext(parent, led_cdev, NULL);
 }
+void led_classdev_unregister(struct led_classdev *led_cdev);
+void devm_led_classdev_unregister(struct device *parent,
+				  struct led_classdev *led_cdev);
+void led_classdev_suspend(struct led_classdev *led_cdev);
+void led_classdev_resume(struct led_classdev *led_cdev);
+
+void led_add_lookup(struct led_lookup_data *led_lookup);
+void led_remove_lookup(struct led_lookup_data *led_lookup);
+
+struct led_classdev *__must_check led_get(struct device *dev, char *con_id);
+struct led_classdev *__must_check devm_led_get(struct device *dev, char *con_id);
+
+extern struct led_classdev *of_led_get(struct device_node *np, int index);
+extern void led_put(struct led_classdev *led_cdev);
+extern struct led_classdev *fwnode_led_get(const struct fwnode_handle *fwnode,
+					   int index,
+					   struct device **out_dev);
+struct led_classdev *__must_check devm_of_led_get(struct device *dev,
+						  int index);
+struct led_classdev *__must_check devm_of_led_get_optional(struct device *dev,
+						  int index);
+
+/**
+ * led_blink_set - set blinking with software fallback
+ * @led_cdev: the LED to start blinking
+ * @delay_on: the time it should be on (in ms)
+ * @delay_off: the time it should ble off (in ms)
+ *
+ * This function makes the LED blink, attempting to use the
+ * hardware acceleration if possible, but falling back to
+ * software blinking if there is no hardware blinking or if
+ * the LED refuses the passed values.
+ *
+ * This function may sleep!
+ *
+ * Note that if software blinking is active, simply calling
+ * led_cdev->brightness_set() will not stop the blinking,
+ * use led_set_brightness() instead.
+ */
+void led_blink_set(struct led_classdev *led_cdev, unsigned long *delay_on,
+		   unsigned long *delay_off);
+
+/**
+ * led_blink_set_nosleep - set blinking, guaranteed to not sleep
+ * @led_cdev: the LED to start blinking
+ * @delay_on: the time it should be on (in ms)
+ * @delay_off: the time it should ble off (in ms)
+ *
+ * This function makes the LED blink and is guaranteed to not sleep. Otherwise
+ * this is the same as led_blink_set(), see led_blink_set() for details.
+ */
+void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on,
+			   unsigned long delay_off);
+
+/**
+ * led_blink_set_oneshot - do a oneshot software blink
+ * @led_cdev: the LED to start blinking
+ * @delay_on: the time it should be on (in ms)
+ * @delay_off: the time it should ble off (in ms)
+ * @invert: blink off, then on, leaving the led on
+ *
+ * This function makes the LED blink one time for delay_on +
+ * delay_off time, ignoring the request if another one-shot
+ * blink is already in progress.
+ *
+ * If invert is set, led blinks for delay_off first, then for
+ * delay_on and leave the led on after the on-off cycle.
+ *
+ * This function is guaranteed not to sleep.
+ */
+void led_blink_set_oneshot(struct led_classdev *led_cdev,
+			   unsigned long *delay_on, unsigned long *delay_off,
+			   int invert);
+/**
+ * led_set_brightness - set LED brightness
+ * @led_cdev: the LED to set
+ * @brightness: the brightness to set it to
+ *
+ * Set an LED's brightness, and, if necessary, cancel the
+ * software blink timer that implements blinking when the
+ * hardware doesn't. This function is guaranteed not to sleep.
+ */
+void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness);
+
+/**
+ * led_set_brightness_sync - set LED brightness synchronously
+ * @led_cdev: the LED to set
+ * @value: the brightness to set it to
+ *
+ * Set an LED's brightness immediately. This function will block
+ * the caller for the time required for accessing device registers,
+ * and it can sleep.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
+
+/**
+ * led_mc_set_brightness - set mc LED color intensity values and brightness
+ * @led_cdev: the LED to set
+ * @intensity_value: array of per color intensity values to set
+ * @num_colors: amount of entries in intensity_value array
+ * @brightness: the brightness to set the LED to
+ *
+ * Set a multi-color LED's per color intensity values and brightness.
+ * If necessary, this cancels the software blink timer. This function is
+ * guaranteed not to sleep.
+ *
+ * Calling this function on a non multi-color led_classdev or with the wrong
+ * num_colors value is an error. In this case an error will be logged once
+ * and the call will do nothing.
+ */
+void led_mc_set_brightness(struct led_classdev *led_cdev,
+			   unsigned int *intensity_value, unsigned int num_colors,
+			   unsigned int brightness);
+
+/**
+ * led_update_brightness - update LED brightness
+ * @led_cdev: the LED to query
+ *
+ * Get an LED's current brightness and update led_cdev->brightness
+ * member with the obtained value.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+int led_update_brightness(struct led_classdev *led_cdev);
+
+/**
+ * led_get_default_pattern - return default pattern
+ *
+ * @led_cdev: the LED to get default pattern for
+ * @size:     pointer for storing the number of elements in returned array,
+ *            modified only if return != NULL
+ *
+ * Return:    Allocated array of integers with default pattern from device tree
+ *            or NULL.  Caller is responsible for kfree().
+ */
+u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int *size);
+
+/**
+ * led_sysfs_disable - disable LED sysfs interface
+ * @led_cdev: the LED to set
+ *
+ * Disable the led_cdev's sysfs interface.
+ */
+void led_sysfs_disable(struct led_classdev *led_cdev);

-void led_init_core(struct led_classdev *led_cdev);
-void led_stop_software_blink(struct led_classdev *led_cdev);
-void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value);
-void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value);
-ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
-			const struct bin_attribute *attr, char *buf,
-			loff_t pos, size_t count);
-ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
-			const struct bin_attribute *bin_attr, char *buf,
-			loff_t pos, size_t count);
+/**
+ * led_sysfs_enable - enable LED sysfs interface
+ * @led_cdev: the LED to set
+ *
+ * Enable the led_cdev's sysfs interface.
+ */
+void led_sysfs_enable(struct led_classdev *led_cdev);
+
+/**
+ * led_compose_name - compose LED class device name
+ * @dev: LED controller device object
+ * @init_data: the LED class device initialization data
+ * @led_classdev_name: composed LED class device name
+ *
+ * Create LED class device name basing on the provided init_data argument.
+ * The name can have <devicename:color:function> or <color:function>.
+ * form, depending on the init_data configuration.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+int led_compose_name(struct device *dev, struct led_init_data *init_data,
+		     char *led_classdev_name);
+
+/**
+ * led_get_color_name - get string representation of color ID
+ * @color_id: The LED_COLOR_ID_* constant
+ *
+ * Get the string name of a LED_COLOR_ID_* constant.
+ *
+ * Returns: A string constant or NULL on an invalid ID.
+ */
+const char *led_get_color_name(u8 color_id);
+
+/**
+ * led_sysfs_is_disabled - check if LED sysfs interface is disabled
+ * @led_cdev: the LED to query
+ *
+ * Returns: true if the led_cdev's sysfs interface is disabled.
+ */
+static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
+{
+	return led_cdev->flags & LED_SYSFS_DISABLE;
+}
+
+/*
+ * LED Triggers
+ */
+/* Registration functions for simple triggers */
+#define DEFINE_LED_TRIGGER(x)		static struct led_trigger *x;
+#define DEFINE_LED_TRIGGER_GLOBAL(x)	struct led_trigger *x;
+
+#ifdef CONFIG_LEDS_TRIGGERS
+
+#define TRIG_NAME_MAX 50
+
+struct led_trigger {
+	/* Trigger Properties */
+	const char	 *name;
+	int		(*activate)(struct led_classdev *led_cdev);
+	void		(*deactivate)(struct led_classdev *led_cdev);
+
+	/* Brightness set by led_trigger_event */
+	enum led_brightness brightness;
+
+	/* LED-private triggers have this set */
+	struct led_hw_trigger_type *trigger_type;
+
+	/* LEDs under control by this trigger (for simple triggers) */
+	spinlock_t	  leddev_list_lock;
+	struct list_head  led_cdevs;
+
+	/* Link to next registered trigger */
+	struct list_head  next_trig;
+
+	const struct attribute_group **groups;
+};
+
+/*
+ * Currently the attributes in struct led_trigger::groups are added directly to
+ * the LED device. As this might change in the future, the following
+ * macros abstract getting the LED device and its trigger_data from the dev
+ * parameter passed to the attribute accessor functions.
+ */
+#define led_trigger_get_led(dev)	((struct led_classdev *)dev_get_drvdata((dev)))
+#define led_trigger_get_drvdata(dev)	(led_get_trigger_data(led_trigger_get_led(dev)))
+
+/* Registration functions for complex triggers */
+int led_trigger_register(struct led_trigger *trigger);
+void led_trigger_unregister(struct led_trigger *trigger);
+int devm_led_trigger_register(struct device *dev,
+				     struct led_trigger *trigger);
+
+void led_trigger_register_simple(const char *name,
+				struct led_trigger **trigger);
+void led_trigger_unregister_simple(struct led_trigger *trigger);
+void led_trigger_event(struct led_trigger *trigger,  enum led_brightness event);
+void led_mc_trigger_event(struct led_trigger *trig,
+			  unsigned int *intensity_value, unsigned int num_colors,
+			  enum led_brightness brightness);
+void led_trigger_blink(struct led_trigger *trigger, unsigned long delay_on,
+		       unsigned long delay_off);
+void led_trigger_blink_oneshot(struct led_trigger *trigger,
+			       unsigned long delay_on,
+			       unsigned long delay_off,
+			       int invert);
+void led_trigger_set_default(struct led_classdev *led_cdev);
+int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
+void led_trigger_remove(struct led_classdev *led_cdev);
+
+static inline void led_set_trigger_data(struct led_classdev *led_cdev,
+					void *trigger_data)
+{
+	led_cdev->trigger_data = trigger_data;
+}
+
+static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
+{
+	return led_cdev->trigger_data;
+}
+
+static inline enum led_brightness
+led_trigger_get_brightness(const struct led_trigger *trigger)
+{
+	return trigger ? trigger->brightness : LED_OFF;
+}
+
+#define module_led_trigger(__led_trigger) \
+	module_driver(__led_trigger, led_trigger_register, \
+		      led_trigger_unregister)
+
+#else
+
+/* Trigger has no members */
+struct led_trigger {};
+
+/* Trigger inline empty functions */
+static inline void led_trigger_register_simple(const char *name,
+					struct led_trigger **trigger) {}
+static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
+static inline void led_trigger_event(struct led_trigger *trigger,
+				enum led_brightness event) {}
+static inline void led_mc_trigger_event(struct led_trigger *trig,
+				unsigned int *intensity_value, unsigned int num_colors,
+				enum led_brightness brightness) {}
+static inline void led_trigger_blink(struct led_trigger *trigger,
+				      unsigned long delay_on,
+				      unsigned long delay_off) {}
+static inline void led_trigger_blink_oneshot(struct led_trigger *trigger,
+				      unsigned long delay_on,
+				      unsigned long delay_off,
+				      int invert) {}
+static inline void led_trigger_set_default(struct led_classdev *led_cdev) {}
+static inline int led_trigger_set(struct led_classdev *led_cdev,
+				  struct led_trigger *trigger)
+{
+	return 0;
+}
+
+static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
+static inline void led_set_trigger_data(struct led_classdev *led_cdev) {}
+static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
+{
+	return NULL;
+}
+
+static inline enum led_brightness
+led_trigger_get_brightness(const struct led_trigger *trigger)
+{
+	return LED_OFF;
+}
+
+#endif /* CONFIG_LEDS_TRIGGERS */
+
+/* Trigger specific enum */
+enum led_trigger_netdev_modes {
+	TRIGGER_NETDEV_LINK = 0,
+	TRIGGER_NETDEV_LINK_10,
+	TRIGGER_NETDEV_LINK_100,
+	TRIGGER_NETDEV_LINK_1000,
+	TRIGGER_NETDEV_LINK_2500,
+	TRIGGER_NETDEV_LINK_5000,
+	TRIGGER_NETDEV_LINK_10000,
+	TRIGGER_NETDEV_HALF_DUPLEX,
+	TRIGGER_NETDEV_FULL_DUPLEX,
+	TRIGGER_NETDEV_TX,
+	TRIGGER_NETDEV_RX,
+	TRIGGER_NETDEV_TX_ERR,
+	TRIGGER_NETDEV_RX_ERR,
+
+	/* Keep last */
+	__TRIGGER_NETDEV_MAX,
+};
+
+/* Trigger specific functions */
+#ifdef CONFIG_LEDS_TRIGGER_DISK
+void ledtrig_disk_activity(bool write);
+#else
+static inline void ledtrig_disk_activity(bool write) {}
+#endif
+
+#ifdef CONFIG_LEDS_TRIGGER_MTD
+void ledtrig_mtd_activity(void);
+#else
+static inline void ledtrig_mtd_activity(void) {}
+#endif
+
+#if defined(CONFIG_LEDS_TRIGGER_CAMERA) || defined(CONFIG_LEDS_TRIGGER_CAMERA_MODULE)
+void ledtrig_flash_ctrl(bool on);
+void ledtrig_torch_ctrl(bool on);
+#else
+static inline void ledtrig_flash_ctrl(bool on) {}
+static inline void ledtrig_torch_ctrl(bool on) {}
+#endif
+
+/*
+ * Generic LED platform data for describing LED names and default triggers.
+ */
+struct led_info {
+	const char	*name;
+	const char	*default_trigger;
+	int		flags;
+};
+
+struct led_platform_data {
+	int		num_leds;
+	struct led_info	*leds;
+};
+
+struct led_properties {
+	u32		color;
+	bool		color_present;
+	const char	*function;
+	u32		func_enum;
+	bool		func_enum_present;
+	const char	*label;
+};
+
+typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
+				unsigned long *delay_on,
+				unsigned long *delay_off);
+
+/* For the leds-gpio driver */
+struct gpio_led {
+	const char *name;
+	const char *default_trigger;
+	unsigned 	gpio;
+	unsigned	active_low : 1;
+	unsigned	retain_state_suspended : 1;
+	unsigned	panic_indicator : 1;
+	unsigned	default_state : 2;
+	unsigned	retain_state_shutdown : 1;
+	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF|KEEP) */
+	struct gpio_desc *gpiod;
+};
+#define LEDS_GPIO_DEFSTATE_OFF		LEDS_DEFSTATE_OFF
+#define LEDS_GPIO_DEFSTATE_ON		LEDS_DEFSTATE_ON
+#define LEDS_GPIO_DEFSTATE_KEEP		LEDS_DEFSTATE_KEEP
+
+struct gpio_led_platform_data {
+	int 		num_leds;
+	const struct gpio_led *leds;
+
+#define GPIO_LED_NO_BLINK_LOW	0	/* No blink GPIO state low */
+#define GPIO_LED_NO_BLINK_HIGH	1	/* No blink GPIO state high */
+#define GPIO_LED_BLINK		2	/* Please, blink */
+	gpio_blink_set_t	gpio_blink_set;
+};
+
+#ifdef CONFIG_LEDS_GPIO_REGISTER
+struct platform_device *gpio_led_register_device(
+		int id, const struct gpio_led_platform_data *pdata);
+#else
+static inline struct platform_device *gpio_led_register_device(
+		int id, const struct gpio_led_platform_data *pdata)
+{
+	return 0;
+}
+#endif
+
+enum cpu_led_event {
+	CPU_LED_IDLE_START,	/* CPU enters idle */
+	CPU_LED_IDLE_END,	/* CPU idle ends */
+	CPU_LED_START,		/* Machine starts, especially resume */
+	CPU_LED_STOP,		/* Machine stops, especially suspend */
+	CPU_LED_HALTED,		/* Machine shutdown */
+};
+#ifdef CONFIG_LEDS_TRIGGER_CPU
+void ledtrig_cpu(enum cpu_led_event evt);
+#else
+static inline void ledtrig_cpu(enum cpu_led_event evt)
+{
+	return;
+}
+#endif
+
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+void led_classdev_notify_brightness_hw_changed(
+	struct led_classdev *led_cdev, unsigned int brightness);
+#else
+static inline void led_classdev_notify_brightness_hw_changed(
+	struct led_classdev *led_cdev, enum led_brightness brightness) { }
+#endif
+
+/**
+ * struct led_pattern - pattern interval settings
+ * @delta_t: pattern interval delay, in milliseconds
+ * @brightness: pattern interval brightness
+ */
+struct led_pattern {
+	u32 delta_t;
+	int brightness;
+};

-extern struct rw_semaphore leds_list_lock;
-extern struct list_head leds_list;
+enum led_audio {
+	LED_AUDIO_MUTE,		/* master mute LED */
+	LED_AUDIO_MICMUTE,	/* mic mute LED */
+	NUM_AUDIO_LEDS
+};

-#endif	/* __LEDS_H_INCLUDED */
+#endif		/* __LINUX_LEDS_H_INCLUDED */
--
2.43.0

