Return-Path: <linux-leds+bounces-4861-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF545AE0C8C
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 20:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8724A66E3
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 18:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084962C1793;
	Thu, 19 Jun 2025 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihp/hdmz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741A2BF01B;
	Thu, 19 Jun 2025 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356144; cv=none; b=LNGu5bE45+3mQdfmC0FrZeT7NebNOIJqvjvFiUuS/se+Y2p2UkKNqBVP8EG97V3zRk+OYv2RuUHl1aCyGsQiIlneAmgMzdTSClG8L1EmtllINy/0pQ/8ziZ3ifBYxALoezLW5x1qE+jbvLFbU9EyJmu9F+Iunjkq4NbQ547ynMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356144; c=relaxed/simple;
	bh=zyAhaBBb8aC37/P8Rli//4BTOCMOGbDVO3UM6TDplNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUSEnrBF33n5/MoTm+fWFEUCkY8rjWQIrTTZajzgHIZWfiOHG12n/nunzqPQAb2UJ4TajujV+3V6PSGA7KPr+aTLtoS683mOV3nxtRIx8SNY29eMmXByEDGugee3jjQ9WLeSgiRu/efJM4ETLBWoLznoCULdaokrwpNVicogRAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihp/hdmz; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso9790281fa.1;
        Thu, 19 Jun 2025 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750356141; x=1750960941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxGzjg4SElaugc7kcPlewSFYZ6N+1YZJkERa9snM144=;
        b=ihp/hdmzUPrjDX+W0kjcNp89ctUPZAZm45haZr0tbaJDRXDDbdH7DN0UqpcCO3lR0Q
         NSt7x4UHCK9qdXfcZrC+2WVomx2Ff2eJ2lq25ddHpS6anxblCaDfKrUqj7ptKg6uEIep
         wtnF+7ZL6UoJfn96iybO466vTa36RfoQ0u8aYY7hWu0XMDUfc7l8jE4IXNQSJuKdQ+jn
         2uJ1QEGzkqiwVZAk5+BKIEuhr8tww5CbUG9EK8tqJvx5S3IxplcBjkhU/92NkA5XhjpK
         0ju3WRED2/aesgUn+6LRQpbrPn+m9QsDP2AJ9vEIUgROwS23/docO6tYLJo4A3UrjpwJ
         7Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750356141; x=1750960941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxGzjg4SElaugc7kcPlewSFYZ6N+1YZJkERa9snM144=;
        b=QoUiuTI0pQ+NC+z+RqNBSdNfOcfNNjEaKIH0QfiCWCFv5/Le869Eqkq6c5fR5Ahlks
         2PXy4zqyik6QhyPklZxTFFIJiDp+N3KPWZ3nnoEgAWBcevd3zmkpWB7QJv6NK3Sig1Lb
         2ZxvgfuJDVE5xQLfzXRvLK2SM9J2AQHSt14o2OOUjCo+Mh7m9u2yRHdKy2uVOCjFJ372
         gZmOGo/KF5otzW+roJZKHfofckM+2kUsAq15JTV1crDJ2q4UMbSP2TTFda6t8cSq7AcZ
         dhPy69KIz6bH/AEEZN1DQwKvRYqippTvZhIvg0c/cYkRWSJugBwt+M2XreEVsTNkvgAT
         15+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+nSVmYUT+keX6ROL87rR3Ebxa/h77ZRqBsjUZrxV2BX0BXtClMhf16gE4UOqZVhJTSZJeqeP8QDrPf0c=@vger.kernel.org, AJvYcCVOzGj8TAZ4yuJOd7aTtBn+LnSXkqkv9C0gb6Q8yk81J5CdVbnd84Kb2N9rYzEPd3x/zIP2CPj7ilLdEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkR2HBaMI3yqtzK1ffkKAFIRjkthS0s4sTvE0RA9swrjHB9Qg2
	Y0lW/r7BUaq+Uipxd18ynJdGtduGa537xrqTuz/CscsvtlB4OL6HakjXkW4OpQ==
