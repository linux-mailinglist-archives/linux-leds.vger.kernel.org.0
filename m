Return-Path: <linux-leds+bounces-4784-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 664EAAD4E39
	for <lists+linux-leds@lfdr.de>; Wed, 11 Jun 2025 10:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFD9B189E79F
	for <lists+linux-leds@lfdr.de>; Wed, 11 Jun 2025 08:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9563923909F;
	Wed, 11 Jun 2025 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxFupl9a"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0B231825;
	Wed, 11 Jun 2025 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630290; cv=none; b=TBCxP1DNoP0z4qP3DJ3GMfPumI5b1xZo/aNcMHuVPRqG4fopBkjDLBccMUn0SQkrZEKs5FkY7AbqpSrgCnNSnAvUmxtEWaqS5pzSJkqdA+0RPYazp0ABYhJrg8OGaSTxuqV+F7WQtRsA0JQFFHWI3XlEJdNNSCgc3LHVuiKccf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630290; c=relaxed/simple;
	bh=kZRdlavCAxUA7vtsFWahmMb55QZEg0NDyi1NLO9UNi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGUooif5/JaoN7FHbyK3m8V3+wcxY7fPuGPu2oHXMl4QOJIDZuxIzeTqcUnO/Czkbp9oqgiFcJ392JDQN9Vd30fIeZzkIkHioaD8rAEQ826fJBwx6CHhETM1oIlSOAcKY/z8gJJzieA7DefWBB6c+SF9OFf3JqvosSYrH4iJqZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxFupl9a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605BCC4CEEE;
	Wed, 11 Jun 2025 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749630290;
	bh=kZRdlavCAxUA7vtsFWahmMb55QZEg0NDyi1NLO9UNi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IxFupl9aH+RT82Bs7IcFJgCEMA5JKESI8QbzEqK5RqE6EN2Tm1E3lW2ZG0foDSqr9
	 soKzZXeRctSsMO+sn6ecP82PriqxssYPfRRdEkYEtrULMo4qxVt8j5PPz7oIjOeARH
	 iwAdMciX1RYm/w32WpraPxrndHDdzOQBmnKwnmxwzcDkEKs6Y90wZyiPvUjYkG9rik
	 UBjjFqw7C+TtpPOzoTtCxpyPEXImydvWetnmuKvZLlGfRInYADsz0p76pDYmIh2D6n
	 XtH8h5ND0Kc80jf9igcUHk6Y18Vx+BZBn+xEOiLSb8tbc7vevCeGwnZmybRm4p0b3+
	 pMFgl/M3413HQ==
Date: Wed, 11 Jun 2025 10:24:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <20250611-nimble-archetypal-raptor-eadcb6@kuoka>
References: <20250610174319.183375-1-trannamatk@gmail.com>
 <20250610174319.183375-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610174319.183375-2-trannamatk@gmail.com>

On Wed, Jun 11, 2025 at 12:43:15AM GMT, Nam Tran wrote:
> +patternProperties:
> +  "^led@[0-3]$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      led-cur:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        description: |
> +          LED current in 0.1 mA steps (e.g., 150 = 15.0 mA; 0 if not connected)
> +        minimum: 0
> +        maximum: 255
> +
> +      max-cur:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        description: Maximum allowed current in 0.1 mA steps
> +
> +      reg:
> +        minimum: 0
> +        maximum: 3

Place properties according to DTS coding style.

> +
> +  '^multi-led@[4-7]$':
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 4
> +        maximum: 7
> +
> +      '#address-cells':

Don't mix quotes. Either ' or "

> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^led@[4-9a-f]$":
> +        type: object
> +        $ref: common.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          led-cur:
> +            $ref: /schemas/types.yaml#/definitions/uint8

No, use existing led common properties. Also observe the units - this is
not uint8 but a defined type for microamp, see property-units in
dtschema.

> +            description: |
> +              LED current in 0.1 mA steps (e.g., 150 = 15.0 mA; 0 if not connected)
> +            minimum: 0
> +            maximum: 255
> +
> +          max-cur:
> +            $ref: /schemas/types.yaml#/definitions/uint8

No, use existing led common properties. Same everywhere.

> +            description: Maximum allowed current in 0.1 mA steps
> +
> +          reg:
> +            minimum: 4
> +            maximum: 15
> +
> +        required:
> +          - reg
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
> +            vcc-supply = <&vdd_3v3_reg>;
> +
> +            led@0 {
> +              reg = <0x0>;


Messed/mixed indentation.

BTW, such significant binding change at v9, invalidting reviews and
rewriting the binding completely, is surprising.

Best regards,
Krzysztof


