Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24B21FD093
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2020 17:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgFQPK0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jun 2020 11:10:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40546 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgFQPKW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jun 2020 11:10:22 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05HFAIqq005085;
        Wed, 17 Jun 2020 10:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592406618;
        bh=wCZ4MMAr4l2mgIibN19UwQ6B7f7fRNfZT+ZnfSiiaXc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ex5204sp7pZR/YnMykl3+Dmnu5SBiZ+wmLCQ+Ab1xT8WMukZLUVkXtPlwoJu389Nm
         Z8lckU7ugUpxHYFQavpm9m4cBdQ726P3FgTflUN/kM+F8epkRC7qJJNx+hz2b883e8
         RkXaroxN4Ip4XibB5KLPSanToS7WN04T7Kvk0l0o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05HFAIPa112661;
        Wed, 17 Jun 2020 10:10:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 17
 Jun 2020 10:10:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 17 Jun 2020 10:10:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05HFAIF1013986;
        Wed, 17 Jun 2020 10:10:18 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v28 10/15] leds: lp55xx: Convert LED class registration to devm_*
Date:   Wed, 17 Jun 2020 10:09:19 -0500
Message-ID: <20200617150924.12665-11-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200617150924.12665-1-dmurphy@ti.com>
References: <20200617150924.12665-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the LED class registration calls to the LED devm_*
registration calls.

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5521.c        |  9 +++------
 drivers/leds/leds-lp5523.c        |  9 +++------
 drivers/leds/leds-lp5562.c        |  9 +++------
 drivers/leds/leds-lp55xx-common.c | 15 +--------------
 drivers/leds/leds-lp55xx-common.h |  2 --
 drivers/leds/leds-lp8501.c        |  9 +++------
 6 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 6f0272249dc8..6d2163c0f625 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -541,19 +541,17 @@ static int lp5521_probe(struct i2c_client *client,
 
 	ret = lp55xx_register_leds(led, chip);
 	if (ret)
-		goto err_register_leds;
+		goto err_out;
 
 	ret = lp55xx_register_sysfs(chip);
 	if (ret) {
 		dev_err(&client->dev, "registering sysfs failed\n");
-		goto err_register_sysfs;
+		goto err_out;
 	}
 
 	return 0;
 
-err_register_sysfs:
-	lp55xx_unregister_leds(led, chip);
-err_register_leds:
+err_out:
 	lp55xx_deinit_device(chip);
 err_init:
 	return ret;
@@ -566,7 +564,6 @@ static int lp5521_remove(struct i2c_client *client)
 
 	lp5521_stop_all_engines(chip);
 	lp55xx_unregister_sysfs(chip);
-	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
 
 	return 0;
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index d0b931a136b9..15e7051392f5 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -908,19 +908,17 @@ static int lp5523_probe(struct i2c_client *client,
 
 	ret = lp55xx_register_leds(led, chip);
 	if (ret)
-		goto err_register_leds;
+		goto err_out;
 
 	ret = lp55xx_register_sysfs(chip);
 	if (ret) {
 		dev_err(&client->dev, "registering sysfs failed\n");
-		goto err_register_sysfs;
+		goto err_out;
 	}
 
 	return 0;
 
-err_register_sysfs:
-	lp55xx_unregister_leds(led, chip);
-err_register_leds:
+err_out:
 	lp55xx_deinit_device(chip);
 err_init:
 	return ret;
@@ -933,7 +931,6 @@ static int lp5523_remove(struct i2c_client *client)
 
 	lp5523_stop_all_engines(chip);
 	lp55xx_unregister_sysfs(chip);
-	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
 
 	return 0;
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index edb57c42e8b1..1c94422408b0 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -554,19 +554,17 @@ static int lp5562_probe(struct i2c_client *client,
 
 	ret = lp55xx_register_leds(led, chip);
 	if (ret)
-		goto err_register_leds;
+		goto err_out;
 
 	ret = lp55xx_register_sysfs(chip);
 	if (ret) {
 		dev_err(&client->dev, "registering sysfs failed\n");
-		goto err_register_sysfs;
+		goto err_out;
 	}
 
 	return 0;
 
-err_register_sysfs:
-	lp55xx_unregister_leds(led, chip);
-err_register_leds:
+err_out:
 	lp55xx_deinit_device(chip);
 err_init:
 	return ret;
@@ -580,7 +578,6 @@ static int lp5562_remove(struct i2c_client *client)
 	lp5562_stop_engine(chip);
 
 	lp55xx_unregister_sysfs(chip);
-	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
 
 	return 0;
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 44ced02b49f9..882ef39e4965 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -181,7 +181,7 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 		led->cdev.name = name;
 	}
 
-	ret = led_classdev_register(dev, &led->cdev);
+	ret = devm_led_classdev_register(dev, &led->cdev);
 	if (ret) {
 		dev_err(dev, "led register err: %d\n", ret);
 		return ret;
@@ -490,23 +490,10 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 	return 0;
 
 err_init_led:
-	lp55xx_unregister_leds(led, chip);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(lp55xx_register_leds);
 
-void lp55xx_unregister_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
-{
-	int i;
-	struct lp55xx_led *each;
-
-	for (i = 0; i < chip->num_leds; i++) {
-		each = led + i;
-		led_classdev_unregister(&each->cdev);
-	}
-}
-EXPORT_SYMBOL_GPL(lp55xx_unregister_leds);
-
 int lp55xx_register_sysfs(struct lp55xx_chip *chip)
 {
 	struct device *dev = &chip->cl->dev;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 783ed5103ce5..b9b1041e8143 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -189,8 +189,6 @@ extern void lp55xx_deinit_device(struct lp55xx_chip *chip);
 /* common LED class device functions */
 extern int lp55xx_register_leds(struct lp55xx_led *led,
 				struct lp55xx_chip *chip);
-extern void lp55xx_unregister_leds(struct lp55xx_led *led,
-				struct lp55xx_chip *chip);
 
 /* common device attributes functions */
 extern int lp55xx_register_sysfs(struct lp55xx_chip *chip);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 2638dbf0e8ac..a58019cdb8c3 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -344,19 +344,17 @@ static int lp8501_probe(struct i2c_client *client,
 
 	ret = lp55xx_register_leds(led, chip);
 	if (ret)
-		goto err_register_leds;
+		goto err_out;
 
 	ret = lp55xx_register_sysfs(chip);
 	if (ret) {
 		dev_err(&client->dev, "registering sysfs failed\n");
-		goto err_register_sysfs;
+		goto err_out;
 	}
 
 	return 0;
 
-err_register_sysfs:
-	lp55xx_unregister_leds(led, chip);
-err_register_leds:
+err_out:
 	lp55xx_deinit_device(chip);
 err_init:
 	return ret;
@@ -369,7 +367,6 @@ static int lp8501_remove(struct i2c_client *client)
 
 	lp8501_stop_engine(chip);
 	lp55xx_unregister_sysfs(chip);
-	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
 
 	return 0;
-- 
2.26.2

