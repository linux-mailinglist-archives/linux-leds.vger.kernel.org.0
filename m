Return-Path: <linux-leds+bounces-4793-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92426AD72B0
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 15:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 250743A639E
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 13:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEC323D280;
	Thu, 12 Jun 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6aEKctx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53D718FC91;
	Thu, 12 Jun 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736097; cv=none; b=kCzG2/akOCjJ522vgcgkvEJ8J94d5kz+kTwmI+oko6KfYx+PROmKpULyb9Qs3vPxOC1uCHFvOjeIZ2hbJae2pWwcigKmKfM9W+3+iX36VLsNwiynGYyKpsG+pMBgjbCTwstNHoYNWuHKgZr+iJvdxb9TkjYwP5WfarPossdYbOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736097; c=relaxed/simple;
	bh=lPBejboMsr05l/TGKotl7InDvX4h1t5+veYGAL4g9E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXcm95Lml3CbkHnHreZgnFU7ymrSUS1ld2U+aTRycL/Zm5ZiXxoQd9ELQpotZ7hveP+L/pkzSmSXhCjSzRGSpVb68qmXYKykIyFcrCpQASDpjd+Z/3poomF/m78kmeHAQEjdyyzmO0NtpM8ERBVRkEO4uaf1RNwZNtbfRfqRqQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6aEKctx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9C8C4CEEA;
	Thu, 12 Jun 2025 13:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749736097;
	bh=lPBejboMsr05l/TGKotl7InDvX4h1t5+veYGAL4g9E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6aEKctxuCKgiGsuZ8AlWvxAkZLhMkb+0n0E8N22J0SnKCynY6qPIRcKyLeRe27jR
	 X+wgH9yUf3d2gRpNKmgDCbr0V/7aKLyKMVSm7IRZPr9EKG3lCsjXRyI8QANgfJs9TC
	 mWfpyzSNA149eF2DqFUICbBOBh7+VTOgkhBjs4G8WOqNDDQyUhxs4S5uRhWYwx16Ga
	 kqwaQQmV71Ms3aYqksMzm+H9uRUOBnKq20w0dN39uulHJ47iO2PhtMbpgvRPj5b1at
	 kzUI1WhMyVo6mlCe/IWldVS+eqjqRvPsjjve3eFYL4Hwet915z4tuwEyE0jbUfO/19
	 vgvaNmCA98meg==
Date: Thu, 12 Jun 2025 14:48:13 +0100
From: Lee Jones <lee@kernel.org>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC RESEND] leds: lp55xx: led-cur property is not properly
 applied to multi-led
Message-ID: <20250612105712.GD381401@google.com>
References: <20250523093142.1498846-1-michal.vokac@ysoft.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523093142.1498846-1-michal.vokac@ysoft.com>

On Fri, 23 May 2025, Michal Vokáč wrote:

> Hi,
> 
> I am trying to wrap my head around the implementation of the multicolor
> LED support in the lp55xx family drivers.
> 
> The situation is quite straight forward when each LED is registered
> and controlled individually but it gets quite messy once you use
> the multi-color LED binding.
> 
> I am working with the imx6dl-yapp43-pegasus.dts board (in-tree). There
> is one RGB LED driven by a LP5562 LED controller. Currently the RGB LED
> is modeled as three separate LEDs and each of the LEDs has
> individually tuned led-cur property. I would like to change the device
> tree and use the multi-led binding to be able to use triggers on a chosen
> RGB color.
> 
> When I was experimenting with that, I realized there is something wrong
> with the colors and identified that the led-cur property is not properly
> applied in case the multi-led binding is used. What ultimately happens is
> that the led_current of the first LED in the multi-led group is set to
> the value of led-cur property of the last LED in the group.
> All the other LEDs in the group are left with the default reset value
> of the controller (0xaf in my case).

Does this help you:

https://lore.kernel.org/r/20250526-led-fix-v4-1-33345f6c4a78@axis.com

