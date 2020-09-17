Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E6F26E878
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgIQWeL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:11 -0400
Received: from mail.nic.cz ([217.31.204.67]:35854 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726218AbgIQWeK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:10 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 33054142042;
        Fri, 18 Sep 2020 00:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382038; bh=jF62DFUspv0dwhNKqUBBbK3qw4wrbt7E6Hsa+iFaoe8=;
        h=From:To:Date;
        b=m6Sfyn2abv80e1kfOUaIwNcxcQf0ylGoG7T9u365XHENPoMRa+zu65SqI7D11w0i1
         xh/E5dXaog285nnBl3FxOqt0ItDodJTbyuQ16YyRpZjLp20QaCzyaM1yotB7MIn93z
         QhNiFimnDpDnyXMpyUfkGCGqJkApriTN4N8kJk7I=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Grant Feng <von81@163.com>
Subject: [PATCH leds v2 27/50] leds: is31fl319x: don't store audio gain value, simply set it
Date:   Fri, 18 Sep 2020 00:33:15 +0200
Message-Id: <20200917223338.14164-28-marek.behun@nic.cz>
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

Since this value is only used in device probe, don't store it in private
structure. Simply parse the value and set it.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Grant Feng <von81@163.com>
---
 drivers/leds/leds-is31fl319x.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 595112958617e..8e3e02d959989 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -65,7 +65,6 @@ struct is31fl319x_chip {
 	struct i2c_client               *client;
 	struct regmap                   *regmap;
 	struct mutex                    lock;
-	u32                             audio_gain_db;
 
 	struct is31fl319x_led {
 		struct is31fl319x_chip  *chip;
@@ -198,6 +197,18 @@ static int is31fl319x_parse_max_current(struct device *dev, u32 *aggregated)
 	return 0;
 }
 
+static u32 is31fl319x_parse_audio_gain(struct device *dev)
+{
+	u32 result;
+
+	if (!of_property_read_u32(dev_of_node(dev), "audio-gain-db", &result))
+		result = min(result, IS31FL319X_AUDIO_GAIN_DB_MAX);
+	else
+		result = 0;
+
+	return result;;
+}
+
 static int is31fl319x_parse_child_dt(const struct device *dev,
 				     const struct device_node *child,
 				     struct is31fl319x_led *led)
@@ -271,12 +282,6 @@ static int is31fl319x_parse_dt(struct device *dev,
 		led->configured = true;
 	}
 
-	is31->audio_gain_db = 0;
-	ret = of_property_read_u32(np, "audio-gain-db", &is31->audio_gain_db);
-	if (!ret)
-		is31->audio_gain_db = min(is31->audio_gain_db,
-					  IS31FL319X_AUDIO_GAIN_DB_MAX);
-
 	return 0;
 
 put_child_node:
@@ -346,6 +351,7 @@ static int is31fl319x_probe(struct i2c_client *client,
 	struct is31fl319x_chip *is31;
 	struct device *dev = &client->dev;
 	struct gpio_desc *shutdown_gpio;
+	u32 audio_gain_db;
 	int err;
 	int i = 0;
 	u32 aggregated_led_microamp;
@@ -405,9 +411,11 @@ static int is31fl319x_probe(struct i2c_client *client,
 		goto free_mutex;
 	}
 
+	audio_gain_db = is31fl319x_parse_audio_gain(dev);
+
 	regmap_write(is31->regmap, IS31FL319X_CONFIG2,
 		     is31fl319x_microamp_to_cs(dev, aggregated_led_microamp) |
-		     is31fl319x_db_to_gain(is31->audio_gain_db));
+		     is31fl319x_db_to_gain(audio_gain_db));
 
 	for (i = 0; i < is31->cdef->num_leds; i++) {
 		struct is31fl319x_led *led = &is31->leds[i];
-- 
2.26.2

