Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA0C9F599
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 23:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfH0VwJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 17:52:09 -0400
Received: from muru.com ([72.249.23.125]:58888 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbfH0VwJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 27 Aug 2019 17:52:09 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 478AB8107;
        Tue, 27 Aug 2019 21:52:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: lm3532: Avoid potentially unpaired regulator calls
Date:   Tue, 27 Aug 2019 14:52:05 -0700
Message-Id: <20190827215205.59677-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

We may currently get unpaired regulator calls when configuring the LED
brightness via sysfs in case of regulator calls producing errors. Let's
fix this by maintaining local state for enabled.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/leds/leds-lm3532.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -127,6 +127,7 @@ struct lm3532_als_data {
  * @num_leds - Number of LED strings are supported in this array
  * @full_scale_current - The full-scale current setting for the current sink.
  * @led_strings - The LED strings supported in this array
+ * @enabled - Enabled status
  * @label - LED label
  */
 struct lm3532_led {
@@ -138,6 +139,7 @@ struct lm3532_led {
 	int ctrl_brt_pointer;
 	int num_leds;
 	int full_scale_current;
+	int enabled:1;
 	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
 	char label[LED_MAX_NAME_SIZE];
 };
@@ -292,11 +294,15 @@ static int lm3532_get_ramp_index(int ramp_time)
 				ramp_time);
 }
 
+/* Caller must take care of locking */
 static int lm3532_led_enable(struct lm3532_led *led_data)
 {
 	int ctrl_en_val = BIT(led_data->control_bank);
 	int ret;
 
+	if (led_data->enabled)
+		return 0;
+
 	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
 					 ctrl_en_val, ctrl_en_val);
 	if (ret) {
@@ -304,14 +310,24 @@ static int lm3532_led_enable(struct lm3532_led *led_data)
 		return ret;
 	}
 
-	return regulator_enable(led_data->priv->regulator);
+	ret = regulator_enable(led_data->priv->regulator);
+	if (ret < 0)
+		return ret;
+
+	led_data->enabled = 1;
+
+	return 0;
 }
 
+/* Caller must take care of locking */
 static int lm3532_led_disable(struct lm3532_led *led_data)
 {
 	int ctrl_en_val = BIT(led_data->control_bank);
 	int ret;
 
+	if (!led_data->enabled)
+		return 0;
+
 	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
 					 ctrl_en_val, 0);
 	if (ret) {
@@ -319,7 +335,13 @@ static int lm3532_led_disable(struct lm3532_led *led_data)
 		return ret;
 	}
 
-	return regulator_disable(led_data->priv->regulator);
+	ret = regulator_disable(led_data->priv->regulator);
+	if (ret < 0)
+		return ret;
+
+	led_data->enabled = 0;
+
+	return 0;
 }
 
 static int lm3532_brightness_set(struct led_classdev *led_cdev,
-- 
2.23.0