> Example:
> 
> led-controller@30 {
> 	compatible = "ti,lp5562";
> 	reg = <0x30>;
> 	clock-mode = /bits/ 8 <1>;
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	status = "disabled";
> 
> 	multi-led@0 {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		color = <LED_COLOR_ID_RGB>;
> 		function = LED_FUNCTION_INDICATOR;
> 
> 		led@0 {
> 			led-cur = /bits/ 8 <0x6e>;
> 			max-cur = /bits/ 8 <0xc8>;
> 			reg = <0>;
> 			color = <LED_COLOR_ID_RED>;
> 		};
> 
> 		led@1 {
> 			led-cur = /bits/ 8 <0xbe>;
> 			max-cur = /bits/ 8 <0xc8>;
> 			reg = <1>;
> 			color = <LED_COLOR_ID_GREEN>;
> 		};
> 
> 		led@2 {
> 			led-cur = /bits/ 8 <0xbe>;
> 			max-cur = /bits/ 8 <0xc8>;
> 			reg = <2>;
> 			color = <LED_COLOR_ID_BLUE>;
> 		};
> 	};
> 
> Result (values read out directly with i2cget)
> 
> led@0 current = 0xbe, should be 0x6e
> led@1 current = 0xaf, should be 0xbe
> led@2 current = 0xaf, should be 0xbe
> 
> I tried to describe the steps that led to my discovery in the comments to
> the file. Unfortunately I could not really figure out how this could be
> properly fixed.
> 
> I would appreciate any comments to this problem and hopefully some ideas
> how it could be solved.
> 
> Thank you,
> Michal
> ---
>  drivers/leds/leds-lp55xx-common.c | 34 +++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index e71456a56ab8..d2fd2d296049 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -1060,12 +1060,17 @@ static int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip
>  		return -EINVAL;
>  	}
>  
> +	// Step 8
> +	// num_channels = 1
>  	for (i = 0; i < num_channels; i++) {
>  
>  		/* do not initialize channels that are not connected */
>  		if (pdata->led_config[i].led_current == 0)
>  			continue;
>  
> +		// The pdata->led_config[0].led_current contains the led-cur
> +		// property value of the last LED from the multi-led node.
> +		// Here we store that value to the first LED in that node.
>  		led_current = pdata->led_config[i].led_current;
>  		each = led + i;
>  		ret = lp55xx_init_led(each, chip, i);
> @@ -1119,8 +1124,16 @@ static int lp55xx_parse_common_child(struct device_node *np,
>  				     struct lp55xx_led_config *cfg,
>  				     int led_number, int *chan_nr)
>  {
> +	// Step 6
> +	// This is called 3-times (n-times in general, for each LED in the multi-led node)
> +	// led_number = 0
> +	// np = led@[0,1,2]
>  	int ret;
>  
> +	// Size of the cfg is "1 lp55xx_led_config"
> +	// led_number = 0 for each of the n-calls
> +	// So the name, led_current and max_current variables are being
> +	// overwritten until values from the last led@ subnode are stored.
>  	of_property_read_string(np, "chan-name",
>  				&cfg[led_number].name);
>  	of_property_read_u8(np, "led-cur",
> @@ -1139,6 +1152,11 @@ static int lp55xx_parse_multi_led_child(struct device_node *child,
>  					 struct lp55xx_led_config *cfg,
>  					 int child_number, int color_number)
>  {
> +	// Step 5
> +	// This is called 3-times (n-times in general, for each LED in the multi-led node)
> +	// child_number = 0
> +	// color_number = [0,1,2]
> +	// child = led@[0,1,2]
>  	int chan_nr, color_id, ret;
>  
>  	ret = lp55xx_parse_common_child(child, cfg, child_number, &chan_nr);
> @@ -1159,6 +1177,10 @@ static int lp55xx_parse_multi_led(struct device_node *np,
>  				  struct lp55xx_led_config *cfg,
>  				  int child_number)
>  {
> +	// Step 4
> +	// This is called just once
> +	// child_number = 0
> +	// np = multi-led node
>  	int num_colors = 0, ret;
>  
>  	for_each_available_child_of_node_scoped(np, child) {
> @@ -1169,6 +1191,7 @@ static int lp55xx_parse_multi_led(struct device_node *np,
>  		num_colors++;
>  	}
>  
> +	// num_colors = 3
>  	cfg[child_number].num_colors = num_colors;
>  
>  	return 0;
> @@ -1178,6 +1201,10 @@ static int lp55xx_parse_logical_led(struct device_node *np,
>  				   struct lp55xx_led_config *cfg,
>  				   int child_number)
>  {
> +	// Step 3
> +	// This is called just once
> +	// child_number = 0
> +	// np = multi-led node
>  	int led_color, ret;
>  	int chan_nr = 0;
>  
> @@ -1189,6 +1216,7 @@ static int lp55xx_parse_logical_led(struct device_node *np,
>  		return ret;
>  
>  	if (led_color == LED_COLOR_ID_RGB)
> +		// We go this way
>  		return lp55xx_parse_multi_led(np, cfg, child_number);
>  
>  	ret =  lp55xx_parse_common_child(np, cfg, child_number, &chan_nr);
> @@ -1215,18 +1243,22 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  	if (!pdata)
>  		return ERR_PTR(-ENOMEM);
>  
> +	// Step 2
> +	// One RGB multiled, num_channels = 1
>  	num_channels = of_get_available_child_count(np);
>  	if (num_channels == 0) {
>  		dev_err(dev, "no LED channels\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	dev_err(dev, "LED channels: %d\n", num_channels);
>  	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
>  	if (!cfg)
>  		return ERR_PTR(-ENOMEM);
>  
>  	pdata->led_config = &cfg[0];
>  	pdata->num_channels = num_channels;
> +	// LP5562 max_channel = 4
>  	cfg->max_channel = chip->cfg->max_channel;
>  
>  	for_each_available_child_of_node(np, child) {
> @@ -1277,6 +1309,7 @@ int lp55xx_probe(struct i2c_client *client)
>  
>  	if (!pdata) {
>  		if (np) {
> +			// Step 1
>  			pdata = lp55xx_of_populate_pdata(&client->dev, np,
>  							 chip);
>  			if (IS_ERR(pdata))
> @@ -1316,6 +1349,7 @@ int lp55xx_probe(struct i2c_client *client)
>  
>  	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
>  
> +	// Step 7
>  	ret = lp55xx_register_leds(led, chip);
>  	if (ret)
>  		goto err_out;
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

