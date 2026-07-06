Return-Path: <linux-leds+bounces-8945-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lN3WMRL3S2okdwEAu9opvQ
	(envelope-from <linux-leds+bounces-8945-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 20:42:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 233967149BB
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 20:42:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fHs40R6G;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8945-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8945-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76C1D330AE0F
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 16:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86500434E44;
	Mon,  6 Jul 2026 16:56:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13882434E42;
	Mon,  6 Jul 2026 16:56:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357007; cv=none; b=Ix+2rK+DSBGkVXfOscMRkWHtiD+LH2khwmxSTF3on3dyup2BomkAluxHgAeUFGyNzUErd6Pc62aO2C05uuiVEItYPSyIEI3klxThpHq0dmh4omOZKpGq45LXpt6IdXrW8SEzVCN8KwRZqwZD3qcX0h1ldK1xdO8oqYtpaTHbotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357007; c=relaxed/simple;
	bh=IkavAcNEz0PfF07O5rjSVXWtxZ/qVex1flxHuikSL0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuvHCIgJuByUPnemLTU+QEvCFFvRMFo3ieVtu6z5M7hl2ZsZrazrVCTL6YPh0699RSbQU3VaTBWmH9Q6zHZD1bTPJKGfIH6oC4/OcOva36ZYbI0wp2l8kZ9DPATY2CSbHLxYsPqAtqj+vcJ4OvqSJ1O5Q3NmOBhOzbxf/aRlU1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHs40R6G; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297951F000E9;
	Mon,  6 Jul 2026 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357004;
	bh=8Zb7HmMSNT0dYjvG51xeECDrIe9PtU2siXTvPJaZIg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fHs40R6GdHgXM0M1t2EyjomJ/OwN6IwGJ1f3Wc+kjNscP0u7Eu75pHVwSaiOPLYFs
	 u/DxzwpQ9Ugf4dcPrI4ILJ2vV8gDh+Do7I/CUwHqAkRKW1ygSxx2a0YQDKXm1d/nr8
	 yI8cy4iVIPpYX/cqA8D4gKDCJSeRJKMEz0UpgnbD8dI5a8zbF4wgaJHXdKRSYL7fre
	 lrW6OBrv+43jseu8WZDNkk2C3dJYUMK8/jaNVRC2uFUeEkOy80H1LiHwwuoGRBrrXH
	 XI1FzEr8n/c8uCfsXef1vwtbBGGDditNcxEJFWrHEvdcrd+B3nkERUsqHq6VvnsL9c
	 NlRdxgDgm2lxg==
Date: Mon, 6 Jul 2026 17:56:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Message-ID: <20260706-account-harsh-093c6354bca5@spud>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/p782kKd6CXzkAlU"
Content-Disposition: inline
In-Reply-To: <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8945-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 233967149BB

--/p782kKd6CXzkAlU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 05:49:56PM +0200, Loic Poulain wrote:
> Add support for grouping individual PCA963x channels into a multicolor
> LED by introducing a multi-led@N node pattern. This follows the
> convention established by other multicolor LED drivers such as
> kinetic,ktd202x.
>=20
> This is necessary to support and model hardware setups where multiple
> PWM channels drive a single physical RGB LED.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/leds/nxp,pca963x.yaml      | 104 +++++++++++++++=
+++++-
>  1 file changed, 101 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> index 4034139e3f770a1035208490a9436bdc33387279..dccdb1d9421199a51cac5c7f3=
f7da503caa35622 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> @@ -74,6 +74,40 @@ patternProperties:
>      required:
>        - reg
> =20
> +  "^multi-led@[0-9a-f]+$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0

I still don't understand this, minimum zero is literally useless since
this cannot be negative.
If anything, you should be constraining the maximum value. Remember,
outside of conditional sections the maximum permitted values should be
defined. Conditional sections should just narrow the constraints.

Same below.
pw-bot: changes-requested

> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^led@[0-9a-f]+$":
> +        type: object
> +        $ref: common.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            minimum: 0
> +
> +        required:
> +          - reg
> +          - color
> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
> +
>  allOf:
>    - if:
>        properties:
> @@ -84,10 +118,16 @@ allOf:
>                - nxp,pca9633
>      then:
>        patternProperties:
> -        "^led@[0-9a-f]+$":
> +        "^.*led@[0-9a-f]+$":
>            properties:
>              reg:
>                maximum: 3
> +        "^multi-led@[0-9a-f]+$":
> +          patternProperties:
> +            "^led@[0-9a-f]+$":
> +              properties:
> +                reg:
> +                  maximum: 3
>    - if:
>        properties:
>          compatible:
> @@ -96,16 +136,28 @@ allOf:
>                - nxp,pca9634
>      then:
>        patternProperties:
> -        "^led@[0-9a-f]+$":
> +        "^.*led@[0-9a-f]+$":
>            properties:
>              reg:
>                maximum: 7
> +        "^multi-led@[0-9a-f]+$":
> +          patternProperties:
> +            "^led@[0-9a-f]+$":
> +              properties:
> +                reg:
> +                  maximum: 7
>      else:
>        patternProperties:
> -        "^led@[0-9a-f]+$":
> +        "^.*led@[0-9a-f]+$":
>            properties:
>              reg:
>                maximum: 15
> +        "^multi-led@[0-9a-f]+$":
> +          patternProperties:
> +            "^led@[0-9a-f]+$":
> +              properties:
> +                reg:
> +                  maximum: 15

Is this 15 the maximum for all devices?
If so, why does your regex permit values greater than 15?

Cheers,
Conor.

> =20
>  additionalProperties: false
> =20
> @@ -149,4 +201,50 @@ examples:
>          };
>      };
> =20
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        led-controller@62 {
> +            compatible =3D "nxp,pca9633";
> +            reg =3D <0x62>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            /* Three channels controlling one RGB LED */
> +            multi-led@0 {
> +                    reg =3D <0>;
> +                    color =3D <LED_COLOR_ID_RGB>;
> +                    function =3D LED_FUNCTION_STATUS;
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    led@0 {
> +                            reg =3D <0>;
> +                            color =3D <LED_COLOR_ID_RED>;
> +                    };
> +
> +                    led@1 {
> +                            reg =3D <1>;
> +                            color =3D <LED_COLOR_ID_GREEN>;
> +                    };
> +
> +                    led@2 {
> +                            reg =3D <2>;
> +                            color =3D <LED_COLOR_ID_BLUE>;
> +                    };
> +            };
> +
> +            /* Remaining channel used as a plain white LED */
> +            led@3 {
> +                    reg =3D <3>;
> +                    color =3D <LED_COLOR_ID_WHITE>;
> +                    function =3D LED_FUNCTION_STATUS;
> +            };
> +        };
> +    };
> +
>  ...
>=20
> --=20
> 2.34.1
>=20

--/p782kKd6CXzkAlU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakveRwAKCRB4tDGHoIJi
0tc+AQD1xWa8YoKk5j+v3k7ziF0N2XUvIIXdj8pFG+U/UqsfqQD/d+BCU2t5T76N
T+yLT7v74sTvfECiMylgSuB9LSoS9go=
=dyQW
-----END PGP SIGNATURE-----

--/p782kKd6CXzkAlU--

