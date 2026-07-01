Return-Path: <linux-leds+bounces-8823-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DKGcCexIRWpC+AoAu9opvQ
	(envelope-from <linux-leds+bounces-8823-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 19:05:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 784106F025D
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 19:05:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Chidscy3;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8823-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8823-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7228330AE082
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 16:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E55379C2E;
	Wed,  1 Jul 2026 16:58:20 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB60368294;
	Wed,  1 Jul 2026 16:58:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925100; cv=none; b=rA1xHDbTqSVyAqaKpsXzbKF6wV/mikQ1Rjy7p4/S7+hg2zaEdWiAv5BqbCfVxVfq6txG9M3oEQm5OTS9JnY+OVZCw0K+cbClmt05+RTe+vTUE6isgZZTC0oqAvDxiPWklJrpGq1mX3t7Wo03H77oW3F7lmYG7Y30YYg2DyKHCWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925100; c=relaxed/simple;
	bh=AoAfkmpCa83AYF9tpSps33nLvi8T24R1Zg/25DsXJMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKpb3EL5ncNjBDXiDYHIkU3my056I6c53MXaBLtyuPUoqT6uTNjsg7xobk06MKM9K0AKvjlmJtMeFdZpVqspYTM5D3qUptOhjhJsLupp7NISc2rws4UDY2T5VOreJTeJEkXFPcQXJCOT9zgkQhaKiFhIeEVM8XVCEOIdQRj4vEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Chidscy3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394831F000E9;
	Wed,  1 Jul 2026 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925099;
	bh=xpVzsEDIFY7sYQ5kJnyoteoMVjNL0xWvbFaPAsmlDCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Chidscy3tigzXOLPce6Siv1WdtepGs9egaDQ6E1A01OO3Y59lIq7WOkwxdbqPWN8n
	 MzlgccN6aXYDCLNEqqLJXRBC2t/4DIijmOTQyM9LPmvadzZKh1dP9IqpLOdHn/DK9Z
	 N5xGvNQu18JuUlh57FECrOm7IL0TLpj4sdvkwUsfK2HikEwq9rti4NCa+MFFPCeBtX
	 uVBAmw0zZsLeYt6iIX7rUfNMsELdUJYevW4E3tzE/iotxoPAcMpUMnOxtOi4BTOl5Q
	 T+yYxealjKCMaSjcfmMF3OyW8gPhcQ4MnkYGEJ9O5OdCc6Psew2KxoiIcqzQ4fkObg
	 tbkZ3zsPgYZMw==
Date: Wed, 1 Jul 2026 17:58:15 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Message-ID: <20260701-pulmonary-passably-c9272ba25533@spud>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PvaMzznafJtcc5y5"
Content-Disposition: inline
In-Reply-To: <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8823-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 784106F025D

--PvaMzznafJtcc5y5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 06:15:51PM +0200, Loic Poulain wrote:
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
>  .../devicetree/bindings/leds/nxp,pca963x.yaml      | 79 ++++++++++++++++=
++++++
>  1 file changed, 79 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..04b05b8195c18ae9fc1c1cb9d=
3c694d819ea88e5 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> @@ -74,6 +74,39 @@ patternProperties:
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

Some valid looking stuff from Sashiko here.
On this, was this meant to be minItems?

pw-bot: changes-requested

Thanks,
Conor.

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
> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
> +
>  allOf:
>    - if:
>        properties:
> @@ -137,4 +170,50 @@ examples:
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

--PvaMzznafJtcc5y5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHJwAKCRB4tDGHoIJi
0s1mAQDqox5Ow4/RT0Vy/4ZAZkraI5VibF8pZooYyuWMCI8piAEAiTdOpmHGFG4C
xBX1Hl95digAHCC1eq4ZNLJFr/cB6gc=
=OgnZ
-----END PGP SIGNATURE-----

--PvaMzznafJtcc5y5--

