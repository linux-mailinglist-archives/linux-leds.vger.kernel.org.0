Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9057A35A1
	for <lists+linux-leds@lfdr.de>; Sun, 17 Sep 2023 15:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjIQNKR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Sep 2023 09:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234556AbjIQNKC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Sep 2023 09:10:02 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8577126
        for <linux-leds@vger.kernel.org>; Sun, 17 Sep 2023 06:09:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhrX5-0004H8-JM; Sun, 17 Sep 2023 15:09:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhrX5-006ztg-0I; Sun, 17 Sep 2023 15:09:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhrX4-002Kly-Mh; Sun, 17 Sep 2023 15:09:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: Convert all platform drivers to return void
Date:   Sun, 17 Sep 2023 15:09:47 +0200
Message-Id: <20230917130947.1122198-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=27064; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=V+8oTvC9NTJ03vZBYH/M0S6kSav0I1bBy0fbZzZpFfc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlBvqaeFpfALLB+/D0QlMukMMbJ0TBCG9JSyF6R vXtGktpRDaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQb6mgAKCRCPgPtYfRL+ TthyB/9P1CVKGm++wSe8RL/EW6WUXHlnMgNG0/9Bdx+KSD9tY/g298FLofy5n5lJrTYl4DdpXQV XshbHDndOJpqFJnHfqp1s7JFaHdTNUuEDnEzQ5gQ4ckYnr0EVn+ssvvVZnv7eMcyLbMyzHGpOXd /hNwUtgheejadeEZ8IIMORd1AqjOQVNRo3KRztFgvAmUXQy4N8uuKQn41LZxX6LdTGbfyUSM6LZ ShHxZplCl9RTVLMdOBU6PsDfFkdqva0bKnXjvGbfYaFcFdFVRPoPh8AF8QFRFmzWqbWqw9Sk8go P/0vPROUJdNDt5pvUwn/1O5NJetiYLdBfCzKuqDuSXXo8Vh2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

All platform drivers below drivers/leds/ unconditionally return zero in
their remove callback and so can be converted trivially to the variant
returning void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/blink/leds-lgm-sso.c    | 6 ++----
 drivers/leds/flash/leds-aat1290.c    | 6 ++----
 drivers/leds/flash/leds-ktd2692.c    | 6 ++----
 drivers/leds/flash/leds-max77693.c   | 6 ++----
 drivers/leds/flash/leds-mt6360.c     | 5 ++---
 drivers/leds/flash/leds-qcom-flash.c | 5 ++---
 drivers/leds/flash/leds-rt8515.c     | 6 ++----
 drivers/leds/flash/leds-sgm3140.c    | 6 ++----
 drivers/leds/leds-88pm860x.c         | 6 ++----
 drivers/leds/leds-adp5520.c          | 6 ++----
 drivers/leds/leds-clevo-mail.c       | 5 ++---
 drivers/leds/leds-da903x.c           | 6 ++----
 drivers/leds/leds-da9052.c           | 6 ++----
 drivers/leds/leds-lm3533.c           | 6 ++----
 drivers/leds/leds-mc13783.c          | 6 ++----
 drivers/leds/leds-mlxreg.c           | 6 ++----
 drivers/leds/leds-mt6323.c           | 6 ++----
 drivers/leds/leds-nic78bx.c          | 6 ++----
 drivers/leds/leds-powernv.c          | 5 ++---
 drivers/leds/leds-rb532.c            | 5 ++---
 drivers/leds/leds-regulator.c        | 5 ++---
 drivers/leds/leds-sc27xx-bltc.c      | 5 ++---
 drivers/leds/leds-sunfire.c          | 8 +++-----
 drivers/leds/leds-wm831x-status.c    | 6 ++----
 drivers/leds/leds-wm8350.c           | 5 ++---
 drivers/leds/rgb/leds-qcom-lpg.c     | 6 ++----
 26 files changed, 53 insertions(+), 97 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 35c61311e7fd..7b04ea146260 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -837,7 +837,7 @@ static int intel_sso_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int intel_sso_led_remove(struct platform_device *pdev)
