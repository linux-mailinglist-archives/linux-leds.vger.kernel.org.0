Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80C31F3A09
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2020 13:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgFILpm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Jun 2020 07:45:42 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48420 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728918AbgFILpm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Jun 2020 07:45:42 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059Bjb3M049355;
        Tue, 9 Jun 2020 06:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591703137;
        bh=k+VzXxTfqmHDJrIerrvlL+e7Yla0PQ5Spx/T9XF736Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EkPNXvcfPcWU8iz8Y5UynD0Y1gsiIo4ipdoexAbzvD/lcmwS8yIOZGpGj1TDIG4cL
         h/HtSiueZaK+vd8p2JdtLxPomb9f99UrGezKZhLTfagoIVMl+/8WtUVKi4S0+CfMag
         OxfZFJSO/gn/aCyXeVO9iuoXOow39VCgmWiXWr/Q=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059BjbgJ024784
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Jun 2020 06:45:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 06:45:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 06:45:37 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059Bjaji034938;
        Tue, 9 Jun 2020 06:45:36 -0500
Subject: Re: [PATCH v26 03/15] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-4-dmurphy@ti.com> <20200606155324.GA21130@amd>
 <92d71058-a75b-fd3f-59b1-5133be1c21b5@ti.com>
 <a8cb3d33-7a7d-82ee-e598-0f48368677cd@gmail.com>
 <02cf192f-1948-74a5-f2ef-6c2146422ecb@ti.com>
 <5bb77966-70d7-3331-1487-bb2af1b4b755@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <80bb24a5-fffb-73ef-e184-6664f47bcf24@ti.com>
Date:   Tue, 9 Jun 2020 06:45:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5bb77966-70d7-3331-1487-bb2af1b4b755@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 6/8/20 2:41 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 6/8/20 4:34 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 6/6/20 2:59 PM, Jacek Anaszewski wrote:
>>> Dan,
>>>
>>> On 6/6/20 6:39 PM, Dan Murphy wrote:
>>>> Pavek
>>>>
>>>> Thanks for the review
>>>>
>>>> On 6/6/20 10:53 AM, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>> Introduce a multicolor class that groups colored LEDs
>>>>>> within a LED node.
>>>>>>
>>>>>> The multi color class groups monochrome LEDs and allows 
>>>>>> controlling two
>>>>>> aspects of the final combined color: hue and lightness. The 
>>>>>> former is
>>>>>> controlled via the intensity file and the latter is controlled
>>>>>> via brightness file.
>>>>>>
>>>>>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor 
>>>>>> b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>>>>> new file mode 100644
>>> [...]
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -9533,6 +9533,14 @@ F: Documentation/devicetree/bindings/leds/
>>>>>>   F:    drivers/leds/
>>>>>>   F:    include/linux/leds.h
>>>>>> +LED MULTICOLOR FRAMEWORK
>>>>>> +M:    Dan Murphy <dmurphy@ti.com>
>>>>>> +L:    linux-leds@vger.kernel.org
>>>>> I'd like to be mentioned here, too. "M: Pavel Machek
>>>>> <pavel@ucw.cz>". And I'm not sure if I should be taking MAINTAINER
>>>>> file update through a LED tree. Should definitely go to separate
>>>>> patch.
>>>>
>>>> Oh definitely.  I thought it was implied that you and Jacek are 
>>>> both Maintainers as well.
>>>>
>>>> I will add you but will wait to see if Jacek wants to be added.
>>>
>>> Actually I don't think that we need to add this separate entry
>>> for LED multicolor class. This is still under LED subsystem,
>>> and I didn't add anything for LED class flash.
>>
>> We only need this because I am not a maintainer of the LED flash 
>> class or the LED class.
>>
>> But since I authored the code it only made sense to add me as a 
>> maintainer for this specific class.
>>
>> You are one of the maintainers of the LED subsystem and wrote the 
>> Flash class so your maintainer ship is implied and you will be CC'd 
>> for all patches.
>>
>> This will not be the case for the multi color class
>
> scripts/get_maintainer.pl returns yourself as well for LED drivers.
> But it's up to you.
>
I dropped it.

Dan

