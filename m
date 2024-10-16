Return-Path: <linux-leds+bounces-3110-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F17529A0298
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 09:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B2CD1F221BA
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 07:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8355318C039;
	Wed, 16 Oct 2024 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLiGzDdy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820B17C9FA;
	Wed, 16 Oct 2024 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063843; cv=none; b=nXCJ9oHwDC2nW+dhyr70Kuhm7RCEdE1M4cCVnfnSV5f4urUbUNvA12yMdEo0ULA2RajeeupSwkoJRcPHtupVFMxVIgiGayKtUa1WHeiBU1NjCkRoC7CvBJs76jv8HWth3ARFxcyTLfa1dnNIe8sb+jltSeOVB/ccCluzCIg7BXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063843; c=relaxed/simple;
	bh=2vkCcYGCQnE92NDuH25qfT6npSXZgVIwv76Lzb4O/VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlB6xRajOuEQfcZAJIE3A11J5SDwWoNeysb/cAATwZaf56Z1b8Jz4k1G+JeoSEYTvRhGd4MibUDEninXlqgMaIPIXbT0lX6wsbDrGpvMMUodpKgd4/h7B7tKVezXZofWt110sA5wfxPTRAATELziI7YHRu7dyokyUIs7b1qNaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLiGzDdy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E63C4CEC5;
	Wed, 16 Oct 2024 07:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729063842;
	bh=2vkCcYGCQnE92NDuH25qfT6npSXZgVIwv76Lzb4O/VM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLiGzDdyTnVfdnBzrEK5TR1U7Ju81XPhz6Fr2yicFSYRVT2IJPfjZUvX9c5vIldwd
	 n4PE4GAPtJJUMsNdenRTcRsEqOFvPjaI3+oSMbL1r0q+foGpCm/Xh1nrTU5bXqAepQ
	 r03i33yxWDtlSOclX4dfxbBXtuh8QN/1+9qlE15R3+4/8hrvhrL2WV5vJUB9G3kGGW
	 UjpTvc8tQsbAPLYd/69+Pv/KniXRJ8ru/+OdUpAdSa3c88rpPdMiJ+u+OA2IX+2njd
	 m0W93/L6feq3NEnXczpOXApFcHlhjUXISwzOLhaqcrCLgqslE5dZyJKx7DkVDZPsBO
	 T5iyKaVnFxBaw==
Date: Wed, 16 Oct 2024 09:30:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: patrick@stwcx.xyz, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nate Case <ncase@xes-inc.com>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: leds: pca955x: Convert text bindings to
 YAML
Message-ID: <yrnxc53ofxpgfrsilqib4zv5bboiinkvlep3hlfxgyhkcievpv@jwxfet2rqeel>
References: <20241016052941.416034-1-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241016052941.416034-1-Delphine_CC_Chiu@wiwynn.com>

