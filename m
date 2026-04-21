Return-Path: <linux-leds+bounces-7795-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC4BAyTA52l4AQIAu9opvQ
	(envelope-from <linux-leds+bounces-7795-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 20:21:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EEC43E9E9
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 20:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F780300DE13
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 18:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5ED736C0C3;
	Tue, 21 Apr 2026 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="cbMHcumn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152BC36682A
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795673; cv=none; b=MmnrnBqRoi4pZcv8pqk+V1SzbP41duXLhwW3+lVcIrsIt1X4mLK9qAvMHuO8yEHGFfrDSEAi26B+k1GQOiUKpe0sS80CIfzK//naFW50NitgXYliAwRy7o9vNaRhrdspUgX5jb7H4l5xtf2P869VQjHK1ds90Zs7/vDqBvopPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795673; c=relaxed/simple;
	bh=gonGUWFelxszykYxOzjSkjAwkcd2qMXzIcJlIAN3qFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VNqJR5gLnQthNON2f/3If5QjKW9tUe27Y9PRIlg8QsyBfnlFC2nMOlAaECyP2hrxKyOWWpu4v2ToyS74TzLoLmINuUBzPjSbGlXazpOkd9i75DHjs/GmdJxk/DrEoEj0VsYiPpTe1UbAkZkASkXT7aA8XQ7IaDn5BE1SM0sXaWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=cbMHcumn; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id ECFC1240101
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 20:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1776795662; bh=C/oJgQfWWd/jGp5yfN1PJd6FUioSFnU2ZG8OWwl+iGo=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=cbMHcumnZMcKRvevvUsgUAdC8nZ7hHOJ/Nr3Z0P8C75BnLDGyjxvw/KYl/Kx17WC9
	 Ugxf+7mdEVaXIJais0G7iAyirXohvtOnVwWLrAqgeGyyjHU+Bzjp/9Qzb7wpsmnIje
	 6hudG+o0GxIRNpNe+C3oYng52iCIbQxVCxeyhX2h69Ex3OuW4Yxb6pgIzJ25Qgi/DO
	 kOLXA6zjCxhrMZ1OSwpJMB62LeR9ROKIWDE9rWY9mOaSBgXK71tlCo+n25VUwHoN8Y
	 UKjpfpehskI3ZAfcGLzVhBB78N/R1AqTpy2v9P+x/h6OeCQb4D788iZqCw8hCdgJbm
	 YSzghkLJ6SJKg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g0VzC2xx9z9rxD;
	Tue, 21 Apr 2026 20:20:55 +0200 (CEST)
Message-ID: <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, Pavel Machek	
 <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>,  Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, 	linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, LKML	 <linux-kernel@vger.kernel.org>,
 rust-for-linux@vger.kernel.org
Date: Tue, 21 Apr 2026 18:20:56 +0000
In-Reply-To: <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
	  <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
	  <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com>
	 <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
	 <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/DrOBbpeSagm7M9Y8uvV"
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
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7795-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Queue-Id: 65EEC43E9E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-/DrOBbpeSagm7M9Y8uvV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 21:10 +0300, Ilpo J=C3=A4rvinen wrote:
> On Tue, 21 Apr 2026, Markus Probst wrote:
>=20
> > On Tue, 2026-04-21 at 14:59 +0300, Ilpo J=C3=A4rvinen wrote:
> > > On Mon, 20 Apr 2026, Markus Probst wrote:
> > >=20
> > > > Add a initial synology microp driver, written in Rust.
> > > > The driver targets a microcontroller found in Synology NAS devices.=
 It
> > > > currently only supports controlling of the power led, status led, a=
lert
> > > > led and usb led. Other components such as fan control or handling
> > > > on-device buttons will be added once the required rust abstractions=
 are
> > > > there.
> > > >=20
> > > > This driver can be used both on arm and x86, thus it goes into the =
root
> > > > directory of drivers/platform.
> > > >=20
> > > > Tested successfully on a Synology DS923+.
> > > >=20
> > > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > > ---
> > > >  MAINTAINERS                                        |   6 +
> > > >  drivers/platform/Kconfig                           |   2 +
> > > >  drivers/platform/Makefile                          |   1 +
> > > >  drivers/platform/synology_microp/Kconfig           |  13 +
> > > >  drivers/platform/synology_microp/Makefile          |   3 +
> > > >  drivers/platform/synology_microp/TODO              |   7 +
> > > >  drivers/platform/synology_microp/command.rs        |  54 ++++
> > > >  drivers/platform/synology_microp/led.rs            | 281 +++++++++=
++++++++++++
> > > >  drivers/platform/synology_microp/model.rs          |  49 ++++
> > > >  .../platform/synology_microp/synology_microp.rs    | 110 ++++++++
> > > >  10 files changed, 526 insertions(+)
> > > >=20
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index c1c686846cdd..49f08290eed0 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -25555,6 +25555,12 @@ F:	drivers/dma-buf/sync_*
> > > >  F:	include/linux/sync_file.h
> > > >  F:	include/uapi/linux/sync_file.h
> > > > =20
> > > > +SYNOLOGY MICROP DRIVER
> > > > +M:	Markus Probst <markus.probst@posteo.de>
> > >=20
> > > You should probably add:
> > >=20
> > > L:	platform-driver-x86@vger.kernel.org
> > >=20
> > > Through which tree the patches to this driver are generally expected =
to be=20
> > > picked up?
> >=20
> > I suppose platform-drivers-x86.
>=20
> Okay (with the platform drivers maintainer hat on). Just don't expect me=
=20
> to have deep Rust knowledge.
>=20
> > The driver itself can be used both on
> > x86 and arm64. Although I also have seen Synology devices with PowerPC
> > (no device with PowerPC is supported in the driver yet).=20
>=20
> In practice platform drivers scope has already expanded beyond x86 so the=
=20
> platform-drivers-x86 list naming is just a historic artifact.
Does this also include the drivers/platform/x86 folder?

Because of the multiple architectures, I put it into the root, i. e.
drivers/platform/synology_microp/

Is this fine or should I move it into drivers/platform/x86 ?

>=20
> > > > +S:	Maintained
> > > > +F:	Documentation/devicetree/bindings/embedded-controller/synology,=
ds1825p-microp.yaml
> > > > +F:	drivers/platform/synology_microp/
> > > > +
> > > >  SYNOPSYS ARC ARCHITECTURE
> > > >  M:	Vineet Gupta <vgupta@kernel.org>
> > > >  L:	linux-snps-arc@lists.infradead.org
>=20
> > > > diff --git a/drivers/platform/synology_microp/TODO b/drivers/platfo=
rm/synology_microp/TODO
> > > > new file mode 100644
> > > > index 000000000000..1961a33115db
> > > > --- /dev/null
> > > > +++ b/drivers/platform/synology_microp/TODO
> > > > @@ -0,0 +1,7 @@
> > > > +TODO:
> > > > +- add missing components:
> > > > +  - handle on-device buttons (Power, Factory reset, "USB Copy")
> > > > +  - handle fan failure
> > > > +  - beeper
> > > > +  - fan speed control
> > > > +  - correctly perform device power-off and restart on Synology dev=
ices
> > >=20
> > > Is this TODO list really needed within the kernel distribution?
> >=20
> > Not really. Although it indicates the current state of the driver.
> >=20
> > > If you planning on add these features (relatively) soon yourself (per=
haps=20
> > > depending on when the rust infra required for these features becomes=
=20
> > > available), the list would not be that useful for other developers at=
 all.
> >=20
> > Yes. Also I haven't seen anyone work on input, hwmon, reboot/sysoff
> > rust abstractions yet, so I will likely need to add those as well.
>=20
> Lets not include the TODO file then.
>=20
> > > > +/// Blink delay measured using video recording on DS923+ for Power=
 and Status Led.
> > > > +///
> > > > +/// We assume it is the same for all other leds and models.
> > > > +const BLINK_DELAY: usize =3D 167;
> > >=20
> > > On C side time related consts are required to include the unit in the=
ir=20
> > > name. Perhaps Rust code should also follow this convention?
> >=20
> > How about `const BLINK_DELAY: Msecs` ? The unit would be implied
> > through the already existing type alias `kernel::time::Msecs` for u32.
>=20
> I don't have opinion on this with my limited Rust knowledge (it just=20
> stuck to my eye how non-specific that original one looked). If Rust=20
> can do things even better as Miguel seems to imply, please look at those=
=20
> directions.
Delta stores it in nano seconds, so it will require an additional
`.as_millis()` call on use. I assume rust will optimize that out, so it
will be fine. I will use the `Delta` type like Miguel suggested in the
next revision.

