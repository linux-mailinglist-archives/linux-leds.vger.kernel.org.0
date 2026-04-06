Return-Path: <linux-leds+bounces-7638-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DP7GHDE02mqlgcAu9opvQ
	(envelope-from <linux-leds+bounces-7638-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 16:34:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CBC3A423B
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 16:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11A1C3078108
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2026 14:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32933806AD;
	Mon,  6 Apr 2026 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="qgPJscRL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8DF38756C
	for <linux-leds@vger.kernel.org>; Mon,  6 Apr 2026 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485326; cv=none; b=OhwlT+qYg6oo3TUYtT5UVycNobkjRIU8/ADeMU1A6Ymj8aQmG7vtx9QGwT7CkPEMqnC/gfsxN/5IgElG6Qyu+XLdkhrXwWXbFOxNDhkgheHIQma2zMGl8VDsPFt5iGDGjKeXCuKjACijRLDhyEad+7GQyXi76K7ygihQU8JJD9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485326; c=relaxed/simple;
	bh=UBXWFPuSNY/BHboqm2+3K5ZyhtL+9cptJ1+bRiMdJh4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QEvz5lGC4HV6bY8McG5+Gki5QUDl007/soUL2cEwwtCcBXABW66GluzDcJt0i0oWA40IlDtVMV7Itzpi9iZ8ch/bBhXWaURmCBLppLsHoaM/zorSDlPYUwti9WX5pBW7NmwQQB1vfWmrDiy3ekBTtnfPJtdxbXf3eliHGjefJMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=qgPJscRL; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 05F5F240029
	for <linux-leds@vger.kernel.org>; Mon,  6 Apr 2026 16:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1775485323; bh=F0J/OusokAqx36V5UgnMeuzN1QXVg0TGemABh/0cuA0=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=qgPJscRLyXso2C4lbR1DBY9l90e8owrRgDg2WD5Q/nd8KPNe4YZzoqxudkjkVC7L0
	 +AFGPhTbabkBM/9tlpBGmYRhkeqWPkg8eq0Xyw+0otOD+8ukIFLU2+bd0hX2RUccfa
	 coDF0lXqs4btyyYwFmX1ISEjmzDm9FDQiyF4QYcRDsAQ9EMn0TiLZXomwmKTmrlyO3
	 Kw8KApOQJTHdYDgCgzaoQsdTf4fH8HqcmaOu3ldUTgPskl+YwtBL/nRyhcdVIuYTwu
	 syHqf6UJJfUoQ57/vLE31sBcf1c5yRbf9ah5yvxqDGmYIoFZQDj0tvewgVsfFZcPGt
	 gXHIlhqxBVAyw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fqBNS1hqwz6twf;
	Mon,  6 Apr 2026 16:22:00 +0200 (CEST)
Message-ID: <63fbd1a5cddc5b79302056fa7b01a790aca8ba8e.camel@posteo.de>
Subject: Re: [PATCH v6 2/2] dt-bindings: embedded-controller: Add synology
 microp devices
From: Markus Probst <markus.probst@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Mon, 06 Apr 2026 14:22:02 +0000
In-Reply-To: <20260406-ancient-amethyst-poodle-1ba0b2@quoll>
References: <20260405-synology_microp_initial-v6-0-08fde474b6c9@posteo.de>
	 <20260405-synology_microp_initial-v6-2-08fde474b6c9@posteo.de>
	 <20260406-ancient-amethyst-poodle-1ba0b2@quoll>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8X/o/pnJfJSSCsi8EKsW"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7638-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,posteo.de:dkim,posteo.de:email,posteo.de:mid]
X-Rspamd-Queue-Id: E4CBC3A423B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-8X/o/pnJfJSSCsi8EKsW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-06 at 09:59 +0200, Krzysztof Kozlowski wrote:
> On Sun, Apr 05, 2026 at 07:36:29PM +0200, Markus Probst wrote:
> > Add the Synology Microp devicetree bindings. Those devices are
> > microcontrollers found on Synology NAS devices. They are connected to a
> > serial port on the host device.
> >=20
> > Those devices are used to control certain LEDs, fan speeds, a beeper, t=
o
> > handle buttons, fan failures and to properly shutdown and reboot the
> > device.
> >=20
> > This includes the following compatible ids:
> >  - synology,ds923p-microp
> >  - synology,ds918p-microp
> >  - synology,ds214play-microp
> >  - synology,ds225p-microp
> >  - synology,ds425p-microp
> >  - synology,ds710p-microp
> >  - synology,ds1010p-microp
> >  - synology,ds723p-microp
> >  - synology,ds1522p-microp
> >  - synology,rs422p-microp
> >  - synology,ds725p-microp
> >  - synology,ds118-microp
> >  - synology,ds124-microp
> >  - synology,ds223-microp
> >  - synology,ds223j-microp
> >  - synology,ds1823xsp-microp
> >  - synology,rs822p-microp
> >  - synology,rs1221p-microp
> >  - synology,rs1221rpp-microp
> >  - synology,ds925p-microp
> >  - synology,ds1525p-microp
> >  - synology,ds1825p-microp
>=20
> Drop, we see this in the diff.
A prior review commit suggested I should add them [1].
So only synology,ds923p-microp in the Subject then?

[1]
https://lore.kernel.org/all/20260330-delicate-sassy-mayfly-ebcca7@quoll/

>=20
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  .../synology,ds923p-microp.yaml                    | 112 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 113 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/embedded-controller/syno=
logy,ds923p-microp.yaml b/Documentation/devicetree/bindings/embedded-contro=
ller/synology,ds923p-microp.yaml
> > new file mode 100644
> > index 000000000000..4518e9b74be1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds=
923p-microp.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/embedded-controller/synology,ds923p=
-microp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synology NAS on-board Microcontroller
> > +
> > +maintainers:
> > +  - Markus Probst <markus.probst@posteo.de>
> > +
> > +description: |
> > +  Synology Microp is a microcontroller found in Synology NAS devices.
> > +  It is connected to a serial port on the host device.
> > +
> > +  It is necessary to properly shutdown and reboot the NAS device and
> > +  provides additional functionality such as led control, fan speed con=
trol,
> > +  a beeper and buttons on the NAS device.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - synology,ds923p-microp
> > +      - synology,ds918p-microp
> > +      - synology,ds214play-microp
> > +      - synology,ds225p-microp
> > +      - synology,ds425p-microp
> > +      - synology,ds710p-microp
> > +      - synology,ds1010p-microp
> > +      - synology,ds723p-microp
> > +      - synology,ds1522p-microp
> > +      - synology,rs422p-microp
> > +      - synology,ds725p-microp
> > +      - synology,ds118-microp
> > +      - synology,ds124-microp
> > +      - synology,ds223-microp
> > +      - synology,ds223j-microp
> > +      - synology,ds1823xsp-microp
> > +      - synology,rs822p-microp
> > +      - synology,rs1221p-microp
> > +      - synology,rs1221rpp-microp
> > +      - synology,ds925p-microp
> > +      - synology,ds1525p-microp
> > +      - synology,ds1825p-microp
>=20
> So we already talked about this and you were told to use compatibility.
> Your driver clearly states several of these are compatible, so I am
> confused that I do not see it expressed here.
The driver does not have all functionality implemented yet.

A few examples of differences not yet visible in the driver:
- synology,ds214play-microp is the only model in the current list to
have an cpu fan
- 4 of the models are arm based and need a different shutdown behaviour
- different amount of fans (already present in the binding via fan-
failure-gpios)

I could try to group them together, but Synology does not document the
exact difference between them.

As Rob mentioned [2], I need to be able to handle unexpected
differences without qurik properties.

[2]
https://lore.kernel.org/all/CAL_JsqJUVh1YnhmYYj4ara5BheaLOL1oayjtWNuPH53q1d=
4xXA@mail.gmail.com/

>=20
> > +
> > +  fan-failure-gpios:
> > +    description: GPIOs needed to determine which fans stopped working =
on a fan failure event.
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +required:
> > +  - compatible
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - synology,ds214play-microp
> > +              - synology,ds225p-microp
> > +              - synology,ds710p-microp
> > +              - synology,ds723p-microp
> > +              - synology,ds725p-microp
> > +              - synology,ds118-microp
> > +              - synology,ds124-microp
> > +              - synology,ds223-microp
> > +              - synology,ds223j-microp
> > +              - synology,ds1823xsp-microp
> > +              - synology,rs822p-microp
> > +              - synology,rs1221p-microp
> > +              - synology,rs1221rpp-microp
> > +              - synology,ds1825p-microp
> > +    then:
> > +      properties:
> > +        fan-failure-gpios: false
> > +    else:
> > +      required:
> > +        - fan-failure-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    embedded-controller {
> > +      compatible =3D "synology,ds923p-microp";
> > +
> > +      fan-failure-gpios =3D <&gpio 68 GPIO_ACTIVE_HIGH>, <&gpio 69 GPI=
O_ACTIVE_HIGH>;
>=20
> Keep only one example, they are basically the same. Difference in one
> property does not need a new example.
Ok, it seemed like a nice convenient way to automatically test the if
blocks.

Thanks
- Markus Probst

>=20
> Best regards,
> Krzysztof

--=-8X/o/pnJfJSSCsi8EKsW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnTwYcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSuvQP/R05IvbCcdzV2GletCfZ
vcDMyCA7SUlLB0jf/hQt+TMa8meJuI9+6ia4W4p9euleYMiqVaV3HTHZRMn1owRT
X4if0fOMYSWfBsy1mJU4FgxeFvi8BCmxWIzBQI5TAsW1+s3I5aNeElAHc79PWDtQ
PDKy4XWhICi1f8tjBPyTVmMitMoUgS79QyRqfWI3FjVAdk5DuWSkmr+jc4DO/Egq
QxOKiCcKBEvr4V8liub7DSAqpBqb+yzRpaSPYihNrWOHB9vBTFqKSC+rxgqC5QKo
XNF8OEA0uetkwpRRe3idnkSGVlQVvosz+dP+RVx2ko3Pe0jmdkYLFoRbPSdGR3aF
ftn1LYVafVpOwUCmxbCi/nCcDkW0Ln2BvMmYmSftUgZGD4sIRDnLkkwUE4Xc25Z9
tpdIqJu+3rCXNkjj6Ymde1ErKT+evXFpMRpSb+OWADk4wbqmtD/lhAYisGRSz3cJ
SpsS0dVc4Ju35bW//UfN7H5zLI9VyGOrnwWceIJ7FvuX3OwjrZyKRoSht47JSZ5U
NlP6T/2u+G6AeuG3131aEfTVzKs9mQvU5ZXvVVKKER8mbcpuPAgGke1/FTVe7/Bk
ecH8UubtkfB0fRBDAykQP2koarEdKlT0HWVD8CTWIKGya7xhWngy3NkJjY6J2pzx
M8vTFxMHMC12u6fav9kXfAh7
=tKjT
-----END PGP SIGNATURE-----

--=-8X/o/pnJfJSSCsi8EKsW--

