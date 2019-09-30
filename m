Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0EDDC339B
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 14:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbfJAMAq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 08:00:46 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50692 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbfJAMAp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 08:00:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UKYbPN124510;
        Mon, 30 Sep 2019 15:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569875677;
        bh=bw9tlbxrjC99BnEJLTEUHA5a+42MA0ECMgh+G7yLHgM=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=DSfUR24hPbevBBXliMfc9GuhWY7K6MZ2zHxsxtylDlkOLJKgPOd3A64qiQkcbyedE
         eO9JKqrTuaczbma/0rCEwyFPZQ+9pbG9OtLSvOMWRK33xECmeKgc7/FhLncPonS5Af
         p0z1Hrr80Jk1ib6xXRD+3bnA+18LBK+IfcfdYpaI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UKYbL9017660
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 15:34:37 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 15:34:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 15:34:27 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UKYaWB055926;
        Mon, 30 Sep 2019 15:34:36 -0500
Subject: Re: [PATCH v9 13/15] leds: lp55xx: Update the lp55xx to use the multi
 color framework
From:   Dan Murphy <dmurphy@ti.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-14-dmurphy@ti.com>
 <59e58ccf-84fb-5db7-5008-20afc7436d35@gmail.com>
 <64d00aab-501c-d709-94af-4747a27df098@ti.com>
 <35e25398-81de-3755-7979-72638a119c77@gmail.com>
 <74099f4d-5a90-3241-9c40-47ca6f0c9521@ti.com>
