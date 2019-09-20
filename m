Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC27B8FC8
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 14:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408981AbfITM2g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 08:28:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42216 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406113AbfITM2g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 08:28:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KCSXIN097923;
        Fri, 20 Sep 2019 07:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568982513;
        bh=nE9H3GYPX50OkTC4fJZHCfiqTllBS2vIxWYseW0TEsE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JOzlTELDzsMA0j69dhIVDLNifj5dO5caECg+SaYHU8VBeFMKDVtx18TfkQP4zwW9r
         0eP4IPV+erKNz2LUHLNcDYri8BS9q/7wso8M3UJQHx9wj99QKrWkXoT+VHKyNGASt2
         IAyW3XxD0xFmk5opr6jrDFK7DDdFWJ/Megy9QxBk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KCSX1M007557
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 07:28:33 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 07:28:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 07:28:29 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KCSXtQ027841;
        Fri, 20 Sep 2019 07:28:33 -0500
Subject: Re: [PATCH v6 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190917175937.13872-1-dmurphy@ti.com>
 <20190917175937.13872-6-dmurphy@ti.com>
 <ff1d2ede-6bdf-8f73-9e89-0e990cce09a7@gmail.com>
 <e1de10a6-49ad-c7f2-9246-5bee29f58c80@ti.com>
 <045e1988-176c-b5ea-73cb-182b6210a3db@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b9aa67ce-50f5-c9d8-b3d1-f6eedc133876@ti.com>
Date:   Fri, 20 Sep 2019 07:31:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <045e1988-176c-b5ea-73cb-182b6210a3db@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/19/19 4:32 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/19/19 3:07 AM, Dan Murphy wrote:
>> Jacek
>>
>> On 9/18/19 4:27 PM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> I think Greg's guidance clarified everything nicely -
>>> we will avoid <color> sub-dirs in favour of prefixes
>>> to *intensity and *max_intensity.
>> Yes I will make the change accordingly.  It will simplify the code.
>>> Before you will send an update I have some improvement
>>> ideas regarding the remnants after the previous approach,
>>> where single color intensity update resulted in updating
>>> hardware state. Now the update will happen only on write to
>>> brightness file, so we will not need color_set/color_get ops
>>> anymore.
>> I left those call backs in specifically for the LP50xx. Otherwise the
>> LEDs are only updated when the brightness file is written.
>> The LP50xx has an engine that performs the intensity computation for the
>> specific LED.  So there is no call back to the MC FW for calculating the
>> intensity.
>>
>> The brightness and intensity are written directly to the device and the
>> MCU in the device does all the computations so you have real time update.
> You can still handle that in brightness_set op. You need to compare
> which color channels have changed and update them in hardware in
> addition to setting LEDn_BRIGHTNESS register.
>
> And yes - even updating a single color will need two operations:

If we kept the ops then the LP50xx device would only need one operation 
to the led intensity file to update the color.

> echo 231 >  colors/red_intensity // only cache the color in MC core
> echo 100 > brightness // do the actual hw update
And this is the way the LP55xx device works now.
>
> Note that brightness value doesn't have to be necessarily different
> from the previous one here, but writing brightness file will be needed
> to trigger the hw update.
>
>> For the LP55xx device the LEDs are only updated when the brightness file
>> is written.
>>
>> I think we can leave those call backs in if device driver or product
>> development teams would like to use them.
> I'd not do that - it will be confusing. We can accomplish everything
> in brightness_set{_blocking} op. It will have also the advantage of
> same ABI semantics across all devices. Otherwise we would need separate
> documentation for devices like LP50xx.

OK I am not going to argue this I will just remove the ops even though I 
don't agree.

Removing the ops will just make the LP50xx driver more complex then what 
it needs to be.

I will post v8 later today.

>
> I have also another question - what with linear vs logarithmic
> LP50xx brightness scale? I think we should make both options available
> to the userspace.

I have no requirements from customers to provide this scaling.

It can be an enhancement to the driver later if we get the request.

Dan

