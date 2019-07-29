Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C2D79A4B
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 22:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387941AbfG2UuI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 16:50:08 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38156 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387867AbfG2UuI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 16:50:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id s15so33310809wmj.3;
        Mon, 29 Jul 2019 13:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lQgdXAChyH2pWOsj0DqD0vtrlsuuNvMmbPs/RShI1EY=;
        b=jWpODdtFtXgpzSFSK3UmA/nozalmy7zfOwKR1GUQV3VK+OBwBh2xq0t/oFTvK6EZlE
         8ntPCOY9zxBD08HGuGiwvX7bOchd2BJUmRvJqMW5qzkvELWi1OlDpHRejLFuUWFxdIYF
         T37oUlHdpV3vW3EgvPIwnCqoIHlP6h4AmjUnmQ1VvC8s7hTiozeeF787fKEetQHCVRNO
         8XWIfIAANytn57aGtJYE31DnZyOl/ZF0O/SaUGXmFqq6ySBKzsfwMHWd+wrbd5kSHvAZ
         jzIA4oTI+P/6LIi3n3QEWZln4gy4VmWTJRbUZlpduGcSDOZNxVLoLFvOkY2t783cvxsa
         CJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lQgdXAChyH2pWOsj0DqD0vtrlsuuNvMmbPs/RShI1EY=;
        b=Fo2vhaYmVirQKh4bJLraA0F/W+JghUl9CEsx4OSlM3F0eUPq1NGKLgq4oBsjwGy9Dr
         I5m32bWEGgPE168Eg6XEuR87+ojagE3YSkBQ5COQ6QCmeuf93Llnre24jhHjzILHyFnH
         4rNK4Im9rqmc8AKkcxAuzxvShyAK5Ccl9ZcXVhmZYeCUK0esqr1jEyUYiwptH2h3MlR8
         /Ki5K/IG6LuAd6hvZkuHDXo82Auul9jTsWk2Tip17mgliDNyUuEmPX+yHnNqhxkbJrot
         n6+tW335F0bBtt/XqkZ1VNa+6WntriaMwvA92JfTBiV1G53HXUTJF/DO+YplwO/OYalG
         IM9A==
X-Gm-Message-State: APjAAAXrm7AZSgXBQlAq3WzAYKDOe8JjZgIARXiW5Z+lICAueCwhE5a8
        rl4fhc86AIWKsheGtB2X16fDmZPh
X-Google-Smtp-Source: APXvYqyeEM4bCWYSzlz4kGIOrR2HI3RLE2p1oZYtL5YzL7hrkB31inLZc4qpRVOgIIojHQ/pPeU8rw==
X-Received: by 2002:a1c:f914:: with SMTP id x20mr23134906wmh.142.1564433403129;
        Mon, 29 Jul 2019 13:50:03 -0700 (PDT)
Received: from [192.168.1.19] (civ151.neoplus.adsl.tpnet.pl. [83.31.45.151])
        by smtp.gmail.com with ESMTPSA id b8sm80478897wmh.46.2019.07.29.13.50.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:50:02 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-7-dmurphy@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fa74cc04-61fc-161f-2ce1-6de5921fce2f@gmail.com>
Date:   Mon, 29 Jul 2019 22:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725182818.29556-7-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 7/25/19 8:28 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The framework allows for dynamically setting individual LEDs
> or setting brightness levels of LEDs and updating them virtually
> simultaneously.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig                 |  10 +
>  drivers/leds/Makefile                |   1 +
>  drivers/leds/led-class-multicolor.c  | 402 +++++++++++++++++++++++++++
>  include/linux/led-class-multicolor.h |  96 +++++++
>  4 files changed, 509 insertions(+)
>  create mode 100644 drivers/leds/led-class-multicolor.c
>  create mode 100644 include/linux/led-class-multicolor.h
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f7a3dd7ecf3d..7f780d5b8490 100644
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
> +	  It wraps LED Class and adds multicolor LED specific sysfs attributes

s/Class/class/

I'll need to fix it in LED flash class entry too.

