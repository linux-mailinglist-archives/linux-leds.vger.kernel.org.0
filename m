Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6AB17D43F
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 15:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgCHOpD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 10:45:03 -0400
Received: from mail.manjaro.org ([176.9.38.148]:45880 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726291AbgCHOpC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Mar 2020 10:45:02 -0400
X-Greylist: delayed 1049 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Mar 2020 10:45:01 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id BDCE137A1C4B;
        Sun,  8 Mar 2020 15:27:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XVnaCmXwwKy6; Sun,  8 Mar 2020 15:27:32 +0100 (CET)
From:   Tobias Schramm <t.schramm@manjaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [RFC PATCH 1/1] leds: add generic inverted led trigger support
Date:   Sun,  8 Mar 2020 15:27:22 +0100
Message-Id: <20200308142722.1199260-2-t.schramm@manjaro.org>
In-Reply-To: <20200308142722.1199260-1-t.schramm@manjaro.org>
References: <20200308142722.1199260-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This commit allows inversion of triggers by appending "-inverted" to the
name of a trigger.

This can be useful when dealing with device that lack separate LEDs for
indicating e.g. disk activity. With this commit applied the power LED
can be used as a disk activity indicator by setting its default state to
on and using the "disk-activity-inverted" trigger. The LED will then turn
off briefly when there is disk activity.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 drivers/leds/led-triggers.c | 148 +++++++++++++++++++++++++++---------
 include/linux/leds.h        |   1 +
 2 files changed, 111 insertions(+), 38 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 79e30d2cb7a5..c40c58c6e345 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -27,14 +27,80 @@ LIST_HEAD(trigger_list);
 
  /* Used by LED Class */
 
+#define TRIGGER_INVERT_SUFFIX "-inverted"
+
+/*
+ * Check suffix of trigger name agains TRIGGER_INVERT_SUFFIX
+ */
+static bool led_trigger_is_inverted(const char *trigname)
+{
+	if (strlen(trigname) >= strlen(TRIGGER_INVERT_SUFFIX)) {
+		return !strcmp(trigname + strlen(trigname) -
+				 strlen(TRIGGER_INVERT_SUFFIX),
+				TRIGGER_INVERT_SUFFIX);
+	}
+
+	return false;
+}
+
+/*
+ * Get length of trigger name name without TRIGGER_INVERT_SUFFIX
+ */
+static size_t led_trigger_get_name_len(const char *trigname)
+{
+	// Subtract length of TRIGGER_INVERT_SUFFIX if trigger is inverted
+	if (led_trigger_is_inverted(trigname))
+		return strlen(trigname) - strlen(TRIGGER_INVERT_SUFFIX);
+	return strlen(trigname);
+}
+
+/*
+ * Find and set led trigger by name
+ */
+static int led_trigger_set_str_(struct led_classdev *led_cdev,
+			       const char *trigname, bool lock)
+{
+	struct led_trigger *trig;
+	bool inverted = led_trigger_is_inverted(trigname);
+	size_t len = led_trigger_get_name_len(trigname);
+
+	down_read(&triggers_list_lock);
+	list_for_each_entry(trig, &trigger_list, next_trig) {
+		/* Compare trigger name without inversion suffix */
+		if (strlen(trig->name) == len &&
+		    !strncmp(trigname, trig->name, len)) {
+			if (lock)
+				down_write(&led_cdev->trigger_lock);
+			led_trigger_set(led_cdev, trig);
+			if (inverted)
+				led_cdev->flags |= LED_INVERT_TRIGGER;
+			else
+				led_cdev->flags &= ~LED_INVERT_TRIGGER;
+			if (lock)
+				up_write(&led_cdev->trigger_lock);
+
+			up_read(&triggers_list_lock);
+			return 0;
+		}
+	}
+	/* we come here only if trigname matches no trigger */
+	up_read(&triggers_list_lock);
+	return -EINVAL;
+}
+
+#define led_trigger_set_str(cdev, name) led_trigger_set_str_(cdev, name, true)
+#define led_trigger_set_str_unlocked(cdev, name) \
+		led_trigger_set_str_(cdev, name, false)
+
+
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			  struct bin_attribute *bin_attr, char *buf,
 			  loff_t pos, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct led_trigger *trig;
 	int ret = count;
+	char *name;
 
 	mutex_lock(&led_cdev->led_access);
 
@@ -48,20 +114,10 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 		goto unlock;
 	}
 
