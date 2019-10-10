Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27992D1DA5
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 02:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfJJAry (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 20:47:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41574 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731834AbfJJAry (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 20:47:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A0lpnB119594;
        Wed, 9 Oct 2019 19:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570668471;
        bh=W4tgg+8rfTzgD3XxaYrq0SPR4ta7PyHqmlPUxUiR0C8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=g1jDm8Sd+4vvRpKgKsmFynIxJWukTjmBehsVA3ptUdFWBLoTJx+u7M1vLvqdgK3KH
         WbtqytmXgkvn8IS9lVvJMbWwXYz/TvOiyReVOZc0L3QStKl24evA7xq+1M3CIodheM
         oacgCccnHIX8pDfQQ7aOJ8misTbe0tr8/FdRjIxk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A0lp3H086691
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 19:47:51 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 19:47:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 19:47:47 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A0loHH006322;
        Wed, 9 Oct 2019 19:47:50 -0500
Subject: Re: [PATCH v11 12/16] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191008204800.19870-1-dmurphy@ti.com>
 <20191008204800.19870-13-dmurphy@ti.com>
 <1f0ac6f3-a822-84f0-d398-2f16751c3b1b@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <a5c59e36-85b9-ad90-25f8-4ac160b5b661@ti.com>
Date:   Wed, 9 Oct 2019 19:47:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1f0ac6f3-a822-84f0-d398-2f16751c3b1b@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/9/19 5:04 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/8/19 10:47 PM, Dan Murphy wrote:
>> Add multicolor framework support for the lp55xx family.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                      |   1 +
>>   drivers/leds/leds-lp55xx-common.c         | 176 +++++++++++++++++++---
>>   drivers/leds/leds-lp55xx-common.h         |  11 ++
>>   include/linux/platform_data/leds-lp55xx.h |   5 +
>>   4 files changed, 169 insertions(+), 24 deletions(-)
>>
> [...]
>>   
>> +static int lp5xx_parse_common_child(struct device_node *np,
>> +				    struct lp55xx_led_config *cfg,
>> +				    int chan_num, bool is_multicolor,
>> +				    int color_num)
>> +{
>> +	u32 led_number;
>> +	int ret;
>> +
>> +	of_property_read_string(np, "chan-name",
>> +				&cfg[chan_num].name);
>> +	of_property_read_u8(np, "led-cur",
>> +			    &cfg[chan_num].led_current);
>> +	of_property_read_u8(np, "max-cur",
>> +			    &cfg[chan_num].max_current);
>> +
>> +	ret = of_property_read_u32(np, "reg", &led_number);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (led_number < 0 || led_number > 6)
>> +		return -EINVAL;
>> +
>> +	if (is_multicolor)
>> +		cfg[chan_num].color_component[color_num].output_num =
>> +								led_number;
>> +	else
>> +		cfg[chan_num].chan_nr = led_number;
>> +
>> +	return 0;
>> +}
>> +
>> +static int lp5xx_parse_channel_child(struct device_node *np,
>> +				     struct lp55xx_led_config *cfg,
>> +				     int child_number)
>> +{
>> +	struct device_node *child;
>> +	int channel_color;
>> +	int num_colors = 0;
>> +	u32 color_id;
>> +	int ret;
>> +
>> +	cfg[child_number].default_trigger =
>> +			of_get_property(np, "linux,default-trigger", NULL);
>> +
>> +	ret = of_property_read_u32(np, "color", &channel_color);
>> +	if (ret)
>> +		channel_color = ret;
>> +
>> +
>> +	if (channel_color == LED_COLOR_ID_MULTI) {
>> +		for_each_child_of_node(np, child) {
>> +			ret = lp5xx_parse_common_child(child, cfg,
>> +						       child_number, true,
>> +						       num_colors);
>> +			if (ret)
>> +				return ret;
>> +
>> +			ret = of_property_read_u32(child, "color", &color_id);
>> +			if (ret)
>> +				return ret;
>> +
>> +			cfg[child_number].color_component[num_colors].color_id =
>> +						color_id;
>> +			set_bit(color_id, &cfg[child_number].available_colors);
>> +			num_colors++;
>> +		}
>> +
>> +		cfg[child_number].num_colors = num_colors;
>> +	} else {
>> +		return lp5xx_parse_common_child(np, cfg, child_number, false,
>> +						num_colors);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   						      struct device_node *np)
>>   {
>> @@ -546,6 +678,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   	struct lp55xx_led_config *cfg;
>>   	int num_channels;
>>   	int i = 0;
>> +	int ret;
>>   
>>   	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>   	if (!pdata)
>> @@ -565,14 +698,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   	pdata->num_channels = num_channels;
>>   
>>   	for_each_child_of_node(np, child) {
>> -		cfg[i].chan_nr = i;
>> -
>> -		of_property_read_string(child, "chan-name", &cfg[i].name);
>> -		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
>> -		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
>> -		cfg[i].default_trigger =
>> -			of_get_property(child, "linux,default-trigger", NULL);
>> -
>> +		ret = lp5xx_parse_channel_child(child, cfg, i);
>> +		if (ret)
>> +			return ERR_PTR(-EINVAL);
>>   		i++;
>>   	}
>>   
>> diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
>> index 783ed5103ce5..55d420f704d1 100644
>> --- a/drivers/leds/leds-lp55xx-common.h
>> +++ b/drivers/leds/leds-lp55xx-common.h
>> @@ -12,6 +12,10 @@
>>   #ifndef _LEDS_LP55XX_COMMON_H
>>   #define _LEDS_LP55XX_COMMON_H
>>   
>> +#include <linux/led-class-multicolor.h>
>> +
>> +#define LP55XX_MAX_GROUPED_CHAN	4
>> +
>>   enum lp55xx_engine_index {
>>   	LP55XX_ENGINE_INVALID,
>>   	LP55XX_ENGINE_1,
>> @@ -109,6 +113,9 @@ struct lp55xx_device_config {
>>   	/* access brightness register */
>>   	int (*brightness_fn)(struct lp55xx_led *led);
>>   
>> +	/* access specific brightness register */
>> +	int (*color_intensity_fn)(struct lp55xx_led *led);
>> +
>>   	/* current setting function */
>>   	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
>>   
>> @@ -159,6 +166,8 @@ struct lp55xx_chip {
>>    * struct lp55xx_led
>>    * @chan_nr         : Channel number
>>    * @cdev            : LED class device
>> + * @mc_cdev	    : Multi color class device
>> + * @color_component : Multi color LED map information
>>    * @led_current     : Current setting at each led channel
>>    * @max_current     : Maximun current at each led channel
>>    * @brightness      : Brightness value
>> @@ -167,6 +176,8 @@ struct lp55xx_chip {
>>   struct lp55xx_led {
>>   	int chan_nr;
>>   	struct led_classdev cdev;
>> +	struct led_classdev_mc mc_cdev;
>> +	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
>>   	u8 led_current;
>>   	u8 max_current;
>>   	u8 brightness;
>> diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
>> index 96a787100fda..1e7a25ed9a87 100644
>> --- a/include/linux/platform_data/leds-lp55xx.h
>> +++ b/include/linux/platform_data/leds-lp55xx.h
>> @@ -12,6 +12,8 @@
>>   #ifndef _LEDS_LP55XX_H
>>   #define _LEDS_LP55XX_H
>>   
>> +#include <linux/led-class-multicolor.h>
>> +
>>   /* Clock configuration */
>>   #define LP55XX_CLOCK_AUTO	0
>>   #define LP55XX_CLOCK_INT	1
>> @@ -23,6 +25,9 @@ struct lp55xx_led_config {
>>   	u8 chan_nr;
>>   	u8 led_current; /* mA x10, 0 if led is not connected */
>>   	u8 max_current;
>> +	int num_colors;
>> +	unsigned long available_colors;
>> +	struct led_mc_color_conversion color_component[LED_COLOR_ID_MAX];
> I can't see why the array length can't be LP55XX_MAX_GROUPED_CHAN here
> too. You're indexing it with num_colors counter and not with color_id.

Ack

Dan


