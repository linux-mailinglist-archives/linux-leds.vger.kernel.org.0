Return-Path: <linux-leds+bounces-2390-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D22947C9E
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 16:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4F7E283F46
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 14:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3DC1386B4;
	Mon,  5 Aug 2024 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JZroNWJv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A312D20D;
	Mon,  5 Aug 2024 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722867233; cv=none; b=L2Y+5hiBuzXDsON8pWvEglyY6fPvMb3377yeCCgzZ57NthAAwRIoqKjkg8WoOLggBDz+3UdduMxRpEhHhwxnbdGf4oXd/sh9dLwBDC3aI/8fpEKEp87H1RhDfgC26/q+ez9emp3DLDpaSaH8jHGQLOrYegKXW9Q1koxpbeLLW4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722867233; c=relaxed/simple;
	bh=gGroiJmAXEfKknUIRuX46ESxajsasvYDJef5x8SfGLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcRbVNZiaH34aq+qM8dkDRw05Fm+PshPhGsr4Wgz3rA/zrj6kwUX58dUgR0rPCqsRIpHri400nAXNf3fJwh4F3C+MjuwvGXtvOyuSWjX2MFD5fYYa/LiP29icSnTUpE8/Nwh3P4kjf8fQPnetLMNwZlAVHu3RciWCJt37Td8dF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=JZroNWJv; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ayRqsRi27fVp1ayRrsGVcT; Mon, 05 Aug 2024 16:12:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722867156;
	bh=UV9Lf+UJit2CsfGcquYK3J0/PfgkWZge4qeXWFKquDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=JZroNWJvPBoP8sVVK7NgB4FJdBki53/CXH1XzG8xKNq5MzTnAxzd5A7WCrCP9w/sI
	 ftf8qweUNPdmJ7ogk27KZunMCp/olVpf5hi571bAD2OOepQZ7WXJZ8bAR9Dc8AiOe8
	 c+Sn6zW78qTEPaeGIgSiuVWUEYlpGVw3GUQ8R+YQIpDkAAceueDwkzLckAKC3nq2Sa
	 U69CInvPc12HMEdo/KDhZbTmKYM9G59Vtvq6CTj7drxpk/dRJHVRj2WDtwFLutE1yg
	 zYTpmlipuwhWm2zLbmeNTca26Fh+iFqzGG4niRaFiM9hWZZNujA40Q9d2V7gnvWV5I
	 sQ9wc0Pd1gfHg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 05 Aug 2024 16:12:36 +0200
X-ME-IP: 90.11.132.44
Message-ID: <8c6bd40f-164d-46ba-80de-36ea349e1437@wanadoo.fr>
Date: Mon, 5 Aug 2024 16:12:30 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] Add multicolor support to BlinkM LED driver
To: Joseph Strauss <jstrauss@mailbox.org>, lee@kernel.org
Cc: pavel@ucw.cz, jansimon.moeller@gmx.de, conor@kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240710184844.108006-1-jstrauss@mailbox.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240710184844.108006-1-jstrauss@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 10/07/2024 à 20:48, Joseph Strauss a écrit :
> Add multicolor support to the BlinkM driver, making it easier to control
> from userspace. The BlinkM LED is a programmable RGB LED. The driver
> currently supports only the regular LED sysfs class, resulting in the
> creation of three distinct classes, one for red, green, and blue. The
> user then has to input three values into the three seperate brightness
> files within those classes. The multicolor LED framework makes the
> device easier to control with the multi_intensity file: the user can
> input three values at once to form a color, while still controlling the
> lightness with the brightness file.
> 
> The main struct blinkm_led has changed slightly. The struct led_classdev
> for the regular sysfs classes remain. The blinkm_probe function checks
> CONFIG_LEDS_BLINKM_MULTICOLOR to decide whether to load the seperate
> sysfs classes or the single multicolor one, but never both. The
> blinkm_set_mc_brightness() function had to be added to calculate the
> three color components and then set the fields of the blinkm_data
> structure accordingly.
> 
> Signed-off-by: Joseph Strauss <jstrauss@mailbox.org>
> ---

Hi,

this patch has already been applied, but I have 2 questions/remarks below:

...

