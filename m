Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303CD1B75DF
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2020 14:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgDXMrc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Apr 2020 08:47:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33462 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbgDXMrZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Apr 2020 08:47:25 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OClLLq013697;
        Fri, 24 Apr 2020 07:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587732441;
        bh=apdDrANLzu3j4mUkujpFmPY7KzLCkyN+fjqYmAq9cZ4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qyDyO5qLA7f7VoERwOJPG+TRakChQcQtk0NZ6smup6hnZVLdAp1m9CQapRPbz1sFG
         Pkqkm4T73RGXrOAb3iwq614DEcgl3iQ0GjpdmC/ryNrmKYrSXjOfdl3YmowkRTHJDs
         D3qnurW1BhQUOj+3bgbOM94CvltkoGuKK1K/VroE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OClKcY048204
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 07:47:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 07:47:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 07:47:20 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OClJ7e087059;
        Fri, 24 Apr 2020 07:47:19 -0500
Subject: Re: [PATCH v7 2/2] leds: Add control of the voltage/current regulator
 to the LED core
To:     Pavel Machek <pavel@ucw.cz>, <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191021174751.4421-1-jjhiblot@ti.com>
 <20191021174751.4421-3-jjhiblot@ti.com> <20191125163738.GC3816@amd>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <50691066-f40e-b690-57e5-8d41b0696f79@ti.com>
Date:   Fri, 24 Apr 2020 15:47:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20191125163738.GC3816@amd>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 04/12/2019 14:37, Pavel Machek wrote:
> Hi!
> 
>> A LED is usually powered by a voltage/current regulator. Let the LED core
>> know about it. This allows the LED core to turn on or off the power supply
>> as needed.
>>
>> Because turning ON/OFF a regulator might block, it is not done
>> synchronously but done in a workqueue. Turning ON the regulator is
>> always

JJ had to leave this unfinished, and now I'm trying to pick this work up.

> How will this interact with LEDs that can be used from atomic context?

I think the idea here is that if the LED uses a regulator, and the regulator needs to be enabled, 
then the whole work is scheduled. If there's no regulator or if the regulator is already enabled, 
the brightness is set directly.

>> +static ssize_t regulator_auto_off_store(struct device *dev,
>> +		struct device_attribute *attr, const char *buf, size_t size)
>> +{
>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +	ssize_t ret = size;
>> +	bool auto_off;
>> +
>> +	if (strncmp(buf, "enable\n", size) == 0)
>> +		auto_off = true;
>> +	else if (strncmp(buf, "disable\n", size) == 0)
>> +		auto_off = false;
>> +	else
>> +		return -EINVAL;
> 
> Sounds like device power management to me. Is it compatible with that?

Can you elaborate what you mean?

>> @@ -135,6 +203,8 @@ static void set_brightness_delayed(struct work_struct *ws)
>>   	    (led_cdev->flags & LED_HW_PLUGGABLE)))
>>   		dev_err(led_cdev->dev,
>>   			"Setting an LED's brightness failed (%d)\n", ret);
>> +
>> +	 led_handle_regulator(led_cdev);
>>   }
>>
> 
> You only modify set_brigthness_delays, so this will not work at all
> for non-blocking LEDs, right?

I'm not that familiar with led framework yet, but if setting of the brightness always goes via 
led_set_brightness_nopm(), then I think this would work for all LEDs, as led_set_brightness_nopm 
will schedule the work if needed (which goes to set_brightness_delayed).

>>   static void led_set_software_blink(struct led_classdev *led_cdev,
>> @@ -189,6 +259,7 @@ static void led_blink_setup(struct led_classdev *led_cdev,
>>   void led_init_core(struct led_classdev *led_cdev)
>>   {
>>   	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
>> +	INIT_DELAYED_WORK(&led_cdev->reg_off_work, turn_off_regulator_delayed);
>>   
> 
> Could this re-use the workqueue? Many systems will not need
> regulators, so this is overhead...

You mean re-use the 'set_brightness_work' work? I'm not sure how that would be done, they're a bit 
different things. set_brightness_work is used to change the context from atomic to non-atomic, and 
reg_off_work is used to turn the regulator off after a specified delay.

>> +			/*
>> +			 * the regulator must  be turned off. This cannot be
> 
> Use "The", and fix double spaces between must and be.
> 
>> +		} else if (regulator_on && old == REG_R_OFF_U_OFF) {
>> +			/*
>> +			 * the regulator must be enabled. This cannot be here
> 
> "The"
> 
>> +		/*
>> +		 * small optimization. Cancel the work that had been started
> 
> "Small."
> 
>> +#include <linux/regulator/consumer.h>
>> +
>> +/*
>> + * The regulator state tracks 2 boolean variables:
>> + * - the state of regulator (or more precisely the state required by
>> + *   led core layer, as many users can interact with the same regulator).
>> + *   It is tracked by bit 0.
>> + * - the state last asked-for by the LED user. It is tracked by bit 1.
>> + */
>> +#define REG_R_ON BIT(0)
>> +#define REG_U_ON BIT(1)
>> +
>> +enum {	REG_R_OFF_U_OFF = 0,
>> +	REG_R_ON_U_OFF = REG_R_ON,
>> +	REG_R_OFF_U_ON = REG_U_ON,
>> +	REG_R_ON_U_ON = REG_R_ON | REG_U_ON
>> +};
> 
> That's quite weird use of enum.

Yes, these could as well be defines, if that's what you mean.

>> +++ b/include/linux/leds.h
>> @@ -149,6 +149,15 @@ struct led_classdev {
>>   
>>   	/* Ensures consistent access to the LED Flash Class device */
>>   	struct mutex		led_access;
>> +
>> +	/* regulator */
> 
> "Regulator".

Fixed this and the other cosmetic changes, thanks!

Overall, I wonder if all this is worth it as this is somewhat complex change, compared to just 
having the regulator always enabled...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
