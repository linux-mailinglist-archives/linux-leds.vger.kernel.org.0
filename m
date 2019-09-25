Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24EA5BDA09
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 10:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438888AbfIYIl6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 04:41:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47592 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406947AbfIYIl6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 04:41:58 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8P8fqAK025847;
        Wed, 25 Sep 2019 03:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569400912;
        bh=ZWw3g9tHf8AManzLkmi4eo3nbsy7HyU0BkIAV4xFwwo=;
        h=From:Subject:To:CC:References:Date:In-Reply-To;
        b=PeBt5FAb5nL21izBkbeeMVn4VyxJE2eSfDN9IbsLAjNIgOReFozKua0rt5/dIuFCD
         WZ1OPLaeyN/aGDOaLJF6SgqI6exOkTQOoHwKa/5AZOiTuZjS+BD8jEEns1S8ZovGdN
         m6gfau3nRaiRUYWwjMrOPr88ZQLH6vya94y8so0k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8P8fqXf128416;
        Wed, 25 Sep 2019 03:41:52 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 03:41:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 03:41:45 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8P8foQ6015044;
        Wed, 25 Sep 2019 03:41:50 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v5 3/3] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>
References: <20190923102059.17818-1-jjhiblot@ti.com>
 <20190923102059.17818-4-jjhiblot@ti.com>
 <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com>
Message-ID: <fb10ca8b-08f2-abbd-ecfa-3c7b2f3b9817@ti.com>
Date:   Wed, 25 Sep 2019 10:41:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 24/09/2019 20:58, Jacek Anaszewski wrote:
> Hi Jean,
>
> Thank you for the patch.
>
> I must say I'm not a big fan of this change.
> It adds a bunch of code to the LED core and gives small
> functionality in a reward.

I disagree. I remember having to tweak DTS in the past to force some 
regulators outputs, and then they would be always turned on. If all 
sub-systems were power-supply/regulator-aware, that kind of hack would 
not be needed.


>   It may also influence maximum
> software blinking rate, so I'd rather avoid calling
> regulator_enable/disable when timer trigger is set.
>
> It will of course require more code.

True. We might be able to mitigate this by delaying turning off the 
regulator; Turning it on would be an immediate action, turning it off 
would be delayed by a configurable amount of ms. That should take care 
of the max blinking rate and reduce the overhead for a LED that changes 
states quite often (like a mass storage indicator)

JJ

