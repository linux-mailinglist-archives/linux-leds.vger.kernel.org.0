Return-Path: <linux-leds+bounces-5089-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECDB09500
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 21:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 846911C28496
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 19:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BAF2080C4;
	Thu, 17 Jul 2025 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0hXMppN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C8C1A314E;
	Thu, 17 Jul 2025 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752780679; cv=none; b=V7iGbh04eTwqZd/5Mm7FmALFeJMJWd8HRXGLwHRRg5QVW5WWya0QPV7/FjmOlOin+mqGq5hZBwEQP3ruYprDGTFNDYGdclF6T5asgcffNPnuJ+oiCi6hIu93ngzle9kiC2en8Yjk+xtz8IpjYf+slGtbOV7RsSTuup0Jhy/XLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752780679; c=relaxed/simple;
	bh=eM0/XoOtAcPMmuRykbkdikjXrIGEmy/I9xOgAzixQEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MERrw+7Jop8xwabksgEsp0JejubEjRHyiOzVMPiE0L/ar6804JICfjE98OyjbdG8d6NwhZr5oofYEZpyroRvbQLC1VJ0DGjX9qjVq7XL/2eZK6VdaW06G+BH0/7jp5cMy+9JbWazF3fWImgBFu+e4K7AJtjSGkfps8Qd4+0QzQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0hXMppN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEB5C4CEE3;
	Thu, 17 Jul 2025 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752780679;
	bh=eM0/XoOtAcPMmuRykbkdikjXrIGEmy/I9xOgAzixQEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0hXMppNINdT4aEch1l9TwYMFAJpgaZx3R0amhmJgeCfK7dYTA+N+U/Qv5mm3AsgK
	 74i1zQ7xVZrV1VXmEZw8/tgZuKN0g4qc9MV7Rfm9K7dNEvEfDCVXrGkGgtzUuZbOGh
	 v4XNfH+ov0Ii1rzlPBIW6myG/FgS2af7ygB5xLZuk5TtKYMJFQTLH7WAjKmW5vAuWG
	 nh6n7NJaP+q1p8Orrr0X89Gn+KmpwA2uqywV9rokHoA/4y78/SXUowlZWc4bqnjJWU
	 QweAXvRsUzV25XgvolaKf+xggLJUPxAy+j1Sp5V56McU1xovx42ObK3zV81AR3PLiF
	 /RK9gjudXiKKw==
Date: Thu, 17 Jul 2025 14:31:18 -0500
From: Rob Herring <robh@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	devicetree@vger.kernel.org,
	Lucca Fachinetti <luccafachinetti@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: is31fl32xx: convert the
 binding to yaml
Message-ID: <20250717193118.GA3988681-robh@kernel.org>
References: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
 <20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk>

On Thu, Jul 17, 2025 at 04:02:07PM +0100, Pawel Zalewski wrote:
> From: Lucca Fachinetti <luccafachinetti@gmail.com>
> 
> Add datasheets for reference, NB that I was not able to find an
> up-to-date, funtional direct URL for si-en products datasheet
> so they were skipped.
> 
> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 114 +++++++++++++++++++++
>  .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 ----------
>  2 files changed, 114 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..abcd4c448e94db1d1e339f7ee165c3e04a1d354d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/issi,is31fl3236.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: is31fl32xx and Si-En SN32xx IC LED driver
> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>
> +  - Lee Jones <lee@kernel.org>
> +
> +description: |
> +  The is31fl32xx/SN32xx family of LED drivers are I2C devices with multiple
> +  constant-current channels, each with independent 256-level PWM control.
> +  Each LED is represented as a sub-node of the device.
> +
> +  For more product information please see the links below:
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - issi,is31fl3236
> +      - issi,is31fl3236a
> +      - issi,is31fl3235
> +      - issi,is31fl3218
> +      - issi,is31fl3216
> +      - si-en,sn3218
> +      - si-en,sn3216
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
> +patternProperties:
> +  "^led@[1-9a-f][0-9a-f]$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          LED channel number (1..N)
> +        minimum: 0x1
> +        maximum: 0x24
> +
> +    required:
> +      - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - issi,is31fl3236
> +              - issi,is31fl3235
> +              - issi,is31fl3218
> +              - issi,is31fl3216
> +              - si-en,sn3218
> +              - si-en,sn3216
> +    then:
> +      properties:
> +        issi,22kHz-pwm: false

This is already false because you haven't defined the property anywhere. 
Though this property didn't exist in the existing binding, so why are 
you adding it (the commit msg needs an explanation)?

Rob

