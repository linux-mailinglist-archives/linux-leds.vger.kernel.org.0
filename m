Return-Path: <linux-leds+bounces-5483-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0207B51B1C
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 17:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553953AE8A7
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 15:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5844A23E355;
	Wed, 10 Sep 2025 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opz+Ac1a"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56B329F21;
	Wed, 10 Sep 2025 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516730; cv=none; b=bnr6dxMIYQon0OJqbYMFpVLv3lRzM55C+AwfnGN3pQJBkA5Skf09EXbHycqawhiW9SZtpq/ScqVHNDpGPolH8hvCh0edBU1edYrD8pvRL4IL4kU7PnL0fdCRHTprBZV0GAy/ZUhZ9eovLnSAbxwJDJqoMqbcSKpHiszqwJIPsU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516730; c=relaxed/simple;
	bh=Jy9QNB52XR6hS3A2FDoP6tUYvbRB0ENiuehcstyLthQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y71qOYLYIVBLcEVPxtdxK510fAltYp/DsXjMOUu5KT/vkYVc9FqCPqYe6KCyjwMEIDdr59o7DFpyu3EMgBBoT6PNdZUABQuGuEC3/P8ci0lZ3XPhr/JXsTuKosdxwCwAf1DZQ0lga+FKhY0Y+hk29bkkuboKiqdr3HvlbjZ4KkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opz+Ac1a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82964C4CEEB;
	Wed, 10 Sep 2025 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757516728;
	bh=Jy9QNB52XR6hS3A2FDoP6tUYvbRB0ENiuehcstyLthQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=opz+Ac1ab593W7VTuHtAQfinpRyxFM6oSX88PeCJVQ3GdPoUkl+HkN7phJ8lCwgOa
	 WWzYwjriG6fLwKbIEHfHGkVbR3IkSPF4ps75HixAkwy8Z9xrebkWTLpDiqo9Akn9bN
	 XOoCoEnoD3moygzmJa1/3w9JxAKi4OeMNcpocezFBTvxxdGUbpRnNEsPXiituwV/gg
	 9960oKuIVvnrb0o2Swz+tIkhYJs7zbqEnaLTXtOzj5RkSARltEtD4nPQzziL5berJE
	 499vjPrdqKVKEoW2W4YT64pshcHZ0GbPMYz78iKV41QPrcYLG702FdzaONiXfilU79
	 oogll5GkGI+yw==
Date: Wed, 10 Sep 2025 10:05:27 -0500
From: Rob Herring <robh@kernel.org>
To: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: as3645: Convert to DT schema
Message-ID: <20250910150527.GA54174-robh@kernel.org>
References: <20250909-ams-txt-to-dt-schema-v1-1-8a30c25c8295@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-ams-txt-to-dt-schema-v1-1-8a30c25c8295@thegoodpenguin.co.uk>

