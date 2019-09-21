Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD5DB9E14
	for <lists+linux-leds@lfdr.de>; Sat, 21 Sep 2019 15:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394198AbfIUNav (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Sep 2019 09:30:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53156 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388184AbfIUNav (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Sep 2019 09:30:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id x2so5229623wmj.2;
        Sat, 21 Sep 2019 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZdvJJbOz8XQeyLTqUP0PtgJ+PqHLukP4qh9YctmEbiU=;
        b=AzvN/Powvkl/zmqeph0bgix0Qwc+EjLSSjZixAi/A+/i1IEQo98I4gtswb5r6j07hl
         QnHoRi+giGqTlXfkTtegdoVY5MlMFL7zBoKV6E9kdH72oDHOzENdq1pgxfVn7dR45dYG
         F4YnDkQryamdEZzCtKxLnvTXmht6GIgBVgs5DzX9TQSoXhaQqhZjRcVl/PtYpLiAA/XQ
         bcOhi3XOrA4t5+lFnJ7LmztX/sFBTB83o1ayJj1RmBbjqskrJSSvoR/erHzKeSdw2WLR
         pmWF6DO0OvNXDky0WeOLK4piGvbIeQwHoWLxV8UJkkSbKBr1lXzSujdTf4wYFGEYapgQ
         tumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZdvJJbOz8XQeyLTqUP0PtgJ+PqHLukP4qh9YctmEbiU=;
        b=Ys+m6O7JV0CqbC+UGAws88mfadQE5aPkbme2cLRyv1InHMutB/T2CNbITMSpegnZyw
         U2G8dYijd//ZuqijkCpZcfQVPeaucXHQ0wVpdz0VuJztY9EgdnAPvkeF9ciI4cKLCVEH
         bMKepPC0k1e3MU2eplkupPCRGTWHQh1z36Zuu/dOCEOcNpzEFMlz6DHjkk8Qg0P+hoXO
         19Ur5/S3mjZHPY7gDy/oUPhkyihnc6Tg1sFoJYnjO5a5pDLmv2H/7RJQWlXNobtX9nxV
         6BjmhSiG5jWN0a8T32LE1Mbd5dkTvCToLacFfbtePd6SfU2BCuOkngp0fHlWjuFrhzQQ
         2d/A==
X-Gm-Message-State: APjAAAXT8fU6ysjsurvhX/RoWJWu/Px+hkwTSoJFsvHSuuzB9Vfnu6Eq
        F7wCZC4GNr8+++aMmFLxe20QPsPi
X-Google-Smtp-Source: APXvYqzTUBhqVznE0X41zja8hJnDG50yrVj8FQUKkCX1WDAC6Swloo6v/xbOUBxrGNf+ZtNEZcy3fg==
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr5163725wml.52.1569072646953;
        Sat, 21 Sep 2019 06:30:46 -0700 (PDT)
Received: from [192.168.1.19] (blb134.neoplus.adsl.tpnet.pl. [83.28.195.134])
        by smtp.gmail.com with ESMTPSA id z6sm4190417wro.16.2019.09.21.06.30.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 06:30:46 -0700 (PDT)
Subject: Re: [PATCH v8 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-7-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <157045af-f6c4-919b-3617-350299639f8f@gmail.com>
Date:   Sat, 21 Sep 2019 15:30:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920174139.30079-7-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/20/19 7:41 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The framework allows for dynamically setting individual LEDs
> or setting brightness levels of LEDs and updating them virtually
> simultaneously.

Let's update this to the corresponding changed fragment from
the documentation after we finally agree upon it.

> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig                 |  10 +
>  drivers/leds/Makefile                |   1 +
>  drivers/leds/led-class-multicolor.c  | 316 +++++++++++++++++++++++++++
>  include/linux/led-class-multicolor.h |  76 +++++++
>  4 files changed, 403 insertions(+)
>  create mode 100644 drivers/leds/led-class-multicolor.c
>  create mode 100644 include/linux/led-class-multicolor.h
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6e7703fd03d0..cfb1ebb6517f 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>  	  for the flash related features of a LED device. It can be built
>  	  as a module.
>  
> +config LEDS_CLASS_MULTI_COLOR
> +	tristate "LED Mulit Color LED Class Support"
> +	depends on LEDS_CLASS
> +	help
> +	  This option enables the multicolor LED sysfs class in /sys/class/leds.
> +	  It wraps LED class and adds multicolor LED specific sysfs attributes
> +	  and kernel internal API to it. You'll need this to provide support
> +	  for multicolor LEDs that are grouped together. This class is not
> +	  intended for single color LEDs. It can be built as a module.
> +
>  config LEDS_BRIGHTNESS_HW_CHANGED
>  	bool "LED Class brightness_hw_changed attribute support"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2da39e896ce8..841038cfe35b 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -4,6 +4,7 @@
>  obj-$(CONFIG_NEW_LEDS)			+= led-core.o
>  obj-$(CONFIG_LEDS_CLASS)		+= led-class.o
>  obj-$(CONFIG_LEDS_CLASS_FLASH)		+= led-class-flash.o
> +obj-$(CONFIG_LEDS_CLASS_MULTI_COLOR)	+= led-class-multicolor.o
>  obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
>  
>  # LED Platform Drivers
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> new file mode 100644
> index 000000000000..5e0e3fce482b
> --- /dev/null
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// LED Multi Color class interface
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#include "leds.h"
> +
> +#define INTENSITY_NAME		"_intensity"
> +#define MAX_INTENSITY_NAME	"_max_intensity"
> +
> +struct led_mc_color_entry {
> +	struct led_classdev_mc *mcled_cdev;
> +
> +	struct device_attribute max_intensity_attr;
> +	struct device_attribute intensity_attr;
> +
> +	enum led_brightness max_intensity;
> +	enum led_brightness intensity;
> +
> +	struct list_head list;
> +
> +	int led_color_id;
> +};
> +
> +void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
> +			    enum led_brightness brightness,
> +			    int brightness_val[])
> +{
> +	struct led_classdev_mc_data *data = mcled_cdev->data;
> +	struct led_mc_color_entry *priv;
> +	int i = 0;
> +
> +	list_for_each_entry(priv, &data->color_list, list) {
> +		brightness_val[i] = brightness *
> +				    priv->intensity / priv->max_intensity;
> +		i++;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(led_mc_calc_brightness);
> +
> +static ssize_t intensity_store(struct device *dev,
> +				struct device_attribute *intensity_attr,
> +				const char *buf, size_t size)
> +{
> +	struct led_mc_color_entry *priv = container_of(intensity_attr,
> +						    struct led_mc_color_entry,
> +						      intensity_attr);
> +	struct led_classdev_mc_data *data = priv->mcled_cdev->data;
> +	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
> +	struct led_classdev *led_cdev = priv->mcled_cdev->led_cdev;
> +	unsigned long value;
> +	ssize_t ret;
> +
> +	mutex_lock(&led_cdev->led_access);
> +
> +	ret = kstrtoul(buf, 10, &value);
> +	if (ret)
> +		goto unlock;
> +
> +	if (value > priv->max_intensity) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	priv->intensity = value;
> +
> +	if (mcled_cdev->set_color_brightness) {

We will not have this, as discussed.

> +		ret = mcled_cdev->set_color_brightness(mcled_cdev,
> +						       priv->led_color_id,
> +						       priv->intensity);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	ret = size;
> +
> +unlock:
> +	mutex_unlock(&led_cdev->led_access);
> +	return ret;
> +}
> +
> +static ssize_t intensity_show(struct device *dev,
> +			      struct device_attribute *intensity_attr,
> +			      char *buf)
> +{
> +	struct led_mc_color_entry *priv = container_of(intensity_attr,
> +						    struct led_mc_color_entry,
> +						      intensity_attr);
> +
> +	return sprintf(buf, "%d\n", priv->intensity);
> +}
> +
> +static ssize_t max_intensity_show(struct device *dev,
> +				   struct device_attribute *max_intensity_attr,
> +				   char *buf)
> +{
> +	struct led_mc_color_entry *priv = container_of(max_intensity_attr,
> +						    struct led_mc_color_entry,
> +						      max_intensity_attr);
> +
> +	return sprintf(buf, "%d\n", priv->max_intensity);
> +}
> +
> +static struct attribute *led_color_attrs[] = {
> +	NULL,
> +};
> +
> +static struct attribute_group led_color_group = {
> +	.name = "colors",
> +	.attrs = led_color_attrs,
> +};
> +
> +static int led_multicolor_init_color(struct led_classdev_mc_data *data,
> +				     struct led_classdev_mc *mcled_cdev,
> +				     int color_id, int color_index)
> +{
> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> +	struct led_mc_color_entry *mc_priv;
> +	char *intensity_file_name;
> +	char *max_intensity_file_name;
> +	size_t len;
> +	int ret;
> +
> +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
> +	if (!mc_priv)
> +		return -ENOMEM;
> +
> +	mc_priv->led_color_id = color_id;
> +	mc_priv->mcled_cdev = mcled_cdev;
> +
> +	sysfs_attr_init(&mc_priv->intensity_attr.attr);
> +	len = strlen(led_colors[color_id]) + strlen(INTENSITY_NAME) + 1;
> +	intensity_file_name = kzalloc(len, GFP_KERNEL);
> +	if (!intensity_file_name) {
> +		ret = -ENOMEM;
> +		goto err_out;

Just return -ENOMEM. No need for err_out label.

> +	}
> +
> +	snprintf(intensity_file_name, len, "%s%s",
> +		 led_colors[color_id], INTENSITY_NAME);
> +	mc_priv->intensity_attr.attr.name = intensity_file_name;
> +	mc_priv->intensity_attr.attr.mode = 644;
> +	mc_priv->intensity_attr.store = intensity_store;
> +	mc_priv->intensity_attr.show = intensity_show;
> +	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
> +				      &mc_priv->intensity_attr.attr,
> +				      led_color_group.name);
> +	if (ret)
> +		goto intensity_err_out;
> +
> +	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
> +	len = strlen(led_colors[color_id]) + strlen(MAX_INTENSITY_NAME) + 1;
> +	max_intensity_file_name = kzalloc(len, GFP_KERNEL);
> +	if (!max_intensity_file_name) {
> +		ret = -ENOMEM;
> +		goto intensity_err_out;
> +	}
> +
> +	snprintf(max_intensity_file_name, len, "%s%s",
> +		 led_colors[color_id], MAX_INTENSITY_NAME);
> +	mc_priv->max_intensity_attr.attr.name = max_intensity_file_name;
> +	mc_priv->max_intensity_attr.attr.mode = 444;
> +	mc_priv->max_intensity_attr.show = max_intensity_show;
> +	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
> +				      &mc_priv->max_intensity_attr.attr,
> +				      led_color_group.name);
> +	if (ret)
> +		goto max_intensity_err_out;
> +
> +	mc_priv->max_intensity = LED_FULL;
> +	list_add_tail(&mc_priv->list, &data->color_list);
> +
> +max_intensity_err_out:
> +	kfree(max_intensity_file_name);
> +intensity_err_out:
> +	kfree(intensity_file_name);
> +err_out:
> +	return ret;
> +}
> +
> +static int led_multicolor_init_color_dir(struct led_classdev_mc_data *data,
> +					 struct led_classdev_mc *mcled_cdev)
> +{
> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> +	u32 color_id;
> +	int ret;
> +	int i, j = 0;
> +
> +	data->mcled_cdev = mcled_cdev;
> +
> +	ret = sysfs_create_group(&led_cdev->dev->kobj, &led_color_group);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < LED_COLOR_ID_MAX; i++) {
> +		color_id = (mcled_cdev->available_colors & (1 << i));

This is nitpicking but for me it would look cleaner if we had
color_mask variable:

color_id = (mcled_cdev->available_colors & color_mask);

> +		if (color_id) {
> +			ret = led_multicolor_init_color(data, mcled_cdev, i, j);
> +			if (ret)
> +				break;
> +
> +			j++;
> +		}

And do the shifting here:

		color_mask <<= 1;

> +	}
> +
> +	return ret;
> +}
> +
> +int led_classdev_multicolor_register_ext(struct device *parent,
> +				     struct led_classdev_mc *mcled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	struct led_classdev *led_cdev;
> +	struct led_classdev_mc_data *data;
> +	int ret;
> +
> +	if (!mcled_cdev)
> +		return -EINVAL;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mcled_cdev->data = data;
> +	led_cdev = mcled_cdev->led_cdev;
> +	INIT_LIST_HEAD(&data->color_list);
> +
> +	/* Register led class device */
> +	ret = led_classdev_register_ext(parent, led_cdev, init_data);
> +	if (ret)
> +		return ret;
> +
> +	return led_multicolor_init_color_dir(data, mcled_cdev);
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
> +
> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev)
> +{
> +	if (!mcled_cdev)
> +		return;
> +
> +	sysfs_remove_group(&mcled_cdev->led_cdev->dev->kobj, &led_color_group);
> +	led_classdev_unregister(mcled_cdev->led_cdev);
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
> +
> +static void devm_led_classdev_multicolor_release(struct device *dev, void *res)
> +{
> +	led_classdev_multicolor_unregister(*(struct led_classdev_mc **)res);
> +}
> +
> +/**
> + * devm_of_led_classdev_register - resource managed led_classdev_register()
> + *
> + * @parent: parent of LED device
> + * @led_cdev: the led_classdev structure for this device.
> + */

Let's move documentation to the header. We should to the same with
the existing led-class.c API one day.

> +int devm_led_classdev_multicolor_register(struct device *parent,
> +					  struct led_classdev_mc *mcled_cdev)

We don't need non-ext version for a new API.

> +{
> +	struct led_classdev_mc **dr;
> +	int ret;
> +
> +	dr = devres_alloc(devm_led_classdev_multicolor_release,
> +			  sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return -ENOMEM;
> +
> +	ret = led_classdev_multicolor_register(parent, mcled_cdev);
> +	if (ret) {
> +		devres_free(dr);
> +		return ret;
> +	}
> +
> +	*dr = mcled_cdev;
> +	devres_add(parent, dr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register);
> +
> +static int devm_led_classdev_multicolor_match(struct device *dev,
> +					      void *res, void *data)
> +{
> +	struct mcled_cdev **p = res;
> +
> +	if (WARN_ON(!p || !*p))
> +		return 0;
> +
> +	return *p == data;
> +}
> +
> +/**
> + * devm_led_classdev_multicolor_unregister() - resource managed
> + *					led_classdev_multicolor_unregister()
> + * @parent: The device to unregister.
> + * @mcled_cdev: the led_classdev_mc structure for this device.
> + */
> +void devm_led_classdev_multicolor_unregister(struct device *dev,
> +				  struct led_classdev_mc *mcled_cdev)
> +{
> +	WARN_ON(devres_release(dev,
> +			       devm_led_classdev_multicolor_release,
> +			       devm_led_classdev_multicolor_match, mcled_cdev));
> +}
> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_unregister);
> +
> +MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
> +MODULE_DESCRIPTION("Multi Color LED class interface");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> new file mode 100644
> index 000000000000..afcaf429fba5
> --- /dev/null
> +++ b/include/linux/led-class-multicolor.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* LED Multicolor class interface
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +
> +#include <linux/leds.h>
> +#include <dt-bindings/leds/common.h>
> +
> +struct led_classdev_mc;
> +
> +struct led_classdev_mc_data {
> +	struct led_classdev_mc *mcled_cdev;
> +	struct list_head color_list;
> +};
> +
> +struct led_classdev_mc {
> +	/* led class device */
> +	struct led_classdev *led_cdev;
> +
> +	/* Set brightness for a specific color id */
> +	int (*set_color_brightness)(struct led_classdev_mc *mcled_cdev,
> +				    int color_id, int value);
> +
> +	struct led_classdev_mc_data *data;
> +
> +	unsigned long available_colors;
> +	int num_leds;
> +};
> +
> +static inline struct led_classdev_mc *lcdev_to_mccdev(
> +						struct led_classdev *lcdev)
> +{
> +	return container_of(lcdev, struct led_classdev_mc, led_cdev);
> +}
> +
> +/**
> + * led_classdev_multicolor_register_ext - register a new object of led_classdev
> + *				      class with support for multicolor LEDs
> + * @parent: the multicolor LED to register
> + * @mcled_cdev: the led_classdev_mc structure for this device
> + * @init_data: the LED class Multi color device initialization data
> + *
> + * Returns: 0 on success or negative error value on failure
> + */
> +extern int led_classdev_multicolor_register_ext(struct device *parent,

extern is implied by default for functions. We need also to do this
cleanup in leds.h soem day.

> +					    struct led_classdev_mc *mcled_cdev,
> +					    struct led_init_data *init_data);
> +
> +#define led_classdev_multicolor_register(parent, mcled_cdev)		\
> +	led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL)
> +
> +/**
> + * led_classdev_multicolor_unregister - unregisters an object of led_classdev
> + *					class with support for multicolor LEDs
> + * @mcled_cdev: the multicolor LED to unregister
> + *
> + * Unregister a previously registered via led_classdev_multicolor_register
> + * object
> + */
> +extern void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
> +
> +extern int devm_led_classdev_multicolor_register(struct device *parent,
> +					struct led_classdev_mc *mcled_cdev);
> +
> +extern void devm_led_classdev_multicolor_unregister(struct device *parent,
> +					   struct led_classdev_mc *mcled_cdev);
> +
> +/* Set brightness for the monochrome LED cluster */
> +extern void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
> +			    enum led_brightness brightness,
> +			    int brightness_val[]);
> +
> +#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
> 

-- 
Best regards,
Jacek Anaszewski
