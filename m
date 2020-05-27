Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F171E4BD5
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2020 19:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390078AbgE0R1P (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 May 2020 13:27:15 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54724 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387878AbgE0R1P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 May 2020 13:27:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RHR76Z035112;
        Wed, 27 May 2020 12:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590600427;
        bh=GewqrLAXpbLigBVMM1jBh3cLD3IcS34HW/Gd02v61jU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xgLe8dPotxyTWHsEepXZrtwLJEem26ybIzXgjSXDCxhPKvKw98IZI67BpzWN1woMe
         HROWNHj7EQ3BLJxvkh5fIS2vBvSU0WAL6SWKUGdn/cG4GFww4RkQsv+rGmN7PtIgpZ
         SEPouV5b1wCrjOLI7DCwEh35gmwWdZzdaHIoaLZs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RHR7Rv042640
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 May 2020 12:27:07 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 12:27:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 12:27:07 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RHR6p3114838;
        Wed, 27 May 2020 12:27:07 -0500
Subject: Re: [PATCH v25 03/16] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
To:     Rob Herring <robh@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-4-dmurphy@ti.com> <20200527015905.GA874676@bogus>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <69bb1d4a-3210-21a7-c6d3-d08713e31c9f@ti.com>
Date:   Wed, 27 May 2020 12:27:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527015905.GA874676@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob

On 5/26/20 8:59 PM, Rob Herring wrote:
> On Tue, May 26, 2020 at 11:46:39AM -0500, Dan Murphy wrote:
>> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
>> LP5018, LP5012 and LP5009 RGB LED device driver.  The LP5036/30/24/18/12/9
>> can control RGB LEDs individually or as part of a control bank group.
>> These devices have the ability to adjust the mixing control for the RGB
>> LEDs to obtain different colors independent of the overall brightness of
>> the LED grouping.
>>
>> Datasheet:
>> http://www.ti.com/lit/ds/symlink/lp5012.pdf
>> http://www.ti.com/lit/ds/symlink/lp5024.pdf
>> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../devicetree/bindings/leds/leds-lp50xx.yaml | 180 ++++++++++++++++++
>>   1 file changed, 180 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>> new file mode 100644
>> index 000000000000..a2ea03e07f6d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>> @@ -0,0 +1,180 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/leds-lp50xx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: LED driver for LP50XX RGB LED from Texas Instruments.
>> +
>> +maintainers:
>> +  - Dan Murphy <dmurphy@ti.com>
>> +
>> +description: |
>> +  The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB LEDs into
>> +  a LED group or control them individually.
>> +
>> +  The difference in these RGB LED drivers is the number of supported RGB
>> +  modules.
>> +
>> +  For more product information please see the link below:
>> +  http://www.ti.com/lit/ds/symlink/lp5012.pdf
>> +  http://www.ti.com/lit/ds/symlink/lp5024.pdf
>> +  http://www.ti.com/lit/ds/symlink/lp5036.pdf
>> +
>> +properties:
>> +  compatible:
>> +     oneOf:
>> +      - const: ti,lp5009
>> +      - const: ti,lp5012
>> +      - const: ti,lp5018
>> +      - const: ti,lp5024
>> +      - const: ti,lp5030
>> +      - const: ti,lp5036
> Use enum rather than oneOf+const.
Ok
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      I2C slave address
>> +      lp5009/12 - 0x14, 0x15, 0x16, 0x17
>> +      lp5018/24 - 0x28, 0x29, 0x2a, 0x2b
>> +      lp5030/36 - 0x30, 0x31, 0x32, 0x33
>> +
>> +  enable-gpios:
>> +    description: GPIO pin to enable/disable the device.
> How many? (maxItems: 1)
1
>
>> +
>> +  vled-supply:
>> +    description: LED supply.
>> +
>> +  child-node:
> This literally requires a node called 'child-node'. Not what you want.
>
> You need a $ref to the multi-color schema in here and then only define
> what's specific to this chip.
Ok
>
>> +    type: object
>> +    properties:
>> +      reg:
>> +        description: This is the LED module number.
> Constraints?

What type of constraints are needed here?  They vary based on what LED 
device you are using.


>
>> +
>> +      color:
>> +        description: Must be LED_COLOR_ID_MULTI
>> +
>> +      function:
>> +        description: see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +      ti,led-bank:
>> +        description:
>> +          This property denotes the LED module numbers that will be controlled as
>> +          a single RGB cluster.  Each LED module number will be controlled by a
>> +          single LED class instance.
>> +          There can only be one instance of the ti,led-bank
>> +          property for each device node.  This is a required node is the LED
>> +          modules are to be backed.
>> +        $ref: /schemas/types.yaml#definitions/uint32-array
> What is reg then? Some made up index? Can't you do:
>
> reg = <1 2 3>;
> led@1 {};
> led@2 {};
> led@2 {};

reg becomes the first LED module number in the banked LED group.

This chip has the ability to group or bank and control RGB LED clusters 
via a single register.

Or the device can control a single RGB LED cluster.  The device needs to 
be programmed with what LED modules are banked

together.  The bank numbers and LED module numbers and output numbers 
are not the same.  So this property indicates what modules are banked as 
in the

multi-led@2 example.

     #size-cells = <0>;
+            reg = <2>;
+            color = <LED_COLOR_ID_MULTI>;
+            function = LED_FUNCTION_STANDBY;
+            ti,led-bank = <2 3 5>;
+
+            led@6 {
+              reg = <0x6>;
+              color = <LED_COLOR_ID_RED>;
+              led-sources = <6 9 15>;
+            };
+
+            led@7 {
+              reg = <0x7>;
+              color = <LED_COLOR_ID_GREEN>;
+              led-sources = <7 10 16>;
+            };
+
+            led@8 {
+              reg = <0x8>;
+              color = <LED_COLOR_ID_BLUE>;
+              led-sources = <8 11 17>;
+            };
+         };

>> +
>> +    required:
>> +      - reg
>> +      - color
>> +      - function
>> +
>> +  grandchild-node:
> Again, no.
ok
>
>> +    type: object
>> +    properties:
>> +      reg:
>> +        description:
>> +          A single entry denoting the LED output that controls the monochrome LED.
> Constraints?

Same as above


>> +
>> +      color:
>> +        description:
>> +          see Documentation/devicetree/bindings/leds/common.txt
> Have you read this file recently? Don't add new references to it. (And
> generally freeform references to other files are wrong with schemas).

These patchsets and versions have been around for a very long time.

So this and all references to the common.txt are artifacts prior to the 
text file being obsoleted.

I will reference the common.yaml file.

Dan


