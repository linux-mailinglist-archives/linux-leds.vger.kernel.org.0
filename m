Return-Path: <linux-leds+bounces-4689-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF414ABEEF9
	for <lists+linux-leds@lfdr.de>; Wed, 21 May 2025 11:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F7C74E3EBB
	for <lists+linux-leds@lfdr.de>; Wed, 21 May 2025 09:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EBA23958C;
	Wed, 21 May 2025 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FI5w5J4m"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E5238C16;
	Wed, 21 May 2025 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818163; cv=none; b=fN2WiSMByF+hYqapJTMFDLfK7CbaB92LiwSEDSscrQTL1SadbZtxGqxpIyrc0xbmC63gD/HVo4Eymdsat6I+vSjP6X7al363EjHZFWa4JE50ve6/tnaKZfM5y3mRsCOd0w7ZSP/QcyvtDHr4lab9snCgvFy7ii4rtMtR+4219Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818163; c=relaxed/simple;
	bh=RHaIWcN8RKu7hWMQ6BWOpFnFMTzBn0vqTSYhbOt0Hhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiQhw7fGfSQFehEJPS1xN6GlahYojaMwrkU57da0jVnfKxhkylSb7POqn8WuR+nEbIQvd6twlYMKAGGVK5r8yHzZAHuwgl6tmXHOo5qoTsFv5ACjZclyoUxCFh5602Zx64PEhCdA1GSURvpg91gvcC/3b0nC/tbKlk3+Mtq3Paw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FI5w5J4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DB9C4CEE4;
	Wed, 21 May 2025 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818163;
	bh=RHaIWcN8RKu7hWMQ6BWOpFnFMTzBn0vqTSYhbOt0Hhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FI5w5J4m8fOlsArp2GXpfaHSJ7At4lAhl3yYOEYj6PsgDFVJQ+aMdonauBV4teN+O
	 GElayUeVtP/44LIlgawnclP3ZK3vTouYa4Uo2kow1ykc/H9JnUzINcW4BXcgOf80t1
	 V+zhGLinvtRcgZJfbFgs4iDb9sIVkvdzH2UxSIpXEjSKpknqGIdZ4pXJnPt9ZLhZmr
	 II0Pcu79NA8LuKTfpyRl9P12IJ5CYlNzTiP6uSGLy/Tjd8XhOZ+iy5GjZHlTaBXhUU
	 KVOmdFmcA4RYAC2KilXH+76+Ezqzabs75Oodo34VLV31YUTlWCV7Swg6+LOoz7h3z8
	 wFUF/FJWNEXxA==
Date: Wed, 21 May 2025 11:02:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Steffen Trumtrar <kernel@pengutronix.de>, 
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: add lp5860 LED controller
Message-ID: <20250521-versatile-hamster-of-completion-d96e0a@kuoka>
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
 <20250514-v6-14-topic-ti-lp5860-v2-1-72ecc8fa4ad7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514-v6-14-topic-ti-lp5860-v2-1-72ecc8fa4ad7@pengutronix.de>

On Wed, May 14, 2025 at 12:36:28PM GMT, Steffen Trumtrar wrote:
> The lp5860 is a LED matrix driver with 18 constant current sinks and 11
> scan switches for 198 LED dots:
>   * Supply range from 2.7 V to 5.5 V
>   * 0.1mA - 50mA per current sink
>   * 1MHz I2C and 12MHz SPI control interface
>   * 8-bit analog dimming
>   * 8/16-bit PWM dimming
>   * individual ON and OFF control for each LED dot
>   * globat 3-bit Maximum Current setting for all LED dots
>   * individual LED dot open/short detection
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  .../devicetree/bindings/leds/leds-lp5860.yaml      | 112 +++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..330ff42b27fb19395e64f813da4b0ab1fa22fe69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-lp5860.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for LP5860 RGB LED from Texas Instruments.
> +
> +maintainers:
> +  - Steffen Trumtrar <kernel@pengutronix.de>
> +
> +description: |
> +  The LP5860 is multi-channel, I2C and SPI RGB LED Driver that can group RGB LEDs
> +  into a LED group or control them individually.
> +
> +  For more product information please see the link below:
> +  https://www.ti.com/lit/ds/symlink/lp5860.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lp5860
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 12000000

So that's a SPI device? Where is the definition of this field? You miss
ref to peripheral props.

...

> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

And this is unevaluated. See other examples.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>

Where do you use this header?

> +    #include <dt-bindings/leds/common.h>
> +
> +    spi {
> +        #address-cells = <1>;

Best regards,
Krzysztof


