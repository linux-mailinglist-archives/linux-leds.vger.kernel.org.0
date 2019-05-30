Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D980B30368
	for <lists+linux-leds@lfdr.de>; Thu, 30 May 2019 22:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfE3UnQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 May 2019 16:43:16 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49200 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfE3UnP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 May 2019 16:43:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4UKhA0c027055;
        Thu, 30 May 2019 15:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559248990;
        bh=B9SWgo0/WloUHsixDrCVazV78eQLtPBTNXvf8qsRtFQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=q+Z6/JolU9jagNygOmQvbCvQ+4EHs7yivdf0A9qCRYkH5yuIDyj5qwh3hhbRviVuD
         9a7LJeHzkjUU6gGKzymAb5oj5D68YhqOHhYDiu52NxQBqbsUlRf4JpshhwicTK6jFh
         7QGmm7t2xK0jMgP8mI2S9qNEguRyqWbsGrA4nDO0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4UKhAW1001723
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 May 2019 15:43:10 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 30
 May 2019 15:43:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 30 May 2019 15:43:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4UKh9dJ008838;
        Thu, 30 May 2019 15:43:09 -0500
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com> <20190527103355.GA5287@amd>
 <522728b0-147b-3708-fea1-88a895491e05@ti.com>
 <34dbfab0-0dd4-cf9a-ed86-a74363981077@ti.com> <20190530194006.GA22367@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2a81ad36-4c6a-9815-7c8e-018985c5db5c@ti.com>
Date:   Thu, 30 May 2019 15:43:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530194006.GA22367@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 5/30/19 2:40 PM, Pavel Machek wrote:
> On Tue 2019-05-28 06:34:47, Dan Murphy wrote:
>> Pavel
>>
>> On 5/27/19 7:45 PM, Dan Murphy wrote:
>>> Pavel
>>>
>>> On 5/27/19 5:33 AM, Pavel Machek wrote:
>>>> On Thu 2019-05-23 14:08:12, Dan Murphy wrote:
>>>>> Add a documentation of LED Multicolor LED class specific
>>>>> sysfs attributes.
>>>>>
>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>> ---
>>>>>    .../ABI/testing/sysfs-class-led-multicolor    | 57
>>>>> +++++++++++++++++++
>>>>>    1 file changed, 57 insertions(+)
>>>>>    create mode 100644
>>>>> Documentation/ABI/testing/sysfs-class-led-multicolor
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor
>>>>> b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>>>> new file mode 100644
>>>>> index 000000000000..2f102ede258b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>>>> @@ -0,0 +1,57 @@
>>>>> +What:        /sys/class/leds/<led>/colors/sync_enable
>>>>> +Date:        April 2019
>>>> I believe I suggested more reasonable interface. Why not use that?
>>>>
>>> Can you please provide the reference to your interface?
>>>
>> I think I found the suggestion [0].  Assuming that was the suggestion it
>> violates the kernel 1 value/file and there was agreement that this interface
>> had value. In testing the interface, it made sense to be able to
> 1 value/file is actually slightly more complex rule:
>
> Attributes should be ASCII text files, preferably with only one value
> per file. It is noted that it may not be efficient to contain only one
> value per file, so it is socially acceptable to express an array of
> values of the same type.
>
> See sysfs.txt. Proposed "sync_enable" is ugly enough, and the values
> really are array of values of same type, so we should be ok with nicer
> interface.

sync_enable is a binary input 0 or 1, but I could change that to ASCII 
"enabled/disabled".  And the sole purpose of this file is to enable or 
disable the synchronization of the grouped monochrome color LED 
brightness settings within that given directory.  So not sure why the 
sync_enable is ugly since it is meant to enable a feature of the class.  
Honestly I could drop the whole sync feature but I have found value in 
this interface through my testing both with a pulsing script I wrote and 
the notint.py you wrote.  This feature is meant for slower processors or 
processes with low priority that could be interrupted or switched out 
during writing the LED and cause LED color flicker.  Priming the colors 
and then updating all the available LEDs in the group in the kernel 
space with a single write to the sync file is a little more intuitive.  
I could change both the sync and sync_enable to module_params instead.

After mulling over the proposed solution of passing in the array of 
values I came to the conclusion this is actually more complicated than 
it needs to be and this implementation is not flexible.

There would need to be additional files that need to present information 
to the user space on what LEDs available, how many LEDs are available 
and what the LED array order is.  The user interface cannot always 
assume that the array is RGB.

There could be RGBW, RGBA, RGBWA, GBW or WIR or any combination of 
varying LED colors.  The interface that is proposed would need to have a 
varying array as the input.

I have posted v4 of the documentation of this patchset with updated 
sysfs documentation and ABI description.

Dan

>
> Best regards,
> 									Pavel