>
> Since AFAIR Pavel was original proponent of this change then
> I'd like to see his opinion before we move on to discussing
> possible improvements to this patch.
>
> Best regards,
> Jacek Anaszewski
>
> On 9/23/19 12:20 PM, Jean-Jacques Hiblot wrote:
>> A LED is usually powered by a voltage/current regulator. Let the LED core
>> know about it. This allows the LED core to turn on or off the power supply
>> as needed.
>>
>> Signed-off-by: Jean-Jacques Hiblot<jjhiblot@ti.com>
>> ---
>>   drivers/leds/led-class.c | 17 +++++++++++
>>   drivers/leds/led-core.c  | 65 ++++++++++++++++++++++++++++++++++++++--
>>   drivers/leds/leds.h      |  3 ++
>>   include/linux/leds.h     |  5 ++++
>>   4 files changed, 88 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index e11177d77b4c..d122b6982efd 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -352,6 +352,7 @@ int led_classdev_register_ext(struct device *parent,
>>   	char final_name[LED_MAX_NAME_SIZE];
>>   	const char *proposed_name = composed_name;
>>   	int ret;
>> +	struct regulator *regulator;
>>   
>>   	if (init_data) {
>>   		if (init_data->devname_mandatory && !init_data->devicename) {
>> @@ -387,6 +388,22 @@ int led_classdev_register_ext(struct device *parent,
>>   		dev_warn(parent, "Led %s renamed to %s due to name collision",
>>   				led_cdev->name, dev_name(led_cdev->dev));
>>   
>> +	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
>> +	if (IS_ERR(regulator)) {
>> +		if (regulator != ERR_PTR(-ENODEV)) {
>> +			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
>> +				led_cdev->name);
>> +			device_unregister(led_cdev->dev);
>> +			mutex_unlock(&led_cdev->led_access);
>> +			return PTR_ERR(regulator);
>> +		}
>> +		led_cdev->regulator = NULL;
>> +	} else {
>> +		led_cdev->regulator = regulator;
>> +		led_cdev->regulator_state = REG_OFF;
>> +		atomic_set(&led_cdev->target_regulator_state, REG_UNKNOWN);
>> +	}
>> +
>>   	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>>   		ret = led_add_brightness_hw_changed(led_cdev);
>>   		if (ret) {
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index d318f9b0382d..155a158c7b8d 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -37,6 +37,43 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
>>   };
>>   EXPORT_SYMBOL_GPL(led_colors);
>>   
>> +static int __led_handle_regulator(struct led_classdev *led_cdev)
>> +{
>> +	int rc;
>> +	int target_state = led_cdev->delayed_set_value ?  REG_ON : REG_OFF;
>> +
>> +	if (!led_cdev->regulator)
>> +		return 0;
>> +
>> +	/*
>> +	 * if the current regulator state is not the target state, we
>> +	 * need to update it.
>> +	 * note: No need for spinlock or atomic here because
>> +	 * led_cdev->regulator_state is modified only in the context of
>> +	 * the worqueue
>> +	 */
>> +	if (led_cdev->regulator_state != target_state) {
>> +
>> +		if (target_state == REG_ON)
>> +			rc = regulator_enable(led_cdev->regulator);
>> +		else
>> +			rc = regulator_disable(led_cdev->regulator);
>> +		if (rc) {
>> +			/*
>> +			 * If something went wrong with the regulator update,
>> +			 * Make sure that led_set_brightness_nosleep() assume
>> +			 * that the regultor is in the right state.
>> +			 */
>> +			atomic_set(&led_cdev->target_regulator_state,
>> +				   REG_UNKNOWN);
>> +			return rc;
>> +		}
>> +
>> +		led_cdev->regulator_state = target_state;
>> +	}
>> +	return 0;
>> +}
>> +
>>   static int __led_set_brightness(struct led_classdev *led_cdev,
>>   				enum led_brightness value)
>>   {
>> @@ -135,6 +172,11 @@ static void set_brightness_delayed(struct work_struct *ws)
>>   	    (led_cdev->flags & LED_HW_PLUGGABLE)))
>>   		dev_err(led_cdev->dev,
>>   			"Setting an LED's brightness failed (%d)\n", ret);
>> +
>> +	ret = __led_handle_regulator(led_cdev);
>> +	if (ret)
>> +		dev_err(led_cdev->dev,
>> +			"Updating regulator state failed (%d)\n", ret);
>>   }
>>   
>>   static void led_set_software_blink(struct led_classdev *led_cdev,
>> @@ -269,8 +311,27 @@ EXPORT_SYMBOL_GPL(led_set_brightness);
>>   void led_set_brightness_nopm(struct led_classdev *led_cdev,
>>   			      enum led_brightness value)
>>   {
>> -	/* Use brightness_set op if available, it is guaranteed not to sleep */
>> -	if (!__led_set_brightness(led_cdev, value))
>> +	bool update_regulator = false;
>> +	int old, new;
>> +
>> +	if (led_cdev->regulator) {
>> +		/*
>> +		 * Check if the regulator need to be updated.
>> +		 * We use an atomic here because multiple threads could
>> +		 * be calling this function at the same time. Using
>> +		 * atomic_xchg() ensures the consistency between
>> +		 * target_regulator_state, value and update_regulator
>> +		 */
>> +		new = !!value;
>> +		old = atomic_xchg(&led_cdev->target_regulator_state, new);
>> +		update_regulator = (old != new);
>> +	}
>> +
>> +	/*
>> +	 * If regulator state doesn't need to be changed, use brightness_set
>> +	 * op if available, it is guaranteed not to sleep
>> +	 */
>> +	if (!update_regulator && !__led_set_brightness(led_cdev, value))
>>   		return;
>>   
>>   	/* If brightness setting can sleep, delegate it to a work queue task */
>> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
>> index 0b577cece8f7..02f261ce77f2 100644
>> --- a/drivers/leds/leds.h
>> +++ b/drivers/leds/leds.h
>> @@ -11,6 +11,9 @@
>>   
>>   #include <linux/rwsem.h>
>>   #include <linux/leds.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +enum { REG_OFF = 0, REG_ON, REG_UNKNOWN };
>>   
>>   static inline int led_get_brightness(struct led_classdev *led_cdev)
>>   {
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index 88bf2ceaabe6..8ce7cf937192 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -149,6 +149,11 @@ struct led_classdev {
>>   
>>   	/* Ensures consistent access to the LED Flash Class device */
>>   	struct mutex		led_access;
>> +
>> +	/* regulator */
>> +	struct regulator	*regulator;
>> +	int			regulator_state;
>> +	atomic_t		target_regulator_state;
>>   };
>>   
>>   /**
>>
