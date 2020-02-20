Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091C916607D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 16:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgBTPIz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 10:08:55 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32813 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbgBTPIz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 10:08:55 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so4626719lji.0
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2020 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IwJwSh42Cild6bZLhBhdW4x7J4DWZwFYb0IHPfqQTfU=;
        b=MrmnwJrDBzUF1C+4+jUI4bQNkYE30Dh/qYuQWKXiA0EpcW4tAaSD1efQxVwi1z42cn
         QFG41drW8lvE4WmtYS4CN8VwvrhXyTroj4vsI90pLb9dYB0qCKYF4xwh9D/3wy/vMpuR
         SHL7xGTu01ssYSrgeQ0HCTUoU1Ou8hnueamE4xg5Pw4c7EW7Ap6HPcDLhqp08XpZcrIA
         NNcTsNuT593cnVhEv6q3Hz83eVSUcEpQQIdCqKM/cSUdhCp15mKR/A96S6UREjTy/yND
         hQq1QKhlplEKw3Qbk0q1FPOHVtuQXKLezyKJcpGs3IeYYeXVtZ8nOVorBrcz6A8jNlR+
         +gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IwJwSh42Cild6bZLhBhdW4x7J4DWZwFYb0IHPfqQTfU=;
        b=OtEqCSjGpjlXjMpRwm7AhAclYv547zC3TmAEFD0EY5Gy6nnbEkhXHrzCd509uuv5n6
         5VhnFKombkPN3UVH4Z58Xy4paMx5RwplgbBe7nDfz0Tkwq1JA104kGj+HkD0v3vRNrfo
         mrXZR7aRNGcnYx7stHos4ikVGnjZRMDSkUHYdZGzD4QRdq3AEMpWlHhuOfwNA9TF21nC
         iI2C4g7vo/OU2euwpYyTCWtnpMo7/AWY5X3eUsYfsoxaZbqNcOrHeHqAE923c9aruVHx
         VMOhOm6OVrA7jzsviss/QSUGeO5LIc3bxECQNpwBod99dpMuhzShgONhtmFQjP8ueCvr
         iNng==
X-Gm-Message-State: APjAAAVcQ1xhsen/bClO2xK1gNGUh6k2YHux7shU6K+usuQOrNBp+z4z
        Snpfy4sOPnFWZRJCNQnEWl2Shg==
X-Google-Smtp-Source: APXvYqxupKlwwqp6wX4ydOvtIWfbSUUTe+8zPMFmf0u5G1mvUzTOYtfYldxuFOsMYhX/0Ahqmdplww==
X-Received: by 2002:a2e:a553:: with SMTP id e19mr19019531ljn.64.1582211333009;
        Thu, 20 Feb 2020 07:08:53 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id q10sm1960004ljm.87.2020.02.20.07.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 07:08:51 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH 2/2 v3] leds: ns2: Convert to GPIO descriptors
Date:   Thu, 20 Feb 2020 16:08:33 +0100
Message-Id: <20200220150833.56542-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220150833.56542-1-linus.walleij@linaro.org>
References: <20200220150833.56542-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This converts the NS2 LED driver to use GPIO descriptors.
We take care to request the GPIOs "as is" which is what
the current driver goes to lengths to achieve, then we use
GPIOs throughout.

As the nodes for each LED does not have any corresponding
device, we need to use the DT-specific accessors to get these
GPIO descriptors from the device tree.

Cc: Vincent Donnefort <vdonnefort@gmail.com>
Tested-by: Simon Guinot <simon.guinot@sequanux.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Move the header inclusion changes from patch 1/2 into
  this patch.
