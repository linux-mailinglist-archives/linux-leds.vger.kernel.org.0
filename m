Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C49B16F2B8
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2020 23:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbgBYWty (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Feb 2020 17:49:54 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51372 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728806AbgBYWty (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Feb 2020 17:49:54 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PMnniE074691;
        Tue, 25 Feb 2020 16:49:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582670989;
        bh=zy1gihk/lmEzN5ETQUN08dIq2i2iSuWxptUBdri6nTQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YqQslQS93oTE5mtL6Jffw+GDDQ9DOKvFeztI9QAisDKoNuemRUUhX7P0DSTd67j9X
         mwRhPevGkxsB/slE4BSkYOazW5CLfcAx2ZQLjkU+yNx7ru/qAFWnLTsrPatdODSTLN
         mEWdave3cI7F7c+crVGibb86fpp0A4KE3fUlEt8A=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PMnn7T072939
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Feb 2020 16:49:49 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 16:49:49 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 16:49:49 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01PMnnRI083447;
        Tue, 25 Feb 2020 16:49:49 -0600
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com> <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e05580eb-670e-9e62-f3c4-84980e2193d2@ti.com>
Date:   Tue, 25 Feb 2020 16:44:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 2/25/20 4:17 PM, Jacek Anaszewski wrote:
> On 2/25/20 11:19 AM, Pavel Machek wrote:
>> Hi!
>>
>>>>    leds: lp5521: Add multicolor framework multicolor brightness support
>>>>    leds: lp55xx: Fix checkpatch file permissions issues
>>>>    leds: lp5523: Fix checkpatch issues in the code
>>>>    dt: bindings: Update lp55xx binding to recommended LED naming
>>> I have no open comments on this patchset except for a DT change requested by
>>> Shawn Gao but this change should wait till after this patchset is merged.
>>>
>>> Is there something holding this up?
>> Yes... my time; sorry about that.
>>
>> The fact that it changes API makes it important to get it right, and
>> hard/impossible to fix it once it is merged... and I don't think this
>> is the right interface (sorry).
>>
>> In particular, I don't think having directory per channel is a good
>> idea. It makes atomic updates impossible (minor),
> It is possible via brightness file, although it will need first writing
> intensity files, which only will cache colors, and actual write to hw
> occurs on write to brightness file. This has been discussed dozen of
> times throughout last year, and you even proposed the formula for
> calculating per-color-subled brightness basing on global brightness and
> intensity set for each color.

I actually just got your reply Pavel.  Unfortunately I don't have the 
band width to spin any more major framework changes and as you know this 
has been discussed over and over and over again with multiple iterations 
and multiple designs.

I still don't agree with some nebulous unbound array being passed into 
the driver via sysfs. As we have discussed at length in the past this 
implementation is just as bad if not worse then what I am proposing. I 
also have provided that particular array implementation and it failed to 
get any ACKs as it violated sysfs rules and was wrought with corner 
cases and mismatches of color to intensity values.  And calling the 
sysfs node channel_intensity and channel_names is not correct this is a 
LP55xx naming convention and should not be applied.

But as Jacek indicated lets have the sysfs maintainer provide the 
consultation on the array implementation again.

And as I have stated above my time has run out on trying to get this 
framework completed so I will just re-write the lp50xx driver against 
the standard LED class implementation and abandon any hope of actually 
improving the LED subsystem for multi color ICs.  As I don't have 
another year or two to debate this interface again and try to implement 
the code just for it to get another NACK in the end and having to 
rewrite the framework again.

Dan


