Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02AD8B11BB
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 17:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732844AbfILPDh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 11:03:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49990 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732817AbfILPDh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2019 11:03:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CF3Aah046587;
        Thu, 12 Sep 2019 10:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568300590;
        bh=eju7yvlhMevpk8GMIglQpXBV9N/M17eV4ISPBCjwU3g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kofTgmSdQLex18tsgcah0ZbTuO/uSmNQEQaKu1CsVKhJD9woALdPBt0Zuwfuqe3ea
         /UdLDlUEJScXMRjUencauLX5F5YcouKRhw3dsEmRd4V/729PJKFPxHcCd7h3piz31p
         igneibNxmUgJPpXVu1e2WzW5E9sGWzFqRP+0P/kA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CF3A4B029511
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 10:03:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 10:03:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 10:03:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CF39dk069556;
        Thu, 12 Sep 2019 10:03:09 -0500
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To:     Andreas Kemnade <andreas@kemnade.info>
CC:     <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
        <jingoohan1@gmail.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20190911172106.12843-1-andreas@kemnade.info>
 <20190911172106.12843-2-andreas@kemnade.info>
 <ff410d6c-e1e8-7c96-e8f7-0a0deb816f6a@ti.com>
 <20190912165808.3c38b7a2@kemnade.info>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <5c8d25ab-e780-4e60-9723-cd65553f4db3@ti.com>
Date:   Thu, 12 Sep 2019 10:03:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912165808.3c38b7a2@kemnade.info>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Andreas

On 9/12/19 9:58 AM, Andreas Kemnade wrote:
> On Thu, 12 Sep 2019 06:39:50 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
>
>> Andreas
>>
>> On 9/11/19 12:21 PM, Andreas Kemnade wrote:
>>> add enable-gpios to describe HWEN pin
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>>> ---
>>> changes in v2: added example
>>> changes in v3: added Acked-by
>>>    .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>> index dc129d9a329e..1fa83feffe16 100644
>>> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>> @@ -29,6 +29,10 @@ properties:
>>>      '#size-cells':
>>>        const: 0
>>>    
>>> +  enable-gpios:
>>> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
>>> +    maxItems: 1
>>> +
>>>    required:
>>>      - compatible
>>>      - reg
>>> @@ -92,6 +96,7 @@ examples:
>>>        i2c {
>>>            #address-cells = <1>;
>>>            #size-cells = <0>;
>>> +        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
>>>    
>>>            led-controller@38 {
>>>                    compatible = "ti,lm3630a";
>> Looks good to me
>>
> well, the enable-gpios is still at the same place as in v2. This was sent
> before your comments to v2 have been arrived.

Ah I overlooked that.  Yeah that still needs to move I assumed you moved it.

Dan


> Regards,
> Andreas
