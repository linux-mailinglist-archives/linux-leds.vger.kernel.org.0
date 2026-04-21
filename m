Return-Path: <linux-leds+bounces-7790-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEtDEhin52lQ+wEAu9opvQ
	(envelope-from <linux-leds+bounces-7790-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 18:34:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D984943D6E2
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 18:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34E8E30C1C49
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 16:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1121E3750A4;
	Tue, 21 Apr 2026 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="VtVh+rhi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18701246783
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788721; cv=none; b=Xv7LF7jfhPQQXsXdOImdnf3qyobe2Nd8VHE6VEK5SgiJkK2JE9Mu83klQu2KOWTxjlhP84sLdlQN0EJK2KOe9eYbyxlw8iyGLtBC1tKa3IlzYOdUEReRGLRTruO8azMv2Mtk0u9h9691QTcw81jFJRpwl+J+/ghGZE1VEku4S+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788721; c=relaxed/simple;
	bh=olIDjavRa7iyUYJTNhkrwZs+QbBFZD3TzoyGv9kPUrc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ad6oWcu78Bby2LQyqvsdptbzfk9bnXApDSoajRbIPxrwIGkrdFGW7wGbJy9vozDoFaz8pDZq1L+W/4M+SUn9qW064klknEP8u6zy8339FGb3nQGrLuU9GdE5GxZqFZ2DJwgdKtKgmOfFpYxlAOF5EFtkIH/bo98vzsGOstsjD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=VtVh+rhi; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 97074240105
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 18:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1776788712; bh=xkStJTdt1UvdkTxyjSXbcae1im2J5rPNy90X5454nzI=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=VtVh+rhiOzP8h7hOlf1oBvqe0mHuDnI5N/CCbcYRcAt18jTdkoPI9ffzlLtzdymVP
	 gQ2ehGpK7k9Y79W+7sfQAqkeYnbS6F2DCyF1XeYJi6RZ1gMf2xwa6XZjxuwbr2ooIc
	 9L/2QQyC+gATAL6hwAJZXDrLdI3t2MUzV5f2NF2W+yTBhpK+BvYojaCaOjEfeTXyay
	 7jUhjoZ191wpqhV5Vu1kddc4PN6ZWy3qp/pzbYA/hFXeTqGyF3DEh5vyex/5BNK4SV
	 /BJqOZS6EKBvyHySTdQsNa0LyBQkK48VFfxGDVljhHqXQBf4nPzFeNjclo5q4EErhx
	 kfQenoYtfUd+A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g0SPf1Cdsz9rxB;
	Tue, 21 Apr 2026 18:25:09 +0200 (CEST)
Message-ID: <33e04947d6d55035fe310935281a4f0b9e87ae08.camel@posteo.de>
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
Date: Tue, 21 Apr 2026 16:25:11 +0000
In-Reply-To: <c214f270-571c-4440-919e-99fce5ac1b08@kernel.org>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
	 <20260420-synology_microp_initial-v8-1-7946a9124491@posteo.de>
	 <20260421-just-benevolent-dormouse-2c35ed@quoll>
	 <26b074972581ff398b5af964ba092c8117855062.camel@posteo.de>
	 <c214f270-571c-4440-919e-99fce5ac1b08@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-PEBAOPbuxbtR+GiM4GcY"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7790-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,posteo.de:email,posteo.de:dkim,posteo.de:mid]
X-Rspamd-Queue-Id: D984943D6E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-PEBAOPbuxbtR+GiM4GcY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 17:32 +0200, Krzysztof Kozlowski wrote:
> On 21/04/2026 16:50, Markus Probst wrote:
> > On Tue, 2026-04-21 at 09:07 +0200, Krzysztof Kozlowski wrote:
> > > On Mon, Apr 20, 2026 at 02:24:20PM +0000, Markus Probst wrote:
> > > > Add the Synology Microp devicetree bindings. Those devices are
> > > > microcontrollers found on Synology NAS devices. They are connected =
to a
> > > > serial port on the host device.
> > > >=20
> > > > Those devices are used to control certain LEDs, fan speeds, a beepe=
r, to
> > > > handle buttons, fan failures and to properly shutdown and reboot th=
e
> > > > device.
> > > >=20
> > > > The device has a different feature set depending on the Synology NA=
S
> > > > model, like having different number of fans, buttons and leds. Depe=
nding
> > > > on the architecture of the model, they also need a different system
> > > > shutdown behaviour.
> > > >=20
> > > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > > ---
> > > >  .../synology,ds1825p-microp.yaml                   | 108 +++++++++=
++++++++++++
> > > >  1 file changed, 108 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/embedded-controller/=
synology,ds1825p-microp.yaml b/Documentation/devicetree/bindings/embedded-c=
ontroller/synology,ds1825p-microp.yaml
> > > > new file mode 100644
> > > > index 000000000000..76c671a42fbf
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/embedded-controller/synolog=
y,ds1825p-microp.yaml
> > > > @@ -0,0 +1,108 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/embedded-controller/synology,ds=
1825p-microp.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Synology NAS on-board Microcontroller
> > > > +
> > > > +maintainers:
> > > > +  - Markus Probst <markus.probst@posteo.de>
> > > > +
> > > > +description: |
> > > > +  Synology Microp is a microcontroller found in Synology NAS devic=
es.
> > > > +  It is connected to a serial port on the host device.
> > > > +
> > > > +  It is necessary to properly shutdown and reboot the NAS device a=
nd
> > > > +  provides additional functionality such as led control, fan speed=
 control,
> > > > +  a beeper and buttons on the NAS device.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - const: synology,ds223-microp
> > > > +      - const: synology,ds411p-microp
> > > > +      - const: synology,ds1010p-microp
> > > > +      - const: synology,ds710p-microp
> > > > +      - const: synology,ds723p-microp
> > > > +      - const: synology,ds225p-microp
> > > > +      - const: synology,rs422p-microp
> > >=20
> > > That's one enum.
> > >=20
> > > > +      - maxItems: 2
> > > > +        minItems: 2
> > >=20
> > > There is no such syntax foro compatibles. Please use any existing fil=
e
> > > as example or look at example-schema.
> > In the example schema, another device is used as fallback.=20
>=20
> True.
>=20
> > This is what
> > I did here.
>=20
> Not true. You have enum and min/maxItems. There is no such syntax for
> compatibles. I repeat.
>=20
> Instead of just blindly disagreeing and saying "I did that", point me to
> example-schema having compatibles with min/maxItems.
It is supposed to minimize the schema, otherwise

- minItems: 3
  maxItems: 3
  items:
    enum:
    - synology,ds223j-microp
    - synology,ds124-microp
    - synology,ds118-microp

would have been

- items:
    - const: synology,ds223j-microp
    - const: synology,ds124-microp
    - const: synology,ds118-microp

- items:
    - const: synology,ds124-microp
    - const: synology,ds223j-microp
    - const: synology,ds118-microp

- items:
    - const: synology,ds118-microp
    - const: synology,ds223j-microp
    - const: synology,ds124-microp
.

In the case of dts validation, this is the same, with the exception of
allowing any order. See below why the order does not matter.

And yes, the example schema didn't use min/maxItems.
>=20
>=20
>=20
> >=20
> >=20
> > Other sources suggest, I should add fallbacks that are less specific
>=20
> That's not really discussed here. It all looks like some random schema
> and considering amount of LLM flying on the lists I have now doubts.
I am not using an LLM for coding. But it is the first device tree
schema I try to write.
>=20
> You need specific compatibles.
> ...
>=20
> >=20
> > If thisisn't fine either, replying to my previous message would
> > probably the most efficient way to move forward [1].
>=20
>=20
> >=20
> > >=20
> > > > +        items:
> > > > +          enum:
> > >=20
> > > No, why the list is randomly ordered.
>=20
> Look here
Was answered below. They have the exactly same known feature set, thus
the order does not matter. i. e. there is no known difference.

>=20
> > >=20
> > > > +            - synology,ds923p-microp
> > > > +            - synology,ds1522p-microp
> > >=20
> > > And fallback, whichever is that, is not documented alone.
> > >=20
> > > > +      - minItems: 4
> > > > +        maxItems: 4
> >=20
> > Those are devices with the exactly same known feature set.
> > i. e. ds1522p can act as a fallback for ds923p, and ds923p could act as
> > a fallback for ds1522p.
>=20
> You are not responding to actual comments. Lets focus ONLY on above
> list. ONLY. Point me, where did you document the fallback to be used
> alone? First of course, define what is the fallback.
In this schema, I defined ds923p as fallback for ds1522p, and ds1522p
as fallback for ds923p. There was no separation of front and fallback
until now. See below.

>=20
> None of this matches example schema or any other bindings, none of this
> produces correct constraints for correct DTS.
>=20
> You need a defined enum of fallbacks and several lists for specific
> fallback+front, like many other bindings in kernel.
So now I can imagine what schema you want to see.

i. e.
- items:
    - enum:
      - front1
      - front2
      - front3
    - const: fallback1
- items:
    - enum:
      - front4
      - front5
      - front6
    - const: fallback2
- enum:
  - fallback1
  - fallback2

But I am unsure how to determine which devices are the fallback and
which are the front devices, given some of them have the same feature
set. The oldest device as fallback each?

Thanks
- Markus Probst

>=20
> Best regards,
> Krzysztof

--=-PEBAOPbuxbtR+GiM4GcY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnnpN4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSv6oP/iKhbUeOAa2H/ZZm3YR1
hzPYkSPjRLGJgtboxyOkha/fHQUbbSFILkuZhwF2Auqt1456XitahIkpOr5XmiTV
lrDptKc7VHSiC+lf6MMiA/LLOnRMt5DlFDPwpxnTzFchnUoqag+6mTnVEFfv4AxS
HlSGEiOdkLdnRrNNyZImVGdRY9YAY3hZjjA6vKhkAEr34Zaf+f7kML+8iFQyCOdx
BkR2TtGqakkGWqSkDiV+KQWZPKvio0ZL8dNe+qAibgTuC0E5ZiMJzyHYiw+JP9De
8txnKm3yUV18+tah8fqsvRQKuUHGODCaZoUDyid7g54ZVwJChmRJa78oltI8hZeY
mPzuCmtDC3Hnrt7rfzCN/jTukAlDAGmZrSqrWsqwq2Zp1kqRM87U6x0HznNPVTjs
U9qq/JN4zJj57dAXtbJg/lp84lDFsd58jIDtc+2E9eLvLj8Ji4nxumKCanrBudgd
WX4cWJ9Oh/Jlq/B7Q+WLIhuPdhxvFFO6ThoIAd0/q8iC1K62h0NzXoJqpwJz38Gj
DAELHq6uLll8NEWuRLJkdQzbYXixF3q+EaIeg6kzkCQ8WZ6YkUj8uxa/JAOA/smE
RxyBM5GSG+dMVYjZ8fGxQ/9g/4PrmXFDiQfWNui0tVclaaveG+58zE3bRQfI6BVr
q2BWCOJ+FR26o5f6NCYa9jWk
=v/TB
-----END PGP SIGNATURE-----

--=-PEBAOPbuxbtR+GiM4GcY--

