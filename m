Return-Path: <linux-leds+bounces-6536-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B32CF73CD
	for <lists+linux-leds@lfdr.de>; Tue, 06 Jan 2026 09:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D04C130259C0
	for <lists+linux-leds@lfdr.de>; Tue,  6 Jan 2026 08:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B6A30AACA;
	Tue,  6 Jan 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e45QttXV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AFE3090FF;
	Tue,  6 Jan 2026 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767687135; cv=none; b=bnGw7/kd4ky0U+v0YvbyFOlEA4lVyyn1RRvUS0mF6fBlRmdPz7W36XOnvks5EEHRH46J0mmB4i92/pM56o8KKXAX1I0GejbkysDZwPUcqwluftOLZpCoYqa//ZXqFGwduNMmLeseiYNX2GX8q8NMcbFswvFH1/QgghAswLTE5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767687135; c=relaxed/simple;
	bh=QiWynuDwmpLPxaA54D7I1wAkIkxjjJl9E0VZSxeHQzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jf/yXimXGbNBBdbHKO07a/sSl6UpgLBiT0D5fFXRKxxxDQbjbWlFncivvEAbk1Aqy7/gsiPrgsU7HSRd4i5ekYrKSpnbaXzeyGNoJww7RrZg3wts3YCXAdIRPOwMwlg3v7e3jO2PEJesdCBOtrq5b58Z+byqICm5C+YWFu5SFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e45QttXV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6F9C116C6;
	Tue,  6 Jan 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767687132;
	bh=QiWynuDwmpLPxaA54D7I1wAkIkxjjJl9E0VZSxeHQzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e45QttXVUGMs5Hwbx30H32nQXXp+QNvPBlr/NjZmm5nGooeWrxPSQXTqZlrQKI/tS
	 pQaEWAPL4WXWoCBWkgCvcTt7vkj9oZBxgS2+0kOUyXGdmoZVVjZ9tTE2GKP64aGxj0
	 Hf4BtFzOIP562PO3+wfJqPPjC9UjVN7o3BB7y6NheJmvmcZzR1f5m1WxtavyGY23aV
	 1nuqME3jSvCakLszrTJCCkpptIrT+qd5F8GfXu0+UORkDlg0WeSaa7iZw1Hqavug/O
	 TzfpN9IKe65zW0bJOkD1qzois79gIC7xqYa6EGGAT6aXtcLzuKJN3skhnjqSbtnjKW
	 TAuwSvbD1r0hQ==
Date: Tue, 6 Jan 2026 09:12:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document LTC3220 18 channel LED
 Driver
Message-ID: <20260106-crystal-ambrosial-wildebeest-0e35d6@quoll>
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
 <20260106-ltc3220-driver-v1-1-73601d6f1649@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106-ltc3220-driver-v1-1-73601d6f1649@analog.com>

On Tue, Jan 06, 2026 at 01:27:07PM +0800, Edelweise Escala wrote:
> Add dt-binding for ltc3220. LTC3220 18 Channel LED driver

Subject, commit msg, binding: driver as Linux driver? If yes, then
rewrite everything to match hardware.

Otherwise what is exactly a LED driver? I know motor drivers.

> 
> Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> ---
>  .../devicetree/bindings/leds/leds-ltc3220.yaml     | 131 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 138 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
> new file mode 100644
> index 000000000000..33285a7ac7a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml

Filename matching compatible.


> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-ltc3220.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC3220 LED Drivers
> +
> +maintainers:
> +  - Edelweise Escala <edelweise.escala@analog.com>
> +
> +description: Bindings for the Analog Devices LTC3220 18 channel LED Drivers.

Missing wrapping after description. Look at other bindings.

Also, drop "Bindings for". You should describe  here hardware, not that
binding is a binding for.

> +
> +  For more product information please see the link below
> +    https://www.analog.com/en/products/ltc3220.html
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc3220
> +      - adi,ltc3220-1

What is -1 device? Why description does not help here at all?

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
> +    description: GPIO attached to the chip's reset pin

Drop description, obvious, redundant.

> +
> +  adi,force-cpo-level:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Forces the Charge Pump Output to a specified multiplier.
> +    enum:
> +      - "0" # Auto(default) - Automatically selects optimal charge pump mode
> +      - "1.5"
> +      - "2"
> +      - "1"

Numbers are not a string, so choose appropriate number format. Also,
oddly sorted. I don't understand what this property is for so not sure
what to recommend.


> +    default: "0"
> +
> +  adi,quick-write:
> +    type: boolean
> +    description: If present, LED 1 output becomes a master control that
> +      simultaneously updates all 18 LED outputs using the hardware's quick-write
> +      mode. When enabled, led@1 must be defined in the device tree to provide
> +      the control interface, even if no physical LED is connected to the D1
> +      output pin. When disabled or not present, LED 1 operates as a normal
> +      independent LED output.

If there is no led@1 physically, you cannot add it to the DT. It seems
you described some sort of driver behavior, instead of hardware.

> +
> +patternProperties:
> +  "^led@([1-9]|1[0-8])$":

Use consistent quotes, so '.

> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description: Output channel for the LED (1-18 maps to LED outputs D1-D18).
> +        minimum: 1
> +        maximum: 18

Best regards,
Krzysztof


