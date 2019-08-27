Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9B5A9F0CF
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 18:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbfH0Qy3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 12:54:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33358 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfH0Qy3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Aug 2019 12:54:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RGsNOm033976;
        Tue, 27 Aug 2019 11:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566924863;
        bh=HC0VQo87xCYzvz3EczML+vIkBhy+KbWR5luZ0gk+F3M=;
        h=From:Subject:To:CC:References:Date:In-Reply-To;
        b=gHNdDy1DOWwXGWbe5bRGyidRam0qnRYHduVkK7b89Ik/h47sfVZ3slXmhAdwowLod
         auMGs0lZ3RrENmyqgwFsibXmVwfD7ZqnWIKmm5uX86Ys+3HKZaB6AQGTiLc01DIF1M
         oFyAke1aVwtzPZHy4LxyOZdyXPFM93n2Aok+1KsA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RGsN4I069629
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Aug 2019 11:54:23 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 11:54:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 11:54:22 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RGsMd0113429;
        Tue, 27 Aug 2019 11:54:22 -0500
From:   Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 1/9] leds: multicolor: Add sysfs interface definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-2-dmurphy@ti.com>
 <c451847b-d08e-19a2-281c-70ba46cff29a@gmail.com>
Message-ID: <bfcd15e3-ed94-fd16-9281-d49129c23abf@ti.com>
Date:   Tue, 27 Aug 2019 11:54:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c451847b-d08e-19a2-281c-70ba46cff29a@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

OK finally getting back to this.

On 7/29/19 3:45 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thank you for the v4.
>
> I have a bunch of comments below. Please take a look.
>
> On 7/25/19 8:28 PM, Dan Murphy wrote:
>> Add a documentation of LED Multicolor LED class specific
>> sysfs attributes.
>>
>> Signed-off-by: Dan Murphy<dmurphy@ti.com>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    | 67 +++++++++++++++++++
>>   1 file changed, 67 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..59839f0eae76
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,67 @@
>> +What:		/sys/class/leds/<led>/brightness
>> +Date:		Sept 2019
>> +KernelVersion:	TBD
>> +Contact:	Dan Murphy<dmurphy@ti.com>
>> +Description:	read/write
>> +		The multicolor class will redirect the device drivers call back
>> +		function for brightness control to the multicolor class
>> +		brightness control function.
>> +
>> +		Writing to this file will update all LEDs within the group to a
>> +		calculated percentage of what each color LED in the group is set
>> +		to.  Please refer to the leds-class-multicolor.txt in the
>> +		Documentation directory for a complete description.
> Instead of redirecting the reader to led-class-multicolor.txt I'd prefer
> to have at least the formula to calculate the colors laid out here.
> Aside of that - it is more helpful to have a full path to the referenced
> file.

Ack


>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/max_brightness.
>> +
>> +What:		/sys/class/leds/<led>/colors/color_mix
>> +Date:		Sept 2019
>> +KernelVersion:	TBD
>> +Contact:	Dan Murphy<dmurphy@ti.com>
>> +Description:	read/write
>> +		The color_mix file allows writing all registered multicolor LEDs
>> +		virtually at the same time.  The value(s) written to this file
> I'd drop parentheses form "value(s)". Multi color LED class device is
> supposed to always have more then one LED. And if I understand it
> correctly we have to pass intensities of all colors supported by LED
> multicolor class device here, even we're changing single one.

Yes that is true.


>> +		contain the intensity values for each multicolor LED within
>> +		the colors directory.  The color indexes are reported in the
>> +		color_id file as defined in this document.
> This is a bit misleading. It sounds as if single color_id file would be
> reporting more than one index.
>
>> +		Please refer to the leds-class-multicolor.txt in the
>> +		Documentation directory for a complete description.
> Here, similarly as for brightness, I would prefer to have complete
> documentation of this file.
>
> How about:
>
> The values written to this file should contain the intensity values of
> each multicolor LED within the colors directory. The index of given
> color is reported by the color_id file present in colors/<color>
> directory. The index determines the position in the sequence of
> intensities on which the related intensity should be passed to this
> file.
>
> And here we could have the examples from leds-class-multicolor.txt.

I prefer to keep the examples in the leds-class-multicolor.rst.

This is an ABI document not a document describing the code.

I updated the doc to what you have above.

>> +
>> +What:		/sys/class/leds/<led>/colors/<led_color>/color_id
>> +Date:		Sept 2019
>> +KernelVersion:	TBD
>> +Contact:	Dan Murphy<dmurphy@ti.com>
>> +Description:	read only
>> +		This file when read will return the index of the color in the
>> +		color_mix.
>> +		Please refer to the leds-class-multicolor.txt in the
>> +		Documentation directory for a complete description.
>> +
>> +What:		/sys/class/leds/<led>/colors/<led_color>/intensity
>> +Date:		Sept 2019
>> +KernelVersion:	TBD
>> +Contact:	Dan Murphy<dmurphy@ti.com>
>> +Description:	read/write
>> +		The led_color directory is dynamically created based on the
>> +		colors defined by the registrar of the class.
>> +		The led_color can be but not limited to red, green, blue,
>> +		white, amber, yellow and violet.  Drivers can also declare a
> Instead of this vague sentence about the available colors I propose to
> maintain the list of supported colors in leds-class.rst or in a separate
> file and keep it in sync with the led_colors array. Then we could refer
> to that file here.

I would rather point to the file that contains the colors.  This way we 
don't have added documentation

maintenance to add a new color.


>
>> +		LED color for presentation.  There is one directory per color
> I'd not let drivers define their custom colors. It would entail issues
> related to lack of generic LED_COLOR_ID and DT parsing failure.

Ack

Dan

>
>> +		presented.  The brightness file is created under each
>> +		led_color directory and controls the individual LED color
>> +		setting.
>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/colors/<led_color>/max_intensity.
>> +
>> +What:		/sys/class/leds/<led>/colors/<led_color>/max_intensity
>> +Date:		Sept 2019
>> +KernelVersion:	TBD
>> +Contact:	Dan Murphy<dmurphy@ti.com>
>> +Description:	read only
>> +		Maximum intensity level for the LED color, default is
>> +		255 (LED_FULL).
>> +
>> +		If the LED does not support different intensity levels, this
>> +		should be 1.
>>