ChangeLog v1->v2:
- Collected Simon's Tested-by tag.
---
 drivers/leds/leds-ns2.c | 76 +++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 44 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index aefac3461138..538ca5755602 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -12,11 +12,10 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include "leds.h"
 
 enum ns2_led_modes {
@@ -34,8 +33,8 @@ struct ns2_led_modval {
 struct ns2_led {
 	const char	*name;
 	const char	*default_trigger;
-	unsigned	cmd;
-	unsigned	slow;
+	struct gpio_desc *cmd;
+	struct gpio_desc *slow;
 	int		num_modes;
 	struct ns2_led_modval *modval;
 };
@@ -54,8 +53,8 @@ struct ns2_led_platform_data {
 
 struct ns2_led_data {
 	struct led_classdev	cdev;
-	unsigned int		cmd;
-	unsigned int		slow;
+	struct gpio_desc	*cmd;
+	struct gpio_desc	*slow;
 	bool			can_sleep;
 	unsigned char		sata; /* True when SATA mode active. */
 	rwlock_t		rw_lock; /* Lock GPIOs. */
@@ -71,8 +70,8 @@ static int ns2_led_get_mode(struct ns2_led_data *led_dat,
 	int cmd_level;
 	int slow_level;
 
-	cmd_level = gpio_get_value_cansleep(led_dat->cmd);
-	slow_level = gpio_get_value_cansleep(led_dat->slow);
+	cmd_level = gpiod_get_value_cansleep(led_dat->cmd);
+	slow_level = gpiod_get_value_cansleep(led_dat->slow);
 
 	for (i = 0; i < led_dat->num_modes; i++) {
 		if (cmd_level == led_dat->modval[i].cmd_level &&
@@ -105,15 +104,15 @@ static void ns2_led_set_mode(struct ns2_led_data *led_dat,
 	write_lock_irqsave(&led_dat->rw_lock, flags);
 
 	if (!led_dat->can_sleep) {
-		gpio_set_value(led_dat->cmd,
-			       led_dat->modval[i].cmd_level);
-		gpio_set_value(led_dat->slow,
-			       led_dat->modval[i].slow_level);
+		gpiod_set_value(led_dat->cmd,
+				led_dat->modval[i].cmd_level);
+		gpiod_set_value(led_dat->slow,
+				led_dat->modval[i].slow_level);
 		goto exit_unlock;
 	}
 
-	gpio_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
-	gpio_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
+	gpiod_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
+	gpiod_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
 
 exit_unlock:
 	write_unlock_irqrestore(&led_dat->rw_lock, flags);
@@ -201,26 +200,6 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	int ret;
 	enum ns2_led_modes mode;
 
-	ret = devm_gpio_request_one(&pdev->dev, template->cmd,
-			gpio_get_value_cansleep(template->cmd) ?
-			GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
-			template->name);
-	if (ret) {
-		dev_err(&pdev->dev, "%s: failed to setup command GPIO\n",
-			template->name);
-		return ret;
-	}
-
-	ret = devm_gpio_request_one(&pdev->dev, template->slow,
-			gpio_get_value_cansleep(template->slow) ?
-			GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
-			template->name);
-	if (ret) {
-		dev_err(&pdev->dev, "%s: failed to setup slow GPIO\n",
-			template->name);
-		return ret;
-	}
-
 	rwlock_init(&led_dat->rw_lock);
 
 	led_dat->cdev.name = template->name;
@@ -230,8 +209,8 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	led_dat->cdev.groups = ns2_led_groups;
 	led_dat->cmd = template->cmd;
 	led_dat->slow = template->slow;
-	led_dat->can_sleep = gpio_cansleep(led_dat->cmd) |
-				gpio_cansleep(led_dat->slow);
+	led_dat->can_sleep = gpiod_cansleep(led_dat->cmd) |
+				gpiod_cansleep(led_dat->slow);
 	if (led_dat->can_sleep)
 		led_dat->cdev.brightness_set_blocking = ns2_led_set_blocking;
 	else
@@ -286,17 +265,26 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 		const char *string;
 		int i, num_modes;
 		struct ns2_led_modval *modval;
+		struct gpio_desc *gd;
 
-		ret = of_get_named_gpio(child, "cmd-gpio", 0);
-		if (ret < 0)
-			goto err_node_put;
-		led->cmd = ret;
-		ret = of_get_named_gpio(child, "slow-gpio", 0);
-		if (ret < 0)
-			goto err_node_put;
-		led->slow = ret;
 		ret = of_property_read_string(child, "label", &string);
 		led->name = (ret == 0) ? string : child->name;
+
+		gd = gpiod_get_from_of_node(child, "cmd-gpio", 0,
+					    GPIOD_ASIS, led->name);
+		if (IS_ERR(gd)) {
+			ret = PTR_ERR(gd);
+			goto err_node_put;
+		}
+		led->cmd = gd;
+		gd = gpiod_get_from_of_node(child, "slow-gpio", 0,
+					    GPIOD_ASIS, led->name);
+		if (IS_ERR(gd)) {
+			ret = PTR_ERR(gd);
+			goto err_node_put;
+		}
+		led->slow = gd;
+
 		ret = of_property_read_string(child, "linux,default-trigger",
 					      &string);
 		if (ret == 0)
-- 
2.24.1

