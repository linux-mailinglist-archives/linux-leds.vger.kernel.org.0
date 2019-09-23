Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B948BB67E
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 16:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732601AbfIWOTE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 10:19:04 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55670 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbfIWOTE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 10:19:04 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NEJ02l078946;
        Mon, 23 Sep 2019 09:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569248340;
        bh=4HrGNJ0G06qOuyWPwNF7oHzx92HidaHXsQc7BzZ0wDk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Z2/E6kP4ZsKa6S7QBBca3S/itsvmN84EWQlap4RwVKw+aF9AUu2LBN2JC4wqZMABC
         rCMu6ghdfqgelxlZlIaHfqzLVzC3xawAzjLlF7l1A3Fc743++uorZeaS9BLCb2WFPH
         57nKsNrzCQCSKhpa7bA7u8Ko4/jhj4QQhsnCqdYo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NEJ08p040870
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 09:19:00 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 09:19:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 09:18:54 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NEJ09j015620;
        Mon, 23 Sep 2019 09:19:00 -0500
Subject: Re: [PATCH v8 1/9] leds: multicolor: Add sysfs interface definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-2-dmurphy@ti.com>
 <ea294ad4-d340-3677-eab0-6138968cfe0e@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e8b19608-91be-ac9f-9aa2-2027993df3d7@ti.com>
Date:   Mon, 23 Sep 2019 09:23:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ea294ad4-d340-3677-eab0-6138968cfe0e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

Thanks for the review

On 9/21/19 5:55 AM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/20/19 7:41 PM, Dan Murphy wrote:
>> Add a documentation of LED Multicolor LED class specific
>> sysfs attributes.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..39fc73becfec
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,43 @@
>> +What:		/sys/class/leds/<led>/brightness
>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Writing to this file will update all LEDs within the group to a
>> +		calculated percentage of what each color LED intensity is set
>> +		to. The percentage is calculated via the equation below:
>> +
>> +		led_brightness = requested_value * led_color_intensity/led_color_max_intensity
> How about:
>
> led_brightness = brightness * <color>_intensity/<color>_max_intensity

Ack


>> +
>> +		For additional details please refer to
>> +		Documentation/leds/leds-class-multicolor.rst.
>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/max_brightness.
>> +
>> +What:		/sys/class/leds/<led>/colors/<led_color>_intensity
> s/led_color/color/

Ack


>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		The led_color directory is dynamically created based on the
>> +		colors defined by the registrar of the class.
>> +		The value for the led_color is defined in the
>> +		include/dt-bindings/leds/common.h. There is one directory per
>> +		color presented.  The intensity file is created under each
>> +		led_color directory and controls the individual LED color
>> +		setting.
> We no longer have led_color directories so this description needs
> to be adjusted.
>
> And I'd not mention where the colors are defined. This is documentation
> for the user, who does not need to know about implementation details.

I thought I updated this but I will re-write this

Ack


>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/colors/<led_color>_max_intensity.
>> +
>> +What:		/sys/class/leds/<led>/colors/<led_color>_max_intensity
>> +Date:		Sept 2019
>> +KernelVersion:	5.5
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read only
>> +		Maximum intensity level for the LED color, default is
>> +		255 (LED_FULL).
> Mentioning the default value here is pointless IMO. Userspace cannot
> change it anyway.
>
Ack


>> +
>> +		If the LED does not support different intensity levels, this
>> +		should be 1.
>>
> This is less relevant for MC class, and also it is rather obvious.
> I'd skip this sentence.
>
Ack


Dan

