Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E22916E28B1
	for <lists+linux-leds@lfdr.de>; Fri, 14 Apr 2023 18:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjDNQtP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Apr 2023 12:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjDNQtM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Apr 2023 12:49:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41E6977E
        for <linux-leds@vger.kernel.org>; Fri, 14 Apr 2023 09:49:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pnMbe-0000Jj-Rs; Fri, 14 Apr 2023 18:49:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pnMbd-00BExb-RY; Fri, 14 Apr 2023 18:49:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pnMbd-00DDDm-4v; Fri, 14 Apr 2023 18:49:01 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to set brightness
Date:   Fri, 14 Apr 2023 18:48:53 +0200
Message-Id: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2308; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JZ1DuLyrk3oCdkMU4rm+5T+ID/kJcZnNejsYm9dq8lg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkOYP05xMjtvG2REsQdixeg0ibABt6v8LMh/2tW /d56p1+CrKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZDmD9AAKCRCPgPtYfRL+ TsGRB/4yYPlvqSEWeWjx8Vb+TTMy1CQvBBj1LwStg7ZlNgwGgs2LHheZY8oKAb8tK20t9aSH95R X/V35jhupYHxrKNS7nPK3OkpFESft1MQjLyXQH+B0o7m+9z3+wY21zVxy10bkO2+aAx3TqLyrrE Lj253qPV50wjtnNfgz8gk/46AWEfh3KxxN99NReuYDUtz5XlVOB/KKVNU6XFGKqwUlpWDvmR4PM mmB7BTjdPeFPKb8oLR4X3qRDzez+zoC0pcvw133ngNDfJmB9GSNtPn9Jtz1e4llWN3zcSDN+F7f CdXiBcrjjFJq2YfEpuKN68keDGEEHh92df95OZwubSOU630V
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

After commit ba8a86e4dadb ("leds: trigger/tty: Use
led_set_brightness_sync() from workqueue") this is the second try to
pick the right function to set the LED brightness from a trigger.

led_set_brightness_sync() has the problem that it doesn't work for LEDs
without a .brightness_set_blocking() callback. This is (among others)
the case for LEDs connected to non-sleeping GPIOs.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

after a few (non-public and public) reports that the tty trigger doesn't
work and Jacek pointed out in
https://lore.kernel.org/all/ad4a1069-72c6-a431-336f-ed78a57a1ba0@gmail.com/#t
that led_set_brightness_nosleep() is the right function, here comes a
patch to actually implement that.

Does this justify a Fixes line? In that case that would be:

	Fixes: ba8a86e4dadb ("leds: trigger/tty: Use led_set_brightness_sync() from workqueue")

(As ba8a86e4dadb declares to be a fix for fd4a641ac88f ("leds: trigger:
implement a tty trigger") I think a further reference to fd4a641ac88f
isn't necesary.)

Best regards
Uwe

 drivers/leds/trigger/ledtrig-tty.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index f62db7e520b5..c8bbdeac93b9 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/delay.h>
-#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <uapi/linux/serial.h>
+#include "../leds.h"
 
 struct ledtrig_tty_data {
 	struct led_classdev *led_cdev;
@@ -122,12 +122,12 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 	if (icount.rx != trigger_data->rx ||
 	    icount.tx != trigger_data->tx) {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
+		led_set_brightness_nosleep(trigger_data->led_cdev, LED_ON);
 
 		trigger_data->rx = icount.rx;
 		trigger_data->tx = icount.tx;
 	} else {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_OFF);
+		led_set_brightness_nosleep(trigger_data->led_cdev, LED_OFF);
 	}
 
 out:

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

