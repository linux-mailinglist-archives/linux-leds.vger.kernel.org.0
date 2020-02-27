Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0DB1718C5
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2020 14:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgB0Nel (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Feb 2020 08:34:41 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56496 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbgB0Nel (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2020 08:34:41 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RDYaqZ074222;
        Thu, 27 Feb 2020 07:34:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582810476;
        bh=FW5GmNYAapO5oyOkSjoIqeKPvH9KeeTBzFhDoHz5tsg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=E1ExY1mNZQrNXQxf2o2LrStoQEtR2GymftqZEmOSwKkRW0dh12a+zIG5S/FwDpzJF
         eMZbLU5ZKt3/QB638zs+mee4ro7g+XoINC2HtLWDMoYZCCNTrgGtDYCaTi0dlwcruj
         wB6PfJqBq6SQaEBnYh2xJnTRVA4qHJGVoWVHXibg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RDYaG8062925
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Feb 2020 07:34:36 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 07:34:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 07:34:36 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RDYa1Q068024;
        Thu, 27 Feb 2020 07:34:36 -0600
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
To:     Pavel Machek <pavel@denx.de>, <dmurphy@ti.com>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com> <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
 <20200227105808.GA27003@duo.ucw.cz> <20200227124329.GA994747@kroah.com>
 <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <53a0af43-abaf-5936-9e23-3c7e71c3e10a@ti.com>
Date:   Thu, 27 Feb 2020 07:29:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Removing GKH

On 2/27/20 7:07 AM, Dan Murphy wrote:
> Pavel
>
> On 2/27/20 6:43 AM, Greg KH wrote:
>> On Thu, Feb 27, 2020 at 11:58:08AM +0100, Pavel Machek wrote:
>>> Hi, Jacek!
>>>
>>> (and thanks for doing this).
>>>
>>>> We have here long lasting discussion related to LED multicolor class
>>>> sysfs interface design. We went through several iterations and worked
>>>> out the solution with individual file per each color sub-LED in the
>>>> color directory as shown below:
>>>>
>>>> /sys/class/leds/<led>/colors/<color>_intensity
>>>>
>>>> This is in line with one-value-per-file sysfs rule, that is being
>>>> frequently highlighted, and we even had not so long ago a patch
>>>> for led cpu trigger solving the problem caused by this rule not
>>>> being adhered to.
>>> Yep. One of the problems is that it is nice to change all the hardware
>>> channels at once to produce color (it is often on i2c -- and slow), so
>>> current proposals use "interesting" kind of latching.
>>>
>>>> Now we have the voice below bringing to attention another caveat
>>>> from sysfs documentation:
>>>>
>>>> "it is socially acceptable to express an array of values of the same
>>>> type"
>>>>
>>>> and proposing the interface in the form of two files:
>>>>
>>>> channel_intensity (file containing array of u32's)
>>>> channel_names (usually containing "red green blue")
>>> And thus I want to have it in one file, so it is naturaly atomic. RGB
>>> leds with 3 channels are common; I have not user yet, but there are
>>> RGBW with 4 channels (and some more exotic stuff). I don't expect to
>>> have more than 5 channels.
>
> This is not an accurate statement.  Right now a user can have up to 8 
> channels to cover all the LEDs defined in the LED core
>
> And if the led_colors array expands then this array can expand.
>
> We have no control on how many entries the user will put in their DT 
> so again this number is completely arbitrary.
>
> Dan
>
The more I think about my above statement it is actually worse to do the 
arrays.  What checks will we have to implement that the DT won't define 
an array like this

[red green blue white red green white IR blue yellow]

This array is unbounded at this point.  The sysfs framework will not 
allow creating files under the directory with the same name so we can 
bound this to 1 LED color to a file and there will be no duplicates.

Sure we can NACK DT's that do create unbounded color arrays but that 
means we would have to review every DT file that would add a LED node.

What is expected and what is exposed as capability are two different things.

We don't expect developers to have more then 5 channels but if given the 
capabilities of doing it eventually it will be done and the framework 
will break.

Dan

