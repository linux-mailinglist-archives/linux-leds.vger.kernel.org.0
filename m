Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6182A52C3DC
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 21:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242104AbiERTys (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 15:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiERTyr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 15:54:47 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0237A1838B
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 12:54:45 -0700 (PDT)
X-Virus-Scanned: Yes
From:   Sven Schwermer <sven@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1652903683;
        bh=xp7razw0uPvC8xFIGGr8I3jFQ4nfElAHDfBd4aGLeSI=;
        h=From:To:Cc:Subject:In-Reply-To:References;
        b=J1UGeRXLNDZH2wuO3mbVqoNSVytaS4KDWovQPZrUHenrR1pvnBe1VbzqDo5NmFXoF
         9dvNzSsn+toJv+shpH75zjVrJtBCBttutoXio7tz/ZUPiz7x3aWDVTIYY2Hx1yFId0
         azlrKEKM2PHY8iH3BKCudXCeSSAkzfHagZ7DUj+MjaQJsQTcIQqYPWAUAez0T//U7U
         df6piRcVfN/bB+LuVdgYR6HVnsoXQlVCkvrB7cQR5Tk+E6O4voPEMqtav3nVJVox+V
         xry3U/wKE1oUTkb3CJbuhORcaYYkCuTeuNSZ0C4Rp9SiMOdhefZkkfEr5Mt/GIB9Zz
         6qoGWbQmJo2Cw==
To:     linux-leds@vger.kernel.org
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        jacek.anaszewski@gmail.com, schuchmann@schleissheimer.de,
        pavel@ucw.cz
Subject: [PATCH v2] led: multicolor: Fix intensity setting while SW blinking
Date:   Wed, 18 May 2022 21:54:02 +0200
Message-Id: <20220518195402.256120-1-sven@svenschwermer.de>
In-Reply-To: <4f672091-07da-8815-a00f-659f5a478b0e@gmail.com>
References: <4f672091-07da-8815-a00f-659f5a478b0e@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

When writing to the multi_intensity file, don't unconditionally call
led_set_brightness. By only doing this if blinking is inactive we
prevent blinking from stopping if the blinking is in its off phase while
the file is written.

Instead, if blinking is active, the changed intensity values are applied
upon the next blink. This is consistent with changing the brightness on
monochrome LEDs with active blinking.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
---

Notes:
    V1->V2: Change title, add tags

 drivers/leds/led-class-multicolor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index e317408583df..5b1479b5d32c 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device *dev,
 	for (i = 0; i < mcled_cdev->num_colors; i++)
 		mcled_cdev->subled_info[i].intensity = intensity_value[i];
 
-	led_set_brightness(led_cdev, led_cdev->brightness);
+	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
+		led_set_brightness(led_cdev, led_cdev->brightness);
 	ret = size;
 err_out:
 	mutex_unlock(&led_cdev->led_access);

base-commit: 210e04ff768142b96452030c4c2627512b30ad95
-- 
2.36.1

