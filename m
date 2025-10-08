Return-Path: <linux-leds+bounces-5677-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5074BC6831
	for <lists+linux-leds@lfdr.de>; Wed, 08 Oct 2025 21:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 877944E8BA2
	for <lists+linux-leds@lfdr.de>; Wed,  8 Oct 2025 19:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90B8275AFD;
	Wed,  8 Oct 2025 19:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxVWkCI4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAA323E355;
	Wed,  8 Oct 2025 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953453; cv=none; b=d/mufMHrQ1jCUvTL+DhKpo6+IkrWgCiX2HTH6Q3agPVXLLF4k0pArH+P5c+ZO1TnybZxMbWYCbz4jMgmCcEzpdZzQmYdqFq0KO0woXr1GV8H0t3n4Zvs+71MCH7A8I4Yz6j8sKU1SbNtMmBcRPsjdQE+YKK5d+GbOrPrVrqfpCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953453; c=relaxed/simple;
	bh=BfasfR/tea96AJAYi4nCE70KyUoZHt6HMi6w4/T1ma8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyW2iNaWqWf5xAHvxEoE/In5izv654/b+X1WXhlHe5Wze17EBQAvRVTF9dXcIZDila9u/sAio0INVSx4PdTbxCblMrNhrgBBJIksPIUqLVxGBgMzYTCw0JNND6hm14UanMhBWVUZ5QwyCtbpX+qf0FFUbbdhI87C9URcJ09mP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxVWkCI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3249C4CEE7;
	Wed,  8 Oct 2025 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759953452;
	bh=BfasfR/tea96AJAYi4nCE70KyUoZHt6HMi6w4/T1ma8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxVWkCI4OKICTQ+ONjGAoDEMC1lKwBEFNGfOkND9tg0s48/XmzHw+1Gom+G7Ddnwy
	 ppVuC6rPMvqVvD8QHjsctx5LPD50WBVNCYxxunW/kkZplZSH633wRPxQ7xy8A8e9DQ
	 SOaNySBEtWcBA6i00Jpxw15YdC7KfBdErORdvWWj6m95iUcUZqtDwGtzYKPB0HTzKL
	 fm/TlMVrN8OiOVCbZ9uynnVZAet60E6xZzTfxeCSc4ZjRnM5pEKlnMQeYTif7GPEWU
	 uFYKYblUmyEOFyYbaOG0wnTdujJb1lzQeQ1gOOmR3/Xa5cO+XmGSjs/fvTrWMxZhMr
	 64SU6eK3EVwkA==
Date: Wed, 8 Oct 2025 14:57:30 -0500
From: Rob Herring <robh@kernel.org>
To: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: ti,lm3532: Convert to DT Schema
Message-ID: <20251008195730.GA3771722-robh@kernel.org>
References: <20251002-ti-leds-to-dt-v1-0-1604ae333479@thegoodpenguin.co.uk>
 <20251002-ti-leds-to-dt-v1-1-1604ae333479@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-ti-leds-to-dt-v1-1-1604ae333479@thegoodpenguin.co.uk>

