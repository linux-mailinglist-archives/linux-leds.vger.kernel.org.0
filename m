Return-Path: <linux-leds+bounces-5880-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F5BC0A8B4
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 14:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B5093ACACA
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 13:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28961991C9;
	Sun, 26 Oct 2025 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1MXHRQJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493229408;
	Sun, 26 Oct 2025 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761486485; cv=none; b=G5HNtlrqjiYFso5SNzLLe2GnLirAyKE+aFJ5UJ+CVZJB9sD7pkP0x/cVSPJ14Bi2ipb/JxxJtyJfTrYssG4osgVHV95269YmvMxkcmHUOd6biEmBsYF1X65upBR7lXL51pefUzltRKGKPd2U7kqyvhws+TJRHLA9sytuA84+2vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761486485; c=relaxed/simple;
	bh=QxwFEGcFdqak6PqJdPwRvuA7i8QFC3oJHkPgIhhgBTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pi2IqJdRIULsD8Mckb07LEf/OorZq0E+RCNuMeHhVahfaZS4uZBuNR9oACtaV9dgQa8AXIULoLAeEpHj6jaOwSXeKHIPpWIx+/4Mw/uADXfN2gOoMxGDWy8d0VVbDZEu+95WVMl8xmK4/AynizgcKmXyconfB6G0hBPz8mYBZ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1MXHRQJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F40C4CEE7;
	Sun, 26 Oct 2025 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761486484;
	bh=QxwFEGcFdqak6PqJdPwRvuA7i8QFC3oJHkPgIhhgBTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C1MXHRQJEVTicVDnSU1cDUl02GuDH4SM9rQA7xRPQ9+gz3LjG1Ny6Xf9oCgncX+FA
	 nEw3M4RCcqxXSVLxxsU8x9J3djbru7GKIQvkC9hO2YiT2N7SiPXyXerPOoJBCa1+mM
	 D2DYrlDPwoLyMU80vnSSSwWWkW649QmrWMPw+HLpc6HDxZSB71yjtgboJmPRSEMpQY
	 Qrgfb36UE71EMcPxsVyLtgAI1HctKOMlrwrwHJhAOXFt9Q+vN9BZSZC55NPpzy65/0
	 D7JckiZDbr+1iY9MIS6yzw7NaYoemTKxC9FkI3Jx13E65OTtPPH6Q2NUluITr8iWAg
	 RTuWaZ4vGlUgg==
Message-ID: <c17c10d4-cc1f-46fd-8719-e7bb9ffa91ba@kernel.org>
Date: Sun, 26 Oct 2025 14:47:59 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
To: Junjie Cao <caojunjie650@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-2-caojunjie650@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251026123923.1531727-2-caojunjie650@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2025 13:39, Junjie Cao wrote:
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
> +  awinic,dim-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Select dimming mode of the device.
> +        0 = Bypass mode.
> +        1 = DC mode.
> +        2 = MIX mode.
> +        3 = MIX-26k.
> +    enum: [0, 1, 2, 3]
> +    default: 1
> +
> +  awinic,sw-freq:

Please use proper units, see:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
and other examples

Same everywhere else.


> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Boost switching frequency in kHz.
> +    enum: [300, 400, 500, 600, 660, 750, 850, 1000, 1200, 1330, 1500, 1700]
> +    default: 750
> +
> +  awinic,sw-ilmt:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Switching current limitation in mA.
> +    enum: [1500, 2000, 2500, 3000]
> +    default: 3000
> +
> +  awinic,iled-max:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Maximum LED current setting in uA.
> +    minimum: 5000
> +    maximum: 50000
> +    multipleOf: 500
> +    default: 20000
> +
> +  awinic,uvlo-thres:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: UVLO(Under Voltage Lock Out) in mV.
> +    enum: [2200, 5000]
> +    default: 2200
> +
> +  awinic,fade-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Fade In/Out Time(per step) in us.
> +    enum: [8, 16, 32, 64, 128, 256, 512, 1024]

Why would this be fixed setting? This really looks like runtime, drop.

> +    default: 16
> +
> +  awinic,slope-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Slope time in ms.

Slope of what?

> +    enum: [8, 24, 48, 96, 200, 300, 400, 500]
> +    default: 300
> +
> +  awinic,ramp-ctl:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Select ramp control and filter of the device.
> +        0 = Fade in/fade out.
> +        1 = Light filter.
> +        2 = Medium filter.
> +        3 = Heavy filter.
> +    enum: [0, 1, 2, 3]
> +    default: 2
> +
> +  awinic,brt-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Select brightness control of the device.
> +        0 = PWM.
> +        1 = IIC.
> +        2 = IIC x PWM.
> +        3 = IIC x PWM(P-ramp).
> +    enum: [0, 1, 2, 3]
> +    default: 1
> +
> +  awinic,onoff-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Turn on/off time(per step) in ns.
> +    enum: [250, 500, 1000, 2000, 4000, 8000, 16000]

Not a DT property.

> +    default: 2000
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        aw99706@76 {
> +            compatible = "awinic,aw99706";
> +            reg = <0x76>;
> +            enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;

Where are other properties from common.yaml? Looks like you re-invented
some parts.



Best regards,
Krzysztof

