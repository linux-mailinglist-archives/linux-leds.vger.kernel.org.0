Return-Path: <linux-leds+bounces-4782-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE2DAD446D
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 23:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A56B189B3D0
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 21:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E63A2676D1;
	Tue, 10 Jun 2025 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="I67KCJQQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00327472;
	Tue, 10 Jun 2025 21:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589756; cv=none; b=SYGmkASYXBCIGxtWdDQ/MzFYShDM/9VF7HvWwXetjePcQg//OcXO784VBZ3gkRXfOI4atbgKWrABZ6bywSQBJxkpgzb5N0pE0Yh/zDqNriyAVTDBqnY4F2uMEpnqdz/B6xOESr+IXy3XBL6DnOGwm9UzbZdHdJpF/Lg7RvtDYj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589756; c=relaxed/simple;
	bh=EZjkrxi6peS+7wpXuxQb34rIlFS/bTDwMsD9Ij1kHnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWuvWRnABRLC7LS0/oMiBCVJyZaP0SPLAOp1zR7OKceI4b7UNmtGh6JYbUEiTSvDbE9hHrkPJNwcWR+uajMFT+ObbEyM8b84gCZYqEPlOFnwbGlUB2tESqwXoOeZKAxZEkOqYTjLf2rKFn9vhuFbs8eFOhJ6Gq7mORIiMiH+TuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=I67KCJQQ; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id P6CPuzDVTQ1a2P6CPunbgi; Tue, 10 Jun 2025 23:08:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749589682;
	bh=j/7iFzXsLAvMUXEaYKAeTYE5FeujyoCY/Mn89G6uMns=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=I67KCJQQL/+7gR+x/HS0J9W6tRTfZ5M4wCaumZynz0Fsr1APg6/3tYQsrL+BS2VWf
	 4ubWYh4PjfytLG5zCMCJ/Ap1deu3P+vdUR87TCl11aWRXjNcmMF4X2xfqLMTUefXz3
	 LKeYNbZ53sPd+47tq3E3m5/uGx+lWUbsoqAqxfdKGGlSjYhfqHklUkBYaeyhWwKVug
	 GpigMaIbQikT/jUSXQzyL1xW+UokiLexkoDPwPY+dEEFbiB08WGqihSWV6V2BS/Y6r
	 +BBJtkBY39iqu8UJ1+4WiZqusLvb0Ja14H0gYklfAMgHShpPMuPjiqnL8GhLK/0N3I
	 vWvLIoAjbrLOw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 10 Jun 2025 23:08:02 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <42676fe3-8758-42ea-8e21-9c3955468c78@wanadoo.fr>
Date: Tue, 10 Jun 2025 23:07:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED
 Driver
To: Nam Tran <trannamatk@gmail.com>, lee@kernel.org
Cc: pavel@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250610174319.183375-1-trannamatk@gmail.com>
 <20250610174319.183375-4-trannamatk@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250610174319.183375-4-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 10/06/2025 à 19:43, Nam Tran a écrit :
> The LP5812 is a 4×3 matrix RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
> 4 RGB LEDs. Each LED can be configured through the related registers
> to realize vivid and fancy lighting effects.

Hi,

...

