Return-Path: <linux-leds+bounces-7351-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePq7Awz/tmlLLQEAu9opvQ
	(envelope-from <linux-leds+bounces-7351-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 19:48:44 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD133292031
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 19:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5EE3051493
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 18:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C3137BE60;
	Sun, 15 Mar 2026 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="RF2nuhSL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D53373C19
	for <linux-leds@vger.kernel.org>; Sun, 15 Mar 2026 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600443; cv=none; b=oNvuchTMsU+EVNlW35H4dxf10jmS1URBpd1rA+Z6uZ6ClhO+gcxILO41lYKNmcz2z/04J0QubfA67zAsN0z0c3g5ftF9dHkJ8KnVEN6K+/6/4auybHJaTEsJ1jin8X+I5Wv1hXQ937thv1mwBw/0109LLhJIIb96imo+TrgKZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600443; c=relaxed/simple;
	bh=WgkSWuI1ZRzSHULMtaQAFZ3a+Zze7McR5utYYj5FI3s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NKMEzsXMVJZ7zXFg5EYQClUt03+Ty0SxoKN65wzWIlgvxiMOnDyxiDtC6maWL/23nLeWCG2bqWB2poZhdsvT4ucMyg735m4GHoi6tEmteBOctiyaph9vG1U0n0ZL5iAZrgepzDGO7YUe0EJU2xAzB9j2F9wzTsQG+IZP/3W+Ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=RF2nuhSL; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id A192F240028
	for <linux-leds@vger.kernel.org>; Sun, 15 Mar 2026 19:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773600439; bh=H4mDTQ/iFKsdb3OrYFWpOux6WmM9tVI7p4yUlHEcizE=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=RF2nuhSL6llZoj6lpjLf+DoDoAAuBHCHydH3jJfA4g/KdNAqs7xK77Dfqiq45cRn1
	 Bk6ZekCaiHKjQ76zBPoLbSg+vA7LSMFBRZ3vtp3jHl/+JsJMFw/p1PDHS33PiPAU+n
	 q46BqqnCPeA5A5LSrnhfy0Doo+/IN3VHcIb54UHRibkdKcpQdTOJDX6DW4+4KBQMoy
	 OYGT5s+cW5VVi3CiMjGG4fZWVxG1uKbopKX07ll/PPTcz3EycGq6MwUfrXDeh9rvqM
	 neLF9BmeGv5geFBDgdbsu2Q8Date3g4jJdye03lA1VYURMqwdsuakZxzG9tCBlvuPq
	 umVeEBik44q+w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fYnJh104bz9rxM;
	Sun, 15 Mar 2026 19:47:16 +0100 (CET)
Message-ID: <eb2f7498c5f3247265effc47b3445a04ac71956e.camel@posteo.de>
Subject: Re: [PATCH v3 7/7] leds: add synology microp led driver
From: Markus Probst <markus.probst@posteo.de>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>,
  Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda	
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Igor Korotin	 <igor.korotin.linux@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Robert Moore
 <robert.moore@intel.com>, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, 	linux-pci@vger.kernel.org,
 linux-leds@vger.kernel.org, 	linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev
Date: Sun, 15 Mar 2026 18:47:18 +0000
In-Reply-To: <DH3KAWWLECYW.3VBH7PIE7ZE20@kernel.org>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
	 <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
	 <DH1YH0GO75H8.18YSW2VMKRB3C@kernel.org>
	 <39f1c9bb0dbde9f1b60785f8e838289c888ffdb0.camel@posteo.de>
	 <DH3KAWWLECYW.3VBH7PIE7ZE20@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2I9HBOr2zxBJYLArSa0T"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7351-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,markus.probst.posteo.de,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AD133292031
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-2I9HBOr2zxBJYLArSa0T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-03-15 at 19:20 +0100, Danilo Krummrich wrote:
> On Sun Mar 15, 2026 at 4:15 PM CET, Markus Probst wrote:
> > On Fri, 2026-03-13 at 22:00 +0100, Danilo Krummrich wrote:
> > > On Fri Mar 13, 2026 at 8:03 PM CET, Markus Probst via B4 Relay wrote:
> > > > +impl Command {
> > > > +    fn write(self, dev: &platform::Device<Bound>) -> Result {
> > > > +        // SAFETY: Since we have no of and no acpi match table, we=
 assume this is a mfd sub-device
> > > > +        // and our parent is a serial device bus device, bound to =
the synology microp core driver.
> > > > +        let parent =3D unsafe { dev.as_ref().parent_unchecked::<se=
rdev::Device<Bound>>() };
> > >=20
> > > Despite being accurate description, "assume" is not what you want to =
read for a
> > > safety justification. :)
> > >=20
> > > We don't want to directly access the serial device from this driver. =
Instead,
> > > there should be an abstraction layer of the resource you are accessin=
g.
> > >=20
> > > If this would be I2C or SPI you would request the regmap of the paren=
t at this
> > > point, e.g.
> > >=20
> > > 	dev.parent().regmap("led_registers")
> > >=20
> > > Now, this is a serial device, but regmap still works perfectly fine f=
or this
> > > case. It even allows you to ensure from the MFD driver to restrict th=
e LED
> > > driver of sending commands that are not LED specific by exposing a LE=
D specific
> > > regmap. Additionally, if you need additional locking etc. it can all =
be done
> > > within the regmap implementation, so you entirely avoid custom APIs.
> > >=20
> > > I'm not sure how common regmap is for serial devices to be honest, bu=
t
> > > apparently there are drivers doing this and I don't really see a reas=
on against
> > > it.
> > >=20
> > > For instance, there is drivers/iio/imu/bno055/, which is a chip that =
works on
> > > both serial and I2C busses and fully abstracts this fact with regmap.
> > How would this work with handling incoming data?
> >=20
> > For example, once the power button on the NAS device is pressed, the
> > serdev device would receive a `0x30` byte.
> >=20
> > Regmap seems like it can only do read and write after it has been
> > requested. No event handling.
>=20
> That's orthogonal, directly accessing the struct serdev doesn't help with=
 this
> either.
Before knowing about regmap, I just would have exposed a function once
needed, so the sub-device can register a function pointer with a unique
byte. Depending on what byte gets received, that function pointer is
called.

But now, this would still work but it bypasses regmap.

>=20
> Isn't this handled through IRQs, i.e. you device issues an IRQ and then y=
ou read
> from the serial bus?
>=20
> (I'm asking since such chips can usually be connected via different busse=
s, e.g.
> serial and I2C. And with I2C the slave can't issue a transfer by itself.)
>=20
> Other MFD drivers register their own IRQ chip for this. I.e. one would re=
gister
> an IRQ chip in the MFD driver and pass it to the sub-devices created thro=
ugh
> mfd_add_devices(). Then the sub-device receives an IRQ and reads the regm=
ap.
You mean registering a virtual IRQ and triggering it on data receival?

Could you provide an example driver in the tree?
>=20
> Now, if you don't have IRQs at all and the only event you get is through
> receive_buf() (which implies that the chip is only compatible with a seri=
al bus)
> this technically still works, but might be a bit overkill.
There is a physical IRQ, but the serial device bus abstracts that so
the driver only has the receive_buf() function. The driver it self is
not aware of an IRQs.

Having like a reverse regmap would be great (in addition), in which the
mfd device is the one who calls write and the sub-device has to handle
it. But I don't think something like this exists in the kernel.

Thanks
- Markus Probst

>=20
> In this case, maybe a monolithic driver would even be better; no idea whe=
re it
> would live though.
>=20
> > > In Rust a regmap will probably become a backend of the generic I/O
> > > infrastructure we are working on, which will also allow you to use th=
e
> > > register!() infrastructure, etc.
> > >=20
> > > register!() and some other generic I/O improvements will land this cy=
cle, I/O
> > > projections are more likely to land next cycle.
> > >=20
> > > > +        parent.write_all(
> > > > +            match self {
> > > > +                Self::Power(State::On) =3D> &[0x34],
> > > > +                Self::Power(State::Blink) =3D> &[0x35],
> > > > +                Self::Power(State::Off) =3D> &[0x36],
> > > > +
> > > > +                Self::Status(_, State::Off) =3D> &[0x37],
> > > > +                Self::Status(StatusLedColor::Green, State::On) =3D=
> &[0x38],
> > > > +                Self::Status(StatusLedColor::Green, State::Blink) =
=3D> &[0x39],
> > > > +                Self::Status(StatusLedColor::Orange, State::On) =
=3D> &[0x3A],
> > > > +                Self::Status(StatusLedColor::Orange, State::Blink)=
 =3D> &[0x3B],
> > > > +
> > > > +                Self::Alert(State::On) =3D> &[0x4C, 0x41, 0x31],
> > > > +                Self::Alert(State::Blink) =3D> &[0x4C, 0x41, 0x32]=
,
> > > > +                Self::Alert(State::Off) =3D> &[0x4C, 0x41, 0x33],
> > > > +
> > > > +                Self::Usb(State::On) =3D> &[0x40],
> > > > +                Self::Usb(State::Blink) =3D> &[0x41],
> > > > +                Self::Usb(State::Off) =3D> &[0x42],
> > > > +            },
> > > > +            serdev::Timeout::Max,
> > > > +        )?;
> > > > +        Ok(())
> > > > +    }
> > > > +}

--=-2I9HBOr2zxBJYLArSa0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmm2/q8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSXbYP/2AuK9WXrVVB3hNZgWTT
oRfJXj46J0WOOL/1ji4Bu4FAW8EW5hncS2D9s88NqwKARx/vm3hvTiIRC54Rgrzq
N0oiN1Sdb9b+xBsN3nLqY9kI4IDF+3l2/cSbUuidhnhtpjIE0AZNWq80wRJaXLcp
Y8Wqh6+qKKGhtTs0Rany9zS0Lon932HMf44H0p66UCrnGcgvB9x8KhNvcVOpPH2D
RCZyd2+q4cOOieJ6Y9WN4qvYfW/200hJQLPHMb6Hrk6zXdDKepxhWxltldO9+e4P
QtFo9S6adxZoZnSlRfG3hLr9tJt/ZAf/XKcGJWiNwxifciWWo7TNvUwIpzemeJh4
5++6Kjd0DOtsmPIZH9YVG3haCrO0Z3yMH7AAfa74OCeiCGDT9ABYEQFT2/I+VKHf
VgYaj9czxRNnSY6vikfKxrQj/kG1JhSpq+AsaZcbd3TddBzEIMxfLdY64XU0VzsN
7itKPh8aMXK8GythY0i0Xi9OZJdZWWnv32qmlJqpI3++lWYdrFahWboObM9nw5+T
8NDKWqAd1RUte95tzdK+L7w9QK8Nfi41jGfVe2kBRVD8qDo7WGkOmz3hW/7RxyQ8
ADq/4OuDMf7e51/YWO2AdYYY3m3vGilo0dBI/rH5NzGABjd3FHKprCimMoF1pPPl
yUhS0QlogeVswY85B6lZFN8N
=EBoQ
-----END PGP SIGNATURE-----

--=-2I9HBOr2zxBJYLArSa0T--

