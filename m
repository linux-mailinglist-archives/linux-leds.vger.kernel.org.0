Return-Path: <linux-leds+bounces-6380-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E40CBCA8571
	for <lists+linux-leds@lfdr.de>; Fri, 05 Dec 2025 17:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 838B830D05E1
	for <lists+linux-leds@lfdr.de>; Fri,  5 Dec 2025 15:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4410A34BA49;
	Fri,  5 Dec 2025 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAIrLK5l"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B8E34B68C;
	Fri,  5 Dec 2025 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947275; cv=none; b=RtIVTOZn/6OQlHi1fOD82zyqjz8Hem5dNE/1TD9EI952lPJkoJAsieXbi+iRa/1LtiNtua01WKFRgXFUUqN9KPrSib8taJtmIefc32em8RWxf61UDXgN4t8vg/kwrnQphHrxVL+aFIW+VtL9787KIx4O0nQI+iPuS6xa37xUrL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947275; c=relaxed/simple;
	bh=Btrf2pkJCWZijzZcvy/muKQ3+oGgoj6S6CYvcVWIQrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwWKhPQu5VrjhSjLAM2tdgaO9BM+xqH+dMxZYh3EKJCKqCaejGbA2q+Zq2owk99cwzaMSiWB4TbXiUBUHsf2YwrTR4G8C7iiYzcpAn3JZMVypWyxxxntbhY/dGc93wT9RBazcoXXjBf7kkJxj+NNOHMeWiDbP38DUXaNcsM6VVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAIrLK5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3B9C4CEF1;
	Fri,  5 Dec 2025 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764947274;
	bh=Btrf2pkJCWZijzZcvy/muKQ3+oGgoj6S6CYvcVWIQrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAIrLK5lY6tbIMZDXSaylFE0NQrndOHSyUGk0YaIxSZtnw/TdkoI3YjlqHA7OYtZO
	 GTsnIpz2g1H6OBepN9YbTEtS/ML+DEM2HpHfCHI3so2uL+u4zE2MvbqhA/qGlsRNMo
	 tyxAUxnmas8OwCUVJznh84YNC6ZGPLNfQV0APcvwtBvTqzt9VOiZnd8Wk5A9NW/VMJ
	 qK+az0ifq91qYJ1iqtgRCctAtNyZdi1oh8lGPP8tPUqspCujiwkPu15TIpWEIzROf7
	 YlJke5tJGKyHMX5s4V3BMX7Wb9HdMIHUa54sMBIYOf8dJC7FtIeKRzRAcNGna1gAsH
	 Npiav9APMasgg==
Date: Fri, 5 Dec 2025 09:07:51 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
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
Message-ID: <20251205150751.GA124954-robh@kernel.org>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>

On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> 
> ---
> 
> In the current implementation the control registers for channel 1,
> control all channels. So only one led subnode with led-sources is
> supported right now. If at some point the driver functionality is
> expanded the bindings can be easily extended with it.

What's the relationship between the LEDs and backlight? It's a backlight 
plus LEDs or just 4 identical channels.

> 
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 112 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 000000000000..e83723224b07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-supply:
> +    description: Regulator which controls the boost converter input rail.
> +
> +  pwms:
> +    maxItems: 1
> +
> +  maxim,iset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 15
> +    default: 11
> +    description:
> +      Value of the ISET field in the ISET register. This controls the current
> +      scale of the outputs, a higher number means more current.

We have properties for setting the current (in uA). That can't work 
here?

> +
> +  led@0:
> +    type: object
> +    description: Properties for a string of connected LEDs.
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      led-sources:
> +        allOf:
> +          - minItems: 1
> +            maxItems: 4
> +            items:
> +              minimum: 0
> +              maximum: 3
> +            default: [0, 1, 2, 3]
> +
> +      default-brightness:
> +        minimum: 0
> +        maximum: 100
> +        default: 50
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@6f {
> +            compatible = "maxim,max25014";
> +            reg = <0x6f>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +            power-supply = <&reg_backlight>;
> +            pwms = <&pwm1>;
> +            maxim,iset = <7>;
> +
> +            led@0 {
> +                reg = <0>;
> +                led-sources = <0 1 2 3>;
> +                default-brightness = <50>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58c7e3f678d8..606ce086f758 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15261,6 +15261,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
>  F:	drivers/media/i2c/max2175*
>  F:	include/uapi/linux/max2175.h
>  
> +MAX25014 BACKLIGHT DRIVER
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> +
>  MAX31335 RTC DRIVER
>  M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>  L:	linux-rtc@vger.kernel.org
> 
> -- 
> 2.52.0
> 

