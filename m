Return-Path: <linux-leds+bounces-7786-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCY4GHmQ52n69wEAu9opvQ
	(envelope-from <linux-leds+bounces-7786-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 16:58:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24243C6C3
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 16:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61B04305D6F8
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 14:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47B83D9DAC;
	Tue, 21 Apr 2026 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="o9lw3XhA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F33D88E0
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783055; cv=none; b=IwfInbR8pKOtTu39q8ttutKZPqynfhZA6OIhkwNF0B5fksxvvGNkXi3BeKUeoC588Z/YDmUeMUJ+LVOLjnNq8cvbsXVULjIF0ruwY+42vqogDdLDGY016PVyU4S6AxA1uHfGbKYzajBfrsRXQwDHrVPoGuxSJMsfyO8HSNMCuJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783055; c=relaxed/simple;
	bh=NqBxCJSSooglSvWmHdF/VUqFh/2b7ZZkADOFhvMlNhU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mJTIX8wo3gxfDGZMFJoKS9a2GmY3Zzdzx+5/6f4gIxlMgWundE4WiXR/ydJwkNVP01GPMAl/DcvuRjb0omVeQjSYrjMnyHQoSGzoX24i3l/RjYTam+KHjeU74yOHHRny4oBhvXuNIQife8+nW0sj+5Ah8fx1fZjlgMtpPyYTRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=o9lw3XhA; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B5E3424002E
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 16:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1776783044; bh=Zk59gK8u1+DLZvTRqE2gaJCXbj9xnsbmFV0JFq9MJoQ=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=o9lw3XhAgvq775Pn3wdpdbFmiGv2mEWbDdt7ajJGD3frXOgNSO71lyIfhZNDksxf3
	 1bPZrEQML+glBoIhEusYHzX20xZI3M9Ku7pLhZaYEtn+wGDZgIy392GJ5hapwj4j/M
	 +yzqwCuSaXXTGczvxcdxZ/1sstTEqnAsZ2NAEZATgwI8zg5bwGNQe/2yB4LjIkxWPB
	 Xzd8kDByIw2B1+RTABUr6AiWmqhjldd7AtKwC1SmJZmMt8MbD0NrKp9Zcr3Ei0nmVd
	 CPpAnkb2bozMW265/d++TcsWq4s4tBYRnXHRwnjzcHkQ5f6Hr8m5FVE1aa7x1UnL3N
	 CecaNlZrQE7Cg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g0QJd4ZNvz9rxN;
	Tue, 21 Apr 2026 16:50:41 +0200 (CEST)
Message-ID: <26b074972581ff398b5af964ba092c8117855062.camel@posteo.de>
Subject: Re: [PATCH v8 1/2] dt-bindings: embedded-controller: Add synology
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
Date: Tue, 21 Apr 2026 14:50:43 +0000
In-Reply-To: <20260421-just-benevolent-dormouse-2c35ed@quoll>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
	 <20260420-synology_microp_initial-v8-1-7946a9124491@posteo.de>
	 <20260421-just-benevolent-dormouse-2c35ed@quoll>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ouFJPOhX4k+ZvTsduuHi"
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
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7786-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BB24243C6C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-ouFJPOhX4k+ZvTsduuHi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 09:07 +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 20, 2026 at 02:24:20PM +0000, Markus Probst wrote:
> > Add the Synology Microp devicetree bindings. Those devices are
> > microcontrollers found on Synology NAS devices. They are connected to a
> > serial port on the host device.
> >=20
> > Those devices are used to control certain LEDs, fan speeds, a beeper, t=
o
> > handle buttons, fan failures and to properly shutdown and reboot the
> > device.
> >=20
> > The device has a different feature set depending on the Synology NAS
> > model, like having different number of fans, buttons and leds. Dependin=
g
> > on the architecture of the model, they also need a different system
> > shutdown behaviour.
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  .../synology,ds1825p-microp.yaml                   | 108 +++++++++++++=
++++++++
> >  1 file changed, 108 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/embedded-controller/syno=
logy,ds1825p-microp.yaml b/Documentation/devicetree/bindings/embedded-contr=
oller/synology,ds1825p-microp.yaml
> > new file mode 100644
> > index 000000000000..76c671a42fbf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds=
1825p-microp.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/embedded-controller/synology,ds1825=
p-microp.yaml#
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
> > +    oneOf:
> > +      - const: synology,ds223-microp
> > +      - const: synology,ds411p-microp
> > +      - const: synology,ds1010p-microp
> > +      - const: synology,ds710p-microp
> > +      - const: synology,ds723p-microp
> > +      - const: synology,ds225p-microp
> > +      - const: synology,rs422p-microp
>=20
> That's one enum.
>=20
> > +      - maxItems: 2
> > +        minItems: 2
>=20
> There is no such syntax foro compatibles. Please use any existing file
> as example or look at example-schema.
In the example schema, another device is used as fallback. This is what
I did here.


Other sources suggest, I should add fallbacks that are less specific
about the device:

e. g.
- items:
  - enum:
    - synology,ds923p-microp
    - synology,ds723p-microp
    - synology,ds1522p-microp
    - synology,rs422p-microp
  - const: synology,r1000-microp
  - const: synology,x86-microp

- items:
  - enum:
    - synology,ds225p-microp
    - synology,ds425p-microp
  - const: synology,geminilakenk-microp
  - const: synology,x86-microp
...


If thisisn't fine either, replying to my previous message would
probably the most efficient way to move forward [1].

>=20
> > +        items:
> > +          enum:
>=20
> No, why the list is randomly ordered.
>=20
> > +            - synology,ds923p-microp
> > +            - synology,ds1522p-microp
>=20
> And fallback, whichever is that, is not documented alone.
>=20
> > +      - minItems: 4
> > +        maxItems: 4

Those are devices with the exactly same known feature set.
i. e. ds1522p can act as a fallback for ds923p, and ds923p could act as
a fallback for ds1522p.

Thanks
- Markus Probst

[1]
https://lore.kernel.org/all/8c8555b3375375dac47a22fad40080fd5b4228a5.camel@=
posteo.de/

>=20
> Best regards,
> Krzysztof

--=-ouFJPOhX4k+ZvTsduuHi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnnjrIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSHuEQAIpiqPMRrlkhnm07/QrT
RLp2ptrq7z2C8MeEyHrkGj4kKb1d9oV0+jMOkUasvHis8lJKEy1KGtOleWDCKseF
/kiLt9noo9LXEQp82O7RL8zPXjE87X0UusmHjfQSypkYwO7z5OuXVJhWJusLxaO1
mrvVMeDI0neYn7ZbkRTGCa376gr3Q/tllWwG4sbTMTdhWCPoM+yc1VwqVlJEYzs7
3bKabYcO+aGk7EtZDFuHWmFCDR7pZfeb0kDfa2wGFT2IwF1v/sO/6ogDm7pfbWh3
JVBgy9dm99GYZAq8zvFysPPEpiyXk0KecPIPXzzsoNCkV8MUledLTxanxfgjaiss
u7JN/l1hg0xa89MRDTqhbmW4Q90x/difpaIRktOFWfbp914fhUQgNpW86hr8eHUv
6vFFmboVIao9q6PQf1+GQ0qrUh1zpfktkIoroG13GSg5FEmg5wtFcp1HN+JL8QpR
S+CzDKy4u4mNAxKGbY/qwkLip1TJ3zmcBzUbtbVN6nPaq283sRhohPfR3v30ABFT
bV/h+gCOyBcsytahxfNLdp03AVHkRC+bBrdIB35rWz4ky1a8VIVuU5/THHoq53jn
hAEC3wD/WVFnfNjZCBigI47mG7tGqJmslwsecZG3rkG9bSFJHvvottrFPsi+FQ6M
Zksa4a+RKfeCp4yeVj4abaWv
=ZQCk
-----END PGP SIGNATURE-----

--=-ouFJPOhX4k+ZvTsduuHi--

