Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0866F26A8D5
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 17:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgIOP24 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 11:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbgIOP1W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 11:27:22 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2A4C061352;
        Tue, 15 Sep 2020 08:26:27 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 4121C140A5C;
        Tue, 15 Sep 2020 17:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600183583; bh=QYGZf4OJO7HjEeCQKgtakp7AJOjaRcmE+QCh+p0eYp8=;
        h=From:To:Date;
        b=qq+TppLe5Qagj/TSwZuh5M6Xwi8xPaW/MHuvK+iBwRFRG3mX0fvLlQRa/XItHppd/
         iPFvbmRppX9Vewa9DYwJuN8HD5TVGu2DAJt+FzkYaoDtlouf9p3w4PsaQDn0NJGk86
         JyFyBCgorK2wLYP3K208/Dn8gKCIHMlx00EEQtgM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds + devicetree v2 1/2] leds: trigger: add trigger sources validating method and helper functions
Date:   Tue, 15 Sep 2020 17:26:15 +0200
Message-Id: <20200915152616.20591-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200915152616.20591-1-marek.behun@nic.cz>
References: <20200915152616.20591-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Currently we use the `linux,default-trigger` device tree property of a
LED to define the default trigger which should be activated for a LED.

But the LED device tree binding also documents the `trigger-sources`
property, which specifies the source device which should be triggering
the LED.

The `trigger-sources` property is currently implemented only in
drivers/usb/core/ledtrig-usbport.c.

Lets add a method to struct led_trigger which, if implemented, can check
whether this trigger should be enabled as default. This check shall be
done by checking whether the specified `trigger-sources` refers to a
device compatible with the trigger. For this two new helper functions,
of_led_count_trigger_sources and of_led_get_trigger_source, are
implemented.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 drivers/leds/led-triggers.c | 68 ++++++++++++++++++++++++++++++++-----
 include/linux/leds.h        | 25 ++++++++++++++
 2 files changed, 85 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 91da90cfb11d9..a93c1b6a94282 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -243,18 +243,30 @@ void led_trigger_remove(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
 
+static bool trigger_is_default(struct led_classdev *led_cdev,
+			       struct led_trigger *trig)
+{
+	if (!trigger_relevant(led_cdev, trig))
+		return false;
+
+	if (led_cdev->default_trigger &&
+	    !strcmp(led_cdev->default_trigger, trig->name))
+		return true;
+
+	if (trig->has_valid_source && trig->has_valid_source(led_cdev))
+		return true;
+
+	return false;
+}
+
 void led_trigger_set_default(struct led_classdev *led_cdev)
 {
 	struct led_trigger *trig;
 
-	if (!led_cdev->default_trigger)
-		return;
-
 	down_read(&triggers_list_lock);
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(led_cdev->default_trigger, trig->name) &&
-		    trigger_relevant(led_cdev, trig)) {
+		if (trigger_is_default(led_cdev, trig)) {
 			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
 			break;
@@ -306,9 +318,7 @@ int led_trigger_register(struct led_trigger *trig)
 	down_read(&leds_list_lock);
 	list_for_each_entry(led_cdev, &leds_list, node) {
 		down_write(&led_cdev->trigger_lock);
-		if (!led_cdev->trigger && led_cdev->default_trigger &&
-		    !strcmp(led_cdev->default_trigger, trig->name) &&
-		    trigger_relevant(led_cdev, trig)) {
+		if (!led_cdev->trigger && trigger_is_default(led_cdev, trig)) {
 			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
 		}
@@ -459,3 +469,45 @@ void led_trigger_unregister_simple(struct led_trigger *trig)
 	kfree(trig);
 }
 EXPORT_SYMBOL_GPL(led_trigger_unregister_simple);
+
+int of_led_count_trigger_sources(struct led_classdev *led_cdev)
+{
+	struct device_node *np;
+	int count;
+
+	np = dev_of_node(led_cdev->dev);
+	if (!np)
+		return 0;
+
+	count = of_count_phandle_with_args(np, "trigger-sources",
+					   "#trigger-source-cells");
+	if (count == -ENOENT)
+		return 0;
+	else if (count < 0)
+		dev_warn(led_cdev->dev,
+			 "Failed parsing trigger sources for %pOF!\n", np);
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_led_count_trigger_sources);
+
+int of_led_get_trigger_source(struct led_classdev *led_cdev, int index,
+			      struct of_phandle_args *args)
+{
+	struct device_node *np;
+	int err;
+
+	np = dev_of_node(led_cdev->dev);
+	if (!np)
+		return -ENOENT;
+
+	err = of_parse_phandle_with_args(np, "trigger-sources",
+					 "#trigger-source-cells", index, args);
+	if (err < 0 && err != -ENOENT)
+		dev_warn(led_cdev->dev,
+			 "Failed parsing trigger source index %i for %pOF!\n",
+			 index, np);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(of_led_get_trigger_source);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993e..c03e0a4e0e45d 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -13,6 +13,7 @@
 #include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/rwsem.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -352,6 +353,14 @@ struct led_trigger {
 	int		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
 
+	/*
+	 * Check whether LED has defined valid source for this trigger.
+	 * If yes, this trigger should be set as default trigger for LED.
+	 * This should use of_led_count_trigger_sources and
+	 * of_led_get_trigger_source functions.
+	 */
+	bool		(*has_valid_source)(struct led_classdev *led_cdev);
+
 	/* LED-private triggers have this set */
 	struct led_hw_trigger_type *trigger_type;
 
@@ -394,6 +403,10 @@ void led_trigger_set_default(struct led_classdev *led_cdev);
 int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
 void led_trigger_remove(struct led_classdev *led_cdev);
 
+int of_led_count_trigger_sources(struct led_classdev *led_cdev);
+int of_led_get_trigger_source(struct led_classdev *led_cdev, int index,
+			      struct of_phandle_args *args);
+
 static inline void led_set_trigger_data(struct led_classdev *led_cdev,
 					void *trigger_data)
 {
@@ -452,6 +465,18 @@ static inline int led_trigger_set(struct led_classdev *led_cdev,
 }
 
 static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
+
+static inline int of_led_count_trigger_sources(struct led_classdev *led_cdev)
+{
+	return 0;
+}
+static inline int of_led_get_trigger_source(struct led_classdev *led_cdev,
+					    int index,
+					    struct of_phandle_args *args)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline void led_set_trigger_data(struct led_classdev *led_cdev) {}
 static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 {
-- 
2.26.2

