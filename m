Return-Path: <linux-leds+bounces-6296-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C941C7F4C8
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 08:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF66F4E36CF
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 07:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D45A2EAD1C;
	Mon, 24 Nov 2025 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwqMVXRX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE82EA723;
	Mon, 24 Nov 2025 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971067; cv=none; b=GqzjXa+xwSdmLac6X92QNsOSqz4fXcuZqMGmkB6JFeA2zhNCu4nPH4KLImtGW32mXLJwuB8Um6hyhfW2FKAsHKCtt34GK7qAHYemKjbNQIWepCPpTQ39eafs2nqQLjr/wp3o8IB0vnzybKTxi57Fiwiy6V+/CmCt/sf45IYiF8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971067; c=relaxed/simple;
	bh=5uRKDiVvsvPkmtFXDpTJ6a9+VtFj2V3/6nDLjoPBxgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLifrd93u+37u2Y6ljRvv2g7ewCW/tLZIdWQIeFhNkroigpPgIbwT79bM+mSAyzCCAe6drri1Wcvs/lk+HC8B0ZVKNqzHoLHIo3eICtLMoi1EpIvB508Fjzd40EVMBjMhlYO5pYeU4N/rJ1yuXVzmxYKJPnXYYsZBQxJICa99Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwqMVXRX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393E7C116D0;
	Mon, 24 Nov 2025 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971066;
	bh=5uRKDiVvsvPkmtFXDpTJ6a9+VtFj2V3/6nDLjoPBxgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwqMVXRXjDLIPEfSWtfuyRpHkc6tQgzjKWRt+Rl/r9Ufrw5WWFoRDw82nSYpbmsxo
	 aRKV3uQ4DfU08H0Lj+tMLOfoVQ05EKaPFlDtdSIKAjEte8GWCJJ4p3JP3UPy2pzDLL
	 vrjfUYLPh6CRJJLxdTUiWqNcMf2j7P71isGR/u6rDJDkJCehVOPPsQQFJVUWZUGeTQ
	 Ns7mLDoEHicc/Yr73osJvLAtQVjI1XtlLhrB/pAln3oG+zYLf84Afo1BGbOQy3+vGv
	 IXWqHXzQ0GZuKzStnBYtwiwNbq9MrsX79usEq1/SBe7/C0axv253T5R93S5tLUgLkq
	 HnZoBvUJudnOg==
Date: Mon, 24 Nov 2025 08:57:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, gregkh@linuxfoundation.org, 
	rdunlap@infradead.org, christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 1/3] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <20251124-resolute-wrasse-of-wholeness-aed84d@kuoka>
References: <20251123191042.116917-1-trannamatk@gmail.com>
 <20251123191042.116917-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251123191042.116917-2-trannamatk@gmail.com>

On Mon, Nov 24, 2025 at 02:10:40AM +0700, Nam Tran wrote:
> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> dimming, including exponential PWM for smooth brightness control.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 251 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 257 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> new file mode 100644
> index 000000000000..ea9d6ae92344
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> @@ -0,0 +1,251 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LP5812 4x3 Matrix RGB LED Driver with Autonomous Control
> +
> +maintainers:
> +  - Nam Tran <trannamatk@gmail.com>
> +
> +description: |
> +  The LP5812 is a 4x3 matrix RGB LED driver with I2C interface
> +  and autonomous animation engine control.
> +  For more product information please see the link below:
> +  https://www.ti.com/product/LP5812#tech-docs
> +
> +properties:
> +  compatible:
> +    const: ti,lp5812
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,scan-mode:
> +    description: |
> +      Selects the LED scan mode of the LP5812. The device supports
> +      three modes:
> +        - Direct-drive mode (by default if 'ti,scan-mode' is omitted)
> +        drives up to 4 LEDs directly by internal current sinks (LED0-LED3).
> +        - TCM-drive mode ("tcm:<n>:<order...>") drives up to 12 LEDs
> +        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
> +        of scans (1-4), and <order...> defines the scan order of the outputs.
> +        - Mix-drive mode ("mix:<n>:<direct>:<order...>") combines
> +        direct-drive and TCM-drive outputs. The <n> specifies the number
> +        of scans, <direct> selects the direct-drive outputs, and <order...>
> +        defines the scan order.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    pattern: '^(tcm|mix):[1-4](:[0-3]){1,4}$'
> +
> +  vcc-supply:
> +    description: Regulator providing power to the 'VCC' pin.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-3]$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +    required:
> +      - reg
> +      - label

No, why? That's legacy property and color and function are preferred.

> +
> +  "^multi-led@[4-7]$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 4
> +        maximum: 7
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^led@[4-9a-f]$":
> +        type: object
> +        $ref: common.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            minimum: 4
> +            maximum: 15
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - reg
> +      - label

Why? Same problems.

Please stop making continuous changes to the binding.


> +
> +required:
> +  - compatible
> +  - reg
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
> +        led-controller@1b {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "ti,lp5812";
> +            reg = <0x1b>;
> +            ti,scan-mode = "tcm:4:0:1:2:3";
> +            vcc-supply = <&vdd_3v3_reg>;
> +
> +            led@0 {
> +                reg = <0x0>;
> +                label = "LED0";
> +                led-max-microamp = <25500>;
> +            };
> +
> +            led@1 {
> +                reg = <0x1>;
> +                label = "LED1";

Completely useless label... You require labels, so people need to write
something but since they do not know what to write they call LED 1 a
LED1. This is just not helping.

Use color and function properties. Same everywhere else.

Best regards,
Krzysztof


