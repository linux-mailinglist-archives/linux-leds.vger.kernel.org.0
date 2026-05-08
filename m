Return-Path: <linux-leds+bounces-8053-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C8iBzjs/WlJkwAAu9opvQ
	(envelope-from <linux-leds+bounces-8053-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:59:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F44F77B9
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73F6730082BD
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 13:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7B43E1CF6;
	Fri,  8 May 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPX+KzVj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B403D646C;
	Fri,  8 May 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248639; cv=none; b=KEBNNqcMF4Th1fi8DVo3lflfWnKBps1tNlKNphHA0uaPzLsut9168FCTDS7inMmTcQsZll01DyyxQoDFUgbsDJP9UptPEYYNYBNxNPwfrZcKUQODiw0Yhhf8lyhn18EGL8ZF5YjCACd1rJ69PGe6iw95dpc/FeKSh2EHU6sHtWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248639; c=relaxed/simple;
	bh=joxHu0FV93uMH4e5Bzp95xJasxmA6c6AdKqcG4gkwzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ks8HHVdCKnnEPYEv/pxWrtC9lKyj9Aago6unNrqUPmi2qLslvWbmBvT3T8PX/amoq7j4k1ukC5DgT2hMKOBrBdsgAeqkZoU//YZqBTeCSaOGamibk2VVL6aKEGnbHFqZ/ICLBkGNG9060ph+oOpBamuXUig0wS1QYuLYLaNQWq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPX+KzVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2480EC2BCB0;
	Fri,  8 May 2026 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778248639;
	bh=joxHu0FV93uMH4e5Bzp95xJasxmA6c6AdKqcG4gkwzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPX+KzVjKN7TpD/u+aWdy9CusQ8pgFvnnbhRa0I58SpmdbG9N6oNgSQNa/NgODTc+
	 bWQflHKuVJVI3GsQDQq4HKGQHm3q4bAWpEnwxBUxbpXlBCpqDGvNQBHzUa8RcmoHCm
	 t0tvyQtYhscMLbmKo8JQNhiYmPKFQkWwDmR1DUIbr4DC7tdj3/3ArVTfkUMPOPJJ6i
	 IBodOT59LbmQ9pQSxpwPGuTD130TCfLisZMyfBkkOgsn4S0JD6YQeAHFlGBBvGyVYi
	 qMQ+fAUcdvMXP+Ap7pDsLScArk4JIWZoD0/HUh+uC6AFyurH9Ejm4Wh6ul0JXVZyOK
	 179MyEIkMbQAA==
Date: Fri, 8 May 2026 08:57:17 -0500
From: Rob Herring <robh@kernel.org>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Message-ID: <20260508135717.GA1218557-robh@kernel.org>
References: <20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com>
 <20260508-ltc3220-driver-v7-1-0f092ba54f23@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-ltc3220-driver-v7-1-0f092ba54f23@analog.com>
X-Rspamd-Queue-Id: 861F44F77B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8053-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.1:email,analog.com:email,analog.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,1c:email,0.0.0.3:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:09:49PM +0800, Edelweise Escala wrote:
> LTC3220 is a multi-display LED driver with I2C interface.
> The LTC3220 provides individual brightness control (64-step),
> blinking, and gradation features for up to 18 LED outputs.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> ---
>  .../devicetree/bindings/leds/adi,ltc3220.yaml      | 120 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> new file mode 100644
> index 000000000000..62f760d517aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/adi,ltc3220.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC3220 LED Driver
> +
> +maintainers:
> +  - Edelweise Escala <edelweise.escala@analog.com>
> +
> +description:

You need a '>' to maintain paragraphs.

> +  The LTC3220 is a multi-display LED driver, which contains a high-efficiency,
> +  low-noise charge pump to provide power to up to 18 LED current sources.
> +  The LEDs are individually configurable to 64-step linear brightness control,
> +  blinking and gradation control via 2-wire I2C interface.
> +
> +  For more product information please see the link below
> +    https://www.analog.com/en/products/ltc3220.html
> +
> +properties:
> +  compatible:
> +    const: adi,ltc3220
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
> +  reset-gpios:
> +    maxItems: 1
> +
> +patternProperties:
> +  '^led@([1-9]|1[0-8])$':

Unit-addresses are hex.

> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description:
> +          Output channel for the LED (1-18 maps to LED outputs D1-D18).
> +          For aggregated LED control, define only one LED node with reg = <1>
> +          and use led-sources to list all controlled outputs. Only reg 1 should
> +          be present when using led-sources.
> +        minimum: 1
> +        maximum: 18
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Independent LEDs
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@1c {
> +            compatible = "adi,ltc3220";
> +            reg = <0x1c>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
> +
> +            led@1 {
> +                reg = <1>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <1>;
> +            };
> +
> +            led@2 {
> +                reg = <2>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <2>;
> +            };
> +
> +            led@3 {
> +                reg = <3>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <3>;
> +            };
> +        };
> +    };
> +
> +  - |
> +    // Aggregated LED
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@1c {
> +            compatible = "adi,ltc3220";
> +            reg = <0x1c>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            led@1 {
> +                reg = <1>;
> +                led-sources = <1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18>;
> +                function = LED_FUNCTION_BACKLIGHT;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 327d74ca7ecb..5c10cc3e3022 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14955,6 +14955,13 @@ W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
>  F:	drivers/iio/temperature/ltc2983.c
>  
> +LTC3220 LED DRIVER
> +M:	Edelweise Escala <edelweise.escala@analog.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> +
>  LTC4282 HARDWARE MONITOR DRIVER
>  M:	Nuno Sa <nuno.sa@analog.com>
>  L:	linux-hwmon@vger.kernel.org
> 
> -- 
> 2.43.0
> 

