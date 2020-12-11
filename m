Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD352D8022
	for <lists+linux-leds@lfdr.de>; Fri, 11 Dec 2020 21:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732470AbgLKUn2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Dec 2020 15:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgLKUm6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Dec 2020 15:42:58 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C6FC0613CF;
        Fri, 11 Dec 2020 12:42:18 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id a11so2583523wrr.13;
        Fri, 11 Dec 2020 12:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3VRngt9K4ZtslP1jN8Q2ri8EtjrwqmDuse2f8eMq7I=;
        b=Ae2CQLV3STiRi/b8cmUurvVkFdF4xIv/n4qlPiJXSh1oiUyB68y9PJEBvJc0I+z3pG
         LYEsUlEiqfMZrrwr+xCVKA+j/fLvDxuT9Eul6SUjHNwv+FvfNrwsyv9LAfPjq3NQ5zth
         El/X0oU7XmQrCaPIN4AQwaOmwbtEYc6FPcDGNjyDD9uxwQ3LDzPPFh43njk8bmBPMTgg
         YntzBaueDqiW4HC+PudTlBqrpaXoneZGTp5K7qCfpWTcP7cl8EAHe2U9fDzcDYnxv1KQ
         qxn3KqIvCV0QeaRwqgqpR3RW8voCBskTgZTOPn497P1vTpRALRCbT/lff6wLwJrmvdhX
         tvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3VRngt9K4ZtslP1jN8Q2ri8EtjrwqmDuse2f8eMq7I=;
        b=WR/TBx1sIxY7O5fTY/GJAYcjsJPdz9HgIpEwhkOVdmk2DZLtWkqrlLSRU6Z/rNTgOv
         8x/XGlBp0Otgwpmzs3c28XdWZ+qUcVmAPERFmvL1X2IoMGIlyvIdMcXTGA2CGdOnRFRn
         /lTbUVsVX48hX6ZtqOYJBiFPrhfaV1rIWj2C32OhDCTvzw8aXYKs7qTlTmrc8mMzyZ8a
         KWzsYjLx29qPNSpKm2LETZtKboCZdutxOVXdUIFPPG2EkcdO47SBSewUYPm/G9OT8g1w
         UBJf1uJwuSAPk0k/pQmyhiZLGrg7aRxdyPJ0WAbHWtr0uNo0sjPc+gsebiygMpWbbAJ/
         nSgQ==
X-Gm-Message-State: AOAM533TgAX1AvoKyhyo8VctrDyLmDeVNa3bhRiOxNPJAK4wpnr8CsS7
        mSlg0cGWRmOAvBt1JHAgDSg/8bdCIvg5NA==
X-Google-Smtp-Source: ABdhPJzXV3ZlVH74DV5cLi5CQrkUzDIwxT4bTuzv0OPU9LEX/WHTZgnaj+stjwRgMpNVTN8L4AocaA==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr14234726wrr.61.1607719336792;
        Fri, 11 Dec 2020 12:42:16 -0800 (PST)
Received: from localhost ([41.45.127.175])
        by smtp.gmail.com with ESMTPSA id v1sm1484687wre.62.2020.12.11.12.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:42:16 -0800 (PST)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH] leds: led-core: Get rid of enum led_brightness
Date:   Fri, 11 Dec 2020 22:42:08 +0200
Message-Id: <20201211204208.179981-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This gets rid of enum led_brightness in the main led files,
because it is deprecated, and an unsigned int can be used instead.

We can get rid of led_brightness completely and
patches can also be supplied for the other drivers' files.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/leds/led-class.c |  3 +--
 drivers/leds/led-core.c  | 20 +++++++-------------
 drivers/leds/leds.h      |  6 ++----
 include/linux/leds.h     | 12 +++++-------
 4 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 131ca83f5fb3..2e495ff67856 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -145,8 +145,7 @@ static void led_remove_brightness_hw_changed(struct led_classdev *led_cdev)
 	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
 }
 