X-Gm-Gg: ASbGncv54osMqVhPcKkX99v2mUEDUgi2uAuPZ/ddPSVrUP3jLJGVrqNqSTuorkH2cSm
	smK/bq9ZBNC2Rn/uMpJHglMOJ9ch32DrZjei/2SeLek8XpzFopnPbEWCvbRD+JRGCKl79hFw44y
	f0WDtPGYR8s0kXpEFq0Z97uKNDJkkU8x7VT9vfqgTFyeMgkdmDwsufvxBGqnD4tPHusuYDICEEn
	Dn1PWyAyppQlyzEaRJUmwM27cyC/VMYplCXdkP1rAiY9ISUMkOcWtYVI6tFFN/eaK0fES/s7SoN
	YgHmbNi2bNAA280SvklZjz/2vWNmXm4uulknC1cvDaR/fvqsUwN06oHMlx5eGmPmB2xi4BRCjNg
	=
X-Google-Smtp-Source: AGHT+IEOQqZdleA0s3bSTUbd5pVzsFo9kudF1SUUgtDidTyx04VO0OUbqdL++y5dfVwuA7xvGfqbow==
X-Received: by 2002:a05:651c:546:b0:32a:de85:4613 with SMTP id 38308e7fff4ca-32b4a5cbf90mr70336121fa.23.1750356140421;
        Thu, 19 Jun 2025 11:02:20 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f599fcsm169811fa.6.2025.06.19.11.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 11:02:19 -0700 (PDT)
Message-ID: <4cca1f41-e3ab-467c-867f-84b26dc03159@gmail.com>
Date: Thu, 19 Jun 2025 20:02:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND] leds: lp55xx: led-cur property is not properly
 applied to multi-led
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250523093142.1498846-1-michal.vokac@ysoft.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250523093142.1498846-1-michal.vokac@ysoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

