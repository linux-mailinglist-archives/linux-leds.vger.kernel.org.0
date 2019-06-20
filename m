Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01EA74D2DF
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2019 18:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732026AbfFTQKc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Jun 2019 12:10:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40015 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfFTQKc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Jun 2019 12:10:32 -0400
Received: by mail-wr1-f68.google.com with SMTP id p11so3618461wre.7;
        Thu, 20 Jun 2019 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AjCnUL9Zjp9gdH93FC8LzoSZ0awpiTRcGWhly5iQH/I=;
        b=syXDljo0sX8Ysi11sllg7jpfguuGD0oPx7QUVsS42NkoZ6Wf2pQKKVmL4Jj/aJo9cs
         qOos2iLn8nYEkSOWdNx42otd73T4yyrklE+drM6KW5tU/Rh60R3i1uzOKUJ9XeJ4QVxG
         VrB9ao5uW7E3howr5gT/YJ/jOgOVuBppPR08Y1Iq4G43IJvhSAnx1yaAdWER1AiRzGIV
         pXgQgkHdOcVO0Gg1Hwy7b8laKJc3f/jyRwicafH3/I7Hnb/pk5ENqLNQl4dZC82NihXL
         V70pA9iEchzKrtQPvu5d/ewV2oNo+cucs8gTf/OoDFwDTOJV0BXAMdCxP27jPTRwqGme
         EGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AjCnUL9Zjp9gdH93FC8LzoSZ0awpiTRcGWhly5iQH/I=;
        b=cSwuOc4ohTjYF7w5aJSai5GhCbhd+OPR0QMVXF1AMQi9DWW27nW5RppzqHW45GVmQT
         2quir2080z3NSq2eYOlzAkEaw8CDOHuXyXJ5ikdpeiVpfAkz1DCCR0L0OfLEhH7gM4Hg
         z2Rxo73pFRMzr32dbyyGAaBwnvZ4T0YF949c301h3V0jv/Qxz0jLiTdZzo5VK49g9rHw
         dqECgxgvoOB45tOzs/GMgRWDuEGIAv8RuzjTpu0IUWCy66TXyCLGtSf70WdDMvdZPv4T
         +lKLVQAv64leNlLHH/Yq6QFEjPmoSvWwy6ceTeZxyRTIGDUX1F45+noPKfwmZ3CMQpbp
         baKA==
X-Gm-Message-State: APjAAAUiaEOSY3Gm513Gf2khx7FpXTgEQHo4cLW5HHow/dfiUKyWPzdM
        UWtWXyUreTHLnbo4jyJFJizDZ+Sg
X-Google-Smtp-Source: APXvYqw8upGkxDISzVoLmeX8o027CyJfx+6WKYEKEETs0PjTpUaK2NlpuVILTV5tFr3F5M4NQ+PN3g==
X-Received: by 2002:a05:6000:11cc:: with SMTP id i12mr35028058wrx.243.1561047029455;
        Thu, 20 Jun 2019 09:10:29 -0700 (PDT)
Received: from [192.168.1.17] (bgr65.neoplus.adsl.tpnet.pl. [83.28.81.65])
        by smtp.gmail.com with ESMTPSA id c6sm7521527wma.25.2019.06.20.09.10.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 09:10:28 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-7-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <2f91bd2b-1d69-c9c7-c20b-a7396c9e1ecd@gmail.com>
Date:   Thu, 20 Jun 2019 18:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190523190820.29375-7-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the v5.

I will confine myself to commenting only some parts since
the rest will undergo rework due to removal of sync API.

On 5/23/19 9:08 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The framework allows for dynamically setting individual LEDs
> or setting brightness levels of LEDs and updating them virtually
> simultaneously.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/Kconfig                 |  10 +
>   drivers/leds/Makefile                |   1 +
>   drivers/leds/led-class-multicolor.c  | 421 +++++++++++++++++++++++++++
>   include/linux/led-class-multicolor.h |  95 ++++++
>   4 files changed, 527 insertions(+)
>   create mode 100644 drivers/leds/led-class-multicolor.c
>   create mode 100644 include/linux/led-class-multicolor.h
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 0414adebb177..0696a13c9527 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -29,6 +29,16 @@ config LEDS_CLASS_FLASH
>   	  for the flash related features of a LED device. It can be built
>   	  as a module.
>   
> +config LEDS_CLASS_MULTI_COLOR
> +	tristate "LED Mulit Color LED Class Support"
> +	depends on LEDS_CLASS
> +	help
> +	  This option enables the multicolor LED sysfs class in /sys/class/leds.
> +	  It wraps LED Class and adds multicolor LED specific sysfs attributes
> +	  and kernel internal API to it. You'll need this to provide support
> +	  for multicolor LEDs that are grouped together. This class is not
> +	  intended for single color LEDs.  It can be built as a module.

