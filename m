Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45F1A707068
	for <lists+linux-leds@lfdr.de>; Wed, 17 May 2023 20:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjEQSGK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 May 2023 14:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjEQSGK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 May 2023 14:06:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DCD94
        for <linux-leds@vger.kernel.org>; Wed, 17 May 2023 11:06:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzLXH-0005wb-TY; Wed, 17 May 2023 20:06:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzLXG-000twl-Rc; Wed, 17 May 2023 20:06:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzLXG-005Qdn-5E; Wed, 17 May 2023 20:06:02 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: Switch i2c drivers back to use .probe()
Date:   Wed, 17 May 2023 20:05:59 +0200
Message-Id: <20230517180559.166329-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=15787; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LNawKRiT0I9Nb4kMIL0iP8DuaDT/82SOUD8WBj+GKlA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZReD3JyrDSdujUzSvTmWcaIv8Nb/7iLth7NFY XbalY6NvvOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGUXgwAKCRCPgPtYfRL+ Ts62B/9ARUeQ5RJEAHQ6nGTtV4dnoZa8twd1vUkHpPBx45smMwH0wPuq/kTH7Is0qjb6h2MTdjf eryrRnp4t47G7C1ddtqql/IqwpSqTv1PPTI4WMH01DVB82cMsOSlwnlE4AEsrQbNnBKeCPUYBbr +YHfZJKUSzGMy3LpaofTs+AWdmlFEqTQ/5ymfrRPsdILkSEJ1/pm5OFTL4ngXLZEPbuavNycc0l Z3CoHV9NAjteeCxnamjgJFxyqJzHtfLqUS+RWJkhyrEiK3qVLVz0Kv9X5cvcTcvNpkRX/zFXLIR a75IhTieh29jvvUfVBGMSi36Wv3dHCHspljtnWQ/9iOVm9lZ
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

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch was generated using coccinelle, but I aligned the result to
the per-file indention. Other than that it's just s/probe_new/probe/.

I used v6.4-rc1 as base for this patch, but it also fits on top of
today's next master. If there are some conflicts when you apply it, feel
free to just drop all conflicting hunks, I'll care about the fallout
later.

I chose to do this in a single patch for all drivers below
drivers/leds. If you want me to split it, just tell me.

Also note I didn't Cc: all the individual maintainers to not exceed the
allowed length of To: and Cc:. If this patch will be split I can extend
the audience accordingly.

Best regards
Uwe

 drivers/leds/flash/leds-as3645a.c | 2 +-
 drivers/leds/flash/leds-lm3601x.c | 2 +-
 drivers/leds/flash/leds-rt4505.c  | 2 +-
 drivers/leds/leds-an30259a.c      | 2 +-
 drivers/leds/leds-aw2013.c        | 2 +-
 drivers/leds/leds-bd2606mvv.c     | 2 +-
 drivers/leds/leds-bd2802.c        | 2 +-
 drivers/leds/leds-blinkm.c        | 2 +-
 drivers/leds/leds-is31fl319x.c    | 2 +-
 drivers/leds/leds-is31fl32xx.c    | 2 +-
 drivers/leds/leds-lm3530.c        | 2 +-
 drivers/leds/leds-lm3532.c        | 2 +-
 drivers/leds/leds-lm355x.c        | 2 +-
 drivers/leds/leds-lm3642.c        | 2 +-
 drivers/leds/leds-lm3692x.c       | 2 +-
 drivers/leds/leds-lm3697.c        | 2 +-
 drivers/leds/leds-lp3944.c        | 2 +-
 drivers/leds/leds-lp3952.c        | 2 +-
 drivers/leds/leds-lp50xx.c        | 2 +-
 drivers/leds/leds-lp5521.c        | 2 +-
 drivers/leds/leds-lp5523.c        | 2 +-
 drivers/leds/leds-lp5562.c        | 2 +-
 drivers/leds/leds-lp8501.c        | 2 +-
 drivers/leds/leds-lp8860.c        | 2 +-
 drivers/leds/leds-pca9532.c       | 2 +-
 drivers/leds/leds-pca955x.c       | 2 +-
 drivers/leds/leds-pca963x.c       | 2 +-
 drivers/leds/leds-tca6507.c       | 2 +-
 drivers/leds/leds-tlc591xx.c      | 2 +-
 drivers/leds/leds-turris-omnia.c  | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/flash/leds-as3645a.c b/drivers/leds/flash/leds-as3645a.c
