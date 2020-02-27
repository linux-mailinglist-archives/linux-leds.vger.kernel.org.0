Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9F58171850
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2020 14:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgB0NMi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Feb 2020 08:12:38 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41870 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgB0NMi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2020 08:12:38 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RDCWwU125508;
        Thu, 27 Feb 2020 07:12:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582809152;
        bh=pLxe6jHwdRx27qSzO8jEP+RGMhYtXLcs0clPO3xJpWE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=L7d9ErvDbnBViQ0cdy9mUdyVhtaAcNBwsfXvFE9UX+6mkLqgNTXlckwj/7i18P2BC
         TWCsVd7eIvAbpmZ1rKvCMeofyBv9G0dNAYKNo5gDpyt2vP3bGD8FLutzWrq/StAWTd
         08SK+bIBytRtDmX+sXtWjeFDO3n6BSj+suH0qAfM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RDCWZ2046353;
        Thu, 27 Feb 2020 07:12:32 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 07:12:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 07:12:31 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RDCVJk026074;
        Thu, 27 Feb 2020 07:12:31 -0600
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
To:     Greg KH <gregkh@linuxfoundation.org>, Pavel Machek <pavel@denx.de>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com> <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
 <20200227105808.GA27003@duo.ucw.cz> <20200227124329.GA994747@kroah.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
Date:   Thu, 27 Feb 2020 07:07:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227124329.GA994747@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 2/27/20 6:43 AM, Greg KH wrote:
> On Thu, Feb 27, 2020 at 11:58:08AM +0100, Pavel Machek wrote:
>> Hi, Jacek!
>>
>> (and thanks for doing this).
>>
>>> We have here long lasting discussion related to LED multicolor class
>>> sysfs interface design. We went through several iterations and worked
>>> out the solution with individual file per each color sub-LED in the
>>> color directory as shown below:
>>>
>>> /sys/class/leds/<led>/colors/<color>_intensity
>>>
>>> This is in line with one-value-per-file sysfs rule, that is being
>>> frequently highlighted, and we even had not so long ago a patch
>>> for led cpu trigger solving the problem caused by this rule not
>>> being adhered to.
>> Yep. One of the problems is that it is nice to change all the hardware
>> channels at once to produce color (it is often on i2c -- and slow), so
>> current proposals use "interesting" kind of latching.
>>
>>> Now we have the voice below bringing to attention another caveat
>>> from sysfs documentation:
>>>
>>> "it is socially acceptable to express an array of values of the same
>>> type"
>>>
>>> and proposing the interface in the form of two files:
>>>
>>> channel_intensity (file containing array of u32's)
>>> channel_names (usually containing "red green blue")
>> And thus I want to have it in one file, so it is naturaly atomic. RGB
>> leds with 3 channels are common; I have not user yet, but there are
>> RGBW with 4 channels (and some more exotic stuff). I don't expect to
>> have more than 5 channels.

This is not an accurate statement.  Right now a user can have up to 8 
channels to cover all the LEDs defined in the LED core

And if the led_colors array expands then this array can expand.

We have no control on how many entries the user will put in their DT so 
again this number is completely arbitrary.

Dan

> Writing 3 or 4 or 5 numbers all at once in a single sysfs file to
> represent a single output should be fine.
> thanks,
>
> greg k-h
