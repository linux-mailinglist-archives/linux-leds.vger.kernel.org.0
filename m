Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E611B75B9
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2020 14:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgDXMq2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Apr 2020 08:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbgDXMq1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Apr 2020 08:46:27 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A82C09B045
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2020 05:46:27 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x4so10308138wmj.1
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2020 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sfKD00sWwaszfXMsixQ++4fLy2ttRX+/pTl96BVqYmw=;
        b=AULPPWr1LWU6+fzwFeBfxXYd/ipVz8HGd1XGP093lERE2RshSEIvFhw98C2QL5scfV
         d32MZ+zUc7XPxdAuJojVWFA4ACphSszc33YiUoag5wiuhA+Et+npurUPogYgaV6AixHn
         3n+vCF4jiVVGlqy8NvpHW/xla58XznWPEb7tqeFMTsjCQecWR8erZNeA00g82rJEzST0
         s6d9vl8rEiFOXW3iYesXe9crqDUazMvVBCB7akP9iEPM3kkHOG26JmxWFxZurXj4W8i5
         GPr2vzcPUkylxW0agMxTRST+mjKDtQSH5/0sN6YF68zpYkYNr8e9BPp+eMsRAgmty3LE
         VbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sfKD00sWwaszfXMsixQ++4fLy2ttRX+/pTl96BVqYmw=;
        b=l3jvLbdRwksKqjmbSkkFMJSktUbCiMAlgXtbza6RgrO/TjvYo/gR+os36fezu1un7K
         DJ/cuSAQ7r5PWflZnj28CS5fgSrGZgC7/GL3wNZlM52uEhpDTdY7b0U/PyCPy6PCYWv7
         POo+Nf+0m5hEEs+nBKyvnXGO9gjuzbM7x9pN5ylXfio5nIBjStTwgzt1CwCfDjwbwtxV
         2pSJXcH81EZtTC9lZ4DrIlOQa79FSeGhz9TYamL3ayUbibuKXI5leCqVKn6CDjpUer3x
         VxvrO4XF1lMREQeEHzW+OjwaRx2luXfBh1JPb/hgOVzvXbZxv/6ngQugn5o+i/kET0QU
         HuKA==
X-Gm-Message-State: AGi0PuaDElRJoR6nRMV9Oo/nYdsXPjlFsJ92Hylq3Ddqf+0YlNGM9pfq
        8v5ZrIi6zCQLKNxfUlw7SXyxr9YJ
X-Google-Smtp-Source: APiQypJu2aqA+x0SwT85ZmlHGRvVaQUzEx/u+a9YuiRh3tv6mGpgYzAsPtWsluujVlilFSCZdQRDXA==
X-Received: by 2002:a1c:4409:: with SMTP id r9mr10284872wma.165.1587732385916;
        Fri, 24 Apr 2020 05:46:25 -0700 (PDT)
Received: from skynet.lan (33.red-2-137-27.dynamicip.rima-tde.net. [2.137.27.33])
        by smtp.gmail.com with ESMTPSA id l15sm2613389wmi.48.2020.04.24.05.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 05:46:25 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        jonas.gorski@gmail.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] leds-bcm6328: support second hw blinking interval
Date:   Fri, 24 Apr 2020 14:46:21 +0200
Message-Id: <20200424124621.23005-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
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
 drivers/leds/leds-bcm6328.c | 54 ++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 42e1b7598c3a..beb1aaff68f6 100644
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
@@ -176,20 +181,35 @@ static int bcm6328_blink_set(struct led_classdev *led_cdev,
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
@@ -358,11 +378,13 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
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

