Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC33212724
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2020 16:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgGBO4h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Jul 2020 10:56:37 -0400
Received: from vps.xff.cz ([195.181.215.36]:47340 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgGBO4h (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 2 Jul 2020 10:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1593701256; bh=uDf9d/uRJiCtCt1AKubcJLejRj1GRrlsMFGfiGhHhXQ=;
        h=From:To:Cc:Subject:Date:From;
        b=sBmrw1y3Ge453s/b6duoEIXe2POYkrOzZJaYL8FeCWY463xCsUurnLS8sONz2cBlT
         TSBlhuShDIyYHOYS0GSD76SQCtKKzw8SP3rbDuWRBcA2wk1tM0SLTISlAGO3FT7xHi
         EuL4TmVsgJGT2xKBpvFq6vxbOMZnYfHTTL8Sp7I8=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-kernel@vger.kernel.org
Cc:     Ondrej Jirman <megous@megous.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org (open list:LED SUBSYSTEM)
Subject: [PATCH RFC] leds: Add support for per-LED device triggers
Date:   Thu,  2 Jul 2020 16:47:11 +0200
Message-Id: <20200702144712.1994685-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Some LED controllers may come with an internal HW triggering mechanism
for the LED and an ability to switch between user control of the LED,
or the internal control. One such example is AXP20X PMIC, that allows
wither for user control of the LED, or for internal control based on
the state of the battery charger.

Add support for registering per-LED device trigger.

Names of private triggers need to be globally unique, but may clash
with other private triggers. This is enforced during trigger
registration. Developers can register private triggers just like
the normal triggers, by setting private_led to a classdev
of the LED the trigger is associated with.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/leds/led-triggers.c | 12 +++++++++---
 include/linux/leds.h        |  3 +++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 79e30d2cb7a5..3011e2658404 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -50,7 +50,8 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 
 	down_read(&triggers_list_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (sysfs_streq(buf, trig->name)) {
+		if (sysfs_streq(buf, trig->name) &&
+		    (!trig->private_led || trig->private_led == led_cdev)) {
 			down_write(&led_cdev->trigger_lock);
 			led_trigger_set(led_cdev, trig);
 			up_write(&led_cdev->trigger_lock);
@@ -96,6 +97,9 @@ static int led_trigger_format(char *buf, size_t size,
 		bool hit = led_cdev->trigger &&
 			!strcmp(led_cdev->trigger->name, trig->name);
 
+		if (trig->private_led && trig->private_led != led_cdev)
+			continue;
+
 		len += led_trigger_snprintf(buf + len, size - len,
 					    " %s%s%s", hit ? "[" : "",
 					    trig->name, hit ? "]" : "");
@@ -243,7 +247,8 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	down_read(&triggers_list_lock);
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(led_cdev->default_trigger, trig->name)) {
+		if (!strcmp(led_cdev->default_trigger, trig->name) &&
+		    (!trig->private_led || trig->private_led == led_cdev)) {
 			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
 			break;
@@ -280,7 +285,8 @@ int led_trigger_register(struct led_trigger *trig)
 	down_write(&triggers_list_lock);
 	/* Make sure the trigger's name isn't already in use */
 	list_for_each_entry(_trig, &trigger_list, next_trig) {
-		if (!strcmp(_trig->name, trig->name)) {
+		if (!strcmp(_trig->name, trig->name) &&
+		    (!_trig->private_led || _trig->private_led == trig->private_led)) {
 			up_write(&triggers_list_lock);
 			return -EEXIST;
 		}
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 2451962d1ec5..0d7577c752ad 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -345,6 +345,9 @@ struct led_trigger {
 	int		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
 
+	/* LED-private triggers have the LED device set here. */
+	struct led_classdev *private_led;
+
 	/* LEDs under control by this trigger (for simple triggers) */
 	rwlock_t	  leddev_list_lock;
 	struct list_head  led_cdevs;
-- 
2.27.0

