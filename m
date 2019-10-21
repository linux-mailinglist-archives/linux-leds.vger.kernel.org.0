Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76246DF48C
	for <lists+linux-leds@lfdr.de>; Mon, 21 Oct 2019 19:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729904AbfJURsm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Oct 2019 13:48:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45512 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729819AbfJURsl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Oct 2019 13:48:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9LHmZfb106843;
        Mon, 21 Oct 2019 12:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571680115;
        bh=dtK93MRIeMHhxdQfZiUO3Qp+c5LflSv2a5CDn0FY1+E=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=OkHinSw3xLK0a994uPgU0yrabvvVzWKWrPbtCyum3pLr+kKMKyru3Xuk9K7df+YL/
         AZ/dqSrYRdLQEqq2XyApOotLx82n8Mc7ijIN49/7RgNodn7c5kDjppVtKXvTrbZUYX
         ZvtqjGNyIXRjLDGYEPq7OTYrTZYK71aF/luVE5Ls=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9LHmKUN109782
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 21 Oct 2019 12:48:20 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 21
 Oct 2019 12:48:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 21 Oct 2019 12:48:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9LHmIo4111852;
        Mon, 21 Oct 2019 12:48:19 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ti.com>, <jjhiblot@ti.com>
Subject: [PATCH v7 2/2] leds: Add control of the voltage/current regulator to the LED core
Date:   Mon, 21 Oct 2019 19:47:51 +0200
Message-ID: <20191021174751.4421-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021174751.4421-1-jjhiblot@ti.com>
References: <20191021174751.4421-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

A LED is usually powered by a voltage/current regulator. Let the LED core
know about it. This allows the LED core to turn on or off the power supply
as needed.

Because turning ON/OFF a regulator might block, it is not done
synchronously but done in a workqueue. Turning ON the regulator is always
done as soon as possible, turning it off can be delayed by setting the
"power-off-delays-ms" property. The intent is to keep the regulator
powered on when the blink rate of the LED is high.

A sysfs interface is made available to dynamically enable/disable this
feature and tune the off-delay.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-class.c | 156 +++++++++++++++++++++++++++++++++++++--
 drivers/leds/led-core.c  | 129 +++++++++++++++++++++++++++++++-
 drivers/leds/leds.h      |  18 +++++
 include/linux/leds.h     |   9 +++
 4 files changed, 304 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index c5ff1d3d00a3..c1ad89d56129 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -25,6 +25,112 @@
 
 static struct class *leds_class;
 
