Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89633110D0
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 02:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfEBAyz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 20:54:55 -0400
Received: from mail.nic.cz ([217.31.204.67]:42285 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbfEBAyz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 1 May 2019 20:54:55 -0400
Received: from dellmb.labs.office.nic.cz (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTP id E6F196320A;
        Thu,  2 May 2019 02:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556758490; bh=5uwF/2CiV5JOo2ceqMLP1KBDeAxnhqW+RyfH+FdWbJA=;
        h=From:To:Date;
        b=RRUHYXUh1il4tBwk+wKwcT3+M1ZzxZ8y6sh18yzr5AwFhBPaP2jYEL5NK6tIc1yJB
         pNU5t//fKarTStliokltiBJJUjLiWTCQtOt28wCbmIyf90wGdqtwWWjsz/XY+RKj0o
         jxAxfNTYau/4ywPleC6zn37+Mu+m9AL4cvD02knw=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds-next RFC 1/1] led: triggers: add HW LED triggers functionality
Date:   Thu,  2 May 2019 02:54:47 +0200
Message-Id: <20190502005447.11919-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds HW LED triggering functionality.

HW triggers can be selected by the same sysfs file as regular triggers,
/sys/class/leds/<led>/trigger, the difference is that HW triggers names
are prefixed with "hw:".

Reading sysfs trigger file returns available HW triggers at the end of
the list.

Each LED class device can have different HW triggers available,
therefore this commit changes the sysfs trigger API in such a way that
for different LED class devices reading the trigger file can return
different results.

Internally the code works by adding three properties to struct
led_classdev:
  const char * const *available_hw_triggers;
    this is a NULL-terminated list of available HW triggers for this LED
    class device

  const char *hw_trigger;
    currently selected HW trigger

  int (*hw_trigger_set)(struct led_classdev *, const char *);
    pointer to a function by which HW trigger can be set

These properties must be set by the LED driver when registering LEDs,
if the driver wants to support HW triggering.

HW triggers are internally represented as strings, not as objects of
struct led_trigger or something like that. Because HW LED triggering is
only enabled if CONFIG_LEDS_HW_TRIGGERS is, and most of the changes are
in led-triggers.c file, this file has now several #ifdefs inside
function code. Should this be moved into one #ifdef by using static
inline functions and callbacks?

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/Kconfig        |   8 ++
 drivers/leds/led-triggers.c | 165 +++++++++++++++++++++++++++++++-----
 include/linux/leds.h        |  18 ++++
 3 files changed, 170 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f3000ccb8d35..85637e073de7 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -780,4 +780,12 @@ config LEDS_NIC78BX
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
+config LEDS_HW_TRIGGERS
+	bool "LED Hardware Trigger support"
+	depends on LEDS_TRIGGERS
+	help
+	  This option enables hardware LED triggers. Some devices have LEDs
+	  wired to hardware which has outputs dedicated to LED control, for
+	  example network PHYs.
+
 endif # NEW_LEDS
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 2d451b6c24af..ca555f2118ce 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -30,6 +30,11 @@ LIST_HEAD(trigger_list);
 
  /* Used by LED Class */
 
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+static int led_hw_trigger_set(struct led_classdev *led_cdev,
+			      const char *hwtrig);
+#endif
+
 ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
@@ -49,6 +54,29 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 		goto unlock;
 	}
 
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+	/* check if a hardware LED trigger was selected */
+	if (!strncmp(buf, "hw:", 3)) {
+		const char * const *hwtrig;
+
+		if (!led_cdev->hw_triggers) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+
+		for (hwtrig = led_cdev->available_hw_triggers;
+		     *hwtrig; ++hwtrig) {
+			/* skip "hw:" in comparison */
+			if (sysfs_streq(buf + 3, hwtrig)) {
+				down_write(&led_cdev->trigger_lock);
+				ret = led_hw_trigger_set(led_cdev, buf);
+				up_write(&led_cdev->trigger_lock);
+				goto unlock;
+			}
+		}
+	}
+#endif
+
 	down_read(&triggers_list_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (sysfs_streq(buf, trig->name)) {
@@ -70,21 +98,33 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 }
 EXPORT_SYMBOL_GPL(led_trigger_store);
 
+static bool _led_has_trigger_set(struct led_classdev *led_cdev)
+{
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+	return !!led_cdev->trigger || !!led_cdev->hw_trigger;
+#else
+	return !!led_cdev->trigger;
+#endif
+}
+
 ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_trigger *trig;
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+	const char * const *hwtrig;
+#endif
 	int len = 0;
 
 	down_read(&triggers_list_lock);
-	down_read(&led_cdev->trigger_lock);
 
-	if (!led_cdev->trigger)
+	if (!_led_has_trigger_set(led_cdev))
 		len += scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
 	else
 		len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
 
+	down_read(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
 							trig->name))
@@ -95,6 +135,20 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
 					 trig->name);
 	}
 	up_read(&led_cdev->trigger_lock);
+
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+	for (hwtrig = led_cdev->available_hw_triggers;
+	     *hwtrig; ++hwtrig) {
+		if (led_cdev->hw_trigger && !strcmp(led_cdev->hw_trigger,
+						    hwtrig))
+			len += scnprintf(buf+len, PAGE_SIZE - len, "[hw:%s] ",
+					 hwtrig);
+		else
+			len += scnprintf(buf+len, PAGE_SIZE - len, "hw:%s ",
+					 hwtrig);
+	}
+#endif
+
 	up_read(&triggers_list_lock);
 
 	len += scnprintf(len+buf, PAGE_SIZE - len, "\n");
