Return-Path: <linux-leds+bounces-5309-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3BB34A4D
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 20:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 337DB486FD6
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 18:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873C93002AE;
	Mon, 25 Aug 2025 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrhPmcR/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A192741DA;
	Mon, 25 Aug 2025 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756146419; cv=none; b=U4s0ObfTQErcsIPNyGvdlToCbrx0rxcVhxXdb58fPlPTRFnQ0Ej1FnLMbUuehLTcF5UVvsX3R1473fIVyGFdhfJhYkFZlh4gEKURrQEcNAYZBuJ7cBcuvE+BfPFHHOooVB9TxWUfDOpsXR8duppw+mK0Hry/0rx2plkLpjCEI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756146419; c=relaxed/simple;
	bh=8jjwBC1R9LVbmmqeoSde0OMuXcU8ufGfaf0TLROKsAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObzW7BjG2OEJLVoLKOZRtIu4b4D+4HxICNucq7yEs9KDBkz/5JQ3Lmiy8riMQUp2v3raWrvjXRmbTin5e6NZeMNwGvppRIoqIIKpAZ8qo1IatTmZAa3wgaekZdykncIJkUAdkPEGA+g6CixSKZMKEo8j1jeNk7ZH6IzV8l+sezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrhPmcR/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F968C4CEED;
	Mon, 25 Aug 2025 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756146418;
	bh=8jjwBC1R9LVbmmqeoSde0OMuXcU8ufGfaf0TLROKsAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrhPmcR/alM7ldm1JxGV0JQSh4mwN+RPa5L2bAPnEW3ycAWFkt34uevfQjiJlIIOA
	 Ew7BuSyKKH9gjvT65Aj7Dp9xPa/l8rdpBpoAboYQEuTG+kVszrE1tFXWluYTZ2Kknb
	 8Qeehf3NHPGnbSLiclBoYfpe3g/7ZlfT9uw/9CY0rBuBZsCZm0Dha9MdO0s5j7RrOI
	 0tRZLz1mcm9/EWxBcAdGUpm828uYXF6cO+ODPn+HiKFJ4NJNgVb0Db9DsTnNAp8h5n
	 9kp5uR9BI46/nRb0HrdDoO7GF7Hw4GUczQRdI6L5sd9eewEYd1mT1behTISHLWt2/w
	 XJMKzpalyE5jA==
Date: Mon, 25 Aug 2025 13:26:57 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16xx
Message-ID: <20250825182521.GA4157069-robh@kernel.org>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-3-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825033237.60143-3-jefflessard3@gmail.com>

