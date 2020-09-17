Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D1126E89D
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgIQWfC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:02 -0400
Received: from mail.nic.cz ([217.31.204.67]:36256 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726311AbgIQWeQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:16 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 1E94E14205E;
        Fri, 18 Sep 2020 00:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382041; bh=jZ8ZKbCaBfpOTI42umXMwjZ8PS6Z/JhU+RtfKD5P5nA=;
        h=From:To:Date;
        b=wBbttyCDphE/Gi2vKHzPd6S9NX3XrNgyZXCoQ3E8dgMUWQBjULofqPvCjpV+EvDs8
         Fbi7BFBUpTHXHIve5a2mkeSSvOgVzFMveu/TMAQ4i9ql5/B/9rYjTDASd/BMWxvB5F
         bRoD0QZ0XtovbPi7ELc0Xh2em7/uowQLxykqV6oQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH leds v2 42/50] leds: ns2: cosmetic variable rename
Date:   Fri, 18 Sep 2020 00:33:30 +0200
Message-Id: <20200917223338.14164-43-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rename variable led_dat to led in various functions.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 103 ++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 56 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 6dba6208433ca..dde476420a733 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -62,21 +62,20 @@ struct ns2_led {
 	struct ns2_led_modval	*modval;
 };
 
-static int ns2_led_get_mode(struct ns2_led *led_dat,
-			    enum ns2_led_modes *mode)
+static int ns2_led_get_mode(struct ns2_led *led, enum ns2_led_modes *mode)
 {
 	int i;
 	int ret = -EINVAL;
 	int cmd_level;
 	int slow_level;
 
-	cmd_level = gpiod_get_value_cansleep(led_dat->cmd);
-	slow_level = gpiod_get_value_cansleep(led_dat->slow);
+	cmd_level = gpiod_get_value_cansleep(led->cmd);
+	slow_level = gpiod_get_value_cansleep(led->slow);
 
-	for (i = 0; i < led_dat->num_modes; i++) {
-		if (cmd_level == led_dat->modval[i].cmd_level &&
-		    slow_level == led_dat->modval[i].slow_level) {
-			*mode = led_dat->modval[i].mode;
+	for (i = 0; i < led->num_modes; i++) {
+		if (cmd_level == led->modval[i].cmd_level &&
+		    slow_level == led->modval[i].slow_level) {
+			*mode = led->modval[i].mode;
 			ret = 0;
 			break;
 		}
@@ -85,15 +84,14 @@ static int ns2_led_get_mode(struct ns2_led *led_dat,
 	return ret;
 }
 
-static void ns2_led_set_mode(struct ns2_led *led_dat,
-			     enum ns2_led_modes mode)
+static void ns2_led_set_mode(struct ns2_led *led, enum ns2_led_modes mode)
 {
 	int i;
 	bool found = false;
 	unsigned long flags;
 
-	for (i = 0; i < led_dat->num_modes; i++)
-		if (mode == led_dat->modval[i].mode) {
+	for (i = 0; i < led->num_modes; i++)
+		if (mode == led->modval[i].mode) {
 			found = true;
 			break;
 		}
@@ -101,38 +99,35 @@ static void ns2_led_set_mode(struct ns2_led *led_dat,
 	if (!found)
 		return;
 
-	write_lock_irqsave(&led_dat->rw_lock, flags);
+	write_lock_irqsave(&led->rw_lock, flags);
 
-	if (!led_dat->can_sleep) {
-		gpiod_set_value(led_dat->cmd,
-				led_dat->modval[i].cmd_level);
-		gpiod_set_value(led_dat->slow,
-				led_dat->modval[i].slow_level);
+	if (!led->can_sleep) {
+		gpiod_set_value(led->cmd, led->modval[i].cmd_level);
+		gpiod_set_value(led->slow, led->modval[i].slow_level);
 		goto exit_unlock;
 	}
 
-	gpiod_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
-	gpiod_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
+	gpiod_set_value_cansleep(led->cmd, led->modval[i].cmd_level);
+	gpiod_set_value_cansleep(led->slow, led->modval[i].slow_level);
 
 exit_unlock:
-	write_unlock_irqrestore(&led_dat->rw_lock, flags);
+	write_unlock_irqrestore(&led->rw_lock, flags);
 }
 
 static void ns2_led_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
-	struct ns2_led *led_dat =
-		container_of(led_cdev, struct ns2_led, cdev);
+	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
 	enum ns2_led_modes mode;
 
 	if (value == LED_OFF)
 		mode = NS_V2_LED_OFF;
-	else if (led_dat->sata)
+	else if (led->sata)
 		mode = NS_V2_LED_SATA;
 	else
 		mode = NS_V2_LED_ON;
 
-	ns2_led_set_mode(led_dat, mode);
+	ns2_led_set_mode(led, mode);
 }
 
 static int ns2_led_set_blocking(struct led_classdev *led_cdev,
@@ -147,8 +142,7 @@ static ssize_t ns2_led_sata_store(struct device *dev,
 				  const char *buff, size_t count)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct ns2_led *led_dat =
-		container_of(led_cdev, struct ns2_led, cdev);
+	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
 	int ret;
 	unsigned long enable;
 
@@ -158,18 +152,18 @@ static ssize_t ns2_led_sata_store(struct device *dev,
 
 	enable = !!enable;
 
-	if (led_dat->sata == enable)
+	if (led->sata == enable)
 		goto exit;
 
-	led_dat->sata = enable;
+	led->sata = enable;
 
 	if (!led_get_brightness(led_cdev))
 		goto exit;
 
 	if (enable)
-		ns2_led_set_mode(led_dat, NS_V2_LED_SATA);
+		ns2_led_set_mode(led, NS_V2_LED_SATA);
 	else
-		ns2_led_set_mode(led_dat, NS_V2_LED_ON);
+		ns2_led_set_mode(led, NS_V2_LED_ON);
 
 exit:
 	return count;
@@ -179,10 +173,9 @@ static ssize_t ns2_led_sata_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct ns2_led *led_dat =
-		container_of(led_cdev, struct ns2_led, cdev);
+	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
 
-	return sprintf(buf, "%d\n", led_dat->sata);
+	return sprintf(buf, "%d\n", led->sata);
 }
 
 static DEVICE_ATTR(sata, 0644, ns2_led_sata_show, ns2_led_sata_store);
@@ -194,40 +187,38 @@ static struct attribute *ns2_led_attrs[] = {
 ATTRIBUTE_GROUPS(ns2_led);
 
 static int
-create_ns2_led(struct platform_device *pdev, struct ns2_led *led_dat,
+create_ns2_led(struct platform_device *pdev, struct ns2_led *led,
 	       const struct ns2_led_of_one *template)
 {
 	int ret;
 	enum ns2_led_modes mode;
 
-	rwlock_init(&led_dat->rw_lock);
-
-	led_dat->cdev.name = template->name;
-	led_dat->cdev.default_trigger = template->default_trigger;
-	led_dat->cdev.blink_set = NULL;
-	led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
-	led_dat->cdev.groups = ns2_led_groups;
-	led_dat->cmd = template->cmd;
-	led_dat->slow = template->slow;
-	led_dat->can_sleep = gpiod_cansleep(led_dat->cmd) |
-				gpiod_cansleep(led_dat->slow);
-	if (led_dat->can_sleep)
-		led_dat->cdev.brightness_set_blocking = ns2_led_set_blocking;
+	rwlock_init(&led->rw_lock);
+
+	led->cdev.name = template->name;
+	led->cdev.default_trigger = template->default_trigger;
+	led->cdev.blink_set = NULL;
+	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev.groups = ns2_led_groups;
+	led->cmd = template->cmd;
+	led->slow = template->slow;
+	led->can_sleep = gpiod_cansleep(led->cmd) | gpiod_cansleep(led->slow);
+	if (led->can_sleep)
+		led->cdev.brightness_set_blocking = ns2_led_set_blocking;
 	else
-		led_dat->cdev.brightness_set = ns2_led_set;
-	led_dat->modval = template->modval;
-	led_dat->num_modes = template->num_modes;
+		led->cdev.brightness_set = ns2_led_set;
+	led->modval = template->modval;
+	led->num_modes = template->num_modes;
 
-	ret = ns2_led_get_mode(led_dat, &mode);
+	ret = ns2_led_get_mode(led, &mode);
 	if (ret < 0)
 		return ret;
 
 	/* Set LED initial state. */
-	led_dat->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
-	led_dat->cdev.brightness =
-		(mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
+	led->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
+	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
 
-	return devm_led_classdev_register(&pdev->dev, &led_dat->cdev);
+	return devm_led_classdev_register(&pdev->dev, &led->cdev);
 }
 
 static int ns2_leds_parse_one(struct device *dev, struct device_node *np,
-- 
2.26.2

