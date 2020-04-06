Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 194C819FE0A
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 21:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgDFTZv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 15:25:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39446 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgDFTZu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 15:25:50 -0400
Received: by mail-wm1-f67.google.com with SMTP id y20so676720wma.4;
        Mon, 06 Apr 2020 12:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EgFroog5QZKiwdmXjVTvkCKq9j7DXw4Izb0SFD0AhQ0=;
        b=iyNEVbfX9JKxPabUnVDjC1pSHO7T5M1mMlp4hjvVvUqRqLXVeHOgD8Cth3zMt2rvqA
         4N4zs2mXgaOG/waJFyjH0RJ4AWWnWohu5ohkmtYawMELSQYxHVnG0NsPIu8YhcAgvsnf
         HqtNOAKKUFq1ANy+3hgaxVGaz5NkWcikcB5yHMfKajYV/S/AFCpdfOc7vJdO/ONz+5Q/
         jlXxOnbDDt01IjSRwj1I0EBtrTdQHXZChVB9yw5t4uHXnEEegwiOMjIfmfa9A7TMj5Eo
         3SiEYkV3S99OxWrVv8Y1ZWuQdBPs4npr/ySuMs5txWzXQlCbacKxBeCjAj1Coxy1MPUZ
         Iyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EgFroog5QZKiwdmXjVTvkCKq9j7DXw4Izb0SFD0AhQ0=;
        b=PXGUFhevHV8UKrSMjY91WpcmeLOfl0Rw7XIgBLJY1zh0bLAB7doMiHJ5o184D53XFz
         K67uV+u3lZHblKzq+5efkomdtvatJMVVOeCxNKTQURrXSMJQsfvs3BtH1GhiN9JVbSy8
         giUFYYCSrJIlkujP8rFlYrnxClX3iJQepuWxFj7teF+BoC9kiqCHSlLBBZxIqinwp50A
         av5vcEuZp7HKeqFjuQVsvvt/0VwpdoupG4pGuXiLA2RPlvbz2iWeIHD5iTJrpMmF6NzN
         JDJthEr8Hb7nWpcvAfIbzUA6aTbM79466RufsSs45LjjvoFb4tytQ2MQgZTdMIWzFvM3
         d4hg==
X-Gm-Message-State: AGi0PubKk6I59TEDj0hNLga3zTBtlDVDwDUZlYUYw3MXo2ejVVcQOrkE
        QosVj8MeltJlPhiYzM2F4QhuGjNk
X-Google-Smtp-Source: APiQypKG/HDiw7vD8iwQRfO1xh7yHTNl2stOQkodRDYQo/26HW49zTiHvBt8E1KQfrQH7LsoQ1r5Ag==
X-Received: by 2002:a1c:307:: with SMTP id 7mr580226wmd.126.1586201146491;
        Mon, 06 Apr 2020 12:25:46 -0700 (PDT)
Received: from [192.168.1.23] (acgb244.neoplus.adsl.tpnet.pl. [83.9.229.244])
        by smtp.gmail.com with ESMTPSA id y2sm682163wmy.23.2020.04.06.12.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 12:25:45 -0700 (PDT)
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0beb0000-a8a3-4063-d165-fd804021342e@gmail.com>
Date:   Mon, 6 Apr 2020 21:25:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402204311.14998-5-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thanks for the update. I have a few comments below.

