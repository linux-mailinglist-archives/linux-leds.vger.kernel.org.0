Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533ED120595
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2019 13:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727601AbfLPM2N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Dec 2019 07:28:13 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:33336 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727542AbfLPM2M (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Dec 2019 07:28:12 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 39041FB03;
        Mon, 16 Dec 2019 13:28:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id z35nRjP2CTXa; Mon, 16 Dec 2019 13:28:08 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 8B0DC498AF; Mon, 16 Dec 2019 13:28:06 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] leds: lm3692x: Allow to set ovp and brigthness mode
Date:   Mon, 16 Dec 2019 13:28:06 +0100
Message-Id: <9c87a17aefbf758d58f199f7046114ee7505a1fa.1576499103.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1576499103.git.agx@sigxcpu.org>
References: <cover.1576499103.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Overvoltage protection and brightness mode are currently hardcoded
as disabled in the driver. Make these configurable via DT.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/leds/leds-lm3692x.c | 43 +++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 8b408102e138..2c084b333628 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -114,6 +114,7 @@ struct lm3692x_led {
 	struct regulator *regulator;
 	int led_enable;
 	int model_id;
+	u8 boost_ctrl, brightness_ctrl;
 };
 
 static const struct reg_default lm3692x_reg_defs[] = {
@@ -249,10 +250,7 @@ static int lm3692x_init(struct lm3692x_led *led)
 	if (ret)
 		goto out;
 
-	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL,
-			LM3692X_BOOST_SW_1MHZ |
-			LM3692X_BOOST_SW_NO_SHIFT |
-			LM3692X_OCP_PROT_1_5A);
+	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL, led->boost_ctrl);
 	if (ret)
 		goto out;
 
@@ -268,8 +266,7 @@ static int lm3692x_init(struct lm3692x_led *led)
 	if (ret)
 		goto out;
 
-	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL,
-			LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN);
+	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL, led->brightness_ctrl);
 	if (ret)
 		goto out;
 
@@ -326,6 +323,8 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 {
 	struct fwnode_handle *child = NULL;
 	struct led_init_data init_data = {};
+	u32 ovp = 0;
+	bool exp_mode;
 	int ret;
 
 	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
@@ -350,6 +349,38 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 		led->regulator = NULL;
 	}
 
+	led->boost_ctrl = LM3692X_BOOST_SW_1MHZ |
+		LM3692X_BOOST_SW_NO_SHIFT |
+		LM3692X_OCP_PROT_1_5A;
+	ret = device_property_read_u32(&led->client->dev,
+				       "ti,overvoltage-volts", &ovp);
+	if (!ret) {
+		switch (ovp) {
+		case 0:
+			break;
+		case 22:
+			led->boost_ctrl |= LM3692X_OVP_21V;
+			break;
+		case 25:
+			led->boost_ctrl |= LM3692X_OVP_25V;
+			break;
+		case 29:
+			led->boost_ctrl |= LM3692X_OVP_29V;
+			break;
+		default:
+			dev_err(&led->client->dev, "Invalid OVP %d\n", ovp);
+			return -EINVAL;
+		}
+	}
+	dev_dbg(&led->client->dev, "OVP: %dV", ovp);
+
+	led->brightness_ctrl = LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN;
+	exp_mode = device_property_read_bool(&led->client->dev,
+				     "ti,brightness-mapping-exponential");
+	dev_dbg(&led->client->dev, "Exponential brightness: %d", exp_mode);
+	if (exp_mode)
+		led->brightness_ctrl |= LM3692X_MAP_MODE_EXP;
+
 	child = device_get_next_child_node(&led->client->dev, child);
 	if (!child) {
 		dev_err(&led->client->dev, "No LED Child node\n");
-- 
2.23.0

