Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D826E014D
	for <lists+linux-leds@lfdr.de>; Wed, 12 Apr 2023 23:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjDLV7v (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Apr 2023 17:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjDLV7u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Apr 2023 17:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CED459CA
        for <linux-leds@vger.kernel.org>; Wed, 12 Apr 2023 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681336747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fzNdP8XlgELctBlSSuZSCoWRTxiBD7s45wNhTEtxqXk=;
        b=Us6n6WTdiBLQqSwd1VpfWVO5YunJaPC+WAJcKlFq80AB8/mr+DXmfcRDLJzYim/Z93ppJ+
        PB1wRfXM/bL1t9fTMz58lBXmHE2XTvx2RkdZvaHYqoe67A/0RW7C42SkGPblOSu2MZtNTy
        aE5d3bKN+K37mThMJ76A+KcbOAtfRms=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-nCjSTX3wMESZc9YcmrFnVg-1; Wed, 12 Apr 2023 17:59:04 -0400
X-MC-Unique: nCjSTX3wMESZc9YcmrFnVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D03AE85A588;
        Wed, 12 Apr 2023 21:59:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1E8731121320;
        Wed, 12 Apr 2023 21:59:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
Subject: [PATCH 2/4] leds: Fix set_brightness_delayed() race
Date:   Wed, 12 Apr 2023 23:58:53 +0200
Message-Id: <20230412215855.593541-3-hdegoede@redhat.com>
In-Reply-To: <20230412215855.593541-1-hdegoede@redhat.com>
References: <20230412215855.593541-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When a trigger wants to switch from blinking to LED on it needs to call:
	led_set_brightness(LED_OFF);
	led_set_brightness(LED_FULL);

To first call disables blinking and the second then turns the LED on
(the power-supply charging-blink-full-solid triggers do this).

These calls happen immediately after each other, so it is possible
that set_brightness_delayed() from the first call has not run yet
when the led_set_brightness(LED_FULL) call finishes.

If this race hits then this is causing problems for both
sw- and hw-blinking:

For sw-blinking set_brightness_delayed() clears delayed_set_value
when LED_BLINK_DISABLE is set causing the led_set_brightness(LED_FULL)
call effects to get lost when hitting the race, resulting in the LED
turning off instead of on.

For hw-blinking if the race hits delayed_set_value has been
set to LED_FULL by the time set_brightness_delayed() runs.
So led_cdev->brightness_set_blocking() is never called with
LED_OFF as argument and the hw-blinking is never disabled leaving
the LED blinking instead of on.

Fix both issues by adding LED_SET_BRIGHTNESS and LED_SET_BRIGHTNESS_OFF
work_flags making this 2 separate actions to be run by
set_brightness_delayed().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-core.c | 57 +++++++++++++++++++++++++++++++----------
 include/linux/leds.h    |  3 +++
 2 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 4a97cb745788..e61acc785410 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -114,21 +114,14 @@ static void led_timer_function(struct timer_list *t)
 	mod_timer(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
 }
 
-static void set_brightness_delayed(struct work_struct *ws)
+static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
+						  unsigned int value)
 {
-	struct led_classdev *led_cdev =
-		container_of(ws, struct led_classdev, set_brightness_work);
 	int ret = 0;
 
-	if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
-		led_cdev->delayed_set_value = LED_OFF;
-		led_stop_software_blink(led_cdev);
-	}
-
-	ret = __led_set_brightness(led_cdev, led_cdev->delayed_set_value);
+	ret = __led_set_brightness(led_cdev, value);
 	if (ret == -ENOTSUPP)
-		ret = __led_set_brightness_blocking(led_cdev,
-					led_cdev->delayed_set_value);
+		ret = __led_set_brightness_blocking(led_cdev, value);
 	if (ret < 0 &&
 	    /* LED HW might have been unplugged, therefore don't warn */
 	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
@@ -137,6 +130,30 @@ static void set_brightness_delayed(struct work_struct *ws)
 			"Setting an LED's brightness failed (%d)\n", ret);
 }
 
+static void set_brightness_delayed(struct work_struct *ws)
+{
+	struct led_classdev *led_cdev =
+		container_of(ws, struct led_classdev, set_brightness_work);
+
+	if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
+		led_stop_software_blink(led_cdev);
+		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
+	}
+
+	/*
+	 * Triggers may call led_set_brightness(LED_OFF),
+	 * led_set_brightness(LED_FULL) in quick succession to disable blinking
+	 * and turn the LED on. Both actions may have been scheduled to run
+	 * before this work item runs once. To make sure this works properly
+	 * handle LED_SET_BRIGHTNESS_OFF first.
+	 */
+	if (test_and_clear_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags))
+		set_brightness_delayed_set_brightness(led_cdev, LED_OFF);
+
+	if (test_and_clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags))
+		set_brightness_delayed_set_brightness(led_cdev, led_cdev->delayed_set_value);
+}
+
 static void led_set_software_blink(struct led_classdev *led_cdev,
 				   unsigned long delay_on,
 				   unsigned long delay_off)
@@ -271,8 +288,22 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
 	if (!__led_set_brightness(led_cdev, value))
 		return;
 
-	/* If brightness setting can sleep, delegate it to a work queue task */
-	led_cdev->delayed_set_value = value;
+	/*
+	 * Brightness setting can sleep, delegate it to a work queue task.
+	 * value 0 / LED_OFF is special, since it also disables hw-blinking
+	 * (sw-blink disable is handled in led_set_brightness()).
+	 * To avoid a hw-blink-disable getting lost when a second brightness
+	 * change is done immediately afterwards (before the work runs),
+	 * it uses a separate work_flag.
+	 */
+	if (value) {
+		led_cdev->delayed_set_value = value;
+		set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
+	} else {
+		clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
+		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
+	}
+
 	schedule_work(&led_cdev->set_brightness_work);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6006786cafdc..eb68aea79c6d 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -116,6 +116,9 @@ struct led_classdev {
 #define LED_BLINK_INVERT		3
 #define LED_BLINK_BRIGHTNESS_CHANGE 	4
 #define LED_BLINK_DISABLE		5
+	/* Brightness off also disables hw-blinking so it is a separate action */
+#define LED_SET_BRIGHTNESS_OFF		6
+#define LED_SET_BRIGHTNESS		7
 
 	/* Set LED brightness level
 	 * Must not sleep. Use brightness_set_blocking for drivers
-- 
2.39.1

