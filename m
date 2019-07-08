Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79FFB61D1D
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2019 12:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730062AbfGHKgF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jul 2019 06:36:05 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37344 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbfGHKgE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jul 2019 06:36:04 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68AZv3h120681;
        Mon, 8 Jul 2019 05:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562582157;
        bh=Hylliwe9pIZ9vND2uq1hUCMIoYx9WN0BLGpxmuu5NBM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=v0b2W6GJGJ/PIXt3gMNPw2fh/1J8BsHI4W8cBuF3FLbvnYrnsuk0JWhup/RxFD1m7
         Iks+iRNelGKMMzVT3BgJ2i3/wsbmbZq2p8d7ksmO/4RDSMaBvt7r7gS2fx9fzDuR+T
         MATvABYE5IhyVRc5h1l/z2Gkm+Z19GqNaJyuOP2w=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68AZvVH020909
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jul 2019 05:35:57 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:35:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:35:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68AZu0M040287;
        Mon, 8 Jul 2019 05:35:56 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 1/2] leds: Add control of the voltage/current regulator to the LED core
Date:   Mon, 8 Jul 2019 12:35:46 +0200
Message-ID: <20190708103547.23528-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708103547.23528-1-jjhiblot@ti.com>
References: <20190708103547.23528-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

A LED is usually powered by a voltage/current regulator. Let the LED core
about it. This allows the LED core to turn on or off the power supply
as needed.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-class.c | 10 ++++++++
 drivers/leds/led-core.c  | 53 +++++++++++++++++++++++++++++++++++++---
 include/linux/leds.h     |  4 +++
 3 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4793e77808e2..e01b2d982564 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
+#include <linux/regulator/consumer.h>
 #include <uapi/linux/uleds.h>
 #include "leds.h"
 
@@ -272,6 +273,15 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	led_cdev->regulator = devm_regulator_get(led_cdev->dev, "power");
+	if (IS_ERR(led_cdev->regulator)) {
+		dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
+			led_cdev->name);
+		device_unregister(led_cdev->dev);
+		mutex_unlock(&led_cdev->led_access);
+		return PTR_ERR(led_cdev->regulator);
+	}
+
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
 		ret = led_add_brightness_hw_changed(led_cdev);
 		if (ret) {
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 7107cd7e87cf..139de6b08cad 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -16,6 +16,7 @@
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include "leds.h"
+#include <linux/regulator/consumer.h>
 
 DECLARE_RWSEM(leds_list_lock);
 EXPORT_SYMBOL_GPL(leds_list_lock);
@@ -23,6 +24,31 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
 LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);
 
+static bool __led_need_regulator_update(struct led_classdev *led_cdev,
+					int brightness)
+{
+	bool new_regulator_state = (brightness != LED_OFF);
+
+	return led_cdev->regulator_state != new_regulator_state;
+}
+
+static int __led_handle_regulator(struct led_classdev *led_cdev,
+				int brightness)
+{
+	if (__led_need_regulator_update(led_cdev, brightness)) {
+		int ret;
+
+		if (brightness != LED_OFF)
+			ret = regulator_enable(led_cdev->regulator);
+		else
+			ret = regulator_disable(led_cdev->regulator);
+		if (ret)
+			return ret;
+		led_cdev->regulator_state = (brightness != LED_OFF);
+	}
+	return 0;
+}
+
 static int __led_set_brightness(struct led_classdev *led_cdev,
 				enum led_brightness value)
 {
@@ -80,6 +106,7 @@ static void led_timer_function(struct timer_list *t)
 	}
 
 	led_set_brightness_nosleep(led_cdev, brightness);
+	__led_handle_regulator(led_cdev, brightness);
 
 	/* Return in next iteration if led is in one-shot mode and we are in
 	 * the final blink state so that the led is toggled each delay_on +
@@ -115,6 +142,8 @@ static void set_brightness_delayed(struct work_struct *ws)
 	if (ret == -ENOTSUPP)
 		ret = __led_set_brightness_blocking(led_cdev,
 					led_cdev->delayed_set_value);
+	__led_handle_regulator(led_cdev, led_cdev->delayed_set_value);
+
 	if (ret < 0 &&
 	    /* LED HW might have been unplugged, therefore don't warn */
 	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
@@ -141,6 +170,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 	/* never on - just set to off */
 	if (!delay_on) {
 		led_set_brightness_nosleep(led_cdev, LED_OFF);
+		__led_handle_regulator(led_cdev, LED_OFF);
 		return;
 	}
 
@@ -148,6 +178,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 	if (!delay_off) {
 		led_set_brightness_nosleep(led_cdev,
 					   led_cdev->blink_brightness);
+		__led_handle_regulator(led_cdev, led_cdev->blink_brightness);
 		return;
 	}
 
@@ -256,8 +287,14 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
 	/* Use brightness_set op if available, it is guaranteed not to sleep */
-	if (!__led_set_brightness(led_cdev, value))
-		return;
+	if (!__led_set_brightness(led_cdev, value)) {
+		/*
+		 * if regulator state doesn't need to be changed, that is all/
+		 * Otherwise delegate the change to a work queue
+		 */
+		if (!__led_need_regulator_update(led_cdev, value))
+			return;
+	}
 
 	/* If brightness setting can sleep, delegate it to a work queue task */
 	led_cdev->delayed_set_value = value;
@@ -280,6 +317,8 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
 int led_set_brightness_sync(struct led_classdev *led_cdev,
 			    enum led_brightness value)
 {
+	int ret;
+
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
 
@@ -288,7 +327,15 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
 
-	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	ret = __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	if (ret)
+		return ret;
+
+	ret = __led_handle_regulator(led_cdev, led_cdev->brightness);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9b2bf574a17a..bee8e3f8dddd 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -123,6 +123,10 @@ struct led_classdev {
 
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
+
+	/* regulator */
+	struct regulator	*regulator;
+	bool			regulator_state;
 };
 
 extern int of_led_classdev_register(struct device *parent,
-- 
2.17.1

