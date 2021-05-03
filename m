Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0BF3712F3
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 11:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhECJ0i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 05:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbhECJ0i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 May 2021 05:26:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90263C06174A
        for <linux-leds@vger.kernel.org>; Mon,  3 May 2021 02:25:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jbe@pengutronix.de>)
        id 1ldUpj-0007qu-Mh; Mon, 03 May 2021 11:25:43 +0200
Received: from [2a0a:edc0:0:900:2e4d:54ff:fe67:bfa5] (helo=ginster)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <jbe@pengutronix.de>)
        id 1ldUpi-0007dH-9i; Mon, 03 May 2021 11:25:42 +0200
Received: from jbe by ginster with local (Exim 4.92)
        (envelope-from <jbe@pengutronix.de>)
        id 1ldUpi-0003mY-8r; Mon, 03 May 2021 11:25:42 +0200
From:   Juergen Borleis <jbe@pengutronix.de>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: [PATCH] leds: trigger/tty: Use led_set_brightness() to support all use cases
Date:   Mon,  3 May 2021 11:25:42 +0200
Message-Id: <20210503092542.14497-1-jbe@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jbe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Using led_set_brightness_sync() only works for LEDs which are connected
via some kind of external bus like I²C or SPI. But it doesn't work for
the simple use case of directly connected LEDs via GPIOs.
Because this function only honors the led_classdev::brightness_set_blocking
callback. But the LED-GPIO driver registers the
led_classdev::brightness_set member if the GPIO can be modified directly
and thus, TTY triggers fail silently with -ENOTSUPP.

With the previously used led_set_brightness() it works for both use cases.
This function first checks for the simple case where the GPIO can be changed
without additional overhead, and if it fails, does the modification via a
workqueue.

Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
---
 drivers/leds/trigger/ledtrig-tty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index f62db7e..af61281 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -122,12 +122,12 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 	if (icount.rx != trigger_data->rx ||
 	    icount.tx != trigger_data->tx) {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
+		led_set_brightness(trigger_data->led_cdev, LED_ON);
 
 		trigger_data->rx = icount.rx;
 		trigger_data->tx = icount.tx;
 	} else {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_OFF);
+		led_set_brightness(trigger_data->led_cdev, LED_OFF);
 	}
 
 out:
-- 
2.20.1

