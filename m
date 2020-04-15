Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6FB1AAB05
	for <lists+linux-leds@lfdr.de>; Wed, 15 Apr 2020 17:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408866AbgDOOxt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Apr 2020 10:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407866AbgDOOxq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Apr 2020 10:53:46 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ED5C061A0C
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 07:53:45 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r24so4010765ljd.4
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGAp2DeBMo7UFxMwTS+22jVrCQrIg3mgc0Mp6iLCxX0=;
        b=oACkeqtY1xxCNJlUtlFf6b5EQSTbPuLs6uRgRUpwc2qI9JD8IRwgAVAV8l0g1lA9E+
         vVop4hNcmMteAJu48RacTRduFWMA2stV6YCQaS1+lkfsj2MW0sY840Wdb7035H241hYQ
         EdQKM+ijMULczYS9pXmPRbmnYrUnWRBWjBr0/tKbLk9QDUspP8Uf3YC5CEEI5RYyhTcK
         meOxvdsTgAi11cChhz9s8hfHMC0ohHHqkvGRf8ROGxgXpsxrBXnUsOr+44J6cnMtwNbK
         dmSwKSkr5beLpQqIy80HDfZGrjshrzWEqQIYFbOAVwqqOdS/NKB4mr4vOVGvQfsJWKUE
         wklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGAp2DeBMo7UFxMwTS+22jVrCQrIg3mgc0Mp6iLCxX0=;
        b=Ld9fENk9A3rRqDRzoh91gYDmbSeRQLVlaP2rUfR6cYBnkTSA0lx3r+U34JbZpEMx/1
         yKm8WccyPWMsZa91Ig+7wDpn6zV7y1NP1g3Yb/ObGyV/fo5QGaskCUUqqE2oEcmFoVeK
         sN7AUP8mpDlPujlde/J5xPTcxbndOrB0pha+nPAwogjF0y2nIBy3rSWbo+mZzrb6B6ZZ
         NR7HV+tYaxY+vfUIExiKmGOG7w+Ihf8JITT/NpAPxonMBhFpkz5SjwzlpjANSvasz134
         702DIr6o+fanCt8yjtzX9lxFkHV3tu+hWN663Q29k1aBLIJonpafvkx9sXI6b8R0YlAw
         YSFg==
X-Gm-Message-State: AGi0PuaC6JSnZsNBTQ1yxKdvWpfhPn/BpduLcP6ZzzNGWf6bxNBDfnAb
        Q42tVgwasMsTFvssng6XXIBi6A==
X-Google-Smtp-Source: APiQypIWY9YiZy75vyQjiObOzikRx98eIJIYSpckh6Hp6l+oRCV4SwAuTwaprUF5ipMQFVPrlkSUOw==
X-Received: by 2002:a2e:1616:: with SMTP id w22mr2704277ljd.261.1586962424289;
        Wed, 15 Apr 2020 07:53:44 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id b16sm11601987ljh.20.2020.04.15.07.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 07:53:43 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH] leds: netxbig: Convert to use GPIO descriptors
Date:   Wed, 15 Apr 2020 16:51:39 +0200
Message-Id: <20200415145139.155663-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This converts the NetXbig LED driver to use GPIO descriptors
instead of using the legacy interfaces in <linux/of_gpio.h>
and <linux/gpio.h> to iteratively parse the device tree for
global GPIO numbers.

