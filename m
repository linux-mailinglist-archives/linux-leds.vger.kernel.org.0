Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB3612C577
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2019 13:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfE1Le4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 May 2019 07:34:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45862 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfE1Lez (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 May 2019 07:34:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SBYoRP099127;
        Tue, 28 May 2019 06:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559043290;
        bh=P5KVIiZh3Nun0m+9PqwCu28xvWWa75LyAqbjIU0ZS74=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=QIfoVyy88eGvEv3Y6yfq8GFY/mwrZ/ioUsL0RpdqGiACEPymZ0gcg1WAQyMxEEEWD
         K8lOu2uDCJ3pbRerxtYkxDloAXJy1fGBij0MCCzQHO1DtHi3R1kOaTvGiQYKLuaVf0
         LRw+juTFQbFsXU0i3N1WLHZiMrtf/mSwuyVmaUJM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SBYnGN124533
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 06:34:50 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 06:34:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 06:34:49 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SBYmh8069662;
        Tue, 28 May 2019 06:34:48 -0500
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
From:   Dan Murphy <dmurphy@ti.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com> <20190527103355.GA5287@amd>
 <522728b0-147b-3708-fea1-88a895491e05@ti.com>
Message-ID: <34dbfab0-0dd4-cf9a-ed86-a74363981077@ti.com>
Date:   Tue, 28 May 2019 06:34:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <522728b0-147b-3708-fea1-88a895491e05@ti.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 5/27/19 7:45 PM, Dan Murphy wrote:
> Pavel
>
> On 5/27/19 5:33 AM, Pavel Machek wrote:
>> On Thu 2019-05-23 14:08:12, Dan Murphy wrote:
>>> Add a documentation of LED Multicolor LED class specific
>>> sysfs attributes.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   .../ABI/testing/sysfs-class-led-multicolor    | 57 
>>> +++++++++++++++++++
>>>   1 file changed, 57 insertions(+)
>>>   create mode 100644 
>>> Documentation/ABI/testing/sysfs-class-led-multicolor
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor 
>>> b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> new file mode 100644
>>> index 000000000000..2f102ede258b
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> @@ -0,0 +1,57 @@
>>> +What:        /sys/class/leds/<led>/colors/sync_enable
>>> +Date:        April 2019
>> I believe I suggested more reasonable interface. Why not use that?
>>
>
> Can you please provide the reference to your interface?
>
I think I found the suggestion [0].  Assuming that was the suggestion it 
violates the kernel 1 value/file and there was agreement that this 
interface had value. In testing the interface, it made sense to be able 
to setup a color after writing each color brightness file and then 
syncing the color LEDs with the new brightness levels.  It also provides 
flexibility to be able to set a single LED color without writing sync.  
The decision to do either or should really be a user space decision.   
If I have referenced the wrong thread please let me know which thread 
you are referring to.

[0] https://lore.kernel.org/patchwork/patch/1057044/

<snip>

Dan

