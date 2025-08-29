Return-Path: <linux-leds+bounces-5326-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9CDB3BF24
	for <lists+linux-leds@lfdr.de>; Fri, 29 Aug 2025 17:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781895E6489
	for <lists+linux-leds@lfdr.de>; Fri, 29 Aug 2025 15:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445AD32143E;
	Fri, 29 Aug 2025 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUDN2gmo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794C2765D7;
	Fri, 29 Aug 2025 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756481178; cv=none; b=o1whImTWGohH2VaKrzX6IllR11e38LA4CSX/IjcZ+IWM2xjmIBJBggrrX/mc2Q8vaQaQ4EumsMv/J8WMOMV2m73ih+s+y3+Db8LJ51Kc1xDLIMb+rq3Uk3Ua9XLgrhcle2vvucOklCpLvt47bjldX/hsJE1V7REMYdeY0a5fUXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756481178; c=relaxed/simple;
	bh=TPFu6Khp9L6IpKUkTqFgrP/bSu5wHFopzmPEk9XSjzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Czi0RFGNQET2nl8GLsEDPinDjddbZifgVfybCZemcDfvB9PnOVqwJK5mMnzgmc36ja05TOZkRCnKmDAYR5so2B5FTie2nuTIN6Bb4I4v/cZ5ODtee9Vd/JDEhT4A+uOK0ljVNn1Sj2pQm46ZS/+na3VrEtttUiSqzrKPb+AYCNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUDN2gmo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F438C4CEF0;
	Fri, 29 Aug 2025 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756481175;
	bh=TPFu6Khp9L6IpKUkTqFgrP/bSu5wHFopzmPEk9XSjzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUDN2gmouDOZ+qMdFb2TsLgKvGo2c6BKLMisKg77CFmeh6Z+g/3uY05USydh8fboQ
	 iDzLXQMwhi9K3I/JmUZoMQdnSorslOaj0zlxVxk7Dj2kLvr0cPHm+KZT6Nci9zBPuQ
	 BYO+bbyTHV0lCOTh4Yw2yZJ8GKAPLNeKrLXlOZH+41PLAT/AY0QCT/45LWBZ2WEUBQ
	 6TyJcQQ73EAZnkzeEwwuo+yNDfaDgrwhUGId/4v5Faz1hlIezixQrygz+L+bqbb4xF
	 HmcW9YUDwk7lpTYqZHnofdUX17ZO4Q/GRtFb3KA8d/Sq+053RRvPFjQhbYGmwQBaXv
	 +cwgDz/iCcKrA==
Date: Fri, 29 Aug 2025 10:26:13 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16xx
Message-ID: <20250829152613.GA795028-robh@kernel.org>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-3-jefflessard3@gmail.com>
 <20250825182521.GA4157069-robh@kernel.org>
 <44C925EA-73CF-46C3-86C4-BD8ECD33AE00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44C925EA-73CF-46C3-86C4-BD8ECD33AE00@gmail.com>

