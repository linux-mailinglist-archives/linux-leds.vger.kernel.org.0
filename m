Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B442A7003
	for <lists+linux-leds@lfdr.de>; Wed,  4 Nov 2020 22:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731900AbgKDV65 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Nov 2020 16:58:57 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54092 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbgKDV62 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Nov 2020 16:58:28 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A4LwL1E106107;
        Wed, 4 Nov 2020 15:58:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604527101;
        bh=y+LAI9/XdhYjwtQzgnCtEDFtSi8ifrvC0flypm7fSCM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TskeQzdLefsaCzIuNwZcDiLowXEtEp6ORGPDcVBFzZSnKKBTNTQkKFAmZHnuRvoRd
         qJW5hkH29LUaB98XrW45k+dNZm5Q/Q25tw+ATYfYoA1DWz/8nk6eXnGpd644Jw3P4q
         9j93MnUmDy83JMm3qoezehFLhff6ubr7JgbBVNBE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A4LwLps111739
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Nov 2020 15:58:21 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 4 Nov
 2020 15:58:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 4 Nov 2020 15:58:20 -0600
Received: from [10.250.39.187] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A4LwKHc046589;
        Wed, 4 Nov 2020 15:58:20 -0600
Subject: Re: [PATCH leds 4/5] dt-bindings: leds: leds-class-multicolor: use
 LED_COLOR_ID_RGB for now
To:     Rob Herring <robh@kernel.org>
CC:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <devicetree@vger.kernel.org>
References: <20201030023906.24259-1-kabel@kernel.org>
 <20201030023906.24259-4-kabel@kernel.org>
 <b22f8d21-7625-dcff-616c-0c68008b5ab2@ti.com>
 <20201104215502.GA4184250@bogus>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <5cbba60d-afdb-7034-e2f2-80722f5375b1@ti.com>
Date:   Wed, 4 Nov 2020 15:58:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104215502.GA4184250@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob

On 11/4/20 3:55 PM, Rob Herring wrote:
> On Fri, Oct 30, 2020 at 08:08:01AM -0500, Dan Murphy wrote:
>> Marek
>>
>> On 10/29/20 9:39 PM, Marek Behún wrote:
>>> Commit 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
>>> disallows LED_COLOR_ID_MULTI for now, and instead LED_COLOR_ID_RGB
>>> should be used. Fix this is leds-class-multicolor binding.
>>>
>>> After we have some usecases for non-RGB multicolor LEDs, this can be
>>> changed.
>>>
>>> Signed-off-by: Marek Behún <kabel@kernel.org>
>>> Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
>>> Cc: devicetree@vger.kernel.org
>>> Cc: robh+dt@kernel.org
>>> ---
>>>    .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml     | 4 ++--
>>>    .../devicetree/bindings/leds/leds-class-multicolor.yaml       | 4 ++--
>>>    2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
>>> index fe7fa25877fd..2015db9b7618 100644
>>> --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
>>> @@ -73,14 +73,14 @@ examples:
>>>                     * LEDs.
>>>                     */
>>>                    reg = <0>;
>>> -                color = <LED_COLOR_ID_MULTI>;
>>> +                color = <LED_COLOR_ID_RGB>;
>>>                    function = LED_FUNCTION_POWER;
>>>                    linux,default-trigger = "heartbeat";
>>>                };
>>>                multi-led@a {
>>>                    reg = <0xa>;
>>> -                color = <LED_COLOR_ID_MULTI>;
>>> +                color = <LED_COLOR_ID_RGB>;
>>>                    function = LED_FUNCTION_INDICATOR;
>>>                    function-enumerator = <1>;
>>>                };
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>>> index b1a53f054b89..9faa3609a6bb 100644
>>> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>> Why are you resubmitting the multicolor.yaml?
>>
>> https://lore.kernel.org/patchwork/patch/1320863/
>>
>> This is waiting on DT review.
> I'm expecting another version as you commented on it.

Yes you applied v2

https://www.spinics.net/lists/devicetree/msg384974.html

Dan

> Rob
