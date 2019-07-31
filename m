Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D03287CC7B
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 21:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfGaTG6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 15:06:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53404 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfGaTG5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 15:06:57 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VJ6q94106629;
        Wed, 31 Jul 2019 14:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564600012;
        bh=bzbiBsyTzX5cmwqp7/4rSsG0MPh+H96yBn7LuYc+vkM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ro5URSlWOrtWIvjM30iR6JFdDVaBPN1lBcA+7hDknh5MI+6rV5HEk8BQWnY3D/1Dl
         5tOtRQA8PA2G7VUDYrGYyhpObT01ovhfcivsKwv8rIiiCa9sE6WRVnsnMY/qDtCEmj
         IBwTm5AJyeFiP9cEdGuGBHPOii0BoxK8c3FgkO2w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VJ6qrc068144
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 14:06:52 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 14:06:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 14:06:52 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VJ6pDv030640;
        Wed, 31 Jul 2019 14:06:52 -0500
Subject: Re: [PATCH v4 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-7-dmurphy@ti.com>
 <fa74cc04-61fc-161f-2ce1-6de5921fce2f@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f83b0f42-a310-a800-1b78-d5fb89516114@ti.com>
Date:   Wed, 31 Jul 2019 14:06:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fa74cc04-61fc-161f-2ce1-6de5921fce2f@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 7/29/19 3:50 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 7/25/19 8:28 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The framework allows for dynamically setting individual LEDs
>> or setting brightness levels of LEDs and updating them virtually
>> simultaneously.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                 |  10 +
>>   drivers/leds/Makefile                |   1 +
>>   drivers/leds/led-class-multicolor.c  | 402 +++++++++++++++++++++++++++
>>   include/linux/led-class-multicolor.h |  96 +++++++
>>   4 files changed, 509 insertions(+)
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index f7a3dd7ecf3d..7f780d5b8490 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>>   	  for the flash related features of a LED device. It can be built
>>   	  as a module.
>>   
>> +config LEDS_CLASS_MULTI_COLOR
>> +	tristate "LED Mulit Color LED Class Support"
>> +	depends on LEDS_CLASS
>> +	help
>> +	  This option enables the multicolor LED sysfs class in /sys/class/leds.
>> +	  It wraps LED Class and adds multicolor LED specific sysfs attributes
> s/Class/class/
>
> I'll need to fix it in LED flash class entry too.
>
>> +	  and kernel internal API to it. You'll need this to provide support
>> +	  for multicolor LEDs that are grouped together. This class is not
>> +	  intended for single color LEDs. It can be built as a module.
>> +
>>   config LEDS_BRIGHTNESS_HW_CHANGED
>>   	bool "LED Class brightness_hw_changed attribute support"
>>   	depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 41fb073a39c1..897b810257dd 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -4,6 +4,7 @@
>>   obj-$(CONFIG_NEW_LEDS)			+= led-core.o
>>   obj-$(CONFIG_LEDS_CLASS)		+= led-class.o
>>   obj-$(CONFIG_LEDS_CLASS_FLASH)		+= led-class-flash.o
>> +obj-$(CONFIG_LEDS_CLASS_MULTI_COLOR)	+= led-class-multicolor.o
>>   obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
>>   
>>   # LED Platform Drivers
>> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
>> new file mode 100644
>> index 000000000000..123443e6d3eb
>> --- /dev/null
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -0,0 +1,402 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// LED Multi Color class interface
>> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> +
>> +#include <linux/device.h>
>> +#include <linux/init.h>
>> +#include <linux/led-class-multicolor.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include "leds.h"
>> +
>> +struct led_classdev_mc_priv {
>> +	struct led_classdev_mc *mcled_cdev;
>> +
>> +	struct device_attribute max_intensity_attr;
>> +	struct device_attribute intensity_attr;
>> +	struct device_attribute color_index_attr;
>> +
>> +	enum led_brightness max_intensity;
>> +	enum led_brightness intensity;
>> +	enum led_brightness new_intensity;
>> +
>> +	struct list_head list;
>> +
>> +	int color_id;
>> +	int color_index;
> We need to differentiate both more meaningfully.
> Maybe led_color_id and cluster_color_id?

Thats looks better.


>> +};
>> +static int calculate_brightness(int brightness, int intensity, int max_intensity)
> How about led_mc_calculate_brightness ?

I was trying to keep the function name short for this to keep it the LoC 
boundary.

But I can change it.

>
>> +{
>> +	if (brightness && intensity && max_intensity)
>> +		return brightness * intensity / max_intensity;
>> +
>> +	return LED_OFF;
>> +}
>> +
>> +void set_cluster_brightness(struct led_classdev_mc *mcled_cdev,
>> +			    enum led_brightness brightness, int adj_value[])
> s/set_cluster/led_mc_set_cluster/
>
> And I think adj_value is not telling too much. How about:
>
> s/adj_value/color_intensity/

Ack

...

Ack


>
>> +{
>> +	struct led_classdev_mc_data *data = mcled_cdev->data;
>> +	struct led_classdev_mc_priv *priv;
>> +	int i = 0;
>> +
>> +	list_for_each_entry(priv, &data->color_list, list) {
>> +		adj_value[i] = calculate_brightness(brightness, priv->intensity,
>> +						    priv->max_intensity);
>> +		i++;
>> +	}
>> +
>> +	data->cluster_brightness = brightness;
> This property duplicates brightness stored in struct led_classdev and
> thus it is redundant.

Ack


>> +}
>> +
>> +void get_cluster_brightness(struct led_classdev_mc *mcled_cdev,
>> +				  int brightness_val[])
> s/get_cluster/led_mc_get_cluster/
>
> s/brightness_val/color_intensity/

Ack

Ack


>
>> +{
>> +	struct led_classdev_mc_data *data = mcled_cdev->data;
>> +	struct led_classdev_mc_priv *priv;
>> +	int i = 0;
>> +
>> +	list_for_each_entry(priv, &data->color_list, list) {
>> +		brightness_val[i] = priv->intensity;
>> +		i++;
>> +	}
>> +}
>> +
>> +static ssize_t color_index_show(struct device *dev,
>> +				   struct device_attribute *color_index_attr,
>> +				   char *buf)
>> +{
>> +	struct led_classdev_mc_priv *priv = container_of(color_index_attr,
>> +						    struct led_classdev_mc_priv,
>> +						      color_index_attr);
>> +
>> +	return sprintf(buf, "%d\n", priv->color_id);
>> +}
>> +
>> +static ssize_t color_mix_store(struct device *dev,
>> +				struct device_attribute *color_mix_attr,
>> +				const char *buf, size_t size)
>> +{
>> +	struct led_classdev_mc_data *data = container_of(color_mix_attr,
>> +						    struct led_classdev_mc_data,
>> +						      color_mix_attr);
>> +	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
>> +	const struct led_multicolor_ops *ops = mcled_cdev->ops;
>> +	struct led_classdev_mc_priv *priv;
>> +	unsigned int value[LED_COLOR_ID_MAX];
>> +	int adj_brightness;
>> +	int nrchars, offset = 0;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	for (i = 0; i < mcled_cdev->num_leds; i++) {
>> +		ret = sscanf(buf + offset, "%i%n", &value[i], &nrchars);
>> +		if (ret != 1)
>> +			break;
>> +
>> +		offset += nrchars;
>> +	}
>> +
>> +	if (i != mcled_cdev->num_leds) {
> Shouldn't we return error if i != mcled_cdev->num_leds - 1 ?
> How can we know which color the value will be for if there is less
> values passed than the total number of colors in the cluster?

Ok so during my testing if I had the monochrome array as <R G B>

When I wrote only <R G> and no blue I was getting random values in the 
array for the

remaining indexes and the blue LED would randomly turn on/off at 
different levels.

So if the user passes in less then expected only ids with data will be 
written and the other colors will be turned off by the for loop below.


>
>> +		for (; i < LED_COLOR_ID_MAX; i++)
>> +			value[i] = 0;
> What use case is it for?

See above but this should be

for (; i < mcled_cdev->num_leds; i++)


>
>> +	}
>> +
>> +	list_for_each_entry(priv, &data->color_list, list) {
>> +		if (data->cluster_brightness) {
>> +			adj_brightness = calculate_brightness(data->cluster_brightness,
>> +							      value[priv->color_index],
>> +							     priv->max_intensity);
>> +			ret = ops->set_color_brightness(priv->mcled_cdev,
>> +							priv->color_id,
>> +							adj_brightness);
>> +			if (ret < 0)
>> +				goto done;
>> +		}
>> +
>> +		priv->intensity = value[priv->color_index];
>> +	}
> Here we could use just brightness_set op as a single call. We should
> always write all colors as a result of write to color_mix anyway.

I guess what is gained by just passing the array down to the device 
driver and having it

parse the array and do the peripheral call?


>
>> +
>> +done:
>> +	return size;
>> +}
>> +
>> +static ssize_t intensity_store(struct device *dev,
>> +				struct device_attribute *intensity_attr,
>> +				const char *buf, size_t size)
>> +{
>> +	struct led_classdev_mc_priv *priv = container_of(intensity_attr,
>> +						    struct led_classdev_mc_priv,
>> +						      intensity_attr);
>> +	struct led_classdev_mc_data *data = priv->mcled_cdev->data;
>> +	struct led_classdev *led_cdev = priv->mcled_cdev->led_cdev;
>> +	struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
>> +	unsigned int adj_value;
>> +	unsigned long value;
>> +	ssize_t ret;
>> +
>> +	mutex_lock(&led_cdev->led_access);
>> +
>> +	ret = kstrtoul(buf, 10, &value);
>> +	if (ret)
>> +		goto unlock;
>> +
>> +	if (value > priv->max_intensity) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
> We don't fail in this case in LED class, so let's proceed in the same
> way here:
>
> priv->intensity = min(value, priv->max_brightness);

ACK


>> +
>> +	priv->new_intensity = value;
>> +
>> +	if (data->cluster_brightness) {
>> +		adj_value = calculate_brightness(data->cluster_brightness,
>> +					priv->new_intensity,
>> +					priv->max_intensity);
>> +		ret = ops->set_color_brightness(priv->mcled_cdev,
>> +						priv->color_id, adj_value);
>> +		if (ret < 0) {
>> +			priv->new_intensity = priv->intensity;
> This is unnecessary complication. Just write the calculated iout
> intensity.

Not sure what complication you are referring to.


> We need to highlight it in the documentation that exact requested color
> intensity values are written to the hardware only when
> brightness == max_brightness.

But that is not a true statement.  Thats not really how it was designed.


>
>> +			goto unlock;
>> +		}
>> +	}
>> +
>> +	priv->intensity = priv->new_intensity;
>> +	ret = size;
>> +
>> +unlock:
>> +	mutex_unlock(&led_cdev->led_access);
>> +	return ret;
>> +}
>> +
>> +static ssize_t intensity_show(struct device *dev,
>> +			      struct device_attribute *intensity_attr,
>> +			      char *buf)
>> +{
>> +	struct led_classdev_mc_priv *priv = container_of(intensity_attr,
>> +						    struct led_classdev_mc_priv,
>> +						      intensity_attr);
>> +	const struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
>> +	int value = 0;
>> +
>> +	if (ops->get_color_brightness) {
>> +		value = ops->get_color_brightness(priv->mcled_cdev,
>> +						  priv->color_id);
>> +		priv->intensity = value;
>> +	} else {
>> +		value = priv->intensity;
>> +	}
>> +
>> +	return sprintf(buf, "%d\n", value);
>> +}
>> +
>> +static ssize_t max_intensity_show(struct device *dev,
>> +				   struct device_attribute *max_intensity_attr,
>> +				   char *buf)
>> +{
>> +	struct led_classdev_mc_priv *priv = container_of(max_intensity_attr,
>> +						    struct led_classdev_mc_priv,
>> +						      max_intensity_attr);
>> +
>> +	return sprintf(buf, "%d\n", priv->max_intensity);
>> +}
>> +
>> +static int led_multicolor_init_color(struct led_classdev_mc_data *data,
>> +				     struct led_classdev_mc *mcled_cdev,
>> +				     int color_id, int color_index)
>> +{
>> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>> +	struct led_classdev_mc_priv *mc_priv;
>> +	int ret;
>> +
>> +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
>> +	if (!mc_priv)
>> +		return -ENOMEM;
>> +
>> +	mc_priv->color_id = color_id;
>> +	mc_priv->mcled_cdev = mcled_cdev;
>> +
>> +	data->led_kobj = kobject_create_and_add(led_colors[color_id],
>> +						data->color_kobj);
> You should not use kobject API in the drivers. See [0].

I will look at it.

Dan

<snip> no other comments till v5


