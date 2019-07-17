Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0706BCCF
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 15:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfGQNOf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 09:14:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60750 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfGQNOf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 09:14:35 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HDEPVB051538;
        Wed, 17 Jul 2019 08:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563369265;
        bh=MVYQ4EwMJMXmcBaMpkvWQRFoUm35w+HQYW/PHcy1kFc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rWjPhmk9DU9HJIORujSb2McQa1FSgeWq54pLhFe2Nmw10zDo5kvu3QR3wsj/0yko6
         fKmuX1/Xm6BYWYj9IVi5gyiB62Be8rgNTpbAXeNZaMU6KMpGsveuojoPl08CzYWH9g
         WZUw35WR8ObV1Oez3ejRxxhta5AGluR9EZYHY6XY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HDEPmO039603
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Jul 2019 08:14:25 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 08:14:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 08:14:25 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HDENq3080895;
        Wed, 17 Jul 2019 08:14:23 -0500
Subject: Re: [PATCH v2 2/2] leds: Add control of the voltage/current regulator
 to the LED core
To:     Dan Murphy <dmurphy@ti.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-3-jjhiblot@ti.com>
 <9c17e9cc-8162-7b5d-2db9-d2bed20969c5@ti.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <3b8e5847-6859-d78d-6274-7a879557dcae@ti.com>
Date:   Wed, 17 Jul 2019 15:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9c17e9cc-8162-7b5d-2db9-d2bed20969c5@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On 15/07/2019 20:59, Dan Murphy wrote:
> JJ
>
> On 7/15/19 10:56 AM, Jean-Jacques Hiblot wrote:
>> A LED is usually powered by a voltage/current regulator. Let the LED 
>> core
>> know about it. This allows the LED core to turn on or off the power 
>> supply
>> as needed.
>
> This allows the LED core to turn on or off managed power supplies.
>
>
>>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---

>>       if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>>           ret = led_add_brightness_hw_changed(led_cdev);
>>           if (ret) {
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index 7107cd7e87cf..a12b880b0a2f 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -23,6 +23,33 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>>   LIST_HEAD(leds_list);
>>   EXPORT_SYMBOL_GPL(leds_list);
>>   +static bool __led_need_regulator_update(struct led_classdev 
>> *led_cdev,
>> +                    int brightness)
>> +{
>> +    bool new_state = (brightness != LED_OFF);
>> +
>> +    return led_cdev->regulator && led_cdev->regulator_state != 
>> new_state;
>> +}
>> +
>> +static int __led_handle_regulator(struct led_classdev *led_cdev,
>> +                int brightness)
>> +{
>> +    int rc;
>
> Should there be a check for the regulator pointer.
>
> If (!led_cdev->regulator)
>
>     return 0;

Not required because __led_need_regulator_update() returns false if 
led_cdev->regulator is NULL.

Thanks for the review

JJ

>
>
> Otherwise
>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
>
> <snip>
>
