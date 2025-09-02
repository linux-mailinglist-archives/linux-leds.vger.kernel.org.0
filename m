Return-Path: <linux-leds+bounces-5369-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F928B40D0C
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 20:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12343A20A0
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 18:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10B1346A0C;
	Tue,  2 Sep 2025 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BENSyEAR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225232F77E;
	Tue,  2 Sep 2025 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756837275; cv=none; b=oM7tk9NNIzRj6FUTpIHEzotJE5K2/PwDFkeatBXE5Zr34q3aD6aqRGJx5DB290zCmIv8jqLrhpxjLyrI2WKchdLLhDtEQ/jXp52ZONU9T6XnZ/Vg+GCYf6hpgyEjDU593pN4Lqqt3LpvTC07ggUWQ/YWI9sMZzIG8BcCYwascFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756837275; c=relaxed/simple;
	bh=zU2EDLEMo680ntNEFZH+tqJSVVxO3a/KNdwsdnSX67E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Edk9MiOr/Yh9dLdJ4wQYinkozhb9U7HnJhGnGGt+emWcnOJj22QukRfD9QirWltw7axDDfSrHB4yHWd3WL8iB//+aiEb674QH7U6toUT0c+J7UCs2Go22wh/Dreo+DBLee/0mQi0ELiPLFtDjUF5YawyfVpZlwOGM3M6ZBkTs4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BENSyEAR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA71C4CEED;
	Tue,  2 Sep 2025 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756837275;
	bh=zU2EDLEMo680ntNEFZH+tqJSVVxO3a/KNdwsdnSX67E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BENSyEARX0veb5fM58xX+/cnIpjr3Kqq9bjdnwPv5itD+nqISyEomW3N1G0I7e9bL
	 BvLmuvy3NV3fJJp6BiERpLOIrUw0cr0vPssEMVboIpYzDa0moTaJ886wRZpPEDdDnB
	 guM0LaEJNwzo5ZqD71gxLkHgt50bAbQasdqRSuoTzSvS2hKh1knCVHeJkrwWLvpD/s
	 IME0YbsmZzpul3zJngFlYrACKB8SFQl+QmzjcujeoHkPMlIr7pJUjwMAW6YwbwpFN/
	 KKyCNz8k2j51Oqo1QEsuYIGqyqwuVRese+FBV2SY4A9JrjULF/gQomiD8I3DEWPFNk
	 2c93c9bMe7xag==
Date: Tue, 2 Sep 2025 13:21:14 -0500
From: Rob Herring <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <20250902182114.GA965402-robh@kernel.org>
References: <20250902-leds-v1-0-4a31e125276b@vinarskis.com>
 <010201990a1f5ad8-fc97fc84-9ef9-4a03-bf1c-2d54423c6497-000000@eu-west-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010201990a1f5ad8-fc97fc84-9ef9-4a03-bf1c-2d54423c6497-000000@eu-west-1.amazonses.com>

On Tue, Sep 02, 2025 at 11:10:51AM +0000, Aleksandrs Vinarskis wrote:
> Currently supports passing 'led-names' used to map LED devices to their
> respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a63e78417df84609e279835f7dae62e3ad2f0bf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common leds consumer
> +
> +maintainers:
> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> +
> +description:
> +  Some LED defined in DT are required by other DT consumers, for example
> +  v4l2 subnode may require privacy or flash LED.
> +
> +  Document LED properties that its consumers may define.

We already have the trigger-source binding for "attaching" LEDs to 
devices. Why does that not work here?

Rob

> +
> +properties:
> +  leds:
> +    description:
> +      Phandle to LED device(s) required by particular consumer.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +  led-names:
> +    description:
> +      List of device name(s). Used to map LED devices to their respective
> +      functions, when consumer requires more than one LED.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      camera@36 {
> +        compatible = "ovti,ov02c10";
> +        reg = <0x36>;
> +
> +        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&cam_rgb_default>;
> +
> +        led-names = "privacy-led";
> +        leds = <&privacy_led>;
> +
> +        clocks = <&ov02e10_clk>;
> +
> +        assigned-clocks = <&ov02e10_clk>;
> +        assigned-clock-rates = <19200000>;
> +
> +        avdd-supply = <&vreg_l7b_2p8>;
> +        dvdd-supply = <&vreg_l7b_2p8>;
> +        dovdd-supply = <&vreg_cam_1p8>;
> +
> +        port {
> +          ov02e10_ep: endpoint {
> +            data-lanes = <1 2>;
> +            link-frequencies = /bits/ 64 <400000000>;
> +            remote-endpoint = <&csiphy4_ep>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> 
> -- 
> 2.48.1
> 