On Mon, Aug 25, 2025 at 09:33:58PM -0400, Jean-François Lessard wrote:
> Le 25 août 2025 14 h 26 min 57 s HAE, Rob Herring <robh@kernel.org> a écrit :
> >On Sun, Aug 24, 2025 at 11:32:28PM -0400, Jean-François Lessard wrote:
> >> Add documentation for TM16xx-compatible 7-segment LED display controllers
> >> with keyscan.
> >> 
> >> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
> >> ---
> >> 
> >> Notes:
> >>     The 'segments' property is intentionally not vendor-prefixed as it
> >>     defines a generic hardware description concept applicable to any
> >>     7-segment display controller. The property describes the fundamental
> >>     grid/segment coordinate mapping that is controller-agnostic and could
> >>     be reused by other LED matrix display bindings. Similar to how 'gpios'
> >>     describes GPIO connections generically, 'segments' describes segment
> >>     connections in a standardized way using uint32-matrix format.
> >> 
> >>  .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 477 ++++++++++++++++++
> >>  MAINTAINERS                                   |   5 +
> >>  2 files changed, 482 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> >> 
> >> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> >> new file mode 100644
> >> index 000000000..c94556d95
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> >> @@ -0,0 +1,477 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/auxdisplay/titanmec,tm16xx.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Auxiliary displays based on TM16xx and compatible LED controllers
> >> +
> >> +maintainers:
> >> +  - Jean-François Lessard <jefflessard3@gmail.com>
> >> +
> >> +description: |
> >> +  LED matrix controllers used in auxiliary display devices that drive individual
> >> +  LED icons and 7-segment digit groups through a grid/segment addressing scheme.
> >> +  Controllers manage a matrix of LEDs organized as grids (columns/banks in
> >> +  vendor datasheets) and segments (rows/bit positions in vendor datasheets).
> >> +  Maximum grid and segment indices are controller-specific.
> 
> In reference to max-brightness, I'll replace with:
> 
> Maximum brightness and grid/segment indices are controller-specific. Controller-specific maximum are validated in the driver.
> 
> >> +
> >> +  The controller is agnostic of the display layout. Board-specific LED wiring is
> >> +  described through child nodes that specify grid/segment coordinates for
> >> +  individual icons and segment mapping for 7-segment digits.
> >> +
> >> +  The bindings use separate 'leds' and 'digits' containers to accommodate
> >> +  different addressing schemes:
> >> +  - LEDs use 2-cell addressing (grid, segment) for matrix coordinates
> >> +  - Digits use 1-cell addressing with explicit segment mapping
> >> +
> >> +  The controller node exposes a logical LED-like control for the aggregate
> >> +  display brightness. Child nodes describe individual icons and 7-seg digits.
> >> +  The top-level control supports only label and brightness-related properties
> >> +  and does not support other common LED properties such as color or function.
> >> +  Child LED nodes use the standard LED binding.
> >> +
> >> +  Optional keypad scanning is supported when both 'linux,keymap' and
> >> +  'poll-interval' properties are specified.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - fdhisi,fd628
> >> +              - princeton,pt6964
> >> +              - wxicore,aip1628
> >> +          - const: titanmec,tm1628
> >> +      - items:
> >> +          - enum:
> >> +              - wxicore,aip1618
> >> +          - const: titanmec,tm1618
> >> +      - items:
> >> +          - enum:
> >> +              - fdhisi,fd650
> >> +              - wxicore,aip650
> >> +          - const: titanmec,tm1650
> >> +      - enum:
> >> +          - fdhisi,fd620
> >> +          - fdhisi,fd655
> >> +          - fdhisi,fd6551
> >> +          - titanmec,tm1618
> >> +          - titanmec,tm1620
> >> +          - titanmec,tm1628
> >> +          - titanmec,tm1638
> >> +          - titanmec,tm1650
> >> +          - winrise,hbs658
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  label:
> >> +    description:
> >> +      The label for the top-level LED. If omitted, the label is taken from the
> >> +      node name (excluding the unit address). It has to uniquely identify a
> >> +      device, i.e. no other LED class device can be assigned the same label.
> >> +    $ref: /schemas/leds/common.yaml#/properties/label
> >> +
> >> +  max-brightness:
> >> +    description:
> >> +      Normally the maximum brightness is determined by the hardware and this
> >> +      property is not required. This property is used to put a software limit
> >> +      on the brightness apart from what the driver says, as it could happen
> >> +      that a LED can be made so bright that it gets damaged or causes damage
> >> +      due to restrictions in a specific system, such as mounting conditions.
> >> +    $ref: /schemas/leds/common.yaml#/properties/max-brightness
> >
> >These 2 $ref's should be at the node level. The clue is you 
> >copied-n-pasted the whole description.
> >
> 
> I'll add:
> 
> allOf:
>   - $ref: /schemas/leds/common.yaml#
> 
> at the node level and constrain inapplicable LED properties (color, function)
> using properties: false since this auxdisplay device integrates with LED
> subsystem for brightness control.
> 
> >What you need here is some constraints. What's the max value?
> >
> 
> Maximum brightness varies by controller:
> - TM1618/TM1628/TM1638 support levels 0-8
> - TM1650 supports levels 0-8
> - TM1620 supports levels 0-3
> I'll set the schema maximum to 8:
> 
> max-brightness:
>   maximum: 8  # Maximum across all TM16xx controllers
> 
> with the top-level description note that actual limits are controller-dependent
> and are enforced by the driver.
> 
> >> +
> >> +  default-brightness:
> >> +    description:
> >> +      Brightness to be set if LED's default state is on. Used only during
> >> +      initialization. If the option is not set then max brightness is used.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> >This needs to first go into leds/common.yaml.
> >
> 
> Given its specific relevance to this auxdisplay use case rather than general LED
> behavior, I am not sure it's worth adding default-brightness to LEDs/common.yaml
> If broader LED subsystem adoption is wanted, I am willing to submit a separate
> patch to this series to add it.
> 
> Otherwise, existing precedent in backlight/common.yaml and leds/leds-pwm.yaml
> would advocate for defining it locally.

