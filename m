Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9E626CF6C
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbgIPXRK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:17:10 -0400
Received: from mail.nic.cz ([217.31.204.67]:53892 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbgIPXRA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Sep 2020 19:17:00 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id EA474140A58;
        Thu, 17 Sep 2020 01:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298214; bh=hPnWGs2q5PFRo5FDwTXlR9YN6IAg3hwXMFWRWoJSnvc=;
        h=From:To:Date;
        b=EI53iMGNI6kRO/PcvRoJNCNao/x5RKaRi3VBpA0VwTviaMUg/ssKNiJr6tvbrtY6J
         Tte//AH6K9oebIwxUEXa7DgAosjiqJS/OUXuVs/vpyTR05jdJV8JklzVdMZV/3DfNQ
         a7V0QBoMEgyGIA3xJAKkni0ZJbARJLRFrW5NLcVc=
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
Subject: [PATCH leds v1 10/10] leds: ns2: refactor and use struct led_init_data
Date:   Thu, 17 Sep 2020 01:16:50 +0200
Message-Id: <20200916231650.11484-11-marek.behun@nic.cz>
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

Also, move forward from platform data to device tree only:
since commit c7896490dd1a ("leds: ns2: Absorb platform data") the
platform data structure is absorbed into the driver, because nothing
else in the source tree used it. Since nobody complained and all usage
of this driver is via device tree, refactor the code to work with
device tree only. As Linus Walleij wrote, the device tree should be the
way forward anyway.

Also build this driver if COMPILE_TEST is enabled.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig    |   2 +-
 drivers/leds/leds-ns2.c | 361 ++++++++++++----------------------------
 2 files changed, 112 insertions(+), 251 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4f6464a169d57..58c33636afdbf 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -644,7 +644,7 @@ config LEDS_MC13783
 config LEDS_NS2
 	tristate "LED support for Network Space v2 GPIO LEDs"
 	depends on LEDS_CLASS
-	depends on MACH_KIRKWOOD || MACH_ARMADA_370
+	depends on MACH_KIRKWOOD || MACH_ARMADA_370 || COMPILE_TEST
 	default y
 	help
 	  This option enables support for the dual-GPIO LEDs found on the
diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index bd806e7c8017b..6a5d326c5bddc 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -30,20 +30,6 @@ struct ns2_led_modval {
 	int			slow_level;
 };
 
-struct ns2_led {
-	const char	*name;
-	const char	*default_trigger;
-	struct gpio_desc *cmd;
-	struct gpio_desc *slow;
-	int		num_modes;
-	struct ns2_led_modval *modval;
-};
-
-struct ns2_led_platform_data {
-	int		num_leds;
-	struct ns2_led	*leds;
-};
-
 /*
  * The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
  * modes are available: off, on and SATA activity blinking. The LED modes are
@@ -51,7 +37,7 @@ struct ns2_led_platform_data {
  * for the command/slow GPIOs corresponds to a LED mode.
  */
 
-struct ns2_led_data {
+struct ns2_led {
 	struct led_classdev	cdev;
 	struct gpio_desc	*cmd;
 	struct gpio_desc	*slow;
@@ -62,95 +48,81 @@ struct ns2_led_data {
 	struct ns2_led_modval	*modval;
 };
 
-static int ns2_led_get_mode(struct ns2_led_data *led_dat,
-			    enum ns2_led_modes *mode)
+static int ns2_led_get_mode(struct ns2_led *led, enum ns2_led_modes *mode)
 {
-	int i;
-	int ret = -EINVAL;
-	int cmd_level;
-	int slow_level;
-
-	cmd_level = gpiod_get_value_cansleep(led_dat->cmd);
-	slow_level = gpiod_get_value_cansleep(led_dat->slow);
-
-	for (i = 0; i < led_dat->num_modes; i++) {
-		if (cmd_level == led_dat->modval[i].cmd_level &&
-		    slow_level == led_dat->modval[i].slow_level) {
-			*mode = led_dat->modval[i].mode;
-			ret = 0;
-			break;
+	int i, cmd_level, slow_level;
+
+	cmd_level = gpiod_get_value_cansleep(led->cmd);
+	slow_level = gpiod_get_value_cansleep(led->slow);
+
+	for (i = 0; i < led->num_modes; i++) {
+		if (cmd_level == led->modval[i].cmd_level &&
+		    slow_level == led->modval[i].slow_level) {
+			*mode = led->modval[i].mode;
+			return 0;
 		}
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
-static void ns2_led_set_mode(struct ns2_led_data *led_dat,
-			     enum ns2_led_modes mode)
+static void ns2_led_set_mode(struct ns2_led *led, enum ns2_led_modes mode)
 {
 	int i;
-	bool found = false;
 	unsigned long flags;
 
-	for (i = 0; i < led_dat->num_modes; i++)
-		if (mode == led_dat->modval[i].mode) {
-			found = true;
+	for (i = 0; i < led->num_modes; i++)
+		if (mode == led->modval[i].mode)
 			break;
-		}
 
-	if (!found)
+	if (i == led->num_modes)
 		return;
 
-	write_lock_irqsave(&led_dat->rw_lock, flags);
+	write_lock_irqsave(&led->rw_lock, flags);
 
-	if (!led_dat->can_sleep) {
-		gpiod_set_value(led_dat->cmd,
-				led_dat->modval[i].cmd_level);
-		gpiod_set_value(led_dat->slow,
-				led_dat->modval[i].slow_level);
+	if (!led->can_sleep) {
+		gpiod_set_value(led->cmd, led->modval[i].cmd_level);
+		gpiod_set_value(led->slow, led->modval[i].slow_level);
 		goto exit_unlock;
 	}
 
-	gpiod_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
-	gpiod_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
+	gpiod_set_value_cansleep(led->cmd, led->modval[i].cmd_level);
+	gpiod_set_value_cansleep(led->slow, led->modval[i].slow_level);
 
 exit_unlock:
-	write_unlock_irqrestore(&led_dat->rw_lock, flags);
+	write_unlock_irqrestore(&led->rw_lock, flags);
 }
 
 static void ns2_led_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
-	struct ns2_led_data *led_dat =
-		container_of(led_cdev, struct ns2_led_data, cdev);
+	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
 	enum ns2_led_modes mode;
 
 	if (value == LED_OFF)
 		mode = NS_V2_LED_OFF;
-	else if (led_dat->sata)
+	else if (led->sata)
 		mode = NS_V2_LED_SATA;
 	else
 		mode = NS_V2_LED_ON;
 
-	ns2_led_set_mode(led_dat, mode);
+	ns2_led_set_mode(led, mode);
 }
 
 static int ns2_led_set_blocking(struct led_classdev *led_cdev,
-			enum led_brightness value)
+				enum led_brightness value)
 {
 	ns2_led_set(led_cdev, value);
 	return 0;
 }
 
-static ssize_t ns2_led_sata_store(struct device *dev,
-				  struct device_attribute *attr,
-				  const char *buff, size_t count)
+static ssize_t sata_store(struct device *dev, struct device_attribute *attr,
+			  const char *buff, size_t count)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct ns2_led_data *led_dat =
-		container_of(led_cdev, struct ns2_led_data, cdev);
-	int ret;
+	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
 	unsigned long enable;
+	int ret;
 
 	ret = kstrtoul(buff, 10, &enable);
 	if (ret < 0)
@@ -158,34 +130,33 @@ static ssize_t ns2_led_sata_store(struct device *dev,
 
 	enable = !!enable;
 
-	if (led_dat->sata == enable)
+	if (led->sata == enable)
 		goto exit;
 
-	led_dat->sata = enable;
+	led->sata = enable;
 
 	if (!led_get_brightness(led_cdev))
 		goto exit;
 
 	if (enable)
-		ns2_led_set_mode(led_dat, NS_V2_LED_SATA);
+		ns2_led_set_mode(led, NS_V2_LED_SATA);
 	else
-		ns2_led_set_mode(led_dat, NS_V2_LED_ON);
+		ns2_led_set_mode(led, NS_V2_LED_ON);
 
 exit:
 	return count;
 }
 
-static ssize_t ns2_led_sata_show(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+static ssize_t sata_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct ns2_led_data *led_dat =
-		container_of(led_cdev, struct ns2_led_data, cdev);
+	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
 
-	return sprintf(buf, "%d\n", led_dat->sata);
+	return sprintf(buf, "%d\n", led->sata);
 }
 
-static DEVICE_ATTR(sata, 0644, ns2_led_sata_show, ns2_led_sata_store);
+static DEVICE_ATTR_RW(sata);
 
 static struct attribute *ns2_led_attrs[] = {
 	&dev_attr_sata.attr,
@@ -193,147 +164,101 @@ static struct attribute *ns2_led_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ns2_led);
 
-static int
-create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
-	       const struct ns2_led *template)
+static int ns2_led_register(struct device *dev, struct ns2_led *led,
+			    struct device_node *np)
 {
-	int ret;
+	struct led_init_data init_data = {};
+	struct ns2_led_modval *modval;
 	enum ns2_led_modes mode;
+	int ret, nmodes, i;
+
+	led->cmd = devm_gpiod_get_from_of_node(dev, np, "cmd-gpio", 0,
+					       GPIOD_ASIS, np->name);
+	if (IS_ERR(led->cmd))
+		return PTR_ERR(led->cmd);
+
+	led->slow = devm_gpiod_get_from_of_node(dev, np, "slow-gpio", 0,
+						GPIOD_ASIS, np->name);
+	if (IS_ERR(led->slow))
+		return PTR_ERR(led->slow);
+
+	ret = of_property_count_u32_elems(np, "modes-map");
+	if (ret <= 0 || ret % 3) {
+		dev_err(dev, "Missing or malformed modes-map in node %pOF\n",
+			np);
+		return ret < 0 ? ret : -EINVAL;
+	}
+
+	nmodes = ret / 3;
+	modval = devm_kcalloc(dev, nmodes, sizeof(*modval), GFP_KERNEL);
+	if (!modval)
+		return -ENOMEM;
+
+	for (i = 0; i < nmodes; ++i) {
+		u32 val;
+
+		of_property_read_u32_index(np, "modes-map", 3 * i, &val);
+		modval[i].mode = val;
+		of_property_read_u32_index(np, "modes-map", 3 * i + 1, &val);
+		modval[i].cmd_level = val;
+		of_property_read_u32_index(np, "modes-map", 3 * i + 2, &val);
+		modval[i].slow_level = val;
+	}
+
+	led->num_modes = nmodes;
+	led->modval = modval;
 
-	rwlock_init(&led_dat->rw_lock);
-
-	led_dat->cdev.name = template->name;
-	led_dat->cdev.default_trigger = template->default_trigger;
-	led_dat->cdev.blink_set = NULL;
-	led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
-	led_dat->cdev.groups = ns2_led_groups;
-	led_dat->cmd = template->cmd;
-	led_dat->slow = template->slow;
-	led_dat->can_sleep = gpiod_cansleep(led_dat->cmd) |
-				gpiod_cansleep(led_dat->slow);
-	if (led_dat->can_sleep)
-		led_dat->cdev.brightness_set_blocking = ns2_led_set_blocking;
+	rwlock_init(&led->rw_lock);
+
+	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev.groups = ns2_led_groups;
+	led->can_sleep = gpiod_cansleep(led->cmd) || gpiod_cansleep(led->slow);
+	if (led->can_sleep)
+		led->cdev.brightness_set_blocking = ns2_led_set_blocking;
 	else
-		led_dat->cdev.brightness_set = ns2_led_set;
-	led_dat->modval = template->modval;
-	led_dat->num_modes = template->num_modes;
+		led->cdev.brightness_set = ns2_led_set;
 
-	ret = ns2_led_get_mode(led_dat, &mode);
+	ret = ns2_led_get_mode(led, &mode);
 	if (ret < 0)
 		return ret;
 
 	/* Set LED initial state. */
-	led_dat->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
-	led_dat->cdev.brightness =
-		(mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
+	led->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
+	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
 
-	ret = led_classdev_register(&pdev->dev, &led_dat->cdev);
-	if (ret < 0)
-		return ret;
+	init_data.fwnode = of_fwnode_handle(np);
 
-	return 0;
-}
+	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+	if (ret < 0)
+		dev_err(dev, "Failed to register LED for node %pOF\n", np);
 
-static void delete_ns2_led(struct ns2_led_data *led_dat)
-{
-	led_classdev_unregister(&led_dat->cdev);
+	return ret;
 }
 
-#ifdef CONFIG_OF_GPIO
-/*
- * Translate OpenFirmware node properties into platform_data.
- */
-static int
-ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
+static int ns2_led_probe(struct platform_device *pdev)
 {
-	struct device_node *np = dev->of_node;
+	struct device *dev = &pdev->dev;
 	struct device_node *child;
-	struct ns2_led *led, *leds;
-	int ret, num_leds = 0;
+	struct ns2_led *leds;
+	int count, ret;
 
-	num_leds = of_get_child_count(np);
-	if (!num_leds)
+	count = device_get_child_node_count(dev);
+	if (count < 1) {
+		dev_err(dev, "Device has no child nodes\n");
 		return -ENODEV;
+	}
 
-	leds = devm_kcalloc(dev, num_leds, sizeof(struct ns2_led),
-			    GFP_KERNEL);
+	leds = devm_kzalloc(dev, array_size(count, sizeof(*leds)), GFP_KERNEL);
 	if (!leds)
 		return -ENOMEM;
 
-	led = leds;
-	for_each_child_of_node(np, child) {
-		const char *string;
-		int i, num_modes;
-		struct ns2_led_modval *modval;
-		struct gpio_desc *gd;
-
-		ret = of_property_read_string(child, "label", &string);
-		led->name = (ret == 0) ? string : child->name;
-
-		gd = gpiod_get_from_of_node(child, "cmd-gpio", 0,
-					    GPIOD_ASIS, led->name);
-		if (IS_ERR(gd)) {
-			ret = PTR_ERR(gd);
-			goto err_node_put;
-		}
-		led->cmd = gd;
-		gd = gpiod_get_from_of_node(child, "slow-gpio", 0,
-					    GPIOD_ASIS, led->name);
-		if (IS_ERR(gd)) {
-			ret = PTR_ERR(gd);
-			goto err_node_put;
-		}
-		led->slow = gd;
-
-		ret = of_property_read_string(child, "linux,default-trigger",
-					      &string);
-		if (ret == 0)
-			led->default_trigger = string;
-
-		ret = of_property_count_u32_elems(child, "modes-map");
-		if (ret < 0 || ret % 3) {
-			dev_err(dev,
-				"Missing or malformed modes-map property\n");
-			ret = -EINVAL;
-			goto err_node_put;
-		}
-
-		num_modes = ret / 3;
-		modval = devm_kcalloc(dev,
-				      num_modes,
-				      sizeof(struct ns2_led_modval),
-				      GFP_KERNEL);
-		if (!modval) {
-			ret = -ENOMEM;
-			goto err_node_put;
-		}
-
-		for (i = 0; i < num_modes; i++) {
-			of_property_read_u32_index(child,
-						"modes-map", 3 * i,
-						(u32 *) &modval[i].mode);
-			of_property_read_u32_index(child,
-						"modes-map", 3 * i + 1,
-						(u32 *) &modval[i].cmd_level);
-			of_property_read_u32_index(child,
-						"modes-map", 3 * i + 2,
-						(u32 *) &modval[i].slow_level);
-		}
-
-		led->num_modes = num_modes;
-		led->modval = modval;
-
-		led++;
+	for_each_available_child_of_node(dev_of_node(dev), child) {
+		ret = ns2_led_register(dev, leds++, child);
+		if (ret)
+			return ret;
 	}
 
-	pdata->leds = leds;
-	pdata->num_leds = num_leds;
-
 	return 0;
-
-err_node_put:
-	of_node_put(child);
-	return ret;
 }
 
 static const struct of_device_id of_ns2_leds_match[] = {
@@ -341,73 +266,9 @@ static const struct of_device_id of_ns2_leds_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
-#endif /* CONFIG_OF_GPIO */
-
-struct ns2_led_priv {
-	int num_leds;
-	struct ns2_led_data leds_data[];
-};
-
-static int ns2_led_probe(struct platform_device *pdev)
-{
-	struct ns2_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct ns2_led_priv *priv;
-	int i;
-	int ret;
-
-#ifdef CONFIG_OF_GPIO
-	if (!pdata) {
-		pdata = devm_kzalloc(&pdev->dev,
-				     sizeof(struct ns2_led_platform_data),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
-		ret = ns2_leds_get_of_pdata(&pdev->dev, pdata);
-		if (ret)
-			return ret;
-	}
-#else
-	if (!pdata)
-		return -EINVAL;
-#endif /* CONFIG_OF_GPIO */
-
-	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds_data, pdata->num_leds), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-	priv->num_leds = pdata->num_leds;
-
-	for (i = 0; i < priv->num_leds; i++) {
-		ret = create_ns2_led(pdev, &priv->leds_data[i],
-				     &pdata->leds[i]);
-		if (ret < 0) {
-			for (i = i - 1; i >= 0; i--)
-				delete_ns2_led(&priv->leds_data[i]);
-			return ret;
-		}
-	}
-
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
-}
-
-static int ns2_led_remove(struct platform_device *pdev)
-{
-	int i;
-	struct ns2_led_priv *priv;
-
-	priv = platform_get_drvdata(pdev);
-
-	for (i = 0; i < priv->num_leds; i++)
-		delete_ns2_led(&priv->leds_data[i]);
-
-	return 0;
-}
 
 static struct platform_driver ns2_led_driver = {
 	.probe		= ns2_led_probe,
-	.remove		= ns2_led_remove,
 	.driver		= {
 		.name		= "leds-ns2",
 		.of_match_table	= of_match_ptr(of_ns2_leds_match),
-- 
2.26.2

