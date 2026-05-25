Return-Path: <linux-leds+bounces-8317-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP2yKJSBFGqnNwcAu9opvQ
	(envelope-from <linux-leds+bounces-8317-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 19:06:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF4F5CD235
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 19:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8CBC30071C8
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 17:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40483F6C3D;
	Mon, 25 May 2026 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftNK3f4l"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C053F58C1;
	Mon, 25 May 2026 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779728776; cv=none; b=owLKe4qYDTxsH3uCebUKa+YbuSTnuRQWt7OkVTUahEL08UxbmnOSNkBmnDw4sXSPYXSeMI7ajVlKvToI+GX95l7zZYqp4dkcdwL1H3MVnWJa8Coz/MLhgbR4/EEqJrIopTcs3Dyq6ZMRSEufkb4UZDKQUYadXEADFNfeRI8sqNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779728776; c=relaxed/simple;
	bh=wle8/w9c4CvDeIj48kBpU3CahPisXEcZdKthgJEZrKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxISp8Pdf2C3JZXwEa7XF2KLRiMu1BgQMYTzQHFLrJcWTfxy8eZIRysrOWEqxrhpvWlbmYTeUZtr25Gu1Gs5UwtHZnApaMsRVFoeTt0maohaXUr0luzRUXgT9URbvFvXtZM8Ognt2HfOBLk2x2x/JzHHQaXUvsoknJFPkSMns+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftNK3f4l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AAF1F000E9;
	Mon, 25 May 2026 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779728775;
	bh=jLSSeZiHuxx569OL10aZGL8/HANsiZOAuwoTkUuRNX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ftNK3f4llxnqcXvFDGsXqizxvjPaS53moDdCsa8YCiJumi7hWO1OYpVJ++1vCcT55
	 5JmlSn0mRTizwVOIwZ7h8EPA6PRUntpKzcufKIeS67bz1K+dr7r1o4G0Che9elKr57
	 S9bdKmS6g4Khfk57xby5IfOpFWnJUvi8ViCs6MnvezVxPiVd76b+KgGDhImyV3JCbz
	 HY14jD6pKiShyKZLBgoHeXI5R/8yJLLp8EH9m7AHrOXR+BfGWixn8Gsz8R2N0VlmV2
	 wZRi6H63uGiLhEdNhytjURo1KMbxx9al4EUktNrB2OOLwKr8+7AUKu3ePAEN8kWxAl
	 AgE7MeaeHTO2A==
Date: Mon, 25 May 2026 18:06:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonas.gorski@gmail.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
Message-ID: <20260525-wreckage-gap-9d857408445a@spud>
References: <20260525033258.144291-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F+dMwfH04y8J7NA8"
Content-Disposition: inline
In-Reply-To: <20260525033258.144291-1-ninadnaik07@gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8317-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,brighamcampbell.com,lists.linux.dev,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,0.0.0.0:email,0.0.0.4:email]
X-Rspamd-Queue-Id: EFF4F5CD235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F+dMwfH04y8J7NA8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 09:02:58AM +0530, Ninad Naik wrote:
> Convert the brcm,bcm6358 to DT schema.
>=20
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>=20
> Referred to this thread:
> https://lore.kernel.org/all/20250930-brcm6358-to-dt-v1-1-ba833ceb1575@the=
goodpenguin.co.uk/
> and added the fixes suggested.
>=20
>  .../bindings/leds/brcm,bcm6358-leds.yaml      |  98 ++++++++++++
>  .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
>  2 files changed, 98 insertions(+), 143 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-l=
eds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yam=
l b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> new file mode 100644
> index 000000000000..a61417e5690b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/brcm,bcm6358-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to Broadcom BCM6358 controller
> +
> +description: |
> +  This controller is present on BCM6358 and BCM6368.
> +  In these SoCs there are Serial LEDs (LEDs connected to a 74x164 contro=
ller),
> +  which can either be controlled by software (exporting the 74x164 as sp=
i-gpio.
> +  See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
> +  by hardware using this driver.
> +
> +maintainers:
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm6358-leds
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
> +  brcm,clk-div:
> +    description: SCK signal divider.
> +    default: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8]
> +
> +  brcm,clk-dat-low:
> +    description: Makes clock and data signals active low.
> +    type: boolean
> +
> +patternProperties:
> +  "^led@(0|1?[0-9a-f])$":
> +    type: object
> +    $ref: common.yaml#
> +    description: Each LED is represented as a sub-node of
> +      this device.
> +
> +    properties:
> +      reg:
> +        description: LED pin number.
> +        minimum: 0
> +        maximum: 31

Is this missing a maxItems: 1?

> +
> +    required:
> +      - reg
> +
> +    unevaluatedProperties: false

I wonder if this should be additionalProperties: false instead, and list
the three properties mentioned by the text binding explicitly?


