Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A2DC88DD
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 14:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfJBMkW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 08:40:22 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59774 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbfJBMkI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 08:40:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce4iQ099751;
        Wed, 2 Oct 2019 07:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570020005;
        bh=LTptu4xsK2SSC6pHmnlTsv5lsaOlzGsykAE7HDElzj8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=trdaIvHDEc71SXi1tiXM/knMFHqBRDLGSYkXFoRzIhMSskmieo/K/qttZ03RU7nx6
         TB5NoRTxemMk5Pna/uGcry0O9LpdG4VImovbPbrH1i4Av0H8gtoZq6Qh50Pk0VmZcW
         WPr88fpBdYyQYrauMSOVTyKl9KNsjiw9kGZoR/EY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Ce4vN009203
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:40:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:39:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:39:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce4ji094957;
        Wed, 2 Oct 2019 07:40:04 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 4/6] leds: core: Remove extern from header
Date:   Wed, 2 Oct 2019 07:40:40 -0500
Message-ID: <20191002124042.25593-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191002124042.25593-1-dmurphy@ti.com>
References: <20191002124042.25593-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

extern is implied and is not needed in the header file.
Remove the extern keyword and re-align the code.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 include/linux/leds.h | 95 ++++++++++++++++++++------------------------
 1 file changed, 44 insertions(+), 51 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 0b6b6166e9ea..52e50183b963 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -161,7 +161,7 @@ struct led_classdev {
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_classdev_register_ext(struct device *parent,
+int led_classdev_register_ext(struct device *parent,
 				     struct led_classdev *led_cdev,
 				     struct led_init_data *init_data);
 
@@ -181,7 +181,7 @@ static inline int led_classdev_register(struct device *parent,
 	return led_classdev_register_ext(parent, led_cdev, NULL);
 }
 
-extern int devm_led_classdev_register_ext(struct device *parent,
+int devm_led_classdev_register_ext(struct device *parent,
 					  struct led_classdev *led_cdev,
 					  struct led_init_data *init_data);
 
@@ -190,11 +190,11 @@ static inline int devm_led_classdev_register(struct device *parent,
 {
 	return devm_led_classdev_register_ext(parent, led_cdev, NULL);
 }
-extern void led_classdev_unregister(struct led_classdev *led_cdev);
-extern void devm_led_classdev_unregister(struct device *parent,
-					 struct led_classdev *led_cdev);
-extern void led_classdev_suspend(struct led_classdev *led_cdev);
-extern void led_classdev_resume(struct led_classdev *led_cdev);
+void led_classdev_unregister(struct led_classdev *led_cdev);
+void devm_led_classdev_unregister(struct device *parent,
+				  struct led_classdev *led_cdev);
+void led_classdev_suspend(struct led_classdev *led_cdev);
+void led_classdev_resume(struct led_classdev *led_cdev);
 
 /**
  * led_blink_set - set blinking with software fallback
@@ -211,9 +211,8 @@ extern void led_classdev_resume(struct led_classdev *led_cdev);
  * led_cdev->brightness_set() will not stop the blinking,
  * use led_classdev_brightness_set() instead.
  */
-extern void led_blink_set(struct led_classdev *led_cdev,
-			  unsigned long *delay_on,
-			  unsigned long *delay_off);
+void led_blink_set(struct led_classdev *led_cdev, unsigned long *delay_on,
+		   unsigned long *delay_off);
 /**
  * led_blink_set_oneshot - do a oneshot software blink
  * @led_cdev: the LED to start blinking
@@ -228,10 +227,9 @@ extern void led_blink_set(struct led_classdev *led_cdev,
  * If invert is set, led blinks for delay_off first, then for
  * delay_on and leave the led on after the on-off cycle.
  */
-extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
-				  unsigned long *delay_on,
-				  unsigned long *delay_off,
-				  int invert);
+void led_blink_set_oneshot(struct led_classdev *led_cdev,
+			   unsigned long *delay_on, unsigned long *delay_off,
+			   int invert);
 /**
  * led_set_brightness - set LED brightness
  * @led_cdev: the LED to set
@@ -241,8 +239,8 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
  * software blink timer that implements blinking when the
  * hardware doesn't. This function is guaranteed not to sleep.
  */
-extern void led_set_brightness(struct led_classdev *led_cdev,
-			       enum led_brightness brightness);
+void led_set_brightness(struct led_classdev *led_cdev,
+			enum led_brightness brightness);
 
 /**
  * led_set_brightness_sync - set LED brightness synchronously
@@ -255,8 +253,8 @@ extern void led_set_brightness(struct led_classdev *led_cdev,
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_set_brightness_sync(struct led_classdev *led_cdev,
-				   enum led_brightness value);
+int led_set_brightness_sync(struct led_classdev *led_cdev,
+			    enum led_brightness value);
 
 /**
  * led_update_brightness - update LED brightness
@@ -267,7 +265,7 @@ extern int led_set_brightness_sync(struct led_classdev *led_cdev,
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_update_brightness(struct led_classdev *led_cdev);
+int led_update_brightness(struct led_classdev *led_cdev);
 
 /**
  * led_get_default_pattern - return default pattern
@@ -279,8 +277,7 @@ extern int led_update_brightness(struct led_classdev *led_cdev);
  * Return:    Allocated array of integers with default pattern from device tree
  *            or NULL.  Caller is responsible for kfree().
  */
-extern u32 *led_get_default_pattern(struct led_classdev *led_cdev,
-				    unsigned int *size);
+u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int *size);
 
 /**
  * led_sysfs_disable - disable LED sysfs interface
@@ -288,7 +285,7 @@ extern u32 *led_get_default_pattern(struct led_classdev *led_cdev,
  *
  * Disable the led_cdev's sysfs interface.
  */
-extern void led_sysfs_disable(struct led_classdev *led_cdev);
+void led_sysfs_disable(struct led_classdev *led_cdev);
 
 /**
  * led_sysfs_enable - enable LED sysfs interface
@@ -296,7 +293,7 @@ extern void led_sysfs_disable(struct led_classdev *led_cdev);
  *
  * Enable the led_cdev's sysfs interface.
  */
-extern void led_sysfs_enable(struct led_classdev *led_cdev);
+void led_sysfs_enable(struct led_classdev *led_cdev);
 
 /**
  * led_compose_name - compose LED class device name
@@ -311,8 +308,8 @@ extern void led_sysfs_enable(struct led_classdev *led_cdev);
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_compose_name(struct device *dev, struct led_init_data *init_data,
-			    char *led_classdev_name);
+int led_compose_name(struct device *dev, struct led_init_data *init_data,
+		     char *led_classdev_name);
 
 /**
  * led_sysfs_is_disabled - check if LED sysfs interface is disabled
@@ -362,27 +359,24 @@ struct led_trigger {
 #define led_trigger_get_drvdata(dev)	(led_get_trigger_data(led_trigger_get_led(dev)))
 
 /* Registration functions for complex triggers */
-extern int led_trigger_register(struct led_trigger *trigger);
-extern void led_trigger_unregister(struct led_trigger *trigger);
-extern int devm_led_trigger_register(struct device *dev,
+int led_trigger_register(struct led_trigger *trigger);
+void led_trigger_unregister(struct led_trigger *trigger);
+int devm_led_trigger_register(struct device *dev,
 				     struct led_trigger *trigger);
 
-extern void led_trigger_register_simple(const char *name,
+void led_trigger_register_simple(const char *name,
 				struct led_trigger **trigger);
-extern void led_trigger_unregister_simple(struct led_trigger *trigger);
-extern void led_trigger_event(struct led_trigger *trigger,
-				enum led_brightness event);
-extern void led_trigger_blink(struct led_trigger *trigger,
-			      unsigned long *delay_on,
-			      unsigned long *delay_off);
-extern void led_trigger_blink_oneshot(struct led_trigger *trigger,
-				      unsigned long *delay_on,
-				      unsigned long *delay_off,
-				      int invert);
-extern void led_trigger_set_default(struct led_classdev *led_cdev);
-extern int led_trigger_set(struct led_classdev *led_cdev,
-			   struct led_trigger *trigger);
-extern void led_trigger_remove(struct led_classdev *led_cdev);
+void led_trigger_unregister_simple(struct led_trigger *trigger);
+void led_trigger_event(struct led_trigger *trigger,  enum led_brightness event);
+void led_trigger_blink(struct led_trigger *trigger, unsigned long *delay_on,
+		       unsigned long *delay_off);
+void led_trigger_blink_oneshot(struct led_trigger *trigger,
+			       unsigned long *delay_on,
+			       unsigned long *delay_off,
+			       int invert);
+void led_trigger_set_default(struct led_classdev *led_cdev);
+int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
+void led_trigger_remove(struct led_classdev *led_cdev);
 
 static inline void led_set_trigger_data(struct led_classdev *led_cdev,
 					void *trigger_data)
@@ -410,8 +404,7 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
  * This is meant to be used on triggers with statically
  * allocated name.
  */
-extern void led_trigger_rename_static(const char *name,
-				      struct led_trigger *trig);
+void led_trigger_rename_static(const char *name, struct led_trigger *trig);
 
 #define module_led_trigger(__led_trigger) \
 	module_driver(__led_trigger, led_trigger_register, \
@@ -453,20 +446,20 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 
 /* Trigger specific functions */
 #ifdef CONFIG_LEDS_TRIGGER_DISK
-extern void ledtrig_disk_activity(bool write);
+void ledtrig_disk_activity(bool write);
 #else
 static inline void ledtrig_disk_activity(bool write) {}
 #endif
 
 #ifdef CONFIG_LEDS_TRIGGER_MTD
-extern void ledtrig_mtd_activity(void);
+void ledtrig_mtd_activity(void);
 #else
 static inline void ledtrig_mtd_activity(void) {}
 #endif
 
 #if defined(CONFIG_LEDS_TRIGGER_CAMERA) || defined(CONFIG_LEDS_TRIGGER_CAMERA_MODULE)
-extern void ledtrig_flash_ctrl(bool on);
-extern void ledtrig_torch_ctrl(bool on);
+void ledtrig_flash_ctrl(bool on);
+void ledtrig_torch_ctrl(bool on);
 #else
 static inline void ledtrig_flash_ctrl(bool on) {}
 static inline void ledtrig_torch_ctrl(bool on) {}
@@ -546,7 +539,7 @@ enum cpu_led_event {
 	CPU_LED_HALTED,		/* Machine shutdown */
 };
 #ifdef CONFIG_LEDS_TRIGGER_CPU
-extern void ledtrig_cpu(enum cpu_led_event evt);
+void ledtrig_cpu(enum cpu_led_event evt);
 #else
 static inline void ledtrig_cpu(enum cpu_led_event evt)
 {
@@ -555,7 +548,7 @@ static inline void ledtrig_cpu(enum cpu_led_event evt)
 #endif
 
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-extern void led_classdev_notify_brightness_hw_changed(
+void led_classdev_notify_brightness_hw_changed(
 	struct led_classdev *led_cdev, enum led_brightness brightness);
 #else
 static inline void led_classdev_notify_brightness_hw_changed(
-- 
2.22.0.214.g8dca754b1e