-void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cdev,
-					       enum led_brightness brightness)
+void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cdev, unsigned int brightness)
 {
 	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
 		return;
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index c4e780bdb385..8eb8054ef9c6 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -39,8 +39,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
-static int __led_set_brightness(struct led_classdev *led_cdev,
-				enum led_brightness value)
+static int __led_set_brightness(struct led_classdev *led_cdev, unsigned int value)
 {
 	if (!led_cdev->brightness_set)
 		return -ENOTSUPP;
@@ -50,8 +49,7 @@ static int __led_set_brightness(struct led_classdev *led_cdev,
 	return 0;
 }
 
-static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
-					 enum led_brightness value)
+static int __led_set_brightness_blocking(struct led_classdev *led_cdev, unsigned int value)
 {
 	if (!led_cdev->brightness_set_blocking)
 		return -ENOTSUPP;
@@ -240,8 +238,7 @@ void led_stop_software_blink(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_stop_software_blink);
 
-void led_set_brightness(struct led_classdev *led_cdev,
-			enum led_brightness brightness)
+void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
 {
 	/*
 	 * If software blink is active, delay brightness setting
@@ -253,7 +250,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
 		 * work queue task to avoid problems in case we are called
 		 * from hard irq context.
 		 */
-		if (brightness == LED_OFF) {
+		if (!brightness) {
 			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
 			schedule_work(&led_cdev->set_brightness_work);
 		} else {
@@ -268,8 +265,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL_GPL(led_set_brightness);
 
-void led_set_brightness_nopm(struct led_classdev *led_cdev,
-			      enum led_brightness value)
+void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
 {
 	/* Use brightness_set op if available, it is guaranteed not to sleep */
 	if (!__led_set_brightness(led_cdev, value))
@@ -281,8 +277,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
 
-void led_set_brightness_nosleep(struct led_classdev *led_cdev,
-				enum led_brightness value)
+void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value)
 {
 	led_cdev->brightness = min(value, led_cdev->max_brightness);
 
@@ -293,8 +288,7 @@ void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
 
-int led_set_brightness_sync(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value)
 {
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 2d9eb48bbed9..345062ccabda 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -19,10 +19,8 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
 
 void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
-void led_set_brightness_nopm(struct led_classdev *led_cdev,
-				enum led_brightness value);
-void led_set_brightness_nosleep(struct led_classdev *led_cdev,
-				enum led_brightness value);
+void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value);
+void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value);
 ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 			struct bin_attribute *attr, char *buf,
 			loff_t pos, size_t count);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993..329fd914cf24 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -63,8 +63,8 @@ struct led_hw_trigger_type {
 
 struct led_classdev {
 	const char		*name;
-	enum led_brightness	 brightness;
-	enum led_brightness	 max_brightness;
+	unsigned int brightness;
+	unsigned int max_brightness;
 	int			 flags;
 
 	/* Lower 16 bits reflect status */
@@ -253,8 +253,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
  * software blink timer that implements blinking when the
  * hardware doesn't. This function is guaranteed not to sleep.
  */
-void led_set_brightness(struct led_classdev *led_cdev,
-			enum led_brightness brightness);
+void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness);
 
 /**
  * led_set_brightness_sync - set LED brightness synchronously
@@ -267,8 +266,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
  *
  * Returns: 0 on success or negative error value on failure
  */
-int led_set_brightness_sync(struct led_classdev *led_cdev,
-			    enum led_brightness value);
+int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
 
 /**
  * led_update_brightness - update LED brightness
@@ -565,7 +563,7 @@ static inline void ledtrig_cpu(enum cpu_led_event evt)
 
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
 void led_classdev_notify_brightness_hw_changed(
-	struct led_classdev *led_cdev, enum led_brightness brightness);
+	struct led_classdev *led_cdev, unsigned int brightness);
 #else
 static inline void led_classdev_notify_brightness_hw_changed(
 	struct led_classdev *led_cdev, enum led_brightness brightness) { }

base-commit: 33dc9614dc208291d0c4bcdeb5d30d481dcd2c4c
-- 
2.28.0.rc0

