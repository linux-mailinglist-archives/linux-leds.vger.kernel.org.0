Return-Path: <linux-leds+bounces-3548-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06C9E98E1
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 15:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B54C9280F4D
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 14:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6FE1B425D;
	Mon,  9 Dec 2024 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eoeWFOHb"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F231B4239;
	Mon,  9 Dec 2024 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754553; cv=none; b=nrOEsgi+08sUa1vfb8rNHyIDS/AihqSIkhUwgzpmcYqbKYAxN8+dK1ZN5kPL6VwbDWfeeG2wUxTsnz+r6lRxct+hSEywULD1uGS2nMR6s3WZ5duJjAGBXcS/tKj7VfVQ/pzIp4SyyiXVAcHZnpq+GyY2RDyB2jrl2Ih+sBsN73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754553; c=relaxed/simple;
	bh=P4eAc7QnnuIdOPiRR3fXjKQOETMWijY5/6m0h0zbD1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G+LMbuWT+cHnRinnf52HbXjVPXHZp8xIYPNtXooP4Npr5a0KdOewzaBUvP0c4C6bjkuTLz826umGex9N+HfGC0++eniZe7a95pYmEIWdzKwCeZlcNCBF/sDVqcgY0TGxmvpRtCfpOlc9bIpYFhYHaEmE6VVBYJieN4hnhAosGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eoeWFOHb; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9ET1de2520973
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Dec 2024 08:29:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733754541;
	bh=tc9SG8RUke5s1hZOp/gwDQS42RmGeAz1F1nntsZF8Cw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eoeWFOHbv3LIBaQRitgicEkE8EPBWIWc1xc8j+ikgX21cmMYPM2ngYARTJLRbhxrl
	 5sUhzmDuvFzt9n6zsq1n4yn3ejXZBx+VdJhNDliFPM8O98Gk6ipVyzHVE1GaqaQWjm
	 VCbNAjD0ZCQBXmlaONLucnn0fyMSApY6nCVK3LI4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9ET1pV079241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Dec 2024 08:29:01 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 08:29:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 08:29:01 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9ET0d6044340;
	Mon, 9 Dec 2024 08:29:00 -0600
Message-ID: <de6039a6-b7e6-4960-afcc-5f0d29fb27a8@ti.com>
Date: Mon, 9 Dec 2024 08:29:00 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: leds: Convert LP8860 into YAML format
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20241206203103.1122459-1-alexander.sverdlin@siemens.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241206203103.1122459-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/6/24 2:31 PM, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Convert Texas Instruments' LP8860 LED driver bindings into YAML format.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> The patch is now separated from the LP8864 series:
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241206170717.1090206-2-alexander.sverdlin@siemens.com/
> 
>   .../devicetree/bindings/leds/leds-lp8860.txt  | 50 ----------
>   .../devicetree/bindings/leds/ti,lp8860.yaml   | 95 +++++++++++++++++++
>   2 files changed, 95 insertions(+), 50 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt
>   create mode 100644 Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> deleted file mode 100644
> index 8bb25749a3da3..0000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -* Texas Instruments - lp8860 4-Channel LED Driver
> -
> -The LP8860-Q1 is an high-efficiency LED
> -driver with boost controller. It has 4 high-precision
> -current sinks that can be controlled by a PWM input
> -signal, a SPI/I2C master, or both.
> -
> -Required properties:
> -	- compatible :
> -		"ti,lp8860"
> -	- reg : I2C slave address
> -	- #address-cells : 1
> -	- #size-cells : 0
> -
> -Optional properties:
> -	- enable-gpios : gpio pin to enable (active high)/disable the device.
> -	- vled-supply : LED supply
> -
> -Required child properties:
> -	- reg : 0
> -
> -Optional child properties:
> -	- function : see Documentation/devicetree/bindings/leds/common.txt
> -	- color : see Documentation/devicetree/bindings/leds/common.txt
> -	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
> -	- linux,default-trigger :
> -	   see Documentation/devicetree/bindings/leds/common.txt
> -
> -Example:
> -
> -#include <dt-bindings/leds/common.h>
> -
> -led-controller@2d {
> -	compatible = "ti,lp8860";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	reg = <0x2d>;
> -	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> -	vled-supply = <&vbatt>;
> -
> -	led@0 {
> -		reg = <0>;
> -		function = LED_FUNCTION_BACKLIGHT;
> -		color = <LED_COLOR_ID_WHITE>;
> -		linux,default-trigger = "backlight";
> -	};
> -}
> -
> -For more product information please see the link below:
> -https://www.ti.com/product/lp8860-q1
> diff --git a/Documentation/devicetree/bindings/leds/ti,lp8860.yaml b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> new file mode 100644
> index 0000000000000..62f133006fd0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lp8860.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments - lp8860 4-Channel LED Driver
> +
> +maintainers:
> +  - Andrew Davis <afd@ti.com>
> +
> +description: |
> +  The LP8860-Q1 is an high-efficiency LED driver with boost controller.
> +  It has 4 high-precision current sinks that can be controlled by a PWM input
> +  signal, a SPI/I2C master, or both.
> +
> +  For more product information please see the link below:
> +    https://www.ti.com/product/lp8860-q1
> +
> +properties:
> +  compatible:
> +    const: ti,lp8860
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C slave address
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO pin to enable (active high) / disable the device
> +
> +  vled-supply:
> +    description: LED supply
> +
> +patternProperties:
> +  "^led@[0]$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          Index of the LED.
> +        const: 0
> +
> +      function: true
> +      color: true
> +      label: true
> +      linux,default-trigger: true
> +
> +    required:
> +      - reg
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
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@2d {
> +            compatible = "ti,lp8860";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0x2d>;
> +            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +            vled-supply = <&vbatt>;
> +
> +            led@0 {

So same comment I made in the pre-public review, lets see what the DT
folks think:

I don't think we want to have the "@0" node naming. It forces us to
add the "reg =" below, and that then forces us to add the #*-cells above.
All this to work around not just calling the node "led-0". The driver
doesn't care either way, and there are no in-tree users of the old way,
so now should be a safe time to fix this while converting the binding.

Andrew

> +                reg = <0>;
> +                function = LED_FUNCTION_BACKLIGHT;
> +                color = <LED_COLOR_ID_WHITE>;
> +                linux,default-trigger = "backlight";
> +            };
> +        };
> +    };
> +
> +...

