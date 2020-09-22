Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C5C2748D2
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 21:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgIVTJ4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 15:09:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60752 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgIVTJ4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 15:09:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08MJ9n3Y105950;
        Tue, 22 Sep 2020 14:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600801789;
        bh=U49MIpNzHfADOvkiNb6w6PJ3+Ffy5gYQc+kJx1KrV+I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ikN2VmV5gnnCQwIa0X82jxX+IbkmiO3VJq+DNzctRWOYy84U/GLvpmITZ057foRE4
         CPuQDc/QmqwWTFZBIy5sArVCIA7O43HU0sLNMIqxg/uSjEEl1cn1M7TysivvdziQhC
         PgVrrmZlxw1Pu2+fDbbhSZDsm3vQ3Fc5SzeYR+LE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MJ9mAY118523;
        Tue, 22 Sep 2020 14:09:48 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 14:09:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 14:09:48 -0500
Received: from [10.250.36.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MJ9mTE004674;
        Tue, 22 Sep 2020 14:09:48 -0500
Subject: Re: [PATCH leds v3 6/9] leds: lm36274: use devres LED registering
 function
To:     Marek Behun <marek.behun@nic.cz>, Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-7-marek.behun@nic.cz>
 <20200920214532.GB31397@duo.ucw.cz> <20200920235436.185ceebc@nic.cz>
 <20200922163842.GB25550@duo.ucw.cz> <20200922185840.61396186@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3d48fa2f-db26-85fd-96ab-f6461fd5c843@ti.com>
Date:   Tue, 22 Sep 2020 14:09:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922185840.61396186@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 9/22/20 11:58 AM, Marek Behun wrote:
> On Tue, 22 Sep 2020 18:38:42 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>
>> On Sun 2020-09-20 23:54:36, Marek Behun wrote:
>>> On Sun, 20 Sep 2020 23:45:32 +0200
>>> Pavel Machek <pavel@ucw.cz> wrote:
>>>    
>>>> Hi!
>>>>    
>>>>> Now that the potential use-after-free issue is resolved we can use
>>>>> devres for LED registration in this driver.
>>>>>
>>>>> By using devres version of LED registering function we can remove the
>>>>> .remove method from this driver.
>>>>>
>>>>> Signed-off-by: Marek Behún <marek.behun@nic.cz>
>>>>> Cc: Dan Murphy <dmurphy@ti.com>
>>>> AFAICT this one is buggy, I sent explanation before. Why are you
>>>> resubmitting it?
>>> The previous patch in this series (v3 5/9) should solve this issue and
>>> th commit message explains how.
>> Aha, let me see.
>>
>> Will 5/9 have some side-effects, like device appearing at different
>> place in sysfs?
> Yes, unfortunately. Before this path the led should be in
>   /sys/devices/.../i2c-client/leds/led
> or somthing like that, and after
>   /sys/devices/..c/i2c-client/mfd/leds/led
>
> But it should have been this way from beginning, I think. The other
> driver, regulator, registers its device under the mfd device.
>
> The question is whether this will break something for someone. I don't
> think so, but...
>
>> First few patches look ok, but it would be really nice someone tested
>> complete sereies.

For the LM36274 patches

Tested-by: Dan Murphy <dmurphy@ti.com>

Also found some other legacy issues I sent patches for.

Dan

