Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A107E6FD
	for <lists+linux-leds@lfdr.de>; Fri,  2 Aug 2019 02:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732319AbfHBACe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Aug 2019 20:02:34 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33098 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731258AbfHBACe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Aug 2019 20:02:34 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7202LwS079622;
        Thu, 1 Aug 2019 19:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564704141;
        bh=JPE8/NA+otNSQgKjCkF3O2VPfxJQy2lptz0Icmukqvg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=prfBV9ctXodPzUT23xo90cQEWAnAX6tL+06BorNRljZBJRYe2oRfHsBiqIdAMGs7O
         PPVh71UDGq9Tq8UkDT9Ku69n88u9XM87wiMg9Y7d2NvrW0xI7nekoHul2xNjNzHJwv
         mMQkfomteHfr6UD/6KBsmEvhwWvFpPiMYVrZrrJw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7202Ll6036373
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Aug 2019 19:02:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 19:02:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 19:02:20 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7202K7Q048015;
        Thu, 1 Aug 2019 19:02:20 -0500
Subject: Re: [PATCH 1/3] leds: lm3532: Fix brightness control for i2c mode
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <tony@atomide.com>, <sre@kernel.org>, <nekit1000@gmail.com>,
        <mpartap@gmx.net>, <merlijn@wizzup.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190801151421.21486-1-dmurphy@ti.com>
 <3e304b9a-e7fc-9294-1950-ee9bc5956305@gmail.com> <20190801213620.GA30096@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <bcbb9c96-062a-b9e5-41f5-c3d015641e8d@ti.com>
Date:   Thu, 1 Aug 2019 19:02:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190801213620.GA30096@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

Thanks for the review

On 8/1/19 4:36 PM, Pavel Machek wrote:
> Hi!
>
> If we are going to complain about coding style... this should really
> be split, one change per patch.
>
>>> @@ -161,18 +167,18 @@ struct lm3532_data {
>>>   };
>>>   
>>>   static const struct reg_default lm3532_reg_defs[] = {
>>> -	{LM3532_REG_OUTPUT_CFG, 0xe4},
>>> +	{LM3532_REG_OUTPUT_CFG, 0x24},
>>>   	{LM3532_REG_STARTSHUT_RAMP, 0xc0},
>>>   	{LM3532_REG_RT_RAMP, 0xc0},
>>>   	{LM3532_REG_PWM_A_CFG, 0x82},
>>>   	{LM3532_REG_PWM_B_CFG, 0x82},
>>>   	{LM3532_REG_PWM_C_CFG, 0x82},
>>>   	{LM3532_REG_ZONE_CFG_A, 0xf1},
>>> -	{LM3532_REG_CTRL_A_BRT, 0xf3},
>>> +	{LM3532_REG_CTRL_A_FS_CURR, 0x13},
>>>   	{LM3532_REG_ZONE_CFG_B, 0xf1},
>>> -	{LM3532_REG_CTRL_B_BRT, 0xf3},
>>> +	{LM3532_REG_CTRL_B_FS_CURR, 0x13},
>>>   	{LM3532_REG_ZONE_CFG_C, 0xf1},
>>> -	{LM3532_REG_CTRL_C_BRT, 0xf3},
>>> +	{LM3532_REG_CTRL_C_FS_CURR, 0x13},
>>>   	{LM3532_REG_ENABLE, 0xf8},
>>>   	{LM3532_ALS_CONFIG, 0x44},
>>>   	{LM3532_REG_ZN_0_HI, 0x35},
> Default register values; are they related to the rest?

Yes and no. I changed the #define so we would see a change anyway.

And the default is 0x13.

I can move it to a clean up patch

>
>>> @@ -302,7 +308,7 @@ static int lm3532_led_disable(struct lm3532_led *led_data)
>>>   	int ret;
>>>   
>>>   	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
>>> -					 ctrl_en_val, ~ctrl_en_val);
>>> +					 ctrl_en_val, 0);
>>>   	if (ret) {
>>>   		dev_err(led_data->priv->dev, "Failed to set ctrl:%d\n", ret);
>>>   		return ret;
> This should have no functional impact, its just a clenaup, probably
> should go separately.

I took it from your patch.  Thought it was a good clean up.

I can move it to a separate patch and give you credit


>
>>> @@ -339,11 +345,9 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
>>>   	if (ret)
>>>   		goto unlock;
>>>   
>>> -	brightness_reg = LM3532_REG_CTRL_A_BRT + led->control_bank * 2;
>>> -	brt_val = brt_val / LM3532_BRT_VAL_ADJUST;
>>> -
>>> +	brightness_reg = LM3532_REG_ZONE_TRGT_A + led->control_bank * 5 +
>>> +			 (led->ctrl_brt_pointer >> 2);
>>>   	ret = regmap_write(led->priv->regmap, brightness_reg, brt_val);
>>> -
>>>   unlock:
>>>   	mutex_unlock(&led->priv->lock);
>>>   	return ret;
> This is the core change, AFAICT.

Yep.  This is the fix you want.


>
>>> @@ -356,8 +360,29 @@ static int lm3532_init_registers(struct lm3532_led *led)
>>>   	unsigned int output_cfg_val = 0;
>>>   	unsigned int output_cfg_shift = 0;
>>>   	unsigned int output_cfg_mask = 0;
>>> +	int brightness_config_reg;
>>> +	int brightness_config_val;
>>>   	int ret, i;
>>>   
>>> +	if (drvdata->enable_gpio)
>>> +		gpiod_direction_output(drvdata->enable_gpio, 1);
>>> +
>>> +	brightness_config_reg = LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
>>> +	/* This could be hard coded to the default value but the control
> Code is moved, probably should go in separately. We'll have less fun
> bisecting problems when things are separate...

On my Droid4 moving this enable call allowed the init to pass without a 
regmap failure.

But I did not see the same issue on the BBB with the LM3532 EVM.

Without this change in this patch the backlight failed to register.  I 
think we want to keep this change here.

Dan


>
> Thanks and best regards,
> 									Pavel
>
