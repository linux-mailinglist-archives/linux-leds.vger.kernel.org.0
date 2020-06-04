Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9741EE627
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 15:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbgFDN7M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 09:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728849AbgFDN7M (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 09:59:12 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0ACC08C5C0;
        Thu,  4 Jun 2020 06:59:11 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f5so5751403wmh.2;
        Thu, 04 Jun 2020 06:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LXkOe8FnqKwPZokyaaA8r1GwQWMxE1jQDYC4CMUB8fI=;
        b=HlDfsFA6lPN0YVTmcwvLuAlDq990p1RXIui4rMuxdABjpUT92w6/KYQxi7f5EmsBUW
         yKF3TJ+dVyRFIM0TDsu2HVcQyXBgWvd0lgsfbA+D0au960pjzPwAnQ3LRPrYf3XE+CXi
         IYrSlOlwhg1PP3fDM0eTOTo8p42lrlM6wHx1ObS1ni5yUNa5jGabZvlIk3M7vbxJ4HLZ
         MVaOQbLyI4q375Ncs2D6uOQYgWImVhwDbMna8FUdJi2J5RJ6sPj0ywN9a3jfDgsL+VCz
         gBCi/AGoMhIu53aAog3AAY/P7wv7V/so6e3hjLOoNEXePv7bWdrcA56RNcE3kCYANS/a
         7sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LXkOe8FnqKwPZokyaaA8r1GwQWMxE1jQDYC4CMUB8fI=;
        b=iAEL8BFhQ0QHcN46IAx9EDTOQFSidBm9MzHa3ifTTmfOrD22cvbm0uxZt1FopwM2j/
         capRB3e54A7h6vcdurbS9/rTsaQYgZjvCDpf+kuwy7NaV7T7ZRxohve8tovmbzzmUH3i
         gNNkC51PP6Mjd//YrGZw89C9XXW3CiBiz86xIyPOoVPAKfPzVIFcGOMv3qOvzDXQQtz+
         79J5wPQC+vD4cyXw8E98TVPzEAsa2KlloyqLO60ExtmPUivCr3IIRw572svaHoz1+EIY
         PgxY1pNlXiXaPnR/8jhDYPPLtdlP7iriCs+2GETDQssMXKAmLdfQsxK9IfeCcaUHcuu2
         3FdA==
X-Gm-Message-State: AOAM531o9MOg7E70JfbBrywBH77zR8GBY3tmIVMQ6atw9DdSG6Xu9Rlf
        e9jmUv+veWw9uFZgy7hjelMoEeQun40=
X-Google-Smtp-Source: ABdhPJxyrUE2DqBQpUxvDjicGOP7YjFUKj/HAXCOMbT/wabBhfNwWkJmgnK/Fahj8vHQV8L2wVM1AA==
X-Received: by 2002:a05:600c:24d1:: with SMTP id 17mr4119461wmu.48.1591279147091;
        Thu, 04 Jun 2020 06:59:07 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id l2sm7900882wru.58.2020.06.04.06.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:59:06 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, jonas.gorski@gmail.com,
        rpurdie@rpsys.net, pavel@ucw.cz
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v5] leds-bcm6328: support second hw blinking interval
Date:   Thu,  4 Jun 2020 15:59:05 +0200
Message-Id: <20200604135905.1899171-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604134826.1808153-1-noltari@gmail.com>
References: <20200604134826.1808153-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Right now the driver uses only 3 LED modes:
0: On
1: HW Blinking (Interval 1)
3: Off

However, the controller supports a second HW blinking interval, which results
in 4 possible LED modes:
0: On
1: HW Blinking (Interval 1)
2: HW Blinking (Interval 2)
3: Off

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v5: add commit description including LED modes clarification
 v4: improve code documentation and use blink instead of intervals, which
     should make the code much more clear to understand
 v3: add code documentation
 v2: remove LED from the other blinking interval

 drivers/leds/leds-bcm6328.c | 97 ++++++++++++++++++++++++++++---------
 1 file changed, 75 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 42e1b7598c3a..bad7efb75112 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -24,12 +24,17 @@
 
 #define BCM6328_LED_MAX_COUNT		24
 #define BCM6328_LED_DEF_DELAY		500
-#define BCM6328_LED_INTERVAL_MS		20
 
-#define BCM6328_LED_INTV_MASK		0x3f
-#define BCM6328_LED_FAST_INTV_SHIFT	6
-#define BCM6328_LED_FAST_INTV_MASK	(BCM6328_LED_INTV_MASK << \
-					 BCM6328_LED_FAST_INTV_SHIFT)
+#define BCM6328_LED_BLINK_DELAYS	2
+#define BCM6328_LED_BLINK_MS		20
+
+#define BCM6328_LED_BLINK_MASK		0x3f
+#define BCM6328_LED_BLINK1_SHIFT	0
+#define BCM6328_LED_BLINK1_MASK		(BCM6328_LED_BLINK_MASK << \
+					 BCM6328_LED_BLINK1_SHIFT)
+#define BCM6328_LED_BLINK2_SHIFT	6
+#define BCM6328_LED_BLINK2_MASK		(BCM6328_LED_BLINK_MASK << \
+					 BCM6328_LED_BLINK2_SHIFT)
 #define BCM6328_SERIAL_LED_EN		BIT(12)
 #define BCM6328_SERIAL_LED_MUX		BIT(13)
 #define BCM6328_SERIAL_LED_CLK_NPOL	BIT(14)
@@ -45,8 +50,8 @@
 
 #define BCM6328_LED_MODE_MASK		3
 #define BCM6328_LED_MODE_ON		0
