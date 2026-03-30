Return-Path: <linux-leds+bounces-7594-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADbYGUTJymmL/wUAu9opvQ
	(envelope-from <linux-leds+bounces-7594-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 21:04:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B286A3601F0
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 21:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BCC0301983E
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 19:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E74139478F;
	Mon, 30 Mar 2026 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="AKdtk+GY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A4C3806A0
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 19:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897472; cv=none; b=pXPPfgQ6m14xP3Hy+nQ8+hdQh69mAjjS/E+SyXj1bohAVe4PnDI6vfOi7/h5stlc9R1cbaE5b5EZznQX88ugz8Aa5VA6f/uEBF2NAcG99E7ph273eAJa5+O4SSjEWC1MDPllAXidcmFcFjdaFX5zayF0TiHMjxvymOOBcQvWH70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897472; c=relaxed/simple;
	bh=vTUzfPlyzCfiGghUR4gkldg3AJPBk8infxB+0WXa76Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HT4TCOKKrMTNJghc5v3i04Z8ZHNNM1JpiX/P77EdnZW5PZpOe8Tr8tqibkdNPIpdyOu6JTYTtWJJV6J4UDuQ9lfv1KyHGfs10sfciJXUaqhpI2ml2RGpOU4i3R1/a1mapUnN3i+eix+kd94AFttAp36TaVHUxbZIuAVh219+gAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=AKdtk+GY; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 6F5B0240103
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 21:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1774897463; bh=ytK3t1UfL+JPyOX4mm+aWd1WNeFyxKaqMowBI4APBmA=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=AKdtk+GYXDv1kTpMDPuEbesFNDdz10qOxtMoA/UZQcaaYREDZIBHCr25ptAEOBrYj
	 Y3VrePUo9TSsdaTJYWNIms6xeQF3VXIavuHnawXb6hLo+ERKqtnYNefNJR5sN/jmSS
	 z2Gb5Acvp3Dx8z7cApqpIHvPp3ijiXl8oCn111bmKUPA6BK+DO9UknjgHmHuFqPb5c
	 f4f7OFLlH+XObXRkQUoHK5uv6QrvfM1j6fIWMgHEihmOfhFmZM2gDQZgyqYHCusnMZ
	 7NT7nZ2ZdQdhRpp0LjGV3O/PS7IWFoR3M15LhIJsxNlw+ESLluhfmaG/hXWYAU9I3A
	 uWiyhJJo1dzMw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fl0zQ2n7bz6twb;
	Mon, 30 Mar 2026 21:04:18 +0200 (CEST)
Message-ID: <e4b194028dcf25b943438615a83bce68b0949e5f.camel@posteo.de>
Subject: Re: [PATCH v5 2/4] ACPI: of: match PRP0001 in of_match_device
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
Date: Mon, 30 Mar 2026 19:04:21 +0000
In-Reply-To: <20260330-bipedal-invaluable-slug-0c6dea@quoll>
References: <20260329-synology_microp_initial-v5-0-27cb80bdf591@posteo.de>
		 <20260329-synology_microp_initial-v5-2-27cb80bdf591@posteo.de>
		 <20260330-bipedal-invaluable-slug-0c6dea@quoll>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ODROlHpAubiN0AJXruDg"
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
	TAGGED_FROM(0.00)[bounces-7594-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,posteo.de:email,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B286A3601F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-ODROlHpAubiN0AJXruDg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-30 at 09:00 +0200, Krzysztof Kozlowski wrote:
> On Sun, Mar 29, 2026 at 08:02:16PM +0200, Markus Probst wrote:
> > Export `acpi_of_match_device` function and use it to match for PRP0001
> > in `of_match_device`, if the device does not have a device node.
> >=20
> > This fixes the match data being NULL when using ACPI PRP0001, even thou=
gh
> > the device was matched against an of device table.
>=20
> Fixes tag?
>=20
> I don't see how this is going to fix !ACPI case - the
> acpi_of_match_device() will just return false.
While trying to argue I found out that there already is
`device_get_match_data`, which takes PRP0001 into account.

I will now instead make a patch, which will make rust use this function
instead of calling `of_match_device` and `acpi_match_device`
individually, which ignores PRP0001.

There are still a lot of drivers only using `of_match_device`, which
makes it impossible to use PRP0001 with them. But this is not relevant
for this driver.

Thanks
- Markus Probst

>=20
>=20
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  drivers/acpi/bus.c   |  7 ++++---
> >  drivers/of/device.c  |  9 +++++++--
> >  include/linux/acpi.h | 11 +++++++++++
> >  3 files changed, 22 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > index 2ec095e2009e..cd02f04cf685 100644
> > --- a/drivers/acpi/bus.c
> > +++ b/drivers/acpi/bus.c
> > @@ -831,9 +831,9 @@ const struct acpi_device *acpi_companion_match(cons=
t struct device *dev)
> >   * identifiers and a _DSD object with the "compatible" property, use t=
hat
> >   * property to match against the given list of identifiers.
> >   */
> > -static bool acpi_of_match_device(const struct acpi_device *adev,
> > -				 const struct of_device_id *of_match_table,
> > -				 const struct of_device_id **of_id)
> > +bool acpi_of_match_device(const struct acpi_device *adev,
> > +			  const struct of_device_id *of_match_table,
> > +			  const struct of_device_id **of_id)
> >  {
> >  	const union acpi_object *of_compatible, *obj;
> >  	int i, nval;
> > @@ -866,6 +866,7 @@ static bool acpi_of_match_device(const struct acpi_=
device *adev,
> > =20
> >  	return false;
> >  }
> > +EXPORT_SYMBOL_GPL(acpi_of_match_device);
> > =20
> >  static bool acpi_of_modalias(struct acpi_device *adev,
> >  			     char *modalias, size_t len)
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index f7e75e527667..128682390058 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/slab.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/acpi.h>
> > =20
> >  #include <asm/errno.h>
> >  #include "of_private.h"
> > @@ -26,8 +27,12 @@
> >  const struct of_device_id *of_match_device(const struct of_device_id *=
matches,
> >  					   const struct device *dev)
> >  {
> > -	if (!matches || !dev->of_node || dev->of_node_reused)
> > -		return NULL;
> > +	if (!matches || !dev->of_node || dev->of_node_reused) {
> > +		const struct of_device_id *id =3D NULL;
> > +
> > +		acpi_of_match_device(ACPI_COMPANION(dev), matches, &id);
>=20
> I don't think this should be done from of_match_device. Yuo will have
> soon recursive calls, because acpi_of_match_device() will call other
> match, that will call of_match_device() and so on...
>=20
> of_match_device() is supposed to match only against OF. Not ACPI. There
> should be no ACPI header or code in this unit file.
>=20
> Best regards,
> Krzysztof

--=-ODROlHpAubiN0AJXruDg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnKySMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPS1FsQALQhhOxKuOob5bBdgSqR
1jAGeLh0ZJh1BFoSfnWhmTMffN2X0XR0bAzVOK+gDkPmi3pL57DEYFtDHGq1nY+k
K8MvxVRzmJSOeHpDdzK7xvAiGv8mBiJxro3UUQN1NFGJKJjXSHvxxOFnNPc7Bvum
tzgfR8Th792AHLF9rVgU++T8xBOIlP4blzO37KQ7ES8AiYhq6hPunBnabqDS5hxS
7Imz3JpItOiugzyZtUGiWgQcYdKkQ9CD4k/u0g6+nNiegXktqq0Zapf0QOoCiDdC
PKzAn0XqokJLNzrtIdiBqoZxTZ5cNBNqtqF7Pat+wgDv4G3FqXmkCzpbnD0Tq59q
OWaNJkBSzHq8ndS1B0Xirt+OBPI/nU3TBOWFpLZXcYdq0Jaf2EbWKgODUP6n3h1c
EXPNiQDmcSk4XOvbSo/cVW49Rba4ETEEQ+RKZ4Y4v3gv6lCGBy1ofs3QNQonltei
xTwPa4GcRSRFsPV5v7zmT0rEW/0ApDJYEVF7tYzuHep2B/gTNlqmP7vIFq0T9USP
3RYK8CkWguEK44nymw7IxmRIY1AmTB9p4m2txKaVn9fWmGRGLiPes2ZdL/6B0l9l
0rl1T/riajKAz8tzw+nFFQBRzVoYBPZm0YbG+0/XbnjKHRLtF3YXsCUP2Mh/nKaN
5oo4Te6nipxVoIbTJgpRki18
=sUiq
-----END PGP SIGNATURE-----

--=-ODROlHpAubiN0AJXruDg--

