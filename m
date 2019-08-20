Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26956969CC
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 21:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730643AbfHTTx3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 15:53:29 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44752 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHTTx2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Aug 2019 15:53:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrIHT074727;
        Tue, 20 Aug 2019 14:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566330798;
        bh=zTlYVpk4j6J82Whbs9ef9vsWDQXT0h/u+NCcDZR6KRs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=m+kSAUHgqJ3zzDfqE0WPQO2NrV7WR0mZBAbkpcYVhkiOMU4R08I68uo+qF9e4TuGc
         8ha6LgAZ/hyRw4zI5mbcNToTVWEdLF4oO0xuu1qjxKyw9ySShAEzDJ1I0rYLC5Mi8L
         aZq9nuI8FtbA6h0wJ6Q6M0HmS/Ysl1r1DzR0y70c=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KJrIil057594
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 14:53:18 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 14:53:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 14:53:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrINT072811;
        Tue, 20 Aug 2019 14:53:18 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 3/5] leds: lm3532: Fixes for the driver for stability
Date:   Tue, 20 Aug 2019 14:53:05 -0500
Message-ID: <20190820195307.27590-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190820195307.27590-1-dmurphy@ti.com>
References: <20190820195307.27590-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fixed misspelled words, added error check during probe
on the init of the registers, and fixed ALS/I2C control
mode.

Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
Reported-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - No changes - https://lore.kernel.org/patchwork/patch/1114541/

 drivers/leds/leds-lm3532.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 0c3d67671ab2..5e33ae4561f2 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -43,7 +43,7 @@
 #define LM3532_REG_ZONE_TRGT_C	0x7a
 #define LM3532_REG_MAX		0x7e
 
-/* Contorl Enable */
+/* Control Enable */
 #define LM3532_CTRL_A_ENABLE	BIT(0)
 #define LM3532_CTRL_B_ENABLE	BIT(1)
 #define LM3532_CTRL_C_ENABLE	BIT(2)
@@ -307,7 +307,7 @@ static int lm3532_led_disable(struct lm3532_led *led_data)
 	int ret;
 
 	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
-					 ctrl_en_val, ~ctrl_en_val);
+					 ctrl_en_val, 0);
 	if (ret) {
 		dev_err(led_data->priv->dev, "Failed to set ctrl:%d\n", ret);
 		return ret;
@@ -326,7 +326,7 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&led->priv->lock);
 
-	if (led->mode == LM3532_BL_MODE_ALS) {
+	if (led->mode == LM3532_ALS_CTRL) {
 		if (brt_val > LED_OFF)
 			ret = lm3532_led_enable(led);
 		else
@@ -561,11 +561,14 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		}
 
 		if (led->mode == LM3532_BL_MODE_ALS) {
+			led->mode = LM3532_ALS_CTRL;
 			ret = lm3532_parse_als(priv);
 			if (ret)
 				dev_err(&priv->client->dev, "Failed to parse als\n");
 			else
 				lm3532_als_configure(priv, led);
+		} else {
+			led->mode = LM3532_I2C_CTRL;
 		}
 
 		led->num_leds = fwnode_property_count_u32(child, "led-sources");
@@ -606,7 +609,13 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 			goto child_out;
 		}
 
-		lm3532_init_registers(led);
+		ret = lm3532_init_registers(led);
+		if (ret) {
+			dev_err(&priv->client->dev, "register init err: %d\n",
+				ret);
+			fwnode_handle_put(child);
+			goto child_out;
+		}
 
 		i++;
 	}
-- 
2.22.0.214.g8dca754b1e

