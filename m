Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C36F476B75B
	for <lists+linux-leds@lfdr.de>; Tue,  1 Aug 2023 16:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbjHAO0v (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Aug 2023 10:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234658AbjHAO0t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Aug 2023 10:26:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3257171B
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2023 07:26:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27629615D3
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2023 14:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3986CC433C7;
        Tue,  1 Aug 2023 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690900006;
        bh=sWosV46v5sUAq+Z2XYoD5114hnf4zfLSnOtSPlpxve0=;
        h=From:To:Cc:Subject:Date:From;
        b=IIHFIJQBX4BZ0hL4K3IXnh0r0XuLhgkPo/6hTxBSbUETos+QV5r5d7h8cSsk3G8h4
         nDDYD664B6I+/4Ke9CzAJvoALV50ElQFb43L2N7JQWZMcoCDqafu7L/7xaahOp5gbm
         m03cuiO5zX6vhNlA518OxjHDMhG3FOlk8OQ3ylXxjdr6OTOSAC9owoKpce2ox417Uw
         i2DchJLqkNqUo/lon7kcEGYjAZDq+Xe+iob638ke7wh0IhVnsu/vnWSkEVwWJXbRHu
         Dd0KjTO5MowH0q+us5mWzwcor2ZPgCnKUDEDHdU8NDxJ77woOLcxnc1pYlGIrAN3yu
         jcMMT6n2lNDEw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] leds: trigger: tty: Fix tty trigger when LED's max_brightness is greater than 1
Date:   Tue,  1 Aug 2023 16:26:42 +0200
Message-ID: <20230801142642.21335-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Use a mechanism similar to the netdev trigger, wherein on activation
time, the current LED brightness is taken as blinking brightness, and if
it is zero, the max_brightness is taken instead.

Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
PS: We need to get rid of the LED_ON, LED_OFF, LED_FULL and LED_HALF or
    we're bound to repeat this kind of issues.
---
 drivers/leds/trigger/ledtrig-tty.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index f62db7e520b5..2ff00a0e7ba6 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -80,6 +80,7 @@ static void ledtrig_tty_work(struct work_struct *work)
 {
 	struct ledtrig_tty_data *trigger_data =
 		container_of(work, struct ledtrig_tty_data, dwork.work);
+	struct led_classdev *led_cdev = trigger_data->led_cdev;
 	struct serial_icounter_struct icount;
 	int ret;
 
@@ -111,6 +112,9 @@ static void ledtrig_tty_work(struct work_struct *work)
 			goto out;
 
 		trigger_data->tty = tty;
+		led_cdev->blink_brightness = led_cdev->brightness;
+		if (!led_cdev->blink_brightness)
+			led_cdev->blink_brightness = led_cdev->max_brightness;
 	}
 
 	ret = tty_get_icount(trigger_data->tty, &icount);
@@ -122,12 +126,12 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 	if (icount.rx != trigger_data->rx ||
 	    icount.tx != trigger_data->tx) {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
+		led_set_brightness_sync(led_cdev, led_cdev->blink_brightness);
 
 		trigger_data->rx = icount.rx;
 		trigger_data->tx = icount.tx;
 	} else {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_OFF);
+		led_set_brightness_sync(led_cdev, 0);
 	}
 
 out:
-- 
2.41.0

