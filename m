Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319999EFF8
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 18:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfH0QTo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 12:19:44 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49064 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbfH0QTn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Aug 2019 12:19:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RGJW6l006436;
        Tue, 27 Aug 2019 11:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566922772;
        bh=PprsgXjDPWhb4ARwTl2IYO4xIuWu4Kx26FxI8ooXEzs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=s4hy3oIbXuGR7gA/EJAh+SkZr7jKmWQPhhzmQ9FmSPMDDHygbcO2XqIE5QJvLLDpI
         sX9TsRx7iAz/ctqT+GvJM2wVSEF0PRs9yxiPGMJg112gls39xokH3JZDYv+Rz8R1XK
         uML5gFG1OJwX6b2cdibuHWHXb1ntbJJi6RZsajzc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RGJWLp023695
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Aug 2019 11:19:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 11:19:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 11:19:32 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RGJVeL110113;
        Tue, 27 Aug 2019 11:19:31 -0500
Subject: Re: [PATCH v3 1/5] leds: lm3532: Fix brightness control for i2c mode
To:     Tony Lindgren <tony@atomide.com>
CC:     Pavel Machek <pavel@ucw.cz>, <jacek.anaszewski@gmail.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190820195307.27590-1-dmurphy@ti.com>
 <20190826215822.GY52127@atomide.com> <20190826221413.GA19124@amd>
 <20190826224437.GZ52127@atomide.com> <20190827121818.GB19927@amd>
 <0eab6f72-ddb7-3da7-e90e-888374531f86@ti.com>
 <9939e253-0c9e-5ef7-e160-c1e5fe99c453@ti.com>
 <20190827160454.GA52127@atomide.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <56200c16-dcfe-3b14-6f22-80e5a387a66b@ti.com>
Date:   Tue, 27 Aug 2019 11:19:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827160454.GA52127@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Tony