@@ -102,22 +156,24 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
 }
 EXPORT_SYMBOL_GPL(led_trigger_show);
 
-/* Caller must ensure led_cdev->trigger_lock held */
-int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
+/* removes any existing trigger or HW trigger */
+static int _led_trigger_remove((struct led_classdev *led_cdev)
 {
 	unsigned long flags;
-	char *event = NULL;
-	char *envp[2];
-	const char *name;
 	int ret;
 
-	if (!led_cdev->trigger && !trig)
-		return 0;
-
-	name = trig ? trig->name : "none";
-	event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+	if (led_cdev->hw_trigger) {
+		ret = led_cdev->hw_trigger_set(led_cdev, NULL);
+		if (ret < 0) {
+			dev_err(led_cdev->dev, "Failed to unset HW trigger!\n");
+			return ret;
+		}
 
-	/* Remove any existing trigger */
+		kfree(led_cdev->hw_trigger);
+		led_cdev->hw_trigger = NULL;
+	} else
+#endif
 	if (led_cdev->trigger) {
 		write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
 		list_del(&led_cdev->trig_list);
@@ -133,6 +189,73 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		led_cdev->activated = false;
 		led_set_brightness(led_cdev, LED_OFF);
 	}
+
+	return 0;
+}
+
+static void _led_trigger_event(struct led_classdev *led_cdev, const char *name)
+{
+	char *event = NULL;
+	char *envp[2];
+
+	event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
+
+	if (event) {
+		envp[0] = event;
+		envp[1] = NULL;
+		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
+			dev_err(led_cdev->dev,
+				"%s: Error sending uevent\n", __func__);
+		kfree(event);
+	}
+}
+
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+/*
+ * Sets HW trigger of @led_cdev to @hwtrig.
+ * @hwtrig must be non-null and prefixed by "hw:".
+ * Caller must ensure led_cdev->trigger_lock held.
+ * To remove HW trigger use led_trigger_remove.
+ */
+static int led_hw_trigger_set(struct led_classdev *led_cdev, const char *hwtrig)
+{
+	int ret;
+	const char *trig;
+
+	/* skip "hw:" */
+	trig = hwtrig + 3;
+
+	/* Remove any existing trigger */
+	ret = _led_trigger_remove(led_cdev))
+	if (ret)
+		return ret;
+
+	ret = led_cdev->hw_trigger_set(led_cdev, trig);
+	if (ret)
+		return ret;
+
+	led_cdev->hw_trigger = kstrdup_const(trig, GFP_KERNEL);
+
+	_led_trigger_event(led_cdev, hwtrig);
+
+	return 0;
+}
+#endif
+
+/* Caller must ensure led_cdev->trigger_lock held */
+int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
+{
+	unsigned long flags;
+	int ret;
+
+	if (!_led_has_trigger_set(led_cdev) && !trig)
+		return 0;
+
+	/* Remove any existing trigger */
+	ret = _led_trigger_remove(led_cdev);
+	if (ret)
+		return ret;
+
 	if (trig) {
 		write_lock_irqsave(&trig->leddev_list_lock, flags);
 		list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
@@ -154,14 +277,7 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		}
 	}
 
-	if (event) {
-		envp[0] = event;
-		envp[1] = NULL;
-		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
-			dev_err(led_cdev->dev,
-				"%s: Error sending uevent\n", __func__);
-		kfree(event);
-	}
+	_led_trigger_event(led_cdev, trig ? trig->name : "none");
 
 	return 0;
 
@@ -216,6 +332,9 @@ void led_trigger_rename_static(const char *name, struct led_trigger *trig)
 	/* new name must be on a temporary string to prevent races */
 	BUG_ON(name == trig->name);
 
+	/* trigger name beginning with "hw:" is reserved for HW triggers */
+	BUG_ON(!strncmp(name, "hw:", 3));
+
 	down_write(&triggers_list_lock);
 	/* this assumes that trig->name was originaly allocated to
 	 * non constant storage */
@@ -231,6 +350,10 @@ int led_trigger_register(struct led_trigger *trig)
 	struct led_classdev *led_cdev;
 	struct led_trigger *_trig;
 
+	/* trigger name beginning with "hw:" is reserved for HW triggers */
+	if (!strncmp(trig->name, "hw:", 3))
+		return -EINVAL;
+
 	rwlock_init(&trig->leddev_list_lock);
 	INIT_LIST_HEAD(&trig->led_cdevs);
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 78204650fe2a..df500b85e945 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -118,6 +118,13 @@ struct led_classdev {
 	void			*trigger_data;
 	/* true if activated - deactivate routine uses it to do cleanup */
 	bool			activated;
+
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+	const char		*hw_trigger;
+	int			(*hw_trigger_set)(struct led_classdev *led_cdev,
+						  const char *trigger);
+	const char * const	*available_hw_triggers;
+#endif
 #endif
 
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
@@ -129,6 +136,17 @@ struct led_classdev {
 	struct mutex		led_access;
 };
 
+#ifdef CONFIG_LEDS_TRIGGERS
+static inline bool _led_has_trigger_set(struct led_classdev *led_cdev)
+{
+#ifdef CONFIG_LEDS_HW_TRIGGERS
+	return !!led_cdev->trigger || !!led_cdev->hw_trigger;
+#else
+	return !!led_cdev->trigger;
+#endif
+}
+#endif
+
 extern int of_led_classdev_register(struct device *parent,
 				    struct device_node *np,
 				    struct led_classdev *led_cdev);
-- 
2.21.0