On 4/2/20 10:42 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via <color>_intensity files and the latter is controlled
> via brightness file.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../ABI/testing/sysfs-class-led-multicolor    |  42 ++++
>  Documentation/leds/index.rst                  |   1 +
>  Documentation/leds/leds-class-multicolor.rst  |  95 ++++++++
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/led-class-multicolor.c           | 206 ++++++++++++++++++
>  include/linux/led-class-multicolor.h          | 121 ++++++++++
>  7 files changed, 476 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>  create mode 100644 Documentation/leds/leds-class-multicolor.rst
>  create mode 100644 drivers/leds/led-class-multicolor.c
>  create mode 100644 include/linux/led-class-multicolor.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..1f50324d24fd
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,42 @@
> +What:		/sys/class/leds/<led>/brightness
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Writing to this file will update all LEDs within the group to a
> +		calculated percentage of what each color LED intensity is set
> +		to. The percentage is calculated for each grouped LED via the
> +		equation below:
> +
> +		led_brightness = brightness * color_intensity/max_brightness
> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +		The value of the color is from 0 to
> +		/sys/class/leds/<led>/max_brightness.
> +
> +What:		/sys/class/leds/<led>/color_index
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read
> +		The color_index array, when read, will output the LED colors
> +		by name as they are indexed in the color_intensity array.
> +
> +What:		/sys/class/leds/<led>/num_colors
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read
> +		The num_colors indicates the number of LEDs defined in the
> +		color_intensity and color_index arrays.
> +
> +What:		/sys/class/leds/<led>/color_intensity
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Intensity level for the LED color within the array.
> +		The intensities for each color must be entered based on the
> +		color_index array.
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index 060f4e485897..bc70c6aa7138 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -9,6 +9,7 @@ LEDs
>  
>     leds-class
>     leds-class-flash
> +   leds-class-multicolor
>     ledtrig-oneshot
>     ledtrig-transient
>     ledtrig-usbport
> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
> new file mode 100644
> index 000000000000..5bb004999248
> --- /dev/null
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -0,0 +1,95 @@
> +====================================
> +Multi Color LED handling under Linux
> +====================================
> +
> +Description
> +===========
> +The multi color class groups monochrome LEDs and allows controlling two
> +aspects of the final combined color: hue and lightness. The former is
> +controlled via the color_intensity array file and the latter is controlled
> +via brightness file.
> +
> +For more details on hue and lightness notions please refer to
> +https://en.wikipedia.org/wiki/CIECAM02.
> +
> +Multicolor Class Control
> +========================
> +The multicolor class presents files that groups the colors as indexes in an
> +array.  These files are children under the LED parent node created by the
> +led_class framework.  The led_class framework is documented in led-class.rst
> +within this documentation directory.
> +
> +Each colored LED will be indexed under the color_* files. The order of the
> +colors are arbitrary the color_index file can be read to determine the color

Something wrong with punctuation here, or it is even a stylistic
problem.

> +to index value.
> +
> +The color_index file is an array that contains the string list of the colors as
> +they are defined in each color_* array file.
> +
> +The color_intensity is an array that can be read or written to for the
> +individual color intensities.  All elements within this array must be written in
> +order for the color LED intensities to be updated.
> +
> +The color_max_intensity is an array that can be read to indicate each color LED
> +maximum intensity value.
> +
> +The num_color_leds file returns the total number of color LEDs that are
> +presented in each color_* array.
> +
> +Directory Layout Example
> +========================
> +root:/sys/class/leds/multicolor:status# ls -lR
> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
> +-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 color_intensity
> +-r--r--r--    1 root     root          4096 Oct 19 16:16 num_color_leds
> +
> +Multicolor Class Brightness Control
> +===================================
> +The multiclor class framework will calculate each monochrome LEDs intensity.
> +
> +The brightness level for each LED is calculated based on the color LED
> +intensity setting divided by the parent max_brightness setting multiplied by
> +the requested brightness.
> +
> +led_brightness = brightness * color_intensity/max_brightness
> +
> +Example:
> +A user first writes the color_intensity file with the brightness levels
> +that for each LED that is necessary to achieve a blueish violet output from a
> +RGB LED group.
> +
> +cat /sys/class/leds/multicolor:status/color_index
> +green blue red
> +
> +echo 43 226 138 > /sys/class/leds/multicolor:status/color_intensity
> +
> +red -
> +	intensity = 138
> +	max_brightness = 255
> +green -
> +	intensity = 43
> +	max_brightness = 255
> +blue -
> +	intensity = 226
> +	max_brightness = 255
> +
> +The user can control the brightness of that RGB group by writing the parent

s/RGB/multicolor/

