Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBFBC76C8F9
	for <lists+linux-leds@lfdr.de>; Wed,  2 Aug 2023 11:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233780AbjHBJII (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Aug 2023 05:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbjHBJIA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2023 05:08:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E4C2721
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 02:07:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E075E618A6
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 09:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28642C433C7;
        Wed,  2 Aug 2023 09:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690967278;
        bh=xXV/ZatAgF57LmCFa30lg7X1kaWBIlAv/kfKSZBZwQo=;
        h=From:To:Cc:Subject:Date:From;
        b=OhUrZAfsRzFuLHD5LvaXchSwX9yV8H3cDoNgHn8z7YoMFi4uYWGC/kRmr4Y/Pwjr2
         RxJ+lEPbF0g+sLxC7vv82T/Fgd4hmityF6WpaYzdvWgt5jSD7YkFFCD8pIgDn8/FL6
         f5yPt62glmoeMMUIY+ZeRVcnuKwrzl3QP44dpQEUSLHmJPTlyJm/4Nj+DBi8dCPB3D
         yNzylw1uizpjN6hQwlzOZrXmtbFgUWcBxc8dUkMnvBVsDy9fDf1S6Hr49az8yuhpgE
         aqlKJXVvWtZAHpgAlxiigYM7NTxnHFEDBbo8+deHyOZ4/vPzeoSnFFPtjPtMAVpgbz
         BLBj9GZXxUKJA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2] leds: trigger: tty: Do not use LED_ON/OFF constants, use led_blink_set_oneshot instead
Date:   Wed,  2 Aug 2023 11:07:53 +0200
Message-ID: <20230802090753.13611-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The tty LED trigger uses the obsolete LED_ON & LED_OFF constants when
setting LED brightness. This is bad because the LED_ON constant is equal
to 1, and so when activating the tty LED trigger on a LED class device
with max_brightness greater than 1, the LED is dimmer than it can be
(when max_brightness is 255, the LED is very dimm indeed; some devices
translate 1/255 to 0, so the LED is OFF all the time).

Instead of directly setting brightness to a specific value, use the
led_blink_set_oneshot() function from LED core to configure the blink.
This function takes the current configured brightness as blink
brightness if not zero, and max brightness otherwise.

This also changes the behavior of the TTY LED trigger. Previously if
rx/tx stats kept changing, the LED was ON all the time they kept
changing. With this patch the LED will blink on TTY activity.

Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/trigger/ledtrig-tty.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index f62db7e520b5..8ae0d2d284af 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -7,6 +7,8 @@
 #include <linux/tty.h>
 #include <uapi/linux/serial.h>
 
+#define LEDTRIG_TTY_INTERVAL	50
+
 struct ledtrig_tty_data {
 	struct led_classdev *led_cdev;
 	struct delayed_work dwork;
@@ -122,17 +124,19 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 	if (icount.rx != trigger_data->rx ||
 	    icount.tx != trigger_data->tx) {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
+		unsigned long interval = LEDTRIG_TTY_INTERVAL;
+
+		led_blink_set_oneshot(trigger_data->led_cdev, &interval,
+				      &interval, 0);
 
 		trigger_data->rx = icount.rx;
 		trigger_data->tx = icount.tx;
-	} else {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_OFF);
 	}
 
 out:
 	mutex_unlock(&trigger_data->mutex);
-	schedule_delayed_work(&trigger_data->dwork, msecs_to_jiffies(100));
+	schedule_delayed_work(&trigger_data->dwork,
+			      msecs_to_jiffies(LEDTRIG_TTY_INTERVAL * 2));
 }
 
 static struct attribute *ledtrig_tty_attrs[] = {
-- 
2.41.0