index bb2249771acb..7533c51f8ddf 100644
--- a/drivers/leds/flash/leds-as3645a.c
+++ b/drivers/leds/flash/leds-as3645a.c
@@ -759,7 +759,7 @@ static struct i2c_driver as3645a_i2c_driver = {
 		.of_match_table = as3645a_of_table,
 		.name = AS_NAME,
 	},
-	.probe_new	= as3645a_probe,
+	.probe = as3645a_probe,
 	.remove	= as3645a_remove,
 	.id_table = as3645a_id_table,
 };
diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index 78730e066a73..b6c524facf49 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -471,7 +471,7 @@ static struct i2c_driver lm3601x_i2c_driver = {
 		.name = "lm3601x",
 		.of_match_table = of_lm3601x_leds_match,
 	},
-	.probe_new = lm3601x_probe,
+	.probe = lm3601x_probe,
 	.remove = lm3601x_remove,
 	.id_table = lm3601x_id,
 };
diff --git a/drivers/leds/flash/leds-rt4505.c b/drivers/leds/flash/leds-rt4505.c
index e404fe8b0314..1ae5b387f4a5 100644
--- a/drivers/leds/flash/leds-rt4505.c
+++ b/drivers/leds/flash/leds-rt4505.c
@@ -419,7 +419,7 @@ static struct i2c_driver rt4505_driver = {
 		.name = "rt4505",
 		.of_match_table = of_match_ptr(rt4505_leds_match),
 	},
-	.probe_new = rt4505_probe,
+	.probe = rt4505_probe,
 	.remove = rt4505_remove,
 	.shutdown = rt4505_shutdown,
 };
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 89df267853a9..24b1041213c2 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -346,7 +346,7 @@ static struct i2c_driver an30259a_driver = {
 		.name = "leds-an30259a",
 		.of_match_table = of_match_ptr(an30259a_match_table),
 	},
-	.probe_new = an30259a_probe,
+	.probe = an30259a_probe,
 	.remove = an30259a_remove,
 	.id_table = an30259a_id,
 };
diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 0b52fc9097c6..59765640b70f 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -422,7 +422,7 @@ static struct i2c_driver aw2013_driver = {
 		.name = "leds-aw2013",
 		.of_match_table = of_match_ptr(aw2013_match_table),
 	},
-	.probe_new = aw2013_probe,
+	.probe = aw2013_probe,
 	.remove = aw2013_remove,
 };
 
diff --git a/drivers/leds/leds-bd2606mvv.c b/drivers/leds/leds-bd2606mvv.c
index 76f9d4d70f9a..3fda712d2f80 100644
--- a/drivers/leds/leds-bd2606mvv.c
+++ b/drivers/leds/leds-bd2606mvv.c
@@ -150,7 +150,7 @@ static struct i2c_driver bd2606mvv_driver = {
 		.name    = "leds-bd2606mvv",
 		.of_match_table = of_match_ptr(of_bd2606mvv_leds_match),
 	},
-	.probe_new = bd2606mvv_probe,
+	.probe = bd2606mvv_probe,
 };
 
 module_i2c_driver(bd2606mvv_driver);
diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 601185ddabcc..0792ea126cea 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -786,7 +786,7 @@ static struct i2c_driver bd2802_i2c_driver = {
 		.name	= "BD2802",
 		.pm	= &bd2802_pm,
 	},
-	.probe_new	= bd2802_probe,
+	.probe		= bd2802_probe,
 	.remove		= bd2802_remove,
 	.id_table	= bd2802_id,
 };
diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 37f2f32ae42d..ae9fbd32c53d 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -730,7 +730,7 @@ static struct i2c_driver blinkm_driver = {
 	.driver = {
 		   .name = "blinkm",
 		   },
-	.probe_new = blinkm_probe,
+	.probe = blinkm_probe,
 	.remove = blinkm_remove,
 	.id_table = blinkm_id,
 	.detect = blinkm_detect,
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 7c908414ac7e..66c65741202e 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -602,7 +602,7 @@ static struct i2c_driver is31fl319x_driver = {
 		.name           = "leds-is31fl319x",
 		.of_match_table = of_is31fl319x_match,
 	},
-	.probe_new = is31fl319x_probe,
+	.probe = is31fl319x_probe,
 	.id_table = is31fl319x_id,
 };
 
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 799191859ce0..72cb56d305c4 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -488,7 +488,7 @@ static struct i2c_driver is31fl32xx_driver = {
 		.name	= "is31fl32xx",
 		.of_match_table = of_is31fl32xx_match,
 	},
