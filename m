Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB00A16BA9
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 21:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfEGTta (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 15:49:30 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55436 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfEGTt3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 15:49:29 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47JnPRN081681;
        Tue, 7 May 2019 14:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557258565;
        bh=tn/NG9hXqKtHrk1FyZp7G/p72hFeCY3JPGWWLqj5p50=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=G3FN/OQIOnXYV8g/3Q1b8Ti50dXs9otfTqQ8fVd7tsTGXVll2yVSskn+vUrsw1Rte
         dX8u/8FPYnx/hqw6th+7gDSiZ/cdB5MfMLCuaASdv/t7ibq9ydmEX/jSR6G7cyduqX
         yVgVezWmeB8kPg8IfvLTl2zWRnfdXulRP9Q58eTc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47JnPeB077145
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 14:49:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 14:49:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 14:49:25 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47JnOKf113459;
        Tue, 7 May 2019 14:49:24 -0500
Subject: Re: [PATCH v3 0/7] LMU Common code intro
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
 <bc5756ac-b383-dac3-4a45-c0ace03ce9ec@gmail.com>
 <bf6768b6-2795-5904-15e1-75109a694fcd@ti.com>
 <2f786e83-0776-9bcb-a485-6e03c8db87ce@gmail.com>
 <c3a8be67-a3c3-60d3-aeed-4ef36f72f164@ti.com>
 <0b23f5f2-5352-c281-62e2-8286584bc63c@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <10771435-f8ca-deb8-bdce-648e5adab7c6@ti.com>
Date:   Tue, 7 May 2019 14:49:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0b23f5f2-5352-c281-62e2-8286584bc63c@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/7/19 2:47 PM, Jacek Anaszewski wrote:
> On 5/7/19 9:29 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 5/7/19 2:13 PM, Jacek Anaszewski wrote:
>>> On 5/7/19 9:06 PM, Dan Murphy wrote:
>>>> I have posted v4 with requested corrections plus I have an additional patchset that is based off of this patch set
>>>> for the LM36274.
>>>
>>> Yes, I've seen it but it was quite late. Let it receive
>>> fair testing.
>>>
>>
>> OK do you want me to combine both patchsets?  Or leave them separated?
> 
> If that one for LM36274 still applies cleanly there is no need
> to resend.
> 

It did not.  There were conflicts with the file name change as well as the Kconfig rearrangement


>>
>>>> I can post that as well and we can present everything for 5.3
>>>>
>>>> Maybe even the base MC FW ;)
>>>
>>> Is it somehow related?
>>>
>>
>> No
> 
> I presume there will be also another approach to MC FW (see [0]).
> It would be indeed nice to conclude it somehow for 5.3.
> 
> [0] https://www.spinics.net/lists/linux-leds/msg12166.html
> 

I am not seeing that change the directory structure for grouping LED modules in one colors directory.

I will move this conversation to that thread.

Dan