-#define BCM6328_LED_MODE_FAST		1
-#define BCM6328_LED_MODE_BLINK		2
+#define BCM6328_LED_MODE_BLINK1		1
+#define BCM6328_LED_MODE_BLINK2		2
 #define BCM6328_LED_MODE_OFF		3
 #define BCM6328_LED_SHIFT(X)		((X) << 1)
 
@@ -127,12 +132,18 @@ static void bcm6328_led_set(struct led_classdev *led_cdev,
 	unsigned long flags;
 
 	spin_lock_irqsave(led->lock, flags);
-	*(led->blink_leds) &= ~BIT(led->pin);
+
+	/* Remove LED from cached HW blinking intervals */
+	led->blink_leds[0] &= ~BIT(led->pin);
+	led->blink_leds[1] &= ~BIT(led->pin);
+
+	/* Set LED on/off */
 	if ((led->active_low && value == LED_OFF) ||
 	    (!led->active_low && value != LED_OFF))
 		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
 	else
 		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
+
 	spin_unlock_irqrestore(led->lock, flags);
 }
 
@@ -140,8 +151,8 @@ static unsigned long bcm6328_blink_delay(unsigned long delay)
 {
 	unsigned long bcm6328_delay;
 
-	bcm6328_delay = delay + BCM6328_LED_INTERVAL_MS / 2;
-	bcm6328_delay = bcm6328_delay / BCM6328_LED_INTERVAL_MS;
+	bcm6328_delay = delay + BCM6328_LED_BLINK_MS / 2;
+	bcm6328_delay = bcm6328_delay / BCM6328_LED_BLINK_MS;
 	if (bcm6328_delay == 0)
 		bcm6328_delay = 1;
 
@@ -168,28 +179,68 @@ static int bcm6328_blink_set(struct led_classdev *led_cdev,
 		return -EINVAL;
 	}
 
-	if (delay > BCM6328_LED_INTV_MASK) {
+	if (delay > BCM6328_LED_BLINK_MASK) {
 		dev_dbg(led_cdev->dev,
 			"fallback to soft blinking (delay > %ums)\n",
-			BCM6328_LED_INTV_MASK * BCM6328_LED_INTERVAL_MS);
+			BCM6328_LED_BLINK_MASK * BCM6328_LED_BLINK_MS);
 		return -EINVAL;
 	}
 
 	spin_lock_irqsave(led->lock, flags);
-	if (*(led->blink_leds) == 0 ||
-	    *(led->blink_leds) == BIT(led->pin) ||
-	    *(led->blink_delay) == delay) {
+	/*
+	 * Check if any of the two configurable HW blinking intervals is
+	 * available:
+	 *   1. No LEDs assigned to the HW blinking interval.
+	 *   2. Only this LED is assigned to the HW blinking interval.
+	 *   3. LEDs with the same delay assigned.
+	 */
+	if (led->blink_leds[0] == 0 ||
+	    led->blink_leds[0] == BIT(led->pin) ||
+	    led->blink_delay[0] == delay) {
 		unsigned long val;
 
-		*(led->blink_leds) |= BIT(led->pin);
-		*(led->blink_delay) = delay;
+		/* Add LED to the first HW blinking interval cache */
+		led->blink_leds[0] |= BIT(led->pin);
+
+		/* Remove LED from the second HW blinking interval cache */
+		led->blink_leds[1] &= ~BIT(led->pin);
 
+		/* Cache first HW blinking interval delay */
+		led->blink_delay[0] = delay;
+
+		/* Update the delay for the first HW blinking interval */
 		val = bcm6328_led_read(led->mem + BCM6328_REG_INIT);
-		val &= ~BCM6328_LED_FAST_INTV_MASK;
-		val |= (delay << BCM6328_LED_FAST_INTV_SHIFT);
+		val &= ~BCM6328_LED_BLINK1_MASK;
+		val |= (delay << BCM6328_LED_BLINK1_SHIFT);
 		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
 
-		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK);
+		/* Set the LED to first HW blinking interval */
+		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK1);
+
+		rc = 0;
+	} else if (led->blink_leds[1] == 0 ||
+		   led->blink_leds[1] == BIT(led->pin) ||
+		   led->blink_delay[1] == delay) {
+		unsigned long val;
+
+		/* Remove LED from the first HW blinking interval */
+		led->blink_leds[0] &= ~BIT(led->pin);
+
+		/* Add LED to the second HW blinking interval */
+		led->blink_leds[1] |= BIT(led->pin);
+
+		/* Cache second HW blinking interval delay */
+		led->blink_delay[1] = delay;
+
+		/* Update the delay for the second HW blinking interval */
+		val = bcm6328_led_read(led->mem + BCM6328_REG_INIT);
+		val &= ~BCM6328_LED_BLINK2_MASK;
+		val |= (delay << BCM6328_LED_BLINK2_SHIFT);
+		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
+
+		/* Set the LED to second HW blinking interval */
+		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK2);
+
 		rc = 0;
 	} else {
 		dev_dbg(led_cdev->dev,
@@ -358,11 +409,13 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 	if (!lock)
 		return -ENOMEM;
 
-	blink_leds = devm_kzalloc(dev, sizeof(*blink_leds), GFP_KERNEL);
+	blink_leds = devm_kcalloc(dev, BCM6328_LED_BLINK_DELAYS,
+				  sizeof(*blink_leds), GFP_KERNEL);
 	if (!blink_leds)
 		return -ENOMEM;
 
-	blink_delay = devm_kzalloc(dev, sizeof(*blink_delay), GFP_KERNEL);
+	blink_delay = devm_kcalloc(dev, BCM6328_LED_BLINK_DELAYS,
+				   sizeof(*blink_delay), GFP_KERNEL);
 	if (!blink_delay)
 		return -ENOMEM;
 
-- 
2.26.2

