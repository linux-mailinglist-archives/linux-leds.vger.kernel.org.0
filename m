Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4173DAF7A3
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 10:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfIKIUi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 04:20:38 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47896 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfIKIUi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 04:20:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8B8KXQD081400;
        Wed, 11 Sep 2019 03:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568190033;
        bh=6hgB10uBVZK0rQIzi+iHhmekBmMluywkDWdYmBF2pbA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GSn9RC/kiv63g6ebEZZiH40+Yc+zjCiYNkgc90yX1HB6fjg5bdgmIGHND+vHYBsW/
         JMfJcVRRcez0EiFoo8dlaSi8zAbcOc2pbTEThHV5mZIf+tGCXA0/rHFOFEE6AIoxjq
         K1K6Ia992JEtGEidJ+83RyJqLfsuk1JiQEUiZPAE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8B8KXBC062348
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Sep 2019 03:20:33 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 03:20:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 03:20:33 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8B8KVsY087312;
        Wed, 11 Sep 2019 03:20:32 -0500
Subject: Re: [RESEND,v2 2/2] leds: tlc591xx: Use the OF version of the LED
 registration function
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <dmurphy@ti.com>
CC:     <tomi.valkeinen@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190910133814.10275-1-jjhiblot@ti.com>
 <20190910133814.10275-3-jjhiblot@ti.com>
 <69b5adc1-08fd-a0bd-b5b7-3943d8027253@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <75d93001-9403-4ac4-948f-889b9ca4fa1b@ti.com>
Date:   Wed, 11 Sep 2019 10:20:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <69b5adc1-08fd-a0bd-b5b7-3943d8027253@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 10/09/2019 22:08, Jacek Anaszewski wrote:
> Hi Jean,
>
> Thank you the patch.
>
> On 9/10/19 3:38 PM, Jean-Jacques Hiblot wrote:
>> The driver parses the device-tree to identify which LED should be handled.
>> Since the information about the device node is known at this time, we can
>> provide the LED core with it. It may be useful later.
>>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> ---
>>   drivers/leds/leds-tlc591xx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
>> index 3d5a4b92f016..10764a62cb71 100644
>> --- a/drivers/leds/leds-tlc591xx.c
>> +++ b/drivers/leds/leds-tlc591xx.c
>> @@ -207,7 +207,7 @@ tlc591xx_probe(struct i2c_client *client,
>>   		led->led_no = reg;
>>   		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
>>   		led->ldev.max_brightness = LED_FULL;
>> -		err = devm_led_classdev_register(dev, &led->ldev);
>> +		err = devm_of_led_classdev_register(dev, child, &led->ldev);
> devm_of_led_classdev_register() has been replaced with
> devm_led_classdev_register_ext() recently. Do you have some specific
> reason for passing OF node to the LED registration function?

Not anymore at this point.

I used the OF because the other patchset I posted (leds: Add control of 
the voltage/current regulator to the LED core) uses the of_node to find 
a regulator in the node of the LED. Since the regulator stuff is going 
to need some rework, we can drop this patch.

Thanks

JJ

> Currently this is beneficial only for generic LED name composition
> mechanism basing on 'function' and 'color' DT properties so if you
> want you can convert the driver to that. Please compare such recent
> conversions in linux-leds.git for-next branch [0][1].
>
>>   		if (err < 0) {
>>   			dev_err(dev, "couldn't register LED %s\n",
>>   				led->ldev.name);
>>
> [0]
> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?h=for-next&id=a50ff28348934913c46feb7945571329e46c70b3
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?h=for-next&id=4dcbc8f8c59f4b618d651f5ba884ee5bf562c8de
>
