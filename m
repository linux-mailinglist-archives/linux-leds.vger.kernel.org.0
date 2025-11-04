Return-Path: <linux-leds+bounces-5972-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC13C2F9F0
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 08:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 74DAE4EA16E
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 07:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA78730749E;
	Tue,  4 Nov 2025 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/H7G7Nj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75768307492;
	Tue,  4 Nov 2025 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241439; cv=none; b=c0uMDCSMk3cEhc+5zHzmLbSbpWbL30FNo3bTYI1YbWOros6vTSnNeDYiSjvnGVT/hvyi5H3MXkADIaQHfF3kJpbYgqvmzjnzMUDgrEHQrKqkHbQdW7iz3kZiDAO1hXbgVK0TH54eNIaw64m9oU/YsSx/O3vIziV481GokK85s4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241439; c=relaxed/simple;
	bh=FYc4ZiYYxtHCsGxHWLiNUb6waNPfZYfSpHrij9pfVEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWVklON0dN1YlYkuqd1vePH9gfJyuO88DtoobbicGQ3WU++kag5Uh3KjBN4mCHLaVD3Q/7HsqReR9mN4hXXii09kFmQv5mlYPbUH/s30VpMKznfr0+AZhtYp1Fys1Ys2Ps9xsOVLMvylHY37uU9ASkUAPfo1Pxvmj/gjn98WI3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/H7G7Nj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70578C4CEF8;
	Tue,  4 Nov 2025 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762241439;
	bh=FYc4ZiYYxtHCsGxHWLiNUb6waNPfZYfSpHrij9pfVEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/H7G7NjSKeDBXViihoB12JOvfdrQyfO9//RG4Fm2gg9EbHG9idT0lmSQh5ADXkJo
	 2y2zORuy9FCw8haXVlB7XLXPsqFC+xITKnIYzQTMSikav0oNeKdSJjFSujtKm4q1lL
	 0xoKs2ga1cRQyLAYt+mIQKmrZg6Dhval/huZyZtp8CMWyhLkxTNqGPhNo+77GuHEyf
	 A29e8eRMzwJIXwjLufiRFlb7qwNB6RPHp1B2vIFHajr0bGu//2gXPfs6D30bLnJkKK
	 qEH5wZxi8dLqknBz9ixCq1FyTjtO77PQenNM1Ly48x5YqxHvVB2iNep6aCvLjNG8TO
	 NQlvC3isX123g==
Date: Tue, 4 Nov 2025 08:30:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Message-ID: <20251104-dancing-panda-of-patience-49bcc7@kuoka>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-2-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103110648.878325-2-caojunjie650@gmail.com>

On Mon, Nov 03, 2025 at 07:06:47PM +0800, Junjie Cao wrote:
> From: Pengyu Luo <mitltlatltl@gmail.com>
> 
> Add Awinic AW99706 backlight binding documentation.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>

Messed DCO chain. This wasn't here, so you must have altered v1 to add
some weird change.

This is a blocker, please read carefully submitting patches and DCO.

> ---
> Changes in v2:
> - use proper units for properties (Krzysztof)
> - drop non-fixed properties (Krzysztof)
> - add properties(max-brightness, default-brightness) (Krzysztof)
> - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com

...

> +  awinic,dim-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Select dimming mode of the device.
> +        0 = Bypass mode.
> +        1 = DC mode.
> +        2 = MIX mode(PWM at low brightness and DC at high brightness).
> +        3 = MIX-26k mode(MIX mode with different PWM frequency).
> +    enum: [ 0, 1, 2, 3 ]
> +    default: 1
> +
> +  awinic,sw-freq-hz:
> +    description: Boost switching frequency in Hz.
> +    enum: [ 300000, 400000, 500000, 600000, 660000, 750000, 850000, 1000000, 1200000, 1330000, 1500000, 1700000 ]

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).

> +    default: 750000
> +
> +  awinic,sw-ilmt-microamp:
> +    description: Switching current limitation in uA.
> +    enum: [ 1500000, 2000000, 2500000, 3000000 ]
> +    default: 3000000
> +
> +  awinic,iled-max-microamp:
> +    description: Maximum LED current setting in uA.
> +    minimum: 5000
> +    maximum: 50000
> +    multipleOf: 500
> +    default: 20000
> +
> +  awinic,uvlo-thres-microvolt:
> +    description: UVLO(Under Voltage Lock Out) in uV.
> +    enum: [ 2200000, 5000000 ]
> +    default: 2200000
> +
> +  awinic,ramp-ctl:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Select ramp control and filter of the device.
> +        0 = Fade in/fade out.
> +        1 = Light filter.
> +        2 = Medium filter.
> +        3 = Heavy filter.
> +    enum: [ 0, 1, 2, 3 ]
> +    default: 2
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

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +            compatible = "awinic,aw99706";
> +            reg = <0x76>;
> +            enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +            default-brightness = <2047>;
> +            max-brightness = <4095>;
> +            awinic,dim-mode = <1>;
> +            awinic,sw-freq-hz = <750000>;
> +            awinic,sw-ilmt-microamp = <3000000>;
> +            awinic,uvlo-thres-microvolt = <2200000>;
> +            awinic,iled-max-microamp = <20000>;
> +            awinic,ramp-ctl = <2>;
> +        };
> +    };
> +
> +...
> -- 
> 2.51.1.dirty
> 

