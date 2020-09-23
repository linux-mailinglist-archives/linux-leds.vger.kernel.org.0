Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7C02759C4
	for <lists+linux-leds@lfdr.de>; Wed, 23 Sep 2020 16:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIWOS4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Sep 2020 10:18:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgIWOS4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 23 Sep 2020 10:18:56 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24638221F0;
        Wed, 23 Sep 2020 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600870735;
        bh=FcsnO6PyBoudYQAzXwnWp8mAPrJxFxfzKTF9+qpcm9c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qtl3lekT/uVpufERxJVnrQiVkGgG4jlnU+LffxM8/t/VgW+g0c28mVkiC6kH4umCK
         WcXULWb1kAPUAed3ygYwWgiCzfkPAtRqnVYeaK8R3bcSldeLQJ6iMYNrKgukWktQ2m
         bElBKQkhK7FGvfQmdTXGH5zpullCGJaY9vNrVpPA=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH leds 1/2] leds: ns2: convert to fwnode API
Date:   Wed, 23 Sep 2020 16:18:39 +0200
Message-Id: <20200923141840.6333-2-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200923141840.6333-1-kabel@kernel.org>
References: <20200923141840.6333-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert from OF api to fwnode API, so that it is possible to bind this
driver without device-tree.

The fwnode API does not expose a function to read a specific element of
an array. We therefore change the types of the ns2_led_modval structure
so that we can read the whole modval array with one fwnode call.

Signed-off-by: Marek Behún <kabel@kernel.org>
Cc: Simon Guinot <simon.guinot@sequanux.org>
---
 drivers/leds/leds-ns2.c | 60 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 030f426af3d75..427b5059206a5 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -24,11 +24,16 @@ enum ns2_led_modes {
 	NS_V2_LED_SATA,
 };
 
+/*
+ * If the size of this structure or types of its members is changed,
+ * the filling of array modval in function ns2_led_register must be changed
+ * accordingly.
+ */
 struct ns2_led_modval {
-	enum ns2_led_modes	mode;
-	int			cmd_level;
-	int			slow_level;
-};
+	u32			mode;
+	u32			cmd_level;
+	u32			slow_level;
+} __packed;
 
 /*
  * The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
@@ -167,30 +172,32 @@ static struct attribute *ns2_led_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ns2_led);
 
-static int ns2_led_register(struct device *dev, struct device_node *np,
+static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
 			    struct ns2_led *led)
 {
 	struct led_init_data init_data = {};
 	struct ns2_led_modval *modval;
 	enum ns2_led_modes mode;
-	int nmodes, ret, i;
+	int nmodes, ret;
 
-	led->cmd = devm_gpiod_get_from_of_node(dev, np, "cmd-gpio", 0,
-					       GPIOD_ASIS, np->name);
+	led->cmd = devm_fwnode_gpiod_get_index(dev, node, "cmd-gpio", 0,
+					       GPIOD_ASIS,
+					       fwnode_get_name(node));
 	if (IS_ERR(led->cmd))
 		return PTR_ERR(led->cmd);
 
-	led->slow = devm_gpiod_get_from_of_node(dev, np, "slow-gpio", 0,
-						GPIOD_ASIS, np->name);
+	led->slow = devm_fwnode_gpiod_get_index(dev, node, "slow-gpio", 0,
+						GPIOD_ASIS,
+						fwnode_get_name(node));
 	if (IS_ERR(led->slow))
 		return PTR_ERR(led->slow);
 
-	of_property_read_string(np, "linux,default-trigger",
-				&led->cdev.default_trigger);
+	fwnode_property_read_string(node, "linux,default-trigger",
+				    &led->cdev.default_trigger);
 
-	ret = of_property_count_u32_elems(np, "modes-map");
+	ret = fwnode_property_count_u32(node, "modes-map");
 	if (ret < 0 || ret % 3) {
-		dev_err(dev, "Missing or malformed modes-map for %pOF\n", np);
+		dev_err(dev, "Missing or malformed modes-map for %pfw\n", node);
 		return -EINVAL;
 	}
 
@@ -199,16 +206,8 @@ static int ns2_led_register(struct device *dev, struct device_node *np,
 	if (!modval)
 		return -ENOMEM;
 
-	for (i = 0; i < nmodes; i++) {
-		u32 val;
-
-		of_property_read_u32_index(np, "modes-map", 3 * i, &val);
-		modval[i].mode = val;
-		of_property_read_u32_index(np, "modes-map", 3 * i + 1, &val);
-		modval[i].cmd_level = val;
-		of_property_read_u32_index(np, "modes-map", 3 * i + 2, &val);
-		modval[i].slow_level = val;
-	}
+	fwnode_property_read_u32_array(node, "modes-map", (void *)modval,
+				       nmodes * 3);
 
 	rwlock_init(&led->rw_lock);
 
@@ -231,11 +230,11 @@ static int ns2_led_register(struct device *dev, struct device_node *np,
 	led->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
 	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
 
-	init_data.fwnode = of_fwnode_handle(np);
+	init_data.fwnode = node;
 
 	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (ret)
-		dev_err(dev, "Failed to register LED for node %pOF\n", np);
+		dev_err(dev, "Failed to register LED for node %pfw\n", node);
 
 	return ret;
 }
@@ -249,13 +248,12 @@ MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np, *child;
+	struct fwnode_handle *child;
 	struct ns2_led *leds;
 	int count;
 	int ret;
 
-	np = dev_of_node(dev);
-	count = of_get_available_child_count(np);
+	count = device_get_child_node_count(dev);
 	if (!count)
 		return -ENODEV;
 
@@ -263,10 +261,10 @@ static int ns2_led_probe(struct platform_device *pdev)
 	if (!leds)
 		return -ENOMEM;
 
-	for_each_available_child_of_node(np, child) {
+	device_for_each_child_node(dev, child) {
 		ret = ns2_led_register(dev, child, leds++);
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 	}
-- 
2.26.2