Cheers,
Conor.

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
> +    #include <dt-bindings/leds/common.h>
> +    led-controller@fffe00d0 {
> +        compatible =3D "brcm,bcm6358-leds";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        reg =3D <0xfffe00d0 0x8>;
> +
> +        led@0 {
> +            reg =3D <0>;
> +            active-low;
> +            label =3D "white:alarm";
> +        };
> +        led@2 {
> +            reg =3D <2>;
> +            active-low;
> +            label =3D "white:tv";
> +        };
> +        led@3 {
> +            reg =3D <3>;
> +            active-low;
> +            label =3D "white:tel";
> +        };
> +        led@4 {
> +            reg =3D <4>;
> +            active-low;
> +            label =3D "white:adsl";
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt b/Do=
cumentation/devicetree/bindings/leds/leds-bcm6358.txt
> deleted file mode 100644
> index 211ffc3c4a20..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
> +++ /dev/null
> @@ -1,143 +0,0 @@
> -LEDs connected to Broadcom BCM6358 controller
> -
> -This controller is present on BCM6358 and BCM6368.
> -In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controll=
er),
> -which can either be controlled by software (exporting the 74x164 as spi-=
gpio.
> -See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
> -by hardware using this driver.
> -
> -Required properties:
> -  - compatible : should be "brcm,bcm6358-leds".
> -  - #address-cells : must be 1.
> -  - #size-cells : must be 0.
> -  - reg : BCM6358 LED controller address and size.
> -
> -Optional properties:
> -  - brcm,clk-div : SCK signal divider. Possible values are 1, 2, 4 and 8.
> -    Default : 1
> -  - brcm,clk-dat-low : Boolean, makes clock and data signals active low.
> -    Default : false
> -
> -Each LED is represented as a sub-node of the brcm,bcm6358-leds device.
> -
> -LED sub-node required properties:
> -  - reg : LED pin number (only LEDs 0 to 31 are valid).
> -
> -LED sub-node optional properties:
> -  - label : see Documentation/devicetree/bindings/leds/common.txt
> -  - default-state : see
> -    Documentation/devicetree/bindings/leds/common.txt
> -  - linux,default-trigger : see
> -    Documentation/devicetree/bindings/leds/common.txt
> -
> -Examples:
> -Scenario 1 : BCM6358
> -	leds0: led-controller@fffe00d0 {
> -		compatible =3D "brcm,bcm6358-leds";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -		reg =3D <0xfffe00d0 0x8>;
> -
> -		alarm_white {
> -			reg =3D <0>;
> -			active-low;
> -			label =3D "white:alarm";
> -		};
> -		tv_white {
> -			reg =3D <2>;
> -			active-low;
> -			label =3D "white:tv";
> -		};
> -		tel_white {
> -			reg =3D <3>;
> -			active-low;
> -			label =3D "white:tel";
> -		};
> -		adsl_white {
> -			reg =3D <4>;
> -			active-low;
> -			label =3D "white:adsl";
> -		};
> -	};
> -
> -Scenario 2 : BCM6368
> -	leds0: led-controller@100000d0 {
> -		compatible =3D "brcm,bcm6358-leds";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -		reg =3D <0x100000d0 0x8>;
> -		brcm,pol-low;
> -		brcm,clk-div =3D <4>;
> -
> -		power_red {
> -			reg =3D <0>;
> -			active-low;
> -			label =3D "red:power";
> -		};
> -		power_green {
> -			reg =3D <1>;
> -			active-low;
> -			label =3D "green:power";
> -			default-state =3D "on";
> -		};
> -		power_blue {
> -			reg =3D <2>;
> -			label =3D "blue:power";
> -		};
> -		broadband_red {
> -			reg =3D <3>;
> -			active-low;
> -			label =3D "red:broadband";
> -		};
> -		broadband_green {
> -			reg =3D <4>;
> -			label =3D "green:broadband";
> -		};
> -		broadband_blue {
> -			reg =3D <5>;
> -			active-low;
> -			label =3D "blue:broadband";
> -		};
> -		wireless_red {
> -			reg =3D <6>;
> -			active-low;
> -			label =3D "red:wireless";
> -		};
> -		wireless_green {
> -			reg =3D <7>;
> -			active-low;
> -			label =3D "green:wireless";
> -		};
> -		wireless_blue {
> -			reg =3D <8>;
> -			label =3D "blue:wireless";
> -		};
> -		phone_red {
> -			reg =3D <9>;
> -			active-low;
> -			label =3D "red:phone";
> -		};
> -		phone_green {
> -			reg =3D <10>;
> -			active-low;
> -			label =3D "green:phone";
> -		};
> -		phone_blue {
> -			reg =3D <11>;
> -			label =3D "blue:phone";
> -		};
> -		upgrading_red {
> -			reg =3D <12>;
> -			active-low;
> -			label =3D "red:upgrading";
> -		};
> -		upgrading_green {
> -			reg =3D <13>;
> -			active-low;
> -			label =3D "green:upgrading";
> -		};
> -		upgrading_blue {
> -			reg =3D <14>;
> -			label =3D "blue:upgrading";
> -		};
> -	};
> --=20
> 2.54.0
>=20

--F+dMwfH04y8J7NA8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahSBggAKCRB4tDGHoIJi
0ifxAQCEb2+eL04iJerEDKA2/t/uYSvDzjV3klHLRevvl+tDYgEA25dMjhqzbW48
iuCsr55q749vfy6CeT/X4kQf8tGKEQ4=
=PZ2p
-----END PGP SIGNATURE-----

--F+dMwfH04y8J7NA8--

