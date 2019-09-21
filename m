Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E4BBA1D0
	for <lists+linux-leds@lfdr.de>; Sun, 22 Sep 2019 12:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbfIVKYf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Sep 2019 06:24:35 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:36258 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728199AbfIVKYf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 22 Sep 2019 06:24:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id B5317FB02;
        Sun, 22 Sep 2019 12:24:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tgPgqFSyti7X; Sun, 22 Sep 2019 12:24:32 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id BE41F48630; Sat, 21 Sep 2019 14:12:12 -0700 (PDT)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] leds: lm3692x: Print error value on dev_err
Date:   Sat, 21 Sep 2019 14:12:08 -0700
Message-Id: <7999f868f677e2f44ec81e7b9f300771b9fb1991.1569100154.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <cover.1569100154.git.agx@sigxcpu.org>
References: <cover.1569100154.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This gives a way better idea what is going on.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lm3692x.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 3d381f2f73d0..487228c2bed2 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -174,19 +174,20 @@ static int lm3692x_brightness_set(struct led_classdev *led_cdev,
 
 	ret = lm3692x_fault_check(led);
 	if (ret) {
-		dev_err(&led->client->dev, "Cannot read/clear faults\n");
+		dev_err(&led->client->dev, "Cannot read/clear faults: %d\n",
+			ret);
 		goto out;
 	}
 
 	ret = regmap_write(led->regmap, LM3692X_BRT_MSB, brt_val);
 	if (ret) {
-		dev_err(&led->client->dev, "Cannot write MSB\n");
+		dev_err(&led->client->dev, "Cannot write MSB: %d\n", ret);
 		goto out;
 	}
 
 	ret = regmap_write(led->regmap, LM3692X_BRT_LSB, led_brightness_lsb);
 	if (ret) {
-		dev_err(&led->client->dev, "Cannot write LSB\n");
+		dev_err(&led->client->dev, "Cannot write LSB: %d\n", ret);
 		goto out;
 	}
 out:
@@ -203,7 +204,7 @@ static int lm3692x_init(struct lm3692x_led *led)
 		ret = regulator_enable(led->regulator);
 		if (ret) {
 			dev_err(&led->client->dev,
-				"Failed to enable regulator\n");
+				"Failed to enable regulator: %d\n", ret);
 			return ret;
 		}
 	}
@@ -213,7 +214,8 @@ static int lm3692x_init(struct lm3692x_led *led)
 
 	ret = lm3692x_fault_check(led);
 	if (ret) {
-		dev_err(&led->client->dev, "Cannot read/clear faults\n");
+		dev_err(&led->client->dev, "Cannot read/clear faults: %d\n",
+			ret);
 		goto out;
 	}
 
@@ -409,7 +411,8 @@ static int lm3692x_remove(struct i2c_client *client)
 
 	ret = regmap_update_bits(led->regmap, LM3692X_EN, LM3692X_DEVICE_EN, 0);
 	if (ret) {
-		dev_err(&led->client->dev, "Failed to disable regulator\n");
+		dev_err(&led->client->dev, "Failed to disable regulator: %d\n",
+			ret);
 		return ret;
 	}
 
@@ -420,7 +423,7 @@ static int lm3692x_remove(struct i2c_client *client)
 		ret = regulator_disable(led->regulator);
 		if (ret)
 			dev_err(&led->client->dev,
-				"Failed to disable regulator\n");
+				"Failed to disable regulator: %d\n", ret);
 	}
 
 	mutex_destroy(&led->lock);
-- 
2.23.0.rc1

