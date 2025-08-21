Return-Path: <linux-leds+bounces-5270-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C15CEB2F010
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 09:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5697D18858EC
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 07:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D152727E7;
	Thu, 21 Aug 2025 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbQ+CBsl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B9A1CCEE0;
	Thu, 21 Aug 2025 07:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755762505; cv=none; b=M1tTZ9+BZSJwt+iYTxLeJxaf+E9b22039NCiD2GF1U5W7Ni5fR99yFUzrqUtQjmS5ThHDdeEGVqqldQUfIPjgst1bTGjrWvPKcct3AEk1HzrP96Txrr+/O7wdHwcZFQKgLme5Vg9wf3CD/kDBAHbyF0LAanyLXLpmC+XJs3yA1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755762505; c=relaxed/simple;
	bh=HYeRAvRb3rfgv0xY7vus9iwQsutYh/rKrcDeQlXqn9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQPXYHhHNY+OkxxtxYHxVFFwSXHIxYMFll4rjYb5AHdGY1DkKO1w2msPHl7hPe2qbFvxahAOcV8s3vYSqz/pV3jfHEOd8/2Zzne5y/dUTVQN9GRq72kqwShKQ4CtaI5Fe2YApg0kkcFxm696/iCoRsZsb+urRsAe3q2FKxj5bds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbQ+CBsl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16450C116C6;
	Thu, 21 Aug 2025 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755762504;
	bh=HYeRAvRb3rfgv0xY7vus9iwQsutYh/rKrcDeQlXqn9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbQ+CBslJrB9QPvxzNUalzN/Hh0VKb4KBJ8N4XTJfNNl0Wrc2QstWveFIY9se27SO
	 YcpFwt2sqvj8MrusNTFBERcWClfX4GnKxYdDL1VQsw3NboW1XSiAXXUT7kgoGoA6v6
	 zR5pu5qbcHg92V3TJF58bBpM2U8URZwAfCOufmSS27S37ercLYCbBB0QudPvDeFVm7
	 KSHb84mblAFHV0VgjQeNv6dFoqVKgM5u3d0uwRS1KiICNJQiHGMe4JwkfbzeOR0SKg
	 Zx0vjByhlUJ+WilQmGCPJoJ+U+akuwmJUaFv0IpXFCctkTVeBkILp6BdfjaDiyVjsP
	 iFrqwM0CwbQBQ==
Date: Thu, 21 Aug 2025 09:48:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Jean-Fran=C3=A7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16xx
Message-ID: <20250821-funny-hasty-poodle-582053@kuoka>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-3-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250820163120.24997-3-jefflessard3@gmail.com>

On Wed, Aug 20, 2025 at 12:31:15PM -0400, Jean-Fran=C3=A7ois Lessard wrote:
> Add documentation for TM16xx-compatible 7-segment LED display controllers=
 with
> keyscan.

Here and other patches - this is not wrapped.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/subm=
itting-patches.rst#L597

>=20
> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>
> ---
>=20
> Note: The 'segments' property is intentionally not vendor-prefixed as it =
defines
> a generic hardware description concept applicable to any 7-segment display
> controller. The property describes the fundamental grid/segment coordinate
> mapping that is controller-agnostic and could be reused by other LED matr=
ix
> display bindings. Similar to how 'gpios' describes GPIO connections gener=
ically,
> 'segments' describes segment connections in a standardized way using
> uint32-matrix format.
>=20
>  .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 471 ++++++++++++++++++
>  1 file changed, 471 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec=
,tm16xx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=
=2Eyaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> new file mode 100644
> index 000000000..b563c6e1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> @@ -0,0 +1,471 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/auxdisplay/titanmec,tm16xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Auxiliary displays based on TM16xx and compatible LED controllers
> +
> +maintainers:
> +  - Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>
> +
> +description: |
> +  LED matrix controllers used in auxiliary display devices that drive in=
dividual
> +  LED icons and 7-segment digit groups through a grid/segment addressing=
 scheme.
