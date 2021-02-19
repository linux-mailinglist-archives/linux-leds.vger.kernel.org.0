Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F4631F9F2
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 14:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBSNdw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 08:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhBSNdv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 08:33:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771FBC061756
        for <linux-leds@vger.kernel.org>; Fri, 19 Feb 2021 05:33:11 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lD5u9-0007P7-8B; Fri, 19 Feb 2021 14:33:09 +0100
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lD5u8-0001aN-Q6; Fri, 19 Feb 2021 14:33:08 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernel@pengutronix.de, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v2 2/2] leds: trigger/tty: Use led_set_brightness_sync() from workqueue
Date:   Fri, 19 Feb 2021 14:33:07 +0100
Message-Id: <20210219133307.4840-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219133307.4840-1-u.kleine-koenig@pengutronix.de>
References: <20210219133307.4840-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

led_set_brightness() involves scheduling a workqueue. As here the led's
brightness setting is done in context of the trigger's workqueue this is
unjustified overhead and it's more sensible to use
led_set_brightness_sync().

Reported-by: Pavel Machek <pavel@ucw.cz>
Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/trigger/ledtrig-tty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index af61281dc6a1..f62db7e520b5 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -122,12 +122,12 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 	if (icount.rx != trigger_data->rx ||
 	    icount.tx != trigger_data->tx) {
-		led_set_brightness(trigger_data->led_cdev, LED_ON);
+		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
 
 		trigger_data->rx = icount.rx;
 		trigger_data->tx = icount.tx;
 	} else {
-		led_set_brightness(trigger_data->led_cdev, LED_OFF);
+		led_set_brightness_sync(trigger_data->led_cdev, LED_OFF);
 	}
 
 out:
-- 
2.29.2

