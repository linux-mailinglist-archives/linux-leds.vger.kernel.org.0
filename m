Return-Path: <linux-leds+bounces-7637-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id R5YILOVn02kNiAcAu9opvQ
	(envelope-from <linux-leds+bounces-7637-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 09:59:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9583A21B6
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 09:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC3363005AC6
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2026 07:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AF036492F;
	Mon,  6 Apr 2026 07:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLPvHqtN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0C230B502;
	Mon,  6 Apr 2026 07:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775462369; cv=none; b=hjDkwQLWXiRaK6M0ooRrfB1UbQ0mWiCt3zlh9E6SM+CV97E0dXieq6cnoDW6II/8d3ravC6/Z4l43q6FURieToBXPrVDMGnanPReZLkXap7Nnz46ksbNziv/GSVQDD6+1c5Y4iyjkTv9lPqYQtBBk+VH85H+kzSLnsfl4FNnRLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775462369; c=relaxed/simple;
	bh=H3kuvxg8ZHne3PX9xJGEzutPg/Mzcmu/UywTM0mbcz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXZrT9uNCwYSIDAT2Ot+n0OLWzL2KZUP3Hm82ZAA2VkwIz1qYsfqXYPXcaIoFjguuCvSva3kYJHw5iEHTwQoauWwmZqP8fLKDxmgnj7w2XZwGYmPhClbG7IXUrUq91A8eu1MupiPkyLckQrPmY7Xy7mqIlcdzoJk5v/BRD64ALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLPvHqtN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB334C4CEF7;
	Mon,  6 Apr 2026 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775462369;
	bh=H3kuvxg8ZHne3PX9xJGEzutPg/Mzcmu/UywTM0mbcz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLPvHqtNDibelkhWsspKp8g1g5/z5kCt8APbvI2N0179QAEqc3UXpesAV6GxuYDAN
	 oPwEnq/Hn4h6hld/zWITBqffmIOokZnxQ8nqJpcjLs0pI6+SYUcHlDzW/kOf+4IlPm
	 h0CMHBTtH2shIFAa55wF7m4b2uFuKTN1LgziNs9PNbDmohAdBvxoWP7HOwciDECfWn
	 lFlNqqswHLPtImYRbnSSnfXoo1GrKfsjndSNyUjcldh3MXn8+yBWB1AuEiGZUmfl9M
	 DTyLRjKNi5HS6K8g5CI/FcjaHoFEIoqlCV/7GuiEAMiT+L6tlbGfUj8tPWbS7h7WCg
	 W0kVWNUdJMfkg==
Date: Mon, 6 Apr 2026 09:59:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dt-bindings: embedded-controller: Add synology
 microp devices
Message-ID: <20260406-ancient-amethyst-poodle-1ba0b2@quoll>
References: <20260405-synology_microp_initial-v6-0-08fde474b6c9@posteo.de>
 <20260405-synology_microp_initial-v6-2-08fde474b6c9@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260405-synology_microp_initial-v6-2-08fde474b6c9@posteo.de>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7637-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E9583A21B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 07:36:29PM +0200, Markus Probst wrote:
> Add the Synology Microp devicetree bindings. Those devices are
> microcontrollers found on Synology NAS devices. They are connected to a
> serial port on the host device.
> 
> Those devices are used to control certain LEDs, fan speeds, a beeper, to
> handle buttons, fan failures and to properly shutdown and reboot the
> device.
> 
> This includes the following compatible ids:
>  - synology,ds923p-microp
>  - synology,ds918p-microp
>  - synology,ds214play-microp
>  - synology,ds225p-microp
>  - synology,ds425p-microp
>  - synology,ds710p-microp
>  - synology,ds1010p-microp
>  - synology,ds723p-microp
>  - synology,ds1522p-microp
>  - synology,rs422p-microp
>  - synology,ds725p-microp
>  - synology,ds118-microp
>  - synology,ds124-microp
>  - synology,ds223-microp
>  - synology,ds223j-microp
>  - synology,ds1823xsp-microp
>  - synology,rs822p-microp
>  - synology,rs1221p-microp
>  - synology,rs1221rpp-microp
>  - synology,ds925p-microp
>  - synology,ds1525p-microp
>  - synology,ds1825p-microp

Drop, we see this in the diff.

> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../synology,ds923p-microp.yaml                    | 112 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
> new file mode 100644
> index 000000000000..4518e9b74be1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/embedded-controller/synology,ds923p-microp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synology NAS on-board Microcontroller
> +
> +maintainers:
> +  - Markus Probst <markus.probst@posteo.de>
> +
> +description: |
> +  Synology Microp is a microcontroller found in Synology NAS devices.
> +  It is connected to a serial port on the host device.
> +
> +  It is necessary to properly shutdown and reboot the NAS device and
> +  provides additional functionality such as led control, fan speed control,
> +  a beeper and buttons on the NAS device.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - synology,ds923p-microp
> +      - synology,ds918p-microp
> +      - synology,ds214play-microp
> +      - synology,ds225p-microp
> +      - synology,ds425p-microp
> +      - synology,ds710p-microp
> +      - synology,ds1010p-microp
> +      - synology,ds723p-microp
> +      - synology,ds1522p-microp
> +      - synology,rs422p-microp
> +      - synology,ds725p-microp
> +      - synology,ds118-microp
> +      - synology,ds124-microp
> +      - synology,ds223-microp
> +      - synology,ds223j-microp
> +      - synology,ds1823xsp-microp
> +      - synology,rs822p-microp
> +      - synology,rs1221p-microp
> +      - synology,rs1221rpp-microp
> +      - synology,ds925p-microp
> +      - synology,ds1525p-microp
> +      - synology,ds1825p-microp

So we already talked about this and you were told to use compatibility.
Your driver clearly states several of these are compatible, so I am
confused that I do not see it expressed here.

> +
> +  fan-failure-gpios:
> +    description: GPIOs needed to determine which fans stopped working on a fan failure event.
> +    minItems: 2
> +    maxItems: 3
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - synology,ds214play-microp
> +              - synology,ds225p-microp
> +              - synology,ds710p-microp
> +              - synology,ds723p-microp
> +              - synology,ds725p-microp
> +              - synology,ds118-microp
> +              - synology,ds124-microp
> +              - synology,ds223-microp
> +              - synology,ds223j-microp
> +              - synology,ds1823xsp-microp
> +              - synology,rs822p-microp
> +              - synology,rs1221p-microp
> +              - synology,rs1221rpp-microp
> +              - synology,ds1825p-microp
> +    then:
> +      properties:
> +        fan-failure-gpios: false
> +    else:
> +      required:
> +        - fan-failure-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    embedded-controller {
> +      compatible = "synology,ds923p-microp";
> +
> +      fan-failure-gpios = <&gpio 68 GPIO_ACTIVE_HIGH>, <&gpio 69 GPIO_ACTIVE_HIGH>;

Keep only one example, they are basically the same. Difference in one
property does not need a new example.

Best regards,
Krzysztof