On 5/23/25 11:31, Michal Vokáč wrote:
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
> 
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
>   drivers/leds/leds-lp55xx-common.c | 34 +++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index e71456a56ab8..d2fd2d296049 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -1060,12 +1060,17 @@ static int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip
>   		return -EINVAL;
>   	}
>   
> +	// Step 8
> +	// num_channels = 1
>   	for (i = 0; i < num_channels; i++) {
>   
>   		/* do not initialize channels that are not connected */
>   		if (pdata->led_config[i].led_current == 0)
>   			continue;
>   
> +		// The pdata->led_config[0].led_current contains the led-cur
> +		// property value of the last LED from the multi-led node.
> +		// Here we store that value to the first LED in that node.
>   		led_current = pdata->led_config[i].led_current;
>   		each = led + i;
>   		ret = lp55xx_init_led(each, chip, i);
> @@ -1119,8 +1124,16 @@ static int lp55xx_parse_common_child(struct device_node *np,
>   				     struct lp55xx_led_config *cfg,
>   				     int led_number, int *chan_nr)
>   {
> +	// Step 6
> +	// This is called 3-times (n-times in general, for each LED in the multi-led node)
> +	// led_number = 0
> +	// np = led@[0,1,2]
>   	int ret;
>   
> +	// Size of the cfg is "1 lp55xx_led_config"
> +	// led_number = 0 for each of the n-calls
> +	// So the name, led_current and max_current variables are being
> +	// overwritten until values from the last led@ subnode are stored.

It seems that struct lp55xx_led_config needs an improvement to be
capable of storing led-cur and max-cur per multi-subLEDs.

Probably there should be added a pointer property that will be
dynamically allocated either to a single element, or for multi-color
LEDs to multiple elements.

Let's say:

struct lp55xx_sub_led {
     u8 led_current;  /* mA x10, 0 if led is not connected */
     u8 max_current;
     int color_id;
     int output_num;
}

struct lp55xx_led_config {
     const char *name;
     const char *default_trigger;
     u8 chan_nr;
     int num_colors;
     unsigned int max_channel;
     struct lp55xx_sub_led *leds;
};

Then lp55xx_parse_common_child() will need to accept also subLED id.
For monochrome LEDs it will be always 0.

>   	of_property_read_string(np, "chan-name",
>   				&cfg[led_number].name);
>   	of_property_read_u8(np, "led-cur",
> @@ -1139,6 +1152,11 @@ static int lp55xx_parse_multi_led_child(struct device_node *child,
>   					 struct lp55xx_led_config *cfg,
>   					 int child_number, int color_number)
>   {
> +	// Step 5
> +	// This is called 3-times (n-times in general, for each LED in the multi-led node)
> +	// child_number = 0
> +	// color_number = [0,1,2]
> +	// child = led@[0,1,2]
>   	int chan_nr, color_id, ret;
>   
>   	ret = lp55xx_parse_common_child(child, cfg, child_number, &chan_nr);
> @@ -1159,6 +1177,10 @@ static int lp55xx_parse_multi_led(struct device_node *np,
>   				  struct lp55xx_led_config *cfg,
>   				  int child_number)
>   {
> +	// Step 4
> +	// This is called just once
> +	// child_number = 0
> +	// np = multi-led node
>   	int num_colors = 0, ret;
>   
>   	for_each_available_child_of_node_scoped(np, child) {
> @@ -1169,6 +1191,7 @@ static int lp55xx_parse_multi_led(struct device_node *np,
>   		num_colors++;
>   	}
>   
> +	// num_colors = 3
>   	cfg[child_number].num_colors = num_colors;
>   
>   	return 0;
> @@ -1178,6 +1201,10 @@ static int lp55xx_parse_logical_led(struct device_node *np,
>   				   struct lp55xx_led_config *cfg,
>   				   int child_number)
>   {
> +	// Step 3
> +	// This is called just once
> +	// child_number = 0
> +	// np = multi-led node
>   	int led_color, ret;
>   	int chan_nr = 0;
>   
> @@ -1189,6 +1216,7 @@ static int lp55xx_parse_logical_led(struct device_node *np,
>   		return ret;
>   
>   	if (led_color == LED_COLOR_ID_RGB)
> +		// We go this way
>   		return lp55xx_parse_multi_led(np, cfg, child_number);
>   
>   	ret =  lp55xx_parse_common_child(np, cfg, child_number, &chan_nr);
> @@ -1215,18 +1243,22 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>   	if (!pdata)
>   		return ERR_PTR(-ENOMEM);
>   
> +	// Step 2
> +	// One RGB multiled, num_channels = 1
>   	num_channels = of_get_available_child_count(np);
>   	if (num_channels == 0) {
>   		dev_err(dev, "no LED channels\n");
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> +	dev_err(dev, "LED channels: %d\n", num_channels);
>   	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
>   	if (!cfg)
>   		return ERR_PTR(-ENOMEM);
>   
>   	pdata->led_config = &cfg[0];
>   	pdata->num_channels = num_channels;
> +	// LP5562 max_channel = 4
>   	cfg->max_channel = chip->cfg->max_channel;
>   
>   	for_each_available_child_of_node(np, child) {
> @@ -1277,6 +1309,7 @@ int lp55xx_probe(struct i2c_client *client)
>   
>   	if (!pdata) {
>   		if (np) {
> +			// Step 1
>   			pdata = lp55xx_of_populate_pdata(&client->dev, np,
>   							 chip);
>   			if (IS_ERR(pdata))
> @@ -1316,6 +1349,7 @@ int lp55xx_probe(struct i2c_client *client)
>   
>   	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
>   
> +	// Step 7
>   	ret = lp55xx_register_leds(led, chip);
>   	if (ret)
>   		goto err_out;

-- 
Best regards,
Jacek Anaszewski


