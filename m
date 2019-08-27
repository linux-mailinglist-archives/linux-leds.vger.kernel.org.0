Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C459E997
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 15:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbfH0NhU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 09:37:20 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48058 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfH0NhU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Aug 2019 09:37:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RDbFZO095893;
        Tue, 27 Aug 2019 08:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566913035;
        bh=idSC7WAHIV2lQSz7AHnFlEGNVeMX3kh33tNpXiiWeAA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mIVcGmL2B4dROlbl6Kop5YOPkwC6BLDvQpCZ6TUDFRTtZ2oVhxt0RB3sskHhB9uZF
         6cvH1Cd9TPvtMJf1dfrm3y/FcRnZsFSyKVLqk6PBH1Dz4VSyRscCvpmoZbNqpW614u
         /2FawPwGfMGu3u8ZinuG/xatWCI0inhICM/O0LM4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RDbFtq061789
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Aug 2019 08:37:15 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 08:37:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 08:37:15 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RDbEpI074090;
        Tue, 27 Aug 2019 08:37:14 -0500
Subject: Re: [PATCH] leds: ti-lmu-common: Fix coccinelle issue in TI LMU
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190823195523.20950-1-dmurphy@ti.com>
 <4a1872e8-89a5-4bc4-6aa4-bcadbc48697a@gmail.com>
 <de1bb95d-d5ca-6f8f-e758-b03479091f99@ti.com>
 <48fc16c5-9f43-e5c3-e756-514f9f3eb254@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <12746d3e-e658-5ce6-5231-33005a74e549@ti.com>
Date:   Tue, 27 Aug 2019 08:37:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <48fc16c5-9f43-e5c3-e756-514f9f3eb254@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 8/26/19 2:34 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 8/26/19 4:53 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 8/24/19 10:18 AM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> Thank you for the patch.
>>>
>>> On 8/23/19 9:55 PM, Dan Murphy wrote:
>>>> Fix the coccinelle issues found in the TI LMU common code
>>>>
>>>> drivers/leds/leds-ti-lmu-common.c:97:20-29: WARNING: Unsigned
>>>> expression compared with zero: ramp_down < 0
>>>> drivers/leds/leds-ti-lmu-common.c:97:5-12: WARNING: Unsigned
>>>> expression compared with zero: ramp_up < 0
>>> Wouldn't it make more sense to remove those pointless checks?
>>> Clearly a correct index of an array cannot be negative.
>>> Looking at the code I would make more int -> unsigned int conversions:
>>>
>>> - ramp_table should be unsigned int
>>> - ti_lmu_common_convert_ramp_to_index should return unsigned int
>>>
>> Yeah I was going to just remove the code but when I was writing the
>> original code my intent was
>>
>> to extend the ramp call to allow other TI LMU driver to pass in the
>> device specific ramp table.
>>
>> But since I don't currently have any devices on my plate that require
>> that I can just remove the code as well
> You don't need to remove, just do the conversions I proposed.
> Unless it introduces some other problems I am currently not aware of.
>
Well just converting those two would/did not fix the issue.

But actually there is only 1 possibility that could happen if the 
convert function returns -EINVAL

So the check should be

if (ramp_up == -EINVAL || ramp_down == -EINVAL)

Because ramp_up/down should never be less then zero otherwise.

Dan


