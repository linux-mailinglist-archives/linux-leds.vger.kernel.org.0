Return-Path: <linux-leds+bounces-5818-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEABEE344
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 12:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6F664E666F
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 10:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8592DFA3E;
	Sun, 19 Oct 2025 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHTuC4WQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3F1096F;
	Sun, 19 Oct 2025 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760870599; cv=none; b=qcfqbNTSx8Y29QB8KvUzZvrbjPP6mx4YWEOfJmUhODICcAXIXzy6MbkDKfRUJaegv3YOYUkDbAHrzgpmtGS1FWUQun8zNAFRilY7gcbsW0WvZKprLq60/VIbzyYlHk5RnIRnjqYM9lLIV5iVU3WkMdfIKoLUx5FLJEd/Y7JEwjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760870599; c=relaxed/simple;
	bh=ReKXrr9r7h2qgLlV4rBFc1pz80CDKazOX1YmPfRP0zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDCLwO/RKP4WEgbEyZAjU44da38tSb9nftNoss3/nTR3XwSJsNEvEQbwr1h7FLG0U1fX5mQITDtrNui01GZujnpRh1omsDEcJzg2/Ccfi0JmAhDn+4+dRTyqPiEC+TfeFU289X38EJNipfXrZPfwYsgKzu3w8gVslzKB8a3pJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHTuC4WQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D019C113D0;
	Sun, 19 Oct 2025 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760870598;
	bh=ReKXrr9r7h2qgLlV4rBFc1pz80CDKazOX1YmPfRP0zE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QHTuC4WQ3nPIs/LNeUSwFm9aRw9QREE0Qe0wXKlZ42vh6SPIK1UchgmsfbU7ULiD4
	 mV4P1E0Gap7xCqBzsKMLsp/vPiSvCdnfkPIDHKVrmyc4Ka59FGWR48ykkKc3KXg5/K
	 BBhTV/pp06WuHh7+d4bW/hTi+WcYTA7Ite66cvBhM+Yowrnyut7WDQmnbJvK8GeVT2
	 17BOcaTcwXSgeV17UXnCBvb6sIWw/fG+pcrCg0i7DdEQjSoZ1iBybqEwiGJcKEuIyv
	 1x7XKvZKO2wOuEaIR1HV31bM28km0KthurKyKQkr7bjs1Imm4p8LXl6AzWJGoYPWyq
	 fsm9yttz+by1w==
Message-ID: <4aae2f80-3b05-4583-a1c0-6b711fe3b879@kernel.org>
Date: Sun, 19 Oct 2025 12:43:14 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: Add virtualcolor group dt
 bindings documentation.
To: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Jonathan Brophy <professor_jonny@hotmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20251019092331.49531-1-professorjonny98@gmail.com>
 <20251019092331.49531-3-professorjonny98@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251019092331.49531-3-professorjonny98@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/10/2025 11:23, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Add device tree binding documentation for the virtual LED group driver
> that implements virtual LED groups by aggregating multiple monochromatic
> LEDs
> 
> Bindings for the virtual driver are not describing hardware LEDs they
> describe virtual devices made from groups of hardware LEDs created from an array
> of LED phandles.


Don't describe DT syntax, but hardware. Phandles are not important here.
How the board, system looks like? What are you achieving here?

> 
> Normally the device tree is used to describe hardware not virtual hardware
> but it is particularly useful in situations where you require an LED to be a
> specific color by mixing primary colors, such as multi element multi color LEDs
> to be operated from a device tree binding.


Please describe the hardware and usecase, and then say how existing
bindings cannot cover it so binding solves that use case. Write concise,
yet informative statements. We all now how DT works, this you do not
have to explain to us.

But we need to know WHY we want this code.

> 
> It also becomes useful with multiple LEDs operating the same indicator such as
> ring of light indicators where the LEDs are driven From different GPIO outputs
> unifying the control that can give basic indication during system startup,
> shutdown upgrade etc...
> 
> co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> new file mode 100644
> index 000000000000..f638bdd4d65e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +title: virtualcolor LED group driver
> +maintainers:
> +  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> +description: |
> +  Implements virtual LED groups by aggregating multiple monochromatic LEDs.
> +  Provides priority-based control for managing concurrent LED activation requests,
> +  ensuring only the highest-priority LED state is active at any given time.
> +properties:
> +  compatible:
> +    const: leds-group-virtualcolor
> +  '#address-cells':
> +    const: 1
> +  '#size-cells':
> +    const: 0
> +patternProperties:
> +  "^virtual":
> +    $ref: leds-class-virtualcolor.yaml#
> +required:
> +  - compatible
> +additionalProperties: false
> +examples:
> +  - |


Totally corrupted patch.

I don't understand the changes. Please start from scratch from latest
reviewed binding or example schema.



> +    #include <dt-bindings/leds/common.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    led-controller {
> +        compatible = "gpio-leds";
> +        led_red: led_red {
> +            gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
> +            default-state = "off";
> +        };
> +        led_green: led_green {
> +            gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
> +            default-state = "off";
> +        };
> +        led_blue: led_blue {
> +            gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
> +            default-state = "off";
> +        };
> +    };
> +
> +    pwm-led-controller {
> +        compatible = "pwm-leds";
> +
> +        led_1: led-1 {
> +            color = <LED_COLOR_ID_RED>;
> +            pwms = <&twl_pwm 0 7812500>;
> +        };
> +
> +        led_2: led-2 {
> +            color = <LED_COLOR_ID_GREEN>;
> +            pwms = <&twl_pwmled 0 7812500>;
> +        };
> +
> +        led_3: led-3 {
> +            color = <LED_COLOR_ID_RED>;
> +            pwms = <&twl_pwm 0 7812500>;
> +        };
> +
> +        led_4: led-4 {
> +            color = <LED_COLOR_ID_GREEN>;
> +            pwms = <&twl_pwmled 0 7812500>;
> +        };
> +
> +    };
> +
> +    virtual-led-controller {
> +        compatible = "leds-group-virtualcolor";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        virtual_red@0 {


Follow DTS coding style.



Best regards,
Krzysztof