> +'brightness' control.  Assuming a parent max_brightness of 255 the user may want
> +to dim the LED color group to half.  The user would write a value of 128 to the
> +parent brightness file then the values written to each LED will be adjusted
> +base on this value
> +
> +cat /sys/class/leds/multicolor:status/max_brightness
> +255
> +echo 128 > /sys/class/leds/multicolor:status/brightness
> +
> +adjusted_red_value = 128 * 138/255 = 69
> +adjusted_green_value = 128 * 43/255 = 21
> +adjusted_blue_value = 128 * 226/255 = 113
> +
> +Reading the parent brightness file will return the current brightness value of
> +the color LED group.
> +
> +cat /sys/class/leds/multicolor:status/brightness
> +128
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d82f1dea3711..2e4611b25054 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>  	  for the flash related features of a LED device. It can be built
>  	  as a module.
>  
> +config LEDS_CLASS_MULTI_COLOR
> +	tristate "LED Multi Color LED Class Support"
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
> index d7e1107753fb..310b5518783a 100644
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
> index 000000000000..838b1d679647
> --- /dev/null
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// LED Multi Color class interface
> +// Copyright (C) 2019-20 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Dan Murphy <dmurphy@ti.com>
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
> +int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
> +				 enum led_brightness brightness)
> +{
> +	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
> +	int i;
> +
> +	for (i = 0; i < mcled_cdev->num_colors; i++)
> +		mcled_cdev->multicolor_info[i].color_brightness = (brightness *
> +					  mcled_cdev->multicolor_info[i].color_led_intensity /
> +					  led_cdev->max_brightness);

Why the need for brackets?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
> +
> +static ssize_t color_intensity_store(struct device *dev,
> +				struct device_attribute *intensity_attr,
> +				const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> +	int nrchars, offset = 0;
> +	int intensity_value[LED_COLOR_ID_MAX];
> +	int i;
> +	ssize_t ret;
> +
> +	mutex_lock(&led_cdev->led_access);
> +
> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> +		ret = sscanf(buf + offset, "%i%n",
> +			     &intensity_value[i], &nrchars);
> +		if (ret != 1) {
> +			dev_err(led_cdev->dev,
> +				"Incorrect number of LEDs expected %i values intensity was not applied\n",
> +				mcled_cdev->num_colors);
> +			goto err_out;
> +		}
> +		offset += nrchars;
> +	}
> +
> +	for (i = 0; i < mcled_cdev->num_colors; i++)
> +		mcled_cdev->multicolor_info[i].color_led_intensity =
> +					intensity_value[i];
> +
> +	led_set_brightness(led_cdev, led_cdev->brightness);
> +err_out:
> +	ret = size;
> +	mutex_unlock(&led_cdev->led_access);
> +	return ret;
> +}
> +
> +static ssize_t color_intensity_show(struct device *dev,
> +			      struct device_attribute *intensity_attr,
> +			      char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> +	int len = 0;
> +	int i;
> +
> +	for (i = 0; i < mcled_cdev->num_colors; i++)
> +		len += sprintf(buf + len, "%d ",
> +			    mcled_cdev->multicolor_info[i].color_led_intensity);
> +
> +	len += sprintf(buf + len, "%s", "\n");
> +
> +	return len;
> +}
> +static DEVICE_ATTR_RW(color_intensity);
> +
> +static ssize_t color_index_show(struct device *dev,
> +			      struct device_attribute *color_index_attr,
> +			      char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> +	int len = 0;
> +	int index;
> +	int i;
> +
> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> +		index = mcled_cdev->multicolor_info[i].color_index;
> +		len += sprintf(buf + len, "%s ", led_colors[index]);
> +	}
> +
> +	len += sprintf(buf + len, "%s", "\n");
> +
> +	return len;
> +}
> +static DEVICE_ATTR_RO(color_index);
> +
> +static ssize_t num_colors_show(struct device *dev,
> +				   struct device_attribute *max_intensity_attr,
> +				   char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> +
> +	return sprintf(buf, "%d\n", mcled_cdev->num_colors);
> +}
> +static DEVICE_ATTR_RO(num_colors);
> +
> +static struct attribute *led_multicolor_attrs[] = {
> +	&dev_attr_color_intensity.attr,
> +	&dev_attr_color_index.attr,
> +	&dev_attr_num_colors.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(led_multicolor);
> +
> +int led_classdev_multicolor_register_ext(struct device *parent,
> +				     struct led_classdev_mc *mcled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	struct led_classdev *led_cdev;
> +
> +	if (!mcled_cdev)
> +		return -EINVAL;
> +
> +	if (!mcled_cdev->num_colors)
> +		return -EINVAL;
> +
> +	led_cdev = &mcled_cdev->led_cdev;
> +	mcled_cdev->led_cdev.groups = led_multicolor_groups;
> +
> +	return led_classdev_register_ext(parent, led_cdev, init_data);
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
> +int devm_led_classdev_multicolor_register_ext(struct device *parent,
> +					     struct led_classdev_mc *mcled_cdev,
> +					     struct led_init_data *init_data)
> +{
> +	struct led_classdev_mc **dr;
> +	int ret;
> +
> +	dr = devres_alloc(devm_led_classdev_multicolor_release,
> +			  sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return -ENOMEM;
> +
> +	ret = led_classdev_multicolor_register_ext(parent, mcled_cdev,
> +						   init_data);
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
> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register_ext);
> +
> +static int devm_led_classdev_multicolor_match(struct device *dev,
> +					      void *res, void *data)
> +{
> +	struct led_classdev_mc **p = res;
> +
> +	if (WARN_ON(!p || !*p))
> +		return 0;
> +
> +	return *p == data;
> +}
> +
> +void devm_led_classdev_multicolor_unregister(struct device *dev,
> +					     struct led_classdev_mc *mcled_cdev)
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
> index 000000000000..a6a3715c0d48
> --- /dev/null
> +++ b/include/linux/led-class-multicolor.h
> @@ -0,0 +1,121 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* LED Multicolor class interface
> + * Copyright (C) 2019-20 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +
> +#include <linux/leds.h>
> +#include <dt-bindings/leds/common.h>
> +
> +struct led_multicolor_info {
> +	int color_index;
> +	int color_brightness;
> +	int color_led_intensity;
> +	int color_channel;
> +};
> +
> +struct led_classdev_mc {
> +	/* led class device */
> +	struct led_classdev led_cdev;
> +	int num_colors;
> +
> +	struct led_multicolor_info multicolor_info[LED_COLOR_ID_MAX];

I still have a problem with this fixed array that can grow for each
driver as new color identifiers are added to the LED core. Not
mentioning waste of memory due to unused colors. This is bad design.

> +};
> +
> +static inline struct led_classdev_mc *lcdev_to_mccdev(
> +						struct led_classdev *led_cdev)
> +{
> +	return container_of(led_cdev, struct led_classdev_mc, led_cdev);
> +}
> +
> +#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
> +/**
> + * led_classdev_multicolor_register_ext - register a new object of led_classdev
> + *				      class with support for multicolor LEDs
> + * @parent: the multicolor LED to register
> + * @mcled_cdev: the led_classdev_mc structure for this device
> + * @init_data: the LED class Multi color device initialization data
> + *
> + * Returns: 0 on success or negative error value on failure
> + */
> +int led_classdev_multicolor_register_ext(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev,
> +					    struct led_init_data *init_data);
> +
> +static inline int led_classdev_multicolor_register(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev)
> +{
> +	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
> +}
> +
> +/**
> + * led_classdev_multicolor_unregister - unregisters an object of led_classdev
> + *					class with support for multicolor LEDs
> + * @mcled_cdev: the multicolor LED to unregister
> + *
> + * Unregister a previously registered via led_classdev_multicolor_register
> + * object
> + */
> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
> +
> +/* Calculate brightness for the monochrome LED cluster */
> +int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
> +				 enum led_brightness brightness);
> +
> +int devm_led_classdev_multicolor_register_ext(struct device *parent,
> +					  struct led_classdev_mc *mcled_cdev,
> +					  struct led_init_data *init_data);
> +
> +static inline int devm_led_classdev_multicolor_register(struct device *parent,
> +				     struct led_classdev_mc *mcled_cdev)
> +{
> +	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
> +							 NULL);
> +}
> +
> +void devm_led_classdev_multicolor_unregister(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev);
> +#else
> +
> +static inline  int led_classdev_multicolor_register_ext(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev,
> +					    struct led_init_data *init_data)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int led_classdev_multicolor_register(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev)
> +{
> +	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
> +}
> +
> +static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev) {};
> +static inline int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
> +					       enum led_brightness brightness)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int devm_led_classdev_multicolor_register_ext(struct device *parent,
> +					  struct led_classdev_mc *mcled_cdev,
> +					  struct led_init_data *init_data)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int devm_led_classdev_multicolor_register(struct device *parent,
> +					     struct led_classdev_mc *mcled_cdev)
> +{
> +	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
> +							 NULL);
> +}
> +
> +static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev)
> +{};
> +
> +#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR) */
> +#endif	/* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
> 

-- 
Best regards,
Jacek Anaszewski
