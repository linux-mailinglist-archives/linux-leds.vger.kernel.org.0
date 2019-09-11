Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878E0B03CD
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 20:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbfIKSoh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 14:44:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:32794 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729994AbfIKSoh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 14:44:37 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BIi2Jl011385;
        Wed, 11 Sep 2019 13:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568227442;
        bh=BOqEWOsrdu0X1JsJVt3OgXpcdPXFlSvGPSUfjNqw9dQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Wi/twvAL12qufysWGszW8BVjS4jU82o51dv3hlho8PnLShrKplFUNbYT/EXiAW50k
         a1Q0Yt7t2W+AjUk18Prrg9uauG41/3RuiVXzWUkDbB/Yc97d74rbeh7n1j63COuFrG
         H7Fcc6i61XTuU7SMyMK9YqtOu8Ba/FO/X3HFlfQ8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BIi2uo096292
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Sep 2019 13:44:02 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 13:44:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 13:44:02 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BIi15j122843;
        Wed, 11 Sep 2019 13:44:01 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>
CC:     <lee.jones@linaro.org>, <jingoohan1@gmail.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-fbdev@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-2-andreas@kemnade.info>
 <20190911100851.f4rnldghtmly26oo@holly.lan>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3d8237d0-4e36-3787-6050-b0e75f2fa8c3@ti.com>
Date:   Wed, 11 Sep 2019 13:44:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911100851.f4rnldghtmly26oo@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Andreas

On 9/11/19 5:08 AM, Daniel Thompson wrote:
> On Tue, Sep 10, 2019 at 11:29:08PM +0200, Andreas Kemnade wrote:
>> add enable-gpios to describe HWEN pin
>>
>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>
>> ---
>> changes in v2: add example
>>   .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>> index dc129d9a329e..1fa83feffe16 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>> @@ -29,6 +29,10 @@ properties:
>>     '#size-cells':
>>       const: 0
>>   
>> +  enable-gpios:
>> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -92,6 +96,7 @@ examples:
>>       i2c {
>>           #address-cells = <1>;
>>           #size-cells = <0>;
>> +        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;

This is in the wrong place.  This is implying that the gpio is for the 
i2c parent

This needs to go under the led-controller node below

Dan

>>   
>>           led-controller@38 {
>>                   compatible = "ti,lm3630a";
>> -- 
>> 2.20.1
>>
