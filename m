Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390FF2D5C4E
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 14:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730845AbgLJNus (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 08:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389640AbgLJNuh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 08:50:37 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC82C0613CF;
        Thu, 10 Dec 2020 05:49:57 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 91so5541001wrj.7;
        Thu, 10 Dec 2020 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzfzZTtn0NP/J3yHGUoe56G3g2NmC4GaMoZRNqGOwH4=;
        b=nywinKf+gVEpk2PWADwkSdcGTBWjStJ4Im7CPx6xwXdcehd2IxU0CWinUfNWyRUOqR
         mnRIJApLrXc7WQS45RIyWAMfnrPeQCpRC17WS/6H7hMI3MM+oflCG1RHIBuM2b86Xfbb
         twhUHk3WdDcQL4pG4cSONt4QPyNkqI8un1FO6Fk+4IsOVVujoPHIIRfUlrjtV4rCsYk5
         t0BjBBhUg8EI/k7MoY2bIm0g11nZy3MNz/2p8REUBXKornomIpJ3YRaQz+qmHMwws5XD
         Ds78lflmty1Zdt82StTfpZMaNm31RO0h+uiqUudlaC/VUznhvKAH0rfMJ1U2aQvun+7W
         psIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzfzZTtn0NP/J3yHGUoe56G3g2NmC4GaMoZRNqGOwH4=;
        b=AMg5iGVnfo+L0UBhNggnEf9HapVQL7jJXut6+8/HyiiaJA1JWbDacdjMNToFriivn+
         Et3Ksk6W0kjBN/F7HYp39unkTm6i2uK9/BHmuwXHg+9cqM2cT9PKKqt7Wq6BkvYKWhO6
         A+qah51n8akGQ8z0RZt2Hj5rI6xooKgx8FD8U2itFBsdR2YMmcsZ+DH54fkkjAqv416P
         yZebBQ09czAu8EuLDqnyPAIHruRiuNr+05TxlfqqzRhxm1CLR9EHDcZSdfFRr4ZhVCsL
         Fn7fmZJFrpPQklq53d63mBOjmjN+r7CKDzLYlhobp9xcE+PKvRP3i5nfcAvAwcTYyOpJ
         q94Q==
X-Gm-Message-State: AOAM532ouwOuYaEPnt6YR563yfa5u8qweaA8N/fwEzteKG4lO7ImCRX0
        +8jiPomHjsjpcBmrqNcMapxZIeYKC/fIeQ==
X-Google-Smtp-Source: ABdhPJy6wbpyiG+JZ9n1evwFlGlt07wFJBGMITshEYIfTGmcx/We25rq+aX+YMx4BG6aBB4dhxnYWA==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr8424905wrn.245.1607608195879;
        Thu, 10 Dec 2020 05:49:55 -0800 (PST)
Received: from localhost ([41.45.104.39])
        by smtp.gmail.com with ESMTPSA id e15sm6299915wrx.86.2020.12.10.05.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:49:55 -0800 (PST)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH] leds: led-core: Get rid of enum led_brightness
Date:   Thu, 10 Dec 2020 15:49:47 +0200
Message-Id: <20201210134947.116507-1-abanoubsameh@protonmail.com>
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
---
 drivers/leds/led-class.c |  3 +--
 drivers/leds/led-core.c  | 20 +++++++-------------
 drivers/leds/leds.h      |  6 ++----
 include/linux/leds.h     |  8 +++-----
 4 files changed, 13 insertions(+), 24 deletions(-)

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
index 6a8d6409c993..b4f8889232de 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
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
-- 
2.28.0.rc0