Cc: Simon Guinot <simon.guinot@sequanux.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-netxbig.c | 148 ++++++++++++++++++++----------------
 1 file changed, 81 insertions(+), 67 deletions(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 14ef4ccdda3a..ceceeb6a0e96 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -12,16 +12,17 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/leds.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 
 struct netxbig_gpio_ext {
-	unsigned int	*addr;
+	struct gpio_desc **addr;
 	int		num_addr;
-	unsigned int	*data;
+	struct gpio_desc **data;
 	int		num_data;
-	unsigned int	enable;
+	struct gpio_desc *enable;
 };
 
 enum netxbig_led_mode {
@@ -69,7 +70,7 @@ static void gpio_ext_set_addr(struct netxbig_gpio_ext *gpio_ext, int addr)
 	int pin;
 
 	for (pin = 0; pin < gpio_ext->num_addr; pin++)
-		gpio_set_value(gpio_ext->addr[pin], (addr >> pin) & 1);
+		gpiod_set_value(gpio_ext->addr[pin], (addr >> pin) & 1);
 }
 
 static void gpio_ext_set_data(struct netxbig_gpio_ext *gpio_ext, int data)
@@ -77,14 +78,14 @@ static void gpio_ext_set_data(struct netxbig_gpio_ext *gpio_ext, int data)
 	int pin;
 
 	for (pin = 0; pin < gpio_ext->num_data; pin++)
-		gpio_set_value(gpio_ext->data[pin], (data >> pin) & 1);
+		gpiod_set_value(gpio_ext->data[pin], (data >> pin) & 1);
 }
 
 static void gpio_ext_enable_select(struct netxbig_gpio_ext *gpio_ext)
 {
 	/* Enable select is done on the raising edge. */
-	gpio_set_value(gpio_ext->enable, 0);
-	gpio_set_value(gpio_ext->enable, 1);
+	gpiod_set_value(gpio_ext->enable, 0);
+	gpiod_set_value(gpio_ext->enable, 1);
 }
 
 static void gpio_ext_set_value(struct netxbig_gpio_ext *gpio_ext,
@@ -99,41 +100,6 @@ static void gpio_ext_set_value(struct netxbig_gpio_ext *gpio_ext,
 	spin_unlock_irqrestore(&gpio_ext_lock, flags);
 }
 
-static int gpio_ext_init(struct platform_device *pdev,
-			 struct netxbig_gpio_ext *gpio_ext)
-{
-	int err;
-	int i;
-
-	if (unlikely(!gpio_ext))
-		return -EINVAL;
-
-	/* Configure address GPIOs. */
-	for (i = 0; i < gpio_ext->num_addr; i++) {
-		err = devm_gpio_request_one(&pdev->dev, gpio_ext->addr[i],
-					    GPIOF_OUT_INIT_LOW,
-					    "GPIO extension addr");
-		if (err)
-			return err;
-	}
-	/* Configure data GPIOs. */
-	for (i = 0; i < gpio_ext->num_data; i++) {
-		err = devm_gpio_request_one(&pdev->dev, gpio_ext->data[i],
-					    GPIOF_OUT_INIT_LOW,
-					    "GPIO extension data");
-		if (err)
-			return err;
-	}
-	/* Configure "enable select" GPIO. */
-	err = devm_gpio_request_one(&pdev->dev, gpio_ext->enable,
-				    GPIOF_OUT_INIT_LOW,
-				    "GPIO extension enable");
-	if (err)
-		return err;
-
-	return 0;
-}
-
 /*
  * Class LED driver.
  */
@@ -347,15 +313,47 @@ static int create_netxbig_led(struct platform_device *pdev,
 	return devm_led_classdev_register(&pdev->dev, &led_dat->cdev);
 }
 
-static int gpio_ext_get_of_pdata(struct device *dev, struct device_node *np,
-				 struct netxbig_gpio_ext *gpio_ext)
+/**
+ * netxbig_gpio_ext_remove() - Clean up GPIO extension data
+ * @data: managed resource data to clean up
+ *
+ * Since we pick GPIO descriptors from another device than the device our
+ * driver is probing to, we need to register a specific callback to free
+ * these up using managed resources.
+ */
+static void netxbig_gpio_ext_remove(void *data)
+{
+	struct netxbig_gpio_ext *gpio_ext = data;
+	int i;
+
+	for (i = 0; i < gpio_ext->num_addr; i++)
+		gpiod_put(gpio_ext->addr[i]);
+	for (i = 0; i < gpio_ext->num_data; i++)
+		gpiod_put(gpio_ext->data[i]);
+	gpiod_put(gpio_ext->enable);
+}
+
+/**
+ * netxbig_gpio_ext_get() - Obtain GPIO extension device data
+ * @dev: main LED device
+ * @gpio_ext_dev: the GPIO extension device
+ * @gpio_ext: the data structure holding the GPIO extension data
+ *
+ * This function walks the subdevice that only contain GPIO line
+ * handles in the device tree and obtains the GPIO descriptors from that
+ * device.
+ */
+static int netxbig_gpio_ext_get(struct device *dev,
+				struct device *gpio_ext_dev,
+				struct netxbig_gpio_ext *gpio_ext)
 {
-	int *addr, *data;
+	struct gpio_desc **addr, **data;
 	int num_addr, num_data;
+	struct gpio_desc *gpiod;
 	int ret;
 	int i;
 
-	ret = of_gpio_named_count(np, "addr-gpios");
+	ret = gpiod_count(gpio_ext_dev, "addr");
 	if (ret < 0) {
 		dev_err(dev,
 			"Failed to count GPIOs in DT property addr-gpios\n");
@@ -366,16 +364,25 @@ static int gpio_ext_get_of_pdata(struct device *dev, struct device_node *np,
 	if (!addr)
 		return -ENOMEM;
 
+	/*
+	 * We cannot use devm_ managed resources with these GPIO descriptors
+	 * since they are associated with the "GPIO extension device" which
+	 * does not probe any driver. The device tree parser will however
+	 * populate a platform device for it so we can anyway obtain the
+	 * GPIO descriptors from the device.
+	 */
 	for (i = 0; i < num_addr; i++) {
-		ret = of_get_named_gpio(np, "addr-gpios", i);
-		if (ret < 0)
-			return ret;
-		addr[i] = ret;
+		gpiod = gpiod_get_index(gpio_ext_dev, "addr", i,
+					GPIOD_OUT_LOW);
+		if (IS_ERR(gpiod))
+			return PTR_ERR(gpiod);
+		gpiod_set_consumer_name(gpiod, "GPIO extension addr");
+		addr[i] = gpiod;
 	}
 	gpio_ext->addr = addr;
 	gpio_ext->num_addr = num_addr;
 
-	ret = of_gpio_named_count(np, "data-gpios");
+	ret = gpiod_count(gpio_ext_dev, "data");
 	if (ret < 0) {
 		dev_err(dev,
 			"Failed to count GPIOs in DT property data-gpios\n");
@@ -387,23 +394,26 @@ static int gpio_ext_get_of_pdata(struct device *dev, struct device_node *np,
 		return -ENOMEM;
 
 	for (i = 0; i < num_data; i++) {
-		ret = of_get_named_gpio(np, "data-gpios", i);
-		if (ret < 0)
-			return ret;
-		data[i] = ret;
+		gpiod = gpiod_get_index(gpio_ext_dev, "data", i,
+					GPIOD_OUT_LOW);
+		if (IS_ERR(gpiod))
+			return PTR_ERR(gpiod);
+		gpiod_set_consumer_name(gpiod, "GPIO extension data");
+		data[i] = gpiod;
 	}
 	gpio_ext->data = data;
 	gpio_ext->num_data = num_data;
 
-	ret = of_get_named_gpio(np, "enable-gpio", 0);
-	if (ret < 0) {
+	gpiod = gpiod_get(gpio_ext_dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod)) {
 		dev_err(dev,
 			"Failed to get GPIO from DT property enable-gpio\n");
-		return ret;
+		return PTR_ERR(gpiod);
 	}
-	gpio_ext->enable = ret;
+	gpiod_set_consumer_name(gpiod, "GPIO extension enable");
+	gpio_ext->enable = gpiod;
 
-	return 0;
+	return devm_add_action_or_reset(dev, netxbig_gpio_ext_remove, gpio_ext);
 }
 
 static int netxbig_leds_get_of_pdata(struct device *dev,
@@ -411,6 +421,8 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 {
 	struct device_node *np = dev->of_node;
 	struct device_node *gpio_ext_np;
+	struct platform_device *gpio_ext_pdev;
+	struct device *gpio_ext_dev;
 	struct device_node *child;
 	struct netxbig_gpio_ext *gpio_ext;
 	struct netxbig_led_timer *timers;
@@ -426,13 +438,19 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 		dev_err(dev, "Failed to get DT handle gpio-ext\n");
 		return -EINVAL;
 	}
+	gpio_ext_pdev = of_find_device_by_node(gpio_ext_np);
+	if (!gpio_ext_pdev) {
+		dev_err(dev, "Failed to find platform device for gpio-ext\n");
+		return -ENODEV;
+	}
+	gpio_ext_dev = &gpio_ext_pdev->dev;
 
 	gpio_ext = devm_kzalloc(dev, sizeof(*gpio_ext), GFP_KERNEL);
 	if (!gpio_ext) {
 		of_node_put(gpio_ext_np);
 		return -ENOMEM;
 	}
-	ret = gpio_ext_get_of_pdata(dev, gpio_ext_np, gpio_ext);
+	ret = netxbig_gpio_ext_get(dev, gpio_ext_dev, gpio_ext);
 	of_node_put(gpio_ext_np);
 	if (ret)
 		return ret;
@@ -585,10 +603,6 @@ static int netxbig_led_probe(struct platform_device *pdev)
 	if (!leds_data)
 		return -ENOMEM;
 
-	ret = gpio_ext_init(pdev, pdata->gpio_ext);
-	if (ret < 0)
-		return ret;
-
 	for (i = 0; i < pdata->num_leds; i++) {
 		ret = create_netxbig_led(pdev, pdata,
 					 &leds_data[i], &pdata->leds[i]);
-- 
2.25.2

