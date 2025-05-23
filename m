Return-Path: <linux-leds+bounces-4703-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5FEAC1FE0
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 11:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D91174D29
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 09:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6902253E0;
	Fri, 23 May 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="nt97+XxB"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E213DDAE;
	Fri, 23 May 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993205; cv=none; b=WFmY7qZN3D8FWVieYRoQz5B8KwweUHkziuv+s4agEbi/kgW7eZMCfg4s4aCvG7Ftv+8OCk/iBhsXNkBLqvJSvvg75qgezcP2tEYmwHyPzUg13OQjhXo0pIGoMojEO6Z8vzYVM50+dAAgRnUQAVkIq/rNda8gCTN6eFQtkZ1jGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993205; c=relaxed/simple;
	bh=ATCmv+viaSTlbE4KIivxj5Ss1BYqbwk6eKwZ+NfLHCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GpQ8+Oee+lK++novcrzps1QyzAx8X3QdA1nOVpaX7m81TXU4a9I6LgCbsaTFmIdFo3XFQb6j6IP/Nk5CheOcLl3DMMUsq2OWYpf9XPrFdHzDQLduiwC0899WApKN8SLDZSG3ARx6xVsLZiMIGkAF9EhHnxonAlUTEeKHLd27Yvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=nt97+XxB; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1747992710;
	bh=VRpPV5g4he+YcYXUfxjf8IDAnRq5aEEdOdqOxeA95yg=;
	h=From:To:Cc:Subject:Date:From;
	b=nt97+XxB8/y+OIvwqIGSaIPLKOId7kGUtAWy/H5NMvEzfsvyQfD1gQjbTt7lylK5h
	 WR7RAlClYfqmxonD2+7JJQV7uBC3KijsjKRcBkRmZlA4YxqTdQqAxHCWrqQCWUfw2b
	 FPjmHyhVGiWgrMSyEdMkdj2WsIo83UosbfqQbR9w=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id E50A6A021E;
	Fri, 23 May 2025 11:31:49 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [RFC RESEND] leds: lp55xx: led-cur property is not properly applied to multi-led
Date: Fri, 23 May 2025 11:31:42 +0200
Message-ID: <20250523093142.1498846-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I am trying to wrap my head around the implementation of the multicolor
LED support in the lp55xx family drivers.

The situation is quite straight forward when each LED is registered
and controlled individually but it gets quite messy once you use
the multi-color LED binding.

I am working with the imx6dl-yapp43-pegasus.dts board (in-tree). There
is one RGB LED driven by a LP5562 LED controller. Currently the RGB LED
is modeled as three separate LEDs and each of the LEDs has
individually tuned led-cur property. I would like to change the device
tree and use the multi-led binding to be able to use triggers on a chosen
RGB color.

When I was experimenting with that, I realized there is something wrong
with the colors and identified that the led-cur property is not properly
applied in case the multi-led binding is used. What ultimately happens is
that the led_current of the first LED in the multi-led group is set to
the value of led-cur property of the last LED in the group.
All the other LEDs in the group are left with the default reset value
of the controller (0xaf in my case).

Example:

led-controller@30 {
	compatible = "ti,lp5562";
	reg = <0x30>;
	clock-mode = /bits/ 8 <1>;
	#address-cells = <1>;
	#size-cells = <0>;
	status = "disabled";

	multi-led@0 {
		#address-cells = <1>;
		#size-cells = <0>;
		color = <LED_COLOR_ID_RGB>;
		function = LED_FUNCTION_INDICATOR;

		led@0 {
			led-cur = /bits/ 8 <0x6e>;
			max-cur = /bits/ 8 <0xc8>;
			reg = <0>;
			color = <LED_COLOR_ID_RED>;
		};

		led@1 {
			led-cur = /bits/ 8 <0xbe>;
			max-cur = /bits/ 8 <0xc8>;
			reg = <1>;
			color = <LED_COLOR_ID_GREEN>;
		};

		led@2 {
			led-cur = /bits/ 8 <0xbe>;
			max-cur = /bits/ 8 <0xc8>;
			reg = <2>;
			color = <LED_COLOR_ID_BLUE>;
		};
	};

Result (values read out directly with i2cget)

led@0 current = 0xbe, should be 0x6e
led@1 current = 0xaf, should be 0xbe
led@2 current = 0xaf, should be 0xbe

I tried to describe the steps that led to my discovery in the comments to
the file. Unfortunately I could not really figure out how this could be
properly fixed.

I would appreciate any comments to this problem and hopefully some ideas
how it could be solved.

Thank you,
Michal
---
 drivers/leds/leds-lp55xx-common.c | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index e71456a56ab8..d2fd2d296049 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -1060,12 +1060,17 @@ static int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip
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
@@ -1119,8 +1124,16 @@ static int lp55xx_parse_common_child(struct device_node *np,
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
@@ -1139,6 +1152,11 @@ static int lp55xx_parse_multi_led_child(struct device_node *child,
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
@@ -1159,6 +1177,10 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 				  struct lp55xx_led_config *cfg,
 				  int child_number)
 {
+	// Step 4
+	// This is called just once
+	// child_number = 0
+	// np = multi-led node
 	int num_colors = 0, ret;
 
 	for_each_available_child_of_node_scoped(np, child) {
@@ -1169,6 +1191,7 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 		num_colors++;
 	}
 
+	// num_colors = 3
 	cfg[child_number].num_colors = num_colors;
 
 	return 0;
@@ -1178,6 +1201,10 @@ static int lp55xx_parse_logical_led(struct device_node *np,
 				   struct lp55xx_led_config *cfg,
 				   int child_number)
 {
+	// Step 3
+	// This is called just once
+	// child_number = 0
+	// np = multi-led node
 	int led_color, ret;
 	int chan_nr = 0;
 
@@ -1189,6 +1216,7 @@ static int lp55xx_parse_logical_led(struct device_node *np,
 		return ret;
 
 	if (led_color == LED_COLOR_ID_RGB)
+		// We go this way
 		return lp55xx_parse_multi_led(np, cfg, child_number);
 
 	ret =  lp55xx_parse_common_child(np, cfg, child_number, &chan_nr);
@@ -1215,18 +1243,22 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
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
@@ -1277,6 +1309,7 @@ int lp55xx_probe(struct i2c_client *client)
 
 	if (!pdata) {
 		if (np) {
+			// Step 1
 			pdata = lp55xx_of_populate_pdata(&client->dev, np,
 							 chip);
 			if (IS_ERR(pdata))
@@ -1316,6 +1349,7 @@ int lp55xx_probe(struct i2c_client *client)
 
 	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
 
+	// Step 7
 	ret = lp55xx_register_leds(led, chip);
 	if (ret)
 		goto err_out;
-- 
2.43.0


