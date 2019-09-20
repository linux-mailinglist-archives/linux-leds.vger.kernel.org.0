Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45754B8FD0
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 14:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404619AbfITMaL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 08:30:11 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36404 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404361AbfITMaL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 08:30:11 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KCU2YC033049;
        Fri, 20 Sep 2019 07:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568982602;
        bh=Ol6M1ir1cCrFdmazeVk2q4bf7wGJSKlf95XAGkQx4QI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=g6ERzpJLElkXyrwSOCdMpa7F1RcjgTNgqoC+4auEB6mhfweL9MVlnHxcYuu4uorgO
         dEuVOG9IUnsqWNRKO4/gSW/+qnBCev1RV9dpzJs17FOWNY34+cTyDR4HwJd0MT/IOt
         ADi2t+SMA5Jh6YGisQvtGT3gz+kAI1dnbB7B/1Rs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KCU2G7130077
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 07:30:02 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 07:30:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 07:29:58 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KCU0tP108372;
        Fri, 20 Sep 2019 07:30:00 -0500
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
 <49152281-059c-6006-4c0f-a6be96a12707@ti.com>
 <928fd71b-d1d3-cbf3-1aed-ae7fa97f6cf0@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <ce73712c-8931-9177-fbbf-f42dc3d656e6@ti.com>
Date:   Fri, 20 Sep 2019 14:29:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <928fd71b-d1d3-cbf3-1aed-ae7fa97f6cf0@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On 18/07/2019 19:49, Jacek Anaszewski wrote:
> On 7/18/19 3:31 PM, Jean-Jacques Hiblot wrote:
>> On 18/07/2019 14:24, Jacek Anaszewski wrote:
>>> Hi Jean,
>>>
>>> Thank you for the updated patch set.
>>>
>>> I have some more comments below.
>>>
>>> On 7/17/19 3:59 PM, Jean-Jacques Hiblot wrote:
>>>>    +static bool __led_need_regulator_update(struct led_classdev
>>>> *led_cdev,
>>>> +                    int brightness)
>>>> +{
>>>> +    bool new_state = (brightness != LED_OFF);
>>> How about:
>>>
>>> bool new_state = !!brightness;
>> Throughout the code LED_OFF is used when the LED is turned off. I think
>> it would be more consistent to use it there too.
> Basically brightness is a scalar and 0 always means off.
> We treat enum led_brightness as a legacy type - it is no
> longer valid on the whole its span since LED_FULL = 255
> was depreciated with addition of max_brightness property.
>
> IMHO use of reverse logic here only hinders code analysis.
>
>>>> +
>>>> +    return led_cdev->regulator && led_cdev->regulator_state !=
>>>> new_state;
>>>> +}
>>>> +static int __led_handle_regulator(struct led_classdev *led_cdev,
>>>> +                int brightness)
>>>> +{
>>>> +    int rc;
>>>> +
>>>> +    if (__led_need_regulator_update(led_cdev, brightness)) {
>>>> +
>>>> +        if (brightness != LED_OFF)
>>>> +            rc = regulator_enable(led_cdev->regulator);
>>>> +        else
>>>> +            rc = regulator_disable(led_cdev->regulator);
>>>> +        if (rc)
>>>> +            return rc;
>>>> +
>>>> +        led_cdev->regulator_state = (brightness != LED_OFF);
>>>> +    }
>>>> +    return 0;
>>>> +}
>>> Let's have these function names without leading underscores.
>> OK.
>>>>    static int __led_set_brightness(struct led_classdev *led_cdev,
>>>>                    enum led_brightness value)
>>>>    {
>>>> @@ -115,6 +142,8 @@ static void set_brightness_delayed(struct
>>>> work_struct *ws)
>>>>        if (ret == -ENOTSUPP)
>>>>            ret = __led_set_brightness_blocking(led_cdev,
>>>>                        led_cdev->delayed_set_value);
>>>> +    __led_handle_regulator(led_cdev, led_cdev->delayed_set_value)
>>> If you called it from __led_set_brightness() and
>> We cannot call it from __led_set_brightness() because it is supposed not
>> to block.
> You're right. The problematic part is that with regulator handling
> we cannot treat the whole brightness setting operation uniformly
> for brightness_set op case, i.e. without mediation of a workqueue.
>
> Now you have to fire workqueue in led_set_brightness_nopm()
> even for brightness_set() op path, if regulator state needs update.
> This is ugly and can be misleading. Can be also error prone and
> have non-obvious implications for software blink state transitions.

Taking your queue I reworked the series to take better care of the 
concurrency issues.

I believe it's in better shape right now.

>
> I think we would first need to improve locking between the workqueue
> and led_timer_function(). I proposed a patch [0] over a year
> ago.

I tried the patch and get a lot of warning because of triggers on 
storage devices.

Making led_set_brightness() not callable from a IRQ context, is probably 
not the right approach anymore.


JJ

>
> Only then we could think of adding another asynchronous dependency
> to the brightness setting chain.
>
> [0] https://lkml.org/lkml/2018/1/17/1144
>
