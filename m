Return-Path: <linux-leds+bounces-3503-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456A9E77A5
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4631188871D
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 17:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82B42206B4;
	Fri,  6 Dec 2024 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LoEYspxo"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596252206AA;
	Fri,  6 Dec 2024 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733507070; cv=none; b=VYG45tMkP9RVz//RdDCMoJulyLHN25CiwGshxFpWiWgNX2oYWkTaytGEFROhTpR+B60Ixf/dyCtcADEPumhXkd8l1ifCYloG50JLTcxJbrP9HuajONYnfbHBMGluHtPJk0WLKatKe5/S9cvKoB31n0n3ZWncalVTmHq/irRqXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733507070; c=relaxed/simple;
	bh=CV4B9Bixp78RcpDEaejxyumitfsNBoDDtrz3hB1AkXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IbjO+fwrgV2wRuWcgo6mq9ng/8fo3XEfuh2Dp96EdBcHsu2EivsyfGemK6prpmE5C95CmQ6q/9l5dnG+otM0qT5kBnA0Yy8xwu6u8nbpXrpOclJJBfTjZzT8Ga74lXqIuKskP2D73UgKY5eRwTt8+WAbjST01j52iPGdy3etG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LoEYspxo; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B6Hi4gr057943;
	Fri, 6 Dec 2024 11:44:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733507044;
	bh=gAf4bYIR6lR4eDeuk1BzwWR/LmnGhu+3P5Ya8KmzfVQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LoEYspxop7E66mRTAgMefdX2UZVONYjaIxFnRoDLtG+aXpvxEIUgIDrncpKsQmoAi
	 ylVk33PmLpmQlVuPvV7wK8T8x1sQKTWt0sJu0DKMaPH1zIprWxoggnTDdDpV0J2Llx
	 pjwzSDEmqYkqx3dJNMbDUL1GKdiFovcdJ37ixXiQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6Hi4DW128725;
	Fri, 6 Dec 2024 11:44:04 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 11:44:04 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 11:44:04 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6Hi2Zb002869;
	Fri, 6 Dec 2024 11:44:02 -0600
Message-ID: <129a3e14-9c87-47c2-b4ed-49bbcf12ae7e@ti.com>
Date: Fri, 6 Dec 2024 11:43:59 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
To: Conor Dooley <conor@kernel.org>,
        "A. Sverdlin"
	<alexander.sverdlin@siemens.com>
CC: Dan Murphy <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Lee Jones
	<lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han
	<jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
 <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
 <20241206-brim-talcum-f5e8c504c572@spud>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241206-brim-talcum-f5e8c504c572@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/6/24 11:14 AM, Conor Dooley wrote:
> On Fri, Dec 06, 2024 at 06:07:12PM +0100, A. Sverdlin wrote:
>> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>>
>> Add Texas Instruments' LP8864/LP8866 bindings into LP8860 converting them
>> into YAML format simultaneously. While here, drop the index of the "led"
>> subnode, this one is neither used nor mandated by the drivers. All the
>> *-cells properties are therefore not required.
> 

The index isn't needed, but we should still allow for multiple child
LED nodes. The usual way to do this is with node names led-0, led-1, etc..

See here for the usual patternProperties for that:

https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/leds-pwm.yaml

> Are you sure this is a correct thing to do? The lp8860-q1 product link
> cites it as being a 4-channel device. Even if the kernel only ever
> supports it as a single-channel device, the binding should reflect what
> it is capable of doing.
> 

Agree, the driver today just checks the first child node, but it could
be extended for all 4 supported LED channels, and we shouldn't have
to change the binding for that new support.

Andrew

