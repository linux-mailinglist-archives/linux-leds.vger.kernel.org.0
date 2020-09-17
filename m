Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACA226E875
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgIQWeK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:10 -0400
Received: from lists.nic.cz ([217.31.204.67]:35720 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbgIQWeJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:09 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 1874A140B11;
        Fri, 18 Sep 2020 00:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382037; bh=FyTTNPqPazrHyYEgw9oCRcfrOumudXIDbneKVMAk8Yg=;
        h=From:To:Date;
        b=vl5c5vQdXVGrsz2nbU6onQ7hpJ2f809I+KgpQXkAz8LoEQz36FZPsTcgJQJrXEovS
         YZQJjwMOupqM6ILrS4uIy6KhdydgOC65d//XXYf9mcQfTuvxqY543YDgN3BYUU5QCk
         Hf0Mzvx4WJDaGshxGhoKE3x15gwyMfg8CoC7c9OU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH leds v2 21/50] leds: pm8058: cosmetic change: use helper variable
Date:   Fri, 18 Sep 2020 00:33:09 +0200
Message-Id: <20200917223338.14164-22-marek.behun@nic.cz>
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

Use helper variable dev instead of always writing &pdev->dev.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/leds/leds-pm8058.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index e085bf9ffc1de..70b4d06488fec 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -88,29 +88,32 @@ static enum led_brightness pm8058_led_get(struct led_classdev *cled)
 static int pm8058_led_probe(struct platform_device *pdev)
 {
 	struct led_init_data init_data = {};
+	struct device *dev = &pdev->dev;
 	struct pm8058_led *led;
-	struct device_node *np = dev_of_node(&pdev->dev);
+	struct device_node *np;
 	int ret;
 	struct regmap *map;
 	const char *state;
 	enum led_brightness maxbright;
 
-	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
-	led->ledtype = (u32)(unsigned long)of_device_get_match_data(&pdev->dev);
+	led->ledtype = (u32)(unsigned long)of_device_get_match_data(dev);
 
-	map = dev_get_regmap(pdev->dev.parent, NULL);
+	map = dev_get_regmap(dev->parent, NULL);
 	if (!map) {
-		dev_err(&pdev->dev, "Parent regmap unavailable.\n");
+		dev_err(dev, "Parent regmap unavailable.\n");
 		return -ENXIO;
 	}
 	led->map = map;
 
+	np = dev_of_node(dev);
+
 	ret = of_property_read_u32(np, "reg", &led->reg);
 	if (ret) {
-		dev_err(&pdev->dev, "no register offset specified\n");
+		dev_err(dev, "no register offset specified\n");
 		return -EINVAL;
 	}
 
@@ -143,10 +146,9 @@ static int pm8058_led_probe(struct platform_device *pdev)
 
 	init_data.fwnode = of_fwnode_handle(np);
 
-	ret = devm_led_classdev_register_ext(&pdev->dev, &led->cdev,
-					     &init_data);
+	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register LED for %pOF\n", np);
+		dev_err(dev, "Failed to register LED for %pOF\n", np);
 		return ret;
 	}
 
-- 
2.26.2

