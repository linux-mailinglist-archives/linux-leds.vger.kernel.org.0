Return-Path: <linux-leds+bounces-4380-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08865A768FE
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 17:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12EA63AC849
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 14:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B2121507C;
	Mon, 31 Mar 2025 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ql+DdLXV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C2214216;
	Mon, 31 Mar 2025 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432327; cv=none; b=tY4mHiWjg3qHMaU6V1ji6HWL5rVyX8X5uwtpdvTSZvErghhnmY4g9G0PBoCdIzulvdJ8InA11nEKWW5ZiVu6GAoWOUR8b5KtzAU2a3h1L832HKbJozS/66FTH4sdQZpDK4e0/q8O4yAVdyJaiQjrXBxoOw03ACFWLX8zznb4M44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432327; c=relaxed/simple;
	bh=eybDYCvIulZqILxGAcimG7+MzYa88Ot4S0dSO/mLm/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxwjAa5Ihauh8TP9K3RjFwr/2V/+CNdkB1UCtW6BIufswXF5OaJsuU7WsabwCrzxXbgMWTN+7uVW8y90oRl/BsGaGFJ3OspbWSwB7cfU1EwMYsbLaJu1f3J0Oye5kEmzsl+L0Ax/3vHlziaNZ7nZfW2q1SR1KSoh/byItrLUKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ql+DdLXV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D10C4CEE4;
	Mon, 31 Mar 2025 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432326;
	bh=eybDYCvIulZqILxGAcimG7+MzYa88Ot4S0dSO/mLm/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ql+DdLXVs19+vuhhQ3aGXdtfK//NOv03EPZ8w3KuOJi+XO5n/oz3RtLghd2E8hrTm
	 QadTcyP6LxoO6WU66AfPF8RLTDlDR3wqspO/o7sgaBxkFmo2m9m9Q7Kz7GzAa6apL2
	 uoSm7FRtPiaz6LIEtzI9vNNzwGnhYTp4Ru92XVrZrgqRAifitwwOdtCLXOn38lA9v8
	 uYzySrVoTScd5Shn0oj4eQds2IYWjRkQOq65TtwPSj5t/USKhOb/ZnrGeZ0uWOV4WQ
	 gaJXtNXhLC/DQZ/nPox8t2brOnEr0GjrHrro9MkLIpGS5+/CT8o+xMMPpI1ZD3nNAm
	 XcS0kANfs/MFQ==
Date: Mon, 31 Mar 2025 09:45:25 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Guillevic <corentin.guillevic@smile.fr>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add TI TLC5928 LED
Message-ID: <20250331144525.GA2729915-robh@kernel.org>
References: <20250326153535.158137-1-corentin.guillevic@smile.fr>
 <20250326153535.158137-2-corentin.guillevic@smile.fr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326153535.158137-2-corentin.guillevic@smile.fr>

On Wed, Mar 26, 2025 at 04:35:33PM +0100, Corentin Guillevic wrote:
> Document Texas Instruments TLC5928 LED driver devicetree bindings.
> 
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---
>  .../bindings/leds/leds-tlc5928.yaml           | 212 ++++++++++++++++++
>  1 file changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc5928.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-tlc5928.yaml b/Documentation/devicetree/bindings/leds/leds-tlc5928.yaml
> new file mode 100644
> index 000000000000..0d857c9b1feb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-tlc5928.yaml
> @@ -0,0 +1,212 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-tlc5928.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for TLC5928 from Texas Instruments.
> +
> +maintainers:
> +  - Corentin Guillevic <corentin.guillevic@smile.fr>
> +
> +description: |
> +  The TLC5928 is a LED controller handling up to 16 LEDs. It can
> +  control LED on/off using a SPI-compatible interface, and has an
> +  on/off control data shift register (blank) and data latch.
> +
> +  This driver also supports the daisy-chaining of several TLC5928
> +  chips, as illustrated by the diagram below (with two controllers):
> +
> +  +--------------+           +--------------+
> +  |          SCLK|-----+---->|SCLK     BLANK|--
> +  |              |     |     |              |
> +  |  SPI     MOSI|-----|---->|MOSI  TLC5928 |
> +  | Master       |     |     |        (1)   |
> +  |          MISO|<--+ |  +--|MISO          |
> +  |              |   | |  |  |              |
> +  |      CS/LATCH|-+-|-|--|->|LATCH         |
> +  +--------------+ | | |  |  +--------------+
> +                   | | |  |  +--------------+
> +                   | | +--|->|SCLK     BLANK|--
> +                   | |    |  |              |
> +                   | |    +->|MOSI  TLC5928 |
> +                   | |       |        (2)   |
> +                   | +-------|MISO          |
> +                   |         |              |
> +                   +-------->|LATCH         |
> +                             +--------------+
> +
> +  For more product information please see the link below:
> +  https://www.ti.com/product/TLC5928/part-details/TLC5928PWPR
> +
> +properties:
> +  compatible:
> +    const: ti,tlc5928
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      SPI slave address
> +
> +  enable-gpios:
> +    description: |

Don't need '|' if no formatting.

> +      Array of GPIO specifiers, referring to the GPIO pins to enable/disable
> +      each device (active high to disable). In the daisy chain case, each
> +      GPIO has to be in the same sequence than the devices.
> +
> +  latch-gpio:

latch-gpios

-gpio is deprecated.

> +    maxItems: 1
> +    description: Latch GPIO (SPI chip select)
> +
> +patternProperties:
> +  "^spi-chip@[0-9]$":
> +    type: object
> +    unevaluatedProperties: false
> +    description: Properties for a TLC5928 controller.

I don't think this level is needed. Just encode the chip instance into 
the LED address. Either 1 cell splitting the bits or 2 cells with chip 
instance in 1st cell and LED# in the 2nd cell.

> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +
> +      "^led@[0-9a-f]+$":

Don't need the '+' as the max is 'f'. That will change with the above 
though. You'll want something like '^led@[0-9a-f]+,[0-9a-f]$' with the 
chip and led numbers split.

> +        type: object
> +        $ref: common.yaml#
> +        unevaluatedProperties: false
> +        description:
> +          Properties for a single LED.