> Cheers,
> Conor.
> 
>>
>> Move the file into backlight directory because all of the LP886x drivers
>> are special backlight products.
>>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>> ---
>>   .../bindings/leds/backlight/ti,lp8860.yaml    | 86 +++++++++++++++++++
>>   .../devicetree/bindings/leds/leds-lp8860.txt  | 50 -----------
>>   2 files changed, 86 insertions(+), 50 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
>> new file mode 100644
>> index 0000000000000..3ece2f6fc3f02
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
>> @@ -0,0 +1,86 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/backlight/ti,lp8860.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments - LP886x 4/6-Channel LED Driver family
>> +
>> +maintainers:
>> +  - Andrew Davis <afd@ti.com>
>> +  - Alexander Sverdlin <alexander.sverdlin@siemens.com>
>> +
>> +description: |
>> +  The LP8860-Q1 is an high-efficiency LED driver with boost controller.
>> +  It has 4 high-precision current sinks that can be controlled by a PWM input
>> +  signal, a SPI/I2C master, or both.
>> +
>> +  LP8866-Q1, LP8866S-Q1, LP8864-Q1, LP8864S-Q1 are newer products offering
>> +  similar functionality with 4/6 channels.
>> +
>> +  For more product information please see the links below:
>> +    https://www.ti.com/product/lp8860-q1
>> +    https://www.ti.com/product/LP8864-Q1
>> +    https://www.ti.com/product/LP8864S-Q1
>> +    https://www.ti.com/product/LP8866-Q1
>> +    https://www.ti.com/product/LP8866S-Q1
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,lp8860
>> +      - ti,lp8864
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: I2C slave address
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +    description: GPIO pin to enable (active high) / disable the device
>> +
>> +  vled-supply:
>> +    description: LED supply
>> +
>> +  led:
>> +    type: object
>> +    $ref: common.yaml#
>> +    properties:
>> +      function: true
>> +      color: true
>> +      label: true
>> +      linux,default-trigger: true
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - led
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/leds/common.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        led-controller@2d {
>> +            compatible = "ti,lp8860";
>> +            reg = <0x2d>;
>> +            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> +            vled-supply = <&vbatt>;
>> +
>> +            led {
>> +                function = LED_FUNCTION_BACKLIGHT;
>> +                color = <LED_COLOR_ID_WHITE>;
>> +                linux,default-trigger = "backlight";
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> deleted file mode 100644
>> index 8bb25749a3da3..0000000000000
>> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> +++ /dev/null
>> @@ -1,50 +0,0 @@
>> -* Texas Instruments - lp8860 4-Channel LED Driver
>> -
>> -The LP8860-Q1 is an high-efficiency LED
>> -driver with boost controller. It has 4 high-precision
>> -current sinks that can be controlled by a PWM input
>> -signal, a SPI/I2C master, or both.
>> -
>> -Required properties:
>> -	- compatible :
>> -		"ti,lp8860"
>> -	- reg : I2C slave address
>> -	- #address-cells : 1
>> -	- #size-cells : 0
>> -
>> -Optional properties:
>> -	- enable-gpios : gpio pin to enable (active high)/disable the device.
>> -	- vled-supply : LED supply
>> -
>> -Required child properties:
>> -	- reg : 0
>> -
>> -Optional child properties:
>> -	- function : see Documentation/devicetree/bindings/leds/common.txt
>> -	- color : see Documentation/devicetree/bindings/leds/common.txt
>> -	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
>> -	- linux,default-trigger :
>> -	   see Documentation/devicetree/bindings/leds/common.txt
>> -
>> -Example:
>> -
>> -#include <dt-bindings/leds/common.h>
>> -
>> -led-controller@2d {
>> -	compatible = "ti,lp8860";
>> -	#address-cells = <1>;
>> -	#size-cells = <0>;
>> -	reg = <0x2d>;
>> -	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> -	vled-supply = <&vbatt>;
>> -
>> -	led@0 {
>> -		reg = <0>;
>> -		function = LED_FUNCTION_BACKLIGHT;
>> -		color = <LED_COLOR_ID_WHITE>;
>> -		linux,default-trigger = "backlight";
>> -	};
>> -}
>> -
>> -For more product information please see the link below:
>> -https://www.ti.com/product/lp8860-q1
>> -- 
>> 2.47.1
>>