On Thu, Oct 02, 2025 at 10:20:15AM +0100, Harrison Carter wrote:
> Converts the ti,lm3532 to DT Schema format
> 
> Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
> ---
>  .../devicetree/bindings/leds/leds-lm3532.txt       | 105 -------------
>  .../devicetree/bindings/leds/ti,lm3532.yaml        | 172 +++++++++++++++++++++
>  2 files changed, 172 insertions(+), 105 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3532.txt b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
> deleted file mode 100644
> index 097490a5ff91206ce8c8f0fe0a093a043f089416..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-lm3532.txt
> +++ /dev/null
> @@ -1,105 +0,0 @@
> -* Texas Instruments - lm3532 White LED driver with ambient light sensing
> -capability.
> -
> -The LM3532 provides the 3 high-voltage, low-side current sinks. The device is
> -programmable over an I2C-compatible interface and has independent
> -current control for all three channels. The adaptive current regulation
> -method allows for different LED currents in each current sink thus allowing
> -for a wide variety of backlight and keypad applications.
> -
> -The main features of the LM3532 include dual ambient light sensor inputs
> -each with 32 internal voltage setting resistors, 8-bit logarithmic and linear
> -brightness control, dual external PWM brightness control inputs, and up to
> -1000:1 dimming ratio with programmable fade in and fade out settings.
> -
> -Required properties:
> -	- compatible : "ti,lm3532"
> -	- reg : I2C slave address
> -	- #address-cells : 1
> -	- #size-cells : 0
> -
> -Optional properties:
> -	- enable-gpios : gpio pin to enable (active high)/disable the device.
> -	- ramp-up-us - The Run time ramp rates/step are from one current
> -		       set-point to another after the device has reached its
> -		       initial target set point from turn-on
> -	- ramp-down-us - The Run time ramp rates/step are from one current
> -			 set-point to another after the device has reached its
> -			 initial target set point from turn-on
> -	Range for ramp settings: 8us - 65536us
> -
> -Optional properties if ALS mode is used:
> -	- ti,als-vmin - Minimum ALS voltage defined in Volts
> -	- ti,als-vmax - Maximum ALS voltage defined in Volts
> -	Per the data sheet the max ALS voltage is 2V and the min is 0V
> -
> -	- ti,als1-imp-sel - ALS1 impedance resistor selection in Ohms
> -	- ti,als2-imp-sel - ALS2 impedance resistor selection in Ohms
> -	Range for impedance select: 37000 Ohms - 1190 Ohms
> -	Values above 37kohms will be set to the "High Impedance" setting
> -
> -	- ti,als-avrg-time-us - Determines the length of time the device needs to
> -			  average the two ALS inputs.  This is only used if
> -			  the input mode is LM3532_ALS_INPUT_AVRG.
> -			     Range: 17920us - 2293760us
> -	- ti,als-input-mode - Determines how the device uses the attached ALS
> -			   devices.
> -			   0x00 - ALS1 and ALS2 input average
> -			   0x01 - ALS1 Input
> -			   0x02 - ALS2 Input
> -			   0x03 - Max of ALS1 and ALS2
> -
> -Required child properties:
> -	- reg : Indicates control bank the LED string is controlled by
> -	- led-sources : see Documentation/devicetree/bindings/leds/common.txt
> -	- ti,led-mode : Defines if the LED strings are manually controlled or
> -			if the LED strings are controlled by the ALS.
> -			0x00 - LED strings are I2C controlled via full scale
> -			       brightness control register
> -			0x01 - LED strings are ALS controlled
> -
> -Optional LED child properties:
> -	- label : see Documentation/devicetree/bindings/leds/common.txt
> -	- linux,default-trigger :
> -	   see Documentation/devicetree/bindings/leds/common.txt
> -	- led-max-microamp : Defines the full scale current value for each control
> -			  bank.  The range is from 5000uA-29800uA in increments
> -			  of 800uA.
> -
> -Example:
> -led-controller@38 {
> -	compatible = "ti,lm3532";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	reg = <0x38>;
> -
> -	enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> -	ramp-up-us = <1024>;
> -	ramp-down-us = <65536>;
> -
> -	ti,als-vmin = <0>;
> -	ti,als-vmax = <2000>;
> -	ti,als1-imp-sel = <4110>;
> -	ti,als2-imp-sel = <2180>;
> -	ti,als-avrg-time-us = <17920>;
> -	ti,als-input-mode = <0x00>;
> -
> -	led@0 {
> -		reg = <0>;
> -		led-sources = <2>;
> -		ti,led-mode = <1>;
> -		led-max-microamp = <21800>;
> -		label = ":backlight";
> -		linux,default-trigger = "backlight";
> -	};
> -
> -	led@1 {
> -		reg = <1>;
> -		led-sources = <1>;
> -		ti,led-mode = <0>;
> -		label = ":kbd_backlight";
> -	};
> -};
> -
> -For more product information please see the links below:
> -https://www.ti.com/product/LM3532
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3532.yaml b/Documentation/devicetree/bindings/leds/ti,lm3532.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..425277e519bd6de9822822685e9f101d0b3ef40a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3532.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lm3532.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments - lm3532 White LED driver with
> +  ambient light sensing capability.

Drop period.

