Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993FA26CF76
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgIPXRh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgIPXQ6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2020 19:16:58 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E97AC06178C;
        Wed, 16 Sep 2020 16:16:57 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id B6F99140A47;
        Thu, 17 Sep 2020 01:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298213; bh=H5VMRYwbsOWAo3NkkolRcqZJexc2xLi1wrEFjmU2HDE=;
        h=From:To:Date;
        b=TBqITmuFgMjAlxys/jMc5JVgo7wxMtsYkaSCk+420YfT3deqdy7R9AxoTbSRpvEx7
         xwbMvbN54PwXdVaAo6sK+uPilrD+geumzOkBn/M6cluKDnCLnjxHKXV1Ksp49KCfCf
         MAVa0sfJATq6f2tvTDL/eyWc2vy1K8jAFWYT53a4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v1 09/10] leds: lm36274: use struct led_init_data when registering
Date:   Thu, 17 Sep 2020 01:16:49 +0200
Message-Id: <20200916231650.11484-10-marek.behun@nic.cz>
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

A small refactor was also done:
- with using devm_led_classdev_register_ext the driver remove method is
  not needed
- since only one child node is allowed for this driver, use
  device_get_next_child_node instead of device_for_each_child_node

Previously if the `label` DT property was not present, the code composed
name for the LED in the form
  "parent_name::"
For backwards compatibility we therefore set
  init_data->default_label = ":";
so that the LED will not get a different name if `label` property is not
present.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm36274.c | 100 ++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index bfeee03a0053c..7ec53b4669eac 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -67,61 +67,53 @@ static int lm36274_init(struct lm36274 *lm36274_data)
 			    enable_val);
 }
 
-static int lm36274_parse_dt(struct lm36274 *lm36274_data)
+static int lm36274_parse_dt(struct lm36274 *lm36274_data,
+			    struct led_init_data *init_data)
 {
-	struct fwnode_handle *child = NULL;
-	char label[LED_MAX_NAME_SIZE];
 	struct device *dev = &lm36274_data->pdev->dev;
-	const char *name;
-	int child_cnt;
-	int ret = -EINVAL;
+	struct fwnode_handle *fwnode;
+	int ret;
 
 	/* There should only be 1 node */
-	child_cnt = device_get_child_node_count(dev);
-	if (child_cnt != 1)
+	if (device_get_child_node_count(dev) != 1)
 		return -EINVAL;
 
-	device_for_each_child_node(dev, child) {
-		ret = fwnode_property_read_string(child, "label", &name);
-		if (ret)
-			snprintf(label, sizeof(label),
-				"%s::", lm36274_data->pdev->name);
-		else
-			snprintf(label, sizeof(label),
-				 "%s:%s", lm36274_data->pdev->name, name);
-
-		lm36274_data->num_leds = fwnode_property_count_u32(child, "led-sources");
-		if (lm36274_data->num_leds <= 0)
-			return -ENODEV;
-
-		ret = fwnode_property_read_u32_array(child, "led-sources",
-						     lm36274_data->led_sources,
-						     lm36274_data->num_leds);
-		if (ret) {
-			dev_err(dev, "led-sources property missing\n");
-			return ret;
-		}
-
-		fwnode_property_read_string(child, "linux,default-trigger",
-					&lm36274_data->led_dev.default_trigger);
+	fwnode = device_get_next_child_node(dev, NULL);
+	if (!fwnode)
+		return -ENODEV;
 
-	}
+	init_data->fwnode = fwnode;
+	init_data->devicename = lm36274_data->pdev->name;
 
-	lm36274_data->lmu_data.regmap = lm36274_data->regmap;
-	lm36274_data->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
-	lm36274_data->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
-	lm36274_data->lmu_data.lsb_brightness_reg = LM36274_REG_BRT_LSB;
+	/* for backwards compatibility when `label` property is not present */
+	init_data->default_label = ":";
 
-	lm36274_data->led_dev.name = label;
-	lm36274_data->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
-	lm36274_data->led_dev.brightness_set_blocking = lm36274_brightness_set;
+	lm36274_data->num_leds = fwnode_property_count_u32(fwnode,
+							   "led-sources");
+	if (lm36274_data->num_leds <= 0) {
+		ret = -ENODEV;
+		goto err;
+	}
+
+	ret = fwnode_property_read_u32_array(fwnode, "led-sources",
+					     lm36274_data->led_sources,
+					     lm36274_data->num_leds);
+	if (ret) {
+		dev_err(dev, "led-sources property missing\n");
+		goto err;
+	}
 
 	return 0;
+err:
+	fwnode_handle_put(fwnode);
+	return ret;
 }
 
 static int lm36274_probe(struct platform_device *pdev)
 {
 	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
+	struct led_init_data init_data = {};
+	struct device *dev = lmu->dev;
 	struct lm36274 *lm36274_data;
 	int ret;
 
@@ -131,32 +123,39 @@ static int lm36274_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	lm36274_data->pdev = pdev;
-	lm36274_data->dev = lmu->dev;
+	lm36274_data->dev = dev;
 	lm36274_data->regmap = lmu->regmap;
 	platform_set_drvdata(pdev, lm36274_data);
 
-	ret = lm36274_parse_dt(lm36274_data);
+	ret = lm36274_parse_dt(lm36274_data, &init_data);
 	if (ret) {
-		dev_err(lm36274_data->dev, "Failed to parse DT node\n");
+		dev_err(dev, "Failed to parse DT node\n");
 		return ret;
 	}
 
+	lm36274_data->lmu_data.regmap = lm36274_data->regmap;
+	lm36274_data->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
+	lm36274_data->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;
+	lm36274_data->lmu_data.lsb_brightness_reg = LM36274_REG_BRT_LSB;
+
 	ret = lm36274_init(lm36274_data);
 	if (ret) {
-		dev_err(lm36274_data->dev, "Failed to init the device\n");
+		dev_err(dev, "Failed to init the device\n");
 		return ret;
 	}
 
-	return led_classdev_register(lm36274_data->dev, &lm36274_data->led_dev);
-}
+	lm36274_data->led_dev.max_brightness = MAX_BRIGHTNESS_11BIT;
+	lm36274_data->led_dev.brightness_set_blocking = lm36274_brightness_set;
 
-static int lm36274_remove(struct platform_device *pdev)
-{
-	struct lm36274 *lm36274_data = platform_get_drvdata(pdev);
+	ret = devm_led_classdev_register_ext(dev, &lm36274_data->led_dev,
+					     &init_data);
+	if (ret)
+		dev_err(dev, "Failed to register LED for node %pfw\n",
+			init_data.fwnode);
 
-	led_classdev_unregister(&lm36274_data->led_dev);
+	fwnode_handle_put(init_data.fwnode);
 
-	return 0;
+	return ret;
 }
 
 static const struct of_device_id of_lm36274_leds_match[] = {
@@ -167,7 +166,6 @@ MODULE_DEVICE_TABLE(of, of_lm36274_leds_match);
 
 static struct platform_driver lm36274_driver = {
 	.probe  = lm36274_probe,
-	.remove = lm36274_remove,
 	.driver = {
 		.name = "lm36274-leds",
 	},
-- 
2.26.2