> +	  and kernel internal API to it. You'll need this to provide support
> +	  for multicolor LEDs that are grouped together. This class is not
> +	  intended for single color LEDs. It can be built as a module.
> +
>  config LEDS_BRIGHTNESS_HW_CHANGED
>  	bool "LED Class brightness_hw_changed attribute support"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 41fb073a39c1..897b810257dd 100644
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
> index 000000000000..123443e6d3eb
> --- /dev/null
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -0,0 +1,402 @@
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
> +struct led_classdev_mc_priv {
> +	struct led_classdev_mc *mcled_cdev;
> +
> +	struct device_attribute max_intensity_attr;
> +	struct device_attribute intensity_attr;
> +	struct device_attribute color_index_attr;
> +
> +	enum led_brightness max_intensity;
> +	enum led_brightness intensity;
> +	enum led_brightness new_intensity;
> +
> +	struct list_head list;
> +
> +	int color_id;
> +	int color_index;

We need to differentiate both more meaningfully.
Maybe led_color_id and cluster_color_id?

> +};
> +static int calculate_brightness(int brightness, int intensity, int max_intensity)

How about led_mc_calculate_brightness ?

> +{
> +	if (brightness && intensity && max_intensity)
> +		return brightness * intensity / max_intensity;
> +
> +	return LED_OFF;
> +}
> +
> +void set_cluster_brightness(struct led_classdev_mc *mcled_cdev,
> +			    enum led_brightness brightness, int adj_value[])

s/set_cluster/led_mc_set_cluster/

And I think adj_value is not telling too much. How about:

s/adj_value/color_intensity/

> +{
> +	struct led_classdev_mc_data *data = mcled_cdev->data;
> +	struct led_classdev_mc_priv *priv;
> +	int i = 0;
> +
> +	list_for_each_entry(priv, &data->color_list, list) {
> +		adj_value[i] = calculate_brightness(brightness, priv->intensity,
> +						    priv->max_intensity);
> +		i++;
> +	}
> +
> +	data->cluster_brightness = brightness;

This property duplicates brightness stored in struct led_classdev and
thus it is redundant.

> +}
> +
> +void get_cluster_brightness(struct led_classdev_mc *mcled_cdev,
> +				  int brightness_val[])

s/get_cluster/led_mc_get_cluster/

s/brightness_val/color_intensity/

> +{
> +	struct led_classdev_mc_data *data = mcled_cdev->data;
> +	struct led_classdev_mc_priv *priv;
> +	int i = 0;
> +
> +	list_for_each_entry(priv, &data->color_list, list) {
> +		brightness_val[i] = priv->intensity;
> +		i++;
> +	}
> +}
> +
> +static ssize_t color_index_show(struct device *dev,
> +				   struct device_attribute *color_index_attr,
> +				   char *buf)
> +{
> +	struct led_classdev_mc_priv *priv = container_of(color_index_attr,
> +						    struct led_classdev_mc_priv,
> +						      color_index_attr);
> +
> +	return sprintf(buf, "%d\n", priv->color_id);
> +}
> +
> +static ssize_t color_mix_store(struct device *dev,
> +				struct device_attribute *color_mix_attr,
> +				const char *buf, size_t size)
> +{
> +	struct led_classdev_mc_data *data = container_of(color_mix_attr,
> +						    struct led_classdev_mc_data,
> +						      color_mix_attr);
> +	struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
> +	const struct led_multicolor_ops *ops = mcled_cdev->ops;
> +	struct led_classdev_mc_priv *priv;
> +	unsigned int value[LED_COLOR_ID_MAX];
> +	int adj_brightness;
> +	int nrchars, offset = 0;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < mcled_cdev->num_leds; i++) {
> +		ret = sscanf(buf + offset, "%i%n", &value[i], &nrchars);
> +		if (ret != 1)
> +			break;
> +
> +		offset += nrchars;
> +	}
> +
> +	if (i != mcled_cdev->num_leds) {

Shouldn't we return error if i != mcled_cdev->num_leds - 1 ?
How can we know which color the value will be for if there is less
values passed than the total number of colors in the cluster?

> +		for (; i < LED_COLOR_ID_MAX; i++)
> +			value[i] = 0;

What use case is it for?

> +	}
> +
> +	list_for_each_entry(priv, &data->color_list, list) {
> +		if (data->cluster_brightness) {
> +			adj_brightness = calculate_brightness(data->cluster_brightness,
> +							      value[priv->color_index],
> +							     priv->max_intensity);
> +			ret = ops->set_color_brightness(priv->mcled_cdev,
> +							priv->color_id,
> +							adj_brightness);
> +			if (ret < 0)
> +				goto done;
> +		}
> +
> +		priv->intensity = value[priv->color_index];
> +	}