-	.probe_new	= is31fl32xx_probe,
+	.probe		= is31fl32xx_probe,
 	.remove		= is31fl32xx_remove,
 	.id_table	= is31fl32xx_id,
 };
diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index a9a2018592ff..a2feef8e4ac5 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -484,7 +484,7 @@ static const struct i2c_device_id lm3530_id[] = {
 MODULE_DEVICE_TABLE(i2c, lm3530_id);
 
 static struct i2c_driver lm3530_i2c_driver = {
-	.probe_new = lm3530_probe,
+	.probe = lm3530_probe,
 	.remove = lm3530_remove,
 	.id_table = lm3530_id,
 	.driver = {
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index a08c09129a68..13662a4aa1f2 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -726,7 +726,7 @@ static const struct i2c_device_id lm3532_id[] = {
 MODULE_DEVICE_TABLE(i2c, lm3532_id);
 
 static struct i2c_driver lm3532_i2c_driver = {
-	.probe_new = lm3532_probe,
+	.probe = lm3532_probe,
 	.remove = lm3532_remove,
 	.id_table = lm3532_id,
 	.driver = {
diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index 612873070ca4..f68771b9eac6 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -516,7 +516,7 @@ static struct i2c_driver lm355x_i2c_driver = {
 		   .name = LM355x_NAME,
 		   .pm = NULL,
 		   },
-	.probe_new = lm355x_probe,
+	.probe = lm355x_probe,
 	.remove = lm355x_remove,
 	.id_table = lm355x_id,
 };
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index b75ee3546c2e..6eee52e211be 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -401,7 +401,7 @@ static struct i2c_driver lm3642_i2c_driver = {
 		   .name = LM3642_NAME,
 		   .pm = NULL,
 		   },
-	.probe_new = lm3642_probe,
+	.probe = lm3642_probe,
 	.remove = lm3642_remove,
 	.id_table = lm3642_id,
 };
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 66126d0666f5..f8ad61e47a19 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -518,7 +518,7 @@ static struct i2c_driver lm3692x_driver = {
 		.name	= "lm3692x",
 		.of_match_table = of_lm3692x_leds_match,
 	},
-	.probe_new	= lm3692x_probe,
+	.probe		= lm3692x_probe,
 	.remove		= lm3692x_remove,
 	.id_table	= lm3692x_id,
 };
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 10e904bf40a0..cfb8ac220db6 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -376,7 +376,7 @@ static struct i2c_driver lm3697_driver = {
 		.name	= "lm3697",
 		.of_match_table = of_lm3697_leds_match,
 	},
-	.probe_new	= lm3697_probe,
+	.probe		= lm3697_probe,
 	.remove		= lm3697_remove,
 	.id_table	= lm3697_id,
 };
diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index be47c66b2e00..8ea746c499d1 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -427,7 +427,7 @@ static struct i2c_driver lp3944_driver = {
 	.driver   = {
 		   .name = "lp3944",
 	},
-	.probe_new = lp3944_probe,
+	.probe    = lp3944_probe,
 	.remove   = lp3944_remove,
 	.id_table = lp3944_id,
 };
diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 24b2e0f9080d..3bd55652a706 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -273,7 +273,7 @@ static struct i2c_driver lp3952_i2c_driver = {
 	.driver = {
 			.name = LP3952_NAME,
 	},
-	.probe_new = lp3952_probe,
+	.probe = lp3952_probe,
 	.remove = lp3952_remove,
 	.id_table = lp3952_id,
 };
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 28d6b39fa72d..68c4d9967d68 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -608,7 +608,7 @@ static struct i2c_driver lp50xx_driver = {
 		.name	= "lp50xx",
 		.of_match_table = of_lp50xx_leds_match,
 	},
-	.probe_new	= lp50xx_probe,
+	.probe		= lp50xx_probe,
 	.remove		= lp50xx_remove,
 	.id_table	= lp50xx_id,
 };
diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index a004af8e22c7..0343037d91ea 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -608,7 +608,7 @@ static struct i2c_driver lp5521_driver = {
 		.name	= "lp5521",
 		.of_match_table = of_match_ptr(of_lp5521_leds_match),
 	},
-	.probe_new	= lp5521_probe,
+	.probe		= lp5521_probe,
 	.remove		= lp5521_remove,
 	.id_table	= lp5521_id,
 };
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 55da914b8e5c..099cb9470f6c 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -983,7 +983,7 @@ static struct i2c_driver lp5523_driver = {
 		.name	= "lp5523x",
 		.of_match_table = of_match_ptr(of_lp5523_leds_match),
 	},
