Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7F075EAFF
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jul 2023 07:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjGXFsA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jul 2023 01:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjGXFr6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jul 2023 01:47:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C3012D
        for <linux-leds@vger.kernel.org>; Sun, 23 Jul 2023 22:47:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qNoQ8-00037U-TN; Mon, 24 Jul 2023 07:47:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qNoQ7-001gXB-GB; Mon, 24 Jul 2023 07:47:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qNoQ6-007KOn-Q3; Mon, 24 Jul 2023 07:47:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Henning Schild <henning.schild@siemens.com>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: simatic-ipc-leds-gpio: Convert to platform remove callback returning void
Date:   Mon, 24 Jul 2023 07:47:43 +0200
Message-Id: <20230724054743.310750-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4943; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PBw5/7N2kEtwdf9DnAHVAL/00hd6rua1sWoqBPn4kws=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkvhB+pk5EpF9T/J3jz7IMS40zO0GcD0GS46IWY y1lYthjvXKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZL4QfgAKCRCPgPtYfRL+ TngfB/9DVwjSNZ087NMutbJkFXfZ8PPVAZx9Jatzx2w/4rAlHXOm9IwHteMDvVaPT5WoFC5WOht C+9CsGBOqvvaY/iL7UMyhCagLQCDpANpUZ8W+eMNpifbwHqdmNPtRGWBp6SBvoGju9PgOKq9flC 1gsXZHwOZpTS1q6+3/g3pGcViY/fs7OwxhxnxrmZZvEYTgh7metJqNC4gAfHruYePKg38VdISVF ru32Yd50Svrshdi3bZkFk3JPH1IvJl9b1SPfKvIVx1uIFr4qpMhD3SUhqGo6UvzKawYNMGaGEVo xAGzH3XRQUi5NdJ+FdsSp+nFaxNcI5Hd9AFwcp/vEBir2U2H
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Make simatic_ipc_leds_gpio_remove() return void instead of returning
zero unconditionally. After that the two remove callbacks were trivial
to convert to return void, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c | 8 ++++----
 drivers/leds/simple/simatic-ipc-leds-gpio-core.c       | 4 +---
 drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c     | 8 ++++----
 drivers/leds/simple/simatic-ipc-leds-gpio.h            | 6 +++---
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c b/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
index e1c712729dcf..4183ee71fcce 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
@@ -45,15 +45,15 @@ static int simatic_ipc_leds_gpio_apollolake_probe(struct platform_device *pdev)
 					   &simatic_ipc_led_gpio_table_extra);
 }
 
-static int simatic_ipc_leds_gpio_apollolake_remove(struct platform_device *pdev)
+static void simatic_ipc_leds_gpio_apollolake_remove(struct platform_device *pdev)
 {
-	return simatic_ipc_leds_gpio_remove(pdev, &simatic_ipc_led_gpio_table,
-					    &simatic_ipc_led_gpio_table_extra);
+	simatic_ipc_leds_gpio_remove(pdev, &simatic_ipc_led_gpio_table,
+				     &simatic_ipc_led_gpio_table_extra);
 }
 
 static struct platform_driver simatic_ipc_led_gpio_apollolake_driver = {
 	.probe = simatic_ipc_leds_gpio_apollolake_probe,
-	.remove = simatic_ipc_leds_gpio_apollolake_remove,
+	.remove_new = simatic_ipc_leds_gpio_apollolake_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-core.c b/drivers/leds/simple/simatic-ipc-leds-gpio-core.c
index 2a21b663df87..32a753e5c7b6 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-core.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-core.c
@@ -33,15 +33,13 @@ static const struct gpio_led_platform_data simatic_ipc_gpio_leds_pdata = {
 	.leds		= simatic_ipc_gpio_leds,
 };
 
-int simatic_ipc_leds_gpio_remove(struct platform_device *pdev,
+void simatic_ipc_leds_gpio_remove(struct platform_device *pdev,
 				 struct gpiod_lookup_table *table,
 				 struct gpiod_lookup_table *table_extra)
 {
 	gpiod_remove_lookup_table(table);
 	gpiod_remove_lookup_table(table_extra);
 	platform_device_unregister(simatic_leds_pdev);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(simatic_ipc_leds_gpio_remove);
 
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c b/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
index 583a6b6c7c22..c7c3a1f986e6 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
@@ -45,15 +45,15 @@ static int simatic_ipc_leds_gpio_f7188x_probe(struct platform_device *pdev)
 					   &simatic_ipc_led_gpio_table_extra);
 }
 
-static int simatic_ipc_leds_gpio_f7188x_remove(struct platform_device *pdev)
+static void simatic_ipc_leds_gpio_f7188x_remove(struct platform_device *pdev)
 {
-	return simatic_ipc_leds_gpio_remove(pdev, &simatic_ipc_led_gpio_table,
-					    &simatic_ipc_led_gpio_table_extra);
+	simatic_ipc_leds_gpio_remove(pdev, &simatic_ipc_led_gpio_table,
+				     &simatic_ipc_led_gpio_table_extra);
 }
 
 static struct platform_driver simatic_ipc_led_gpio_driver = {
 	.probe = simatic_ipc_leds_gpio_f7188x_probe,
-	.remove = simatic_ipc_leds_gpio_f7188x_remove,
+	.remove_new = simatic_ipc_leds_gpio_f7188x_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio.h b/drivers/leds/simple/simatic-ipc-leds-gpio.h
index bf258c32f83d..af7384c37e67 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio.h
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio.h
@@ -15,8 +15,8 @@ int simatic_ipc_leds_gpio_probe(struct platform_device *pdev,
 				struct gpiod_lookup_table *table,
 				struct gpiod_lookup_table *table_extra);
 
-int simatic_ipc_leds_gpio_remove(struct platform_device *pdev,
-				 struct gpiod_lookup_table *table,
-				 struct gpiod_lookup_table *table_extra);
+void simatic_ipc_leds_gpio_remove(struct platform_device *pdev,
+				  struct gpiod_lookup_table *table,
+				  struct gpiod_lookup_table *table_extra);
 
 #endif /* _SIMATIC_IPC_LEDS_GPIO_H */

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.39.2

