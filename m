Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9F21F1EE6
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jun 2020 20:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgFHSV1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jun 2020 14:21:27 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53384 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFHSV0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jun 2020 14:21:26 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058ILLDe113063;
        Mon, 8 Jun 2020 13:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591640481;
        bh=RMzJpRbyroFe0EgM/4U6tkWl0hgt8snFYObSCyB1dDg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AJ6ZY+Jq269BjInNIectkbGFCfMveto2A1lnxnT1stnCaV4UC/KNZG2f9S3+tG25/
         SVD3Us2sI8Y0Hsfp8zE475NFiHWfiUNhLKd/M13IGjd7v22vtjhBzYvUyguUV75hjG
         3yOQv5ojFcj08MRAXE4JgVoARRAoX1eVI28EU3ws=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058ILLdK130836
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jun 2020 13:21:21 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 13:21:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 13:21:20 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058ILKHq043463;
        Mon, 8 Jun 2020 13:21:20 -0500
Subject: Re: [PATCH v26 04/15] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
To:     Rob Herring <robh@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-5-dmurphy@ti.com> <20200604225938.GA4175214@bogus>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c893e648-ee1a-3720-8b83-4440d45fdbdc@ti.com>
Date:   Mon, 8 Jun 2020 13:21:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604225938.GA4175214@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob

On 6/4/20 5:59 PM, Rob Herring wrote:
> On Thu, Jun 04, 2020 at 07:04:53AM -0500, Dan Murphy wrote:
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
>>   .../devicetree/bindings/leds/leds-lp50xx.yaml | 136 ++++++++++++++++++
>>   1 file changed, 136 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>> new file mode 100644
>> index 000000000000..02fcdc13262f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>> @@ -0,0 +1,136 @@
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
>> +  #allOf:
>> +    #- $ref: "common.yaml#"
>> +    #- $ref: "leds-class-multicolor.yaml#"
> These describe properties in the 'multi-led' nodes, so the $ref goes
> there. And you only need the 2nd one because it already references the
> 1st one (or it should once you fix patch 1).
Got it
>> +
>> +  compatible:
>> +    enum:
>> +      - ti,lp5009
>> +      - ti,lp5012
>> +      - ti,lp5018
>> +      - ti,lp5024
>> +      - ti,lp5030
>> +      - ti,lp5036
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
>> +    maxItems: 1
>> +    description: GPIO pin to enable/disable the device.
>> +
>> +  vled-supply:
>> +    description: LED supply.
>> +
>> +  child-node:
> I guess you didn't understand what I said on this. What you need is:
>
> patternProperties:
>    '^multi-led@[0-9]$':
>      type: object
>      $ref: leds-class-multicolor.yaml#
>      properties:
>        ...
>
>      patternProperties:
>        '^led@[0-9]$':
>          type: object
>          $ref: common.yaml#
>
> Adjust '[0-9]' based on how many possible child addresses there can be.
> It's hex if more than 10.
>
Most we can have are 12 modules
>> +    properties:
>> +      ti,led-bank:
>> +        description:
>> +          This property denotes the LED module numbers that will be controlled as
>> +          a single RGB cluster.  Each LED module number will be controlled by a
>> +          single LED class instance.
>> +          There can only be one instance of the ti,led-bank
>> +          property for each device node.  This is a required node if the LED
>> +          modules are to be banked.
>> +        $ref: /schemas/types.yaml#definitions/uint32-array
>> +
>> +required:
>> +  - compatible
>> +  - reg
> additionalProperties: false

This causes a binding check failure for

leds/leds-lp50xx.example.dt.yaml: led-controller@14: '#address-cells', 
'#size-cells' do not match any of the regexes: '^multi-led@[0-9a-f]$', 
'pinctrl-[0-9]+'

>> +
>> +examples:
>> +  - |
>> +   #include <dt-bindings/gpio/gpio.h>
>> +   #include <dt-bindings/leds/common.h>
>> +
>> +   i2c {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +
>> +       led-controller@14 {
>> +           compatible = "ti,lp5009";
>> +           reg = <0x14>;
>> +           #address-cells = <1>;
>> +           #size-cells = <0>;
>> +           enable-gpios = <&gpio1 16>;
>> +
>> +           multi-led@1 {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               reg = <1>;
>> +               color = <LED_COLOR_ID_MULTI>;
>> +               function = LED_FUNCTION_CHARGING;
>> +
>> +               led@0 {
>> +                   reg = <0>;
>> +                   color = <LED_COLOR_ID_RED>;
>> +               };
>> +
>> +               led@1 {
>> +                   reg = <1>;
>> +                   color = <LED_COLOR_ID_GREEN>;
>> +               };
>> +
>> +               led@2 {
>> +                   reg = <2>;
>> +                   color = <LED_COLOR_ID_BLUE>;
>> +               };
>> +          };
>> +
>> +          multi-led@2 {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            reg = <2>;
>> +            color = <LED_COLOR_ID_MULTI>;
>> +            function = LED_FUNCTION_STANDBY;
>> +            ti,led-bank = <2 3 5>;
> I still don't understand why 'reg = <2 3 5>;' with the 1st entry being
> the control bank. Is '2' in reg not the same thing as '2' here?

I changed this.

Now reg is the module numbers that can either stand alone or be grouped.

Dan

