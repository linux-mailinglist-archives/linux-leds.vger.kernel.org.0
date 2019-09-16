Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A594B3C14
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2019 16:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbfIPOCs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Sep 2019 10:02:48 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43788 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbfIPOCs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2019 10:02:48 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GE2g4C087214;
        Mon, 16 Sep 2019 09:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568642562;
        bh=1o+WEPHbQGhtx+ySkGeP4ZSQoQFlOYAa3nQ/so5YgXk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pYQ+EosLBlsqVhNBiRcjnrbu3iwPbgPM91EzCjmKN/Vfj5GRwBJUoLauIDpuo8+/9
         j0aZ/eXPNfJGz85vlDDYzz+vnYfh944hItFjA8iQkNb2OldJQK+5uJDw1T+MgbjeWL
         E9k6EJstvioEGKyYbtGBWoa+/h3pIeZib9+Zm70A=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GE2gsY083108;
        Mon, 16 Sep 2019 09:02:42 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 09:02:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 09:02:42 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GE2gnU089835;
        Mon, 16 Sep 2019 09:02:42 -0500
Subject: Re: [PATCH v5 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-7-dmurphy@ti.com>
 <2bfd27cf-6703-48b8-be82-9b36066ef2ed@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3ec7191b-dd65-9da0-2688-7cd6bb41b6f8@ti.com>
Date:   Mon, 16 Sep 2019 09:04:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2bfd27cf-6703-48b8-be82-9b36066ef2ed@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/15/19 11:20 AM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/11/19 8:01 PM, Dan Murphy wrote:
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
>>   drivers/leds/led-class-multicolor.c  | 387 +++++++++++++++++++++++++++
>>   include/linux/led-class-multicolor.h |  96 +++++++
>>   4 files changed, 494 insertions(+)
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 1988de1d64c0..71e7fd4f6f15 100644
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
>> +	  It wraps LED class and adds multicolor LED specific sysfs attributes
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
>> index 000000000000..c733192b31fa
>> --- /dev/null
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -0,0 +1,387 @@
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
> I'd go for some more informative struct name here.
> And also this is not going to be main classdev struct
> so we can drop that from the name.
>
> struct led_mc_color_entry ?

That would probably be better as a name.


>
>> +	struct led_classdev_mc *mcled_cdev;
>> +
>> +	struct device_attribute max_intensity_attr;
>> +	struct device_attribute intensity_attr;
>> +	struct device_attribute color_index_attr;
>> +
>> +	enum led_brightness max_intensity;
>> +	enum led_brightness intensity;
>> +
>> +	struct list_head list;
>> +
>> +	int led_color_id;
>> +	int color_seq_pos;
>> +};
>> +
>> +static int led_mc_calculate_brightness(int brightness, int intensity,
>> +				       int max_intensity)
>> +{
>> +	if (brightness && intensity && max_intensity)
> This check looks odd. I'd drop it entirely. One thing we could worry
> about would be max_intensity == 0 but this should be secured by the
> core on registration. Effectively I don't see the need for wrapping
> below calculation in a function at all.

This was made into a function when I had the intensity and color_mix

files writing the values.  This is no longer needed as a function.


>
>> +		return brightness * intensity / max_intensity;
>> +
>> +	return LED_OFF;
>> +}
>> +
>> +void led_mc_set_cluster_brightness(struct led_classdev_mc *mcled_cdev,
>
> We really don't set cluster brightness but calculate it only here
> (we can skip "cluster" as well):
>
> s/led_mc_set_cluster_brightness/led_mc_calc_brightness/
Ack
>
>> +			    enum led_brightness brightness, int adj_value[])
> s/adj_value/brightness_val/
Ack
>
>> +{
>> +	struct led_classdev_mc_data *data = mcled_cdev->data;
>> +	struct led_classdev_mc_priv *priv;
>> +	int i = 0;
>> +
>> +	list_for_each_entry(priv, &data->color_list, list) {
>> +		adj_value[i] = led_mc_calculate_brightness(brightness,
>> +							   priv->intensity,
>> +							   priv->max_intensity);
> brightness_val[i] = brightness * priv->intensity / priv->max_intensity;
Ack
>
>> +		i++;
>> +	}
>> +
>> +	data->cluster_brightness = brightness;
> Why can't we use led_classdev_mc->led_cdev->brightness for storing
> cluster brightness?

We could probably drop this altogether as I think you pointed out before.


>
>> +}
>> +
>> +void led_mc_get_cluster_brightness(struct led_classdev_mc *mcled_cdev,
>> +				  int brightness_val[])
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
>> +	return sprintf(buf, "%d\n", priv->led_color_id);
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
>> +	struct led_classdev_mc_priv *priv;
>> +	unsigned int value[LED_COLOR_ID_MAX];
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
>> +		dev_err(dev, "Wrong number of LEDs defined %i, need %i\n",
>> +			i, mcled_cdev->num_leds);
>> +		return -EINVAL;
>> +	}
>> +
>> +	list_for_each_entry(priv, &data->color_list, list) {
>> +		priv->intensity = value[priv->color_seq_pos];
>> +		if (mcled_cdev->ops) {
>> +			ret = mcled_cdev->ops->set_color_brightness(mcled_cdev,
>> +							    priv->led_color_id,
>> +							    priv->intensity);
>> +			if (ret)
>> +				goto out;
>> +		}
>> +	}
>> +out:
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
>> +	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
>> +	struct led_classdev *led_cdev = priv->mcled_cdev->led_cdev;
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
>> +
>> +	priv->intensity = value;
>> +
>> +	if (mcled_cdev->ops) {
>> +		ret = mcled_cdev->ops->set_color_brightness(mcled_cdev,
>> +							    priv->led_color_id,
>> +							    priv->intensity);
>> +		if (ret)
>> +			goto unlock;
>> +	}
>> +
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
>> +						  priv->led_color_id);
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
>> +	mc_priv->led_color_id = color_id;
>> +	mc_priv->mcled_cdev = mcled_cdev;
>> +
>> +	data->led_kobj = kobject_create_and_add(led_colors[color_id],
>> +						data->color_kobj);
> No change here since previous version? What prevents you from following
> what has been done for drivers/usb/core/ledtrig-usbport.c?
>
> Use sysfs_create_group() for creating color dir
> and sysfs_add_file_to_group() for adding files to it.

