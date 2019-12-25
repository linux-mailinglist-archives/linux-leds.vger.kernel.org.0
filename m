Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE3112A7B1
	for <lists+linux-leds@lfdr.de>; Wed, 25 Dec 2019 12:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfLYLQo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Dec 2019 06:16:44 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:36548 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbfLYLQo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 25 Dec 2019 06:16:44 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 01822FB02;
        Wed, 25 Dec 2019 12:16:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TzL40xoAw-_S; Wed, 25 Dec 2019 12:16:40 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id A806740BC3; Wed, 25 Dec 2019 12:16:39 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] leds: lm3692x: Move lm3692x_init and rename to lm3692x_leds_enable
Date:   Wed, 25 Dec 2019 12:16:37 +0100
Message-Id: <cb9618ccc777ddf1c4abf62d6d49af20251f5497.1577272495.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1577272495.git.agx@sigxcpu.org>
References: <cover.1577272495.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This moves lm3692x_init so it can be used from
lm3692x_brightness_set. Rename to lm3692_leds_enable to pair up
with lm3692x_leds_disable. No functional change.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/leds/leds-lm3692x.c | 70 ++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index d7e5de8fe8db..7bf97ee6aa92 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -165,40 +165,7 @@ static int lm3692x_fault_check(struct lm3692x_led *led)
 	return read_buf;
 }
 
-static int lm3692x_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness brt_val)
-{
-	struct lm3692x_led *led =
-			container_of(led_cdev, struct lm3692x_led, led_dev);
-	int ret;
-	int led_brightness_lsb = (brt_val >> 5);
-
-	mutex_lock(&led->lock);
-
-	ret = lm3692x_fault_check(led);
-	if (ret) {
-		dev_err(&led->client->dev, "Cannot read/clear faults: %d\n",
-			ret);
-		goto out;
-	}
-
-	ret = regmap_write(led->regmap, LM3692X_BRT_MSB, brt_val);
-	if (ret) {
-		dev_err(&led->client->dev, "Cannot write MSB: %d\n", ret);
-		goto out;
-	}
-
-	ret = regmap_write(led->regmap, LM3692X_BRT_LSB, led_brightness_lsb);
-	if (ret) {
-		dev_err(&led->client->dev, "Cannot write LSB: %d\n", ret);
-		goto out;
-	}
-out:
-	mutex_unlock(&led->lock);
-	return ret;
-}
-
-static int lm3692x_init(struct lm3692x_led *led)
+static int lm3692x_leds_enable(struct lm3692x_led *led)
 {
 	int enable_state;
 	int ret, reg_ret;
@@ -321,6 +288,39 @@ static int lm3692x_init(struct lm3692x_led *led)
 	return ret;
 }
 
+static int lm3692x_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness brt_val)
+{
+	struct lm3692x_led *led =
+			container_of(led_cdev, struct lm3692x_led, led_dev);
+	int ret;
+	int led_brightness_lsb = (brt_val >> 5);
+
+	mutex_lock(&led->lock);
+
+	ret = lm3692x_fault_check(led);
+	if (ret) {
+		dev_err(&led->client->dev, "Cannot read/clear faults: %d\n",
+			ret);
+		goto out;
+	}
+
+	ret = regmap_write(led->regmap, LM3692X_BRT_MSB, brt_val);
+	if (ret) {
+		dev_err(&led->client->dev, "Cannot write MSB: %d\n", ret);
+		goto out;
+	}
+
+	ret = regmap_write(led->regmap, LM3692X_BRT_LSB, led_brightness_lsb);
+	if (ret) {
+		dev_err(&led->client->dev, "Cannot write LSB: %d\n", ret);
+		goto out;
+	}
+out:
+	mutex_unlock(&led->lock);
+	return ret;
+}
+
 static enum led_brightness lm3692x_max_brightness(struct lm3692x_led *led,
 						  u32 max_cur)
 {
@@ -462,7 +462,7 @@ static int lm3692x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = lm3692x_init(led);
+	ret = lm3692x_leds_enable(led);
 	if (ret)
 		return ret;
 
-- 
2.23.0

