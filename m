Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F18826E8A4
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgIQWfL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:11 -0400
Received: from lists.nic.cz ([217.31.204.67]:35542 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726304AbgIQWeO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:14 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 674F714205C;
        Fri, 18 Sep 2020 00:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382040; bh=8soMub3ZeY/I7d2RuEFY0nhJleKrPzEpa9mQS1vUimA=;
        h=From:To:Date;
        b=NPcxlibo9s7NcnHGBoW8uWy14DqZsOYDs2hkoFeBuwm48xm+e/xPpIMgLidFfHF8Z
         ScEfT2ovF0j/X3jiUnt14OsayEb/jai/6jxbtisrP970ckUpcUkEBkm5qlzxScjseh
         g9bF/cw1BsGVHXfJU6Y8F+Yk5XjQdNlVaCf5qFI4=
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
Subject: [PATCH leds v2 39/50] leds: ns2: move parsing of one LED into separate function
Date:   Fri, 18 Sep 2020 00:33:27 +0200
Message-Id: <20200917223338.14164-40-marek.behun@nic.cz>
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

Move parsing of DT properties of one LED into separate function. This
saves indentation level and is nicer to read.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 120 ++++++++++++++++++----------------------
 1 file changed, 55 insertions(+), 65 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 0e9c2f49b6350..46d4f7e963c04 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -230,6 +230,57 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	return devm_led_classdev_register(&pdev->dev, &led_dat->cdev);
 }
 
+static int ns2_leds_parse_one(struct device *dev, struct device_node *np,
+			      struct ns2_led *led)
+{
+	struct ns2_led_modval *modval;
+	int nmodes, ret, i;
+
+	ret = of_property_read_string(np, "label", &led->name);
+	if (ret)
+		led->name = np->name;
+
+	led->cmd = gpiod_get_from_of_node(np, "cmd-gpio", 0, GPIOD_ASIS,
+					  led->name);
+	if (IS_ERR(led->cmd))
+		return PTR_ERR(led->cmd);
+
+	led->slow = gpiod_get_from_of_node(np, "slow-gpio", 0, GPIOD_ASIS,
+					   led->name);
+	if (IS_ERR(led->slow))
+		return PTR_ERR(led->slow);
+
+	of_property_read_string(np, "linux,default-trigger",
+				&led->default_trigger);
+
+	ret = of_property_count_u32_elems(np, "modes-map");
+	if (ret < 0 || ret % 3) {
+		dev_err(dev, "Missing or malformed modes-map for %pOF\n", np);
+		return -EINVAL;
+	}
+
+	nmodes = ret / 3;
+	modval = devm_kcalloc(dev, nmodes, sizeof(*modval), GFP_KERNEL);
+	if (!modval)
+		return -ENOMEM;
+
+	for (i = 0; i < nmodes; i++) {
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
+
+	return 0;
+}
+
 /*
  * Translate OpenFirmware node properties into platform_data.
  */
@@ -252,78 +303,17 @@ ns2_leds_parse_of(struct device *dev, struct ns2_led_of *ofdata)
 
 	led = leds;
 	for_each_available_child_of_node(np, child) {
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
+		ret = ns2_leds_parse_one(dev, child, led++);
+		if (ret < 0) {
+			of_node_put(child);
+			return ret;
 		}
-
-		led->num_modes = num_modes;
-		led->modval = modval;
-
-		led++;
 	}
 
 	ofdata->leds = leds;
 	ofdata->num_leds = num_leds;
 
 	return 0;
-
-err_node_put:
-	of_node_put(child);
-	return ret;
 }
 
 static const struct of_device_id of_ns2_leds_match[] = {
-- 
2.26.2