+static void intel_sso_led_remove(struct platform_device *pdev)
 {
 	struct sso_led_priv *priv;
 	struct sso_led *led, *n;
@@ -850,8 +850,6 @@ static int intel_sso_led_remove(struct platform_device *pdev)
 	}
 
 	regmap_exit(priv->mmap);
-
-	return 0;
 }
 
 static const struct of_device_id of_sso_led_match[] = {
@@ -863,7 +861,7 @@ MODULE_DEVICE_TABLE(of, of_sso_led_match);
 
 static struct platform_driver intel_sso_led_driver = {
 	.probe		= intel_sso_led_probe,
-	.remove		= intel_sso_led_remove,
+	.remove_new	= intel_sso_led_remove,
 	.driver		= {
 			.name = "lgm-ssoled",
 			.of_match_table = of_sso_led_match,
diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
index f12ecb2c6580..0195935a7c99 100644
--- a/drivers/leds/flash/leds-aat1290.c
+++ b/drivers/leds/flash/leds-aat1290.c
@@ -522,7 +522,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int aat1290_led_remove(struct platform_device *pdev)
+static void aat1290_led_remove(struct platform_device *pdev)
 {
 	struct aat1290_led *led = platform_get_drvdata(pdev);
 
@@ -530,8 +530,6 @@ static int aat1290_led_remove(struct platform_device *pdev)
 	led_classdev_flash_unregister(&led->fled_cdev);
 
 	mutex_destroy(&led->lock);
-
-	return 0;
 }
 
 static const struct of_device_id aat1290_led_dt_match[] = {
@@ -542,7 +540,7 @@ MODULE_DEVICE_TABLE(of, aat1290_led_dt_match);
 
 static struct platform_driver aat1290_led_driver = {
 	.probe		= aat1290_led_probe,
-	.remove		= aat1290_led_remove,
+	.remove_new	= aat1290_led_remove,
 	.driver		= {
 		.name	= "aat1290",
 		.of_match_table = aat1290_led_dt_match,
diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 670f3bf2e906..598eee5daa52 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -386,15 +386,13 @@ static int ktd2692_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ktd2692_remove(struct platform_device *pdev)
+static void ktd2692_remove(struct platform_device *pdev)
 {
 	struct ktd2692_context *led = platform_get_drvdata(pdev);
 
 	led_classdev_flash_unregister(&led->fled_cdev);
 
 	mutex_destroy(&led->lock);
-
-	return 0;
 }
 
 static const struct of_device_id ktd2692_match[] = {
@@ -409,7 +407,7 @@ static struct platform_driver ktd2692_driver = {
 		.of_match_table = ktd2692_match,
 	},
 	.probe  = ktd2692_probe,
-	.remove = ktd2692_remove,
+	.remove_new = ktd2692_remove,
 };
 
 module_platform_driver(ktd2692_driver);
diff --git a/drivers/leds/flash/leds-max77693.c b/drivers/leds/flash/leds-max77693.c
index 5c1faeb55a31..9f016b851193 100644
--- a/drivers/leds/flash/leds-max77693.c
+++ b/drivers/leds/flash/leds-max77693.c
@@ -1016,7 +1016,7 @@ static int max77693_led_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int max77693_led_remove(struct platform_device *pdev)
+static void max77693_led_remove(struct platform_device *pdev)
 {
 	struct max77693_led_device *led = platform_get_drvdata(pdev);
 	struct max77693_sub_led *sub_leds = led->sub_leds;
@@ -1032,8 +1032,6 @@ static int max77693_led_remove(struct platform_device *pdev)
 	}
 
 	mutex_destroy(&led->lock);
-
-	return 0;
 }
 
 static const struct of_device_id max77693_led_dt_match[] = {
@@ -1044,7 +1042,7 @@ MODULE_DEVICE_TABLE(of, max77693_led_dt_match);
 
 static struct platform_driver max77693_led_driver = {
 	.probe		= max77693_led_probe,
-	.remove		= max77693_led_remove,
+	.remove_new	= max77693_led_remove,
 	.driver		= {
 		.name	= "max77693-led",
 		.of_match_table = max77693_led_dt_match,
diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 1af6c5898343..81401c481e2b 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -855,12 +855,11 @@ static int mt6360_led_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt6360_led_remove(struct platform_device *pdev)
+static void mt6360_led_remove(struct platform_device *pdev)
 {
 	struct mt6360_priv *priv = platform_get_drvdata(pdev);
 
 	mt6360_v4l2_flash_release(priv);
-	return 0;
 }
 
 static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
@@ -875,7 +874,7 @@ static struct platform_driver mt6360_led_driver = {
 		.of_match_table = mt6360_led_of_id,
 	},
 	.probe = mt6360_led_probe,
-	.remove = mt6360_led_remove,
+	.remove_new = mt6360_led_remove,
 };
 module_platform_driver(mt6360_led_driver);
 
diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index a73d3ea5c97a..7c99a3039171 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -755,7 +755,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int qcom_flash_led_remove(struct platform_device *pdev)
+static void qcom_flash_led_remove(struct platform_device *pdev)
 {
 	struct qcom_flash_data *flash_data = platform_get_drvdata(pdev);
 
@@ -763,7 +763,6 @@ static int qcom_flash_led_remove(struct platform_device *pdev)
 		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
 
 	mutex_destroy(&flash_data->lock);
-	return 0;
 }
 
 static const struct of_device_id qcom_flash_led_match_table[] = {
@@ -778,7 +777,7 @@ static struct platform_driver qcom_flash_led_driver = {
 		.of_match_table = qcom_flash_led_match_table,
 	},
 	.probe = qcom_flash_led_probe,
-	.remove = qcom_flash_led_remove,
+	.remove_new = qcom_flash_led_remove,
 };
 
 module_platform_driver(qcom_flash_led_driver);
diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index 44904fdee3cc..eef426924eaf 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -367,15 +367,13 @@ static int rt8515_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rt8515_remove(struct platform_device *pdev)
+static void rt8515_remove(struct platform_device *pdev)
 {
 	struct rt8515 *rt = platform_get_drvdata(pdev);
 
 	rt8515_v4l2_flash_release(rt);
 	del_timer_sync(&rt->powerdown_timer);
 	mutex_destroy(&rt->lock);
-
-	return 0;
 }
 
 static const struct of_device_id rt8515_match[] = {
@@ -390,7 +388,7 @@ static struct platform_driver rt8515_driver = {
 		.of_match_table = rt8515_match,
 	},
 	.probe  = rt8515_probe,
-	.remove = rt8515_remove,
+	.remove_new = rt8515_remove,
 };
 module_platform_driver(rt8515_driver);
 
diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index d3f50dca5136..eb648ff54b4e 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -278,15 +278,13 @@ static int sgm3140_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sgm3140_remove(struct platform_device *pdev)
+static void sgm3140_remove(struct platform_device *pdev)
 {
 	struct sgm3140 *priv = platform_get_drvdata(pdev);
 
 	del_timer_sync(&priv->powerdown_timer);
 
 	v4l2_flash_release(priv->v4l2_flash);
-
-	return 0;
 }
 
 static const struct of_device_id sgm3140_dt_match[] = {
@@ -299,7 +297,7 @@ MODULE_DEVICE_TABLE(of, sgm3140_dt_match);
 
 static struct platform_driver sgm3140_driver = {
 	.probe	= sgm3140_probe,
-	.remove	= sgm3140_remove,
+	.remove_new = sgm3140_remove,
 	.driver	= {
 		.name	= "sgm3140",
 		.of_match_table = sgm3140_dt_match,
diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 508d0d859f2e..033ab5fed38a 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -215,13 +215,11 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pm860x_led_remove(struct platform_device *pdev)
+static void pm860x_led_remove(struct platform_device *pdev)
 {
 	struct pm860x_led *data = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&data->cdev);
-
-	return 0;
 }
 
 static struct platform_driver pm860x_led_driver = {
@@ -229,7 +227,7 @@ static struct platform_driver pm860x_led_driver = {
 		.name	= "88pm860x-led",
 	},
 	.probe	= pm860x_led_probe,
-	.remove	= pm860x_led_remove,
+	.remove_new = pm860x_led_remove,
 };
 
 module_platform_driver(pm860x_led_driver);
diff --git a/drivers/leds/leds-adp5520.c b/drivers/leds/leds-adp5520.c
index 5a0cc7af2df8..d89a4dca50ae 100644
--- a/drivers/leds/leds-adp5520.c
+++ b/drivers/leds/leds-adp5520.c
@@ -163,7 +163,7 @@ static int adp5520_led_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int adp5520_led_remove(struct platform_device *pdev)
+static void adp5520_led_remove(struct platform_device *pdev)
 {
 	struct adp5520_leds_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct adp5520_led *led;
@@ -177,8 +177,6 @@ static int adp5520_led_remove(struct platform_device *pdev)
 	for (i = 0; i < pdata->num_leds; i++) {
 		led_classdev_unregister(&led[i].cdev);
 	}
-
-	return 0;
 }
 
 static struct platform_driver adp5520_led_driver = {
@@ -186,7 +184,7 @@ static struct platform_driver adp5520_led_driver = {
 		.name	= "adp5520-led",
 	},
 	.probe		= adp5520_led_probe,
-	.remove		= adp5520_led_remove,
+	.remove_new	= adp5520_led_remove,
 };
 
 module_platform_driver(adp5520_led_driver);
diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-mail.c
index f512e99b976b..82da0fe688ad 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -159,14 +159,13 @@ static int __init clevo_mail_led_probe(struct platform_device *pdev)
 	return led_classdev_register(&pdev->dev, &clevo_mail_led);
 }
 
-static int clevo_mail_led_remove(struct platform_device *pdev)
+static void clevo_mail_led_remove(struct platform_device *pdev)
 {
 	led_classdev_unregister(&clevo_mail_led);
-	return 0;
 }
 
 static struct platform_driver clevo_mail_led_driver = {
-	.remove		= clevo_mail_led_remove,
+	.remove_new	= clevo_mail_led_remove,
 	.driver		= {
 		.name		= KBUILD_MODNAME,
 	},
diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 2b5fb00438a2..f067a5f4d3c4 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -121,13 +121,11 @@ static int da903x_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int da903x_led_remove(struct platform_device *pdev)
+static void da903x_led_remove(struct platform_device *pdev)
 {
 	struct da903x_led *led = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&led->cdev);
-
-	return 0;
 }
 
 static struct platform_driver da903x_led_driver = {
@@ -135,7 +133,7 @@ static struct platform_driver da903x_led_driver = {
 		.name	= "da903x-led",
 	},
 	.probe		= da903x_led_probe,
-	.remove		= da903x_led_remove,
+	.remove_new	= da903x_led_remove,
 };
 
 module_platform_driver(da903x_led_driver);
diff --git a/drivers/leds/leds-da9052.c b/drivers/leds/leds-da9052.c
index 04060c862bf9..64679d62076b 100644
--- a/drivers/leds/leds-da9052.c
+++ b/drivers/leds/leds-da9052.c
@@ -156,7 +156,7 @@ static int da9052_led_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int da9052_led_remove(struct platform_device *pdev)
+static void da9052_led_remove(struct platform_device *pdev)
 {
 	struct da9052_led *led = platform_get_drvdata(pdev);
 	struct da9052_pdata *pdata;
@@ -172,8 +172,6 @@ static int da9052_led_remove(struct platform_device *pdev)
 		da9052_set_led_brightness(&led[i], LED_OFF);
 		led_classdev_unregister(&led[i].cdev);
 	}
-
-	return 0;
 }
 
 static struct platform_driver da9052_led_driver = {
@@ -181,7 +179,7 @@ static struct platform_driver da9052_led_driver = {
 		.name	= "da9052-leds",
 	},
 	.probe		= da9052_led_probe,
-	.remove		= da9052_led_remove,
+	.remove_new	= da9052_led_remove,
 };
 
 module_platform_driver(da9052_led_driver);
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index bcd414eb4724..a3d33165d262 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -718,7 +718,7 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int lm3533_led_remove(struct platform_device *pdev)
+static void lm3533_led_remove(struct platform_device *pdev)
 {
 	struct lm3533_led *led = platform_get_drvdata(pdev);
 
@@ -726,8 +726,6 @@ static int lm3533_led_remove(struct platform_device *pdev)
 
 	lm3533_ctrlbank_disable(&led->cb);
 	led_classdev_unregister(&led->cdev);
-
-	return 0;
 }
 
 static void lm3533_led_shutdown(struct platform_device *pdev)
@@ -746,7 +744,7 @@ static struct platform_driver lm3533_led_driver = {
 		.name = "lm3533-leds",
 	},
 	.probe		= lm3533_led_probe,
-	.remove		= lm3533_led_remove,
+	.remove_new	= lm3533_led_remove,
 	.shutdown	= lm3533_led_shutdown,
 };
 module_platform_driver(lm3533_led_driver);
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 675502c15c2b..bbd1d359bba4 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -261,15 +261,13 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mc13xxx_led_remove(struct platform_device *pdev)
+static void mc13xxx_led_remove(struct platform_device *pdev)
 {
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
 	int i;
 
 	for (i = 0; i < leds->num_leds; i++)
 		led_classdev_unregister(&leds->led[i].cdev);
-
-	return 0;
 }
 
 static const struct mc13xxx_led_devtype mc13783_led_devtype = {
@@ -305,7 +303,7 @@ static struct platform_driver mc13xxx_led_driver = {
 	.driver	= {
 		.name	= "mc13xxx-led",
 	},
-	.remove		= mc13xxx_led_remove,
+	.remove_new	= mc13xxx_led_remove,
 	.id_table	= mc13xxx_led_id_table,
 };
 module_platform_driver_probe(mc13xxx_led_driver, mc13xxx_led_probe);
diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index 39210653acf7..d8e3d5d8d2d0 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -275,13 +275,11 @@ static int mlxreg_led_probe(struct platform_device *pdev)
 	return mlxreg_led_config(priv);
 }
 
-static int mlxreg_led_remove(struct platform_device *pdev)
+static void mlxreg_led_remove(struct platform_device *pdev)
 {
 	struct mlxreg_led_priv_data *priv = dev_get_drvdata(&pdev->dev);
 
 	mutex_destroy(&priv->access_lock);
-
-	return 0;
 }
 
 static struct platform_driver mlxreg_led_driver = {
@@ -289,7 +287,7 @@ static struct platform_driver mlxreg_led_driver = {
 	    .name = "leds-mlxreg",
 	},
 	.probe = mlxreg_led_probe,
-	.remove = mlxreg_led_remove,
+	.remove_new = mlxreg_led_remove,
 };
 
 module_platform_driver(mlxreg_led_driver);
diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 24f35bdb55fb..40d508510823 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -632,7 +632,7 @@ static int mt6323_led_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt6323_led_remove(struct platform_device *pdev)
+static void mt6323_led_remove(struct platform_device *pdev)
 {
 	struct mt6323_leds *leds = platform_get_drvdata(pdev);
 	const struct mt6323_regs *regs = leds->pdata->regs;
@@ -647,8 +647,6 @@ static int mt6323_led_remove(struct platform_device *pdev)
 			   RG_DRV_32K_CK_PDN);
 
 	mutex_destroy(&leds->lock);
-
-	return 0;
 }
 
 static const struct mt6323_regs mt6323_registers = {
@@ -723,7 +721,7 @@ MODULE_DEVICE_TABLE(of, mt6323_led_dt_match);
 
 static struct platform_driver mt6323_led_driver = {
 	.probe		= mt6323_led_probe,
-	.remove		= mt6323_led_remove,
+	.remove_new	= mt6323_led_remove,
 	.driver		= {
 		.name	= "mt6323-led",
 		.of_match_table = mt6323_led_dt_match,
diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index f196f52eec1e..a86b43dd995e 100644
--- a/drivers/leds/leds-nic78bx.c
+++ b/drivers/leds/leds-nic78bx.c
@@ -167,15 +167,13 @@ static int nic78bx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int nic78bx_remove(struct platform_device *pdev)
+static void nic78bx_remove(struct platform_device *pdev)
 {
 	struct nic78bx_led_data *led_data = platform_get_drvdata(pdev);
 
 	/* Lock LED register */
 	outb(NIC78BX_LOCK_VALUE,
 	     led_data->io_base + NIC78BX_LOCK_REG_OFFSET);
-
-	return 0;
 }
 
 static const struct acpi_device_id led_device_ids[] = {
@@ -186,7 +184,7 @@ MODULE_DEVICE_TABLE(acpi, led_device_ids);
 
 static struct platform_driver led_driver = {
 	.probe = nic78bx_probe,
-	.remove = nic78bx_remove,
+	.remove_new = nic78bx_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.acpi_match_table = ACPI_PTR(led_device_ids),
diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 743e2cdd0891..4f01acb75727 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -309,7 +309,7 @@ static int powernv_led_probe(struct platform_device *pdev)
 }
 
 /* Platform driver remove */
-static int powernv_led_remove(struct platform_device *pdev)
+static void powernv_led_remove(struct platform_device *pdev)
 {
 	struct powernv_led_common *powernv_led_common;
 
@@ -321,7 +321,6 @@ static int powernv_led_remove(struct platform_device *pdev)
 	mutex_destroy(&powernv_led_common->lock);
 
 	dev_info(&pdev->dev, "PowerNV led module unregistered\n");
-	return 0;
 }
 
 /* Platform driver property match */
@@ -335,7 +334,7 @@ MODULE_DEVICE_TABLE(of, powernv_led_match);
 
 static struct platform_driver powernv_led_driver = {
 	.probe	= powernv_led_probe,
-	.remove = powernv_led_remove,
+	.remove_new = powernv_led_remove,
 	.driver = {
 		.name = "powernv-led-driver",
 		.of_match_table = powernv_led_match,
diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
index b6447c1721b4..e66f73879c8e 100644
--- a/drivers/leds/leds-rb532.c
+++ b/drivers/leds/leds-rb532.c
@@ -42,15 +42,14 @@ static int rb532_led_probe(struct platform_device *pdev)
 	return led_classdev_register(&pdev->dev, &rb532_uled);
 }
 
-static int rb532_led_remove(struct platform_device *pdev)
+static void rb532_led_remove(struct platform_device *pdev)
 {
 	led_classdev_unregister(&rb532_uled);
-	return 0;
 }
 
 static struct platform_driver rb532_led_driver = {
 	.probe = rb532_led_probe,
-	.remove = rb532_led_remove,
+	.remove_new = rb532_led_remove,
 	.driver = {
 		.name = "rb532-led",
 	},
diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
index 8a8b73b4e358..848e929c4a61 100644
--- a/drivers/leds/leds-regulator.c
+++ b/drivers/leds/leds-regulator.c
@@ -173,13 +173,12 @@ static int regulator_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int regulator_led_remove(struct platform_device *pdev)
+static void regulator_led_remove(struct platform_device *pdev)
 {
 	struct regulator_led *led = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&led->cdev);
 	regulator_led_disable(led);
-	return 0;
 }
 
 static const struct of_device_id regulator_led_of_match[] = {
@@ -194,7 +193,7 @@ static struct platform_driver regulator_led_driver = {
 		.of_match_table = regulator_led_of_match,
 	},
 	.probe  = regulator_led_probe,
-	.remove = regulator_led_remove,
+	.remove_new = regulator_led_remove,
 };
 
 module_platform_driver(regulator_led_driver);
diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index e199ea15e406..af1f00a2f328 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -330,12 +330,11 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int sc27xx_led_remove(struct platform_device *pdev)
+static void sc27xx_led_remove(struct platform_device *pdev)
 {
 	struct sc27xx_led_priv *priv = platform_get_drvdata(pdev);
 
 	mutex_destroy(&priv->lock);
-	return 0;
 }
 
 static const struct of_device_id sc27xx_led_of_match[] = {
@@ -350,7 +349,7 @@ static struct platform_driver sc27xx_led_driver = {
 		.of_match_table = sc27xx_led_of_match,
 	},
 	.probe = sc27xx_led_probe,
-	.remove = sc27xx_led_remove,
+	.remove_new = sc27xx_led_remove,
 };
 
 module_platform_driver(sc27xx_led_driver);
diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
index eba7313719bf..6fd89efb420a 100644
--- a/drivers/leds/leds-sunfire.c
+++ b/drivers/leds/leds-sunfire.c
@@ -163,15 +163,13 @@ static int sunfire_led_generic_probe(struct platform_device *pdev,
 	return 0;
 }
 
-static int sunfire_led_generic_remove(struct platform_device *pdev)
+static void sunfire_led_generic_remove(struct platform_device *pdev)
 {
 	struct sunfire_drvdata *p = platform_get_drvdata(pdev);
 	int i;
 
 	for (i = 0; i < NUM_LEDS_PER_BOARD; i++)
 		led_classdev_unregister(&p->leds[i].led_cdev);
-
-	return 0;
 }
 
 static struct led_type clockboard_led_types[NUM_LEDS_PER_BOARD] = {
@@ -221,7 +219,7 @@ MODULE_ALIAS("platform:sunfire-fhc-leds");
 
 static struct platform_driver sunfire_clockboard_led_driver = {
 	.probe		= sunfire_clockboard_led_probe,
-	.remove		= sunfire_led_generic_remove,
+	.remove_new	= sunfire_led_generic_remove,
 	.driver		= {
 		.name	= "sunfire-clockboard-leds",
 	},
@@ -229,7 +227,7 @@ static struct platform_driver sunfire_clockboard_led_driver = {
 
 static struct platform_driver sunfire_fhc_led_driver = {
 	.probe		= sunfire_fhc_led_probe,
-	.remove		= sunfire_led_generic_remove,
+	.remove_new	= sunfire_led_generic_remove,
 	.driver		= {
 		.name	= "sunfire-fhc-leds",
 	},
diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index c48b80574f02..70b32d80f960 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -280,13 +280,11 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int wm831x_status_remove(struct platform_device *pdev)
+static void wm831x_status_remove(struct platform_device *pdev)
 {
 	struct wm831x_status *drvdata = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&drvdata->cdev);
-
-	return 0;
 }
 
 static struct platform_driver wm831x_status_driver = {
@@ -294,7 +292,7 @@ static struct platform_driver wm831x_status_driver = {
 		   .name = "wm831x-status",
 		   },
 	.probe = wm831x_status_probe,
-	.remove = wm831x_status_remove,
+	.remove_new = wm831x_status_remove,
 };
 
 module_platform_driver(wm831x_status_driver);
diff --git a/drivers/leds/leds-wm8350.c b/drivers/leds/leds-wm8350.c
index 8f243c413723..61cbefa05710 100644
--- a/drivers/leds/leds-wm8350.c
+++ b/drivers/leds/leds-wm8350.c
@@ -242,13 +242,12 @@ static int wm8350_led_probe(struct platform_device *pdev)
 	return led_classdev_register(&pdev->dev, &led->cdev);
 }
 
-static int wm8350_led_remove(struct platform_device *pdev)
+static void wm8350_led_remove(struct platform_device *pdev)
 {
 	struct wm8350_led *led = platform_get_drvdata(pdev);
 
 	led_classdev_unregister(&led->cdev);
 	wm8350_led_disable(led);
-	return 0;
 }
 
 static struct platform_driver wm8350_led_driver = {
@@ -256,7 +255,7 @@ static struct platform_driver wm8350_led_driver = {
 		   .name = "wm8350-led",
 		   },
 	.probe = wm8350_led_probe,
-	.remove = wm8350_led_remove,
+	.remove_new = wm8350_led_remove,
 	.shutdown = wm8350_led_shutdown,
 };
 
diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index df469aaa7e6e..0596f6a65680 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1364,13 +1364,11 @@ static int lpg_probe(struct platform_device *pdev)
 	return lpg_add_pwm(lpg);
 }
 
-static int lpg_remove(struct platform_device *pdev)
+static void lpg_remove(struct platform_device *pdev)
 {
 	struct lpg *lpg = platform_get_drvdata(pdev);
 
 	pwmchip_remove(&lpg->pwm);
-
-	return 0;
 }
 
 static const struct lpg_data pm8916_pwm_data = {
@@ -1532,7 +1530,7 @@ MODULE_DEVICE_TABLE(of, lpg_of_table);
 
 static struct platform_driver lpg_driver = {
 	.probe = lpg_probe,
-	.remove = lpg_remove,
+	.remove_new = lpg_remove,
 	.driver = {
 		.name = "qcom-spmi-lpg",
 		.of_match_table = lpg_of_table,

base-commit: dfa449a58323de195773cf928d99db4130702bf7
-- 
2.40.1

