Return-Path: <linux-leds+bounces-4441-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF9A7EC15
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 21:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6222D16B3A4
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 19:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3F925E446;
	Mon,  7 Apr 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x7vGOY6V"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E3254AE5;
	Mon,  7 Apr 2025 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050965; cv=none; b=obPZ+LBo3nC1wYykGPuElWXjbPAK4FS3dwMyYy0u210jQKG+BADD9uCDRRG+cwOvffPCuEdsjReFwT2UfqY9Q7te3kdyS9p5U7gl/SrvqUmy8c4dNWl4+sUAxicGSgh1gMnZDgmKwL2vvQq1FywkCjhq3MfjA5GbxEukvEZb4mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050965; c=relaxed/simple;
	bh=1tZPCxHoovdH7Blw+5CPCxrs5ag1pmEdYrR875D0/Mo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJLt2cZ54/qe7SIoUbB1BfUFVwC5xltuK5zZwaASet7VNXv7rIlkrXpxqdrF161ovTWRxuc+NTN+1hhQHltt1OR0l7nQKnXc0dpDjAlWkHXJCQwDelgWWXOWR0k+OqzEln+/VM+bjnrPWi9dP6yhfUJpJHEXKKiSXAvhnzf09nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=x7vGOY6V; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZw2u953486
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744050959;
	bh=WG+gFLkwHlKjAf5O2m6YwuuMmVSxH0J2znwfzw9Uhv8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x7vGOY6VK8OLzDwRwvRBnnqozukPOLf7stpInhSJXKQ1X0ugvZ9XhSquET4cSC/3U
	 kZOKSKzjYc5pkhrNp5dUDBOpLHi2vBmmkeA9EemTiRd5JoPqF/ezk/QzlDoXsGzTpL
	 M+qvITKLMjwwJmioU+qbWHjj2e4TLJpUVCF6Gn/E=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZw7T082417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:35:58 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:35:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:35:58 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537IZuQs072942;
	Mon, 7 Apr 2025 13:35:58 -0500
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 6/6] leds: lp8860: Disable GPIO with devm action
Date: Mon, 7 Apr 2025 13:35:55 -0500
Message-ID: <20250407183555.409687-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250407183555.409687-1-afd@ti.com>
References: <20250407183555.409687-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This helps prevent mistakes like disable out of order in cleanup functions
and forgetting to free on error paths (as was done here).

This was the last thing the .remove() function did, so remove that too.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 088610988138f..7a9eb9a247ae7 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -99,7 +99,6 @@ struct lp8860_led {
 	struct led_classdev led_dev;
 	struct regmap *regmap;
 	struct regmap *eeprom_regmap;
-	struct gpio_desc *enable_gpio;
 };
 
 static const struct reg_sequence lp8860_eeprom_disp_regs[] = {
@@ -219,8 +218,6 @@ static int lp8860_init(struct lp8860_led *led)
 	unsigned int read_buf;
 	int ret, reg_count;
 
-	gpiod_direction_output(led->enable_gpio, 1);
-
 	ret = lp8860_fault_check(led);
 	if (ret)
 		goto out;
@@ -257,9 +254,6 @@ static int lp8860_init(struct lp8860_led *led)
 	return ret;
 
 out:
-	if (ret)
-		gpiod_direction_output(led->enable_gpio, 0);
-
 	return ret;
 }
 
@@ -277,6 +271,13 @@ static const struct regmap_config lp8860_eeprom_regmap_config = {
 	.max_register = LP8860_EEPROM_REG_24,
 };
 
+static void lp8860_disable_gpio(void *data)
+{
+	struct gpio_desc *gpio = data;
+
+	gpiod_set_value(gpio, 0);
+}
+
 static int lp8860_probe(struct i2c_client *client)
 {
 	int ret;
@@ -284,6 +285,7 @@ static int lp8860_probe(struct i2c_client *client)
 	struct device_node *np = dev_of_node(&client->dev);
 	struct device_node *child_node;
 	struct led_init_data init_data = {};
+	struct gpio_desc *enable_gpio;
 
 	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
@@ -293,13 +295,11 @@ static int lp8860_probe(struct i2c_client *client)
 	if (!child_node)
 		return -EINVAL;
 
-	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
-						   "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(led->enable_gpio)) {
-		ret = PTR_ERR(led->enable_gpio);
-		dev_err(&client->dev, "Failed to get enable gpio: %d\n", ret);
-		return ret;
-	}
+	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(enable_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
+				     "Failed to get enable GPIO\n");
+	devm_add_action_or_reset(&client->dev, lp8860_disable_gpio, enable_gpio);
 
 	ret = devm_regulator_get_enable_optional(&client->dev, "vled");
 	if (ret && ret != -ENODEV)
@@ -311,8 +311,6 @@ static int lp8860_probe(struct i2c_client *client)
 
 	devm_mutex_init(&client->dev, &led->lock);
 
-	i2c_set_clientdata(client, led);
-
 	led->regmap = devm_regmap_init_i2c(client, &lp8860_regmap_config);
 	if (IS_ERR(led->regmap)) {
 		ret = PTR_ERR(led->regmap);
@@ -347,14 +345,6 @@ static int lp8860_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void lp8860_remove(struct i2c_client *client)
-{
-	struct lp8860_led *led = i2c_get_clientdata(client);
-	int ret;
-
-	gpiod_direction_output(led->enable_gpio, 0);
-}
-
 static const struct i2c_device_id lp8860_id[] = {
 	{ "lp8860" },
 	{ }
@@ -373,7 +363,6 @@ static struct i2c_driver lp8860_driver = {
 		.of_match_table = of_lp8860_leds_match,
 	},
 	.probe		= lp8860_probe,
-	.remove		= lp8860_remove,
 	.id_table	= lp8860_id,
 };
 module_i2c_driver(lp8860_driver);
-- 
2.39.2


