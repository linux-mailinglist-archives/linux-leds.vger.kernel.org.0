Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58476E94AA
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 14:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjDTMik (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 08:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjDTMij (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 08:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33B065B6
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 05:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681994269;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k8+IE/q2pNRUh0tg5VQbyxqBcTsd9/IAuh0Wgo9bFGA=;
        b=SfQ8DVkYMppdUcDhAAi2e6fzx+uDEBWyBCbnV8HUIaV/NIpjkXv6ioUK/WBQZYPEdA7QDv
        SNkQaBdlkhtCg6+KoU3LFYMmRQqD4tb7teDSl1/t39+7Pw7Hl/A9NqEhJyxYTxdkN39F5S
        resjxCGNaPFM3wctMfuPpptlHxNUhD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-dRC3p3KbPSGoSzITBRmxlA-1; Thu, 20 Apr 2023 08:37:46 -0400
X-MC-Unique: dRC3p3KbPSGoSzITBRmxlA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2751D85A588;
        Thu, 20 Apr 2023 12:37:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.216])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4A986492C3E;
        Thu, 20 Apr 2023 12:37:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
Subject: [PATCH v2 3/5] leds: cht-wcove: Add support for breathing mode use hw_pattern sysfs API
Date:   Thu, 20 Apr 2023 14:37:39 +0200
Message-Id: <20230420123741.57160-4-hdegoede@redhat.com>
In-Reply-To: <20230420123741.57160-1-hdegoede@redhat.com>
References: <20230420123741.57160-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The hw-blinking of the LED controller in the Whiskey Cove PMIC can also
be used for a hw-breathing effect.

As discussed during review of v2 of the submission of the new
leds-cht-wcove driver, the LED subsystem already supports breathing mode
on several other LED controllers using the hw_pattern interface.

Implement a pattern_set callback to implement breathing mode modelled
after the breathing mode supported by the SC27xx breathing light and
Crane EL15203000 LED drivers. The Whiskey Cove PMIC's breathing mode
is closer to the EL15203000 one then to the SC27xx one since it does
not support staying high / low for a specific time, it only supports
rise and fall times.

As such the supported hw_pattern and the documentation for this is almost
a 1:1 copy of the pattern/docs for the EL15203000 breathing mode.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Link: https://lore.kernel.org/all/6beed61c-1fc6-6525-e873-a8978f5fbffb@gmail.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2
- Improve/extend Documentation/leds/leds-cht-wcove.rst a bit
---
 Documentation/leds/index.rst          |  1 +
 Documentation/leds/leds-cht-wcove.rst | 38 ++++++++++++++++++++++++
 drivers/leds/leds-cht-wcove.c         | 42 ++++++++++++++++++++++++---
 3 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/leds/leds-cht-wcove.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index b9ca081fac71..c92612271e25 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -17,6 +17,7 @@ LEDs
    uleds
 
    leds-blinkm
+   leds-cht-wcove
    leds-el15203000
    leds-lm3556
    leds-lp3944
diff --git a/Documentation/leds/leds-cht-wcove.rst b/Documentation/leds/leds-cht-wcove.rst
new file mode 100644
index 000000000000..5ec7cb60c4aa
--- /dev/null
+++ b/Documentation/leds/leds-cht-wcove.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================================
+Kernel driver for Intel Cherry Trail Whiskey Cove PMIC LEDs
+===========================================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the Whiskey Cove PMIC LEDs.
+
+The only supported pattern is hardware breathing mode::
+
+    "0 2000 1 2000"
+
+	^
+	|
+    Max-|     ---
+	|    /   \
+	|   /     \
+	|  /       \     /
+	| /         \   /
+    Min-|-           ---
+	|
+	0------2------4--> time (sec)
+
+The rise and fall times must be the same value.
+Supported values are 2000, 1000, 500 and 250 for
+breathing frequencies of 1/4, 1/2, 1 and 2 Hz.
+
+The set pattern only controls the timing. For max brightness the last
+set brightness is used and the max brightness can be changed
+while breathing by writing the brightness attribute.
+
+This is just like how blinking works in the LED subsystem,
+for both sw and hw blinking the brightness can also be changed
+while blinking. Breathing on this hw really is just a variant
+mode of blinking.
diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 166c6f010492..23e97b08f6ea 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -218,9 +218,10 @@ static int cht_wc_leds_find_freq(unsigned long period)
 		return -1;
 }
 
-static int cht_wc_leds_blink_set(struct led_classdev *cdev,
-				 unsigned long *delay_on,
-				 unsigned long *delay_off)
+static int cht_wc_leds_set_effect(struct led_classdev *cdev,
+				  unsigned long *delay_on,
+				  unsigned long *delay_off,
+				  u8 effect)
 {
 	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
 	unsigned int ctrl;
@@ -247,7 +248,7 @@ static int cht_wc_leds_blink_set(struct led_classdev *cdev,
 	}
 
 	ret = regmap_update_bits(led->regmap, led->regs->fsm,
-				 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_BLINKING);
+				 CHT_WC_LED_EFF_MASK, effect);
 	if (ret < 0)
 		dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
 
@@ -266,6 +267,37 @@ static int cht_wc_leds_blink_set(struct led_classdev *cdev,
 	return ret;
 }
 
+static int cht_wc_leds_blink_set(struct led_classdev *cdev,
+				 unsigned long *delay_on,
+				 unsigned long *delay_off)
+{
+	return cht_wc_leds_set_effect(cdev, delay_on, delay_off, CHT_WC_LED_EFF_BLINKING);
+}
+
+static int cht_wc_leds_pattern_set(struct led_classdev *cdev,
+				   struct led_pattern *pattern,
+				   u32 len, int repeat)
+{
+	unsigned long delay_off, delay_on;
+
+	if (repeat > 0 || len != 2 ||
+	    pattern[0].brightness != LED_OFF || pattern[1].brightness != LED_ON ||
+	    pattern[0].delta_t != pattern[1].delta_t ||
+	    (pattern[0].delta_t != 250 && pattern[0].delta_t != 500 &&
+	     pattern[0].delta_t != 1000 && pattern[0].delta_t != 2000))
+		return -EINVAL;
+
+	delay_off = pattern[0].delta_t;
+	delay_on  = pattern[1].delta_t;
+
+	return cht_wc_leds_set_effect(cdev, &delay_on, &delay_off, CHT_WC_LED_EFF_BREATHING);
+}
+
+static int cht_wc_leds_pattern_clear(struct led_classdev *cdev)
+{
+	return cht_wc_leds_brightness_set(cdev, LED_OFF);
+}
+
 static int cht_wc_led_save_regs(struct cht_wc_led *led,
 				struct cht_wc_led_saved_regs *saved_regs)
 {
@@ -322,6 +354,8 @@ static int cht_wc_leds_probe(struct platform_device *pdev)
 		led->cdev.brightness_set_blocking = cht_wc_leds_brightness_set;
 		led->cdev.brightness_get = cht_wc_leds_brightness_get;
 		led->cdev.blink_set = cht_wc_leds_blink_set;
+		led->cdev.pattern_set = cht_wc_leds_pattern_set;
+		led->cdev.pattern_clear = cht_wc_leds_pattern_clear;
 		led->cdev.max_brightness = 255;
 
 		ret = led_classdev_register(&pdev->dev, &led->cdev);
-- 
2.39.2

