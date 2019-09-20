Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06535B8F5E
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 13:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408819AbfITL6Q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 07:58:16 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33244 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408805AbfITL6Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 07:58:16 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KBwB1h025850;
        Fri, 20 Sep 2019 06:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568980692;
        bh=3NJiQkKcVHIu+bG4Sy5oOugZg8V3tPpGIFBEEjivzqE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=aOiUeZp6Y3MGSdlhEQ9dGvU1OaYBnfeg1T9v0tq6I72J247t9bm+gcN7dgq0XZnIG
         Ky3a5M/9ktZeAAZei/VTYOE8wB7MQ768ERx9+pOXGrR53Aw45jVD4egCn6LPzEaKfg
         37rSqCMJqt4hZvT7HmekQv8/tmtuQ/J91JVvRfZo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KBwBh0098995
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 06:58:11 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 06:58:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 06:58:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KBwAIc071482;
        Fri, 20 Sep 2019 06:58:10 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <tomi.valkeinen@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v4 1/2] leds: tlc591xx: simplify driver by using the managed led API
Date:   Fri, 20 Sep 2019 13:58:05 +0200
Message-ID: <20190920115806.14475-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920115806.14475-1-jjhiblot@ti.com>
References: <20190920115806.14475-1-jjhiblot@ti.com>
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
 drivers/leds/leds-tlc591xx.c | 84 ++++++++++--------------------------
 1 file changed, 22 insertions(+), 62 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 00702824d27c..bbdaa3148317 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -128,54 +128,6 @@ tlc591xx_brightness_set(struct led_classdev *led_cdev,
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
-	err = tlc591xx_set_mode(priv->regmap, MODE2_DIM);
-	if (err < 0)
-		return err;
-
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
@@ -228,7 +180,13 @@ tlc591xx_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, priv);
 
+	err = tlc591xx_set_mode(priv->regmap, MODE2_DIM);
+	if (err < 0)
+		return err;
+
 	for_each_child_of_node(np, child) {
+		struct tlc591xx_led *led;
+
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err) {
 			of_node_put(child);
@@ -239,22 +197,25 @@ tlc591xx_probe(struct i2c_client *client,
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
 
@@ -271,7 +232,6 @@ static struct i2c_driver tlc591xx_driver = {
 		.of_match_table = of_match_ptr(of_tlc591xx_leds_match),
 	},
 	.probe = tlc591xx_probe,
-	.remove = tlc591xx_remove,
 	.id_table = tlc591xx_id,
 };
 
-- 
2.17.1

