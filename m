Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B26113152F
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jan 2020 16:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgAFPtR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Jan 2020 10:49:17 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:41204 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726858AbgAFPtJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Jan 2020 10:49:09 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id BDD42FB03;
        Mon,  6 Jan 2020 16:49:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dYybpWwB2XWK; Mon,  6 Jan 2020 16:49:05 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 6208449D46; Mon,  6 Jan 2020 16:48:56 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] leds: lm3692x: Allow to configure brigthness mode
Date:   Mon,  6 Jan 2020 16:48:55 +0100
Message-Id: <95aaa83d98c9b91b4d87f6bcbf5f18082f8a1639.1578324703.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1578324703.git.agx@sigxcpu.org>
References: <cover.1578324703.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Brightness mode is currently hardcoded as linear in the driver. Make
exponential mode configurable via DT.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/leds/leds-lm3692x.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 28a51aeb28de..933b786cfaec 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -239,8 +239,7 @@ static int lm3692x_leds_enable(struct lm3692x_led *led)
 	if (ret)
 		goto out;
 
-	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL,
-			LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN);
+	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL, led->brightness_ctrl);
 	if (ret)
 		goto out;
 
@@ -368,7 +367,12 @@ static enum led_brightness lm3692x_max_brightness(struct lm3692x_led *led,
 	u32 max_code;
 
 	/* see p.12 of LM36922 data sheet for brightness formula */
-	max_code = ((max_cur * 1000) - 37806) / 12195;
+	if (led->brightness_ctrl & LM3692X_MAP_MODE_EXP) {
+		/*  228 =~ 1.0 / log2(1.003040572) */
+		max_code = ilog2(max_cur/50) * 228;
+	} else {
+		max_code = ((max_cur * 1000) - 37806) / 12195;
+	}
 	if (max_code > 0x7FF)
 		max_code = 0x7FF;
 
@@ -380,6 +384,7 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 	struct fwnode_handle *child = NULL;
 	struct led_init_data init_data = {};
 	u32 ovp, max_cur;
+	bool exp_mode;
 	int ret;
 
 	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
@@ -430,6 +435,12 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 		}
 	}
 
+	led->brightness_ctrl = LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN;
+	exp_mode = device_property_read_bool(&led->client->dev,
+				     "ti,brightness-mapping-exponential");
+	if (exp_mode)
+		led->brightness_ctrl |= LM3692X_MAP_MODE_EXP;
+
 	child = device_get_next_child_node(&led->client->dev, child);
 	if (!child) {
 		dev_err(&led->client->dev, "No LED Child node\n");
-- 
2.23.0

