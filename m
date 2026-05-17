Return-Path: <linux-leds+bounces-8178-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDQ9EmfGCWpYpAQAu9opvQ
	(envelope-from <linux-leds+bounces-8178-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 15:45:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41C561422
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 15:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B5C1300A139
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 13:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4769274670;
	Sun, 17 May 2026 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwLTCZ45"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7426F29B;
	Sun, 17 May 2026 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779025506; cv=none; b=LS8C4jnA49ahhfNxthauB1yuPai8cYeEWbRi7n/I9wgJ7XdNzvDTz1BGVFTeswy1Us13hdniwqPevp74NMcNga50pp5CWwWkjJcoG7kYFAATValJjuBYoJ2V2iSLmahK2QuAZp+GIHgBOoDFRA/OZmjZZdskyI2rP2lcPSJIAkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779025506; c=relaxed/simple;
	bh=Yhlx+peDKSMRGYl8zT9YWqABpdNepHKaSStG0Z7fuZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gSR7WBkwvvyIlpSHbRMybh7qWgAiHlkl2+UZkTfdF5WJJcXOCi6n04ZOSD3zXBrZEKT9f2+ecBbvtqV3O0cE15lK81+x7eR9Wtk3dqQVuPUeJmiLs5YQypf1KwYYat/ZaPz/KbLvM8XSB8/WHF2B29opteinBqt2EgVoP3W8eeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwLTCZ45; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE23EC2BCB0;
	Sun, 17 May 2026 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779025506;
	bh=Yhlx+peDKSMRGYl8zT9YWqABpdNepHKaSStG0Z7fuZQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PwLTCZ45pGDzdvmztnoD8yfkeN6fRVyVzZng8MUKQ1zxWLWv6zS8BA84KMl5CX3Ti
	 M8EK73nR+FFWDPXHOLp64pZ2JPF2xLkQrzMu3Xef3xWYVqtz1j/jPY16A6aRLqeqai
	 Cs2Cq59jvw4pcdRQ0MUI2tm2njYat8dxH7XDZbZH3exfu6JKe9pG37lA21CLYGhSAL
	 q3pB1JkygH6zROInk6TUopqNxKWpQ9OpTEb+AHA3UHJtaE5KYfN9kl+u5j2+sXpoPM
	 g6iMe6lH3mcp/8A/c8ZZfFYrgUgW+ASD2B+yzexi/ILtawigG9Lwq1IwFo02G6IBPh
	 +ZKN5rYAzmmzw==
Date: Sun, 17 May 2026 14:44:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/6] dt-bindings: leds: Document TI LM3533 LED
 controller
Message-ID: <20260517144453.61cc210c@jic23-huawei>
In-Reply-To: <20260517074306.30937-2-clamor95@gmail.com>
References: <20260517074306.30937-1-clamor95@gmail.com>
	<20260517074306.30937-2-clamor95@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AB41C561422
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8178-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,0.0.0.0:email,0.0.0.5:email,0.0.0.3:email,0.0.0.4:email,0.0.0.1:email]
X-Rspamd-Action: no action

On Sun, 17 May 2026 10:43:01 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> Document the LM3533 - a complete power source for backlight, keypad and
> indicator LEDs in smartphone handsets. The high-voltage inductive boost
> converter provides the power for two series LED strings display backlight
> and keypad functions.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Hi Svyatoslav,

I focused on the ALS part.. A few comments.

> +# see ti,lm3533.yaml for an example
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3533.yaml b/Documentation/devicetree/bindings/leds/ti,lm3533.yaml
> new file mode 100644
> index 000000000000..2e200f172400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3533.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lm3533.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3533 Complete Lighting Power Solution
> +
> +description: >
> +  The LM3533 is a complete power source for backlight, keypad, and indicator LEDs
> +  in smartphone handsets. The high-voltage inductive boost converter provides the
> +  power for two high voltage series LED strings for display backlight and four low
> +  voltage control banks for individual LEDs. Additionally, LM3533 features an ALS
> +  sensor support.
Mention it is an interface for an external ALS.

> +  light-sensor:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: ti,lm3533-als
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      ti,resistor-ohm:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Internal configuration resister value when ALS is in Analog Sensor
> +          mode and PWM mode is disabled.

Good to note why this is a firmware thing rather than a userspace controlled
thing. I looked it up, it's because expectation is the input is a current from
the external analog ALS and these are used to convert it to a voltage with target
range.

> +        minimum: 1575
> +        maximum: 200000
> +
> +      ti,pwm-mode:
> +        type: boolean
> +        description:
> +          Switch for mode in which ALS is running. If this property is set
> +          then ALS is running in PWM mode, internal resistor value is set to
> +          high-impedance (0) and ti,resistor-ohm property is ignored.
I'd mention the ALS is an external device - so this is saying what interface thing
thing connected is using.

> +
> +    required:
> +      - compatible
> +
> +    anyOf:
> +      - required:
> +          - ti,resistor-ohm
> +      - required:
> +          - ti,pwm-mode
> +
> +patternProperties:
> +  "^backlight@[01]$":
> +    $ref: /schemas/leds/backlight/ti,lm3533-backlight.yaml#
> +
> +  "^led@[2-5]$":
> +    $ref: /schemas/leds/ti,lm3533-leds.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - light-sensor
> +  - backlight@0
> +  - backlight@1

Similar for the led nodes.

> +  - led@2
> +  - led@3
> +  - led@4
> +  - led@5

Curious - why are all the led nodes required?  What if some aren't wired to anything?

> +
> +additionalProperties: false


