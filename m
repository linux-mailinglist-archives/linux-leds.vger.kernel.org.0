Return-Path: <linux-leds+bounces-5669-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A876CBC31FF
	for <lists+linux-leds@lfdr.de>; Wed, 08 Oct 2025 03:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D3803AB284
	for <lists+linux-leds@lfdr.de>; Wed,  8 Oct 2025 01:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C2B299A84;
	Wed,  8 Oct 2025 01:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO0IvzA6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB55298991;
	Wed,  8 Oct 2025 01:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759888332; cv=none; b=qGj7Ki8SdYZgClQmQbZtCcxAYG1LCwxE/Q2uJ6Lg3D2mSo8GcQww4gc9QswObMU+p3U3HJMtBHvJ6SNdKDR3xXIYn3+74rL4cu5K3fCkEzF4rvRHZWkYj5m0Y/VTVbMve+gSZbs9S4V0GCne9NuHYMGhBUWFlj57v2+ObWe5bm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759888332; c=relaxed/simple;
	bh=5AFl3n3LAr3gOBJkKSOwHWSJop5Q7yIEH3hGBTfEgqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnysskIZbDF7WcNM9LkmEdNgcvOA4wJfuYk6gLQ/hskuJt2D69rdgbDMqe/+3glR53farRtTsiIhLNvLM/nzv+KZSyrLSb8Pev6NXZctnjxauSytQrPH+8GfCFCmrrWIDCvB6O2s1f3R+SyULc4r1VlYRB+/K+aWCirybN7oWtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO0IvzA6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FF9C4CEF1;
	Wed,  8 Oct 2025 01:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759888331;
	bh=5AFl3n3LAr3gOBJkKSOwHWSJop5Q7yIEH3hGBTfEgqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iO0IvzA6fm2xYBVCP6dV3BCvm1RaXUx1yOVIuPGvkKOjjZ7rYV7JEbXNHZmwOzQoq
	 cLr1Y0WMqQRRWmxONiY/iFmHg0zJFlM0U4gPiMyWytRV20yRqMYE3PG7QPBMh2TDKJ
	 pTT/RgtrUjhYQ0h8IPw27FxlUP3kVQ7VfyfX8DA6EYWp/D0xwMeYJ0z8fQoz5bIjca
	 pBTZDbfbvBcZvdOx7/H32viC49Wk/lA8VXawvLn3voCpmeti836LDLDbC8URWoElxm
	 LhsepGAaNbrf9vzCN1HCJahF+azeSevrCB412zsSAzfaLTpqSJfNZrl7XaWqR8DTV3
	 2aBm/jNCBnqHA==
Date: Tue, 7 Oct 2025 20:52:10 -0500
From: Rob Herring <robh@kernel.org>
To: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Gorski <jonas.gorski@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT Schema
Message-ID: <20251008015210.GA1925508-robh@kernel.org>
References: <20250930-brcm6358-to-dt-v1-1-ba833ceb1575@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-brcm6358-to-dt-v1-1-ba833ceb1575@thegoodpenguin.co.uk>

On Tue, Sep 30, 2025 at 11:27:26AM +0100, Harrison Carter wrote:
> Convert the brcm,bcm6358 LEDs to DT Schema format
> 
> Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
> ---
>  .../bindings/leds/brcm,bcm6358-leds.yaml           | 187 +++++++++++++++++++++
>  .../devicetree/bindings/leds/leds-bcm6358.txt      | 143 ----------------
>  2 files changed, 187 insertions(+), 143 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a9052a29aa7bd6ddc252258bfe4982325499713f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> @@ -0,0 +1,187 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/brcm,bcm6358-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to Broadcom BCM6358 controller
> +
> +description: This controller is present on BCM6358 and

Start paragraph on new line.

> +  BCM6368. In these SoCs there are Serial LEDs (LEDs
> +  connected to a 74x164 controller), which can either be
> +  controlled by software (exporting the 74x164 as spi-gpio) 
> +  or by hardware using this driver. See example at
> +  Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml.

