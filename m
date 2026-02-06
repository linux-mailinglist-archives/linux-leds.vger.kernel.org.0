Return-Path: <linux-leds+bounces-6876-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKyuOrR0hmn/NQQAu9opvQ
	(envelope-from <linux-leds+bounces-6876-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 00:09:40 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 907671040B0
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 00:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D6CE302C5FE
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 23:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A06530DECE;
	Fri,  6 Feb 2026 23:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHE0a4pq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201922F5311;
	Fri,  6 Feb 2026 23:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419366; cv=none; b=IBpud+ZzOv8TIt8+jXSWf8LofngDJ/bc59rBg3kQEtU9x1u3L5v09vxMFLQxsq06zovzxXETvi1etT8/CrqYYRXKQLDfVDI2jrRIavjPvEVdF5GOq1eDj0i5kq3iH07qvNPC6egNGFhGHHb82HIMEndXcMNX1gpRfxMzyEPFWM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419366; c=relaxed/simple;
	bh=+d9TjhHjJkRR286+pDIsIGDe+mPeLjJWc75sfv+eH0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwjNdJ7E0VLGfU0zGTstpV8yDvXLmGPVTIS5WejTjvt285Snlx9gxMdnzQv486yDEUqIXP7EpNDfrJ0wZK7KU2hRwodbtuuqwYxEwnVJmh/6tD4eEfHE5034d3U0NFZ1vpfZE9/9c6JrSCFBWwBlS5grKAdntbkQraewxPHqiVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHE0a4pq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9C7C116C6;
	Fri,  6 Feb 2026 23:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770419365;
	bh=+d9TjhHjJkRR286+pDIsIGDe+mPeLjJWc75sfv+eH0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHE0a4pqdLZup/ozaHrLYIZvRTa2HylICjf/vD7LzQgK6r3BSIarhAONGEWlbOjyt
	 /McRfyxfDeamHHad12P5QE9QvpsZpIDFPXg5D7hbVyAGZjagWFhdGX9burz3HnOBGN
	 rv2jGyZsUHjZ/mUjuWDAqZU2nDPkjTiuWraBME+WF0VMUAg16+L8P6WFvRwvwDpZSo
	 4vooWF5anQ8IF6zpIW8jkypEKnJAQ0t4FApvw6D6Z57Rd4H/EWCWoJFDHRrzo3lOdW
	 1VvB/EKSqqCI8cnrqZnA6JgowaCS6oEDbCYsFHqpyYNDPu0LfSp2mt/0oP5Mxu9YSa
	 UMxrKyCoWFx7Q==
Date: Fri, 6 Feb 2026 17:09:22 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: regulator: cpcap-regulator:
 convert to DT schema
Message-ID: <20260206230922.GA254792-robh@kernel.org>
References: <20260206172845.145407-1-clamor95@gmail.com>
 <20260206172845.145407-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206172845.145407-2-clamor95@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6876-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 907671040B0
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 07:28:35PM +0200, Svyatoslav Ryhel wrote:
> Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
> from TXT to YAML format. Main functionality preserved.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/regulator/cpcap-regulator.txt    | 35 -------------
>  .../regulator/motorola,cpcap-regulator.yaml   | 50 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt b/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> deleted file mode 100644
> index 36f5e2f5cc0f..000000000000
> --- a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Motorola CPCAP PMIC voltage regulators
> -------------------------------------
> -
> -Requires node properties:
> -- "compatible" value one of:
> -    "motorola,cpcap-regulator"
> -    "motorola,mapphone-cpcap-regulator"
> -    "motorola,xoom-cpcap-regulator"
> -
> -Required regulator properties:
> -- "regulator-name"
> -- "regulator-enable-ramp-delay"
> -- "regulator-min-microvolt"
> -- "regulator-max-microvolt"
> -
> -Optional regulator properties:
> -- "regulator-boot-on"
> -
> -See Documentation/devicetree/bindings/regulator/regulator.txt
> -for more details about the regulator properties.
> -
> -Example:
> -
> -cpcap_regulator: regulator {
> -	compatible = "motorola,cpcap-regulator";
> -
> -	cpcap_regulators: regulators {
> -		sw5: SW5 {
> -			regulator-min-microvolt = <5050000>;
> -			regulator-max-microvolt = <5050000>;
> -			regulator-enable-ramp-delay = <50000>;
> -			regulator-boot-on;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
> new file mode 100644
> index 000000000000..50bc57f06b51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorola CPCAP PMIC regulators
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  This module is part of the Motorola CPCAP MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
> +  regulator controller is represented as a sub-node of the PMIC node
> +  on the device tree.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - motorola,cpcap-regulator
> +      - motorola,mapphone-cpcap-regulator
> +      - motorola,xoom-cpcap-regulator
> +
> +  regulators:
> +    type: object
> +
> +    patternProperties:
> +      "$[A-Z0-9]+^":

I thought it was said on the last version to list the names. Considering 
you already have them below, better to put them in schema than prose. 
And pretty much all regulator bindings define the names.

> +        $ref: /schemas/regulator/regulator.yaml#
> +        type: object
> +        description:
> +          Valid regulator names are SW1, SW2, SW3, SW4, SW5, VCAM, VCSI,
> +          VDAC, VDIG, VFUSE, VHVIO, VSDIO, VPLL, VRF1, VRF2, VRFREF, VWLAN1,
> +          VWLAN2, VSIM, VSIMCARD, VVIB, VUSB, VAUDIO
> +
> +        required:
> +          - regulator-name
> +          - regulator-enable-ramp-delay
> +          - regulator-min-microvolt
> +          - regulator-max-microvolt
> +
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +...
> -- 
> 2.51.0
> 

