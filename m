Return-Path: <linux-leds+bounces-4207-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C9A58D3D
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 08:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A26EF3AB17E
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 07:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF54F21ABDC;
	Mon, 10 Mar 2025 07:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="ec2DCLHu"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B4A1BBBE5;
	Mon, 10 Mar 2025 07:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741592922; cv=none; b=ba1wdnhRYNUMe997nMGoyWPW6O75kBK9Ld+mN9I+9JW18p94UiRHM04Uh4ktcF/4OTkwNYFigqnMeZURcHlUL/IZeP8P/ROWYgQDyQ7Kt9lGxhVPbP6NQFB2viK1oQOxUM4+q8YHavxfqgIj78aaQd1JgyAgYIPMFGG6z+/vOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741592922; c=relaxed/simple;
	bh=7J/AqRAt74cKmUNfaN9qV/4SLC68LKViiljhp7ABqlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGusvQOBcOe8cUur3QxgcYgVEbMt6T/sA6d/0EzDP7gvSgGzb5JCkvoKgBogq38nSqtDerrf0JeEuLw7nrADzq9pyL4GnwXuBfm+hPZ5bbnKrUFSljiNrex/OozUcdMg6Q60JSBoZjdl8cLD2GTdcD1FMFwq8HnBy2hwNlQ9Kx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=ec2DCLHu; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pOu5saDPfrFBVdo11dFqR8ynsYHet3YtuqUt+9ehiS8=; b=ec2DCLHuzy+3VS3CURJ6Erpt/4
	+g8DlS7tVi7wcqzyivixGBT2rebERwS77F85EErdz3ODqrovY19a46kpPVr/e82/Odz3pHgjjHL5I
	vAtWsF2gdXXXmhI5bBvuKqRgCrPWlqMs6gKSiCQ95p60xW1CJGvxKV+xX0GFqHSCox1A=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:51473 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1trXRe-000KEN-Dn; Mon, 10 Mar 2025 08:21:03 +0100
Message-ID: <025cf7b9-2aa5-4651-91f5-d4b596d654ed@emfend.at>
Date: Mon, 10 Mar 2025 08:20:59 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: add Texas Instruments TPS6131x
 flash LED driver
To: Conor Dooley <conor@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-1-d1071d90f9ea@emfend.at>
 <20250228-zipfile-net-69e4bbebd8d6@spud>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20250228-zipfile-net-69e4bbebd8d6@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Conor,

Am 28.02.2025 um 19:24 schrieb Conor Dooley:
> On Fri, Feb 28, 2025 at 11:31:23AM +0100, Matthias Fend wrote:
>> Document Texas Instruments TPS61310/TPS61311 flash LED driver devicetree
>> bindings.
>>
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   .../devicetree/bindings/leds/ti,tps6131x.yaml      | 123 +++++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/ti,tps6131x.yaml b/Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c08b3cef7abcec07237d3271456ff1f888b2b809
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
> 
> With a filename matching one of the compatibles in the file,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

thank you very much for your feedback.
Since I found different variants in the LED bindings, I wasn't quite 
sure here.
So is it okay if I simply rename the file to 'ti,tps61310.yaml', even 
though there are multiple compatible strings and the driver is called 
leds-tps6131x?

Thanks
  ~Matthias

> 
> Cheers,
> Conor.
> 
>> @@ -0,0 +1,123 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/ti,tps6131x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments TPS6131X flash LED driver
>> +
>> +maintainers:
>> +  - Matthias Fend <matthias.fend@emfend.at>
>> +
>> +description: |
>> +  The TPS61310/TPS61311 is a flash LED driver with I2C interface.
>> +  Its power stage is capable of supplying a maximum total current of roughly 1500mA.
>> +  The TPS6131x provides three constant-current sinks, capable of sinking
>> +  up to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode.
>> +  In torch mode, each sink (LED1, LED2, LED3) supports currents up to 175mA.
>> +
>> +  The data sheet can be found at:
>> +    https://www.ti.com/lit/ds/symlink/tps61310.pdf
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,tps61310
>> +      - ti,tps61311
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description: GPIO connected to NRESET pin
>> +
>> +  ti,valley-current-limit:
>> +    type: boolean
>> +    description:
>> +      Reduce the valley peak current limit from 1750mA to 1250mA (TPS61310) or
>> +      from 2480mA to 1800mA (TPS61311).
>> +
>> +  led:
>> +    type: object
>> +    $ref: common.yaml#
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      led-sources:
>> +        allOf:
>> +          - minItems: 1
>> +            maxItems: 3
>> +            items:
>> +              enum: [1, 2, 3]
>> +
>> +      led-max-microamp:
>> +        anyOf:
>> +          - minimum: 25000
>> +            maximum: 350000
>> +            multipleOf: 50000
>> +          - minimum: 25000
>> +            maximum: 525000
>> +            multipleOf: 25000
>> +
>> +      flash-max-microamp:
>> +        anyOf:
>> +          - minimum: 25000
>> +            maximum: 800000
>> +            multipleOf: 50000
>> +          - minimum: 25000
>> +            maximum: 1500000
>> +            multipleOf: 25000
>> +
>> +      flash-max-timeout-us:
>> +        enum: [ 5300, 10700, 16000, 21300, 26600, 32000, 37300, 68200, 71500,
>> +                102200, 136300, 170400, 204500, 340800, 579300, 852000 ]
>> +
>> +    required:
>> +      - led-sources
>> +      - led-max-microamp
>> +      - flash-max-microamp
>> +      - flash-max-timeout-us
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +  - led
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/leds/common.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      led-controller@33 {
>> +        compatible = "ti,tps61310";
>> +        reg = <0x33>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
>> +
>> +        tps61310_flash: led {
>> +          function = LED_FUNCTION_FLASH;
>> +          color = <LED_COLOR_ID_WHITE>;
>> +          led-sources = <1>, <2>, <3>;
>> +          led-max-microamp = <525000>;
>> +          flash-max-microamp = <1500000>;
>> +          flash-max-timeout-us = <852000>;
>> +        };
>> +      };
>> +    };
>>
>> -- 
>> 2.34.1
>>


