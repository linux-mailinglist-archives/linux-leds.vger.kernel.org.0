Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8031A670B2
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2019 15:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfGLN5e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Jul 2019 09:57:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35202 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbfGLN5e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Jul 2019 09:57:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6CDvNPg079591;
        Fri, 12 Jul 2019 08:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562939843;
        bh=h/FvatbSmYtmmSo8C36ybsR85uhbjITUgdMf4+sgcKs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NHRMTN2vON/H1UxbPmaa6bz1Xi1UB4UWrEtoK0M4wjamG75Qa1bev03jTLJPkbN4K
         TwTc5h0Oxm/ZIkCNb30PXnvU1A4crailkYII29TaUJfsmB1AHaZ+It6i9iXfqclGUx
         E1wCyYC0TRMjGe2isZtcEN9zqeNduFmKec6txm2U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6CDvNuF024641
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Jul 2019 08:57:23 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Jul 2019 08:57:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Jul 2019 08:57:23 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6CDvKE4004279;
        Fri, 12 Jul 2019 08:57:21 -0500
Subject: Re: [PATCH v3 3/4] dt-bindings: backlight: Add led-backlight binding
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
        <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-4-jjhiblot@ti.com> <20190710191314.GC22995@amd>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <0d513ab5-eeb0-c22c-7ec8-f773e445e5f1@ti.com>
Date:   Fri, 12 Jul 2019 15:57:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710191314.GC22995@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel,

On 10/07/2019 21:13, Pavel Machek wrote:
> On Wed 2019-07-10 14:39:31, Jean-Jacques Hiblot wrote:
>> Add DT binding for led-backlight.
>>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>> new file mode 100644
>> index 000000000000..0444eec8efe1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>> @@ -0,0 +1,28 @@
>> +led-backlight bindings
>> +
>> +This binding is used to describe a basic backlight device made of
>> LEDs.
> Ok.
>
>> +It can also be used to describe a backlight device controlled by the output of
>> +a LED driver.
> ? The LED driver should better be driving some LEDs...

Well. we are dependent of the board design. If a board designer decided 
to control a backlight with a LED-controller, then we have to deal with it.

In practice there are a lot of LED drivers that actually drive the LEDs 
using PWMs and can be used for this purpose.

JJ

>
>> +Required properties:
>> +  - compatible: "led-backlight"
>> +  - leds: a list of LEDs
>> +
>> +Optional properties:
>> +  - brightness-levels: Array of distinct brightness levels. The levels must be
>> +                       in the range accepted by the underlying LED devices.
>> +                       This is used to translate a backlight brightness level
>> +                       into a LED brightness level. if not provided, the
>> +                       identity mapping is used.
> "If it is not"
> 									Pavel