On 8/27/19 11:04 AM, Tony Lindgren wrote:
> * Dan Murphy <dmurphy@ti.com> [190827 13:02]:
>> Hello
>>
>> On 8/27/19 7:44 AM, Dan Murphy wrote:
>>> Tony
>>>
>>> On 8/27/19 7:18 AM, Pavel Machek wrote:
>>>> On Mon 2019-08-26 15:44:37, Tony Lindgren wrote:
>>>>> * Pavel Machek <pavel@ucw.cz> [190826 22:14]:
>>>>>> On Mon 2019-08-26 14:58:22, Tony Lindgren wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> * Dan Murphy <dmurphy@ti.com> [190820 19:53]:
>>>>>>>> Fix the brightness control for I2C mode.  Instead of
>>>>>>>> changing the full scale current register update the ALS target
>>>>>>>> register for the appropriate banks.
>>>>>>>>
>>>>>>>> In addition clean up some code errors and random misspellings found
>>>>>>>> during coding.
>>>>>>>>
>>>>>>>> Tested on Droid4 as well as LM3532 EVM connected to
>>>>>>>> a BeagleBoneBlack
>>>>>>>>
>>>>>>>> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the
>>>>>>>> lm3532 LED driver")
>>>>>>>> Reported-by: Pavel Machek <pavel@ucw.cz>
>>>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> v3 - Removed register define updates -
>>>>>>>> https://lore.kernel.org/patchwork/patch/1114542/
>>>>>>> Looks like starting with this patch in Linux next the LCD on droid4
>>>>>>> is so dim it's unreadable even with brightness set to 255. Setting
>>>>>>> brightness to 0 does blank it completely though.
>>>>>>>
>>>>>>> Did something maybe break with the various patch revisions or are
>>>>>>> we now missing some dts patch?
>>>>>> Maybe missing dts patch. We should provide maximum current the LED can
>>>>>> handle...
>>>>> Or i2c control is somehow broken and only als control now works?
>>> With only setting CONFIG_LEDS_LM3532=m to the next branch I get full
>>> brightness with 255.
>>>
>>> I also see half brightness at 128 with the ramp down working.
>>>
>>> I am not able to reproduce this issue on my device.
>>>
>> Just to make sure my data was right I did a clean rebuild on commit
>> 1dbb9fb4082ce2a2f1cf9596881ddece062d15d0
>>
>> from the led-next branch.
>>
>> Just adding the above config flag.  I still cannot reproduce the issue
>>
>> See attached pic
> OK thanks for checking. Probably you can reproduce the issue if you
> reset things to commit c4b8354e5341 ("leds: lm3532: Fix brightness
> control for i2c mode"). There might now be something uninitialized
> with that commit depending on the hardware state on boot if you
> care to check that. Or maybe there's some interaction with other
> patches not yet at commit c4b8354e5341 level.

Ok the fix for that issue is in this patch

leds: lm3532: Fixes for the driver for stability

The fix for setting the brightness control register during the init 
forced the ALS mode to

be enabled.  The Fixes for driver stability patch then set the led->mode 
to the correct register setting.


> I confirmed again that things fail at commit c4b8354e5341. But
> now testing with the same Linux next as yesterday things works again.
> Not sure what's going on as failures with Linux next yestreday
> made me start narrowing down what commit causes the issues.
>
> Anyways, playing with loading and unloading the leds-lm3532.ko I
> noticed we can also have unpaired regulator calls when using sysfs
> brightness that the below patch attempts to fix. Not sure how I got
> to the point of regulator warnings, but I was trying to enable
> the brightness via sysfs. Maybe I had other patches too when
> I got the regulator warnings.. But please check if the below
> patch makes sense.

Makes sense did you want me to push a patch?

Dan


> Regards,
>
> Tony
>
> 8< ---------------------------
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -127,6 +127,7 @@ struct lm3532_als_data {
>    * @num_leds - Number of LED strings are supported in this array
>    * @full_scale_current - The full-scale current setting for the current sink.
>    * @led_strings - The LED strings supported in this array
> + * @enabled - Enabled status
>    * @label - LED label
>    */
>   struct lm3532_led {
> @@ -138,6 +139,7 @@ struct lm3532_led {
>   	int ctrl_brt_pointer;
>   	int num_leds;
>   	int full_scale_current;
> +	int enabled:1;
>   	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
>   	char label[LED_MAX_NAME_SIZE];
>   };
> @@ -292,11 +294,15 @@ static int lm3532_get_ramp_index(int ramp_time)
>   				ramp_time);
>   }
>   
> +/* Caller must take care of locking */
>   static int lm3532_led_enable(struct lm3532_led *led_data)
>   {
>   	int ctrl_en_val = BIT(led_data->control_bank);
>   	int ret;
>   
> +	if (led_data->enabled)
> +		return 0;
> +
>   	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
>   					 ctrl_en_val, ctrl_en_val);
>   	if (ret) {
> @@ -304,14 +310,24 @@ static int lm3532_led_enable(struct lm3532_led *led_data)
>   		return ret;
>   	}
>   
> -	return regulator_enable(led_data->priv->regulator);
> +	ret = regulator_enable(led_data->priv->regulator);
> +	if (ret < 0)
> +		return ret;
> +
> +	led_data->enabled = 1;
> +
> +	return 0;
>   }
>   
> +/* Caller must take care of locking */
>   static int lm3532_led_disable(struct lm3532_led *led_data)
>   {
>   	int ctrl_en_val = BIT(led_data->control_bank);
>   	int ret;
>   
> +	if (!led_data->enabled)
> +		return 0;
> +
>   	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
>   					 ctrl_en_val, 0);
>   	if (ret) {
> @@ -319,7 +335,13 @@ static int lm3532_led_disable(struct lm3532_led *led_data)
>   		return ret;
>   	}
>   
> -	return regulator_disable(led_data->priv->regulator);
> +	ret = regulator_disable(led_data->priv->regulator);
> +	if (ret < 0)
> +		return ret;
> +
> +	led_data->enabled = 0;
> +
> +	return 0;
>   }
>   
>   static int lm3532_brightness_set(struct led_classdev *led_cdev,
