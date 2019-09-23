Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9564BB12B
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 11:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbfIWJO3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 05:14:29 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47198 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfIWJO2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 05:14:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8N9EMvN130460;
        Mon, 23 Sep 2019 04:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569230062;
        bh=Bo3LHciudT0e3Wr5RFxKeQr9Fv9edwVOpiANXYmskNo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Z/Q8cf9eV1MFBKGu1OyC4oMQP6T0YS1B5ISVX+a3tX2tcvjO4Dyt9b83V89On6aKK
         wm/IwosRtWqOfhOq+X82+auTkVxgci7JsyhMAUzZuSfs9im2NLiYKRJqGSfQaXJyUT
         a8ulpXMXFtrVKRDZHBM06SmifUpS9k4o+cGqEoh0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8N9EMnf082374
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 04:14:22 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 04:14:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 04:14:16 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8N9EK8P046730;
        Mon, 23 Sep 2019 04:14:21 -0500
Subject: Re: [PATCH v4 1/3] led: make led_set_brightness_sync() use
 led_set_brightness_nosleep()
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>
References: <20190920122525.15712-1-jjhiblot@ti.com>
 <20190920122525.15712-2-jjhiblot@ti.com>
 <c8519e2f-9d46-e164-04d0-42cc5834042a@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <2172e1c7-931e-d510-648b-80ef9c606ab6@ti.com>
Date:   Mon, 23 Sep 2019 11:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c8519e2f-9d46-e164-04d0-42cc5834042a@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On 20/09/2019 23:10, Jacek Anaszewski wrote:
> Hi Jean,
>
> On 9/20/19 2:25 PM, Jean-Jacques Hiblot wrote:
>> Making led_set_brightness_sync() use led_set_brightness_nosleep() has 2
>> advantages:
>> - works for LED controllers that do not provide brightness_set_blocking()
>> - When the blocking callback is used, it uses the workqueue to update the
>>    LED state, removing the need for mutual exclusion between
>>    led_set_brightness_sync() and set_brightness_delayed().
> And third:
>
> - it compromises the "sync" part of the function name :-)

Making it sync is the role of the flush_work() function. It waits until 
the deferred work has been done.

JJ

> This function has been introduced specifically to be blocking
> and have the immediate effect. Its sole client is
> drivers/media/v4l2-core/v4l2-flash-led-class.c.
>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   drivers/leds/led-core.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index f1f718dbe0f8..50e28a8f9357 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -294,15 +294,17 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
>>   int led_set_brightness_sync(struct led_classdev *led_cdev,
>>   			    enum led_brightness value)
>>   {
>> +	int ret;
>> +
>>   	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>>   		return -EBUSY;
>>   
>> -	led_cdev->brightness = min(value, led_cdev->max_brightness);
>> -
>> -	if (led_cdev->flags & LED_SUSPENDED)
>> -		return 0;
>> +	ret = led_set_brightness_nosleep(led_cdev, value);
>> +	if (!ret)
>> +		return ret;
>>   
>> -	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
>> +	flush_work(&led_cdev->set_brightness_work);
>> +	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(led_set_brightness_sync);
>>   
>>
