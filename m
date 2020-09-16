Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78AC026CF6A
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgIPXRA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgIPXQ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2020 19:16:57 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4539C06178B;
        Wed, 16 Sep 2020 16:16:56 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5124F140A42;
        Thu, 17 Sep 2020 01:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298213; bh=RGQ7rsTruV41jE+5UmY8lW2TWBw9LibdoGLkKOFMT1M=;
        h=From:To:Date;
        b=s/1IfLuDu0+s7Cuj9dkDO/IJ9nsIbNWJ6dGGBDiRykGvSIhVR5d7ayat3ynMmqQv9
         A5yc4CBebY87g8zj8cF+SG+3O3iDvBjzz5eYePTmkPNGWDcaEHXYfXLGTYkGGBj9NC
         u4jvjbOjqlM7Bu4T0xMGryf9GG+r29yvAwf/yB3A=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        David Rivshin <drivshin@allworx.com>
Subject: [PATCH leds v1 07/10] leds: is31fl32xx: use struct led_init_data when registering
Date:   Thu, 17 Sep 2020 01:16:47 +0200
Message-Id: <20200916231650.11484-8-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916231650.11484-1-marek.behun@nic.cz>
References: <20200916231650.11484-1-marek.behun@nic.cz>
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

By using struct led_init_data when registering we do not need to parse
`label` DT property nor `linux,default-trigger` property.

This driver needed small refactoring for this to work nicely.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: David Rivshin <drivshin@allworx.com>
---
 drivers/leds/leds-is31fl32xx.c | 95 +++++++++++++---------------------
 1 file changed, 35 insertions(+), 60 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index cd768f991da10..769cce5fd2814 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -324,84 +324,63 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 	return 0;
 }
 
-static int is31fl32xx_parse_child_dt(const struct device *dev,
-				     const struct device_node *child,
-				     struct is31fl32xx_led_data *led_data)
+static bool is31fl32xx_has_led(struct is31fl32xx_priv *priv, u8 channel)
 {
-	struct led_classdev *cdev = &led_data->cdev;
-	int ret = 0;
-	u32 reg;
+	int i;
 
-	if (of_property_read_string(child, "label", &cdev->name))
-		cdev->name = child->name;
+	for (i = 0; i < priv->num_leds; ++i)
+		if (priv->leds[i].channel == channel)
+			return true;
+
+	return false;
+}
+
+static int is31fl32xx_led_register(struct device *dev, struct device_node *np,
+				   struct is31fl32xx_led_data *led_data)
+{
+	struct led_init_data init_data = {};
+	u32 reg;
+	int ret;
 
-	ret = of_property_read_u32(child, "reg", &reg);
+	ret = of_property_read_u32(np, "reg", &reg);
 	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
-		dev_err(dev,
-			"Child node %pOF does not have a valid reg property\n",
-			child);
+		dev_err(dev, "Node %pOF has no valid reg property\n", np);
 		return -EINVAL;
 	}
-	led_data->channel = reg;
-
-	of_property_read_string(child, "linux,default-trigger",
-				&cdev->default_trigger);
 
-	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
-
-	return 0;
-}
+	if (is31fl32xx_has_led(led_data->priv, reg)) {
+		dev_err(dev, "Node %pOF reg property already used\n", np);
+		return -EEXIST;
+	}
 
-static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
-					struct is31fl32xx_priv *priv,
-					u8 channel)
-{
-	size_t i;
+	led_data->channel = reg;
+	led_data->cdev.brightness_set_blocking = is31fl32xx_brightness_set;
+	init_data.fwnode = of_fwnode_handle(np);
 
-	for (i = 0; i < priv->num_leds; i++) {
-		if (priv->leds[i].channel == channel)
-			return &priv->leds[i];
-	}
+	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
+	if (ret)
+		dev_err(dev, "Failed to register LED for %pOF: %d\n", np,
+			ret);
 
-	return NULL;
+	return ret;
 }
 
-static int is31fl32xx_parse_dt(struct device *dev,
-			       struct is31fl32xx_priv *priv)
+static int is31fl32xx_leds_register(struct device *dev,
+				    struct is31fl32xx_priv *priv)
 {
 	struct device_node *child;
-	int ret = 0;
+	int ret;
 
-	for_each_child_of_node(dev->of_node, child) {
+	for_each_child_of_node(dev_of_node(dev), child) {
 		struct is31fl32xx_led_data *led_data =
 			&priv->leds[priv->num_leds];
-		const struct is31fl32xx_led_data *other_led_data;
 
 		led_data->priv = priv;
 
-		ret = is31fl32xx_parse_child_dt(dev, child, led_data);
+		ret = is31fl32xx_led_register(dev, child, led_data);
 		if (ret)
 			goto err;
 
-		/* Detect if channel is already in use by another child */
-		other_led_data = is31fl32xx_find_led_data(priv,
-							  led_data->channel);
-		if (other_led_data) {
-			dev_err(dev,
-				"%s and %s both attempting to use channel %d\n",
-				led_data->cdev.name,
-				other_led_data->cdev.name,
-				led_data->channel);
-			goto err;
-		}
-
-		ret = devm_led_classdev_register(dev, &led_data->cdev);
-		if (ret) {
-			dev_err(dev, "failed to register PWM led for %s: %d\n",
-				led_data->cdev.name, ret);
-			goto err;
-		}
-
 		priv->num_leds++;
 	}
 
@@ -457,11 +436,7 @@ static int is31fl32xx_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = is31fl32xx_parse_dt(dev, priv);
-	if (ret)
-		return ret;
-
-	return 0;
+	return is31fl32xx_leds_register(dev, priv);
 }
 
 static int is31fl32xx_remove(struct i2c_client *client)
-- 
2.26.2