> +static struct lp5812_data *lp5812_of_populate_pdata(struct device *dev,
> +						    struct device_node *np,
> +						    struct lp5812_chip *chip)
> +{
> +	struct device_node *child;
> +	struct lp5812_data *pdata;
> +	struct lp5812_led_config *cfg;
> +	int num_channels, i = 0, ret;
> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	num_channels = of_get_available_child_count(np);
> +	if (num_channels == 0) {
> +		dev_err(dev, "no LED channels\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
> +	if (!cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pdata->led_config = &cfg[0];
> +	pdata->num_channels = num_channels;
> +
> +	for_each_available_child_of_node(np, child) {

Maybe for_each_available_child_of_node_scoped() to slihtly simplify the 
code?

> +		ret = lp5812_parse_logical_led(child, cfg, i);
> +		if (ret) {
> +			of_node_put(child);
> +			return ERR_PTR(-EINVAL);
> +		}
> +		i++;
> +	}
> +
> +	of_property_read_string(np, "label", &pdata->label);
> +
> +	return pdata;
> +}

...

> +static ssize_t lp5812_aeu_slope_time(struct device *dev,
> +				     struct device_attribute *attr,
> +				     enum slope_time_num slope_chan,
> +				     const char *buf, size_t len)
> +{
> +	struct lp5812_led *led;
> +	struct lp5812_chip *chip;
> +	struct lp5812_led_config *led_cfg;
> +	const char *name = dev->platform_data;
> +	int val[LED_COLOR_ID_MAX];
> +	u8 chan_nr = 0;
> +	char *sub_str, *str = (char *)buf;
> +	int i, ret, aeu;
> +	union slope_time slope_time_val;
> +	u16 reg;
> +
> +	if (strcmp(name, LP5812_SC_LED) == 0)
> +		led = dev_to_lp5812_led(dev);
> +	else
> +		led = dev_to_lp5812_led_mc(dev);
> +
> +	chan_nr = led->chan_nr;
> +	chip = led->chip;
> +	led_cfg = &chip->pdata->led_config[chan_nr];
> +
> +	sub_str = strsep(&str, ":");
> +	if (!sub_str)
> +		return -EINVAL;
> +	if (kstrtoint(&sub_str[3], 0, &aeu))
> +		return -EINVAL;
> +
> +	pr_info("AEU = %d", aeu);
> +
> +	guard(mutex)(&chip->lock);
> +	for (i = 0; i < led_cfg->num_colors; i++) {
> +		sub_str = strsep(&str, " ");
> +		if (!sub_str)
> +			return -EINVAL;
> +		if (kstrtoint(sub_str, 0, &val[i]))
> +			return -EINVAL;
> +		if (val[i] < 0 || val[i] > 15)
> +			return -EINVAL;
> +
> +		reg = LP5812_AEU_SLOPE_TIME_ADDR(led_cfg->led_id[i], aeu, slope_chan);
> +
> +		/* get original value of slope time */
> +		ret = lp5812_read(chip, reg, &slope_time_val.time_val);
> +		if (ret)
> +			return ret;
> +
> +		/* Update new value for slope time*/
> +		if (slope_chan == LP5812_SLOPE_TIME_T1 || slope_chan == LP5812_SLOPE_TIME_T3)
> +			slope_time_val.s_time.first = val[i];
> +		if (slope_chan == LP5812_SLOPE_TIME_T2 || slope_chan == LP5812_SLOPE_TIME_T4)
> +			slope_time_val.s_time.second = val[i];
> +
> +		/* Save updated value to hardware */
> +		ret = lp5812_write(chip, reg, slope_time_val.time_val);

Should we do something if ret != 0?

> +	}
> +
> +	return len;
> +}

...

> +static struct attribute *lp5812_led_attrs[] = {
> +	&dev_attr_led_current.attr,
> +	&dev_attr_max_current.attr,
> +	&dev_attr_mode.attr,
> +	&dev_attr_activate.attr,
> +	&dev_attr_pwm_dimming_scale.attr,
> +	&dev_attr_pwm_phase_align.attr,
> +	&dev_attr_auto_time_pause_at_start.attr,
> +	&dev_attr_auto_time_pause_at_stop.attr,
> +	&dev_attr_auto_playback_eau_number.attr,
> +	&dev_attr_auto_playback_time.attr,
> +	&dev_attr_aeu_playback_time.attr,
> +	&dev_attr_aeu_pwm1.attr,
> +	&dev_attr_aeu_pwm2.attr,
> +	&dev_attr_aeu_pwm3.attr,
> +	&dev_attr_aeu_pwm4.attr,
> +	&dev_attr_aeu_pwm5.attr,
> +	&dev_attr_aeu_slop_time_t1.attr,
> +	&dev_attr_aeu_slop_time_t2.attr,
> +	&dev_attr_aeu_slop_time_t3.attr,
> +	&dev_attr_aeu_slop_time_t4.attr,
> +	&dev_attr_lod_lsd.attr,
> +	NULL,

Unneeded trailing comma after a terminator.

> +};
> +ATTRIBUTE_GROUPS(lp5812_led);

...

> +static int lp5812_init_led(struct lp5812_led *led, struct lp5812_chip *chip, int chan)
> +{
> +	struct lp5812_data *pdata = chip->pdata;
> +	struct device *dev = &chip->i2c_cl->dev;
> +	struct mc_subled *mc_led_info;
> +	struct led_classdev *led_cdev;
> +	char name[32];
> +	int i, ret = 0;
> +
> +	if (pdata->led_config[chan].name) {
> +		led->cdev.name = pdata->led_config[chan].name;
> +	} else {
> +		snprintf(name, sizeof(name), "%s:channel%d",
> +			 pdata->label ? : chip->i2c_cl->name, chan);
> +		led->cdev.name = name;

Is it fine below when 'name' is defined on the stack and is used...

> +	}
> +
> +	if (pdata->led_config[chan].is_sc_led == 0) {
> +		mc_led_info = devm_kcalloc(dev,
> +					   pdata->led_config[chan].num_colors,
> +					   sizeof(*mc_led_info), GFP_KERNEL);
> +		if (!mc_led_info)
> +			return -ENOMEM;
> +
> +		led_cdev = &led->mc_cdev.led_cdev;
> +		led_cdev->name = led->cdev.name;

...here?

> +		led_cdev->brightness_set_blocking = lp5812_set_mc_brightness;
> +		led->mc_cdev.num_colors = pdata->led_config[chan].num_colors;
> +		for (i = 0; i < led->mc_cdev.num_colors; i++) {
> +			mc_led_info[i].color_index =
> +				pdata->led_config[chan].color_id[i];
> +			mc_led_info[i].channel =
> +					pdata->led_config[chan].led_id[i];
> +		}
> +
> +		led->mc_cdev.subled_info = mc_led_info;
> +	} else {
> +		led->cdev.brightness_set_blocking = lp5812_set_brightness;
> +	}
> +
> +	led->cdev.groups = lp5812_led_groups;
> +	led->chan_nr = chan;
> +
> +	if (pdata->led_config[chan].is_sc_led) {
> +		ret = devm_led_classdev_register(dev, &led->cdev);
> +		if (ret == 0) {
> +			led->cdev.dev->platform_data = devm_kstrdup(dev, LP5812_SC_LED, GFP_KERNEL);
> +			if (!led->cdev.dev->platform_data)
> +				return -ENOMEM;
> +		}
> +	} else {
> +		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
> +		if (ret == 0) {
> +			led->mc_cdev.led_cdev.dev->platform_data =
> +				devm_kstrdup(dev, LP5812_MC_LED, GFP_KERNEL);
> +			if (!led->mc_cdev.led_cdev.dev->platform_data)
> +				return -ENOMEM;
> +
> +			ret = sysfs_create_groups(&led->mc_cdev.led_cdev.dev->kobj,
> +						  lp5812_led_groups);
> +			if (ret)
> +				dev_err(dev, "sysfs_create_groups failed\n");
> +		}
> +	}
> +
> +	if (ret) {
> +		dev_err(dev, "led register err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

...

CJ