> -static int blinkm_probe(struct i2c_client *client)
> +static int register_separate_colors(struct i2c_client *client, struct blinkm_data *data)
>   {
> -	struct blinkm_data *data;
> -	struct blinkm_led *led[3];
> -	int err, i;
> +	/* 3 separate classes for red, green, and blue respectively */
> +	struct blinkm_led *leds[NUM_LEDS];
> +	int err;
>   	char blinkm_led_name[28];
> -
> -	data = devm_kzalloc(&client->dev,
> -			sizeof(struct blinkm_data), GFP_KERNEL);
> -	if (!data) {
> -		err = -ENOMEM;
> -		goto exit;
> -	}
> -
> -	data->i2c_addr = 0x08;
> -	/* i2c addr  - use fake addr of 0x08 initially (real is 0x09) */
> -	data->fw_ver = 0xfe;
> -	/* firmware version - use fake until we read real value
> -	 * (currently broken - BlinkM confused!) */
> -	data->script_id = 0x01;
> -	data->i2c_client = client;
> -
> -	i2c_set_clientdata(client, data);
> -	mutex_init(&data->update_lock);
> -
> -	/* Register sysfs hooks */
> -	err = sysfs_create_group(&client->dev.kobj, &blinkm_group);
> -	if (err < 0) {
> -		dev_err(&client->dev, "couldn't register sysfs group\n");
> -		goto exit;
> -	}
> -
> -	for (i = 0; i < 3; i++) {
> +	/* Register red, green, and blue sysfs classes */
> +	for (int i = 0; i < NUM_LEDS; i++) {
>   		/* RED = 0, GREEN = 1, BLUE = 2 */
> -		led[i] = &data->blinkm_leds[i];
> -		led[i]->i2c_client = client;
> -		led[i]->id = i;
> -		led[i]->led_cdev.max_brightness = 255;
> -		led[i]->led_cdev.flags = LED_CORE_SUSPENDRESUME;
> +		leds[i] = &data->blinkm_leds[i];
> +		leds[i]->i2c_client = client;
> +		leds[i]->id = i;
> +		leds[i]->cdev.led_cdev.max_brightness = 255;
> +		leds[i]->cdev.led_cdev.flags = LED_CORE_SUSPENDRESUME;
>   		switch (i) {
>   		case RED:
> -			snprintf(blinkm_led_name, sizeof(blinkm_led_name),
> +			scnprintf(blinkm_led_name, sizeof(blinkm_led_name),
>   					 "blinkm-%d-%d-red",
>   					 client->adapter->nr,
>   					 client->addr);
> -			led[i]->led_cdev.name = blinkm_led_name;
> -			led[i]->led_cdev.brightness_set_blocking =
> +			leds[i]->cdev.led_cdev.name = blinkm_led_name;
> +			leds[i]->cdev.led_cdev.brightness_set_blocking =
>   							blinkm_led_red_set;
>   			err = led_classdev_register(&client->dev,
> -						    &led[i]->led_cdev);
> +							&leds[i]->cdev.led_cdev);
>   			if (err < 0) {
>   				dev_err(&client->dev,
>   					"couldn't register LED %s\n",
> -					led[i]->led_cdev.name);
> +					leds[i]->cdev.led_cdev.name);
>   				goto failred;
>   			}
>   			break;
>   		case GREEN:
> -			snprintf(blinkm_led_name, sizeof(blinkm_led_name),
> +			scnprintf(blinkm_led_name, sizeof(blinkm_led_name),
>   					 "blinkm-%d-%d-green",
>   					 client->adapter->nr,
>   					 client->addr);
> -			led[i]->led_cdev.name = blinkm_led_name;
> -			led[i]->led_cdev.brightness_set_blocking =
> +			leds[i]->cdev.led_cdev.name = blinkm_led_name;
> +			leds[i]->cdev.led_cdev.brightness_set_blocking =
>   							blinkm_led_green_set;
>   			err = led_classdev_register(&client->dev,
> -						    &led[i]->led_cdev);
> +						&leds[i]->cdev.led_cdev);
>   			if (err < 0) {
>   				dev_err(&client->dev,
>   					"couldn't register LED %s\n",
> -					led[i]->led_cdev.name);
> +					leds[i]->cdev.led_cdev.name);
>   				goto failgreen;
>   			}
>   			break;
>   		case BLUE:
> -			snprintf(blinkm_led_name, sizeof(blinkm_led_name),
> +			scnprintf(blinkm_led_name, sizeof(blinkm_led_name),
>   					 "blinkm-%d-%d-blue",
>   					 client->adapter->nr,
>   					 client->addr);
> -			led[i]->led_cdev.name = blinkm_led_name;
> -			led[i]->led_cdev.brightness_set_blocking =
> +			leds[i]->cdev.led_cdev.name = blinkm_led_name;
> +			leds[i]->cdev.led_cdev.brightness_set_blocking =
>   							blinkm_led_blue_set;
>   			err = led_classdev_register(&client->dev,
> -						    &led[i]->led_cdev);
> +							&leds[i]->cdev.led_cdev);
>   			if (err < 0) {
>   				dev_err(&client->dev,
>   					"couldn't register LED %s\n",
> -					led[i]->led_cdev.name);
> +					leds[i]->cdev.led_cdev.name);
>   				goto failblue;
>   			}
>   			break;
> +		default:
> +			break;
>   		}		/* end switch */
>   	}			/* end for */
> -
> -	/* Initialize the blinkm */
> -	blinkm_init_hw(client);
> -
>   	return 0;
>   
>   failblue:
> -	led_classdev_unregister(&led[GREEN]->led_cdev);
> -
> +	led_classdev_unregister(&leds[GREEN]->cdev.led_cdev);
>   failgreen:
> -	led_classdev_unregister(&led[RED]->led_cdev);
> -
> +	led_classdev_unregister(&leds[RED]->cdev.led_cdev);
>   failred:
>   	sysfs_remove_group(&client->dev.kobj, &blinkm_group);

