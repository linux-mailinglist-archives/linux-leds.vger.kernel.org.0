Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAA0D1D89
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 02:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731959AbfJJAnf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 20:43:35 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41122 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731542AbfJJAne (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 20:43:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A0hTsr118568;
        Wed, 9 Oct 2019 19:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570668209;
        bh=Yxcoi5EtNXabhjep2Y1KNRL8XZbLwiQgniLFoGc+Jhg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OdyqiHvnQzZqyossQxz3sx4kdIAR8VUP6BgxA3SmmHqR/uxK23T0HrTnaq/cZ6A3V
         j5Oa4KdlAc+mCginCMsMUyWVujETpxXKj7/LAy1rCqME9es7UbdOZIRZ9VpDe7DSHm
         ymKMUsbpqGwQdvDCDVQ/qbCjWcKxfWXt5OPygy2s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A0hT2N004540
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 19:43:29 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 19:43:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 19:43:29 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A0hTT9004462;
        Wed, 9 Oct 2019 19:43:29 -0500
Subject: Re: [PATCH v11 04/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20191008204800.19870-1-dmurphy@ti.com>
 <20191008204800.19870-5-dmurphy@ti.com>
 <CAOCOHw5uQL56T_DcZA47721yS1tLsp9cyUEdmiWr+Ccfh7YpRQ@mail.gmail.com>
 <d6b68a79-235a-0a9b-bbf3-519571646eff@ti.com> <20191009232539.GB571@minitux>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1b18570f-a5ac-fb34-aed9-7d8422df7e6d@ti.com>
Date:   Wed, 9 Oct 2019 19:43:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009232539.GB571@minitux>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Bjorn

On 10/9/19 6:25 PM, Bjorn Andersson wrote:
> On Wed 09 Oct 13:44 PDT 2019, Dan Murphy wrote:
>
>> Bjorn
>>
>> On 10/9/19 3:11 PM, Bjorn Andersson wrote:
>>> On Tue, Oct 8, 2019 at 1:49 PM Dan Murphy <dmurphy@ti.com> wrote:
>>>> Introduce a multicolor class that groups colored LEDs
>>>> within a LED node.
>>>>
>>>> The multi color class groups monochrome LEDs and allows controlling two
>>>> aspects of the final combined color: hue and lightness. The former is
>>>> controlled via <color>_intensity files and the latter is controlled
>>>> via brightness file.
>>>>
>>> Thanks for making progress on this, it's been the one outstanding
>>> question mark for the long overdue respin of the Qualcomm LPG driver.
>>> But while it works for the LPG, in that it has outputs named "RGB" I
>>> have boards with "generic" LED drivers that are connected to RGB LEDs.
>>> So per your proposed solution we would need to add the additional
>> You don't have to add the MC class to those drivers.  This is an optional
>> framework but if you wanted to use the framework for specific devices then
>> yes you would need to add that support. This is why I did the LP55xx patches
>> to demonstrate the feasibility since the LP50xx has the MC class
>> intelligence already.
>>
> Correct me if I've misunderstood something, but if I have a product
> using e.g. lm3533 connected to an RGB LED then the correct way to
> represent this towards userspace is to introduce the MC class in the
> lm3533 LED driver, no?
>
Not necessarily.  If the RGB LED is to be used as a RGB module and not 
as independent LEDs.

For instance on smartphones if you had that RGB module connected to the 
LM3533 and needed to mix colors to give different status indicators then 
yes you would use the MC class.  As the MC class presents and treats the 
module as a single LED with individual color mixing control knobs.

If you were using each LED for a separate use cases then you would want 
to present these as individual LEDs as done today.


>> The LP55xx driver can register to the LED class and/or the MC LED class
>> pending on the DT organization.
>>
> Understood.
>
>> I don't plan on going through all of TI's RGB drivers and retrofitting them
>> to the MC class.  I do have to update the GPIO LED driver to use the class
>> but that work is still pending.
>>
>> I may also update the Motorola PCAP driver as well since I have a Droid4 to
>> test.
>>
> My concern with this is that being connected to a RGB LED is not a
> property of the controller, but the system design and the proposed
> implementation makes it a property of each controller.
>
> I'm not saying that the proposed path is wrong, I'm saying that we have
> 83 files named leds-*.c in drivers/leds and this adaption needs to
> happen on each one.

Agreed.  I would expect the adoption to be done on a case by case basis 
driven by usage and need.


>
>
> And I'm not saying I expect you to do this.

Phew.  I did not think you were. I will only convert drivers that I can 
could test.


>
>>> mc_class handling to every single LED driver that might be used to
>>> sink current into an RGB LED.
>>>
>>> I also don't see anything preventing hardware designers from feeding
>>> single RGB LEDs from multiple different LED controllers, something the
>>> current proposal would prohibit.
>> What do you mean by a single RGB LED? Are you referring to a RGB module?
>>
>> http://wiki.sunfounder.cc/index.php?title=RGB_LED_Module
>>
> Yes
>
>> There is no prevention for HW designers to put a driver on each LED output
>> but I am not sure why they would incur
>>
>> the additional BOM cost seems quite silly unless you have an unlimited
>> budget ;)
>>
> So if you have a system with e.g. 8 PWM channels on one PMIC and a
> single PWM available on a different PMIC then you're saying that the
> hardware guys would be silly to believe that they can drive 3 RGB LEDS
> off this?

OK I must have removed my question to you on presenting a use case.   
Grouping LEDs across multiple devices would an issue yes but we would 
need a design or hardware to develop a good solution.


>
>> If they did design the system that way then the SW would need to revert back
>> to the standard LED class as it is done today.
>>
> If that is the agreed upon design then I'll continue to adapt my LED
> drivers to the MC class.

For now this is the basic design. We are willing to take other 
suggestions.  We appreciate the feedback.

Dan


