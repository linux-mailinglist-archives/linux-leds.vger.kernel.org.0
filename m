Return-Path: <linux-leds+bounces-4189-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A5A562C0
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 09:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C1518958F1
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 08:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8078D1DE3B6;
	Fri,  7 Mar 2025 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tnsd103F"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549C51DB365;
	Fri,  7 Mar 2025 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336935; cv=none; b=JPgYiagCG0QFayLeqAMqUwq1A/Xc9TtoIzhLiTcdR2OZCmyXz+4b9PVMusu64FxqNR2HmuCN6mOM4KJ1v0lpLjHWlGSB/9Lg055U6crpRelMKWt8/r46C/tgx/MooBoJHEquvQZID+/tEkGa3YJksILXSBVFiZO3zWexhAg2J4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336935; c=relaxed/simple;
	bh=34HtzK5im4DjQgPEXBT1cUZo1gx/AaUKFaG5zXxVxMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNhmUVHN//sXs/tQxijpKytdwJ3R1LqAY1T5Yqqs1mvrmWq4NnPvOTT3NwVckTZ4xkzRaXMulan6UvdyV5hEoobs+lGPOrhIrJgi+a47kKypkJuAkdyzAi/5yUfeG0BS0QWTDwjGCHEL8kKJro/uTh7GSeDQXKiIjaTIPUUmQL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tnsd103F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8712C4CED1;
	Fri,  7 Mar 2025 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741336933;
	bh=34HtzK5im4DjQgPEXBT1cUZo1gx/AaUKFaG5zXxVxMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tnsd103FnbLsGXFAync1Gu133WY6LyeOBWqj+Q/HtevFaURsEvPy1pju0kCrBcBbZ
	 6Dsfi9ytpMNaGuOY1qDqGXKIrXyt5gNLrI2M6tpC9lPmJWUFJfehisbOtgwzOPkbyG
	 cbSMl0QffnYZ7SwjAggPoppbI/3KZ0u6pSjoTp1vwHpClpCYtcp+IsUnZVtS7zQM+T
	 ShDSqTYFR/65Me5D/S4fSSn4pu3CMx3lf8yz/KyNQOGuAqD7BINVkFQ8B0CrDC7jOh
	 WuxM8dlMltb18s36i+8UPaR87ozJEUMzt16go86YxA/zMMTyt87CQDCZE8/EdRYKsU
	 MXKSXWG57g1og==
Date: Fri, 7 Mar 2025 09:42:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, lee@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: Add LP5812 LED driver
Message-ID: <20250307-antique-beryl-sawfish-7d403f@krzk-bin>
References: <20250306172126.24667-1-trannamatk@gmail.com>
 <20250306172126.24667-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306172126.24667-2-trannamatk@gmail.com>

On Fri, Mar 07, 2025 at 12:21:24AM +0700, Nam Tran wrote:
> This documentation ensures proper integration of the LP5812
> in Device Tree-based systems.

No changelog, no improvements in commit msg. You got comment at v1 to
which you did not respond. Then you send v2 and I asked the same.

Please respond to the comment at v1 so acknowledge that you udnerstood
it.

Your commit msg is totally redundant - you just said what Devicetree
binding is. I asked to change it: describe the hardware instead.

>  
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> new file mode 100644
> index 000000000000..9a203da4f272
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +$ref: /schemas/leds/common.yaml#
> +
> +title: Linux driver for LP5812 LED from Texas Instruments

Nothing improved.


> +
> +maintainers:
> +  - Nam Tran <trannamatk@gmail.com>
> +
> +description: |
> +  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
> +  For more product information please see the link below:
> +  https://www.ti.com/product/LP5812#tech-docs
> +
> +properties:
> +  compatible:
> +    const: ti,lp5812
> +
> +  reg:
> +    maxItems: 1


This improved... but:

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

What are these?

> +
> +required:
> +  - compatible
> +  - reg
> +

Nothing improved here.

You keep ignoring comments, not responding to them. This is not how you
are supposed to work with reviewers.


> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@1b {
> +            compatible = "ti,lp5812";
> +            reg = <0x1b>;
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736dc2ee0..2bd9f5132cab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23506,6 +23506,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>  F:	drivers/leds/leds-lp8864.c
>  
> +TEXAS INSTRUMENTS' LP5812 LED DRIVER

Nothing improved.

NAK

Best regards,
Krzysztof