Here we could use just brightness_set op as a single call. We should
always write all colors as a result of write to color_mix anyway.

> +
> +done:
> +	return size;
> +}
> +
> +static ssize_t intensity_store(struct device *dev,
> +				struct device_attribute *intensity_attr,
> +				const char *buf, size_t size)
> +{
> +	struct led_classdev_mc_priv *priv = container_of(intensity_attr,
> +						    struct led_classdev_mc_priv,
> +						      intensity_attr);
> +	struct led_classdev_mc_data *data = priv->mcled_cdev->data;
> +	struct led_classdev *led_cdev = priv->mcled_cdev->led_cdev;
> +	struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
> +	unsigned int adj_value;
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

We don't fail in this case in LED class, so let's proceed in the same
way here:

priv->intensity = min(value, priv->max_brightness);

> +
> +	priv->new_intensity = value;
> +
> +	if (data->cluster_brightness) {
> +		adj_value = calculate_brightness(data->cluster_brightness,
> +					priv->new_intensity,
> +					priv->max_intensity);
> +		ret = ops->set_color_brightness(priv->mcled_cdev,
> +						priv->color_id, adj_value);
> +		if (ret < 0) {
> +			priv->new_intensity = priv->intensity;

This is unnecessary complication. Just write the calculated iout
intensity.

We need to highlight it in the documentation that exact requested color
intensity values are written to the hardware only when
brightness == max_brightness.

> +			goto unlock;
> +		}
> +	}
> +
> +	priv->intensity = priv->new_intensity;
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
> +	struct led_classdev_mc_priv *priv = container_of(intensity_attr,
> +						    struct led_classdev_mc_priv,
> +						      intensity_attr);
> +	const struct led_multicolor_ops *ops = priv->mcled_cdev->ops;
> +	int value = 0;
> +
> +	if (ops->get_color_brightness) {
> +		value = ops->get_color_brightness(priv->mcled_cdev,
> +						  priv->color_id);
> +		priv->intensity = value;
> +	} else {
> +		value = priv->intensity;
> +	}
> +
> +	return sprintf(buf, "%d\n", value);
> +}
> +
> +static ssize_t max_intensity_show(struct device *dev,
> +				   struct device_attribute *max_intensity_attr,
> +				   char *buf)
> +{
> +	struct led_classdev_mc_priv *priv = container_of(max_intensity_attr,
> +						    struct led_classdev_mc_priv,
> +						      max_intensity_attr);
> +
> +	return sprintf(buf, "%d\n", priv->max_intensity);
> +}
> +
> +static int led_multicolor_init_color(struct led_classdev_mc_data *data,
> +				     struct led_classdev_mc *mcled_cdev,
> +				     int color_id, int color_index)
> +{
> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> +	struct led_classdev_mc_priv *mc_priv;
> +	int ret;
> +
> +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
> +	if (!mc_priv)
> +		return -ENOMEM;
> +
> +	mc_priv->color_id = color_id;
> +	mc_priv->mcled_cdev = mcled_cdev;
> +
> +	data->led_kobj = kobject_create_and_add(led_colors[color_id],
> +						data->color_kobj);

You should not use kobject API in the drivers. See [0].

> +	if (!data->led_kobj)
> +		return -EINVAL;
> +
> +	sysfs_attr_init(&mc_priv->intensity_attr.attr);
> +	mc_priv->intensity_attr.attr.name = "intensity";
> +	mc_priv->intensity_attr.attr.mode = S_IRUGO | S_IWUGO;
> +	mc_priv->intensity_attr.store = intensity_store;
> +	mc_priv->intensity_attr.show = intensity_show;
> +	ret = sysfs_create_file(data->led_kobj,
> +				&mc_priv->intensity_attr.attr);
> +	if (ret)
> +		goto err_out;
> +
> +	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
> +	mc_priv->max_intensity_attr.attr.name = "max_intensity";
> +	mc_priv->max_intensity_attr.attr.mode = S_IRUGO;
> +	mc_priv->max_intensity_attr.show = max_intensity_show;
> +	ret = sysfs_create_file(data->led_kobj,
> +				&mc_priv->max_intensity_attr.attr);
> +	if (ret)
> +		goto err_out;
> +
> +	sysfs_attr_init(&mc_priv->color_index_attr.attr);
> +	mc_priv->color_index_attr.attr.name = "color_id";
> +	mc_priv->color_index_attr.attr.mode = S_IRUGO;
> +	mc_priv->color_index_attr.show = color_index_show;
> +	ret = sysfs_create_file(data->led_kobj,
> +				&mc_priv->color_index_attr.attr);
> +	if (ret)
> +		goto err_out;
> +
> +	mc_priv->max_intensity = LED_FULL;
> +	mc_priv->color_index = color_index;
> +	list_add_tail(&mc_priv->list, &data->color_list);
> +
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
> +	data->color_kobj = kobject_create_and_add("colors",
> +						  &led_cdev->dev->kobj);
> +	if (!data->color_kobj)
> +		return -EINVAL;
> +
> +	data->mcled_cdev = mcled_cdev;
> +
> +	for (i = 0; i < LED_COLOR_ID_MAX; i++) {
> +		color_id = (mcled_cdev->available_colors & (1 << i));
> +		if (color_id) {
> +			ret = led_multicolor_init_color(data, mcled_cdev, i, j);
> +			if (ret)
> +				break;
> +
> +			j++;
> +		}
> +	}
> +
> +	sysfs_attr_init(&data->color_mix_attr.attr);
> +	data->color_mix_attr.attr.name = "color_mix";
> +	data->color_mix_attr.attr.mode = S_IRUGO | S_IWUGO;
> +	data->color_mix_attr.store = color_mix_store;
> +	ret = sysfs_create_file(data->color_kobj,
> +				&data->color_mix_attr.attr);
> +
> +	return ret;
> +}
> +
> +int led_classdev_multicolor_register_ext(struct device *parent,
> +				     struct led_classdev_mc *mcled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	struct led_classdev *led_cdev;
> +	struct led_multicolor_ops *ops;
> +	struct led_classdev_mc_data *data;
> +	int ret;
> +
> +	if (!mcled_cdev)
> +		return -EINVAL;
> +
> +	ops = mcled_cdev->ops;
> +	if (!ops || !ops->set_color_brightness)
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
> +int devm_led_classdev_multicolor_register(struct device *parent,
> +					  struct led_classdev_mc *mcled_cdev)
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
> index 000000000000..082883606246
> --- /dev/null
> +++ b/include/linux/led-class-multicolor.h
> @@ -0,0 +1,96 @@
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
> +
> +	struct kobject *color_kobj;
> +	struct kobject *led_kobj;
> +
> +	struct device_attribute color_mix_attr;
> +
> +	struct list_head color_list;
> +
> +	enum led_brightness cluster_brightness;
> +};
> +
> +struct led_multicolor_ops {
> +	/* Set brightness for a specific color id */
> +	int (*set_color_brightness)(struct led_classdev_mc *mcled_cdev,
> +				    int color_id, int value);
> +	/* Read current color setting */
> +	int (*get_color_brightness)(struct led_classdev_mc *mcled_cdev,
> +				    int color_id);
> +};
> +
> +struct led_classdev_mc {
> +	/* led class device */
> +	struct led_classdev *led_cdev;
> +
> +	/* multicolor led specific ops */
> +	struct led_multicolor_ops *ops;
> +
> +	struct led_classdev_mc_data *data;
> +
> +	u32 available_colors;
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
> +extern void set_cluster_brightness(struct led_classdev_mc *mcled_cdev,
> +			    enum led_brightness brightness,
> +			    int adj_value[]);
> +
> +/* Read current cluster brightness */
> +extern void get_cluster_brightness(struct led_classdev_mc *mcled_cdev,
> +				   int brightness_val[]);
> +
> +#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
> 

I'll review remaining patches (drivers) next time.

[0] https://lore.kernel.org/linux-leds/20160825124948.GA15567@kroah.com/

-- 
Best regards,
Jacek Anaszewski


