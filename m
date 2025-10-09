Return-Path: <linux-leds+bounces-5701-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C77BC9779
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 16:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07DF24E267E
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 14:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC74B2EA174;
	Thu,  9 Oct 2025 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFyi6IIr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C72E6CDF;
	Thu,  9 Oct 2025 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760019495; cv=none; b=PIfjkhlqLuHY0sSQw9wi56eQu30rjaFXEDghIM9mU2/x12NixZ8Db5EtI6TVpOgo949MulOsFPiVKieZPaT1FNvX7AY9OZAcu65hsNQPckwr6fCQQR7MavZbdYdI6jFxs1hD2zxskxvTf22pKF0oDk+2FMbDYAkLZLcYkKCxdCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760019495; c=relaxed/simple;
	bh=kaDua32f3qLiwsYl0j8Z4xImQ/EmgINoiUX70Dl71x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFPDH3fDW7uL0VX7iS0QFeyhnbZY5gPLVz2JFOfCDef/dRMvS02PNr4bqPRqxmERfXbxTZLJwyrBPAmoUKXmAIDgTPJZBNzuo6Xqm8g6aVnVt6IsJ3gyCsro/UKWETc6TGZZprfvdYBeIscojznYMZFj2MyX4Y5WFPzCrV0Tn24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFyi6IIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D28FC4CEE7;
	Thu,  9 Oct 2025 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760019495;
	bh=kaDua32f3qLiwsYl0j8Z4xImQ/EmgINoiUX70Dl71x8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KFyi6IIrvnOJaEfagmtohHpJmubyiaXLzdll6HXlSTUjTS/6tapuaPeCI/1JlcYHn
	 9kP4MzO9TLqNmG1Wf62RC/4Ap97zJoVTPyDyMcuX3ZMg1beMif6zouUP9ZksXayIul
	 1wZtfWj3TGJpPR1mB90CJgGOqfhhtTEaNjxtA3OgS2KyfO6Pt5ZfayRgRPdFpWcGLb
	 1SUOklzht150/XKv5FVrAEbNBnHkJbm/I0iBoi4zEG1mhaCEkTJWGJnsAv20x/GywX
	 7j/DsEYMwZ0ly/o8ogQyGwpI08kKh33gcHfEG5065bjHeFo5aSb+XvGfDMRxnBiBit
	 oB6La0Nkb5/Vg==
Message-ID: <204c121b-4697-44f3-80b2-b66f77a60168@kernel.org>
Date: Thu, 9 Oct 2025 23:18:07 +0900
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver
To: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Jonathan Brophy <professor_jonny@hotmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20251009084339.1586319-1-professorjonny98@gmail.com>
 <20251009084339.1586319-2-professorjonny98@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20251009084339.1586319-2-professorjonny98@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2025 17:43, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Document Virtual Color device tree bindings.
> 
> Co Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>

Messed SoB chain... plus corrupted tag. Please look at submitting
patches what should be written here.

> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> new file mode 100644
> index 000000000..945058415
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +title: Virtual LED Group with Priority Control


Bindings describe real hardware, not virtual arrangements. At least
usually. You need to make a case in the commit msg why we want exception
from standard rule.

> +
> +maintainers:
> +  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> +
> +description: |
> +  Virtual LED group driver that combines multiple monochromatic LEDs into


For sure we do not describe drivers here. Describe hardware or
system/board-level concept.

> +  logical groups with priority-based control. The driver ensures only the
> +  highest-priority LED state is active at any given time.
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
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Virtual LED number
> +
> +      monochromatic-leds:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description: List of phandles to the monochromatic LEDs to group

You allow only one phandle, not list, so this is confusing.

> +
> +      priority:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Priority level for LED activation
> +                     (higher value means higher priority)
> +
> +      blink-delay-on:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Time in milliseconds the LED is on during blink

Time in ms is expressed with proper unit suffix.

Isn't there standard property for this?

> +
> +      blink-delay-off:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Time in milliseconds the LED is off during blink
> +
> +    required:
> +      - reg
> +      - monochromatic-leds
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    led-controller {
> +        compatible = "leds-group-virtualcolor";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led@0 {
> +            reg = <0>;
> +            label = "status:red";

Use color and function instead.

> +            monochromatic-leds = <&led_red>;
> +            priority = <2>;
> +            blink-delay-on = <500>;
> +            blink-delay-off = <500>;
> +        };
> +
> +        led@1 {
> +            reg = <1>;
> +            label = "status:green";
> +            monochromatic-leds = <&led_green>;
> +            priority = <1>;
> +        };
> +    };
> +
> \ No newline at end of file

You have patch warnings.

Best regards,
Krzysztof

