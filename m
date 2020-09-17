Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FDB26E88B
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgIQWef (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:35 -0400
Received: from lists.nic.cz ([217.31.204.67]:35722 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbgIQWeT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:19 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id C2314142068;
        Fri, 18 Sep 2020 00:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382041; bh=bWBxtm/Bkw8TBL9pw+a5KOewdNkZWECN0cSyuzsW+vs=;
        h=From:To:Date;
        b=Wp5Vk+SLjrRyG5OiBklZYz/Z1LkDEJYnVM7evRHBzpabPfATpT9B3S3UWKyGnIhce
         hwpKBuVJDlt3aaAJswHy+M2YaG3D+18K56oWIexcMFM3TzUniPslbhp8x3Zgvc0wrl
         4yoTPAYm4Td+8m9nC4pzmdCKXfHBAe03I/7LzbRg=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH leds v2 45/50] leds: ns2: register LED immediately after parsing DT properties
Date:   Fri, 18 Sep 2020 00:33:33 +0200
Message-Id: <20200917223338.14164-46-marek.behun@nic.cz>
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

Register each LED immediately after parsing OF properties. This
simplifies the driver.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 143 +++++++++++-----------------------------
 1 file changed, 40 insertions(+), 103 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 801b7f851be7a..9d9c9ff4dce61 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -30,20 +30,6 @@ struct ns2_led_modval {
 	int			slow_level;
 };
 
-struct ns2_led_of_one {
-	const char	*name;
-	const char	*default_trigger;
-	struct gpio_desc *cmd;
-	struct gpio_desc *slow;
-	int		num_modes;
-	struct ns2_led_modval *modval;
-};
-
-struct ns2_led_of {
-	int			num_leds;
-	struct ns2_led_of_one	*leds;
-};
-
 /*
  * The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
  * modes are available: off, on and SATA activity blinking. The LED modes are
@@ -184,63 +170,29 @@ static struct attribute *ns2_led_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ns2_led);
 
-static int
-create_ns2_led(struct device *dev, struct ns2_led *led,
-	       const struct ns2_led_of_one *template)
-{
-	int ret;
-	enum ns2_led_modes mode;
-
-	rwlock_init(&led->rw_lock);
-
-	led->cdev.name = template->name;
-	led->cdev.default_trigger = template->default_trigger;
-	led->cdev.blink_set = NULL;
-	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
-	led->cdev.groups = ns2_led_groups;
-	led->cmd = template->cmd;
-	led->slow = template->slow;
-	led->can_sleep = gpiod_cansleep(led->cmd) | gpiod_cansleep(led->slow);
-	if (led->can_sleep)
-		led->cdev.brightness_set_blocking = ns2_led_set_blocking;
-	else
-		led->cdev.brightness_set = ns2_led_set;
-	led->modval = template->modval;
-	led->num_modes = template->num_modes;
-
-	ret = ns2_led_get_mode(led, &mode);
-	if (ret < 0)
-		return ret;
-
-	/* Set LED initial state. */
-	led->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
-	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
-
-	return devm_led_classdev_register(dev, &led->cdev);
-}
-
-static int ns2_leds_parse_one(struct device *dev, struct device_node *np,
-			      struct ns2_led_of_one *led)
+static int ns2_led_register(struct device *dev, struct device_node *np,
+			    struct ns2_led *led)
 {
 	struct ns2_led_modval *modval;
+	enum ns2_led_modes mode;
 	int nmodes, ret, i;
 
-	ret = of_property_read_string(np, "label", &led->name);
+	ret = of_property_read_string(np, "label", &led->cdev.name);
 	if (ret)
-		led->name = np->name;
+		led->cdev.name = np->name;
 
 	led->cmd = devm_gpiod_get_from_of_node(dev, np, "cmd-gpio", 0,
-					       GPIOD_ASIS, led->name);
+					       GPIOD_ASIS, np->name);
 	if (IS_ERR(led->cmd))
 		return PTR_ERR(led->cmd);
 
 	led->slow = devm_gpiod_get_from_of_node(dev, np, "slow-gpio", 0,
-						GPIOD_ASIS, led->name);
+						GPIOD_ASIS, np->name);
 	if (IS_ERR(led->slow))
 		return PTR_ERR(led->slow);
 
 	of_property_read_string(np, "linux,default-trigger",
-				&led->default_trigger);
+				&led->cdev.default_trigger);
 
 	ret = of_property_count_u32_elems(np, "modes-map");
 	if (ret < 0 || ret % 3) {
@@ -264,45 +216,32 @@ static int ns2_leds_parse_one(struct device *dev, struct device_node *np,
 		modval[i].slow_level = val;
 	}
 
+	rwlock_init(&led->rw_lock);
+
+	led->cdev.blink_set = NULL;
+	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev.groups = ns2_led_groups;
+	led->can_sleep = gpiod_cansleep(led->cmd) || gpiod_cansleep(led->slow);
+	if (led->can_sleep)
+		led->cdev.brightness_set_blocking = ns2_led_set_blocking;
+	else
+		led->cdev.brightness_set = ns2_led_set;
 	led->num_modes = nmodes;
 	led->modval = modval;
 
-	return 0;
-}
-
-/*
- * Translate OpenFirmware node properties into platform_data.
- */
-static int
-ns2_leds_parse_of(struct device *dev, struct ns2_led_of *ofdata)
-{
-	struct device_node *np = dev_of_node(dev);
-	struct device_node *child;
-	struct ns2_led_of_one *led, *leds;
-	int ret, num_leds = 0;
-
-	num_leds = of_get_available_child_count(np);
-	if (!num_leds)
-		return -ENODEV;
-
-	leds = devm_kcalloc(dev, num_leds, sizeof(struct ns2_led),
-			    GFP_KERNEL);
-	if (!leds)
-		return -ENOMEM;
+	ret = ns2_led_get_mode(led, &mode);
+	if (ret < 0)
+		return ret;
 
-	led = leds;
-	for_each_available_child_of_node(np, child) {
-		ret = ns2_leds_parse_one(dev, child, led++);
-		if (ret < 0) {
-			of_node_put(child);
-			return ret;
-		}
-	}
+	/* Set LED initial state. */
+	led->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
+	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
 
-	ofdata->leds = leds;
-	ofdata->num_leds = num_leds;
+	ret = devm_led_classdev_register(dev, &led->cdev);
+	if (ret)
+		dev_err(dev, "Failed to register LED for node %pOF\n", np);
 
-	return 0;
+	return ret;
 }
 
 static const struct of_device_id of_ns2_leds_match[] = {
@@ -314,28 +253,26 @@ MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct ns2_led_of *ofdata;
+	struct device_node *np, *child;
 	struct ns2_led *leds;
-	int i;
+	int count;
 	int ret;
 
-	ofdata = devm_kzalloc(dev, sizeof(struct ns2_led_of), GFP_KERNEL);
-	if (!ofdata)
-		return -ENOMEM;
-
-	ret = ns2_leds_parse_of(dev, ofdata);
-	if (ret)
-		return ret;
+	np = dev_of_node(dev);
+	count = of_get_available_child_count(np);
+	if (!count)
+		return -ENODEV;
 
-	leds = devm_kzalloc(dev, array_size(sizeof(*leds), ofdata->num_leds),
-			    GFP_KERNEL);
+	leds = devm_kzalloc(dev, array_size(sizeof(*leds), count), GFP_KERNEL);
 	if (!leds)
 		return -ENOMEM;
 
-	for (i = 0; i < ofdata->num_leds; i++) {
-		ret = create_ns2_led(dev, &leds[i], &ofdata->leds[i]);
-		if (ret < 0)
+	for_each_available_child_of_node(np, child) {
+		ret = ns2_led_register(dev, child, leds++);
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.26.2

