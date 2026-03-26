Return-Path: <linux-leds+bounces-7513-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JbHLa77xGny5QQAu9opvQ
	(envelope-from <linux-leds+bounces-7513-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:26:06 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C1433248A
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 970D0319A102
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657F13BB9F3;
	Thu, 26 Mar 2026 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftEu6ZdU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E103BA226;
	Thu, 26 Mar 2026 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516384; cv=none; b=XpzPoABbzV99M3XkbdIe6WzZ5trPUdM7z1SJySnfiEeSzXrFbEvEbYMSLmJJAhTOloVq0cNhiNPRAufTMoQiCnuvx2pDAZK7mDa24u894faGctLaX5SadHIjukv4z9of9lbWGzFTTHTduj8jfMAjl0muD8Ycl+KYlq86p/MMb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516384; c=relaxed/simple;
	bh=KreQQwoe/j0embYBbdy1ol5U6gJ3mN4FHZ9+chWPmvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMkfUNeoi8apvSSMiuI1P2eRrpr8ZwsmmlldhSRIDgMePEp3qDEdGxlKmvAfYF+2uUr+hzpblQCD9MA+A9AcC0mwfg1boVHLqyRvwg5vuOQ1dKjnKhHDhyP4Y6LnKBucGKnL/vDwrOHZg3Rgoss1p2fC8wdRF5icWx3oPlX9c7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftEu6ZdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E922C116C6;
	Thu, 26 Mar 2026 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774516383;
	bh=KreQQwoe/j0embYBbdy1ol5U6gJ3mN4FHZ9+chWPmvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftEu6ZdUz0LKUlNVXcSQdiPbXa6modxU+s+KbfE7TSxd2nZsTNI9Rm2RpnKEb9qzX
	 dkgYLUiObElEx1kMD4/UP+EQhJdOohRvSvDbbJcsNCuZTXp/V/hcSLgeWVTqUS4RxH
	 98RF9Woam1G+gv9M0cft30/JzV/xtyEUQO9zvPwn39NSrsMaOjbahqyGPDMGeId5Tb
	 Ao4pxW/cI4cVb0DPs0piEMTA29ToRkbEPXCMgzNtpPeQIwyDTKIMqoRc5qSqFTzeUv
	 yqlP6HlOdsGnQTd4BpfW5cwmc/SawzWc0qm9jGtJ8XHA3379e9BWi6EXejpcf61pWY
	 8blbms/JrdV1A==
Date: Thu, 26 Mar 2026 10:13:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Message-ID: <20260326-nimble-sociable-sawfly-515a36@quoll>
References: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
 <20260326-upstream-ltc3208-v2-3-3dbc992b6098@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-upstream-ltc3208-v2-3-3dbc992b6098@analog.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7513-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:email,analog.com:url,devicetree.org:url,bootlin.com:url,1b:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 24C1433248A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 06:30:12AM +0800, Jan Carlo Roleda wrote:
> Add Documentation for LTC3208 Multidisplay LED Driver.

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---
>  .../devicetree/bindings/leds/adi,ltc3208.yaml      | 158 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 159 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> new file mode 100644
> index 000000000000..c139937936bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2026 Analog Devices, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/adi,ltc3208.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC3208 Multidisplay LED Controller from Linear Technologies (Now Analog Devices).

Drop full stop

> +
> +maintainers:
> +  - Jan Carlo Roleda <jancarlo.roleda@analog.com>
> +
> +description:
> +  The LTC3208 is a multidisplay LED controller that can support up to 1A to all
> +  connected LEDs.
> +
> +  The datasheet for this device can be found in
> +  https://www.analog.com/en/products/ltc3208.html
> +
> +properties:
> +  compatible:
> +    const: adi,ltc3208
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':

Use consistent quotes, either ' or "

> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  adi,disable-camhl-pin:
> +    type: boolean
> +    description:
> +      Configures whether the external CAMHL pin is disabled.
> +      if disabled then the output pins associated with CAM will always select

s/if/If/.

> +      the CAM register's high half-byte brightness.
> +
> +  adi,cfg-enrgbs-pin:
> +    type: boolean
> +    description:
> +      Configures which channel the ENRGBS pin toggles when it receives a signal.
> +      ENRGBS pin controls the SUB channel's output pins if this is set,
> +      or RGB channel's output pins if this is unset.
> +
> +  adi,disable-rgb-aux4-dropout:
> +    type: boolean
> +    description:
> +      Configures the RGB and AUX4 dropout signals to be disabled.
> +
> +  adi,aux1-channel:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      LED Channel that the AUX1 output pin mirrors its brightness level from.
> +    enum: [aux, main, sub, cam]
> +    default: aux
> +
> +  adi,aux2-channel:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      LED Channel that the AUX2 output pin mirrors its brightness level from.
> +    enum: [aux, main, sub, cam]
> +    default: aux
> +
> +  adi,aux3-channel:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      LED Channel that the AUX3 output pin mirrors its brightness level from.
> +    enum: [aux, main, sub, cam]
> +    default: aux
> +
> +  adi,aux4-channel:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      LED Channel that the AUX4 output pin mirrors its brightness level from.
> +    enum: [aux, main, sub, cam]
> +    default: aux
> +
> +patternProperties:
> +  "^led@[0-7]$":
> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description:
> +          LED Channel Number. each channel maps to a specific channel group used
> +          to configure the brightness level of the output pins corresponding to
> +          the channel.
> +        enum:
> +          - 0 # Main Channel (8-bit brightness)
> +          - 1 # Sub Channel (8-bit brightness)
> +          - 2 # AUX Channel (4-bit brightness)
> +          - 3 # Camera Channel, Low-side byte (4-bit brightness)
> +          - 4 # Camera Channel, High-side byte (4-bit brightness)
> +          - 5 # Red Channel (4-bit brightness)
> +          - 6 # Blue Channel (4-bit brightness)
> +          - 7 # Green Channel (4-bit brightness)
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
> +    #include <dt-bindings/gpio/gpio.h>

Where do you use it?

> +    #include <dt-bindings/leds/common.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      led-controller@1b {
> +        compatible = "adi,ltc3208";
> +        reg = <0x1b>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        adi,disable-camhl-pin;
> +        adi,cfg-enrgbs-pin;
> +        adi,disable-rgb-aux4-dropout;
> +
> +        led@0 {
> +          reg = <0>;

Please list other applicable properties. Otherwise listing all these
children is pointless - feels deducible from the compatible.

> +        };
> +
> +        led@1 {
> +          reg = <1>;
> +        };

Best regards,
Krzysztof


