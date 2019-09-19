Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19FE7B7052
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 03:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfISBEe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 21:04:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35366 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfISBEe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 21:04:34 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8J14Ts1098266;
        Wed, 18 Sep 2019 20:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568855069;
        bh=rPBS5zBNd7UI5aUNEVcNVvCTXtpqv1yvXkuIqhNPbLw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Lr6jYjHLKylEiax3j+6TFJ01I08QUarT+193ZlkMps2F+cecZBQ5guAuNDEVmboOL
         046RggRtv7z5k+FodDrLfnIYewvOwEpWjPOLqIZOCFAUV9MF2xGmtu+LOTcQzbQeDZ
         zxjHMtgyUs0fpL/ZZi1it9EIvrfP4StRU9N6GYYA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8J14TpK090856
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Sep 2019 20:04:29 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 20:04:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 20:04:29 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8J14SHw032335;
        Wed, 18 Sep 2019 20:04:28 -0500
Subject: Re: [PATCH v6 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190917175937.13872-1-dmurphy@ti.com>
 <20190917175937.13872-6-dmurphy@ti.com>
 <ff1d2ede-6bdf-8f73-9e89-0e990cce09a7@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e1de10a6-49ad-c7f2-9246-5bee29f58c80@ti.com>
Date:   Wed, 18 Sep 2019 20:07:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ff1d2ede-6bdf-8f73-9e89-0e990cce09a7@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/18/19 4:27 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> I think Greg's guidance clarified everything nicely -
> we will avoid <color> sub-dirs in favour of prefixes
> to *intensity and *max_intensity.
Yes I will make the change accordingly.  It will simplify the code.
>
> Before you will send an update I have some improvement
> ideas regarding the remnants after the previous approach,
> where single color intensity update resulted in updating
> hardware state. Now the update will happen only on write to
> brightness file, so we will not need color_set/color_get ops
> anymore.

I left those call backs in specifically for the LP50xx. Otherwise the 
LEDs are only updated when the brightness file is written.

The LP50xx has an engine that performs the intensity computation for the 
specific LED.  So there is no call back to the MC FW for calculating the 
intensity.

The brightness and intensity are written directly to the device and the 
MCU in the device does all the computations so you have real time update.

For the LP55xx device the LEDs are only updated when the brightness file 
is written.

I think we can leave those call backs in if device driver or product 
development teams would like to use them.

Dan


> On 9/17/19 7:59 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The framework allows for dynamically setting individual LEDs
>> or setting brightness levels of LEDs and updating them virtually
>> simultaneously.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v6 removed color_id and color_mix files, used sysfs_create_groups instead of
>> kobject call for LED color directory, kept kobject_create for the "colors" directory,
>> removed the calculate function, updated the export for the intensity calculations.
>>
>>
>>   drivers/leds/Kconfig                 |  10 +
>>   drivers/leds/Makefile                |   1 +
>>   drivers/leds/led-class-multicolor.c  | 306 +++++++++++++++++++++++++++
>>   include/linux/led-class-multicolor.h |  90 ++++++++
>>   4 files changed, 407 insertions(+)
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
>> index 000000000000..d43bd344ed4c
>> --- /dev/null
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -0,0 +1,306 @@
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
>> +void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
>> +			    enum led_brightness brightness,
>> +			    int brightness_val[])
>> +{
>> +	struct led_classdev_mc_data *data = mcled_cdev->data;
>> +	struct led_mc_color_entry *priv;
>> +	int i = 0;
>> +
>> +	list_for_each_entry(priv, &data->color_list, list) {
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
> I don't think this is a good idea to update hw here now.
> As I proposed before - let's do the write only in brightness set.
> Otherwise any change of hue requiring alteration of more than one color
> component will be non-atomic w.r.t. hw state change. Just cache the
> intensity in the entry here.
>
> [...]
>
