Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD0A38C58F
	for <lists+linux-leds@lfdr.de>; Fri, 21 May 2021 13:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbhEULWa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 May 2021 07:22:30 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:37619 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhEULW2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 21 May 2021 07:22:28 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d78 with ME
        id 7PM22500521Fzsu03PM2sy; Fri, 21 May 2021 13:21:03 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 21 May 2021 13:21:03 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     pavel@ucw.cz, j.anaszewski@samsung.com, sw0312.kim@samsung.com,
        ingi2.kim@samsung.com, varkabhadram@gmail.com, cooloney@gmail.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] leds: ktd2692: Fix an error handling path
Date:   Fri, 21 May 2021 13:21:01 +0200
Message-Id: <4057d4cb2d47f893039de85e595682d17f4814a4.1621595943.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In 'ktd2692_parse_dt()', if an error occurs after a successful
'regulator_enable()' call, we should call 'regulator_enable()'.

This is the same in 'ktd2692_probe()', if an error occurs after a
successful 'ktd2692_parse_dt()' call.

Instead of adding 'regulator_enable()' in several places, implement a
resource managed solution and simplify the remove function accordingly.

Fixes: b7da8c5c725c ("leds: Add ktd2692 flash LED driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
The regulator looks optional, so maybe 'devm_add_action()' without a
'return ret;' would be more logical that 'devm_add_action_or_reset()'.
The code could be simpler if we don't car about the message if
'regulator_disable()' fails.
---
 drivers/leds/leds-ktd2692.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 632f10db4b3f..f341da1503a4 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -256,6 +256,17 @@ static void ktd2692_setup(struct ktd2692_context *led)
 				 | KTD2692_REG_FLASH_CURRENT_BASE);
 }
 
+static void regulator_disable_action(void *_data)
+{
+	struct device *dev = _data;
+	struct ktd2692_context *led = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_disable(led->regulator);
+	if (ret)
+		dev_err(dev, "Failed to disable supply: %d\n", ret);
+}
+
 static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 			    struct ktd2692_led_config_data *cfg)
 {
@@ -286,8 +297,14 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 
 	if (led->regulator) {
 		ret = regulator_enable(led->regulator);
-		if (ret)
+		if (ret) {
 			dev_err(dev, "Failed to enable supply: %d\n", ret);
+		} else {
+			ret = devm_add_action_or_reset(dev,
+						regulator_disable_action, dev);
+			if (ret)
+				return ret;
+		}
 	}
 
 	child_node = of_get_next_available_child(np, NULL);
@@ -377,17 +394,9 @@ static int ktd2692_probe(struct platform_device *pdev)
 static int ktd2692_remove(struct platform_device *pdev)
 {
 	struct ktd2692_context *led = platform_get_drvdata(pdev);
-	int ret;
 
 	led_classdev_flash_unregister(&led->fled_cdev);
 
-	if (led->regulator) {
-		ret = regulator_disable(led->regulator);
-		if (ret)
-			dev_err(&pdev->dev,
-				"Failed to disable supply: %d\n", ret);
-	}
-
 	mutex_destroy(&led->lock);
 
 	return 0;
-- 
2.30.2

