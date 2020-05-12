Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB91F1CF20D
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2020 12:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbgELKBm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 May 2020 06:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725889AbgELKBl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 12 May 2020 06:01:41 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A918C061A0C
        for <linux-leds@vger.kernel.org>; Tue, 12 May 2020 03:01:41 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id v12so14546188wrp.12
        for <linux-leds@vger.kernel.org>; Tue, 12 May 2020 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=toJ+ooWnYg7FA7y0GkeMG9F1r0CMU1j5CMmrODAAn6E=;
        b=MAFofutvz7ZV5uTv4Zn/P7QsKPZCVZlxPxDVbDw+HeN/QL/ZaTtRenNhO8sboEjq/2
         gvOc8Z8itxhLZGI3nk72EUCdvmgBzrmBtDk96hfm9oh5KJ1tgra6YYCjcpkOnSZRoltr
         ab2OvrzqgywfrD70bITakOxKv0H3TXF7yFMO8jbCWgjuAsvQ5yKFFZaxH3KmV03t/Pxf
         9s0wAdmaqNK48oEdDK1uwVE9tRkFJsYlc8VOTXJz+9xN/u/mZXYsZbfTC+8TqV73D2ij
         wqC7Y6045XKdqekf/J3RhYiHvu3kgFyxeGjOmaaQUy+20AeT82ksf0zd9OT30N8jxmfZ
         3hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=toJ+ooWnYg7FA7y0GkeMG9F1r0CMU1j5CMmrODAAn6E=;
        b=R/RHI8CAnimOMUghadGHD1ikMKfH2suJ20GJB/lIYdeO9y3HRBUktfdFtdEMkvigYJ
         BdBtcaVITIJ6/Z1uycSc7AX6KvZwqNIX/goK9YyFjeMunTQkvKePn92+UW3exqJZyBq0
         MPZf8LUfE4g8BveBKowjRmhLoFGMyf+uFI98Om4XFTq/I0JyTGBLVuoXW5I9dChgMV8j
         cnTUbU1TxjlDkqPEylVh6SqvHtQZpmYkmdltkvkdH/t+pWw6GbCPlFCYqH4RSGeSdmUI
         Hy3HS4z7gfSqRXZ9kdgy5wlZqJd5V9y8QWaG+y1KkTYsMPvc3zmhJT4GxaOE+o54kZGQ
         6oog==
X-Gm-Message-State: AGi0Puam+jXO+tq8Afdr3uwvT0LgPiBAvaLaUEV91OEayEOdVWAhVogU
        N4fqUtqheS0Cl8xqdVhANKIocgVegvWgHw==
X-Google-Smtp-Source: APiQypJTiv5vRVk+XOAdCoY4dHwB9QAaObmHQo5lRyn3uM6NNIOsFpTRGSw4kKM1MruEAbo/yLPk4A==
X-Received: by 2002:adf:8302:: with SMTP id 2mr24890994wrd.114.1589277699522;
        Tue, 12 May 2020 03:01:39 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id r11sm10738142wro.15.2020.05.12.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 03:01:39 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        jonas.gorski@gmail.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3] leds-bcm6328: support second hw blinking interval
Date:   Tue, 12 May 2020 12:01:36 +0200
Message-Id: <20200512100136.956872-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424133243.27303-1-noltari@gmail.com>
References: <20200424133243.27303-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for both configurable HW blinking intervals.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: add code documentation
 v2: remove LED from the other interval

 drivers/leds/leds-bcm6328.c | 83 ++++++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 42e1b7598c3a..050a77591f0b 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -24,12 +24,16 @@
 
 #define BCM6328_LED_MAX_COUNT		24
 #define BCM6328_LED_DEF_DELAY		500
+#define BCM6328_LED_INTERVAL_NUM	2
 #define BCM6328_LED_INTERVAL_MS		20
 
 #define BCM6328_LED_INTV_MASK		0x3f
-#define BCM6328_LED_FAST_INTV_SHIFT	6
-#define BCM6328_LED_FAST_INTV_MASK	(BCM6328_LED_INTV_MASK << \
-					 BCM6328_LED_FAST_INTV_SHIFT)
+#define BCM6328_LED_INTV1_SHIFT		0
+#define BCM6328_LED_INTV1_MASK		(BCM6328_LED_INTV_MASK << \
+					 BCM6328_LED_INTV1_SHIFT)
+#define BCM6328_LED_INTV2_SHIFT		6
+#define BCM6328_LED_INTV2_MASK		(BCM6328_LED_INTV_MASK << \
+					 BCM6328_LED_INTV2_SHIFT)
 #define BCM6328_SERIAL_LED_EN		BIT(12)
 #define BCM6328_SERIAL_LED_MUX		BIT(13)
 #define BCM6328_SERIAL_LED_CLK_NPOL	BIT(14)