The type for a property should really only be set in 1 place. Otherwise, 
it is easy to define different types for the same property (which we 
have and have to deal with some). 

Given we now have 2 cases for LEDs, it should at least be in 
leds/common.yaml. Should there be 1 definition for both backlight and 
LEDs, yes. But I can live with 2 definitions in common bindings for now.

> >> +
> >> +  digits:
> >> +    type: object
> >> +    description: Container for 7-segment digit group definitions
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      "#address-cells":
> >> +        const: 1
> >> +      "#size-cells":
> >> +        const: 0
> >> +
> >> +    patternProperties:
> >> +      "^digit@[0-9]+$":
> >> +        type: object
> >> +        unevaluatedProperties: false
> >> +
> >> +        properties:
> >> +          reg:
> >> +            description: Digit position identifier
> >
> >Position is right to left (0 on right)? Please clarify.
> > 
> 
> I'll clarify: digit positions are numbered sequentially left-to-right, 
> with reg=0 representing the leftmost digit position as displayed to the user.
> 
> >> +            maxItems: 1
> >> +
> >> +          segments:
> >> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
> >> +            description: |
> >> +              Array of grid/segment coordinate pairs for each 7-segment position.
> >> +              Each entry is <grid segment> mapping to standard 7-segment positions
> >> +              in order: a, b, c, d, e, f, g
> >> +
> >> +              Standard 7-segment layout:
> >> +                 aaa
> >> +                f   b
> >> +                f   b
> >> +                 ggg
> >> +                e   c
> >> +                e   c
> >> +                 ddd
> >> +            items:
> >> +              items:
> >> +                - description: Grid index
> >> +                - description: Segment index
> >
> >Can't you do an array instead and make the array index be the grid or 
> >segment index?
> >
> 
> Original design was array-based:
> - titanmec,digits: array of grid indices
> - titanmec,segment-mapping: array of segment indices for a,b,c,d,e,f,g
> - titanmec,transposed: boolean for matrix-transposed cases
> 
> The current explicit coordinate approach was adopted based on v2 feedback and
> handles both standard and transposed wiring patterns effectively, where
> manufacturers swap grid/segment relationships:
> - Standard: digit segments use same grid, different segments  
> - Transposed: digit segments use same segment, different grids
> It also future-proofs potential irregular wiring patterns where individual
> digits might have different grid/segment relationships.
> 
> Unless you have strong objections, I prefer to keep this approach to avoid
> further churn, as it's proven to handle all the real-world board layouts
> encountered.

2 arrays would not be an improvement. So leave it as you have it.

Rob

