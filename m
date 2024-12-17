Return-Path: <linux-leds+bounces-3628-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8659F4DC3
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 15:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 549DB1892EE1
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 14:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5F31F541A;
	Tue, 17 Dec 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rl1FQrSA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D71F4E3D;
	Tue, 17 Dec 2024 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734445881; cv=none; b=WMhKMCEiXVmh6FzacVxjVnxcHbkGZ3UZIqb5BZ0RJ0KoMaRZ9IdkYLr+YyV/JzLLG5cDSF6cxO+NxphiT959OGknLft3EnssD0hhpqHLnqMJm6q6QTJd8SD0jjfw9JvAXQr39erf+RFncMYrpQkpYwbg9VAxQ5Dcz7KpfXi5kD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734445881; c=relaxed/simple;
	bh=V9TDhmi59LzHBOGgVtDCCY/ODcu5Rf4X5l1mTahaaoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGb2Rpa/mjQuXQs24TTlG8FpPZbFQ0B21mqSz69zRLZ6K95c4BEpKLdIxxx3uGLrRmQQJYIeAov4qLqbAldxkMJbYqeLa1P+nXWGamN8ZSF0ZylY2YIJ+h+n7bfQfvJ0d3fOy0f9rlgA0nAH6/twI8bVUDw8bzrXttI9EmJNQV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rl1FQrSA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C2BC4CEDD;
	Tue, 17 Dec 2024 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445879;
	bh=V9TDhmi59LzHBOGgVtDCCY/ODcu5Rf4X5l1mTahaaoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rl1FQrSAHALaDtk3T/oe1RYspGPxLD/K8WiHm8dY+EQCBzIecf4Y33PYgKBvtpivT
	 iDUSGamODFOEBvLLq7T4QG7CGYuc6Rdud5E2I2Gl87C7a0s3YEPHmb2bcHHU0fYZF0
	 7C8Alh8bbJQTH0UeiBi8dhTMx1bRBhyTW7V2FwJlN51jm0V/rFVQGP6asVPbkmuvCt
	 LwrsLJsUcKOi9MT3ofIoNjqCt+iDaTPcOsfC/fFME9Y/eA+/vs5icLamZ5AtwcLOM4
	 B2Fj6BTeuAwyIx5F1MzOw/3Mqk/1OO0Rj8pdDKzcuDnGs1u8rgzlb7ROqKt2PznU9s
	 Sd6V7NNNe0Buw==
Date: Tue, 17 Dec 2024 08:31:17 -0600
From: Rob Herring <robh@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Convert LP8860 into YAML format
Message-ID: <20241217143117.GA1612104-robh@kernel.org>
References: <20241211170734.2345887-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211170734.2345887-1-alexander.sverdlin@siemens.com>

On Wed, Dec 11, 2024 at 06:07:29PM +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Convert Texas Instruments' LP8860 LED driver bindings into YAML format.
> 
> Acked-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v2: patternProperties: ^led@[0]$ -> ^led(@[0-3])?$
> 
>  .../devicetree/bindings/leds/leds-lp8860.txt  | 50 ----------
>  .../devicetree/bindings/leds/ti,lp8860.yaml   | 95 +++++++++++++++++++
>  2 files changed, 95 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> deleted file mode 100644
> index 8bb25749a3da3..0000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -* Texas Instruments - lp8860 4-Channel LED Driver
> -
> -The LP8860-Q1 is an high-efficiency LED
> -driver with boost controller. It has 4 high-precision
> -current sinks that can be controlled by a PWM input
> -signal, a SPI/I2C master, or both.
> -
> -Required properties:
> -	- compatible :
> -		"ti,lp8860"
> -	- reg : I2C slave address
> -	- #address-cells : 1
> -	- #size-cells : 0
> -
> -Optional properties:
> -	- enable-gpios : gpio pin to enable (active high)/disable the device.
> -	- vled-supply : LED supply
> -
> -Required child properties:
> -	- reg : 0
> -
> -Optional child properties:
> -	- function : see Documentation/devicetree/bindings/leds/common.txt
> -	- color : see Documentation/devicetree/bindings/leds/common.txt
> -	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
> -	- linux,default-trigger :
> -	   see Documentation/devicetree/bindings/leds/common.txt
> -
> -Example:
> -
> -#include <dt-bindings/leds/common.h>
> -
> -led-controller@2d {
> -	compatible = "ti,lp8860";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	reg = <0x2d>;
> -	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> -	vled-supply = <&vbatt>;
> -
> -	led@0 {
> -		reg = <0>;
> -		function = LED_FUNCTION_BACKLIGHT;
> -		color = <LED_COLOR_ID_WHITE>;
> -		linux,default-trigger = "backlight";
> -	};
> -}
> -
> -For more product information please see the link below:
> -https://www.ti.com/product/lp8860-q1
> diff --git a/Documentation/devicetree/bindings/leds/ti,lp8860.yaml b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> new file mode 100644
> index 0000000000000..98eef21604b86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lp8860.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments - lp8860 4-Channel LED Driver
> +
> +maintainers:
> +  - Andrew Davis <afd@ti.com>
> +
> +description: |
> +  The LP8860-Q1 is an high-efficiency LED driver with boost controller.
> +  It has 4 high-precision current sinks that can be controlled by a PWM input
> +  signal, a SPI/I2C master, or both.
> +
> +  For more product information please see the link below:
> +    https://www.ti.com/product/lp8860-q1
> +
> +properties:
> +  compatible:
> +    const: ti,lp8860
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C slave address
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO pin to enable (active high) / disable the device
> +
> +  vled-supply:
> +    description: LED supply
> +
> +patternProperties:
> +  "^led(@[0-3])?$":

unit-address can't be optional if 'reg' is required. And if 'reg' is 
made optional, then so should #address-cells/#size-cells.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          Index of the LED.
> +        const: 0
> +
> +      function: true
> +      color: true
> +      label: true
> +      linux,default-trigger: true
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
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
> +        led-controller@2d {
> +            compatible = "ti,lp8860";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0x2d>;
> +            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +            vled-supply = <&vbatt>;
> +
> +            led@0 {
> +                reg = <0>;
> +                function = LED_FUNCTION_BACKLIGHT;
> +                color = <LED_COLOR_ID_WHITE>;
> +                linux,default-trigger = "backlight";
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.47.1
> 

