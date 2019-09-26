Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3ACBF20B
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 13:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbfIZLrA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 07:47:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54164 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbfIZLrA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 07:47:00 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QBktDJ019202;
        Thu, 26 Sep 2019 06:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569498415;
        bh=YTm21gUfdR5Lb9TFj8+JVfJGVQEtERNPDJM+z6T+kdg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EorMSEvEC+mFYwMKDEe9FqBJRyp5VXorxWFVg/DVEIj+YZ+D4LDC0MR3FgcuMEN8i
         XBEy3pMA8PFoWkc3l4b6EVF4cgZW8y2kGycOUxWECI3xdlE39eVLDn4KDHpNVDaqrf
         pjUaFMD3Ii5j+RFfLnnoASSg+qBRl3/iikGLy7nQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QBktZ1031582;
        Thu, 26 Sep 2019 06:46:55 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 06:46:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 06:46:47 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QBks00093371;
        Thu, 26 Sep 2019 06:46:54 -0500
Subject: Re: [PATCH v9 05/15] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-6-dmurphy@ti.com>
 <918ff939-8b6c-af35-ef08-0f13937d2fed@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <4f23cd99-23a5-5185-dd42-d6d29c48f566@ti.com>
Date:   Thu, 26 Sep 2019 06:52:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <918ff939-8b6c-af35-ef08-0f13937d2fed@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/25/19 4:12 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/25/19 7:46 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via <color>_intensity files and the latter is controlled
>> via brightness file.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                 |  10 ++
>>   drivers/leds/Makefile                |   1 +
>>   drivers/leds/led-class-multicolor.c  | 220 +++++++++++++++++++++++++++
>>   include/linux/led-class-multicolor.h |  74 +++++++++
>>   4 files changed, 305 insertions(+)
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 6e7703fd03d0..cfb1ebb6517f 100644
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
>> index 2da39e896ce8..841038cfe35b 100644
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
>> index 000000000000..25371bd9a860
>> --- /dev/null
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -0,0 +1,220 @@
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
>> +#define INTENSITY_NAME		"_intensity"
>> +#define MAX_INTENSITY_NAME	"_max_intensity"
>> +
>> +void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
>> +			    enum led_brightness brightness,
>> +			    int brightness_val[])
>> +{
>> +	struct led_mc_color_entry *priv;
>> +	int i = 0;
>> +
>> +	list_for_each_entry(priv, &mcled_cdev->color_list, list) {
> I think we should have some way to let the caller know exact mapping
> of brightness_val to color_id. Possibly LED mc core should provide
> a helper to get color_id by color entry index.

Why would we need that?


>
> But this remark is actually more relevant to the place of calling.
> I'll try to propose something there.
>
> And regarding brightness_val name - how about:
>
> s/brightness_val/brightness_component/ ?

component does not make sense to me in this context.  Actually 
brightness_val

does not make sense either since it is an adjusted intensity and 
brightness is passed in in the second arg

I think intensity_values make more sense.


>
>
>> +		brightness_val[i] = brightness *
>> +				    priv->intensity / priv->max_intensity;
>> +		i++;
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(led_mc_calc_brightness);
>> +
>> +static ssize_t intensity_store(struct device *dev,
>> +				struct device_attribute *intensity_attr,
>> +				const char *buf, size_t size)
>> +{
>> +	struct led_mc_color_entry *priv = container_of(intensity_attr,
>> +						    struct led_mc_color_entry,
>> +						      intensity_attr);
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
>> +	struct led_mc_color_entry *priv = container_of(intensity_attr,
>> +						    struct led_mc_color_entry,
>> +						      intensity_attr);
>> +
>> +	return sprintf(buf, "%d\n", priv->intensity);
>> +}
>> +
>> +static ssize_t max_intensity_show(struct device *dev,
>> +				   struct device_attribute *max_intensity_attr,
>> +				   char *buf)
>> +{
>> +	struct led_mc_color_entry *priv = container_of(max_intensity_attr,
>> +						    struct led_mc_color_entry,
>> +						      max_intensity_attr);
>> +
>> +	return sprintf(buf, "%d\n", priv->max_intensity);
>> +}
>> +
>> +static struct attribute *led_color_attrs[] = {
>> +	NULL,
>> +};
>> +
>> +static struct attribute_group led_color_group = {
>> +	.name = "colors",
>> +	.attrs = led_color_attrs,
>> +};
>> +
>> +static int led_multicolor_init_color(struct led_classdev_mc *mcled_cdev,
>> +				     int color_id, int color_index)
>> +{
>> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>> +	struct led_mc_color_entry *mc_priv;
>> +	char *intensity_file_name;
>> +	char *max_intensity_file_name;
>> +	size_t len;
>> +	int ret;
>> +
>> +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
>> +	if (!mc_priv)
>> +		return -ENOMEM;
>> +
>> +	mc_priv->led_color_id = color_id;
>> +	mc_priv->mcled_cdev = mcled_cdev;
>> +
>> +	sysfs_attr_init(&mc_priv->intensity_attr.attr);
>> +	len = strlen(led_colors[color_id]) + strlen(INTENSITY_NAME) + 1;
>> +	intensity_file_name = kzalloc(len, GFP_KERNEL);
>> +	if (!intensity_file_name)
>> +		return -ENOMEM;
>> +
>> +	snprintf(intensity_file_name, len, "%s%s",
>> +		 led_colors[color_id], INTENSITY_NAME);
>> +	mc_priv->intensity_attr.attr.name = intensity_file_name;
>> +	mc_priv->intensity_attr.attr.mode = 644;
> Proper octal value should begin with 0.
> But please use combinations of dedicated S_I* definitions
> from include/uapi/linux/stat.h.

Using the S_I* causes checkpatch warnings

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider 
using octal permissions '0444'.
#139: FILE: drivers/leds/led-class-multicolor.c:139:
+    mc_priv->max_intensity_attr.attr.mode = S_IRUGO;

>
>> +	mc_priv->intensity_attr.store = intensity_store;
>> +	mc_priv->intensity_attr.show = intensity_show;
>> +	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
>> +				      &mc_priv->intensity_attr.attr,
>> +				      led_color_group.name);
>> +	if (ret)
>> +		goto intensity_err_out;
>> +
>> +	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
>> +	len = strlen(led_colors[color_id]) + strlen(MAX_INTENSITY_NAME) + 1;
>> +	max_intensity_file_name = kzalloc(len, GFP_KERNEL);
>> +	if (!max_intensity_file_name) {
>> +		ret = -ENOMEM;
>> +		goto intensity_err_out;
>> +	}
>> +
>> +	snprintf(max_intensity_file_name, len, "%s%s",
>> +		 led_colors[color_id], MAX_INTENSITY_NAME);
>> +	mc_priv->max_intensity_attr.attr.name = max_intensity_file_name;
>> +	mc_priv->max_intensity_attr.attr.mode = 444;
>> +	mc_priv->max_intensity_attr.show = max_intensity_show;
>> +	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
>> +				      &mc_priv->max_intensity_attr.attr,
>> +				      led_color_group.name);
>> +	if (ret)
>> +		goto max_intensity_err_out;
>> +
>> +	mc_priv->max_intensity = LED_FULL;
>> +	list_add_tail(&mc_priv->list, &mcled_cdev->color_list);
>> +
>> +max_intensity_err_out:
>> +	kfree(max_intensity_file_name);
>> +intensity_err_out:
>> +	kfree(intensity_file_name);
>> +	return ret;
>> +}
>> +
>> +static int led_multicolor_init_color_dir(struct led_classdev_mc *mcled_cdev)
>> +{
>> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>> +	int ret;
>> +	int i, color_index = 0;
>> +
>> +	ret = sysfs_create_group(&led_cdev->dev->kobj, &led_color_group);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < LED_COLOR_ID_MAX; i++) {
>> +		if (test_bit(i, &mcled_cdev->available_colors)) {
>> +			ret = led_multicolor_init_color(mcled_cdev, i,
>> +							color_index);
> color_index is now unused AFAICS.

Ack

>
>> +			if (ret)
>> +				break;
>> +
>> +			color_index++;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +int led_classdev_multicolor_register_ext(struct device *parent,
>> +				     struct led_classdev_mc *mcled_cdev,
>> +				     struct led_init_data *init_data)
>> +{
>> +	struct led_classdev *led_cdev;
>> +	int ret;
>> +
>> +	if (!mcled_cdev)
>> +		return -EINVAL;
>> +
>> +	led_cdev = mcled_cdev->led_cdev;
>> +	INIT_LIST_HEAD(&mcled_cdev->color_list);
>> +
>> +	/* Register led class device */
>> +	ret = led_classdev_register_ext(parent, led_cdev, init_data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return led_multicolor_init_color_dir(mcled_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
> Why devm_* versions are missing now?

I was using the led-class-flash.c as an example and that class does not 
have the devm_* versions either.

Tried to make the 2 child classes look the same.

If they are missing from the led-class-flash code then that needs to be 
fixed as well.

>
>> +
>> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev)
>> +{
>> +	struct led_mc_color_entry *priv, *next;
>> +
>> +	if (!mcled_cdev)
>> +		return;
>> +
>> +	list_for_each_entry_safe(priv, next, &mcled_cdev->color_list, list)
>> +		list_del(&priv->list);
>> +
>> +	sysfs_remove_group(&mcled_cdev->led_cdev->dev->kobj, &led_color_group);
>> +	led_classdev_unregister(mcled_cdev->led_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
>> +
>> +MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
>> +MODULE_DESCRIPTION("Multi Color LED class interface");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
>> new file mode 100644
>> index 000000000000..280ba5a614b4
>> --- /dev/null
>> +++ b/include/linux/led-class-multicolor.h
>> @@ -0,0 +1,74 @@
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
>> +struct led_mc_color_entry {
>> +	struct led_classdev_mc *mcled_cdev;
>> +
>> +	struct device_attribute max_intensity_attr;
>> +	struct device_attribute intensity_attr;
>> +
>> +	enum led_brightness max_intensity;
>> +	enum led_brightness intensity;
>> +
>> +	struct list_head list;
>> +
>> +	int led_color_id;
>> +};
>> +
>> +struct led_classdev_mc {
>> +	/* led class device */
>> +	struct led_classdev *led_cdev;
>> +	struct list_head color_list;
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
>> +int led_classdev_multicolor_register_ext(struct device *parent,
>> +					    struct led_classdev_mc *mcled_cdev,
>> +					    struct led_init_data *init_data);
>> +
>> +#define led_classdev_multicolor_register(parent, mcled_cdev)		\
>> +	led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL)
> Please turn it into inline.

Again same statement as above on the led-class-flash.  This is how this 
is defined there.

If that is not correct in the flash class then that needs to be fixed as 
well.

Dan

>
>> +
>> +/**
>> + * led_classdev_multicolor_unregister - unregisters an object of led_classdev
>> + *					class with support for multicolor LEDs
>> + * @mcled_cdev: the multicolor LED to unregister
>> + *
>> + * Unregister a previously registered via led_classdev_multicolor_register
>> + * object
>> + */
>> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
>> +
>> +/* Calculate brightness for the monochrome LED cluster */
>> +void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
>> +			    enum led_brightness brightness,
>> +			    int brightness_val[]);
>> +
>> +#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
>>