I think that this would be more logical to have it in an error handling 
path in blinkm_probe(), as it was before.

This is strange to un-do sysfs_create_group() here in 
register_separate_colors() and...

> -exit:
> +
>   	return err;
>   }
>   
> +static int register_multicolor(struct i2c_client *client, struct blinkm_data *data)
> +{
> +	struct blinkm_led *mc_led;
> +	struct mc_subled *mc_led_info;
> +	char blinkm_led_name[28];
> +	int err;
> +
> +	/* Register multicolor sysfs class */
> +	/* The first element of leds is used for multicolor facilities */
> +	mc_led = &data->blinkm_leds[RED];
> +	mc_led->i2c_client = client;
> +
> +	mc_led_info = devm_kcalloc(&client->dev, NUM_LEDS, sizeof(*mc_led_info),
> +					GFP_KERNEL);
> +	if (!mc_led_info)
> +		return -ENOMEM;
> +
> +	mc_led_info[RED].color_index = LED_COLOR_ID_RED;
> +	mc_led_info[GREEN].color_index = LED_COLOR_ID_GREEN;
> +	mc_led_info[BLUE].color_index = LED_COLOR_ID_BLUE;
> +
> +	mc_led->cdev.mcled_cdev.subled_info = mc_led_info;
> +	mc_led->cdev.mcled_cdev.num_colors = NUM_LEDS;
> +	mc_led->cdev.mcled_cdev.led_cdev.brightness = 255;
> +	mc_led->cdev.mcled_cdev.led_cdev.max_brightness = 255;
> +	mc_led->cdev.mcled_cdev.led_cdev.flags = LED_CORE_SUSPENDRESUME;
> +
> +	scnprintf(blinkm_led_name, sizeof(blinkm_led_name),
> +		 "blinkm-%d-%d:rgb:indicator",
> +		 client->adapter->nr,
> +		 client->addr);
> +	mc_led->cdev.mcled_cdev.led_cdev.name = blinkm_led_name;
> +	mc_led->cdev.mcled_cdev.led_cdev.brightness_set_blocking = blinkm_set_mc_brightness;
> +
> +	err = led_classdev_multicolor_register(&client->dev, &mc_led->cdev.mcled_cdev);
> +	if (err < 0) {
> +		dev_err(&client->dev, "couldn't register LED %s\n",
> +				mc_led->cdev.led_cdev.name);
> +		sysfs_remove_group(&client->dev.kobj, &blinkm_group);

... here in register_multicolor().


Also, is it on pourpose that err is *not* propagated?

If led_classdev_multicolor_register() fails, we still return 0.

> +	}
> +	return 0;
> +}
> +
> +static int blinkm_probe(struct i2c_client *client)
> +{
> +	struct blinkm_data *data;
> +	int err;
> +
> +	data = devm_kzalloc(&client->dev,
> +			sizeof(struct blinkm_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->i2c_addr = 0x08;
> +	/* i2c addr  - use fake addr of 0x08 initially (real is 0x09) */
> +	data->fw_ver = 0xfe;
> +	/* firmware version - use fake until we read real value
> +	 * (currently broken - BlinkM confused!)
> +	 */
> +	data->script_id = 0x01;
> +	data->i2c_client = client;
> +
> +	i2c_set_clientdata(client, data);
> +	mutex_init(&data->update_lock);
> +
> +	/* Register sysfs hooks */
> +	err = sysfs_create_group(&client->dev.kobj, &blinkm_group);
> +	if (err < 0) {
> +		dev_err(&client->dev, "couldn't register sysfs group\n");
> +		return err;
> +	}
> +
> +	if (!IS_ENABLED(CONFIG_LEDS_BLINKM_MULTICOLOR)) {
> +		err = register_separate_colors(client, data);
> +		if (err < 0)
> +			return err;
> +	} else {
> +		err = register_multicolor(client, data);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	blinkm_init_hw(client);
> +
> +	return 0;
> +}

...

CJ



