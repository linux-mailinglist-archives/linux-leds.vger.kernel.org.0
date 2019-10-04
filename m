Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189E7CC02D
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 18:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390257AbfJDQHf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 12:07:35 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33356 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390128AbfJDQHf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 12:07:35 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94G7Uex002547;
        Fri, 4 Oct 2019 11:07:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570205250;
        bh=g67REGNjPHkMUt4Iq+9jtnEaNelyPFm23KrbMHhzvIM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NcNyGRtfDy2SQvRY1m9NEHZTErq++ozIFSNh41JGrLtG07qZ/DS3aEXjH1ZKGivGd
         Gf09edh6s7WA5qIofbtSdz5xmgvzPzpH/wpm6azBhMrdHehrsuUEsh9suFiYY1aZG3
         86zC4og4ymSNKIrdGjgvXNO5LvpwhazdiUNBuSgU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94G7Ugs038729
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:07:30 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:07:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:07:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94G7SMb056206;
        Fri, 4 Oct 2019 11:07:29 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v6 2/2] leds: Add control of the voltage/current regulator to the LED core
Date:   Fri, 4 Oct 2019 18:07:24 +0200
Message-ID: <20191004160724.18390-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004160724.18390-1-jjhiblot@ti.com>
References: <20191004160724.18390-1-jjhiblot@ti.com>
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

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-class.c |  21 +++++++
 drivers/leds/led-core.c  | 122 ++++++++++++++++++++++++++++++++++++++-
 drivers/leds/leds.h      |  18 ++++++
 include/linux/leds.h     |   8 +++
 4 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 80c96dd96afc..47d9f920091c 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -344,6 +344,7 @@ int led_classdev_register_ext(struct device *parent,
 	char final_name[LED_MAX_NAME_SIZE];
 	const char *proposed_name = composed_name;
 	int ret;
+	struct regulator *regulator;
 
 	if (init_data) {
 		if (init_data->devname_mandatory && !init_data->devicename) {
@@ -379,6 +380,24 @@ int led_classdev_register_ext(struct device *parent,
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
+	if (IS_ERR(regulator)) {
+		if (regulator != ERR_PTR(-ENODEV)) {
+			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
+				led_cdev->name);
+			device_unregister(led_cdev->dev);
+			mutex_unlock(&led_cdev->led_access);
+			return PTR_ERR(regulator);
+		}
+		led_cdev->regulator = NULL;
+	} else {
+		mutex_init(&led_cdev->regulator_access);
+		led_cdev->regulator = regulator;
+		atomic_set(&led_cdev->regulator_state, REG_R_OFF_U_OFF);
+		fwnode_property_read_u32(init_data->fwnode, "off-delay-ms",
+					 &led_cdev->reg_off_delay);
+	}
+
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
 		ret = led_add_brightness_hw_changed(led_cdev);
 		if (ret) {
@@ -458,6 +477,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	up_write(&leds_list_lock);
 
 	mutex_destroy(&led_cdev->led_access);
+	if (led_cdev->regulator)
+		mutex_destroy(&led_cdev->regulator_access);
 }
 EXPORT_SYMBOL_GPL(led_classdev_unregister);
 
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..81105c1ee907 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -37,6 +37,73 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
+static void turn_off_regulator_if_needed(struct led_classdev *led_cdev)
+{
+	int old = atomic_cmpxchg(&led_cdev->regulator_state, REG_R_ON_U_OFF,
+				  REG_R_OFF_U_OFF);
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
@@ -135,6 +202,8 @@ static void set_brightness_delayed(struct work_struct *ws)
 	    (led_cdev->flags & LED_HW_PLUGGABLE)))
 		dev_err(led_cdev->dev,
 			"Setting an LED's brightness failed (%d)\n", ret);
+
+	 led_handle_regulator(led_cdev);
 }
 
 static void led_set_software_blink(struct led_classdev *led_cdev,
@@ -189,6 +258,7 @@ static void led_blink_setup(struct led_classdev *led_cdev,
 void led_init_core(struct led_classdev *led_cdev)
 {
 	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
+	INIT_DELAYED_WORK(&led_cdev->reg_off_work, turn_off_regulator_delayed);
 
 	timer_setup(&led_cdev->blink_timer, led_timer_function, 0);
 }
@@ -269,8 +339,56 @@ EXPORT_SYMBOL_GPL(led_set_brightness);
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
+				schedule_delayed_work(
+						 &led_cdev->reg_off_work,
+						 msecs_to_jiffies(delay));
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
index 9b94cf752012..90afbbc67bb0 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -149,6 +149,14 @@ struct led_classdev {
 
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
+
+	/* regulator */
+	struct regulator	*regulator;
+	struct mutex		regulator_access;
+	atomic_t		regulator_state;
+	int			reg_off_delay;
+	struct delayed_work	reg_off_work;
+
 };
 
 /**
-- 
2.17.1

