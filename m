Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC5F61572A1
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2020 11:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgBJKOH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Feb 2020 05:14:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45052 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgBJKOH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Feb 2020 05:14:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so6412035ljj.11
        for <linux-leds@vger.kernel.org>; Mon, 10 Feb 2020 02:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6dwnxwcC74q23owyv0Q/4ZJ3SW1uD4qPdHWSjspIvp8=;
        b=KO3eO3AB2ao1y3l8ZupEiEg68loazbr0dF0VMeinAS3sfdzgcJ9qLBxgnSaZAKcWfi
         DmP44VoiqEZRK2++QV+MvCREmGu3KIamd+tn0YTeLblwqQwG/igZc3Q7lg1BSJXHo0Wz
         XgsD8rDkZZnna1QlIqDS6ip+BRphKEAVCM5XOn3MeCfN2v/rx1aBZvT0+gVLDKtdkY0R
         KMSE2ntnOAxbYenb2zweF85so7IYhfe1OvSLdXfNhUkXurtpEAum0aWJsWdD0awItMxA
         b/JbebjQtjv4PYUY9kUByheo0GKZzQBMWL8iPl4VS85/H/rtqxYOmSOuh+5QwYqfy+Xy
         QwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6dwnxwcC74q23owyv0Q/4ZJ3SW1uD4qPdHWSjspIvp8=;
        b=h4lHj2MBMAsuLQlyPjWwLZjCjCCqVaCR2SQ0q0vl+3Fsaq2k3W9SnbhpdjbHAZL4l4
         sseX0+KB7U8aUoY2WpXyrCjpyidwBlf6M+LwS+CYynJHe0V8Z30rJ2iNXBS0UGtezIS5
         qg6a/ZSD+L4CJtnzw1mOGQ4BMexZS+7JTSB6QIXMHf4UuATCDRjO/JlwG4bpgWA+FTFq
         NT7N8u8OaberGOe3OhKFJ/koXKL2Hot2vHw2NN7GGNFEzfl2h2wUUNVuxzjzVINJ0AF6
         lezYglZAG10G1aSfroniikvNI4+ELmUz6aUXz7uRSUjamaVWRzvhM3qnzRnFKfuGWeor
         LB9A==
X-Gm-Message-State: APjAAAVrDGtFpy1rXELL3xoxqwSyGy9kmxZymAJabcTQQfYHDIDiYFOD
        8XMz/FeWuiTwIPQf2oibnFq7KA==
X-Google-Smtp-Source: APXvYqzlbgyyjBA0UpvOyVcoYPrzyCdym/xm03hArTTEbxpxir/9wIiN2+h1j0Q/PPwSkbDy7RyGsQ==
X-Received: by 2002:a2e:818e:: with SMTP id e14mr462901ljg.2.1581329645389;
        Mon, 10 Feb 2020 02:14:05 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m3sm5047250lfl.97.2020.02.10.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 02:14:04 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH 2/2 v2] leds: ns2: Convert to GPIO descriptors
Date:   Mon, 10 Feb 2020 11:13:54 +0100
Message-Id: <20200210101354.287045-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200210101354.287045-1-linus.walleij@linaro.org>
References: <20200210101354.287045-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Collected Simon's Tested-by tag.
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