On Wed, Oct 16, 2024 at 01:29:38PM +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> 
> Convert the text bindings of pca955x to YAML so it could be used to
> validate the DTS.
> 
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../devicetree/bindings/leds/leds-pca955x.txt |  89 ----------
>  .../devicetree/bindings/leds/nxp,pca955x.yaml | 161 ++++++++++++++++++
>  2 files changed, 161 insertions(+), 89 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/nxp,pca955x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
> deleted file mode 100644
> index 817f460f3a72..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-pca955x.txt
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -* NXP - pca955x LED driver
> -
> -The PCA955x family of chips are I2C LED blinkers whose pins not used
> -to control LEDs can be used as general purpose I/Os. The GPIO pins can
> -be input or output, and output pins can also be pulse-width controlled.
> -
> -Required properties:
> -- compatible : should be one of :
> -	"nxp,pca9550"
> -	"nxp,pca9551"
> -	"nxp,pca9552"
> -	"ibm,pca9552"
> -	"nxp,pca9553"
> -- #address-cells: must be 1
> -- #size-cells: must be 0
> -- reg: I2C slave address. depends on the model.
> -
> -Optional properties:
> -- gpio-controller: allows pins to be used as GPIOs.
> -- #gpio-cells: must be 2.
> -- gpio-line-names: define the names of the GPIO lines
> -
> -LED sub-node properties:
> -- reg : number of LED line.
> -		from 0 to  1 for the pca9550
> -		from 0 to  7 for the pca9551
> -		from 0 to 15 for the pca9552
> -		from 0 to  3 for the pca9553
> -- type: (optional) either
> -	PCA955X_TYPE_NONE
> -	PCA955X_TYPE_LED
> -	PCA955X_TYPE_GPIO
> -	see dt-bindings/leds/leds-pca955x.h (default to LED)
> -- label : (optional)
> -	see Documentation/devicetree/bindings/leds/common.txt
> -- linux,default-trigger : (optional)
> -	see Documentation/devicetree/bindings/leds/common.txt
> -
> -Examples:
> -
> -pca9552: pca9552@60 {
> -	compatible = "nxp,pca9552";
> -	#address-cells = <1>;
> -        #size-cells = <0>;
> -	reg = <0x60>;
> -
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	gpio-line-names = "GPIO12", "GPIO13", "GPIO14", "GPIO15";
> -
> -	gpio@12 {
> -		reg = <12>;
> -		type = <PCA955X_TYPE_GPIO>;
> -	};
> -	gpio@13 {
> -		reg = <13>;
> -		type = <PCA955X_TYPE_GPIO>;
> -	};
> -	gpio@14 {
> -		reg = <14>;
> -		type = <PCA955X_TYPE_GPIO>;
> -	};
> -	gpio@15 {
> -		reg = <15>;
> -		type = <PCA955X_TYPE_GPIO>;
> -	};
> -
> -	led@0 {
> -		label = "red:power";
> -		linux,default-trigger = "default-on";
> -		reg = <0>;
> -		type = <PCA955X_TYPE_LED>;
> -	};
> -	led@1 {
> -		label = "green:power";
> -		reg = <1>;
> -		type = <PCA955X_TYPE_LED>;
> -	};
> -	led@2 {
> -		label = "pca9552:yellow";
> -		reg = <2>;
> -		type = <PCA955X_TYPE_LED>;
> -	};
> -	led@3 {
> -		label = "pca9552:white";
> -		reg = <3>;
> -		type = <PCA955X_TYPE_LED>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca955x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca955x.yaml
> new file mode 100644
> index 000000000000..70f8c1dfa75a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca955x.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PCA955X LED controllers
> +
> +maintainers:
> +  - Nate Case <ncase@xes-inc.com>
> +
> +description: |
> +  The PCA955x family of chips are I2C LED blinkers whose pins not used
> +  to control LEDs can be used as general purpose I/Os. The GPIO pins can
> +  be input or output, and output pins can also be pulse-width controlled.
> +
> +  For more product information please see the link below:
> +  - https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pca9550
> +      - nxp,pca9551
> +      - nxp,pca9552
> +      - ibm,pca9552
> +      - nxp,pca9553
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
> +  gpio-controller: true
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 16
> +
> +  '#gpio-cells':

Keep consistent quotes: " or '

> +    const: 2
> +
> +patternProperties:
> +  "^led@[0-9a-f]+$":

max is 15 leds, so f, thus '+' is not needed. Same in other places.

> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0

drop minimum, but instead maxItems: 1


> +      type:
> +        description: |
> +          Output configuration, see include/dt-bindings/leds/leds-pca955x.h
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 0
> +        minimum: 0
> +        maximum: 4

I see defines up to 2, not 4. Any changes in binding should be explained
in commit msg.


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
> +              - nxp,pca9550
> +    then:
> +      patternProperties:
> +        "^led@[0-9a-f]+$":
> +          properties:
> +            reg:
> +              maximum: 1
> +    else:
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - nxp,pca9551
> +      then:
> +        patternProperties:
> +          "^led@[0-9a-f]+$":
> +            properties:
> +              reg:
> +                maximum: 7
> +      else:
> +        if:
> +          properties:
> +            compatible:
> +              contains:
> +                enum:
> +                  - nxp,pca9552
> +                  - ibm,pca9552
> +        then:
> +          patternProperties:
> +            "^led@[0-9a-f]+$":
> +              properties:
> +                reg:
> +                  maximum: 15
> +        else:
> +          if:

Do not nest else:if. It's not manageable. See other bindings...

> +            properties:
> +              compatible:
> +                contains:
> +                  enum:
> +                    - nxp,pca9553
> +          then:
> +            patternProperties:
> +              "^led@[0-9a-f]+$":
> +                properties:
> +                  reg:
> +                    maximum: 3
> +
> +additionalProperties: false

Best regards,
Krzysztof


