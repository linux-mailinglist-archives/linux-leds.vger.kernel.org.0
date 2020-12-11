Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0192D6DBC
	for <lists+linux-leds@lfdr.de>; Fri, 11 Dec 2020 02:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389320AbgLKBts (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 20:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390683AbgLKBtb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 20:49:31 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD78C0613CF;
        Thu, 10 Dec 2020 17:48:50 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id c5so3795727wrp.6;
        Thu, 10 Dec 2020 17:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtc0kHWzrRlSB8aT+/XpYP8rVdKPHzRZO/BZxBMxcwA=;
        b=sqA3Pug/pV6iNV59C7qwfBIkGGSZSa42arFYfd3zOr2k+oNCz/ivGVH4XmP09CeYtP
         fJwBfZTnV4bpplex2t1r9BO64xvSjVrE2EE/vUqwre++1IGCzqed9/lHhF7eBzc6/sIr
         uV85Gle3i0e7SmgUBEMQuVghID5sDddf2NJnOQVI+09ybKPS6RyzW2M2vJ6Qi1UQ9/DH
         FC5x80fYH1KOcE5luLPoBxKuRng1xfZj2SKJiYcO5liCfMKNWGQtEx47Rt0LW8sAcK6E
         ZEFWb3l8oYCQPQP9AyXqthbOOENHJMl3ZB5PI3V0TtirBU+SPd9h+wphH6VqjBOVt6xn
         Q7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtc0kHWzrRlSB8aT+/XpYP8rVdKPHzRZO/BZxBMxcwA=;
        b=jzbjG3qBq9e4906I5yGIwTaw835XeNvcPo2srBwb5ad8vg+Kb8T2OirSygvXpOYjP1
         ipcjmY/jO4pdK27iJ32JWu0jBNST9sF8Ob/lr6cxAiIyTl85InFhXbibcxPbyKY+BUBd
         X1BdObvsoywvxz1yNiclAv9vShmJvNkqqm2zxoToC/fwXDneVqIz3DVDu0rz27aNooa+
         sRg2OkfZQ9iurny1HhnbHOMqFfbLT3kwAYi6J6lqm+v5HRxauaMWMe53xNUMudkr+KRn
         w5flFFhuq/P+3HNiUH+MfUIwmEoui9NOdP3H9J+PKcPXhsGYsBM8GVBAdAKxK/fMbso7
         4CYA==
X-Gm-Message-State: AOAM531JCNEvAJHUWUaLKmF+6BunvaXlPqfP+aJ190w8IZ3P+1lTp5nY
        3akaRa3gE2pD+3vqhpI1/KE=
X-Google-Smtp-Source: ABdhPJwXdyMDyr4GwTpTrg436FM4u2K3wPQqYywaSlUdZFHvi5f3uvjqWpp0RsHDRItvkdNWNB0RMA==
X-Received: by 2002:adf:9e4c:: with SMTP id v12mr10886907wre.22.1607651329398;
        Thu, 10 Dec 2020 17:48:49 -0800 (PST)
Received: from localhost ([41.45.127.175])
        by smtp.gmail.com with ESMTPSA id s4sm12990582wra.91.2020.12.10.17.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 17:48:48 -0800 (PST)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] leds: led-core: Get rid of enum led_brightness
Date:   Fri, 11 Dec 2020 03:48:40 +0200
Message-Id: <20201211014840.1554095-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This gets rid of enum led_brightness in the main led files,
because it is deprecated, and an int can be used instead,
or maybe even a uint8_t since it only goes up to 255.
Next we can also patch the other files to get rid of it completely.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/leds/led-class.c |  3 +--
 drivers/leds/led-core.c  | 20 +++++++-------------
 drivers/leds/leds.h      |  6 ++----
 include/linux/leds.h     | 12 +++++-------
 4 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 131ca83f5fb3..51497c187967 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -145,8 +145,7 @@ static void led_remove_brightness_hw_changed(struct led_classdev *led_cdev)
 	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
 }
 
