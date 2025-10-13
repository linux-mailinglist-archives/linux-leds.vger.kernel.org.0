Return-Path: <linux-leds+bounces-5773-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C79BD6C1D
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 01:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC6D44E212F
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 23:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3A02C0F6E;
	Mon, 13 Oct 2025 23:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozpJdtU8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5C21E5B9A;
	Mon, 13 Oct 2025 23:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760398915; cv=none; b=WwwAWcYW3c/0cjuJ8Z8zXPSDZxmtgpIzZhlB4bLUZTKjh1fwRELNaxMsmF6bYgcVlpYvx1u56LIu4JujyYCaPUgVmvznPRgRxBJKW6sZBcBevx2KxrV+nv6zzazXZDcoyF6QnoI6jkqeOu0Ky2pl2vRB1iyAit3ACpuPCv+d5xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760398915; c=relaxed/simple;
	bh=FhA+6MxVpX+XMIRb8hFgV90i2r+GLcJffFBtki8AwNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8hjWv6KwoNKBHqAjGWyVBK5d2eg+gxGq9G7AH8g0QNTXdwi0JbmxSEc96cGsk1p2OCuFJ5Ud0Ob3A4n1YoIeEZbCJTBosnQoifJFn7zKVbiGxKRT9O8LLKBtKGXcIrb+HFazXeG+fN0VhiTQLcrmJJgGs7/6VuCSRE7NNUlnb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozpJdtU8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03226C4CEE7;
	Mon, 13 Oct 2025 23:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760398914;
	bh=FhA+6MxVpX+XMIRb8hFgV90i2r+GLcJffFBtki8AwNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ozpJdtU865OPdmLHrJQy7zkChQZnUN0H/PpkJrMeSzqgh2tF/MhYxxpNiELgeY4Lb
	 wUfwDnBet/TuufQXDz/I+OSwzdHbpHVsV5/B5BoXFoaPQTwWFO30HHASiQ1X8Grva8
	 9dOP3g4HevCSVzEuVklVsasbeB2nIytTJnTbFf95YMftuV2l/kw/aafGau7A+cL/fh
	 VHSVEUxkmysJa+3Ahn8U2XU8eojPIvB9xBJkBOuRorJiTaNMxwVNqdtKQp6DRrW1DD
	 UDlr4m5FmgXsDuvTmTbJzWdA587DKBJIgY19X4i8kk1DF/x8UGKxLCKdFu7S9KuP7M
	 aIkHBST3OWLGw==
Message-ID: <8c3796eb-63d0-4650-b296-60894461a806@kernel.org>
Date: Tue, 14 Oct 2025 01:41:47 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver
To: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Jonathan Brophy <professor_jonny@hotmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20251013120955.227572-1-professorjonny98@gmail.com>
 <20251013120955.227572-2-professorjonny98@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251013120955.227572-2-professorjonny98@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/10/2025 14:09, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Document Virtual Color device tree bindings.

I don't see how you answered my comment about missing justification.

Rob's questions also were not answered.

Few minor things follow up, but considering missing reasoning I did not
perform full review.

A nit, subject: drop second/last, redundant "YAML bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

... and driver. Again - explain the hardware. Bindings are not for driver.

> 
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> new file mode 100644
> index 000000000000..bafdd8fb9557
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common properties for virtualcolor led class
> +
> +maintainers:
> +  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> +
> +description: |
> +  Bindings to show how to achieve logically grouped virtual LEDs.
> +  The nodes and properties defined in this document are unique to the
> +  virtualcolor LED class.

That's completely redundant statement.

> +  Common LED nodes and properties are inherited from the common.yaml
> +  within this documentation directory

As well drop. Your description is pretty obvious and does not help at all.

> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: leds-group-virtualcolor
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  '^led@[0-9a-f]$':
> +    type: object
> +    $ref: common.yaml#

Missing unevaluatedProperties: false.

> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Virtual LED number
> +
> +      leds:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description: List of phandles to the monochromatic LEDs to group
> +
> +      function:
> +        description: |
> +          For virtualcolor LEDs this property should be defined as
> +          LED_FUNCTION_VIRTUAL_STATUS as outlined in:
> +          include/dt-bindings/leds/common.h.
> +
> +      priority:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Priority level for LED activation
> +          (higher value means higher priority)
> +
> +      blink-delay-on:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Time in milliseconds the LED is on during blink
> +
> +      blink-delay-off:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Time in milliseconds the LED is off during blink
> +        note: Setting just one of the blink delays to a valid value while
> +          setting the other to null will cause the LED to operate with a one-shot
> +          on or off delay instead of a repeat cycle.


And drop all above, except reg and leds. If these are new properties,
then you need to use proper unit suffixes.

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml

Best regards,
Krzysztof

