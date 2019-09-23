Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F58BB227
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 12:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439447AbfIWKVJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 06:21:09 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56408 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439440AbfIWKVI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 06:21:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL4TS016445;
        Mon, 23 Sep 2019 05:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569234065;
        bh=V+NVaZwf6IOB0aWjhhvOzidtgMh5Wg4WUC9ArYepVn8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=v8rK/RM/t7XhbmD5NDzQA/BZIrR8HD/jT00L9g5XcldTXkrpMzKpXV4Q8fsaivdDF
         X2i0tj+2XDkgx6fs4LZ+9H0smLRy8Ut69HSvc4f1sEkNzxmv/u1qhTEKjFEgPM7H8a
         /KEtbetxNLaPJ9sasREwBrSeOa08kgqz4Fjd8Lng=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NAL4WK043925
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 05:21:04 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 05:21:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 05:21:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL3Pg014841;
        Mon, 23 Sep 2019 05:21:04 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v5 1/3] led: make led_set_brightness_sync() use led_set_brightness_nosleep()
Date:   Mon, 23 Sep 2019 12:20:57 +0200
Message-ID: <20190923102059.17818-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923102059.17818-1-jjhiblot@ti.com>
References: <20190923102059.17818-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Making led_set_brightness_sync() use led_set_brightness_nosleep() has 2
advantages:
- works for LED controllers that do not provide brightness_set_blocking()
- When the blocking callback is used, it uses the workqueue to update the
  LED state, removing the need for mutual exclusion between
  led_set_brightness_sync() and set_brightness_delayed().

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..d318f9b0382d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -297,12 +297,13 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
 
-	led_cdev->brightness = min(value, led_cdev->max_brightness);
-
-	if (led_cdev->flags & LED_SUSPENDED)
-		return 0;
-
-	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	led_set_brightness_nosleep(led_cdev, value);
+	/* 
+	 * led_set_brightness_nosleep() may have deferred some work.
+	 * Wait until it is complete.
+	 */
+	flush_work(&led_cdev->set_brightness_work);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
 
-- 
2.17.1