On Sun, Aug 24, 2025 at 11:32:28PM -0400, Jean-François Lessard wrote:
> Add documentation for TM16xx-compatible 7-segment LED display controllers
> with keyscan.
> 
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
> ---
> 
> Notes:
>     The 'segments' property is intentionally not vendor-prefixed as it
>     defines a generic hardware description concept applicable to any
>     7-segment display controller. The property describes the fundamental
>     grid/segment coordinate mapping that is controller-agnostic and could
>     be reused by other LED matrix display bindings. Similar to how 'gpios'
>     describes GPIO connections generically, 'segments' describes segment
>     connections in a standardized way using uint32-matrix format.
> 
>  .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 477 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  2 files changed, 482 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> new file mode 100644
> index 000000000..c94556d95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> @@ -0,0 +1,477 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/auxdisplay/titanmec,tm16xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Auxiliary displays based on TM16xx and compatible LED controllers
> +
> +maintainers:
> +  - Jean-François Lessard <jefflessard3@gmail.com>
> +
> +description: |
> +  LED matrix controllers used in auxiliary display devices that drive individual
> +  LED icons and 7-segment digit groups through a grid/segment addressing scheme.
> +  Controllers manage a matrix of LEDs organized as grids (columns/banks in
> +  vendor datasheets) and segments (rows/bit positions in vendor datasheets).
> +  Maximum grid and segment indices are controller-specific.
> +
> +  The controller is agnostic of the display layout. Board-specific LED wiring is
> +  described through child nodes that specify grid/segment coordinates for
> +  individual icons and segment mapping for 7-segment digits.
> +
> +  The bindings use separate 'leds' and 'digits' containers to accommodate
> +  different addressing schemes:
> +  - LEDs use 2-cell addressing (grid, segment) for matrix coordinates
> +  - Digits use 1-cell addressing with explicit segment mapping
> +
> +  The controller node exposes a logical LED-like control for the aggregate
> +  display brightness. Child nodes describe individual icons and 7-seg digits.
> +  The top-level control supports only label and brightness-related properties
> +  and does not support other common LED properties such as color or function.
> +  Child LED nodes use the standard LED binding.
> +
> +  Optional keypad scanning is supported when both 'linux,keymap' and
> +  'poll-interval' properties are specified.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fdhisi,fd628
> +              - princeton,pt6964
> +              - wxicore,aip1628
> +          - const: titanmec,tm1628
> +      - items:
> +          - enum:
> +              - wxicore,aip1618
> +          - const: titanmec,tm1618
> +      - items:
> +          - enum:
> +              - fdhisi,fd650
> +              - wxicore,aip650
> +          - const: titanmec,tm1650
> +      - enum:
> +          - fdhisi,fd620
> +          - fdhisi,fd655
> +          - fdhisi,fd6551
> +          - titanmec,tm1618
> +          - titanmec,tm1620
> +          - titanmec,tm1628
> +          - titanmec,tm1638
> +          - titanmec,tm1650
> +          - winrise,hbs658
> +
> +  reg:
> +    maxItems: 1
> +
> +  label:
> +    description:
> +      The label for the top-level LED. If omitted, the label is taken from the
> +      node name (excluding the unit address). It has to uniquely identify a
> +      device, i.e. no other LED class device can be assigned the same label.
> +    $ref: /schemas/leds/common.yaml#/properties/label
> +
> +  max-brightness:
> +    description:
> +      Normally the maximum brightness is determined by the hardware and this
> +      property is not required. This property is used to put a software limit
> +      on the brightness apart from what the driver says, as it could happen
> +      that a LED can be made so bright that it gets damaged or causes damage
> +      due to restrictions in a specific system, such as mounting conditions.
> +    $ref: /schemas/leds/common.yaml#/properties/max-brightness

These 2 $ref's should be at the node level. The clue is you 
copied-n-pasted the whole description.

What you need here is some constraints. What's the max value?

> +
> +  default-brightness:
> +    description:
> +      Brightness to be set if LED's default state is on. Used only during
> +      initialization. If the option is not set then max brightness is used.
> +    $ref: /schemas/types.yaml#/definitions/uint32

This needs to first go into leds/common.yaml.

> +
> +  digits:
> +    type: object
> +    description: Container for 7-segment digit group definitions
> +    additionalProperties: false
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^digit@[0-9]+$":
> +        type: object
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            description: Digit position identifier

Position is right to left (0 on right)? Please clarify.
 
> +            maxItems: 1
> +
> +          segments:
> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +            description: |
> +              Array of grid/segment coordinate pairs for each 7-segment position.
> +              Each entry is <grid segment> mapping to standard 7-segment positions
> +              in order: a, b, c, d, e, f, g
> +
> +              Standard 7-segment layout:
> +                 aaa
> +                f   b
> +                f   b
> +                 ggg
> +                e   c
> +                e   c
> +                 ddd
> +            items:
> +              items:
> +                - description: Grid index
> +                - description: Segment index

Can't you do an array instead and make the array index be the grid or 
segment index?

> +            minItems: 7
> +            maxItems: 7
> +
> +        required:
> +          - reg
> +          - segments
> +
> +  leds:
> +    type: object
> +    description: Container for individual LED icon definitions
> +    additionalProperties: false
> +
> +    properties:
> +      "#address-cells":
> +        const: 2
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^led@[0-9]+,[0-9]+$":
> +        type: object
> +        $ref: /schemas/leds/common.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            description:
> +              Grid and segment indices as <grid segment> of this individual LED icon
> +
> +        required:
> +          - reg
> +
> +allOf:
> +  - $ref: /schemas/input/input.yaml#
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +dependencies:
> +  poll-interval:
> +    - linux,keymap
> +  linux,keymap:
> +    - poll-interval
> +  autorepeat:
> +    - linux,keymap
> +    - poll-interval
> +
> +# SPI controllers require 3-wire (combined MISO/MOSI line)
> +if:

Move this under the allOf.

> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - fdhisi,fd620
> +          - fdhisi,fd628
> +          - princeton,pt6964
> +          - titanmec,tm1618
> +          - titanmec,tm1620
> +          - titanmec,tm1628
> +          - titanmec,tm1638
> +          - wxicore,aip1618
> +          - wxicore,aip1628
> +then:
> +  allOf:

Drop allOf.

> +    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  properties:
> +    spi-3wire: true

Drop 'properties'

> +  required:
> +    - spi-3wire
> +
> +required:

Order should be 'dependencies', 'required', 'allOf'.

> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    // I2C example: Magicsee N5 TV box with fd655 controller
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      display@24 {
> +        reg = <0x24>;
> +        compatible = "fdhisi,fd655";
> +
> +        digits {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          digit@0 {
> +            reg = <0>;
> +            segments = <4 3>, <4 4>, <4 5>, <4 0>, <4 1>, <4 2>, <4 6>;
> +          };
> +
> +          digit@1 {
> +            reg = <1>;
> +            segments = <3 3>, <3 4>, <3 5>, <3 0>, <3 1>, <3 2>, <3 6>;
> +          };
> +
> +          digit@2 {
> +            reg = <2>;
> +            segments = <2 3>, <2 4>, <2 5>, <2 0>, <2 1>, <2 2>, <2 6>;
> +          };
> +
> +          digit@3 {
> +            reg = <3>;
> +            segments = <1 3>, <1 4>, <1 5>, <1 0>, <1 1>, <1 2>, <1 6>;
> +          };
> +        };
> +
> +        leds {
> +          #address-cells = <2>;
> +          #size-cells = <0>;
> +
> +          led@0,0 {
> +            reg = <0 0>;
> +            function = LED_FUNCTION_ALARM;
> +          };
> +
> +          led@0,1 {
> +            reg = <0 1>;
> +            function = LED_FUNCTION_USB;
> +          };
> +
> +          led@0,2 {
> +            reg = <0 2>;
> +            function = "play";
> +          };
> +
> +          led@0,3 {
> +            reg = <0 3>;
> +            function = "pause";
> +          };
> +
> +          led@0,4 {
> +            reg = <0 4>;
> +            function = "colon";
> +          };
> +
> +          led@0,5 {
> +            reg = <0 5>;
> +            function = LED_FUNCTION_LAN;
> +          };
> +
> +          led@0,6 {
> +            reg = <0 6>;
> +            function = LED_FUNCTION_WLAN;
> +          };
> +        };
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/input/input.h>
> +
> +    // SPI example: TM1638 module with keypad support
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      display@0 {
> +        reg = <0>;
> +        compatible = "titanmec,tm1638";
> +        spi-3wire;
> +        spi-lsb-first;
> +        spi-max-frequency = <500000>;
> +
> +        label = "tm1638";
> +        default-brightness = <2>;
> +        max-brightness = <4>;
> +        poll-interval = <100>;
> +        linux,keymap = <MATRIX_KEY(2, 0, KEY_F1)
> +                        MATRIX_KEY(2, 2, KEY_F2)
> +                        MATRIX_KEY(2, 4, KEY_F3)
> +                        MATRIX_KEY(2, 6, KEY_F4)
> +                        MATRIX_KEY(2, 1, KEY_F5)
> +                        MATRIX_KEY(2, 3, KEY_F6)
> +                        MATRIX_KEY(2, 5, KEY_F7)
> +                        MATRIX_KEY(2, 7, KEY_F8)>;
> +
> +        digits {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          digit@0 {
> +            reg = <0>;
> +            segments = <7 0>, <7 1>, <7 2>, <7 3>, <7 4>, <7 5>, <7 6>;
> +          };
> +
> +          digit@1 {
> +            reg = <1>;
> +            segments = <6 0>, <6 1>, <6 2>, <6 3>, <6 4>, <6 5>, <6 6>;
> +          };
> +
> +          digit@2 {
> +            reg = <2>;
> +            segments = <5 0>, <5 1>, <5 2>, <5 3>, <5 4>, <5 5>, <5 6>;
> +          };
> +
> +          digit@3 {
> +            reg = <3>;
> +            segments = <4 0>, <4 1>, <4 2>, <4 3>, <4 4>, <4 5>, <4 6>;
> +          };
> +
> +          digit@4 {
> +            reg = <4>;
> +            segments = <3 0>, <3 1>, <3 2>, <3 3>, <3 4>, <3 5>, <3 6>;
> +          };
> +
> +          digit@5 {
> +            reg = <5>;
> +            segments = <2 0>, <2 1>, <2 2>, <2 3>, <2 4>, <2 5>, <2 6>;
> +          };
> +
> +          digit@6 {
> +            reg = <6>;
> +            segments = <1 0>, <1 1>, <1 2>, <1 3>, <1 4>, <1 5>, <1 6>;
> +          };
> +
> +          digit@7 {
> +            reg = <7>;
> +            segments = <0 0>, <0 1>, <0 2>, <0 3>, <0 4>, <0 5>, <0 6>;
> +          };
> +        };
> +
> +        leds {
> +          #address-cells = <2>;
> +          #size-cells = <0>;
> +
> +          led@0,7 {
> +            reg = <0 7>;
> +          };
> +
> +          led@1,7 {
> +            reg = <1 7>;
> +          };
> +
> +          led@2,7 {
> +            reg = <2 7>;
> +          };
> +
> +          led@3,7 {
> +            reg = <3 7>;
> +          };
> +
> +          led@4,7 {
> +            reg = <4 7>;
> +          };
> +
> +          led@5,7 {
> +            reg = <5 7>;
> +          };
> +
> +          led@6,7 {
> +            reg = <6 7>;
> +          };
> +
> +          led@7,7 {
> +            reg = <7 7>;
> +          };
> +        };
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    // SPI example: X96 Max with transposed layout (fd628 with tm1628 fallback)
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      display@0 {
> +        reg = <0>;
> +        compatible = "fdhisi,fd628", "titanmec,tm1628";
> +        spi-3wire;
> +        spi-lsb-first;
> +        spi-max-frequency = <500000>;
> +
> +        digits {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          digit@0 {
> +            reg = <0>;
> +            segments = <0 3>, <1 3>, <2 3>, <3 3>, <4 3>, <5 3>, <6 3>;
> +          };
> +
> +          digit@1 {
> +            reg = <1>;
> +            segments = <0 2>, <1 2>, <2 2>, <3 2>, <4 2>, <5 2>, <6 2>;
> +          };
> +
> +          digit@2 {
> +            reg = <2>;
> +            segments = <0 1>, <1 1>, <2 1>, <3 1>, <4 1>, <5 1>, <6 1>;
> +          };
> +
> +          digit@3 {
> +            reg = <3>;
> +            segments = <0 0>, <1 0>, <2 0>, <3 0>, <4 0>, <5 0>, <6 0>;
> +          };
> +        };
> +
> +        leds {
> +          #address-cells = <2>;
> +          #size-cells = <0>;
> +
> +          led@0,4 {
> +            reg = <0 4>;
> +            function = "apps";
> +          };
> +
> +          led@1,4 {
> +            reg = <1 4>;
> +            function = "setup";
> +          };
> +
> +          led@2,4 {
> +            reg = <2 4>;
> +            function = LED_FUNCTION_USB;
> +          };
> +
> +          led@3,4 {
> +            reg = <3 4>;
> +            function = LED_FUNCTION_SD;
> +          };
> +
> +          led@4,4 {
> +            reg = <4 4>;
> +            function = "colon";
> +          };
> +
> +          led@5,4 {
> +            reg = <5 4>;
> +            function = "hdmi";
> +          };
> +
> +          led@6,4 {
> +            reg = <6 4>;
> +            function = "video";
> +          };
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index daf520a13..4e5a7db6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25402,6 +25402,11 @@ W:	http://sourceforge.net/projects/tlan/
>  F:	Documentation/networking/device_drivers/ethernet/ti/tlan.rst
>  F:	drivers/net/ethernet/ti/tlan.*
>  
> +TM16XX-COMPATIBLE LED CONTROLLERS DISPLAY DRIVER
> +M:	Jean-François Lessard <jefflessard3@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> +
>  TMIO/SDHI MMC DRIVER
>  M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
>  L:	linux-mmc@vger.kernel.org
> -- 
> 2.43.0
> 