Message-ID: <4f8247b4-45ce-a1c3-389f-2fe0de5c0e7a@ti.com>
Date:   Mon, 30 Sep 2019 15:34:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <74099f4d-5a90-3241-9c40-47ca6f0c9521@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/30/19 11:31 AM, Dan Murphy wrote:
> Jacek
>
> On 9/29/19 8:01 AM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 9/26/19 2:02 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 9/25/19 5:00 PM, Jacek Anaszewski wrote:
>>>> Dan,
>>>>
>>>> On 9/25/19 7:46 PM, Dan Murphy wrote:
>>>>> Update the lp5523 to allow the use of the multi color framework.
>>>>>
>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>> ---
>>>>>    drivers/leds/Kconfig                      |   1 +
>>>>>    drivers/leds/leds-lp5523.c                |  13 ++
>>>>>    drivers/leds/leds-lp55xx-common.c         | 150 
>>>>> ++++++++++++++++++----
>>>>>    drivers/leds/leds-lp55xx-common.h         |  11 ++
>>>>>    include/linux/platform_data/leds-lp55xx.h |   6 +
>>>>>    5 files changed, 157 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>> index 84f60e35c5ee..dc3d9f2194cd 100644
>>>>> --- a/drivers/leds/Kconfig
>>>>> +++ b/drivers/leds/Kconfig
>>>>> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>>>>>    config LEDS_LP55XX_COMMON
>>>>>        tristate "Common Driver for TI/National
>>>>> LP5521/5523/55231/5562/8501"
>>>>>        depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 ||
>>>>> LEDS_LP8501
>>>>> +    depends on LEDS_CLASS_MULTI_COLOR && OF
>>>>>        select FW_LOADER
>>>>>        select FW_LOADER_USER_HELPER
>>>>>        help
>>>>> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
>>>>> index d0b931a136b9..8b2cdb98fed6 100644
>>>>> --- a/drivers/leds/leds-lp5523.c
>>>>> +++ b/drivers/leds/leds-lp5523.c
>>>>> @@ -791,6 +791,18 @@ static ssize_t store_master_fader_leds(struct
>>>>> device *dev,
>>>>>        return ret;
>>>>>    }
>>>>>    +static int lp5523_led_intensity(struct lp55xx_led *led, int 
>>>>> chan_num)
>>>> Why do we need this function? brightness op will not suffice?
>>> I looked at this before sending it in.  This API adds the chan_num to
>>> write to.
>>>
>>> The brightness_fn does not it takes it from the led structure.
>>>
>>>>> +{
>>>>> +    struct lp55xx_chip *chip = led->chip;
>>>>> +    int ret;
>>>>> +
>>>>> +    mutex_lock(&chip->lock);
>>>>> +    ret = lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + chan_num,
>>>>> +             led->brightness);
>>>>> +    mutex_unlock(&chip->lock);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>    static int lp5523_led_brightness(struct lp55xx_led *led)
>>>>>    {
>>>>>        struct lp55xx_chip *chip = led->chip;
>>>>> @@ -857,6 +869,7 @@ static struct lp55xx_device_config lp5523_cfg = {
>>>>>        .max_channel  = LP5523_MAX_LEDS,
>>>>>        .post_init_device   = lp5523_post_init_device,
>>>>>        .brightness_fn      = lp5523_led_brightness,
>>>>> +    .color_intensity_fn = lp5523_led_intensity,
>>>>>        .set_led_current    = lp5523_set_led_current,
>>>>>        .firmware_cb        = lp5523_firmware_loaded,
>>>>>        .run_engine         = lp5523_run_engine,
>>>>> diff --git a/drivers/leds/leds-lp55xx-common.c
>>>>> b/drivers/leds/leds-lp55xx-common.c
>>>>> index 44ced02b49f9..0e4b3a9d3047 100644
>>>>> --- a/drivers/leds/leds-lp55xx-common.c
>>>>> +++ b/drivers/leds/leds-lp55xx-common.c
>>>>> @@ -136,9 +136,26 @@ static int lp55xx_set_brightness(struct
>>>>> led_classdev *cdev,
>>>>>    {
>>>>>        struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>>>>>        struct lp55xx_device_config *cfg = led->chip->cfg;
>>>>> +    int brightness_val[LP55XX_MAX_GROUPED_CHAN];
>>>>> +    int ret;
>>>>> +    int i;
>>>>> +
>>>>> +    if (led->mc_cdev.num_leds > 1) {
>>>>> +        led_mc_calc_brightness(&led->mc_cdev,
>>>>> +                       brightness, brightness_val);
>>>>> +        for (i = 0; i < led->mc_cdev.num_leds; i++) {
>>>>> +            led->brightness = brightness_val[i];
>>>>> +            ret = cfg->color_intensity_fn(led,
>>>>> + led->grouped_channels[i]);
>>>> Now we will have three separate calls for each color component
>>>> (and possibly sleeping on mutex on contention).
>>>>
>>>> Probably LED mc class use case will need a bit different design.
>>>>
>>>> Also, instead of grouped_channels we could possibly have
>>>>
>>>> led_mc_get_color_id(&led->mc_dev, i)
>>> color_id and grouped_channels are not a 1:1 mapping
>> OK, they're channel numbers.
>>
>>>> which would map entry position index to color_id.
>>>>
>>>> I will stop reviewing here and will continue after taking
>>>> deeper look at this lp55xx design.
>> I've analyzed that design in greater detail and have started
>> to wonder why you can't pass two arrays to the new op:
>> channel numbers and corresponding calculated channel intensities?
>
>
> OK so I coded this up.  And there is not a clean way to do this since 
> the channels and colors are not correlated between two structures.  In 
> order to do this we would have to expand the grouped_channel and 
> channel_color arrays in the lp55xx_led to LED_COLOR_ID_MAX and put the 
> channel and color_component value in the position in the array that is 
> associated with the color ID. Then the driver can loop through the 
> available colors from the MC class and get the channel and 
> color_component information.
>
I spent the day trying to figure out the cleanest way to do this.  What 
I did was I added a struct to the MC framework (struct name will 
probably need to be changed)

This also solves the problem that you brought up on the caller knowing 
what ID and brightness goes to what.

struct led_mc_color_conversion {
     int color_id;
     int brightness;
};

For devices that need the color conversion to take place the driver will 
pass in an array of structs to be filled out by the MC framework.  Once 
the MCFW populates the array the device driver can map the color IDs to 
the the associated output.  So for the LP55xx I was able to map the 
color ID to the channel number.

I added a brightness value to the intensity function so now the caller 
passes in the channel number and the brightness.  This should be all the 
child cares about.

I think it is ok that the common code calls the intensity function x 
number of times.  Otherwise each child will need to have the same code 
to de-reference the struct seems a bit error wrought IMO.

Dan


> Beyond that in coding this and thinking about the design it is better 
> to have the lp55xx_common code to do all the heavy lifting and the 
> children to just perform the action on the device itself. So doing the 
> loop in the common code like we have now and calling the intensity_fn 
> based on x number of LEDs.  The child subscriber to the common code 
> should have to worry about the color it should only care about the 
> channel and the value.
>
> Dan
>
>
