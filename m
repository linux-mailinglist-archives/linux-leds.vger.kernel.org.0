Return-Path: <linux-leds+bounces-2592-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA1A96A0D0
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 16:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87BEC286AC7
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 14:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F57813CFA6;
	Tue,  3 Sep 2024 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="c684NoBO"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB4E1CA69B;
	Tue,  3 Sep 2024 14:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725374304; cv=none; b=fDjK5TdcC+50VbxVjnzSKlXTNlABELiKCPidENFKlmOSjSZIH1H9lty6tWybv/m4UFQrQIHDTNYE8aEX5Mequ92QZvTWv6QwYcnpFL5NlB3G0qlVA49tOJl0PcSBqhEGuMB2T3ukADH+63XrUheClVRA8z65GiNHIMYelHEPtOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725374304; c=relaxed/simple;
	bh=bjOoW9AcUjBAChkWwwUlHy7Q/WmL5wJgs7drSknkdiY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dZ8+4fAfEzj/3iN2T/sLshPX2WqJrr7K5g7W5SitdgIgDrdoiBDffCPYCZRt4ECJ5DVwxaoLh67bQDzW79rOAql2CZPI1FR34Z9VPFI8sonGp2NLc7T4U/ScEwJKJqxftl4GZ/y0PyX7C937pdYkLEvzGiM6Evo9pvYcLoORZbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=c684NoBO; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1725373931;
	bh=pUDU7P1M3Th0MRLFiahhDUdVpN72eijtFYzRoi0jvsk=;
	h=From:To:Cc:Subject:Date:From;
	b=c684NoBOlY/dwj1bAYu3+y5LKTrqOXVz2T6s1GPiJProBwr1UpJhvsu8oFFVR0yJW
	 TGPDcVElWT/I1WfHwo4TCfH22o6Ny5+azvh+1PSTcfnl5mKyZFa5M5NQoN0zf9rOOt
	 3YmC9s/9mDPI54DrY/nrXilPmniNSNEQJ0iGo7EE=
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
	by uho.ysoft.cz (Postfix) with ESMTP id 53B1BA4473;
	Tue,  3 Sep 2024 16:32:11 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [RFC] leds: lp55xx: led-cur property is not properly used in case of multi-led
Date: Tue,  3 Sep 2024 16:31:34 +0200
Message-Id: <1725373894-1122-1-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

I am trying to wrap my head around the implementation of the multicolor
LED support in the lp55xx family drivers.

The situation is quite straight forward when each LED is registered
and controlled individually but it gets quite messy once you use
the "multi-color LED interface".

I am working with the imx6dl-yapp43-pegasus.dts board (in-tree). There
is one RGB LED driven by a LP5562 LED controller. Currently the RGB LED
is described as three separate LEDs and each of the LEDs has
individually tuned led-cur property. I would like to change the device
tree and use the multi-led binding to be able to use triggers on a chosen
RGB color.

I already sent a patch to add multicolor brightness control to the lp5562
driver [1] (no response yet).

When I was experimenting with that, I realized there is something wrong
with the colors and identified that the led-cur property is not properly
applied in case the multi-led binding is used. It seems it is broken since
the beginning when the multicolor support was added.

What ultimately happens is that the led_current of the first LED in the multi-led
group is set to the value of led-cur property of the last LED in the group.
All the other LEDs in the group are left with the default value from the
controller.

I tried to describe the steps that led to my discovery in the comments to
the file. Unfortunately I could not really figure out how this could be
properly fixed.

I would appreciate any comments to this problem and hopefully some ideas
how it could be solved.

Thank you,
Michal

[1] https://patches.linaro.org/project/linux-leds/patch/20240628064515.3765371-1-michal.vokac@ysoft.com/
---
 drivers/leds/leds-lp55xx-common.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index f0e30b86dbfb..00dc7d3300b7 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -1074,12 +1074,17 @@ static int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip
 		return -EINVAL;
 	}
 
