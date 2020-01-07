Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4D8132878
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2020 15:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgAGOKm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jan 2020 09:10:42 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35868 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGOKl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2020 09:10:41 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so54872130ljg.3
        for <linux-leds@vger.kernel.org>; Tue, 07 Jan 2020 06:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9SfiOJ95jePHuG2lfVDsu4nhLaVOYDOSWTFfp6iAftU=;
        b=NuQyprMxJpddCKVzH6Jw80Ep6fU8CvyDaW3QTKQSbVWIMnz+cF2Ccek2FQbGgH0hm2
         Oa8aqoV3uNiSauF5jBffMTTcd93abcuMnyJ+bnbU1R2YFYOJR/qf1MQ9gK5ISCQHQTlv
         +pP5lo4yEKvsrB9fxKOcaK8Z6LYdsiruh77S0X/Gn0htVQzQjTohYL15kBQ1F7Zkiqd2
         9Q6iMbsd1AYdTOA2Ahf8yHImPkc12OOZSo9gHrdqLdPanc6HmmDMcjE27GO67ZfXqSqf
         wBqQDkj0JqHocCBtBdFe+Mp9fExsylQNlfne4sSgsP+nkeiEDL7Jmc/f4toGwxI2VWUu
         KcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9SfiOJ95jePHuG2lfVDsu4nhLaVOYDOSWTFfp6iAftU=;
        b=jrx5srlQ0D3/Bdxn/aXF1+NQkF6RMKeQOUtbNp5kFFXid9aRPssnhG3zNlvuGQxEz8
         ZLDiq6ahsMy8r3OfKe+C1eMcWvscF4CFk8MVpy5SvjKCKvV75bsNUt4Wf0oRJZOOpck0
         wq8AHAaA69ZA6hiJrAQczRAu3po17q34eZylSqryI3NWews0W290SOX3+P2CBrS/kcBU
         oXBFmTB+J+ODIzEnabiKVp4Sefv2BexxjaGGHMvEvVgOcVkD4KnT6B8kpWpngPXldlHO
         DK0jboCNnMGyzPJ1FkpXjN7iF7Ofmnzk56M78tVVWqw4uuRbDig7NwyE8VewYbmpPwPe
         bl4w==
X-Gm-Message-State: APjAAAW3c+Mhso0q3kyoviMlqRUDk4ToZOR5ZMg6Cdf5FSy28FcI34h8
        YC5g1kB/pFEAVIw6jm/ggGwIwJwGKKgSwA==
X-Google-Smtp-Source: APXvYqwPvLYI23P/tT7IG9R7KEQABGUTYn6SiQX1sGuqzbtlNeBEe+ni1K/jNVKIi4ba/vutA8k3DQ==
X-Received: by 2002:a2e:3a0c:: with SMTP id h12mr56641886lja.200.1578406237556;
        Tue, 07 Jan 2020 06:10:37 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id a14sm30317770lfh.50.2020.01.07.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 06:10:36 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH 2/2] leds: ns2: Convert to GPIO descriptors
Date:   Tue,  7 Jan 2020 15:10:29 +0100
Message-Id: <20200107141030.74052-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200107141030.74052-1-linus.walleij@linaro.org>
References: <20200107141030.74052-1-linus.walleij@linaro.org>
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

Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 73 +++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 42 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 6d37dda12c39..538ca5755602 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -33,8 +33,8 @@ struct ns2_led_modval {
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
@@ -53,8 +53,8 @@ struct ns2_led_platform_data {
 
 struct ns2_led_data {
 	struct led_classdev	cdev;
-	unsigned int		cmd;
-	unsigned int		slow;
+	struct gpio_desc	*cmd;
+	struct gpio_desc	*slow;
 	bool			can_sleep;
 	unsigned char		sata; /* True when SATA mode active. */
 	rwlock_t		rw_lock; /* Lock GPIOs. */
@@ -70,8 +70,8 @@ static int ns2_led_get_mode(struct ns2_led_data *led_dat,
 	int cmd_level;
 	int slow_level;
 
-	cmd_level = gpio_get_value_cansleep(led_dat->cmd);
-	slow_level = gpio_get_value_cansleep(led_dat->slow);
+	cmd_level = gpiod_get_value_cansleep(led_dat->cmd);
+	slow_level = gpiod_get_value_cansleep(led_dat->slow);
 
 	for (i = 0; i < led_dat->num_modes; i++) {
 		if (cmd_level == led_dat->modval[i].cmd_level &&
@@ -104,15 +104,15 @@ static void ns2_led_set_mode(struct ns2_led_data *led_dat,
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
@@ -200,26 +200,6 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
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
@@ -229,8 +209,8 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
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
@@ -285,17 +265,26 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
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
2.23.0

