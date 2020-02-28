Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D83817374A
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2020 13:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgB1MgC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Feb 2020 07:36:02 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35900 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1MgC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2020 07:36:02 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SCZvLX026580;
        Fri, 28 Feb 2020 06:35:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582893357;
        bh=hKyf8yrhdHOfHtUZrZr4yEtUWwcoQWtFRXXJCceaIA4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XZSoDepbtvkRU10B/SBGZTLiFSKkofs3goC2fUq60etnQJmkI8RecjV8wm+phShl0
         BJ29qm/X3i/aqRtR7+pHwqQxsJIszJin0DcKSU5zd7lnyscoS6iZ50Gz45kSnLO3eG
         r66C/L+D61qF31+M7wo5J3wkBA7DiNTRfBBioCl4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SCZvgl111677
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Feb 2020 06:35:57 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 06:35:57 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 06:35:57 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SCZv1P014045;
        Fri, 28 Feb 2020 06:35:57 -0600
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     Pavel Machek <pavel@denx.de>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com> <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
 <20200227105808.GA27003@duo.ucw.cz> <20200227124329.GA994747@kroah.com>
 <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
 <96a31ff6-5ecf-05a7-d61f-2804f2488d1b@gmail.com>
 <20200228074235.GA2900429@kroah.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <10206eff-ecbd-c625-1900-1a6d8ec8f633@ti.com>
Date:   Fri, 28 Feb 2020 06:30:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228074235.GA2900429@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Greg

On 2/28/20 1:42 AM, Greg KH wrote:
> On Thu, Feb 27, 2020 at 10:22:43PM +0100, Jacek Anaszewski wrote:
>> On 2/27/20 2:07 PM, Dan Murphy wrote:
>>> <snip>
>>> This is not an accurate statement.  Right now a user can have up to 8
>>> channels to cover all the LEDs defined in the LED core
>>>
>>> And if the led_colors array expands then this array can expand.
>>>
>>> We have no control on how many entries the user will put in their DT so
>>> again this number is completely arbitrary.
>> I believe that some of mechanisms that were devised for the most
>> recent implementation proposal of LED mc class will need
>> to be reused for the array approach. E.g. available_colors bitmask
>> will make the parsing resistant to duplicates.
>>
>> Of course LED multicolor DT node design should be applicable as well
>> to the array approach.
>>
>>>> Writing 3 or 4 or 5 numbers all at once in a single sysfs file to
>>>> represent a single output should be fine.
>>>> thanks,
>> Thank you for making this clear.
>>
>> Effectively, the way to go as I see it now is just moving from
>> colors directory to channel_intensity and channel_names files.
> Wait, we already have an interface for this and you want to create a
> competing one?  Why?  What's wrong with what you have now?
>
> Do you have a pointer to the Documentation/ABI/ entries that you have
> now that you feel do not work well?

Here is the proposal we have been working on for some time.

Series:

https://lore.kernel.org/patchwork/project/lkml/list/?series=427513

ABI Documentation and support code:

https://lore.kernel.org/patchwork/patch/1186194/

Dan

> thanks,
>
> greg k-h
