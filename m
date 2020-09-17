Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AC026E8CB
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgIQWeL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:11 -0400
Received: from mail.nic.cz ([217.31.204.67]:35844 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgIQWeK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:10 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id CAA7B1419EC;
        Fri, 18 Sep 2020 00:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382038; bh=cx9F8NaidXU5h1KRThFffrTQvZ02a78OAICQ4c2mFEw=;
        h=From:To:Date;
        b=R+sHPlJAXHH1vOAIuONwkAbuH2cwxUx2xOI7DVScw0TVIZ8CGQbhGhbt4vMQafBHd
         K+SnS7vm1p/8funo8hOsjOMqYsfjpsRU1JKnj9aZWXJN/AxY8FowbgTDSe220dtTkf
         06BS8bwioj44DCXFtUC4YOo4GT9qMlaKMX3R8XrY=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds v2 25/50] leds: is31fl319x: compute aggregated max current separately
Date:   Fri, 18 Sep 2020 00:33:13 +0200
Message-Id: <20200917223338.14164-26-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Parse `led-max-current` property of child nodes and compute aggregated
value in a separate function. The controller cannot set this value
separately for every LED, so there is no need to store this value for
every LED.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-is31fl319x.c | 61 ++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 4161b9dd7e488..ba1a5da5521b5 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -71,7 +71,6 @@ struct is31fl319x_chip {
 	struct is31fl319x_led {
 		struct is31fl319x_chip  *chip;
 		struct led_classdev     cdev;
-		u32                     max_microamp;
 		bool                    configured;
 	} leds[IS31FL319X_MAX_LEDS];
 };
@@ -171,6 +170,35 @@ static int is31fl319x_brightness_set(struct led_classdev *cdev,
 	return ret;
 }
 
+static int is31fl319x_parse_max_current(struct device *dev, u32 *aggregated)
+{
+	struct device_node *np;
+	u32 value;
+	int ret;
+
+	*aggregated = IS31FL319X_CURRENT_MAX;
+
+	for_each_available_child_of_node(dev_of_node(dev), np) {
+		value = IS31FL319X_CURRENT_DEFAULT;
+		ret = of_property_read_u32(np, "led-max-microamp", &value);
+		if (!ret)
+			value = min(value, IS31FL319X_CURRENT_MAX);
+
+		if (value < IS31FL319X_CURRENT_MIN) {
+			dev_err(dev,
+				"Value of led-max-microamp too low for %pOF\n",
+				np);
+			of_node_put(np);
+			return -EINVAL;
+		}
+
+		if (value < *aggregated)
+			*aggregated = value;
+	}
+
+	return 0;
+}
+
 static int is31fl319x_parse_child_dt(const struct device *dev,
 				     const struct device_node *child,
 				     struct is31fl319x_led *led)
@@ -186,16 +214,6 @@ static int is31fl319x_parse_child_dt(const struct device *dev,
 	if (ret < 0 && ret != -EINVAL) /* is optional */
 		return ret;
 
-	led->max_microamp = IS31FL319X_CURRENT_DEFAULT;
-	ret = of_property_read_u32(child, "led-max-microamp",
-				   &led->max_microamp);
-	if (!ret) {
-		if (led->max_microamp < IS31FL319X_CURRENT_MIN)
-			return -EINVAL;	/* not supported */
-		led->max_microamp = min(led->max_microamp,
-					  IS31FL319X_CURRENT_MAX);
-	}
-
 	return 0;
 }
 
@@ -339,11 +357,20 @@ static int is31fl319x_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	int err;
 	int i = 0;
-	u32 aggregated_led_microamp = IS31FL319X_CURRENT_MAX;
+	u32 aggregated_led_microamp;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -EIO;
 
+	/*
+	 * Kernel conventions require per-LED led-max-microamp property.
+	 * But the chip does not allow to limit individual LEDs.
+	 * So we take minimum from all subnodes for safety of hardware.
+	 */
+	err = is31fl319x_parse_max_current(dev, &aggregated_led_microamp);
+	if (err)
+		return err;
+
 	is31 = devm_kzalloc(&client->dev, sizeof(*is31), GFP_KERNEL);
 	if (!is31)
 		return -ENOMEM;
@@ -379,16 +406,6 @@ static int is31fl319x_probe(struct i2c_client *client,
 		goto free_mutex;
 	}
 
-	/*
-	 * Kernel conventions require per-LED led-max-microamp property.
-	 * But the chip does not allow to limit individual LEDs.
-	 * So we take minimum from all subnodes for safety of hardware.
-	 */
-	for (i = 0; i < is31->cdef->num_leds; i++)
-		if (is31->leds[i].configured &&
-		    is31->leds[i].max_microamp < aggregated_led_microamp)
-			aggregated_led_microamp = is31->leds[i].max_microamp;
-
 	regmap_write(is31->regmap, IS31FL319X_CONFIG2,
 		     is31fl319x_microamp_to_cs(dev, aggregated_led_microamp) |
 		     is31fl319x_db_to_gain(is31->audio_gain_db));
-- 
2.26.2