Thanks
- Markus Probst

--=-/DrOBbpeSagm7M9Y8uvV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnnwAYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSWzwQAI3l8zxWaUGEVBfclX9q
J/Ftoch/B/4UBzZmlidOd/9Y7mArF22pTscKE+tYXLpgF9co4z/+Ca2tjy6Sy9tI
xgDAz3c0vDcCFKfcWIzEUCd5a7pxXBCPnIIZFMA2K0XPOWvplPRn94iFZgTFw2Vl
3Zf3fcfJxGKIzL74xSXqkRSAyPacxK7BEdnx75gJ1RPA3WKam/Bx5Q3KFpy2HZ79
33+FP6srgPfHEH/YgZOkFGiiDI8WkygHHzYG5tROmVej4FjL8fG6+qGIBf0rkjdv
ahY8pwOzQ7wg5jLIeDChtIH6cGqQJS8fzwo4Lo8S130+VIN4vuAi7nbqEwqGLi8u
b0Dq46H4HoXKJVmh3IAUJ8B0kTKk3NO+tY6vLvmCkbMzyjrMHPdQA1MBsipmFlF0
tNmdKO4y+SSaYnJr3FYykawWEL0LCYdxgChjXxCSo2LCzzMF/IbMztT2DA/kT7B4
8YfRaiZ8WBtrEMx802cbLZZjbbVdZjtrY5kdJH9dE8rsBQaS6y71tmV1tor7MLdz
TiaflzFGRAzWcHDscqpu55NyQKSJkIH8ycDlmypee7PZkeIaPrtfMylY0M5CZlTQ
T+vxWNTMU09KgQreRiVBQB8zZzzzyPq537ABvTx+MB8W+H5KQ97buUQdmp/ny0Bi
woszAcWw8ZxNu8UYDlCqok4E
=K33Q
-----END PGP SIGNATURE-----

--=-/DrOBbpeSagm7M9Y8uvV--

