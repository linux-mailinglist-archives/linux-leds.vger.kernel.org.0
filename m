Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 434B9FC7A1
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2019 14:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfKNNc2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Nov 2019 08:32:28 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48994 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfKNNc1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Nov 2019 08:32:27 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWOwV067474;
        Thu, 14 Nov 2019 07:32:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573738344;
        bh=ux3NdveofEotm2m8GimOFkGu48EX+3UN3KXdUkP71GQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mGDPqCemInWxsrgzEtrP7f9qfEa44bS6p+EkYSFVPPaQoWrjXumxW5JZ+jPXVgh6Y
         tZc/zmnUS+3JrnBXwRPZhQt6kkawJ04z+jD+GwuudvbVi4+ntvE+eHxbqoB+w/xFgY
         ICCHaebUG8TFWYjgY+usWXnDn40JwbtfKTk/7/UA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWOP0069400;
        Thu, 14 Nov 2019 07:32:24 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 07:32:24 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 07:32:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWO6f080880;
        Thu, 14 Nov 2019 07:32:24 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v17 12/19] leds: lp55xx: Convert LED class registration to devm_*
Date:   Thu, 14 Nov 2019 07:30:16 -0600
Message-ID: <20191114133023.32185-13-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191114133023.32185-1-dmurphy@ti.com>
References: <20191114133023.32185-1-dmurphy@ti.com>
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
2.22.0.214.g8dca754b1e

