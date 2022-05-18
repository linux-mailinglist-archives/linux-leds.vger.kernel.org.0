Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F64D52B4FE
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 10:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbiERIW2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 04:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbiERIWZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 04:22:25 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8DB1059CA
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 01:22:24 -0700 (PDT)
X-Virus-Scanned: Yes
From:   Sven Schwermer <sven@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1652862141;
        bh=dmM9S7syXZ/NlSayuvMqcSqnpEC8jIJAY94sp9uFY9s=;
        h=From:To:Cc:Subject:In-Reply-To:References;
        b=OjxG+t+VWSkNkj0fAF5bm+iz5D05IUVYTAiOgLHV8w5LfyDKkVRgNI/nIN0KwQ0IS
         z5OIQiOA4Zaa2t8HVwisIdY9g2RnCkIg5+SPRlo9VrQ349OujLeh1ZprzGzL+pkT8g
         NTgOX2USTVNs76IGREdMeMISPA1jlShXGJTBKYC7+vn4W30uI0WhFLbU4pspw0CrV1
         q1BNTWjP0JuA2QSBExcrlTC18Vmwpzxc3yQ8aJLd+CKcTViFljKhHnl63bfPNarGYq
         ZVHsrUbjdGj2YltTxwBZzHGVfjUQZKnMipfS9rJwHi0l02EbC3m7o3P1SiSac8j5w9
         N3UGCLrwMvURg==
To:     linux-leds@vger.kernel.org
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        jacek.anaszewski@gmail.com, schuchmann@schleissheimer.de,
        pavel@ucw.cz
Subject: [PATCH] led: multicolor: Don't set brightness when blinking
Date:   Wed, 18 May 2022 10:22:16 +0200
Message-Id: <20220518082216.160413-1-sven@svenschwermer.de>
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
Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
---
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

