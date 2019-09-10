Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1ADAEBBC
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 15:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfIJNij (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 09:38:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45026 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfIJNid (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 09:38:33 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ADcVgo066860;
        Tue, 10 Sep 2019 08:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568122711;
        bh=VsiXL+zAxe9QV+2PwF448UVgiwJxHtymmgfX/kQ2kxQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=eROMurHfTRlzYM1iZOoH4nvds0F9sMBQNo7Mr3ekhjmPCNRe5vrmQ9SAXiZ4rSgUx
         X7aXcXdfPfXluIgsWr1ZTRcL2PmzQM4YNvShhjQu7uoFTdLICE/EsV8aYLZ4C5e1f4
         QSKUSDR3A0F7lGEh/NkAx9gjxfxcE3xFM4xRv+to=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ADcUlF097642
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Sep 2019 08:38:31 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 08:38:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 08:38:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADcTTa029601;
        Tue, 10 Sep 2019 08:38:30 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <tomi.valkeinen@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [RESEND,v2 1/2] leds: tlc591xx: simplify driver by using the managed led API
Date:   Tue, 10 Sep 2019 15:38:13 +0200
Message-ID: <20190910133814.10275-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910133814.10275-1-jjhiblot@ti.com>
References: <20190910133814.10275-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use the managed API of the LED class (devm_led_classdev_register()
instead of led_classdev_register()).
This allows us to remove the code used to track-and-destroy the LED devices

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/leds/leds-tlc591xx.c | 79 +++++++++---------------------------
 1 file changed, 20 insertions(+), 59 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 59ff088c7d75..3d5a4b92f016 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -128,51 +128,6 @@ tlc591xx_brightness_set(struct led_classdev *led_cdev,
 	return err;
 }
 
-static void
-tlc591xx_destroy_devices(struct tlc591xx_priv *priv, unsigned int j)
-{
-	int i = j;
-
-	while (--i >= 0) {
-		if (priv->leds[i].active)
-			led_classdev_unregister(&priv->leds[i].ldev);
-	}
-}
-
-static int
-tlc591xx_configure(struct device *dev,
-		   struct tlc591xx_priv *priv,
-		   const struct tlc591xx *tlc591xx)
-{
-	unsigned int i;
-	int err = 0;
-
-	tlc591xx_set_mode(priv->regmap, MODE2_DIM);
-	for (i = 0; i < TLC591XX_MAX_LEDS; i++) {
-		struct tlc591xx_led *led = &priv->leds[i];
-
-		if (!led->active)
-			continue;
-
-		led->priv = priv;
-		led->led_no = i;
-		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
-		led->ldev.max_brightness = LED_FULL;
-		err = led_classdev_register(dev, &led->ldev);
-		if (err < 0) {
-			dev_err(dev, "couldn't register LED %s\n",
-				led->ldev.name);
-			goto exit;
-		}
-	}
-
-	return 0;
-
-exit:
-	tlc591xx_destroy_devices(priv, i);
-	return err;
-}
-
 static const struct regmap_config tlc591xx_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -225,7 +180,11 @@ tlc591xx_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, priv);
 
+	tlc591xx_set_mode(priv->regmap, MODE2_DIM);
+
 	for_each_child_of_node(np, child) {
+		struct tlc591xx_led *led;
+
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err) {
 			of_node_put(child);
@@ -236,22 +195,25 @@ tlc591xx_probe(struct i2c_client *client,
 			of_node_put(child);
 			return -EINVAL;
 		}
-		priv->leds[reg].active = true;
-		priv->leds[reg].ldev.name =
+		led = &priv->leds[reg];
+
+		led->active = true;
+		led->ldev.name =
 			of_get_property(child, "label", NULL) ? : child->name;
-		priv->leds[reg].ldev.default_trigger =
+		led->ldev.default_trigger =
 			of_get_property(child, "linux,default-trigger", NULL);
-	}
-	return tlc591xx_configure(dev, priv, tlc591xx);
-}
-
-static int
-tlc591xx_remove(struct i2c_client *client)
-{
-	struct tlc591xx_priv *priv = i2c_get_clientdata(client);
-
-	tlc591xx_destroy_devices(priv, TLC591XX_MAX_LEDS);
 
+		led->priv = priv;
+		led->led_no = reg;
+		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
+		led->ldev.max_brightness = LED_FULL;
+		err = devm_led_classdev_register(dev, &led->ldev);
+		if (err < 0) {
+			dev_err(dev, "couldn't register LED %s\n",
+				led->ldev.name);
+			return err;
+		}
+	}
 	return 0;
 }
 
@@ -268,7 +230,6 @@ static struct i2c_driver tlc591xx_driver = {
 		.of_match_table = of_match_ptr(of_tlc591xx_leds_match),
 	},
 	.probe = tlc591xx_probe,
-	.remove = tlc591xx_remove,
 	.id_table = tlc591xx_id,
 };
 
-- 
2.17.1

