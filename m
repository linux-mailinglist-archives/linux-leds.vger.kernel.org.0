Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 870A2DC4C7
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 14:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407895AbfJRM0o (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 08:26:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48400 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405057AbfJRM0A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 08:26:00 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPvNO066245;
        Fri, 18 Oct 2019 07:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571401557;
        bh=buz6M0IIdmg0t8RtuCR1zovQJab7aYMJ3zkvIeSXYJ0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bdc74pbFi7zrJ6wTH/6WvZfj8hnqap3PPEWplUj5JwhR1gQHHEat7drQ0xrhZyDpW
         tGTe7oY9yR3xgLj8jbAjLJhEPnK4Vh9kTsCaJe+wYXz+E63Urv9Xql5qzjT2ju0LPg
         zYIPtVLYjMsqOrcwPetqWIKLjxjqvB8AOMNjTivU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPvJ0091738;
        Fri, 18 Oct 2019 07:25:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 07:25:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 07:25:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPvNs099338;
        Fri, 18 Oct 2019 07:25:57 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v14 12/19] leds: lp55xx: Convert LED class registration to devm_*
Date:   Fri, 18 Oct 2019 07:25:14 -0500
Message-ID: <20191018122521.6757-13-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191018122521.6757-1-dmurphy@ti.com>
References: <20191018122521.6757-1-dmurphy@ti.com>
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

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5521.c        |  9 +++------
 drivers/leds/leds-lp5523.c        |  9 +++------
 drivers/leds/leds-lp55xx-common.c | 15 +--------------
 drivers/leds/leds-lp55xx-common.h |  2 --
 drivers/leds/leds-lp8501.c        |  9 +++------
 5 files changed, 10 insertions(+), 34 deletions(-)

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
2.22.0.214.g8dca754b1e

