Return-Path: <linux-leds+bounces-6377-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CDFCA44D0
	for <lists+linux-leds@lfdr.de>; Thu, 04 Dec 2025 16:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3FD13006727
	for <lists+linux-leds@lfdr.de>; Thu,  4 Dec 2025 15:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62552D97B4;
	Thu,  4 Dec 2025 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0m9gGyI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846CA246778;
	Thu,  4 Dec 2025 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764862949; cv=none; b=K1/8oYiFFNztlpyCX4XRX0ypKxtGwcr+djiQ+10G5rC6H/FvUD3vPMHVENW4QB8a5/e2boMjlTgBOwvKVzBBd9fvef6ZL0PmMArGfq6eBIw8d9YFEHWP9pqPPPUvdBpZP0HzvGPHuX6+glO8YSkGTaUkZyLE4o8uZEUzr4+KbeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764862949; c=relaxed/simple;
	bh=wMKrgDBFZejPqANnmpv/GOF5EXF1et8uBBfWMKfCJfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQhJT1ohMSo5nGo5ymjo//5tf6PLwcLzYhMdWVfnQLVEhb6f0k/YhzY90exBUA0pS2oWUVk2hHUmx+MQWhStIMQILnE2n6G8PfZHvb1nBm1kj1q8j+3BCwsQcZMRoOKlNWv2kop+sZwFAZPngn/troHB8oGQ/EBgRQQ8oOJa5Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0m9gGyI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05FEC4CEFB;
	Thu,  4 Dec 2025 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764862949;
	bh=wMKrgDBFZejPqANnmpv/GOF5EXF1et8uBBfWMKfCJfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0m9gGyI+iV9NqtIIVHA4MxjJO0thL9iqJNzQ1oBI9rKEe7tKRCzod6zrQ6hV1iAI
	 F+hrN6+fvZxY8lk3CIx0b4iu/8JfeWruXa19q0YnoRxkEYv9Y+FXEu4DQWAWHsg0B5
	 K6BMnLlC8zYbu/FX10gsx6HjpFHA4feBBFlt1FporzGuC7mvYE/KKggnEBLeI59Ibj
	 QZLQ/EEdxKeCfYLKAObVapl48Z4WmgWK+NdcRJVzETgPOGR/mptszcI7j9dFNRbGQk
	 jXEhCMkjZXeAKxhpwomHhkZjryGLYiDdAR4MNUOym+14fd4Dy0dEcDFTwqE1jQGKjH
	 xL5yfIuDROuQg==
Date: Thu, 4 Dec 2025 09:42:26 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/7] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16xx
Message-ID: <20251204154226.GA1528151-robh@kernel.org>
References: <20251121145911.176033-1-jefflessard3@gmail.com>
 <20251121145911.176033-4-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121145911.176033-4-jefflessard3@gmail.com>

On Fri, Nov 21, 2025 at 09:59:03AM -0500, Jean-François Lessard wrote:
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
>     The property uses explicit coordinate pairs to handle real-world
>     hardware variations. Some board manufacturers use standard layouts
>     (same grid, different segments per digit) while others use transposed
>     layouts (same segment, different grids per digit). The coordinate-pair
>     approach accommodates both patterns without requiring separate arrays
>     or boolean flags, as confirmed acceptable by DT maintainers.
> 
>     Retained 'properties:' wrapper for spi-3wire in conditional block.
>     Rob Herring suggested removing it, but dt_binding_check requires
>     explicit 'properties:' context when referencing peripheral
>     properties within allOf conditional sections to satisfy
>     unevaluatedProperties validation. This follows the pattern in
>     spi-controller.yaml itself.
> 
>  .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 465 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  2 files changed, 470 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> new file mode 100644
> index 000000000000..a852d8b8882c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> @@ -0,0 +1,465 @@
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
> +  Maximum brightness and grid/segment indices are controller-specific.
> +  Controller-specific maximum are validated in the driver.
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
> +
> +  max-brightness:
> +    minimum: 0  # 0=off
> +    maximum: 8  # Maximum across all TM16xx controllers
> +    description:
> +      Normally the maximum brightness is determined by the hardware and this
> +      property is not required. This property is used to put a software limit
> +      on the brightness apart from what the driver says, as it could happen
> +      that a LED can be made so bright that it gets damaged or causes damage
> +      due to restrictions in a specific system, such as mounting conditions.
> +
> +  default-brightness:
> +    minimum: 0  # 0=off
> +    maximum: 8  # Maximum across all TM16xx controllers
> +    description:
> +      Brightness to be set if LED's default state is on. Used only during
> +      initialization. If the option is not set then max brightness is used.
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
> +      "^digit@[0-9a-f]+$":
> +        type: object
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            description:
> +              Digit position identifier numbered sequentially left-to-right,
> +              with reg=0 representing the leftmost digit position as displayed
> +              to the user.
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
> +      "^led@[0-9a-f]+,[0-9a-f]+$":
> +        type: object
> +        description:
> +          Individual LED icon addressed by <grid>,<segment> matrix coordinates.
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
> +dependencies:
> +  poll-interval:
> +    - linux,keymap
> +  linux,keymap:
> +    - poll-interval
> +  autorepeat:
> +    - linux,keymap
> +    - poll-interval
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: /schemas/leds/common.yaml#
> +    properties:
> +      color: false
> +      function: false
> +      function-enumerator: false
> +  - $ref: /schemas/input/input.yaml#
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +  # SPI controllers require 3-wire (combined MISO/MOSI line)
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fdhisi,fd620
> +              - fdhisi,fd628
> +              - princeton,pt6964
> +              - titanmec,tm1618
> +              - titanmec,tm1620
> +              - titanmec,tm1628
> +              - titanmec,tm1638
> +              - wxicore,aip1618
> +              - wxicore,aip1628
> +    then:
> +      $ref: /schemas/spi/spi-peripheral-props.yaml#
> +      properties:
> +        spi-3wire: true

You can drop properties here.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +      required:
> +        - spi-3wire

