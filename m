Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0847EBF22D
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 13:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfIZLyT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 07:54:19 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52450 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfIZLyT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 07:54:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QBsEV6031016;
        Thu, 26 Sep 2019 06:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569498854;
        bh=RD+aUUpgVWC/hE87PM3XdGkD2XlvnRt0Bqdkes9WrFg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SSdYSgvis7lkYJHAcBqGhfZtdNa1i0fSSiFblEG8y//DgCXMbg+6W05vRam45sL+J
         IrwoRrxLGlWF6Yu8W8phguzyzECBQvqAxK9Xr/i4BTgZxDU/7aEZ81pgijqRi1v5v8
         mNDVTUpXxYNELNrtUavqtVg9k5m9e8EB6TA1HUJ0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QBsEJb117200
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 26 Sep 2019 06:54:14 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 06:54:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 06:54:06 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QBsDgf128624;
        Thu, 26 Sep 2019 06:54:13 -0500
Subject: Re: [PATCH v9 07/15] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-8-dmurphy@ti.com>
 <4293530f-70ae-0796-e7a7-0c6564e71132@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <d4126720-25ea-7c15-2424-b7f16b25c3b4@ti.com>
Date:   Thu, 26 Sep 2019 06:59:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4293530f-70ae-0796-e7a7-0c6564e71132@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/25/19 4:27 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/25/19 7:46 PM, Dan Murphy wrote:

<big_snip>

