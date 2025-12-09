Return-Path: <linux-leds+bounces-6390-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F3CB0E74
	for <lists+linux-leds@lfdr.de>; Tue, 09 Dec 2025 20:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEB1D3015970
	for <lists+linux-leds@lfdr.de>; Tue,  9 Dec 2025 19:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6941303C9B;
	Tue,  9 Dec 2025 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwA+gXGm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6227C162;
	Tue,  9 Dec 2025 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765307246; cv=none; b=OC/ysrwgqih8RSzcvZXUjZNQmqvDUC1w0xzxCc2LoZ9lRZTjHXJDgFG5bYhvkc11fMo6TJoo8ZkoNCXwR6Ge1tECNExJHeWVG8ZwthedFelMYchBoDtzqfiX1czHXS5Rp9vMSTZjxH7FTB6y9GAuuKbtGna5UVeuFoFwzux47tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765307246; c=relaxed/simple;
	bh=Oym70OZBadIC1w/YlIPC9DL2FkmLeSFqIX49SQ+L7/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddJ/urqJOYh9ffigNf6RJ/WNw2AV52aPw9AyxCkUWrta/mSuFNJLchzfWOgYjHrLYUrKAoSofDpzZng4h8BYouEnGO/X7MbBEnWBI1fSbsjao9gdCsIj37GXwMtAgwe5eHuhELZvcfZs20PjdTnHSVgEJHIIUwOx9WdweFqdGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwA+gXGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CFDC4CEF5;
	Tue,  9 Dec 2025 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765307245;
	bh=Oym70OZBadIC1w/YlIPC9DL2FkmLeSFqIX49SQ+L7/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwA+gXGmpmgU5IwRHGVMFdXkRrn2+bkW/1NNddhQa7ZCTcOkRZKqNLyZxseM4ffEc
	 tvoHjUes1u+9UfHDpaHfHBrJKjrOTB5C5P0qTNTSINvTke+8WiffQDDM7v6eRQ1QnF
	 ALj2rikjP19zVrI4FCAiJ5V0WwVzuy6D22psHQrApox27xZXK5Y58q75kL3bEgSmkE
	 YJOXdKxIk8hj3CNeYCUveh0d+yaWA/49Fe+x7I9Eumh+mweANs1I0FWElnnU8nX2FF
	 jwpB+a4Ed6Ruh3KB7nMLnDd2wD3F6WE+vCqHXZmG9Q7zgTpxyzcTo6Q2vVCjya9ixP
	 fEwMfQ3mJUIXw==
Date: Tue, 9 Dec 2025 13:07:22 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Frank Li <Frank.li@nxp.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <20251209190722.GA945742-robh@kernel.org>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
 <aS3H1qzSMKHamqpP@lizhi-Precision-Tower-5810>
 <b9fe6df7-fdc6-4a32-919b-8f3b44eace7d@gocontroll.com>
 <aS79eKc9Ac4np6Nf@lizhi-Precision-Tower-5810>
 <e428c3a9-49e2-4af5-b597-2cdfef7028f5@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e428c3a9-49e2-4af5-b597-2cdfef7028f5@gocontroll.com>

On Mon, Dec 08, 2025 at 02:56:50PM +0100, Maud Spierings wrote:
> On 12/2/25 15:53, Frank Li wrote:
> > On Tue, Dec 02, 2025 at 08:46:21AM +0100, Maud Spierings wrote:
> > > On 12/1/25 17:52, Frank Li wrote:
> > > > On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings via B4 Relay wrote:
> > > > > From: Maud Spierings <maudspierings@gocontroll.com>
> > > > > 
> > > > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > > > with integrated boost controller.
> > > > > 
> > > > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > In the current implementation the control registers for channel 1,
> > > > > control all channels. So only one led subnode with led-sources is
> > > > > supported right now. If at some point the driver functionality is
> > > > > expanded the bindings can be easily extended with it.
> > > > > ---
> > > > >    .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
> > > > >    MAINTAINERS                                        |   5 +
> > > > >    2 files changed, 112 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..e83723224b07
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> > > > > @@ -0,0 +1,107 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Maxim max25014 backlight controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Maud Spierings <maudspierings@gocontroll.com>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - maxim,max25014
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  "#address-cells":
> > > > > +    const: 1
> > > > > +
> > > > > +  "#size-cells":
> > > > > +    const: 0
> > > > > +
> > > > > +  enable-gpios:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  power-supply:
> > > > > +    description: Regulator which controls the boost converter input rail.
> > > > > +
> > > > > +  pwms:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  maxim,iset:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    maximum: 15
> > > > > +    default: 11
> > > > > +    description:
> > > > > +      Value of the ISET field in the ISET register. This controls the current
> > > > > +      scale of the outputs, a higher number means more current.
> > > > > +
> > > > > +  led@0:
> > > > 
> > > > define whole binding, allow 0-3. binding is not related with driver's
> > > > implement.
> > > > 
> > > > it'd better put unders leds.
> > > > 
> > > 
> > > so like:
> > > 
> > > backlight: backlight@6f {
> > > 	compatible = "maxim,max25014";
> > > 	reg = <0x6f>;
> > > 	enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> > > 	pinctrl-names = "default";
> > > 	pinctrl-0 = <&pinctrl_backlight>;
> > > 	maxim,iset = <7>;
> > > 
> > > 	leds {
> > > 		#address-cells = <1>;
> > > 		#size-cells = <0>;
> > > 
> > > 		led@0 {
> > > 			reg = <0>;
> > > 			led-sources = <0 1 2>;
> > > 			default-brightness = <50>;
> > > 		};
> > > 
> > > 		optional led@#....
> > > 	};
> > > };
> > > 
> > > right?
> > 
> > yes.
> > 
> 
> I am feeling a bit weird about these led sub nodes, because it is not
> programmed as a led driver, it is programmed as a backlight. I am trying to
> figure out how this would be used later when the led strings are
> individually controllable.
> 
> it isn't possible to link the seperate strings to different displays because
> it is only one backlight device, so I don't seen any reason why it would
> ever be used in another way than what it is now, were all strings are
> programmed by one register.
> 
> The only way I can make sense of it is if instead I program this device as a
> led driver and then use the led_bl driver as the actual backlight.
> 
> Thats a pretty big step in a different direction, but then the led subnodes
> at least can be properly used I feel.

If you don't have any use for anything other than driving a single 
backlight, then I'd just drop the led nodes completely.

Rob