> +
> +description: |
> +  The LM3532 provides the 3 high-voltage,
> +  low-side current sinks. The device is programmable over an
> +  I2C-compatible interface and has independent current
> +  control for all three channels. The adaptive current
> +  regulation method allows for different LED currents in
> +  each current sink thus allowing for a wide variety of
> +  backlight and keypad applications.
> +
> +  The main features of the LM3532 include dual ambient light
> +  sensor inputs each with 32 internal voltage setting
> +  resistors, 8-bit logarithmic and linear brightness
> +  control, dual external PWM brightness control inputs,
> +  and up to 1000:1 dimming ratio with programmable fade in
> +  and fade out settings.

Wrap lines at 80.

> +
> +  For more product information please see the link below:
> +  https://www.ti.com/product/LM3532
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +properties:
> +  compatible:
> +    const: ti,lm3532
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  enable-gpios:
> +    description: GPIO pin to enable (active high)/disable

Start paragraph on next line unless it fits on 1 line (and <80 chars).

> +      the device.
> +    maxItems: 1
> +
> +  ti,als-avrg-time-us:
> +    description: Determines the length of time the device
> +      needs to average the two ALS inputs.  This is only
> +      used if the input mode is LM3532_ALS_INPUT_AVRG.
> +    minimum: 17920
> +    maximum: 2293760
> +
> +  ti,als-input-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Determines how the device uses the attached
> +      ALS devices.
> +      0x00 - ALS1 and ALS2 input average
> +      0x01 - ALS1 Input
> +      0x02 - ALS2 Input
> +      0x03 - Max of ALS1 and ALS2
> +    minimum: 0
> +    maximum: 3
> +
> +patternProperties:
> +  "^ramp-(up|down)-us$":
> +    description: The Run time ramp rates/step are from one
> +      current set-point to another after the device has
> +      reached its initial target set point from turn-on
> +    minimum: 8
> +    maximum: 65536
> +
> +  "^ti,als-v(min|max)$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Min/max ALS voltage in Volts.
> +    minimum: 0
> +    maximum: 2
> +
> +  "^ti,als(1|2)-imp-sel$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ALS impedance resistor selection in Ohms.
> +      Values above 37kohms will be set to the "High
> +      Impedance" setting
> +    minimum: 1190
> +    maximum: 37000
> +
> +  "^led@[0,1]?([0-9]|[a-z])$":

Not the right unit-address. Should be hex values in the range of 
whatever 'reg' is.

> +    $ref: common.yaml#
> +    type: object
> +    properties:
> +      reg:
> +        description: Indicates control bank the LED string
> +          is controlled by

Constraints.

> +
> +      ti,led-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Defines if the LED strings are manually
> +            controlled or if the LED strings are controlled
> +            by the ALS.
> +            0x00 - LED strings are I2C controlled via full
> +                  scale brightness control register
> +            0x01 - LED strings are ALS controlled

You need '>' or '|' if there is formatting. Indent lists by 1 more tab.

> +        minimum: 0
> +        maximum: 1
> +
> +      led-max-microamp:
> +        minimum: 5000
> +        maximum: 29800
> +        multipleOf: 800
> +
> +    required:
> +      - reg
> +      - led-sources
> +      - ti,led-mode
> +
> +    unevaluatedProperties: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@38 {
> +            compatible = "ti,lm3532";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0x38>;
> +
> +            enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> +            ramp-up-us = <1024>;
> +            ramp-down-us = <65536>;
> +
> +            ti,als-vmin = <0>;
> +            ti,als-vmax = <2>;
> +            ti,als1-imp-sel = <4110>;
> +            ti,als2-imp-sel = <2180>;
> +            ti,als-avrg-time-us = <17920>;
> +            ti,als-input-mode = <0x00>;
> +
> +            led@0 {
> +                reg = <0>;
> +                led-sources = <2>;
> +                ti,led-mode = <1>;
> +                led-max-microamp = <21600>;
> +                label = ":backlight";
> +                linux,default-trigger = "backlight";
> +            };
> +
> +            led@1 {
> +                reg = <1>;
> +                led-sources = <1>;
> +                ti,led-mode = <0>;
> +                label = ":kbd_backlight";
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.51.0
> 