Yet another change I missed.

I am hoping we can actually nail this down for 5.5.  So many changes and 
versions to this.

Dan

>
>
>> +	if (!data->led_kobj)
>> +		return -EINVAL;
>> +
>> +	sysfs_attr_init(&mc_priv->intensity_attr.attr);
>> +	mc_priv->intensity_attr.attr.name = "intensity";
>> +	mc_priv->intensity_attr.attr.mode = S_IRUGO | S_IWUGO;
>> +	mc_priv->intensity_attr.store = intensity_store;
>> +	mc_priv->intensity_attr.show = intensity_show;
>> +	ret = sysfs_create_file(data->led_kobj,
>> +				&mc_priv->intensity_attr.attr);
>> +	if (ret)
>> +		goto err_out;
>> +
>> +	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
>> +	mc_priv->max_intensity_attr.attr.name = "max_intensity";
>> +	mc_priv->max_intensity_attr.attr.mode = S_IRUGO;
>> +	mc_priv->max_intensity_attr.show = max_intensity_show;
>> +	ret = sysfs_create_file(data->led_kobj,
>> +				&mc_priv->max_intensity_attr.attr);
>> +	if (ret)
>> +		goto err_out;
>> +
>> +	sysfs_attr_init(&mc_priv->color_index_attr.attr);
>> +	mc_priv->color_index_attr.attr.name = "color_id";
>> +	mc_priv->color_index_attr.attr.mode = S_IRUGO;
>> +	mc_priv->color_index_attr.show = color_index_show;
>> +	ret = sysfs_create_file(data->led_kobj,
>> +				&mc_priv->color_index_attr.attr);
>> +	if (ret)
>> +		goto err_out;
>> +
>> +	mc_priv->max_intensity = LED_FULL;
>> +	mc_priv->color_seq_pos = color_index;
>> +	list_add_tail(&mc_priv->list, &data->color_list);
>> +
>> +err_out:
>> +	return ret;
>> +}
>> +
>> +static int led_multicolor_init_color_dir(struct led_classdev_mc_data *data,
>> +					 struct led_classdev_mc *mcled_cdev)
>> +{
>> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>> +	u32 color_id;
>> +	int ret;
>> +	int i, j = 0;
>> +
>> +	data->color_kobj = kobject_create_and_add("colors",
>> +						  &led_cdev->dev->kobj);
> Again: use sysfs_create_group().
>
>> +	if (!data->color_kobj)
>> +		return -EINVAL;
>> +
>> +	data->mcled_cdev = mcled_cdev;
>> +
>> +	for (i = 0; i < LED_COLOR_ID_MAX; i++) {
>> +		color_id = (mcled_cdev->available_colors & (1 << i));
>> +		if (color_id) {
>> +			ret = led_multicolor_init_color(data, mcled_cdev, i, j);
>> +			if (ret)
>> +				break;
>> +
>> +			j++;
>> +		}
>> +	}
>> +
>> +	sysfs_attr_init(&data->color_mix_attr.attr);
>> +	data->color_mix_attr.attr.name = "color_mix";
>> +	data->color_mix_attr.attr.mode = S_IRUGO | S_IWUGO;
>> +	data->color_mix_attr.store = color_mix_store;
>> +	ret = sysfs_create_file(data->color_kobj,
>> +				&data->color_mix_attr.attr);
>> +
>> +	return ret;
>> +}
>> +
>> +int led_classdev_multicolor_register_ext(struct device *parent,
>> +				     struct led_classdev_mc *mcled_cdev,
>> +				     struct led_init_data *init_data)
>> +{
>> +	struct led_classdev *led_cdev;
>> +	struct led_classdev_mc_data *data;
>> +	int ret;
>> +
>> +	if (!mcled_cdev)
>> +		return -EINVAL;
>> +
>> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	mcled_cdev->data = data;
>> +	led_cdev = mcled_cdev->led_cdev;
>> +	INIT_LIST_HEAD(&data->color_list);
>> +
>> +	/* Register led class device */
>> +	ret = led_classdev_register_ext(parent, led_cdev, init_data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return led_multicolor_init_color_dir(data, mcled_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
>> +
>> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev)
>> +{
>> +	if (!mcled_cdev)
>> +		return;
>> +
>> +	led_classdev_unregister(mcled_cdev->led_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
>> +
>> +static void devm_led_classdev_multicolor_release(struct device *dev, void *res)
>> +{
>> +	led_classdev_multicolor_unregister(*(struct led_classdev_mc **)res);
>> +}
>> +
>> +/**
>> + * devm_of_led_classdev_register - resource managed led_classdev_register()
>> + *
>> + * @parent: parent of LED device
>> + * @led_cdev: the led_classdev structure for this device.
>> + */
>> +int devm_led_classdev_multicolor_register(struct device *parent,
>> +					  struct led_classdev_mc *mcled_cdev)
>> +{
>> +	struct led_classdev_mc **dr;
>> +	int ret;
>> +
>> +	dr = devres_alloc(devm_led_classdev_multicolor_release,
>> +			  sizeof(*dr), GFP_KERNEL);
>> +	if (!dr)
>> +		return -ENOMEM;
>> +
>> +	ret = led_classdev_multicolor_register(parent, mcled_cdev);
>> +	if (ret) {
>> +		devres_free(dr);
>> +		return ret;
>> +	}
>> +
>> +	*dr = mcled_cdev;
>> +	devres_add(parent, dr);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register);
>> +
>> +static int devm_led_classdev_multicolor_match(struct device *dev,
>> +					      void *res, void *data)
>> +{
>> +	struct mcled_cdev **p = res;
>> +
>> +	if (WARN_ON(!p || !*p))
>> +		return 0;
>> +
>> +	return *p == data;
>> +}
>> +
>> +/**
>> + * devm_led_classdev_multicolor_unregister() - resource managed
>> + *					led_classdev_multicolor_unregister()
>> + * @parent: The device to unregister.
>> + * @mcled_cdev: the led_classdev_mc structure for this device.
>> + */
>> +void devm_led_classdev_multicolor_unregister(struct device *dev,
>> +				  struct led_classdev_mc *mcled_cdev)
>> +{
>> +	WARN_ON(devres_release(dev,
>> +			       devm_led_classdev_multicolor_release,
>> +			       devm_led_classdev_multicolor_match, mcled_cdev));
>> +}
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_unregister);
>> +
>> +MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
>> +MODULE_DESCRIPTION("Multi Color LED class interface");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
>> new file mode 100644
>> index 000000000000..193ba0e46042
>> --- /dev/null
>> +++ b/include/linux/led-class-multicolor.h
>> @@ -0,0 +1,96 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* LED Multicolor class interface
>> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> + */
>> +
>> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>> +
>> +#include <linux/leds.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +struct led_classdev_mc;
>> +
>> +struct led_classdev_mc_data {
>> +	struct led_classdev_mc *mcled_cdev;
>> +
>> +	struct kobject *color_kobj;
>> +	struct kobject *led_kobj;
>> +
>> +	struct device_attribute color_mix_attr;
>> +
>> +	struct list_head color_list;
>> +
>> +	enum led_brightness cluster_brightness;
>> +};
>> +
>> +struct led_multicolor_ops {
>> +	/* Set brightness for a specific color id */
>> +	int (*set_color_brightness)(struct led_classdev_mc *mcled_cdev,
>> +				    int color_id, int value);
>> +	/* Read current color setting */
>> +	int (*get_color_brightness)(struct led_classdev_mc *mcled_cdev,
>> +				    int color_id);
>> +};
>> +
>> +struct led_classdev_mc {
>> +	/* led class device */
>> +	struct led_classdev *led_cdev;
>> +
>> +	/* multicolor led specific ops */
>> +	struct led_multicolor_ops *ops;
>> +
>> +	struct led_classdev_mc_data *data;
>> +
>> +	unsigned long available_colors;
>> +	int num_leds;
>> +};
>> +
>> +static inline struct led_classdev_mc *lcdev_to_mccdev(
>> +						struct led_classdev *lcdev)
>> +{
>> +	return container_of(lcdev, struct led_classdev_mc, led_cdev);
>> +}
>> +
>> +/**
>> + * led_classdev_multicolor_register_ext - register a new object of led_classdev
>> + *				      class with support for multicolor LEDs
>> + * @parent: the multicolor LED to register
>> + * @mcled_cdev: the led_classdev_mc structure for this device
>> + * @init_data: the LED class Multi color device initialization data
>> + *
>> + * Returns: 0 on success or negative error value on failure
>> + */
>> +extern int led_classdev_multicolor_register_ext(struct device *parent,
>> +					    struct led_classdev_mc *mcled_cdev,
>> +					    struct led_init_data *init_data);
>> +
>> +#define led_classdev_multicolor_register(parent, mcled_cdev)		\
>> +	led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL)
>> +
>> +/**
>> + * led_classdev_multicolor_unregister - unregisters an object of led_classdev
>> + *					class with support for multicolor LEDs
>> + * @mcled_cdev: the multicolor LED to unregister
>> + *
>> + * Unregister a previously registered via led_classdev_multicolor_register
>> + * object
>> + */
>> +extern void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
>> +
>> +extern int devm_led_classdev_multicolor_register(struct device *parent,
>> +					struct led_classdev_mc *mcled_cdev);
>> +
>> +extern void devm_led_classdev_multicolor_unregister(struct device *parent,
>> +					   struct led_classdev_mc *mcled_cdev);
>> +
>> +/* Set brightness for the monochrome LED cluster */
>> +extern void led_mc_set_cluster_brightness(struct led_classdev_mc *mcled_cdev,
>> +			    enum led_brightness brightness,
>> +			    int adj_value[]);
>> +
>> +/* Read current cluster brightness */
>> +extern void led_mc_get_cluster_brightness(struct led_classdev_mc *mcled_cdev,
>> +				   int brightness_val[]);
>> +
>> +#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
>>
