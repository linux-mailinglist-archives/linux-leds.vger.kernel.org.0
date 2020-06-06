Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070A71F07F2
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2020 18:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgFFQjQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Jun 2020 12:39:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52184 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgFFQjQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Jun 2020 12:39:16 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 056GdAlG058684;
        Sat, 6 Jun 2020 11:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591461550;
        bh=Ugkz7GYUu48jS3AIMTbMtgHcCWZimFbSV4I8Cr+DtBg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BU0izaRHATiWN35Wg2Df2Ox5hCwcgza3HRm5z2lGMOQc+netXofbEZICjHLhevZ+R
         HLi1/pIPXWNWMjCDSYN++udPRbsyzF2lf9+5lPNwmZYI8JgC86MXRTJCqTQuwvRlJi
         zijc/ZlmuluC4A8WxNxTclprd8QZ1p85SYF7NOeo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 056GdA1g080324
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 6 Jun 2020 11:39:10 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 6 Jun
 2020 11:39:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 6 Jun 2020 11:39:10 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 056Gd9Bv041871;
        Sat, 6 Jun 2020 11:39:10 -0500
Subject: Re: [PATCH v26 03/15] leds: multicolor: Introduce a multicolor class
 definition
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-4-dmurphy@ti.com> <20200606155324.GA21130@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <92d71058-a75b-fd3f-59b1-5133be1c21b5@ti.com>
Date:   Sat, 6 Jun 2020 11:39:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200606155324.GA21130@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavek

Thanks for the review

On 6/6/20 10:53 AM, Pavel Machek wrote:
> Hi!
>
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via the intensity file and the latter is controlled
>> via brightness file.
>>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..7d33a82a4b07
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,34 @@
>> +What:		/sys/class/leds/<led>/brightness
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Writing to this file will update all LEDs within the group to a
>> +		calculated percentage of what each color LED intensity is set
>> +		to. The percentage is calculated for each grouped LED via the
>> +		equation below:
>> +		led_brightness = brightness * multi_intensity/max_brightness
>> +
>> +		For additional details please refer to
>> +		Documentation/leds/leds-class-multicolor.rst.
>> +
>> +		The value of the color is from 0 to
>> +		/sys/class/leds/<led>/max_brightness.
> It is not too clear to me what "color" means here.
>
> It would be worth mentioning that this is single integer.

OK I will update this


>> +What:		/sys/class/leds/<led>/multi_index
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read
>> +		The multi_index array, when read, will output the LED colors
>> +		by name as they are indexed in the multi_intensity file.
> This should specify that it is array of strings.

Yeah this sounds better


>> +What:		/sys/class/leds/<led>/multi_intensity
>> +Date:		March 2020
>> +KernelVersion:	5.8
>> +Contact:	Dan Murphy <dmurphy@ti.com>
>> +Description:	read/write
>> +		Intensity level for the LED color within the array.
>> +		The intensities for each color must be entered based on the
>> +		multi_index array.
> I'd mention here that it is array of integers, and what the maximum
> values are.

Same here.  I will indicate max value cannot exceed max_brightness

But that was what the max_intensity file was for in prior patchsets.

>
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9533,6 +9533,14 @@ F:	Documentation/devicetree/bindings/leds/
>>   F:	drivers/leds/
>>   F:	include/linux/leds.h
>>   
>> +LED MULTICOLOR FRAMEWORK
>> +M:	Dan Murphy <dmurphy@ti.com>
>> +L:	linux-leds@vger.kernel.org
> I'd like to be mentioned here, too. "M: Pavel Machek
> <pavel@ucw.cz>". And I'm not sure if I should be taking MAINTAINER
> file update through a LED tree. Should definitely go to separate
> patch.

Oh definitely.  I thought it was implied that you and Jacek are both 
Maintainers as well.

I will add you but will wait to see if Jacek wants to be added.

I will separate this out and make it a separate patch


>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 9cdc4cfc5d11..fe7d90d4fa23 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>>   	  for the flash related features of a LED device. It can be built
>>   	  as a module.
>>   
>> +config LEDS_CLASS_MULTI_COLOR
>> +	tristate "LED MultiColor LED Class Support"
> "LED MultiColor Class Support"

OK.

Dan

>
> Best regards,
> 									Pavel
