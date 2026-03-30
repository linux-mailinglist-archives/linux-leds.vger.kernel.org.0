Return-Path: <linux-leds+bounces-7598-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLQvDBkKy2kNDQYAu9opvQ
	(envelope-from <linux-leds+bounces-7598-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 01:41:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A306336260B
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 01:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F6AF3011861
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 23:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36653B2FD8;
	Mon, 30 Mar 2026 23:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="q3M++rMh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC743750B6
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 23:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774913929; cv=none; b=Ou04QTob4+Kw0/ifO6ktrk7TrkrvealWOf9XmwX1RMYFFVazBB8x4+dCeBBIDZU9U7B6hOYfDMrl63mlNCC8KswtXOYEdlfrXVEMbKe6Z2z+d+JujPoJQqGoGE6MS/ekRwubp5Nw+2oBXBIqBM6ROtc//0Vec/yKO+UNJGJRvb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774913929; c=relaxed/simple;
	bh=UXt0GpjVUU9iZtnxHkrvLTJCcJMggqxXAxcvcgaaOF8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iEv/r+duxtLj8pOMDab27x8jjWJohsYld3fSEYLckRIwZX6ouuLrOa4qnhk9IxPOJqncBEmWUsNkMIzwvTJNjzfwxF2CdcfUUul7vPTkYjQryampoQlc5mu33jgahYBl4lBbyEa8zAOrYprmez/Ok65DS0IgsA4XRxjx+L+Z1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=q3M++rMh; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3C8DD24002B
	for <linux-leds@vger.kernel.org>; Tue, 31 Mar 2026 01:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1774913926; bh=KJlVFt0fFfjlXIIskbJ95F8NElAOQxivO1b71aYLZAI=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=q3M++rMhTTpHctbWlS63vFRua+CL+BOfVeeMLLLvKF25Qj+XY+4ObJIeXfsSnyGQs
	 msNxbmZGURARpgxXMRudfOH/i0JM7ai6jEEUey/IrnwvLUTJ8gLzut+LmJGYh4NL8l
	 62sogM64ZYk6dKi1U09bajBi9/fo1xR9Qke1igzDoXSaIQhh4347yEC2SCkKClNjvK
	 xbQhJ53q4vIUfN53e8LVrL+J1RbKbnOIlSfW+DfpdMIwU01n5ZPunFrZw7wAeeFMqx
	 OdX/SDwA4vdJfEP7LlwMIWq749oXDdf9ekGxMGDE5XaVqPaPt8bm2RQT9iFHVzOZoz
	 L509L/Ult+/wg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fl7431RT7z9rxB;
	Tue, 31 Mar 2026 01:38:42 +0200 (CEST)
Message-ID: <325bf1f6a037bad714db19101421588f671e3b2d.camel@posteo.de>
Subject: Re: [PATCH v5 1/4] dt-bindings: embedded-controller: Add synology
 microp devices
From: Markus Probst <markus.probst@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda	
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Saravana Kannan
 <saravanak@kernel.org>, 	platform-driver-x86@vger.kernel.org,
 linux-leds@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org,
 linux-acpi@vger.kernel.org
Date: Mon, 30 Mar 2026 23:38:45 +0000
In-Reply-To: <20260330-delicate-sassy-mayfly-ebcca7@quoll>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
	 <20260329-synology_microp_initial-v5-1-27cb80bdf591@posteo.de>
	 <20260330-delicate-sassy-mayfly-ebcca7@quoll>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YMgqfLsG96AmlufvYGNr"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7598-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,posteo.de:mid]
X-Rspamd-Queue-Id: A306336260B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-YMgqfLsG96AmlufvYGNr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-30 at 08:51 +0200, Krzysztof Kozlowski wrote:
> On Sun, Mar 29, 2026 at 08:02:15PM +0200, Markus Probst wrote:
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
> Last time you had one compatible and implied they are all compatible.
> Now none of them are compatible, which might be accurate,

As you mentioned earlier:

Unless exactly same board is used
in different models (unlikely) then the compatible defines the LEDs and
they are not needed in DT.

>=20
> but nothing
> explains WHY they are not compatible in the commit msg.
Shall all 22 compatible be in the commit msg?

Also, might be worth documenting this requirement [1].

>=20
> > +
> > +  fan-failure-gpios:
> > +    description: GPIOs needed to determine which fans stopped working =
on a fan failure event.
> > +    minItems: 2
> > +    maxItems: 3
>=20
> Constraints cannot be flexible. You need allOf:if:then: block to narrow
> them per variant.
I can disable the property or force the property based on compatible
with it.
But it seems it won't let me modify the minItems and maxItems
constraint.

Thanks
- Markus Probst


[1] https://docs.kernel.org/devicetree/bindings/submitting-patches.html


>=20
> Best regards,
> Krzysztof

--=-YMgqfLsG96AmlufvYGNr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnLCYAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPS/gEQAIMb2gXuY4FHniYPy2Jp
la8R/ykjbSW+5ISJlfj5m9XwiPLY+AcTgISu7weP2W3kfacbdkOnbx63+vyjR0DF
6QGhEgvY9V1vgq+0An+SSmnkzjm2ffg291nxKiqIfXtFY3v9djZk5v+MQTL38uYb
rqGGmFHU7u7Ij+1v5TLFPuZyNwdS7wh3JQ4E+II3fBcfJRKmyqaPhrbGSOiJOuUv
WQtTJo7lT5Obr8PPGHx3Cm59ByECXf98BF9AjjpvXDPlGiEEsQS40/F5R3Fq9UNV
EEjNKp9SXEJJXnc/Y9zrgw6h5qwVhytq6SSlk0JA3Lh2WU2ruzzDXOUxY4RV4tK7
DkebkYKkAGaLgnf3DNYMLsUCg8FsPle6Aadd4BzzdgJnPbotvgR3CkiUWcYjI9Ml
k04nGUtFjBC8mIVKGOhBunCvweb8ucrOTjRk6mxhBBXOED2xvtiPASozNkNpo729
sGA08vwLJqwhRx/WlSK2qL8C94L2CaTaWxltPT73KLrdIDcy1hliIDxxOxH9XYdE
z9g2yYMjekpjBbsS2I57Yo3h3Zler9eO6ZhbI4m7gSpixwl0t37CsJ3mO426l923
EuFLAnw/qbx4Gst5XESfEFkubfAU/RiU6hP4yUWVaxQlPxmS3vfVthw0QJpK7rE0
LaHObcMI5OrEmT6Vlfr5qK5v
=+wyl
-----END PGP SIGNATURE-----

--=-YMgqfLsG96AmlufvYGNr--

