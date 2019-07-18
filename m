Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E7E6CEE1
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jul 2019 15:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbfGRNcL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jul 2019 09:32:11 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36010 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRNcL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jul 2019 09:32:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6IDW0iS115547;
        Thu, 18 Jul 2019 08:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563456720;
        bh=DOqg5zurSml90p5aTTBUtHpD7sDxh6huwtlTQx0tfFU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Mvd6pUKEDTNadnllQX3w9hLHkeSWQ8l5h7JaZlYj4iBro99SuTTceG8CwRonWDXF+
         srWV3cK7ueq2Gzi/PK98l2EXj1a9b9Sj92qIiUuNywO6PhiSvGzvcRTkBhVYoudSa/
         d9sefVup9C3Zsjw7pL8FddYw8rk1K9h56gxLCRKs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6IDW0Pc039324
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Jul 2019 08:32:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 18
 Jul 2019 08:31:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 18 Jul 2019 08:31:59 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6IDVv9P123801;
        Thu, 18 Jul 2019 08:31:58 -0500
Subject: Re: [PATCH v3 2/3] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20190717135948.19340-1-jjhiblot@ti.com>
 <20190717135948.19340-3-jjhiblot@ti.com>
 <4bd3b558-ea5b-0d2e-16b2-5b2e8bb484d2@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <49152281-059c-6006-4c0f-a6be96a12707@ti.com>
Date:   Thu, 18 Jul 2019 15:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4bd3b558-ea5b-0d2e-16b2-5b2e8bb484d2@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 18/07/2019 14:24, Jacek Anaszewski wrote:
> Hi Jean,
>
> Thank you for the updated patch set.
>
> I have some more comments below.
>
> On 7/17/19 3:59 PM, Jean-Jacques Hiblot wrote:
>>   
>> +static bool __led_need_regulator_update(struct led_classdev *led_cdev,
>> +					int brightness)
>> +{
>> +	bool new_state = (brightness != LED_OFF);
> How about:
>
> bool new_state = !!brightness;

Throughout the code LED_OFF is used when the LED is turned off. I think 
it would be more consistent to use it there too.

>
>> +
>> +	return led_cdev->regulator && led_cdev->regulator_state != new_state;
>> +}
>> +static int __led_handle_regulator(struct led_classdev *led_cdev,
>> +				int brightness)
>> +{
>> +	int rc;
>> +
>> +	if (__led_need_regulator_update(led_cdev, brightness)) {
>> +
>> +		if (brightness != LED_OFF)
>> +			rc = regulator_enable(led_cdev->regulator);
>> +		else
>> +			rc = regulator_disable(led_cdev->regulator);
>> +		if (rc)
>> +			return rc;
>> +
>> +		led_cdev->regulator_state = (brightness != LED_OFF);
>> +	}
>> +	return 0;
>> +}
> Let's have these function names without leading underscores.
OK.
>
>>   static int __led_set_brightness(struct led_classdev *led_cdev,
>>   				enum led_brightness value)
>>   {
>> @@ -115,6 +142,8 @@ static void set_brightness_delayed(struct work_struct *ws)
>>   	if (ret == -ENOTSUPP)
>>   		ret = __led_set_brightness_blocking(led_cdev,
>>   					led_cdev->delayed_set_value);
>> +	__led_handle_regulator(led_cdev, led_cdev->delayed_set_value)
> If you called it from __led_set_brightness() and

We cannot call it from __led_set_brightness() because it is supposed not 
to block.

JJ

