Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB22EC8A5C
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 15:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfJBN7F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 09:59:05 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46796 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfJBN7F (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 09:59:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Dwqcj111590;
        Wed, 2 Oct 2019 08:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570024732;
        bh=RaDMxu07D9M++yaf5vgHDeabPM3lihqxOYytrbBSUU0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=s4hfO8XBCPZmABJZKz9xLcLV1xumo+2UHZ2+aNDDakouuzaZaCbuwZMrUk437umz5
         vJJjNFUrEhcWyXN1MrOJc/+9swQCw5J872R3gux1SIxbhBacPPqfup96xK3T3tOE7e
         atmDEnMg2+05Cf54/a6FST1u/zcePHJ8aUvZfG2o=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Dwqja096089
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 08:58:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 08:58:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 08:58:51 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92DwnDw091205;
        Wed, 2 Oct 2019 08:58:49 -0500
Subject: Re: [PATCH v7 1/5] leds: populate the device's of_node when possible
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-2-jjhiblot@ti.com>
 <f543e757-e000-6de4-694b-e75f388e5908@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <e9588e03-20d4-7e6d-e514-0b79dae12cce@ti.com>
Date:   Wed, 2 Oct 2019 15:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f543e757-e000-6de4-694b-e75f388e5908@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On 24/09/2019 23:03, Jacek Anaszewski wrote:
> Hi Jean,
>
> Thank you for rebasing the set
>
> On 9/18/19 4:57 PM, Jean-Jacques Hiblot wrote:
>> If initialization data is available and its fwnode is actually a of_node,
>> store this information in the led device's structure. This will allow the
>> device to use or provide OF-based API such (devm_xxx).
>>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   drivers/leds/led-class.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 647b1263c579..c2167b66b61f 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -276,8 +276,11 @@ int led_classdev_register_ext(struct device *parent,
>>   		mutex_unlock(&led_cdev->led_access);
>>   		return PTR_ERR(led_cdev->dev);
>>   	}
>> -	if (init_data && init_data->fwnode)
>> +	if (init_data && init_data->fwnode) {
>>   		led_cdev->dev->fwnode = init_data->fwnode;
>> +		if (is_of_node(init_data->fwnode))
>> +			led_cdev->dev->of_node = to_of_node(init_data->fwnode);
> It would be step backwards. You can do the conversion in the place of
> use i.e. in devm_led_get().

Could be done. But it would break another use case I have. I'm also 
working on the regulator support and for this one, of_node needs to be 
populated.

Is there a problem populating of_node if the LED is indeed described in 
the DT ?

JJ

>
>> +	}
>>   
>>   	if (ret)
>>   		dev_warn(parent, "Led %s renamed to %s due to name collision",
>>