Wrap lines at 80 chars.

> +
> +maintainers:
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm6358-leds
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
> +  brcm,clk-div:
> +    description: SCK signal Divider. Default 1
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8]

default: 1

And drop it from the description.

> +
> +  brcm,clk-dat-low:
> +    description: Makes clock and data signals active low.
> +      Default false.

Default false makes no sense. That's always the case for a boolean. The 
only way it can't be is if it is required, but then what is the point of 
a required boolean property.
 
> +    type: boolean
> +
> +patternProperties:
> +  "^led@[0,1]?([0-9]|[a-z])$":

This should be 0-0x1f. So '^led@(0|1?[0-9a-f])$'

> +    type: object
> +    $ref: common.yaml

       unevaluatedProperties: false

(which will make your example fail)

> +    description: Each LED is represented as a sub-node of
> +      this device.
> +
> +    properties:
> +      reg:
> +        description: LED pin number
> +        maximum: 31
> +        minimum: 0
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
> +additionalProperties: true

Cannot be true. Only false is allowed.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    /* The bcm6358 SOC */
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Drop this node. Unnecessary for the example.

> +
> +        led-controller@fffe00d0 {
> +            compatible = "brcm,bcm6358-leds";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0xfffe00d0 0x8>;
> +
> +            alarm_white@0 {
> +                reg = <0>;
> +                active-low;
> +                label = "white:alarm";
> +            };
> +            tv_white@2 {
> +                reg = <2>;
> +                active-low;
> +                label = "white:tv";
> +            };
> +            tel_white@3 {
> +                reg = <3>;
> +                active-low;
> +                label = "white:tel";
> +            };
> +            adsl_white@4 {
> +                reg = <4>;
> +                active-low;
> +                label = "white:adsl";
> +            };
> +        };
> +    };
> +  - |
> +    /* The bcm6368 SOC */
> +    led-controller@100000d0 {
> +        compatible = "brcm,bcm6358-leds";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x100000d0 0x8>;
> +
> +        brcm,pol-low;
> +        brcm,clk-div = <4>;
> +
> +        power_red@0 {
> +            reg = <0>;
> +            active-low;
> +            label = "red:power";
> +        };
> +        power_green@1 {
> +            reg = <1>;
> +            active-low;
> +            label = "green:power";
> +            default-state = "on";
> +        };
> +        power_blue@2 {
> +            reg = <2>;
> +            label = "blue:power";
> +        };
> +        broadband_red@3 {
> +            reg = <3>;
> +            active-low;
> +            label = "red:broadband";
> +        };
> +        broadband_green@4 {
> +            reg = <4>;
> +            label = "green:broadband";
> +        };
> +        broadband_blue@5 {
> +            reg = <5>;
> +            active-low;
> +            label = "blue:broadband";
> +        };
> +        wireless_red@6 {
> +            reg = <6>;
> +            active-low;
> +            label = "red:wireless";
> +        };
> +        wireless_green@7 {
> +            reg = <7>;
> +            active-low;
> +            label = "green:wireless";
> +        };
> +        wireless_blue@8 {
> +            reg = <8>;
> +            label = "blue:wireless";
> +        };
> +        phone_red@9 {
> +            reg = <9>;
> +            active-low;
> +            label = "red:phone";
> +        };
> +        phone_green@10 {
> +            reg = <10>;
> +            active-low;
> +            label = "green:phone";
> +        };
> +        phone_blue@11 {
> +            reg = <11>;
> +            label = "blue:phone";
> +        };
> +        upgrading_red@12 {
> +            reg = <12>;
> +            active-low;
> +            label = "red:upgrading";
> +        };
> +        upgrading_green@13 {
> +            reg = <13>;
> +            active-low;
> +            label = "green:upgrading";
> +        };
> +        upgrading_blue@14 {
> +            reg = <14>;
> +            label = "blue:upgrading";
> +        };
> +    };

I don't think we need 2 examples.

Rob

