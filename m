Return-Path: <linux-leds+bounces-5678-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A86BC683D
	for <lists+linux-leds@lfdr.de>; Wed, 08 Oct 2025 21:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4923A8750
	for <lists+linux-leds@lfdr.de>; Wed,  8 Oct 2025 19:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243232750E6;
	Wed,  8 Oct 2025 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1BJnAtO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A723ABA7;
	Wed,  8 Oct 2025 19:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953524; cv=none; b=dWKGdzmXoh2VVL442qGWbtFlYLtn8EhFVnNOB0DB5zpg2RMiGLC4xS+LGIAO6BBjndgtC9Sc+e2OT4MWYKVlr/fRxUAi7ba58aCIgOB2Yr1ywaxSp6uC8/gElgfYXN186Jmsj143e56d8fT2XrNW9ZjfKFQIn2VHSxBEubKzpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953524; c=relaxed/simple;
	bh=fsBwK8edDgB3+3bXTrKwuT1Fo03B6ncz3IdMr3Xa9Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOjySQpzC3EKQwFgwCNWGa+DmUeqOfn1xssndsvkpk1dX5GJTIFqqRRQo6GIfvkmp3GjOw8TGt6wychwN314O0xamFBKCoZdIjDSg+hhwyJFThBG83vIa6gC3MkuuOCf5ecDn6LwWQM0azLw7w+v8pCYkzEBniu+jkUtnTaDhNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1BJnAtO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC28C4CEE7;
	Wed,  8 Oct 2025 19:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759953523;
	bh=fsBwK8edDgB3+3bXTrKwuT1Fo03B6ncz3IdMr3Xa9Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1BJnAtORacIOSpKS7tcrJGvw0203NDqL9Q+j+wAHxF82kilLBqvudpIsQRATQbf0
	 HLPNGTehlNeSjK7CC48XuHLIySYq+ZsxMAXXwqsrWm7hW8dtVyAizy7f4hF+Fe2o6m
	 dJ9EP/e+24cG1g480Hs99sasnKKTdgut7LLBPPgk1hzoAWzVSb2o08V8vDsEdS0AlF
	 hed8U4B2dcl3JD/cSvglKbu+f8qf3WBPVf1m81QKQAzsRvwIQQVsp6rMc/0Rcx352N
	 u6XAM2ziyjU+rs50KrXWWvtoFGmvZZXDgTz3cD0dcw2M/yHMSgRx2X5KwDP/8UC9YJ
	 An5z1JrwgzThg==
Date: Wed, 8 Oct 2025 14:58:42 -0500
From: Rob Herring <robh@kernel.org>
To: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: ti,lm3601x: Convert to DT Schema
Message-ID: <20251008195842.GB3771722-robh@kernel.org>
References: <20251002-ti-leds-to-dt-v1-0-1604ae333479@thegoodpenguin.co.uk>
 <20251002-ti-leds-to-dt-v1-2-1604ae333479@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-ti-leds-to-dt-v1-2-1604ae333479@thegoodpenguin.co.uk>

On Thu, Oct 02, 2025 at 10:20:16AM +0100, Harrison Carter wrote:
> Converts the ti,lm36010 and ti,lm36011 txt to dt schema
> 
> Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
> ---
>  .../devicetree/bindings/leds/leds-lm3601x.txt      |  51 -----------
>  .../devicetree/bindings/leds/ti,lm3601x.yaml       | 100 +++++++++++++++++++++
>  2 files changed, 100 insertions(+), 51 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
> deleted file mode 100644
> index 17e940025dc26213314f5cfd54aa8e5bb09f86b7..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -* Texas Instruments - lm3601x Single-LED Flash Driver
> -
> -The LM3601X are ultra-small LED flash drivers that
> -provide a high level of adjustability.
> -
> -Required properties:
> -	- compatible : Can be one of the following
> -		"ti,lm36010"
> -		"ti,lm36011"
> -	- reg : I2C slave address
> -	- #address-cells : 1
> -	- #size-cells : 0
> -
> -Required child properties:
> -	- reg : 0 - Indicates a IR mode
> -		1 - Indicates a Torch (white LED) mode
> -
> -Required properties for flash LED child nodes:
> -	See Documentation/devicetree/bindings/leds/common.txt
> -	- flash-max-microamp : Range from 11mA - 1.5A
> -	- flash-max-timeout-us : Range from 40ms - 1600ms
> -	- led-max-microamp : Range from 2.4mA - 376mA
> -
> -Optional child properties:
> -	- function : see Documentation/devicetree/bindings/leds/common.txt
> -	- color : see Documentation/devicetree/bindings/leds/common.txt
> -	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
> -
> -Example:
> -
> -#include <dt-bindings/leds/common.h>
> -
> -led-controller@64 {
> -	compatible = "ti,lm36010";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	reg = <0x64>;
> -
> -	led@0 {
> -		reg = <1>;
> -		function = LED_FUNCTION_TORCH;
> -		color = <LED_COLOR_ID_WHITE>;
> -		led-max-microamp = <376000>;
> -		flash-max-microamp = <1500000>;
> -		flash-max-timeout-us = <1600000>;
> -	};
> -}
> -
> -For more product information please see the links below:
> -https://www.ti.com/product/LM36010
> -https://www.ti.com/product/LM36011
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3601x.yaml b/Documentation/devicetree/bindings/leds/ti,lm3601x.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7d8ee44d6fe37d13ee84888c5811df3e15a5d02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3601x.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lm3601x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments - lm3601x Single-LED Flash Driver
> +
> +description: |
> +  The LM3601X are ultra-small LED flash drivers
> +  that provide a high level of adjustability.
> +
> +  For more product information please see the links below:
> +  https://www.ti.com/product/LM36010
> +  https://www.ti.com/product/LM36011
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - "ti,lm36010"
> +      - "ti,lm36011"

Don't need quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0,1]?([0-9]|[a-z])$":

'^led@[01]$'

> +    type: object
> +    $ref: common.yaml#
> +    properties:
> +      reg:
> +        description: |
> +          0 - Indicates IR mode
> +          1 - Indicates Torch (white LED) mode
> +        minimum: 0
> +        maximum: 1
> +
> +      flash-max-microamp:
> +        minimum: 11
> +        maximum: 1500000
> +
> +      flash-max-timeout-us:
> +        minimum: 40
> +        maximum: 1600000
> +
> +      led-max-microamp:
> +        minimum: 24
> +        maximum: 376000
> +
> +    required:
> +      - reg
> +      - flash-max-microamp
> +      - flash-max-timeout-us
> +      - led-max-microamp
> +
> +    unevaluatedProperties: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
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
> +        led-controller@64 {
> +            compatible = "ti,lm36010";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0x64>;
> +
> +            led@1 {
> +                reg = <1>;
> +                function = LED_FUNCTION_TORCH;
> +                color = <LED_COLOR_ID_WHITE>;
> +                led-max-microamp = <376000>;
> +                flash-max-microamp = <1500000>;
> +                flash-max-timeout-us = <1600000>;
> +            };
> +        };
> +    };
> +...
> +
> 
> -- 
> 2.51.0
> 