-	.probe_new	= lp5523_probe,
+	.probe		= lp5523_probe,
 	.remove		= lp5523_remove,
 	.id_table	= lp5523_id,
 };
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index b5d877faf6d7..4565cc12cea8 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -603,7 +603,7 @@ static struct i2c_driver lp5562_driver = {
 		.name	= "lp5562",
 		.of_match_table = of_match_ptr(of_lp5562_leds_match),
 	},
-	.probe_new	= lp5562_probe,
+	.probe		= lp5562_probe,
 	.remove		= lp5562_remove,
 	.id_table	= lp5562_id,
 };
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 165d6423a928..df472e9eb387 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -392,7 +392,7 @@ static struct i2c_driver lp8501_driver = {
 		.name	= "lp8501",
 		.of_match_table = of_match_ptr(of_lp8501_leds_match),
 	},
-	.probe_new	= lp8501_probe,
+	.probe		= lp8501_probe,
 	.remove		= lp8501_remove,
 	.id_table	= lp8501_id,
 };
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 221b386443bc..19b621012e58 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -475,7 +475,7 @@ static struct i2c_driver lp8860_driver = {
 		.name	= "lp8860",
 		.of_match_table = of_lp8860_leds_match,
 	},
-	.probe_new	= lp8860_probe,
+	.probe		= lp8860_probe,
 	.remove		= lp8860_remove,
 	.id_table	= lp8860_id,
 };
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 15b1acfa442e..8b5c62083e50 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -102,7 +102,7 @@ static struct i2c_driver pca9532_driver = {
 		.name = "leds-pca953x",
 		.of_match_table = of_match_ptr(of_pca9532_leds_match),
 	},
-	.probe_new = pca9532_probe,
+	.probe = pca9532_probe,
 	.remove = pca9532_remove,
 	.id_table = pca9532_id,
 };
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 1edd092e7894..b10e1ef38db0 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -668,7 +668,7 @@ static struct i2c_driver pca955x_driver = {
 		.name	= "leds-pca955x",
 		.of_match_table = of_pca955x_match,
 	},
-	.probe_new = pca955x_probe,
+	.probe = pca955x_probe,
 	.id_table = pca955x_id,
 };
 
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 9cd476db601f..47223c850e4b 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -431,7 +431,7 @@ static struct i2c_driver pca963x_driver = {
 		.name	= "leds-pca963x",
 		.of_match_table = of_pca963x_match,
 	},
-	.probe_new = pca963x_probe,
+	.probe = pca963x_probe,
 	.id_table = pca963x_id,
 };
 
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 634cabd5bb79..aab861771210 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -808,7 +808,7 @@ static struct i2c_driver tca6507_driver = {
 		.name    = "leds-tca6507",
 		.of_match_table = of_match_ptr(of_tca6507_leds_match),
 	},
-	.probe_new = tca6507_probe,
+	.probe    = tca6507_probe,
 	.remove   = tca6507_remove,
 	.id_table = tca6507_id,
 };
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 7e31db50036f..dfc6fb2b3e52 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -230,7 +230,7 @@ static struct i2c_driver tlc591xx_driver = {
 		.name = "tlc591xx",
 		.of_match_table = of_match_ptr(of_tlc591xx_leds_match),
 	},
-	.probe_new = tlc591xx_probe,
+	.probe = tlc591xx_probe,
 	.id_table = tlc591xx_id,
 };
 
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 013f551b32b2..64b2d7b6d3f3 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -271,7 +271,7 @@ static const struct i2c_device_id omnia_id[] = {
 MODULE_DEVICE_TABLE(i2c, omnia_id);
 
 static struct i2c_driver omnia_leds_driver = {
-	.probe_new	= omnia_leds_probe,
+	.probe		= omnia_leds_probe,
 	.remove		= omnia_leds_remove,
 	.id_table	= omnia_id,
 	.driver		= {
-- 
2.39.2

