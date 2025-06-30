Return-Path: <linux-leds+bounces-4946-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 905E1AEEA10
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 00:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C361E1891BE1
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 22:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7098F23ABBD;
	Mon, 30 Jun 2025 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vbz7Veb2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D511A073F;
	Mon, 30 Jun 2025 22:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321948; cv=none; b=lk1Od8QbTCsqXrVh19sdgOGyFcX4FwL+dtDTCPtm6+qZ9fXvw7VZ61Zpa7vI8IePUA5mwz8GuLzEqbgMxZSQxal5ylgahDXjzSkQ/sUNps5Y2qyS4V/Na2tEmr669uCkPUIC3D6XXI/i9jRgYgmTTR8VdliEx3SiA8N1bBezjLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321948; c=relaxed/simple;
	bh=jQHStKpFLYhAu//XedXmaX6y3FPhX7j/fIiF2U1S4zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYwXux+kPZqUseLoHOYvSyjaU/dBAD15KsBNvvUuS7Ojc8JoCSXx723L/Nk5Z3YXgymmRB/DwBn0ZBG/Zhg7dxehUPqcITGVVM7BV90ERfQZOwCW6pKCIOb6ybezw+6pIVJYrOT4l9she6uJrTcV+GSfl76ctr3NoSI4zzMYK0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vbz7Veb2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BAFC4CEE3;
	Mon, 30 Jun 2025 22:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751321947;
	bh=jQHStKpFLYhAu//XedXmaX6y3FPhX7j/fIiF2U1S4zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vbz7Veb2h56+p1RVlwzFNdVIO5pQt3G6JC4ZTIl9I2e4JwpEqlvYXS8PuiKXrMVwl
	 QT+5a+tD+2KVDBbOTjhMEz0V7/y22OrtaMMY4jJhu2tiWURRyIPcyWbQ8y4W8ChawN
	 cMRQIQV7p/nlOXHozKXH3nHAtcw7eR3LW+ILu6fTfdzPW4S6ZUWapAeQ3VB8OnI6Vs
	 WBRK/7Dutai2rLhfN+pjKgyyGS2aZY6DNVfBSk8T8LNh4jA3MbKbGlOFX0Hkm7/B/f
	 gvw0eXsfC8U8w/t3H4NoQoqCUTh8cU6BuTxDqUOooPXt7xC9XzNbwnt1C0vsD5WKeI
	 uaioD9oqnHsIA==
Date: Mon, 30 Jun 2025 17:19:06 -0500
From: Rob Herring <robh@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	devicetree@vger.kernel.org,
	Lucca Fachinetti <luccafachinetti@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: leds: is31fl32xx: convert the
 binding to yaml
Message-ID: <20250630221906.GA3536184-robh@kernel.org>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
 <20250627-leds-is31fl3236a-v2-2-f6ef7495ce65@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-leds-is31fl3236a-v2-2-f6ef7495ce65@thegoodpenguin.co.uk>

On Fri, Jun 27, 2025 at 11:20:36AM +0100, Pawel Zalewski wrote:
> From: Lucca Fachinetti <luccafachinetti@gmail.com>
> 
> Keep the old maintainers field as is.
> Add datasheets for reference, NB that I was not able to find an
> up-to-date, funtional direct URL for si-en products datasheet
> so they were skipped.
> 
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

As the sender of the patches, your tags go last.

> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> ---
>  .../devicetree/bindings/leds/leds-is31fl3236.yaml  | 101 +++++++++++++++++++++
>  .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 -----------
>  2 files changed, 101 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml b/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f26340850647d1c642fb345b7cf90764200e13ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-is31fl3236.yaml#
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
> +  '#address-cells':
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[1-9][0-9]*$":

Unit address should be hex.

> +    type: object
> +    $ref: common.yaml#
> +    additionalProperties: false

unevaluatedProperties: false

That allows other properties from common.yaml which you should allow 
IMO.

> +
> +    properties:
> +      reg:
> +        minItems: 1

maxItems: 1

Is there a known maximum number? If so, add 'maximum'.

> +        description:
> +          LED channel number (1..N)
> +
> +      label: true
> +
> +      linux,default-trigger: true

And drop these 2.

> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#size-cells"
> +  - "#address-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        s31fl3236: led-controller@3c {

Drop unused labels.

> +          compatible = "issi,is31fl3236";

You indented 4 and then 2 here. Indent by 4 for each level.

> +          reg = <0x3c>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          led@1 {
> +            reg = <1>;
> +            label = "EB:blue:usr0";
> +          };
> +          led@2 {
> +            reg = <2>;
> +            label = "EB:blue:usr1";
> +          };
> +          led@3 {
> +            reg = <3>;
> +            label = "EB:blue:usr35";
> +          };
> +        };
> +    };
> +...
> +

