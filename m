Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3F5C9EC4
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 14:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbfJCMr0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 08:47:26 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60864 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbfJCMr0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Oct 2019 08:47:26 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93ClE2a102613;
        Thu, 3 Oct 2019 07:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570106834;
        bh=JMexwncxTG0RXIsiZpMRKEljXTzagWDuN8gPgZxM0XE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Fjcj6iDtcRQawB3mvUUYvOiTXnNrYyGqT3c3C0ia4wJgyOoqWRLysVEqCWmxlVtuG
         kifRa1kmP1LOh6VFH2LQplnTc11uh9+7tNP9pk0pPXYK3xSDyMSAD85zEvnyGsztFj
         vIFMYDOJrT8DEZK6AzOBDissL37IMza2jHpniEq8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x93ClEVg119215;
        Thu, 3 Oct 2019 07:47:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 07:47:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 07:47:14 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x93ClBe1067033;
        Thu, 3 Oct 2019 07:47:12 -0500
Subject: Re: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ti.com>,
        <dmurphy@ti.com>, <linux-leds@vger.kernel.org>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
Date:   Thu, 3 Oct 2019 14:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003104228.c5nho6eimwzqwxpt@earth.universe>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sebastian,

On 03/10/2019 12:42, Sebastian Reichel wrote:
> Hi,
>
> On Thu, Oct 03, 2019 at 10:28:09AM +0200, Jean-Jacques Hiblot wrote:
>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> This patch adds basic support for a kernel driver to get a LED device.
>> This will be used by the led-backlight driver.
>>
>> Only OF version is implemented for now, and the behavior is similar to
>> PWM's of_pwm_get() and pwm_put().
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> ---
>>   drivers/leds/led-class.c | 44 ++++++++++++++++++++++++++++++++++++++++
>>   include/linux/leds.h     |  4 ++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index c2167b66b61f..455545f5d663 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/spinlock.h>
>>   #include <linux/timer.h>
>>   #include <uapi/linux/uleds.h>
>> +#include <linux/of.h>
>>   #include "leds.h"
>>   
>>   static struct class *leds_class;
>> @@ -214,6 +215,49 @@ static int led_resume(struct device *dev)
>>   
>>   static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
>>   
>> +/**
>> + * of_led_get() - request a LED device via the LED framework
>> + * @np: device node to get the LED device from
>> + * @index: the index of the LED
>> + *
>> + * Returns the LED device parsed from the phandle specified in the "leds"
>> + * property of a device tree node or a negative error-code on failure.
>> + */
>> +struct led_classdev *of_led_get(struct device_node *np, int index)
>> +{
>> +	struct device *led_dev;
>> +	struct led_classdev *led_cdev;
>> +	struct device_node *led_node;
>> +
>> +	led_node = of_parse_phandle(np, "leds", index);
>> +	if (!led_node)
>> +		return ERR_PTR(-ENOENT);
>> +
>> +	led_dev = class_find_device_by_of_node(leds_class, led_node);
> If you convert led_node into a fwnode, you can use
> class_find_device_by_fwnode() instead. That way the
> first patch can just be dropped.

Thanks for the reviews.

The first patch could be dropped  indeed, but it would break something 
else I'm working on: getting regulator support in the LED core.

This has been discussed during the v7 iteration of this series.

JJ


>
> -- Sebastian
>
>> +	of_node_put(led_node);
>> +
>> +	if (!led_dev)
>> +		return ERR_PTR(-EPROBE_DEFER);
>> +
>> +	led_cdev = dev_get_drvdata(led_dev);
>> +
>> +	if (!try_module_get(led_cdev->dev->parent->driver->owner))
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	return led_cdev;
>> +}
>> +EXPORT_SYMBOL_GPL(of_led_get);
>> +
>> +/**
>> + * led_put() - release a LED device
>> + * @led_cdev: LED device
>> + */
>> +void led_put(struct led_classdev *led_cdev)
>> +{
>> +	module_put(led_cdev->dev->parent->driver->owner);
>> +}
>> +EXPORT_SYMBOL_GPL(led_put);
>> +
>>   static int led_classdev_next_name(const char *init_name, char *name,
>>   				  size_t len)
>>   {
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index b8df71193329..6f7371bc7757 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -20,6 +20,7 @@
>>   
>>   struct device;
>>   struct led_pattern;
>> +struct device_node;
>>   /*
>>    * LED Core
>>    */
>> @@ -196,6 +197,9 @@ extern void devm_led_classdev_unregister(struct device *parent,
>>   extern void led_classdev_suspend(struct led_classdev *led_cdev);
>>   extern void led_classdev_resume(struct led_classdev *led_cdev);
>>   
>> +extern struct led_classdev *of_led_get(struct device_node *np, int index);
>> +extern void led_put(struct led_classdev *led_cdev);
>> +
>>   /**
>>    * led_blink_set - set blinking with software fallback
>>    * @led_cdev: the LED to start blinking
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
