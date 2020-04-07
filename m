Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F12371A0FC0
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2020 16:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgDGO6V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Apr 2020 10:58:21 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42964 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728855AbgDGO6V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Apr 2020 10:58:21 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 037EwF89117756;
        Tue, 7 Apr 2020 09:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586271495;
        bh=vBskRwBkvqSku+ubgnNo8sGMouYNRdqRK793R14qOPk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=th63Xzar7E8joSw1QU3lIFZ+a0nTLAA2aiYBt3w1bxISBIDNS1V5D4h+bkl1DWXqh
         yklyIDW40nF/YiIMooWUtv2uvg6vG7CPB5XALzr6OKOO/BdyzUQHAqMiI9gfx/U3a3
         f14adUuBDmT8pV+c0l6MXTtlxZo3gd2lkx2i/Kzg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 037EwF76001978;
        Tue, 7 Apr 2020 09:58:15 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Apr
 2020 09:58:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Apr 2020 09:58:15 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 037EwE9Y088278;
        Tue, 7 Apr 2020 09:58:14 -0500
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
 <0beb0000-a8a3-4063-d165-fd804021342e@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <64108c51-89bb-c43b-31c2-a560446e44a5@ti.com>
Date:   Tue, 7 Apr 2020 09:52:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0beb0000-a8a3-4063-d165-fd804021342e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/6/20 2:25 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thanks for the update. I have a few comments below.
>
> On 4/2/20 10:42 PM, Dan Murphy wrote:
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
>>   .../ABI/testing/sysfs-class-led-multicolor    |  42 ++++
>>   Documentation/leds/index.rst                  |   1 +
>>   Documentation/leds/leds-class-multicolor.rst  |  95 ++++++++
>>   drivers/leds/Kconfig                          |  10 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/led-class-multicolor.c           | 206 ++++++++++++++++++
>>   include/linux/led-class-multicolor.h          | 121 ++++++++++
>>   7 files changed, 476 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..1f50324d24fd
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,42 @@
>> +What:		/sys/class/leds/<led>/brightness
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Writing to this file will update all LEDs within the group to a
>> +		calculated percentage of what each color LED intensity is set
>> +		to. The percentage is calculated for each grouped LED via the
>> +		equation below:
>> +
>> +		led_brightness = brightness * color_intensity/max_brightness
>> +
>> +		For additional details please refer to
>> +		Documentation/leds/leds-class-multicolor.rst.
>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/max_brightness.
>> +
>> +What:		/sys/class/leds/<led>/color_index
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read
>> +		The color_index array, when read, will output the LED colors
>> +		by name as they are indexed in the color_intensity array.
>> +
>> +What:		/sys/class/leds/<led>/num_colors
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read
>> +		The num_colors indicates the number of LEDs defined in the
>> +		color_intensity and color_index arrays.
>> +
>> +What:		/sys/class/leds/<led>/color_intensity
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Intensity level for the LED color within the array.
>> +		The intensities for each color must be entered based on the
>> +		color_index array.
>> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
>> index 060f4e485897..bc70c6aa7138 100644
>> --- a/Documentation/leds/index.rst
>> +++ b/Documentation/leds/index.rst
>> @@ -9,6 +9,7 @@ LEDs
>>   
>>      leds-class
>>      leds-class-flash
>> +   leds-class-multicolor
>>      ledtrig-oneshot
>>      ledtrig-transient
>>      ledtrig-usbport
>> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
>> new file mode 100644
>> index 000000000000..5bb004999248
>> --- /dev/null
>> +++ b/Documentation/leds/leds-class-multicolor.rst
>> @@ -0,0 +1,95 @@
>> +====================================
>> +Multi Color LED handling under Linux
>> +====================================
>> +
>> +Description
>> +===========
>> +The multi color class groups monochrome LEDs and allows controlling two
>> +aspects of the final combined color: hue and lightness. The former is
>> +controlled via the color_intensity array file and the latter is controlled
>> +via brightness file.
>> +
>> +For more details on hue and lightness notions please refer to
>> +https://en.wikipedia.org/wiki/CIECAM02.
>> +
>> +Multicolor Class Control
>> +========================
>> +The multicolor class presents files that groups the colors as indexes in an
>> +array.  These files are children under the LED parent node created by the
>> +led_class framework.  The led_class framework is documented in led-class.rst
>> +within this documentation directory.
>> +
>> +Each colored LED will be indexed under the color_* files. The order of the
>> +colors are arbitrary the color_index file can be read to determine the color
> Something wrong with punctuation here, or it is even a stylistic
> problem.
Ack and fixed
>
>> +to index value.
>> +
>> +The color_index file is an array that contains the string list of the colors as
>> +they are defined in each color_* array file.
>> +
>> +The color_intensity is an array that can be read or written to for the
>> +individual color intensities.  All elements within this array must be written in
>> +order for the color LED intensities to be updated.
>> +
>> +The color_max_intensity is an array that can be read to indicate each color LED
>> +maximum intensity value.
>> +
>> +The num_color_leds file returns the total number of color LEDs that are
>> +presented in each color_* array.
>> +
>> +Directory Layout Example
>> +========================
>> +root:/sys/class/leds/multicolor:status# ls -lR
>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 color_intensity
>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 num_color_leds
>> +
>> +Multicolor Class Brightness Control
>> +===================================
>> +The multiclor class framework will calculate each monochrome LEDs intensity.
>> +
>> +The brightness level for each LED is calculated based on the color LED
>> +intensity setting divided by the parent max_brightness setting multiplied by
>> +the requested brightness.
>> +
>> +led_brightness = brightness * color_intensity/max_brightness
>> +
>> +Example:
>> +A user first writes the color_intensity file with the brightness levels
>> +that for each LED that is necessary to achieve a blueish violet output from a
>> +RGB LED group.
>> +
>> +cat /sys/class/leds/multicolor:status/color_index
>> +green blue red
>> +
>> +echo 43 226 138 > /sys/class/leds/multicolor:status/color_intensity
>> +
>> +red -
>> +	intensity = 138
>> +	max_brightness = 255
>> +green -
>> +	intensity = 43
>> +	max_brightness = 255
>> +blue -
>> +	intensity = 226
>> +	max_brightness = 255
>> +
>> +The user can control the brightness of that RGB group by writing the parent
> s/RGB/multicolor/
Ack and fixed throughout the doc
>
>> +'brightness' control.  Assuming a parent max_brightness of 255 the user may want
>> +to dim the LED color group to half.  The user would write a value of 128 to the
>> +parent brightness file then the values written to each LED will be adjusted
>> +base on this value
>> +
>> +cat /sys/class/leds/multicolor:status/max_brightness
>> +255
>> +echo 128 > /sys/class/leds/multicolor:status/brightness
>> +
>> +adjusted_red_value = 128 * 138/255 = 69
>> +adjusted_green_value = 128 * 43/255 = 21
>> +adjusted_blue_value = 128 * 226/255 = 113
>> +
>> +Reading the parent brightness file will return the current brightness value of
>> +the color LED group.
>> +
>> +cat /sys/class/leds/multicolor:status/brightness
>> +128
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index d82f1dea3711..2e4611b25054 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>>   	  for the flash related features of a LED device. It can be built
>>   	  as a module.
>>   
>> +config LEDS_CLASS_MULTI_COLOR
>> +	tristate "LED Multi Color LED Class Support"
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
>> index d7e1107753fb..310b5518783a 100644
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
>> index 000000000000..838b1d679647
>> --- /dev/null
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -0,0 +1,206 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// LED Multi Color class interface
>> +// Copyright (C) 2019-20 Texas Instruments Incorporated - http://www.ti.com/
>> +// Author: Dan Murphy <dmurphy@ti.com>
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
>> +int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>> +				 enum led_brightness brightness)
>> +{
>> +	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++)
>> +		mcled_cdev->multicolor_info[i].color_brightness = (brightness *
>> +					  mcled_cdev->multicolor_info[i].color_led_intensity /
>> +					  led_cdev->max_brightness);
> Why the need for brackets?