extra whitespace:

s/ It can/It can/

[...]
> +
> +static int multicolor_set_brightness(struct led_classdev *led_cdev,
> +			     enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> +	struct led_classdev_mc_data *data = mcled_cdev->data;
> +	struct led_multicolor_ops *ops = mcled_cdev->ops;
> +	struct led_classdev_mc_priv *priv;
> +	unsigned long state = brightness;
> +	int adj_value;
> +	ssize_t ret = -EINVAL;
> +
> +	mutex_lock(&led_cdev->led_access);
> +
> +	if (ops->set_module_brightness) {
> +		ret = ops->set_module_brightness(mcled_cdev, state);
> +		goto unlock;
> +	}
> +
> +	list_for_each_entry(priv, &data->color_list, list) {
> +		if (state && priv->brightness && priv->max_brightness) {
> +			adj_value = state * ((priv->brightness * 100) / priv->max_brightness);
> +			adj_value = adj_value / 100;

Why the multiplication an then division by 100? And priv->max_brightness
stays unaltered? This changes the proportions. My python script works
just fine without those.

> +		} else
> +			adj_value = LED_OFF;
> +
> +		ret = ops->set_color_brightness(priv->mcled_cdev,
> +						priv->color_id,	adj_value);
> +		if (ret < 0)
> +			goto unlock;
> +	}
> +
> +unlock:
> +	mutex_unlock(&led_cdev->led_access);
> +	return ret;
> +}
[...]
> +int led_classdev_multicolor_register_ext(struct device *parent,
> +				     struct led_classdev_mc *mcled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	struct led_classdev *led_cdev;
> +	struct led_multicolor_ops *ops;
> +	struct led_classdev_mc_data *data;
> +	int ret;
> +	int i;
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
> +	led_cdev = &mcled_cdev->led_cdev;
> +
> +	if (led_cdev->brightness_set_blocking)
> +		led_cdev->brightness_set_blocking = multicolor_set_brightness;

This is weird. In leds-lp50xx.c you don't initialize
brightness_set_blocking and this still works?

I believe this is kind of omission.

And it is not reasonable to just override driver supplied op with
generic one just like that.

I propose to initialize brightness_set or brightness_set_blocking
op as we used to do it for monochrome LEDs. Those function(s) on
driver side will either use device's hardware support for setting
color lightness, or will call a generic function provided by
LED multi color class for calculating intensities of all colors
it comprises in the cluster.

I know this is different to what we've discussed on IRC, but now
it looks for me the most reasonable way to go.

> +	INIT_LIST_HEAD(&data->color_list);
> +
> +	/* Register led class device */
> +	ret = led_classdev_register_ext(parent, led_cdev, init_data);
> +	if (ret)
> +		return ret;
> +
> +	ret = led_multicolor_init_color_dir(data, mcled_cdev);
> +	if (ret)
> +		return ret;
> +
> +	/* Select the sysfs attributes to be created for the device */
> +	for (i = 0; i < mcled_cdev->num_leds; i++) {
> +		ret = led_multicolor_init_color(data, mcled_cdev,
> +						mcled_cdev->available_colors[i]);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
> +
> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev)
> +{
> +	if (!mcled_cdev)
> +		return;
> +
> +	led_classdev_unregister(&mcled_cdev->led_cdev);
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
> index 000000000000..f9e71d984b03
> --- /dev/null
> +++ b/include/linux/led-class-multicolor.h
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* LED Multicolor class interface
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + */

Let's have C++ comment style also here.

> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +
> +#include <linux/leds.h>
> +#include <dt-bindings/leds/common.h>
[...]


-- 
Best regards,
Jacek Anaszewski