>> +
>> +static int lp50xx_brightness_set(struct led_classdev *cdev,
>> +			     enum led_brightness brightness)
>> +{
>> +	struct lp50xx_led *led = container_of(cdev, struct lp50xx_led, led_dev);
>> +	const struct lp50xx_chip_info *led_chip = led->priv->chip_info;
>> +	struct led_mc_color_entry *color_data;
>> +	u8 led_offset, reg_val, reg_color_offset;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&led->priv->lock);
>> +
>> +	if (led->ctrl_bank_enabled)
>> +		reg_val = led_chip->bank_brt_reg;
>> +	else
>> +		reg_val = led_chip->led_brightness0_reg +
>> +			  led->led_number;
>> +
>> +	ret = regmap_write(led->priv->regmap, reg_val, brightness);
>> +	if (ret) {
>> +		dev_err(&led->priv->client->dev,
>> +			"Cannot write brightness value %d\n", ret);
>> +		goto out;
>> +	}
>> +
>> +	list_for_each_entry(color_data, &led->mc_cdev.color_list, list) {
>> +		if (color_data->led_color_id == LED_COLOR_ID_RED)
>> +			reg_color_offset = 0;
>> +		else if (color_data->led_color_id == LED_COLOR_ID_GREEN)
>> +			reg_color_offset = 1;
>> +		else if (color_data->led_color_id == LED_COLOR_ID_BLUE)
>> +			reg_color_offset = 2;
>> +		else
>> +			continue;
> This else case is quite erroneous. Sheer continue is just ignoring
> serious problem. I'd log the problem and return -EINVAL.
Ack.
>
> Also, you could have a macro for mapping color_id to offset.
If the code needed to do this more then once I could justify a macro.  
But this is the only instance of this check.
>
>> +
>> +		if (led->ctrl_bank_enabled) {
>> +			reg_val = led_chip->bank_mix_reg + reg_color_offset;
>> +		} else {
>> +			led_offset = (led->led_number * 3)  + reg_color_offset;
>> +			reg_val = led_chip->mix_out0_reg + led_offset;
>> +		}
>> +
>> +		ret = regmap_write(led->priv->regmap, reg_val,
>> +				   color_data->intensity);
>> +		if (ret) {
>> +			dev_err(&led->priv->client->dev,
>> +				"Cannot write intensity value %d\n", ret);
>> +			goto out;
>> +		}
>> +	}
>> +out:
>> +	mutex_unlock(&led->priv->lock);
>> +	return ret;
>> +}
>> +
>> +static enum led_brightness lp50xx_brightness_get(struct led_classdev *cdev)
>> +{
>> +	struct lp50xx_led *led = container_of(cdev, struct lp50xx_led, led_dev);
>> +	const struct lp50xx_chip_info *led_chip = led->priv->chip_info;
>> +	unsigned int brt_val;
>> +	u8 reg_val;
>> +	int ret;
>> +
>> +	mutex_lock(&led->priv->lock);
>> +
>> +	if (led->ctrl_bank_enabled)
>> +		reg_val = led_chip->bank_brt_reg;
>> +	else
>> +		reg_val = led_chip->led_brightness0_reg + led->led_number;
>> +
>> +	ret = regmap_read(led->priv->regmap, reg_val, &brt_val);
>> +
>> +	mutex_unlock(&led->priv->lock);
>> +
>> +	return brt_val;
>> +}
>> +
>> +static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
>> +{
>> +	u8 led_config_lo, led_config_hi;
>> +	u32 bank_enable_mask = 0;
>> +	int ret;
>> +	int i;
>> +
>> +	for (i = 0; i < priv->chip_info->num_leds; i++)
>> +		bank_enable_mask |= (1 << led_banks[i]);
>> +
>> +	led_config_lo = (u8)(bank_enable_mask & 0xff);
>> +	led_config_hi = (u8)(bank_enable_mask >> 8) & 0xff;
>> +
>> +	ret = regmap_write(priv->regmap, LP50XX_LED_CFG0, led_config_lo);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (led_config_hi)
> Now I think that less questionable would be writing led_config_hi always
> for devices that have CFG1 register. IOW write led_config_hi also
> when it equals 0.

Ack.  I will have to modify the check to only write this for LP5030/36 
as those are the only 2 that have the CFG1 register.

>
>> +		ret = regmap_write(priv->regmap, LP5036_LED_CFG1,
>> +				   led_config_hi);
>> +
>> +	return ret;
>> +}
>> +
>> +static int lp50xx_reset(struct lp50xx *priv)
>> +{
>> +	if (priv->enable_gpio)
>> +		return gpiod_direction_output(priv->enable_gpio, 1);
>> +	else
>> +		return regmap_write(priv->regmap, priv->chip_info->reset_reg,
>> +				    LP50XX_SW_RESET);
>> +}
>> +
>> +static int lp50xx_enable_disable(struct lp50xx *priv, u8 enable_disable)
>> +{
>> +	return regmap_write(priv->regmap, LP50XX_DEV_CFG0, enable_disable);
>> +}
>> +
>> +static int lp50xx_probe_dt(struct lp50xx *priv)
>> +{
>> +	u32 led_banks[LP5036_MAX_LED_MODULES];
>> +	struct fwnode_handle *child = NULL;
>> +	struct fwnode_handle *led_node = NULL;
>> +	struct led_init_data init_data;
>> +	struct lp50xx_led *led;
>> +	int num_colors;
>> +	u32 color_id;
>> +	int led_number;
>> +	size_t i = 0;
>> +	int ret;
>> +
>> +	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
>> +						   "enable", GPIOD_OUT_LOW);
>> +	if (IS_ERR(priv->enable_gpio)) {
>> +		ret = PTR_ERR(priv->enable_gpio);
>> +		dev_err(&priv->client->dev, "Failed to get enable gpio: %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->regulator = devm_regulator_get(&priv->client->dev, "vled");
>> +	if (IS_ERR(priv->regulator))
>> +		priv->regulator = NULL;
>> +
>> +	device_for_each_child_node(&priv->client->dev, child) {
>> +		led = &priv->leds[i];
>> +		if (fwnode_property_present(child, "ti,led-bank")) {
>> +			ret = fwnode_property_read_u32_array(child,
>> +							     "ti,led-bank",
>> +							     NULL, 0);
>> +			ret = fwnode_property_read_u32_array(child,
>> +							     "ti,led-bank",
>> +							     led_banks,
>> +							     ret);
>> +
>> +			priv->num_of_banked_leds = ARRAY_SIZE(led_banks);
>> +
>> +			ret = lp50xx_set_banks(priv, led_banks);
>> +			if (ret) {
>> +				dev_err(&priv->client->dev,
>> +					"Cannot setup banked LEDs\n");
>> +				fwnode_handle_put(child);
>> +				goto child_out;
>> +			}
>> +			led->ctrl_bank_enabled = 1;
>> +
>> +		} else {
>> +			ret = fwnode_property_read_u32(child, "reg",
>> +					       &led_number);
> Not checking ret val?
Yes it is after the else case.  But I should probably check return for 
the led-bank
>
>> +
>> +			led->led_number = led_number;
>> +		}
>> +		if (ret) {
>> +			dev_err(&priv->client->dev,
>> +				"led sourcing property missing\n");
>> +			fwnode_handle_put(child);
>> +			goto child_out;
>> +		}
>> +

Dan

[...]