-void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cdev,
-					       enum led_brightness brightness)
+void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cdev, int brightness)
 {
 	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
 		return;
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index c4e780bdb385..f024efb31853 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -39,8 +39,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
-static int __led_set_brightness(struct led_classdev *led_cdev,
-				enum led_brightness value)
+static int __led_set_brightness(struct led_classdev *led_cdev, int value)
 {
 	if (!led_cdev->brightness_set)
 		return -ENOTSUPP;
@@ -50,8 +49,7 @@ static int __led_set_brightness(struct led_classdev *led_cdev,
 	return 0;
 }
 
-static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
-					 enum led_brightness value)
+static int __led_set_brightness_blocking(struct led_classdev *led_cdev, int value)
 {
 	if (!led_cdev->brightness_set_blocking)
 		return -ENOTSUPP;
@@ -240,8 +238,7 @@ void led_stop_software_blink(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_stop_software_blink);
 
-void led_set_brightness(struct led_classdev *led_cdev,
-			enum led_brightness brightness)
+void led_set_brightness(struct led_classdev *led_cdev, int brightness)
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
+void led_set_brightness_nopm(struct led_classdev *led_cdev, int value)
 {
 	/* Use brightness_set op if available, it is guaranteed not to sleep */
 	if (!__led_set_brightness(led_cdev, value))
@@ -281,8 +277,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
 
-void led_set_brightness_nosleep(struct led_classdev *led_cdev,
-				enum led_brightness value)
+void led_set_brightness_nosleep(struct led_classdev *led_cdev, int value)
 {
 	led_cdev->brightness = min(value, led_cdev->max_brightness);
 
@@ -293,8 +288,7 @@ void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
 
-int led_set_brightness_sync(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+int led_set_brightness_sync(struct led_classdev *led_cdev, int value)
 {
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 2d9eb48bbed9..08925d8adcb0 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -19,10 +19,8 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
 
 void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
-void led_set_brightness_nopm(struct led_classdev *led_cdev,
-				enum led_brightness value);
-void led_set_brightness_nosleep(struct led_classdev *led_cdev,
-				enum led_brightness value);
+void led_set_brightness_nopm(struct led_classdev *led_cdev, int value);
+void led_set_brightness_nosleep(struct led_classdev *led_cdev, int value);
 ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 			struct bin_attribute *attr, char *buf,
 			loff_t pos, size_t count);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993..392d43ff793b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -63,8 +63,8 @@ struct led_hw_trigger_type {
 
 struct led_classdev {
 	const char		*name;
-	enum led_brightness	 brightness;
-	enum led_brightness	 max_brightness;
+    int brightness;
+    int max_brightness;
 	int			 flags;
 
 	/* Lower 16 bits reflect status */
@@ -253,8 +253,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
  * software blink timer that implements blinking when the
  * hardware doesn't. This function is guaranteed not to sleep.
  */
-void led_set_brightness(struct led_classdev *led_cdev,
-			enum led_brightness brightness);
+void led_set_brightness(struct led_classdev *led_cdev, int brightness);
 
 /**
  * led_set_brightness_sync - set LED brightness synchronously
@@ -267,8 +266,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
  *
  * Returns: 0 on success or negative error value on failure
  */
-int led_set_brightness_sync(struct led_classdev *led_cdev,
-			    enum led_brightness value);
+int led_set_brightness_sync(struct led_classdev *led_cdev, int value);
 
 /**
  * led_update_brightness - update LED brightness
@@ -565,7 +563,7 @@ static inline void ledtrig_cpu(enum cpu_led_event evt)
 
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
 void led_classdev_notify_brightness_hw_changed(
-	struct led_classdev *led_cdev, enum led_brightness brightness);
+	struct led_classdev *led_cdev, int brightness);
 #else
 static inline void led_classdev_notify_brightness_hw_changed(
 	struct led_classdev *led_cdev, enum led_brightness brightness) { }

base-commit: 9fca90cf28920c6d0723d7efd1eae0b0fb90309c
-- 
2.28.0.rc0