It was cleaner to read that was all.


>
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
>> +
>> +static ssize_t color_intensity_store(struct device *dev,
>> +				struct device_attribute *intensity_attr,
>> +				const char *buf, size_t size)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int nrchars, offset = 0;
>> +	int intensity_value[LED_COLOR_ID_MAX];
>> +	int i;
>> +	ssize_t ret;
>> +
>> +	mutex_lock(&led_cdev->led_access);
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
>> +		ret = sscanf(buf + offset, "%i%n",
>> +			     &intensity_value[i], &nrchars);
>> +		if (ret != 1) {
>> +			dev_err(led_cdev->dev,
>> +				"Incorrect number of LEDs expected %i values intensity was not applied\n",
>> +				mcled_cdev->num_colors);
>> +			goto err_out;
>> +		}
>> +		offset += nrchars;
>> +	}
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++)
>> +		mcled_cdev->multicolor_info[i].color_led_intensity =
>> +					intensity_value[i];
>> +
>> +	led_set_brightness(led_cdev, led_cdev->brightness);
>> +err_out:
>> +	ret = size;
>> +	mutex_unlock(&led_cdev->led_access);
>> +	return ret;
>> +}
>> +
>> +static ssize_t color_intensity_show(struct device *dev,
>> +			      struct device_attribute *intensity_attr,
>> +			      char *buf)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int len = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++)
>> +		len += sprintf(buf + len, "%d ",
>> +			    mcled_cdev->multicolor_info[i].color_led_intensity);
>> +
>> +	len += sprintf(buf + len, "%s", "\n");
>> +
>> +	return len;
>> +}
>> +static DEVICE_ATTR_RW(color_intensity);
>> +
>> +static ssize_t color_index_show(struct device *dev,
>> +			      struct device_attribute *color_index_attr,
>> +			      char *buf)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +	int len = 0;
>> +	int index;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
>> +		index = mcled_cdev->multicolor_info[i].color_index;
>> +		len += sprintf(buf + len, "%s ", led_colors[index]);
>> +	}
>> +
>> +	len += sprintf(buf + len, "%s", "\n");
>> +
>> +	return len;
>> +}
>> +static DEVICE_ATTR_RO(color_index);
>> +
>> +static ssize_t num_colors_show(struct device *dev,
>> +				   struct device_attribute *max_intensity_attr,
>> +				   char *buf)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +
>> +	return sprintf(buf, "%d\n", mcled_cdev->num_colors);
>> +}
>> +static DEVICE_ATTR_RO(num_colors);
>> +
>> +static struct attribute *led_multicolor_attrs[] = {
>> +	&dev_attr_color_intensity.attr,
>> +	&dev_attr_color_index.attr,
>> +	&dev_attr_num_colors.attr,
>> +	NULL,
>> +};
>> +ATTRIBUTE_GROUPS(led_multicolor);
>> +
>> +int led_classdev_multicolor_register_ext(struct device *parent,
>> +				     struct led_classdev_mc *mcled_cdev,
>> +				     struct led_init_data *init_data)
>> +{
>> +	struct led_classdev *led_cdev;
>> +
>> +	if (!mcled_cdev)
>> +		return -EINVAL;
>> +
>> +	if (!mcled_cdev->num_colors)
>> +		return -EINVAL;
>> +
>> +	led_cdev = &mcled_cdev->led_cdev;
>> +	mcled_cdev->led_cdev.groups = led_multicolor_groups;
>> +
>> +	return led_classdev_register_ext(parent, led_cdev, init_data);
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
>> +
>> +void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev)
>> +{
>> +	if (!mcled_cdev)
>> +		return;
>> +
>> +	led_classdev_unregister(&mcled_cdev->led_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
>> +
>> +static void devm_led_classdev_multicolor_release(struct device *dev, void *res)
>> +{
>> +	led_classdev_multicolor_unregister(*(struct led_classdev_mc **)res);
>> +}
>> +
>> +int devm_led_classdev_multicolor_register_ext(struct device *parent,
>> +					     struct led_classdev_mc *mcled_cdev,
>> +					     struct led_init_data *init_data)
>> +{
>> +	struct led_classdev_mc **dr;
>> +	int ret;
>> +
>> +	dr = devres_alloc(devm_led_classdev_multicolor_release,
>> +			  sizeof(*dr), GFP_KERNEL);
>> +	if (!dr)
>> +		return -ENOMEM;
>> +
>> +	ret = led_classdev_multicolor_register_ext(parent, mcled_cdev,
>> +						   init_data);
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
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register_ext);
>> +
>> +static int devm_led_classdev_multicolor_match(struct device *dev,
>> +					      void *res, void *data)
>> +{
>> +	struct led_classdev_mc **p = res;
>> +
>> +	if (WARN_ON(!p || !*p))
>> +		return 0;
>> +
>> +	return *p == data;
>> +}
>> +
>> +void devm_led_classdev_multicolor_unregister(struct device *dev,
>> +					     struct led_classdev_mc *mcled_cdev)
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
>> index 000000000000..a6a3715c0d48
>> --- /dev/null
>> +++ b/include/linux/led-class-multicolor.h
>> @@ -0,0 +1,121 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* LED Multicolor class interface
>> + * Copyright (C) 2019-20 Texas Instruments Incorporated - http://www.ti.com/
>> + */
>> +
>> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>> +
>> +#include <linux/leds.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +struct led_multicolor_info {
>> +	int color_index;
>> +	int color_brightness;
>> +	int color_led_intensity;
>> +	int color_channel;
>> +};
>> +
>> +struct led_classdev_mc {
>> +	/* led class device */
>> +	struct led_classdev led_cdev;
>> +	int num_colors;
>> +
>> +	struct led_multicolor_info multicolor_info[LED_COLOR_ID_MAX];
> I still have a problem with this fixed array that can grow for each
> driver as new color identifiers are added to the LED core. Not
> mentioning waste of memory due to unused colors. This is bad design.

I did try to do the dynamic allocation in both the device driver and 
framework

When I used this

         led->mc_cdev.multitest_info = devm_kzalloc(&priv->client->dev,
         struct_size(&led->mc_cdev, multitest_info, num_colors),
                GFP_KERNEL);

The compiler complained.

drivers/leds/leds-lp50xx.c: In function ‘lp50xx_probe_dt’:
drivers/leds/leds-lp50xx.c:669:31: error: invalid use of flexible array 
member
   669 |   led->mc_cdev.multitest_info = devm_kzalloc(&priv->client->dev,
       |                               ^

The pointer was defined as

     struct led_multicolor_info *multitest_info[];

The led_classdev_mc structure is allocated in the device driver 
structure.  This struct contains the multicolor_info structure.

Unless I am doing this incorrectly.

Dan


Dan