-	down_read(&triggers_list_lock);
-	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (sysfs_streq(buf, trig->name)) {
-			down_write(&led_cdev->trigger_lock);
-			led_trigger_set(led_cdev, trig);
-			up_write(&led_cdev->trigger_lock);
-
-			up_read(&triggers_list_lock);
-			goto unlock;
-		}
-	}
-	/* we come here only if buf matches no trigger */
-	ret = -EINVAL;
-	up_read(&triggers_list_lock);
+	name = strim(buf);
+	ret = led_trigger_set_str(led_cdev, name);
+	if (!ret)
+		ret = count;
 
 unlock:
 	mutex_unlock(&led_cdev->led_access);
@@ -93,12 +149,22 @@ static int led_trigger_format(char *buf, size_t size,
 				       led_cdev->trigger ? "none" : "[none]");
 
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		bool hit = led_cdev->trigger &&
-			!strcmp(led_cdev->trigger->name, trig->name);
+		bool hit = led_cdev->trigger == trig;
+		bool inverted = led_cdev->flags & LED_INVERT_TRIGGER;
+
+		/* print non-inverted trigger */
+		len += led_trigger_snprintf(buf + len, size - len,
+					    " %s%s%s",
+					    hit && !inverted ? "[" : "",
+					    trig->name,
+					    hit && !inverted ? "]" : "");
 
+		/* print inverted trigger */
 		len += led_trigger_snprintf(buf + len, size - len,
-					    " %s%s%s", hit ? "[" : "",
-					    trig->name, hit ? "]" : "");
+					    " %s%s"TRIGGER_INVERT_SUFFIX"%s",
+					    hit && inverted ? "[" : "",
+					    trig->name,
+					    hit && inverted ? "]" : "");
 	}
 
 	len += led_trigger_snprintf(buf + len, size - len, "\n");
@@ -235,21 +301,15 @@ EXPORT_SYMBOL_GPL(led_trigger_remove);
 
 void led_trigger_set_default(struct led_classdev *led_cdev)
 {
-	struct led_trigger *trig;
+	bool found;
 
 	if (!led_cdev->default_trigger)
 		return;
 
 	down_read(&triggers_list_lock);
-	down_write(&led_cdev->trigger_lock);
-	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(led_cdev->default_trigger, trig->name)) {
-			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
-			led_trigger_set(led_cdev, trig);
-			break;
-		}
-	}
-	up_write(&led_cdev->trigger_lock);
+	found = !led_trigger_set_str(led_cdev, led_cdev->default_trigger);
+	if (found)
+		led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 	up_read(&triggers_list_lock);
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
@@ -292,11 +352,14 @@ int led_trigger_register(struct led_trigger *trig)
 	/* Register with any LEDs that have this as a default trigger */
 	down_read(&leds_list_lock);
 	list_for_each_entry(led_cdev, &leds_list, node) {
+		bool found;
+
 		down_write(&led_cdev->trigger_lock);
-		if (!led_cdev->trigger && led_cdev->default_trigger &&
-			    !strcmp(led_cdev->default_trigger, trig->name)) {
-			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
-			led_trigger_set(led_cdev, trig);
+		if (!led_cdev->trigger && led_cdev->default_trigger) {
+			found = !led_trigger_set_str_unlocked(led_cdev,
+					led_cdev->default_trigger);
+			if (found)
+				led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 		}
 		up_write(&led_cdev->trigger_lock);
 	}
@@ -369,8 +432,14 @@ void led_trigger_event(struct led_trigger *trig,
 		return;
 
 	read_lock(&trig->leddev_list_lock);
-	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
-		led_set_brightness(led_cdev, brightness);
+	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
+		/* Reverse brightness if LED is inverted */
+		if (led_cdev->flags & LED_INVERT_TRIGGER)
+			led_set_brightness(led_cdev,
+				led_cdev->max_brightness - brightness);
+		else
+			led_set_brightness(led_cdev, brightness);
+	}
 	read_unlock(&trig->leddev_list_lock);
 }
 EXPORT_SYMBOL_GPL(led_trigger_event);
@@ -388,10 +457,13 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
 
 	read_lock(&trig->leddev_list_lock);
 	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
-		if (oneshot)
+		bool trigger_inverted =
+			!!(led_cdev->flags & LED_INVERT_TRIGGER);
+		if (oneshot) {
+			/* use logical xnor to determine inversion parameter */
 			led_blink_set_oneshot(led_cdev, delay_on, delay_off,
-					      invert);
-		else
+					      (!!invert) == trigger_inverted);
+		} else
 			led_blink_set(led_cdev, delay_on, delay_off);
 	}
 	read_unlock(&trig->leddev_list_lock);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 75353e5f9d13..fa707170b69e 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -74,6 +74,7 @@ struct led_classdev {
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
 #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
+#define LED_INVERT_TRIGGER	BIT(24)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
-- 
2.24.1