+static ssize_t regulator_auto_off_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n",
+		       led_cdev->reg_auto_off ? "enabled" : "disabled");
+}
+
+static ssize_t regulator_auto_off_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	ssize_t ret = size;
+	bool auto_off;
+
+	if (strncmp(buf, "enable\n", size) == 0)
+		auto_off = true;
+	else if (strncmp(buf, "disable\n", size) == 0)
+		auto_off = false;
+	else
+		return -EINVAL;
+
+	mutex_lock(&led_cdev->led_access);
+
+	if (led_sysfs_is_disabled(led_cdev)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/* no changes ? */
+	if (led_cdev->reg_auto_off == auto_off)
+		goto unlock;
+	led_cdev->reg_auto_off = auto_off;
+
+	/* cancel a possibly pending auto-off operation */
+	if (!auto_off)
+		cancel_delayed_work(&led_cdev->reg_off_work);
+
+	/*
+	 * call led_set_brightness_nopm() to trigger an update of the
+	 * regulator's state.
+	 */
+	led_set_brightness_nopm(led_cdev, led_cdev->brightness);
+	flush_work(&led_cdev->set_brightness_work);
+
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+static DEVICE_ATTR_RW(regulator_auto_off);
+
+static ssize_t regulator_auto_off_delay_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u ms\n", led_cdev->reg_off_delay);
+}
+
+static ssize_t regulator_auto_off_delay_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	unsigned long delay;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	if (led_sysfs_is_disabled(led_cdev)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	ret = kstrtoul(buf, 10, &delay);
+	if (ret)
+		goto unlock;
+	ret = size;
+
+	if (led_cdev->reg_off_delay == delay)
+		goto unlock;
+	led_cdev->reg_off_delay = delay;
+
+	if (!led_cdev->reg_auto_off)
+		goto unlock;
+
+	/*
+	 * If a auto-off operation is in progress cancel it,
+	 * and re-trigger it with the new delay
+	 */
+	if (cancel_delayed_work(&led_cdev->reg_off_work))
+		schedule_delayed_work(&led_cdev->reg_off_work,
+				      msecs_to_jiffies(led_cdev->reg_off_delay));
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+static DEVICE_ATTR_RW(regulator_auto_off_delay);
+
+static struct attribute *auto_off_attrs[] = {
+	&dev_attr_regulator_auto_off.attr,
+	&dev_attr_regulator_auto_off_delay.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(auto_off);
+
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -351,6 +457,7 @@ int led_classdev_register_ext(struct device *parent,
 	char final_name[LED_MAX_NAME_SIZE];
 	const char *proposed_name = composed_name;
 	int ret;
+	struct regulator *regulator;
 
 	if (init_data) {
 		if (init_data->devname_mandatory && !init_data->devicename) {
@@ -385,14 +492,38 @@ int led_classdev_register_ext(struct device *parent,
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
+	if (IS_ERR(regulator)) {
+		if (regulator != ERR_PTR(-ENODEV)) {
+			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
+				led_cdev->name);
+			ret = PTR_ERR(regulator);
+			goto error;
+		}
+		led_cdev->regulator = NULL;
+	} else {
+		mutex_init(&led_cdev->regulator_access);
+		led_cdev->regulator = regulator;
+		if (fwnode_property_read_u32(init_data->fwnode, "off-delay-ms",
+					 &led_cdev->reg_off_delay)) {
+			led_cdev->reg_auto_off = false;
+			atomic_set(&led_cdev->regulator_state, REG_R_ON_U_OFF);
+			ret = regulator_enable(led_cdev->regulator);
+			if (ret)
+				goto error;
+		} else {
+			led_cdev->reg_auto_off = true;
+			atomic_set(&led_cdev->regulator_state, REG_R_OFF_U_OFF);
+		}
+		ret = device_add_groups(led_cdev->dev, auto_off_groups);
+		if (ret)
+			goto error;
+	}
+
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
 		ret = led_add_brightness_hw_changed(led_cdev);
-		if (ret) {
-			device_unregister(led_cdev->dev);
-			led_cdev->dev = NULL;
-			mutex_unlock(&led_cdev->led_access);
-			return ret;
-		}
+		if (ret)
+			goto error;
 	}
 
 	led_cdev->work_flags = 0;
@@ -424,7 +555,14 @@ int led_classdev_register_ext(struct device *parent,
 			led_cdev->name);
 
 	return 0;
+
+error:
+	device_unregister(led_cdev->dev);
+	led_cdev->dev = NULL;
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
 }
+
 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
 
 /**
@@ -450,6 +588,7 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
 
+	led_cdev->reg_off_delay = 0;
 	led_set_brightness(led_cdev, LED_OFF);
 
 	flush_work(&led_cdev->set_brightness_work);
@@ -464,6 +603,11 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	up_write(&leds_list_lock);
 
 	mutex_destroy(&led_cdev->led_access);
+	if (led_cdev->regulator) {
+		if (!led_cdev->reg_auto_off)
+			regulator_disable(led_cdev->regulator);
+		mutex_destroy(&led_cdev->regulator_access);
+	}
 }
 EXPORT_SYMBOL_GPL(led_classdev_unregister);
 
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..d2253524670d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -37,6 +37,74 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
+static void turn_off_regulator_if_needed(struct led_classdev *led_cdev)
+{
+	int old = atomic_cmpxchg(&led_cdev->regulator_state, REG_R_ON_U_OFF,
+				  REG_R_OFF_U_OFF);
+
+	if (old == REG_R_ON_U_OFF) {
+		int rc = regulator_disable(led_cdev->regulator);
+
+		if (rc) {
+			dev_err(led_cdev->dev,
+				"Failed to disable the regulator (%d)\n", rc);
+			atomic_or(REG_R_ON, &led_cdev->regulator_state);
+		}
+	}
+}
+
+static void try_turn_on_regulator_if_needed(struct led_classdev *led_cdev)
+{
+	int old = atomic_cmpxchg(&led_cdev->regulator_state, REG_R_OFF_U_ON,
+			      REG_R_ON_U_ON);
+	if (old == REG_R_OFF_U_ON) {
+		int rc = regulator_enable(led_cdev->regulator);
+
+		if (rc) {
+			dev_err(led_cdev->dev,
+				"Failed to enable the regulator (%d)\n", rc);
+			atomic_and(~REG_R_ON, &led_cdev->regulator_state);
+		}
+	}
+}
+
+static void turn_off_regulator_delayed(struct work_struct *ws)
+{
+	struct led_classdev *led_cdev =
+		container_of(ws, struct led_classdev, reg_off_work.work);
+
+	/*
+	 * Take the lock to prevent very unlikely updates due to
+	 * led_handle_regulator() being executed at the same time
+	 */
+	mutex_lock(&led_cdev->regulator_access);
+
+	turn_off_regulator_if_needed(led_cdev);
+
+	mutex_unlock(&led_cdev->regulator_access);
+}
+
+static void led_handle_regulator(struct led_classdev *led_cdev)
+{
+	int delay = (led_cdev->flags & LED_SUSPENDED) ? 0 :
+		    led_cdev->reg_off_delay;
+
+	if (!led_cdev->regulator)
+		return;
+
+	/*
+	 * Take the lock to prevent very unlikely updates due to
+	 * turn_off_regulator_delayed() being executed at the same time
+	 */
+	mutex_lock(&led_cdev->regulator_access);
+
+	try_turn_on_regulator_if_needed(led_cdev);
+	if (!delay)
+		turn_off_regulator_if_needed(led_cdev);
+
+	mutex_unlock(&led_cdev->regulator_access);
+}
+
 static int __led_set_brightness(struct led_classdev *led_cdev,
 				enum led_brightness value)
 {
@@ -135,6 +203,8 @@ static void set_brightness_delayed(struct work_struct *ws)
 	    (led_cdev->flags & LED_HW_PLUGGABLE)))
 		dev_err(led_cdev->dev,
 			"Setting an LED's brightness failed (%d)\n", ret);
+
+	 led_handle_regulator(led_cdev);
 }
 
 static void led_set_software_blink(struct led_classdev *led_cdev,
@@ -189,6 +259,7 @@ static void led_blink_setup(struct led_classdev *led_cdev,
 void led_init_core(struct led_classdev *led_cdev)
 {
 	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
+	INIT_DELAYED_WORK(&led_cdev->reg_off_work, turn_off_regulator_delayed);
 
 	timer_setup(&led_cdev->blink_timer, led_timer_function, 0);
 }
@@ -269,8 +340,62 @@ EXPORT_SYMBOL_GPL(led_set_brightness);
 void led_set_brightness_nopm(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
-	/* Use brightness_set op if available, it is guaranteed not to sleep */
-	if (!__led_set_brightness(led_cdev, value))
+	bool defer_work = false;
+	bool regulator_on = !!value;
+
+
+	if (led_cdev->regulator) {
+		int old;
+
+		/*
+		 * If the regulator must not be turned OFF automatically,
+		 * make sure it is turned ON.
+		 */
+		if (!led_cdev->reg_auto_off)
+			regulator_on = true;
+
+		if (regulator_on)
+			old = atomic_fetch_or(REG_U_ON,
+					      &led_cdev->regulator_state);
+		else
+			old = atomic_fetch_and(~REG_U_ON,
+					       &led_cdev->regulator_state);
+
+		if (!regulator_on && old == REG_R_ON_U_ON) {
+			int delay = (led_cdev->flags & LED_SUSPENDED) ? 0 :
+				    led_cdev->reg_off_delay;
+
+			/*
+			 * the regulator must  be turned off. This cannot be
+			 * here because we can't sleep. Defer the job or, if a
+			 * delay is asked for, schedule a delayed work
+			 */
+			if (delay)
+				schedule_delayed_work(&led_cdev->reg_off_work,
+						      msecs_to_jiffies(delay));
+			else
+				defer_work = true;
+		} else if (regulator_on && old == REG_R_OFF_U_OFF) {
+			/*
+			 * the regulator must be enabled. This cannot be here
+			 * because we can't sleep. Defer the job
+			 */
+			defer_work = true;
+		}
+		/*
+		 * small optimization. Cancel the work that had been started
+		 * to turn OFF the regulator. It wouldn't have been turned off
+		 * anyway because regulator_state has changed to REG_R_x_U_ON
+		 */
+		if (regulator_on && old == REG_R_ON_U_OFF)
+			cancel_delayed_work(&led_cdev->reg_off_work);
+	}
+
+	/*
+	 * If defered work is not asked for, use brightness_set
+	 * op now if available, it is guaranteed not to sleep
+	 */
+	if (!defer_work && !__led_set_brightness(led_cdev, value))
 		return;
 
 	/* If brightness setting can sleep, delegate it to a work queue task */
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 0b577cece8f7..5cb76e547b7d 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -11,6 +11,24 @@
 
 #include <linux/rwsem.h>
 #include <linux/leds.h>
+#include <linux/regulator/consumer.h>
+
+/*
+ * The regulator state tracks 2 boolean variables:
+ * - the state of regulator (or more precisely the state required by
+ *   led core layer, as many users can interact with the same regulator).
+ *   It is tracked by bit 0.
+ * - the state last asked-for by the LED user. It is tracked by bit 1.
+ */
+#define REG_R_ON BIT(0)
+#define REG_U_ON BIT(1)
+
+enum {	REG_R_OFF_U_OFF = 0,
+	REG_R_ON_U_OFF = REG_R_ON,
+	REG_R_OFF_U_ON = REG_U_ON,
+	REG_R_ON_U_ON = REG_R_ON | REG_U_ON
+};
+
 
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9b94cf752012..b0a4d1f56825 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -149,6 +149,15 @@ struct led_classdev {
 
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
+
+	/* regulator */
+	struct regulator	*regulator;
+	struct mutex		regulator_access;
+	atomic_t		regulator_state;
+	bool			reg_auto_off;
+	int			reg_off_delay;
+	struct delayed_work	reg_off_work;
+
 };
 
 /**
-- 
2.17.1

