Return-Path: <linux-leds+bounces-8021-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHhxNnyZ+2ladAMAu9opvQ
	(envelope-from <linux-leds+bounces-8021-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 21:41:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E14DFE4D
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 21:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83E3F30285FE
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2026 19:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642B833BBCC;
	Wed,  6 May 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="th61Hgek"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40597324B20;
	Wed,  6 May 2026 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096487; cv=none; b=VqoKG9cIySuPYET2JiSLfjX0F3m95pk5/4zLLWhuBbxt88G4LUW9LauvsrNdaY9pXdSbkwRNm6QwwgBhfE1RsCHZduz/Nr5WdgJwq3vZ3gfA8mbRcXNkmm1oQTPEyAcmH+/WDovGdzYppMFcmU/3bw1/IQpEXBXuB4Tme2oanIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096487; c=relaxed/simple;
	bh=gXRr6lAZn+gVP394eWYXPsoINcpu8BvTOzJSJtlNi+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCz5UvTStUwaAmGW7HUVYCxyLnYh9hrNSJM4KIxOCHdP1JxzhIqEHbP2rAO90CYoHS3IEwW6yP1/xdkFbJ/n5Zmo1rVVcZqBQlmONnrVD57GwA900BjNpGPdnDhYRFhYfzVe/LRHj7vde1cunTfT6vlFGMrHc96BcOX40ft5Ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=th61Hgek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEDDC2BCB8;
	Wed,  6 May 2026 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778096486;
	bh=gXRr6lAZn+gVP394eWYXPsoINcpu8BvTOzJSJtlNi+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=th61HgekDnu5/846JNWjp1oCtNdtamK7cdktg0iIdrFqiqCuEIQaE/jMg/Gc2Xgq2
	 Y9k0BTXuWbXECDDxmXt6xStm/SaneHZf7i4bq79EbsrUDE0pebOPR0KGbTcWqnUmKL
	 R0esikW+dmcpySidJFyHejvgVU8KEBFMeegdliT9sRIxDuc4wa1libmPHvB6b7OuJU
	 FumDM5CrCIAa07W3KXcEPJaA+Yt0wyZfNul4ISPNJTsxyc+n7qCqmiQ2WAVFi0+2ia
	 3Y41JeTQIsSwx5ttE0DJ3VdPv9/Vdq/SaiVKVEGXWIqEq3tCAKoGiPkZ6HiTaEIfqf
	 6UCJtXNq7uNCw==
Date: Wed, 6 May 2026 14:41:24 -0500
From: Rob Herring <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org
Subject: Re: [PATCH v3 1/5] dt-bindings: leds: is31fl32xx: convert the
 binding to yaml
Message-ID: <20260506194124.GA2989390-robh@kernel.org>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
 <20260429154449.730880-2-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429154449.730880-2-jerrysteve1101@gmail.com>
X-Rspamd-Queue-Id: 5E9E14DFE4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	TAGGED_FROM(0.00)[bounces-8021-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 11:44:45PM +0800, Jun Yan wrote:
> Convert leds-is31fl32xx to DT schema format.
> 
> Co-developed-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/leds/issl,is31fl32xx.yaml        | 163 ++++++++++++++++++
>  .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
>  2 files changed, 163 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
> new file mode 100644
> index 000000000000..cb4741dee12e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/issl,is31fl32xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IS31FL32xx and Si-En SN32xx LED controller
> +
> +maintainers:
> +  - Lucca Fachinetti <luccafachinetti@gmail.com>
> +  - Pavel Machek <pavel@ucw.cz>
> +  - Jun Yan <jerrysteve1101@gmail.com>
> +
> +description: |
> +  The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
> +  constant-current channels, each with independent 256-level PWM control.
> +  Each LED is represented as a sub-node of the device.
> +
> +  For more product information please see the links below:
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - issi,is31fl3216
> +      - issi,is31fl3218
> +      - issi,is31fl3235
> +      - issi,is31fl3236
> +      - issi,is31fl3293
> +      - si-en,sn3216
> +      - si-en,sn3218
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@([1-9])+$":

Unit-addresses are hex.

> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          LED channel number (1..N)
> +        minimum: 1
> +        maximum: 36
> +
> +    required:
> +      - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - issi,is31fl3293
> +    then:
> +      patternProperties:
> +        "^led@([1-9])+$":

No need to repeat the unit-address pattern here. Just "^led@".

> +          properties:
> +            reg:
> +              maximum: 3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - issi,is31fl3216
> +              - si-en,sn3216
> +    then:
> +      patternProperties:
> +        "^led@([1-9])+$":
> +          properties:
> +            reg:
> +              maximum: 16
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - issi,is31fl3218
> +              - si-en,sn3218
> +    then:
> +      patternProperties:
> +        "^led@([1-9])+$":
> +          properties:
> +            reg:
> +              maximum: 18
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - issi,is31fl3235
> +    then:
> +      patternProperties:
> +        "^led@([1-9])+$":
> +          properties:
> +            reg:
> +              maximum: 28
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - issi,is31fl3236
> +    then:
> +      patternProperties:
> +        "^led@([1-9])+$":
> +          properties:
> +            reg:
> +              maximum: 36

That's the default max, so you can drop this if/then.

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
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
> +        led-controller@3c {
> +            compatible = "issi,is31fl3236";
> +            reg = <0x3c>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            led@1 {
> +                reg = <1>;
> +                color = <LED_COLOR_ID_RED>;
> +                function = LED_FUNCTION_STATUS;
> +            };
> +
> +            led@5 {
> +                reg = <5>;
> +                color = <LED_COLOR_ID_GREEN>;
> +                function = LED_FUNCTION_POWER;
> +                linux,default-trigger = "default-on";
> +            };
> +        };
> +    };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> deleted file mode 100644
> index 7082ed186dd9..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
> -
> -The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
> -constant-current channels, each with independent 256-level PWM control.
> -Each LED is represented as a sub-node of the device.
> -
> -Required properties:
> -- compatible: one of
> -	issi,is31fl3236
> -	issi,is31fl3235
> -	issi,is31fl3218
> -	issi,is31fl3216
> -	issi,is31fl3293
> -	si-en,sn3218
> -	si-en,sn3216
> -- reg: I2C slave address
> -- address-cells : must be 1
> -- size-cells : must be 0
> -
> -LED sub-node properties:
> -- reg : LED channel number (1..N)
> -- label :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -- linux,default-trigger :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -
> -
> -Example:
> -
> -is31fl3236: led-controller@3c {
> -	compatible = "issi,is31fl3236";
> -	reg = <0x3c>;
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -
> -	led@1 {
> -		reg = <1>;
> -		label = "EB:blue:usr0";
> -	};
> -	led@2 {
> -		reg = <2>;
> -		label = "EB:blue:usr1";
> -	};
> -	...
> -	led@36 {
> -		reg = <36>;
> -		label = "EB:blue:usr35";
> -	};
> -};
> -
> -For more product information please see the links below:
> -http://www.issi.com/US/product-analog-fxled-driver.shtml
> -http://www.si-en.com/product.asp?parentid=890
> -- 
> 2.53.0
> 

