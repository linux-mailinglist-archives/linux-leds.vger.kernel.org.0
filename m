Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655CECFB55
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 15:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbfJHNag (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 09:30:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39946 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730317AbfJHNag (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 09:30:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98DUQh5006610;
        Tue, 8 Oct 2019 08:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570541426;
        bh=lQQiCwrpULzFgm3ZorluBP+qndxuBlCDA9JrLAelV6w=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=Jaw6DUR15NED4trF7LQ+GSvwQnDzExBq3Hw3+XQAUjz2dx1H93lPy4N2EqJid+ttr
         27NfNH8KyRavgm/EqaJwjZVvZ5/S+CTftv0aR/rq2hNLfpUxzbBjxMzLtsb2Vm1nbt
         KXHqb+HJn/1BQvzoq12F7U+Tie5d91bt9txDmPGQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98DUQeb078006
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 08:30:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 08:30:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 08:30:23 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98DUNZQ000416;
        Tue, 8 Oct 2019 08:30:23 -0500
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
Message-ID: <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
Date:   Tue, 8 Oct 2019 15:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob,

On 08/10/2019 14:51, Jean-Jacques Hiblot wrote:
> Hi Rob,
>
> On 07/10/2019 18:15, Rob Herring wrote:
>> Please send DT bindings to DT list or it's never in my queue. IOW,
>> send patches to the lists that get_maintainers.pl tells you to.
>>
>> On Mon, Oct 7, 2019 at 7:45 AM Jean-Jacques Hiblot <jjhiblot@ti.com> 
>> wrote:
>>> Add DT binding for led-backlight.
>>>
>>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>> ---
>>>   .../bindings/leds/backlight/led-backlight.txt | 28 
>>> +++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>> Please make this a DT schema.
>
> OK.
>
> BTW I used "make dt_binding_check" but had to fix a couple of YAMLs 
> file to get it to work. Do you have a kernel tree with already all the 
> YAML files in good shape ? Or do you want me to post the changes to 
> devicetree@vger.kernel.org ?
>
>
>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt 
>>> b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>>> new file mode 100644
>>> index 000000000000..4c7dfbe7f67a
>>> --- /dev/null
>>> +++ 
>>> b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>>> @@ -0,0 +1,28 @@
>>> +led-backlight bindings
>>> +
>>> +This binding is used to describe a basic backlight device made of 
>>> LEDs.
>>> +It can also be used to describe a backlight device controlled by 
>>> the output of
>>> +a LED driver.
>>> +
>>> +Required properties:
>>> +  - compatible: "led-backlight"
>>> +  - leds: a list of LEDs
>> 'leds' is already used as a node name and mixing is not ideal.
>>
>> We already have 'flash-leds' in use and with the same definition, so
>> lets continue that and use 'backlight-leds'.
> OK

I am taking that back. I have added of_get_led() and devm_of_get_led() 
to the LED core to make it easier to get a LED from the DT. I modeled 
the interface like it is done for PWM, PHYs or clocks. The property 
containing list/array of phandle  is always named the same. To get one 
particular PWM/PHY/clock, a identifier (name or integer) must be provided.

So unless there is a strong incentive to do otherwise I's rather keep 
this name here.


JJ


>>> +
>>> +Optional properties:
>>> +  - brightness-levels: Array of distinct brightness levels. The 
>>> levels must be
>>> +                       in the range accepted by the underlying LED 
>>> devices.
>>> +                       This is used to translate a backlight 
>>> brightness level
>>> +                       into a LED brightness level. If it is not 
>>> provided, the
>>> +                       identity mapping is used.
>>> +
>>> +  - default-brightness-level: The default brightness level.
>> You can just assume these 2 get a common schema at some point. So just
>> need to define any additional constraints if possible.
>
> Maybe we should keep them until such a common schema is written ?
>
> JJ
>
>>
>> Rob
