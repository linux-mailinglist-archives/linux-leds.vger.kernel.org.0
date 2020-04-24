Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA141B7706
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2020 15:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgDXNcy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Apr 2020 09:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726717AbgDXNcx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 24 Apr 2020 09:32:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64024C09B045
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2020 06:32:53 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id d17so10803881wrg.11
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2020 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0gIO13I1Ae57+qhd2eTd8vOWx23lidFY8DLuBzS0PBY=;
        b=HXC9cCTXEpM4ZHTwr1tJ6sKgKyIeRdeD1C2rrymX6k75mxHKwWh5k5elYuqjQ8XQP8
         Nvrm7LNE5FsR5PZkHiwhE+4DxKR5fuGplpKyJSn+qVUkmFeD8NR2fDif8+BaRL7QnjCt
         0iQ2doWZe2xG3C6GSo4ib2gfB9K0Q5urHTIX/UUmCLc7+im7aJmjpees3u6sw1AeB7EI
         HoUx5sGUcQYT1mR4DTpDlNaBuELhWs2J9SRSYppJ8LMWw08CpDomgwpsNlj5BhNcPukj
         J8sCagx85vr1rt6+EdPhqB4RvCkhA0S6gyLVqQu7LIIRKRKc7639zK+QVWlHpHPnTrFT
         7cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0gIO13I1Ae57+qhd2eTd8vOWx23lidFY8DLuBzS0PBY=;
        b=JovOySsTdYghZ/NuY8TIAG8wpprrD691lvMHlW9eTSrsjUVKo1y+X5yHvc8PIjqwPN
         l4XLOuipe1WBck8TWICsZpDZgDjngDL37jImjX5ysMLCCxtVgBrtuPFxlS0mMQv2W4LE
         4Z6nBIowZddv0oV5dNaX07rN8ya2uQC2FIDp1z4Legh5JKUnYFcmUmbq237bgtzGietd
         Nfj0nU3sCGpQu2MfIAOBiVTDYod3Fmtu6dtjxNQSR+8bnlAJCcqYMQ2Krm4jUDDb2Leq
         M37qMkcu4MpupiI24ljI3GWnk/VnAgY9YUrXM0MFG0ygbB4J5ixo4OTkmLKhfi3pw5As
         QBsw==
X-Gm-Message-State: AGi0Pual05ayJhUIOpAc3YB6unKNaKoqSZl17Wj2dcRjLR+FxxaASd2O
        0PmTWNAjx5u6E6mYnV0xGZl+k2M9
X-Google-Smtp-Source: APiQypIV0nTedaB5kdnb0mgKEVogdNyGPlyoNOq7X2FfUVUU9cxGBC+v9D2/SEZrhBzoo5iRgZ5rww==
X-Received: by 2002:a05:6000:8b:: with SMTP id m11mr11288855wrx.168.1587735171883;
        Fri, 24 Apr 2020 06:32:51 -0700 (PDT)
Received: from skynet.lan (33.red-2-137-27.dynamicip.rima-tde.net. [2.137.27.33])
        by smtp.gmail.com with ESMTPSA id i13sm8310263wro.50.2020.04.24.06.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 06:32:51 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        jonas.gorski@gmail.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2] leds-bcm6328: support second hw blinking interval
Date:   Fri, 24 Apr 2020 15:32:43 +0200
Message-Id: <20200424133243.27303-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424124621.23005-1-noltari@gmail.com>
References: <20200424124621.23005-1-noltari@gmail.com>
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
 v2: remove LED from the other interval

 drivers/leds/leds-bcm6328.c | 56 ++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 42e1b7598c3a..a5a57a8d2a1c 100644
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
 
@@ -127,7 +131,8 @@ static void bcm6328_led_set(struct led_classdev *led_cdev,
 	unsigned long flags;
 
 	spin_lock_irqsave(led->lock, flags);
-	*(led->blink_leds) &= ~BIT(led->pin);
+	led->blink_leds[0] &= ~BIT(led->pin);
+	led->blink_leds[1] &= ~BIT(led->pin);
 	if ((led->active_low && value == LED_OFF) ||
 	    (!led->active_low && value != LED_OFF))
 		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
@@ -176,20 +181,37 @@ static int bcm6328_blink_set(struct led_classdev *led_cdev,
 	}
 
 	spin_lock_irqsave(led->lock, flags);
-	if (*(led->blink_leds) == 0 ||
-	    *(led->blink_leds) == BIT(led->pin) ||
-	    *(led->blink_delay) == delay) {
+	if (led->blink_leds[0] == 0 ||
+	    led->blink_leds[0] == BIT(led->pin) ||
+	    led->blink_delay[0] == delay) {
 		unsigned long val;
 
-		*(led->blink_leds) |= BIT(led->pin);
-		*(led->blink_delay) = delay;
+		led->blink_leds[0] |= BIT(led->pin);
+		led->blink_leds[1] &= ~BIT(led->pin);
+		led->blink_delay[0] = delay;
 
 		val = bcm6328_led_read(led->mem + BCM6328_REG_INIT);
-		val &= ~BCM6328_LED_FAST_INTV_MASK;
-		val |= (delay << BCM6328_LED_FAST_INTV_SHIFT);
+		val &= ~BCM6328_LED_INTV1_MASK;
+		val |= (delay << BCM6328_LED_INTV1_SHIFT);
 		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
 
-		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK);
+		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV1);
+		rc = 0;
+	} else if (led->blink_leds[1] == 0 ||
+		   led->blink_leds[1] == BIT(led->pin) ||
+		   led->blink_delay[1] == delay) {
+		unsigned long val;
+
+		led->blink_leds[0] &= ~BIT(led->pin);
+		led->blink_leds[1] |= BIT(led->pin);
+		led->blink_delay[1] = delay;
+
+		val = bcm6328_led_read(led->mem + BCM6328_REG_INIT);
+		val &= ~BCM6328_LED_INTV2_MASK;
+		val |= (delay << BCM6328_LED_INTV2_SHIFT);
+		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
+
+		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV2);
 		rc = 0;
 	} else {
 		dev_dbg(led_cdev->dev,
@@ -358,11 +380,13 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
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
2.20.1

