Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B62D2739
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 12:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfJJKcE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Oct 2019 06:32:04 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53920 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfJJKcE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Oct 2019 06:32:04 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AAVt4E002714;
        Thu, 10 Oct 2019 05:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570703515;
        bh=oTQ6m0DLPijn4Z75VG/MQLEv1ErJGwIKzArMsIw7Reo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gDzQJKaL5ZvdXWt7JQU1Odz5MXSAU4BnqfxoG/K0mKbj9ifPOyncptYUb7TWOxNKK
         hwA3dCOfGekVFIyO6giwm6HTdfezyLf8Zfb2pNXgv7h1nZXjZbBN/CARWAhW14fwyX
         EyTHEoXmvGGZB6t5MTMX77NJ7D+7aVI5uRsNEJw8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AAVtK2097014
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 05:31:55 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 05:31:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 05:31:51 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AAVqgX109829;
        Thu, 10 Oct 2019 05:31:52 -0500
Subject: Re: [PATCH v10 4/6] dts-bindings: leds: Document the naming
 requirement for LED properties
To:     Rob Herring <robh@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <dmurphy@ti.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ti.com>,
        <devicetree@vger.kernel.org>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-5-jjhiblot@ti.com> <20191009192628.GA24087@bogus>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <f281d352-ec3e-f80a-66ea-b955609f2531@ti.com>
Date:   Thu, 10 Oct 2019 12:31:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009192628.GA24087@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 09/10/2019 21:26, Rob Herring wrote:
> On Wed, Oct 09, 2019 at 10:51:25AM +0200, Jean-Jacques Hiblot wrote:
>> LED properties must be named "leds" in the same way that PWM, clocks or
>> PHY properties are names respectively "pwms", "clocks" and "phys".
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   .../devicetree/bindings/leds/common.txt       | 20 ++++++++++++++++---
>>   1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>> index 9fa6f9795d50..31b8c1f68d27 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -10,6 +10,9 @@ can influence the way of the LED device initialization, the LED components
>>   have to be tightly coupled with the LED device binding. They are represented
>>   by child nodes of the parent LED device binding.
>>   
>> +LED properties should be named "leds". The exact meaning of each leds
>> +property must be documented in the device tree binding for each device.
>> +
> This is worded oddly. The property is 'leds' and it is always a list of
> phandles to LED device nodes. It is present in an LED consumer device.

How about:

[...]

A LED consumer device has a 'leds' property. This property is always a list
of phandles to LED nodes (child node of a LED device node).

led_device {
     ...

     led0: led@0 {
         ...
     };

     led1: led@1 {
         ...
     };
};

consumer {
     ...
     leds = <led0>, <led1>;
};

>
>>   
>>   Optional properties for child nodes:
>>   - led-sources : List of device current outputs the LED is connected to. The
>> @@ -165,9 +168,20 @@ led-controller@30 {
>>   		function-enumerator = <2>;
>>           };
>>   
>> -        led@3 {
>> +        bkl_led0: led@3 {
>>   		reg = <3>;
>> -		function = LED_FUNCTION_INDICATOR;
>> -		function-enumerator = <3>;
>> +		function = LED_FUNCTION_BACKLIGHT;
>> +		function-enumerator = <1>;
>>           };
>> +
>> +        bkl_led1: led@4 {
>> +		reg = <4>;
>> +		function = LED_FUNCTION_BACKLIGHT;
>> +		function-enumerator = <2>;
>> +        };
>> +};
>> +
>> +
>> +backlight@40 {
> Either needs 'reg' or the unit-address dropped.
>
>> +	leds = <&bkl_led0> , <&bkl_led1>;
> drop the space            ^
>
>>   };
>> -- 
>> 2.17.1
>>