> +  Controllers manage a matrix of LEDs organized as grids (columns/banks =
in
> +  vendor datasheets) and segments (rows/bit positions in vendor datashee=
ts).
> +  Maximum grid and segment indices are controller-specific.
> +
> +  The controller is agnostic of the display layout. Board-specific LED w=
iring is
> +  described through child nodes that specify grid/segment coordinates for
> +  individual icons and segment mapping for 7-segment digits.
> +
> +  The bindings use separate 'leds' and 'digits' containers to accommodate
> +  different addressing schemes:
> +  - LEDs use 2-cell addressing (grid, segment) for matrix coordinates
> +  - Digits use 1-cell addressing with explicit segment mapping
> +
> +  Optional keypad scanning is supported when both 'linux,keymap' and
> +  'poll-interval' properties are specified.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      # Controllers with titanmec,tm1628 fallback

Drop comment, obvious. Schema tells that.

> +      - items:
> +          - enum:
> +              - fdhisi,fd628
> +              - princeton,pt6964
> +              - wxicore,aip1628
> +          - const: titanmec,tm1628
> +      - const: titanmec,tm1628

This is part of one enum

> +      # Controllers with titanmec,tm1618 fallback
> +      - items:
> +          - enum:
> +              - wxicore,aip1618
> +          - const: titanmec,tm1618
> +      - const: titanmec,tm1618

Enum...

> +      # Controllers with titanmec,tm1650 fallback
> +      - items:
> +          - enum:
> +              - fdhisi,fd650
> +              - wxicore,aip650
> +          - const: titanmec,tm1650
> +      - const: titanmec,tm1650
> +      # Canonical standalone controllers

Drop

> +      - const: fdhisi,fd620
> +      - const: fdhisi,fd655
> +      - const: fdhisi,fd6551
> +      - const: titanmec,tm1620
> +      - const: titanmec,tm1638
> +      - const: winrise,hbs658

This is one enum

> +
> +  reg:
> +    maxItems: 1
> +
> +  label:
> +    description: Name of the entire device
> +    default: display

Huh? Why do you need label? Are you sure auxdisplays have labels?


> +
> +  default-brightness:
> +    description:
> +      Brightness to be set if LED's default state is on. Used only during
> +      initialization. If the option is not set then max brightness is us=
ed.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  max-brightness:
> +    description:
> +      Normally the maximum brightness is determined by the hardware and =
this
> +      property is not required. This property is used to put a software =
limit
> +      on the brightness apart from what the driver says, as it could hap=
pen
> +      that a LED can be made so bright that it gets damaged or causes da=
mage
> +      due to restrictions in a specific system, such as mounting conditi=
ons.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  linux,keymap:
> +    $ref: /schemas/input/matrix-keymap.yaml#/properties/linux,keymap
> +
> +  poll-interval:
> +    $ref: /schemas/input/input.yaml#/properties/poll-interval
> +
> +  autorepeat:
> +    $ref: /schemas/input/input.yaml#/properties/autorepeat

You rather miss some reference to input or touchscreen.

> +
> +  digits:
> +    type: object
> +    description: Container for 7-segment digit group definitions

additionalProperties go here

and blank line

> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^digit@[0-9]+$":
> +        type: object

unevaluatedProperties

Blank line

> +        properties:
> +          reg:
> +            description: Digit position identifier
> +            maxItems: 1

Blank line

> +          segments:
> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +            description: |
> +              Array of grid/segment coordinate pairs for each 7-segment =
position.
> +              Each entry is <grid segment> mapping to standard 7-segment=
 positions
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
> +        required:
> +          - reg
> +          - segments
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
> +  leds:
> +    type: object
> +    description: Container for individual LED icon definitions
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
> +        properties:
> +          reg:
> +            description:
> +              Grid and segment indices as <grid segment> of this individ=
ual LED icon
> +        required:
> +          - reg
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false

Best regards,
Krzysztof


