Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDEE8BF24A
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 13:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfIZL5n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 07:57:43 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59402 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfIZL5n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 07:57:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QBvdid032063;
        Thu, 26 Sep 2019 06:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569499059;
        bh=sRGn7FIP91uDNrt0JHnswIa+OTsTaGPjkG5FkSwvSA8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gTk0g6MpxUk2kGVmQS5uZO+5KrF4wQwRrmtxI6tFLxxS7TZebOHkSX+jp/cDGdFoq
         UZ3/KB5yLPJwIJpTM5TrLo6jD/PD616rwztcJa5o9A6t+vpVJBhVnQHMaHOWEGdUQo
         9ewhlvPZtyLp2jdbA+WUf0KQYFBDlwBhRQK9g6pQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QBvdpg042640;
        Thu, 26 Sep 2019 06:57:39 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 06:57:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 06:57:31 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QBvdOx005221;
        Thu, 26 Sep 2019 06:57:39 -0500
Subject: Re: [PATCH v9 13/15] leds: lp55xx: Update the lp55xx to use the multi
 color framework
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-14-dmurphy@ti.com>
 <59e58ccf-84fb-5db7-5008-20afc7436d35@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <64d00aab-501c-d709-94af-4747a27df098@ti.com>
Date:   Thu, 26 Sep 2019 07:02:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <59e58ccf-84fb-5db7-5008-20afc7436d35@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/25/19 5:00 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/25/19 7:46 PM, Dan Murphy wrote:
>> Update the lp5523 to allow the use of the multi color framework.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                      |   1 +
>>   drivers/leds/leds-lp5523.c                |  13 ++
>>   drivers/leds/leds-lp55xx-common.c         | 150 ++++++++++++++++++----
>>   drivers/leds/leds-lp55xx-common.h         |  11 ++
>>   include/linux/platform_data/leds-lp55xx.h |   6 +
>>   5 files changed, 157 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 84f60e35c5ee..dc3d9f2194cd 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>>   config LEDS_LP55XX_COMMON
>>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>   	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>> +	depends on LEDS_CLASS_MULTI_COLOR && OF
>>   	select FW_LOADER
>>   	select FW_LOADER_USER_HELPER
>>   	help
>> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
>> index d0b931a136b9..8b2cdb98fed6 100644
>> --- a/drivers/leds/leds-lp5523.c
>> +++ b/drivers/leds/leds-lp5523.c
>> @@ -791,6 +791,18 @@ static ssize_t store_master_fader_leds(struct device *dev,
>>   	return ret;
>>   }
>>   
>> +static int lp5523_led_intensity(struct lp55xx_led *led, int chan_num)
> Why do we need this function? brightness op will not suffice?

I looked at this before sending it in.  This API adds the chan_num to 
write to.

The brightness_fn does not it takes it from the led structure.

>
>> +{
>> +	struct lp55xx_chip *chip = led->chip;
>> +	int ret;
>> +
>> +	mutex_lock(&chip->lock);
>> +	ret = lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + chan_num,
>> +		     led->brightness);
>> +	mutex_unlock(&chip->lock);
>> +	return ret;
>> +}
>> +
>>   static int lp5523_led_brightness(struct lp55xx_led *led)
>>   {
>>   	struct lp55xx_chip *chip = led->chip;
>> @@ -857,6 +869,7 @@ static struct lp55xx_device_config lp5523_cfg = {
>>   	.max_channel  = LP5523_MAX_LEDS,
>>   	.post_init_device   = lp5523_post_init_device,
>>   	.brightness_fn      = lp5523_led_brightness,
>> +	.color_intensity_fn = lp5523_led_intensity,
>>   	.set_led_current    = lp5523_set_led_current,
>>   	.firmware_cb        = lp5523_firmware_loaded,
>>   	.run_engine         = lp5523_run_engine,
>> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
>> index 44ced02b49f9..0e4b3a9d3047 100644
>> --- a/drivers/leds/leds-lp55xx-common.c
>> +++ b/drivers/leds/leds-lp55xx-common.c
>> @@ -136,9 +136,26 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
>>   {
>>   	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>>   	struct lp55xx_device_config *cfg = led->chip->cfg;
>> +	int brightness_val[LP55XX_MAX_GROUPED_CHAN];
>> +	int ret;
>> +	int i;
>> +
>> +	if (led->mc_cdev.num_leds > 1) {
>> +		led_mc_calc_brightness(&led->mc_cdev,
>> +				       brightness, brightness_val);
>> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +			led->brightness = brightness_val[i];
>> +			ret = cfg->color_intensity_fn(led,
>> +						      led->grouped_channels[i]);
> Now we will have three separate calls for each color component
> (and possibly sleeping on mutex on contention).
>
> Probably LED mc class use case will need a bit different design.
>
> Also, instead of grouped_channels we could possibly have
>
> led_mc_get_color_id(&led->mc_dev, i)
color_id and grouped_channels are not a 1:1 mapping
>
> which would map entry position index to color_id.
>
> I will stop reviewing here and will continue after taking
> deeper look at this lp55xx design.
>

Dan

