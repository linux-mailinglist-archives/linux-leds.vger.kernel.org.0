Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05781301E2
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jan 2020 11:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgADKye (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jan 2020 05:54:34 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:40186 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbgADKye (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 4 Jan 2020 05:54:34 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 803B2FB03;
        Sat,  4 Jan 2020 11:54:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RbqPPA8RJr8P; Sat,  4 Jan 2020 11:54:29 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 1A9E849AA8; Sat,  4 Jan 2020 11:54:26 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] leds: lm3692x: Allow to configure over voltage protection
Date:   Sat,  4 Jan 2020 11:54:18 +0100
Message-Id: <35d70c7802ff9efb6d6f83b402f4d26587ffbb9b.1578134779.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1578134779.git.agx@sigxcpu.org>
References: <cover.1578134779.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Overvoltage protection is currently using the default of 29V.  Make it
configurable via DT.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lm3692x.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 8b408102e138..28973cc5a6cc 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -114,6 +114,8 @@ struct lm3692x_led {
 	struct regulator *regulator;
 	int led_enable;
 	int model_id;
+
+	u8 boost_ctrl;
 };
 
 static const struct reg_default lm3692x_reg_defs[] = {
@@ -249,10 +251,7 @@ static int lm3692x_init(struct lm3692x_led *led)
 	if (ret)
 		goto out;
 
-	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL,
-			LM3692X_BOOST_SW_1MHZ |
-			LM3692X_BOOST_SW_NO_SHIFT |
-			LM3692X_OCP_PROT_1_5A);
+	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL, led->boost_ctrl);
 	if (ret)
 		goto out;
 
@@ -326,6 +325,7 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 {
 	struct fwnode_handle *child = NULL;
 	struct led_init_data init_data = {};
+	u32 ovp;
 	int ret;
 
 	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
@@ -350,6 +350,32 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 		led->regulator = NULL;
 	}
 
+	led->boost_ctrl = LM3692X_BOOST_SW_1MHZ |
+		LM3692X_BOOST_SW_NO_SHIFT |
+		LM3692X_OCP_PROT_1_5A;
+	ret = device_property_read_u32(&led->client->dev,
+				       "ti,ovp-microvolt", &ovp);
+	if (ret) {
+		led->boost_ctrl |= LM3692X_OVP_29V;
+	} else {
+		switch (ovp) {
+		case 17000000:
+			break;
+		case 21000000:
+			led->boost_ctrl |= LM3692X_OVP_21V;
+			break;
+		case 25000000:
+			led->boost_ctrl |= LM3692X_OVP_25V;
+			break;
+		case 29000000:
+			led->boost_ctrl |= LM3692X_OVP_29V;
+			break;
+		default:
+			dev_err(&led->client->dev, "Invalid OVP %d\n", ovp);
+			return -EINVAL;
+		}
+	}
+
 	child = device_get_next_child_node(&led->client->dev, child);
 	if (!child) {
 		dev_err(&led->client->dev, "No LED Child node\n");
-- 
2.23.0

