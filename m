Return-Path: <linux-leds+bounces-4082-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D4A456C9
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 08:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11F0176E50
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 07:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB53A26A0A6;
	Wed, 26 Feb 2025 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHZlXh+u"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0717F7;
	Wed, 26 Feb 2025 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740555445; cv=none; b=AOBsD5kTMNds++QLGEhtTaQ8g+YAav/d/JjN09eE47rrzrAUY46shkL5zGbNR4C6lbTlsjlrN3ahEXOb1jrjnuafnoEbZhjmmbX19189xfX9t7wPgycdMNjuuMmXDFRjARVfkwSC+cmR3kRex24d1hl056pQSt2ZU/5QSSaHyjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740555445; c=relaxed/simple;
	bh=uzGGD3b0odJ053d87ved4jDdTaz+K0YsMweVS6HWR54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C75ukPbJ5E6n9l09uS4YdoFJ3bfClVsYONl01Ww2LtjUvMF+Pyc2L5XNSFT5fitBi986FMpbnsP4fO+JO9IDcMsP8SX7pNyW9klZF5/pacQ32BYmX9qBWMvb3gP1TIugHKWiH1MYdsQoj9UZSBYKTytb0btCuEEaATyanA96omg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHZlXh+u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80215C4CED6;
	Wed, 26 Feb 2025 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740555445;
	bh=uzGGD3b0odJ053d87ved4jDdTaz+K0YsMweVS6HWR54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHZlXh+ub4fJ4b7NywjI5bL1QZIHgMl4b6Lrs7jOQC2FmGKoZcWD4c9UZtkczxGdx
	 BcD2d9XLStLILOGsBqWab0wODRfQLSM0M+O3uzxZQsAndKxBbTIclhhG9i9OQi9oiI
	 gJ2W+tTLMkdmZ5QyKpFPXpcvKSkalfTO19ioE9XcwUKgvT7jXOXDTH33jI3xXqU+Wu
	 tsDUdI0a4RrHg4OaOufL1iPeEkXCz05cIpqRHWTcIRDxh66+6VXFKkyMI/A3wD0Ee1
	 oDio/de8JNbRXvf6CIH2s4hE5Yj47d19E+W+2HQ1F3aXwFcUzLeXZvrvumKN11ggzB
	 hUU166mfU5ynQ==
Date: Wed, 26 Feb 2025 08:37:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, lee@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add LP5812 LED driver bindings
Message-ID: <20250226-delectable-gorgeous-anaconda-43eed8@krzk-bin>
References: <20250225170601.21334-1-trannamatk@gmail.com>
 <20250225170601.21334-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225170601.21334-2-trannamatk@gmail.com>

On Wed, Feb 26, 2025 at 12:06:00AM +0700, Nam Tran wrote:
> This documentation ensures proper integration of the LP5812
> in Device Tree-based systems.

Nothing improved above.

Please read my previous comment and implement it or respond to it, if
you disagree.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 34 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> new file mode 100644
> index 000000000000..1eb395230531
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +
> +title: LED driver for LP5812 LED from Texas Instruments.

LED driver as Linux driver? Or LP5812 LED driver as electrical driver?
Decide, but if first then rewrite it to describe hardware.

Also drop full stop. Titles do not have full stops.

> +
> +maintainers:
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.

So Linux driver? Drop driver references and describe hardware.

> +
> +properties:
> +  compatible:
> +    const: ti,lp5812
> +
> +  reg:
> +    description: I2C slave address

Drop description

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg

No ref to LED common schema? No other properties? This is too
incomplete.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c1 {

i2c

> +      lp5812@1b {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "ti,lp5812";
> +        reg = <0x1b>;
> +      };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4ff26fa94895..32312959d595 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23494,6 +23494,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>  F:	drivers/leds/leds-lp8864.c
>  
> +TEXAS INSTRUMENTS' LP5812 LED DRIVER

5 is before 8, so this does not look sorted.

And finally, please test before posting...

Best regards,
Krzysztof