On Tue, Sep 09, 2025 at 09:50:04AM +0100, Harrison Carter wrote:
> Convert the ams,as3645a.txt to DT Schema format.
> 
> maintainer: set to what I found in MAINTAINERS
> 
> Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
> ---
>  .../devicetree/bindings/leds/ams,as3645a.txt       |  85 --------------
>  .../devicetree/bindings/leds/ams,as3645a.yaml      | 130 +++++++++++++++++++++
>  2 files changed, 130 insertions(+), 85 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> deleted file mode 100644
> index 4af2987b25e92394ebd46456e30002d3ae3a6101..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -Analog devices AS3645A device tree bindings
> -
> -The AS3645A flash LED controller can drive two LEDs, one high current
> -flash LED and one indicator LED. The high current flash LED can be
> -used in torch mode as well.
> -
> -Ranges below noted as [a, b] are closed ranges between a and b, i.e. a
> -and b are included in the range.
> -
> -Please also see common.txt in the same directory.
> -
> -
> -Required properties
> -===================
> -
> -compatible	: Must be "ams,as3645a".
> -reg		: The I2C address of the device. Typically 0x30.
> -#address-cells	: 1
> -#size-cells	: 0
> -
> -
> -Required properties of the flash child node (0)
> -===============================================
> -
> -reg: 0
> -flash-timeout-us: Flash timeout in microseconds. The value must be in
> -		  the range [100000, 850000] and divisible by 50000.
> -flash-max-microamp: Maximum flash current in microamperes. Has to be
> -		    in the range between [200000, 500000] and
> -		    divisible by 20000.
> -led-max-microamp: Maximum torch (assist) current in microamperes. The
> -		  value must be in the range between [20000, 160000] and
> -		  divisible by 20000.
> -ams,input-max-microamp: Maximum flash controller input current. The
> -			value must be in the range [1250000, 2000000]
> -			and divisible by 50000.
> -
> -
> -Optional properties of the flash child node
> -===========================================
> -
> -function	:  See Documentation/devicetree/bindings/leds/common.txt.
> -color		:  See Documentation/devicetree/bindings/leds/common.txt.
> -label		:  See Documentation/devicetree/bindings/leds/common.txt (deprecated).
> -
> -
> -Required properties of the indicator child node (1)
> -===================================================
> -
> -reg: 1
> -led-max-microamp: Maximum indicator current. The allowed values are
> -		  2500, 5000, 7500 and 10000.
> -
> -Optional properties of the indicator child node
> -===============================================
> -
> -function	:  See Documentation/devicetree/bindings/leds/common.txt.
> -color		:  See Documentation/devicetree/bindings/leds/common.txt.
> -label		:  See Documentation/devicetree/bindings/leds/common.txt (deprecated).
> -
> -
> -Example
> -=======
> -
> -#include <dt-bindings/leds/common.h>
> -
> -	as3645a@30 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		reg = <0x30>;
> -		compatible = "ams,as3645a";
> -		led@0 {
> -			reg = <0x0>;
> -			flash-timeout-us = <150000>;
> -			flash-max-microamp = <320000>;
> -			led-max-microamp = <60000>;
> -			ams,input-max-microamp = <1750000>;
> -			function = LED_FUNCTION_FLASH;
> -		};
> -		led@1 {
> -			reg = <0x1>;
> -			led-max-microamp = <10000>;
> -			function = LED_FUNCTION_INDICATOR;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.yaml b/Documentation/devicetree/bindings/leds/ams,as3645a.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f956c20cc8fb379f370ad785a3d75f27d0cfa032
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ams,as3645a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AS3645A LED Controller
> +
> +maintainers:
> +  - Sakari Ailus <sakari.ailus@iki.fi>
> +
> +description: |

Don't need '|'.

> +  The AS3645A flash LED controller can drive two LEDs, one high current
> +  flash LED and one indicator LED. The high current flash LED can be
> +  used in torch mode as well.
> +
> +properties:
> +  compatible:
> +    const: ams,as3645a
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  led@0:
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      flash-timeout-us:
> +        minimum: 100000
> +        maximum: 850000

	   multipleOf: 50000

> +        description: |
> +          Flash timeout in microseconds. Must be divisible by 50000

Drop description. 

> +
> +      flash-max-microamp:
> +        minimum: 200000
> +        maximum: 500000
> +        description: |
> +          Maximum flash current in microamperes. Must be divisible by 20000
> +
> +      led-max-microamp:
> +        minimum: 20000
> +        maximum: 160000
> +        description: |
> +          Maximum torch (assist) current in microamperes Must be divisible by 20000

Same on these 2.

> +
> +      ams,input-max-microamp:
> +        minimum: 1250000
> +        maximum: 2000000
> +        description: |

Don't need '|'.

> +          Maximum flash controller input current. Must be divisible by 50000
> +
> +    required:
> +      - reg
> +      - flash-timeout-us
> +      - flash-max-microamp
> +      - led-max-microamp
> +      - ams,input-max-microamp
> +
> +  led@1:
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 1
> +
> +      led-max-microamp:
> +        enum:
> +          - 2500
> +          - 5000
> +          - 7500
> +          - 10000
> +        description: |
> +          Maximum indicator current. The allowed values are 2500, 5000, 7500 and 10000.

No need to repeat constraints in free-form text. Drop the description 
here, but I would add description under the nodes to say they are for 
flash and indicator.

> +
> +    required:
> +      - reg
> +      - led-max-microamp
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#size-cells"
> +  - "#address-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c{
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        as3645a@30 {

led-controller@30

> +            compatible = "ams,as3645a";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0x30>;
> +
> +            led@0 {
> +                reg = <0>;
> +                flash-timeout-us = <150000>;
> +                flash-max-microamp = <320000>;
> +                led-max-microamp = <60000>;
> +                ams,input-max-microamp = <1750000>;
> +                function = LED_FUNCTION_FLASH;
> +            };
> +
> +            led@1 {
> +                reg = <1>;
> +                led-max-microamp = <10000>;
> +                function = LED_FUNCTION_INDICATOR;
> +            };
> +        };
> +    };
> +...
> 
> ---
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> change-id: 20250906-ams-txt-to-dt-schema-a821e0e03c46
> 
> Best regards,
> -- 
> Harrison Carter <hcarter@thegoodpenguin.co.uk>
> 

