Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA677A317A
	for <lists+linux-leds@lfdr.de>; Sat, 16 Sep 2023 18:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjIPQpa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 16 Sep 2023 12:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjIPQp2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 16 Sep 2023 12:45:28 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB367131
        for <linux-leds@vger.kernel.org>; Sat, 16 Sep 2023 09:45:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhYQ3-0003kE-25; Sat, 16 Sep 2023 18:45:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhYQ2-006nmE-2z; Sat, 16 Sep 2023 18:45:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhYQ1-0028SY-Pi; Sat, 16 Sep 2023 18:45:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Xing Tong Wu <xingtong.wu@siemens.com>,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Henning Schild <henning.schild@siemens.com>,
        kernel@pengutronix.de, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] leds: simatic-ipc-leds-gpio: Convert to platform remove callback returning void
Date:   Sat, 16 Sep 2023 18:45:16 +0200
Message-Id: <20230916164516.1063380-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6592; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=cq13E7pRQ+3SBSLOb1AheCs/jzrUFq2IwQ+H4e+wpKw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlBdubQT5XWnfMNcbB3aeFoLjz+9OB6VqvxpW8M gh1G9JqRQOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQXbmwAKCRCPgPtYfRL+ TvBGB/4/AA18gzPO3S0DQaJr0Nnt8uDrauFsunxQV7Y8NUNPvsWkjCuyLY+3bONM8IQ0Q0AEchB O6CJxPDQQRwqbfw9+dMt6PPJTN5sXBPeRroQ4RWYNCmd+Nknh75AGR/btpgtWtQJ0eeu7Ci1jYj lP9fJZtn6zFPuanFq1RLU/LO7JubWabSjxActgxsaZ4QtjjAPUKvjw/GgWXefpFlUhVHswlPClA neYdCySEzPvnoILCJbye8YQTsL8fA4RRNpRHqSr/+mVw9tj1fF4FZztkot9ie6QakGlpGdKNG1v ivb+er6qev4vvGIWHwb9dFOV3hTepcBMThW0dxtBeYL78s03
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
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
zero unconditionally. After that the three remove callbacks that use
this function were trivial to convert to return void, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

compared to (implicit) v1 that can be found at
https://lore.kernel.org/linux-leds/20230724054743.310750-1-u.kleine-koenig@pengutronix.de
this copes for the addition of another simatic LED driver in commit 
7e6d86e99a5d ("leds: simatic-ipc-leds-gpio: Add Elkhart Lake version").

Henning mentioned another patch "platform/x86: add CMOS battery
monitoring for simatic IPCs" that would conflict with my v1 patch. I
didn't spot a conflict there, though.

Best regards
Uwe

 drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c  | 8 ++++----
 drivers/leds/simple/simatic-ipc-leds-gpio-core.c        | 4 +---
 drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c | 7 +++----
 drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c      | 8 ++++----
 drivers/leds/simple/simatic-ipc-leds-gpio.h             | 6 +++---
 5 files changed, 15 insertions(+), 18 deletions(-)

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
index c552ea73ed9d..667ba1bc3a30 100644
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
 
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c b/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
index 6ba21dbb3ba0..4a53d4dbf52f 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
@@ -36,15 +36,14 @@ static int simatic_ipc_leds_gpio_elkhartlake_probe(struct platform_device *pdev)
 					   NULL);
 }
 
-static int simatic_ipc_leds_gpio_elkhartlake_remove(struct platform_device *pdev)
+static void simatic_ipc_leds_gpio_elkhartlake_remove(struct platform_device *pdev)
 {
-	return simatic_ipc_leds_gpio_remove(pdev, &simatic_ipc_led_gpio_table,
-					    NULL);
+	simatic_ipc_leds_gpio_remove(pdev, &simatic_ipc_led_gpio_table, NULL);
 }
 
 static struct platform_driver simatic_ipc_led_gpio_elkhartlake_driver = {
 	.probe = simatic_ipc_leds_gpio_elkhartlake_probe,
-	.remove = simatic_ipc_leds_gpio_elkhartlake_remove,
+	.remove_new = simatic_ipc_leds_gpio_elkhartlake_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
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
index 3d4877aa4e0c..6b2519809cee 100644
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

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.40.1