+	// Step 8
+	// num_channels = 1
 	for (i = 0; i < num_channels; i++) {
 
 		/* do not initialize channels that are not connected */
 		if (pdata->led_config[i].led_current == 0)
 			continue;
 
+		// The pdata->led_config[0].led_current contains the led-cur
+		// property value of the last LED from the multi-led node.
+		// Here we store that value to the first LED in that node.
 		led_current = pdata->led_config[i].led_current;
 		each = led + i;
 		ret = lp55xx_init_led(each, chip, i);
@@ -1133,8 +1138,16 @@ static int lp55xx_parse_common_child(struct device_node *np,
 				     struct lp55xx_led_config *cfg,
 				     int led_number, int *chan_nr)
 {
+	// Step 6
+	// This is called 3-times (n-times in general, for each LED in the multi-led node)
+	// led_number = 0
+	// np = led@[0,1,2]
 	int ret;
 
+	// Size of the cfg is "1 lp55xx_led_config"
+	// led_number = 0 for each of the n-calls
+	// So the name, led_current and max_current variables are being
+	// overwritten until values from the last led@ subnode are stored.
 	of_property_read_string(np, "chan-name",
 				&cfg[led_number].name);
 	of_property_read_u8(np, "led-cur",
@@ -1156,6 +1169,11 @@ static int lp55xx_parse_multi_led_child(struct device_node *child,
 					 struct lp55xx_led_config *cfg,
 					 int child_number, int color_number)
 {
+	// Step 5
+	// This is called 3-times (n-times in general, for each LED in the multi-led node)
+	// child_number = 0
+	// color_number = [0,1,2]
+	// child = led@[0,1,2]
 	int chan_nr, color_id, ret;
 
 	ret = lp55xx_parse_common_child(child, cfg, child_number, &chan_nr);
@@ -1176,6 +1194,10 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 				  struct lp55xx_led_config *cfg,
 				  int child_number)
 {
+	// Step 4
+	// This is called just once
+	// child_number = 0
+	// np = multi-led node
 	struct device_node *child;
 	int num_colors = 0, ret;
 
@@ -1188,7 +1210,7 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 		}
 		num_colors++;
 	}
-
+	// num_colors = 3
 	cfg[child_number].num_colors = num_colors;
 
 	return 0;
@@ -1198,6 +1220,10 @@ static int lp55xx_parse_logical_led(struct device_node *np,
 				   struct lp55xx_led_config *cfg,
 				   int child_number)
 {
+	// Step 3
+	// This is called just once
+	// child_number = 0
+	// np = multi-led node
 	int led_color, ret;
 	int chan_nr = 0;
 
@@ -1209,6 +1235,7 @@ static int lp55xx_parse_logical_led(struct device_node *np,
 		return ret;
 
 	if (led_color == LED_COLOR_ID_RGB)
+		// We go this way
 		return lp55xx_parse_multi_led(np, cfg, child_number);
 
 	ret =  lp55xx_parse_common_child(np, cfg, child_number, &chan_nr);
@@ -1235,18 +1262,22 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
+	// Step 2
+	// One RGB multiled, num_channels = 1
 	num_channels = of_get_available_child_count(np);
 	if (num_channels == 0) {
 		dev_err(dev, "no LED channels\n");
 		return ERR_PTR(-EINVAL);
 	}
 
+	dev_err(dev, "LED channels: %d\n", num_channels);
 	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
 	if (!cfg)
 		return ERR_PTR(-ENOMEM);
 
 	pdata->led_config = &cfg[0];
 	pdata->num_channels = num_channels;
+	// LP5562 max_channel = 4
 	cfg->max_channel = chip->cfg->max_channel;
 
 	for_each_available_child_of_node(np, child) {
@@ -1297,6 +1328,7 @@ int lp55xx_probe(struct i2c_client *client)
 
 	if (!pdata) {
 		if (np) {
+			// Step 1
 			pdata = lp55xx_of_populate_pdata(&client->dev, np,
 							 chip);
 			if (IS_ERR(pdata))
@@ -1336,6 +1368,7 @@ int lp55xx_probe(struct i2c_client *client)
 
 	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
 
+	// Step 7
 	ret = lp55xx_register_leds(led, chip);
 	if (ret)
 		goto err_out;
-- 
2.1.4