@@ -45,8 +49,8 @@
 
 #define BCM6328_LED_MODE_MASK		3
 #define BCM6328_LED_MODE_ON		0
-#define BCM6328_LED_MODE_FAST		1
-#define BCM6328_LED_MODE_BLINK		2
+#define BCM6328_LED_MODE_INTV1		1
+#define BCM6328_LED_MODE_INTV2		2
 #define BCM6328_LED_MODE_OFF		3
 #define BCM6328_LED_SHIFT(X)		((X) << 1)
 
@@ -127,12 +131,18 @@ static void bcm6328_led_set(struct led_classdev *led_cdev,
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
 
@@ -176,20 +186,59 @@ static int bcm6328_blink_set(struct led_classdev *led_cdev,
 	}
 
 	spin_lock_irqsave(led->lock, flags);
-	if (*(led->blink_leds) == 0 ||
-	    *(led->blink_leds) == BIT(led->pin) ||
-	    *(led->blink_delay) == delay) {
+	/*
+	 * Check if any of the two configurable HW blinking intervals is
+	 * available:
+	 *   1. No LEDs assigned to the HW blinking interval.
+	 *   2. LEDs with the same delay assigned.
+	 */
+	if (led->blink_leds[0] == 0 ||
+	    led->blink_leds[0] == BIT(led->pin) ||
+	    led->blink_delay[0] == delay) {
+		unsigned long val;
+
+		/* Add LED to the first HW blinking interval cache */
+		led->blink_leds[0] |= BIT(led->pin);
+
+		/* Remove LED from the second HW blinking interval cache */
+		led->blink_leds[1] &= ~BIT(led->pin);
+
+		/* Cache the LED in the first HW blinking interval delay */
+		led->blink_delay[0] = delay;
+
+		/* Update the delay for the first HW blinking interval */
+		val = bcm6328_led_read(led->mem + BCM6328_REG_INIT);
+		val &= ~BCM6328_LED_INTV1_MASK;
+		val |= (delay << BCM6328_LED_INTV1_SHIFT);
+		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
+
+		/* Set the LED to first HW blinking interval */
+		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV1);
+
+		rc = 0;
+	} else if (led->blink_leds[1] == 0 ||
+		   led->blink_leds[1] == BIT(led->pin) ||
+		   led->blink_delay[1] == delay) {
 		unsigned long val;
 
-		*(led->blink_leds) |= BIT(led->pin);
-		*(led->blink_delay) = delay;
+		/* Remove LED from the first HW blinking interval */
+		led->blink_leds[0] &= ~BIT(led->pin);
+
+		/* Add LED to the second HW blinking interval */
+		led->blink_leds[1] |= BIT(led->pin);
 
+		/* Cache the LED in the first HW blinking interval delay */
+		led->blink_delay[1] = delay;
+
+		/* Update the delay for the second HW blinking interval */
 		val = bcm6328_led_read(led->mem + BCM6328_REG_INIT);
-		val &= ~BCM6328_LED_FAST_INTV_MASK;
-		val |= (delay << BCM6328_LED_FAST_INTV_SHIFT);
+		val &= ~BCM6328_LED_INTV2_MASK;
+		val |= (delay << BCM6328_LED_INTV2_SHIFT);
 		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
 
-		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK);
+		/* Set the LED to second HW blinking interval */
+		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV2);
+
 		rc = 0;
 	} else {
 		dev_dbg(led_cdev->dev,
@@ -358,11 +407,13 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 	if (!lock)
 		return -ENOMEM;
 
-	blink_leds = devm_kzalloc(dev, sizeof(*blink_leds), GFP_KERNEL);
+	blink_leds = devm_kcalloc(dev, BCM6328_LED_INTERVAL_NUM,
+				  sizeof(*blink_leds), GFP_KERNEL);
 	if (!blink_leds)
 		return -ENOMEM;
 
-	blink_delay = devm_kzalloc(dev, sizeof(*blink_delay), GFP_KERNEL);
+	blink_delay = devm_kcalloc(dev, BCM6328_LED_INTERVAL_NUM,
+				   sizeof(*blink_delay), GFP_KERNEL);
 	if (!blink_delay)
 		return -ENOMEM;
 
-- 
2.26.2

