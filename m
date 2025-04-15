Return-Path: <linux-leds+bounces-4482-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D21A895BC
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 09:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D62243A8B87
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 07:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2552741D6;
	Tue, 15 Apr 2025 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAMWoD50"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB2194C86;
	Tue, 15 Apr 2025 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703738; cv=none; b=dygVGLhAp8bS4VvnA/RCvAVWqi5TfK7je5xp7C45H/qnNZNXrob0cAo7vDFtjh+mYM/60oGYGhJ+LvYdKFnkLL1TFKIU5x4MMRaJ5JNTxUfsU1KihUTfQO+rgJzLTPtROJTN9BvbjNJZ5xN+/QQc3Pm70c/qAMJW9Ud+SlA/LJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703738; c=relaxed/simple;
	bh=SfLVHsoY/QAXKrai3AX+QQVNRS3TPHWbMePbzgi022w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJVBbjbc+MDoYmZNSHpZ+RruB8g2UMHsg/E7N7sL2jqxJchJuFoD0q92+hmdL7+dGFgZJ7p+eYaslCv0YS2Xq7VqTP4EtYvG5A6HJ6826myOPeS9mlJh/MOnjGV/5vwq1NCit4jxHAWb2W1Iu9hfimp7y8qVQv6Fow64MHLE8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAMWoD50; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D2CC4CEDD;
	Tue, 15 Apr 2025 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744703738;
	bh=SfLVHsoY/QAXKrai3AX+QQVNRS3TPHWbMePbzgi022w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAMWoD50iF7dn8HbeSqrfhwq+k9/9WTxoioDlcoI10nMivxsaWqAAVXVBuxHciHwV
	 XJdR7nPdSOZWwfygd0dvIwqMdg3+SAroKSM27h6W8jlh+Z7GAG/CgFmHt21H4RIJsA
	 7Dc9yoZx2cKuZoxm/Sbmn5apFOG0N+6jFjbuy0LzFeLI3+piR55KfICWJ0/WnM5w/1
	 2aqqH1LpOw6iMKenTWjI8HlfUdziQfVqvTnIaQFxiIK5YjmskW3Bi2unk0obcLYK5o
	 HXD61Q737t8VqyaGhcpd7ulnabhOG5iDK7GPoyWaltb6BmXts/MYp9KTxOVfroIPls
	 l+Gcrm/BOOXBw==
Date: Tue, 15 Apr 2025 09:55:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ante Knezic <ante.knezic@helmholz.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	knezic@helmholz.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: leds: add binding for WL-ICLED
Message-ID: <20250415-dashing-impartial-baboon-70d086@shite>
References: <cover.1744636666.git.knezic@helmholz.com>
 <35c7f697070b3939727f1115d3a279e280f72cd6.1744636666.git.knezic@helmholz.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35c7f697070b3939727f1115d3a279e280f72cd6.1744636666.git.knezic@helmholz.com>

On Mon, Apr 14, 2025 at 03:28:50PM GMT, Ante Knezic wrote:
> From: Ante Knezic <knezic@helmholz.com>
> 
> WL-ICLED is a RGB LED with integrated IC from Wurth Elektronik.
> Individual color brightness can be controlled via SPI protocol.
> 
> Signed-off-by: Ante Knezic <knezic@helmholz.com>
> ---
>  .../bindings/leds/leds-wl-icled.yaml          | 88 +++++++++++++++++++

Filename based on compatible. Choose one compatible and use it here.

>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml b/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
> new file mode 100644
> index 000000000000..bf79c7a1719b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-wl-icled.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for WL-ICLEDs from Wurth Elektronik.

driver as Linux driver? Then drop and describe hardware.

Also drop full stop

> +
> +maintainers:
> +  - Ante Knezic <ante.knezic@helmholz.de>
> +
> +description: |
> +  The WL-ICLEDs are RGB LEDs with integrated controller that can be
> +  daisy-chained to arbitrary number of LEDs. Communication with LEDs is
> +  via SPI interface and can be single or two wire, depending on the model.
> +  For more product information please see the link below:
> +  https://www.we-online.com/en/components/products/WL-ICLED
> +
> +properties:
> +  compatible:
> +    enum:
> +      - we,1315x246
> +      - we,1315x002
> +      - we,131x000
> +      - we,131161x
> +      - we,131212x

Is that a wildcard in each compatible?

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^led@[0-9a-f]$':
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          This property denotes the LED position in the daisy chain
> +          series. It is a zero based LED identifier.
> +
> +required:
> +  - compatible
> +  - reg
> +

Missing ref to spi periph schema. See other bindings.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        icled@1 {


Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

led-controller

> +            compatible = "we,131x000";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +            cs-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +
> +            led@0 {
> +                reg = <0>;
> +                color = <LED_COLOR_ID_RGB>;
> +                function = "error";

Use standard defines.

> +            };
> +
> +            led@1 {
> +                reg = <1>;
> +                color = <LED_COLOR_ID_RGB>;
> +                function = "warning";

Best regards,
Krzysztof


