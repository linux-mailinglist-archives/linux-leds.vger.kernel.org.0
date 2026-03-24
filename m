Return-Path: <linux-leds+bounces-7466-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFqvKuu+wmmjlQQAu9opvQ
	(envelope-from <linux-leds+bounces-7466-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 17:42:19 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354D3193CF
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 17:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0C5E302AC35
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 16:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D47F3FA5E2;
	Tue, 24 Mar 2026 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="lGrH3waM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3F83EF678
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369587; cv=none; b=lWHDS+f7cl035hjrW6t9qKBO0f+t8sEC/KVGHr1rgDUpwPhs/hAxtPJiGQHn7WUS/piyWKyZ2crSzG5RCXQkT/6oNpD7U2QBtqD4LgEOtDX+lb3xFaHLEtAqX1j50APtM9lcgkes9t5cNPcXUYwtjx90sFnDaHH9HqPych5EJbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369587; c=relaxed/simple;
	bh=pVUTaBu37BYx90oCxlbexCq4J36a+37O4snWHTnZVAo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aKWYaLmJnefXn8oSGuTNaHty1jryB3ktd6rxp4gTBpOcnSkwAoCsbXZLkmTgMUURKZsauvA00UaaKthfUgmHtNqg/SOeNXfwjNVwoge5vO5FSKbhK/d8m1fHl3CaB7jkHcJ6EAcRalpX/bdglo9S0LzxNpco52cazr1ybcxf5nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=lGrH3waM; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C661B24002B
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 17:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1774369583; bh=wqgxFZDx8NKk35yL7sq848BORVfYKSYBLLwEcNFnzGs=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=lGrH3waMH+eiUtfIrYZcEvOJtdAo7MF30he7DyEUToTxUjBeQUOpdXK1x6tmGige7
	 DzWMBVFMTv31fXmJZ1Ea6mukG9WHR1icnSBrApue/NwAhSntxps60vbkugHHw/rQlb
	 ZV50VJgSl1fKjtIOWvWDnhtXJF/fXgFxGVcP4d1PzHFlb8IzZMzWNc/995wAkcfuC4
	 YwyIp92Ytau1qFSJamnuXK5utNOuMmWMniR4sUFak3TiVCTrUifabkDgEno3MepS0W
	 9fT9SCoT3yTUrJgwEHp5unJQJ/lXVzzP4DzEzteh9zUk2IuUc96egCT9gNmuSO4dyp
	 4aLQRnci/cjDg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fgFlt56SSz6tws;
	Tue, 24 Mar 2026 17:26:18 +0100 (CET)
Message-ID: <f32aba79b98b357487c44e1952e536051fcd7a51.camel@posteo.de>
Subject: Re: [PATCH v3 3/7] acpi: add acpi_of_match_device_ids
From: Markus Probst <markus.probst@posteo.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng	 <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Igor
 Korotin	 <igor.korotin.linux@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Robert Moore
 <robert.moore@intel.com>, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, 	linux-pci@vger.kernel.org,
 linux-leds@vger.kernel.org, 	linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev
Date: Tue, 24 Mar 2026 16:26:22 +0000
In-Reply-To: <CAJZ5v0jHQ7sHJ8SV25p2gQugC-a8f9oVFarS17NXwPzGOJUD0Q@mail.gmail.com>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
	 <20260313-synology_microp_initial-v3-3-ad6ac463a201@posteo.de>
	 <CAJZ5v0jxHO2EH5NeEsMkxGz5xqVL00tO-W1JpaVd=GhwgQ3T=A@mail.gmail.com>
	 <e8ffc9902c0af24ce6fde2d8712ea588b36e9194.camel@posteo.de>
	 <CAJZ5v0jHQ7sHJ8SV25p2gQugC-a8f9oVFarS17NXwPzGOJUD0Q@mail.gmail.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4WIOjhy6PzINbUusth1I"
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
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-7466-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:dkim,posteo.de:email,posteo.de:mid]
X-Rspamd-Queue-Id: 4354D3193CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-4WIOjhy6PzINbUusth1I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-03-24 at 17:01 +0100, Rafael J. Wysocki wrote:
> On Tue, Mar 24, 2026 at 4:30=E2=80=AFPM Markus Probst <markus.probst@post=
eo.de> wrote:
> >=20
> > On Mon, 2026-03-23 at 20:57 +0100, Rafael J. Wysocki wrote:
> > > On Fri, Mar 13, 2026 at 8:03=E2=80=AFPM Markus Probst via B4 Relay
> > > <devnull+markus.probst.posteo.de@kernel.org> wrote:
> > > >=20
> > > > From: Markus Probst <markus.probst@posteo.de>
> > > >=20
> > > > Add a function to match acpi devices against of_device_ids. This wi=
ll be
> > > > used in the following commit ("mfd: match acpi devices against PRP0=
001")
> > > > to match mfd sub-devices against a of compatible string.
> > >=20
> > > Please always spell ACPI in capitals in patch subjects, comments,
> > > changelogs, etc.  It is not a regular word.
> > Ok.
> > >=20
> > > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > > ---
> > > >  drivers/acpi/bus.c      | 7 +++++++
> > > >  include/acpi/acpi_bus.h | 2 ++
> > > >  2 files changed, 9 insertions(+)
> > > >=20
> > > > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > > > index f6707325f582..5ddcc56edc87 100644
> > > > --- a/drivers/acpi/bus.c
> > > > +++ b/drivers/acpi/bus.c
> > > > @@ -1044,6 +1044,13 @@ int acpi_match_device_ids(struct acpi_device=
 *device,
> > > >  }
> > > >  EXPORT_SYMBOL(acpi_match_device_ids);
> > > >=20
> > >=20
> > > Missing kerneldoc.
> > The same amount of kerneldoc as `acpi_match_device_ids`, if I am not
> > mistaken.
> > >=20
> > > > +int acpi_of_match_device_ids(struct acpi_device *device,
> > > > +                         const struct of_device_id *ids)
> > > > +{
> > > > +       return __acpi_match_device(device, NULL, ids, NULL, NULL) ?=
 0 : -ENOENT;
> > > > +}
> > > > +EXPORT_SYMBOL(acpi_of_match_device_ids);
> > >=20
> > > Are you aware of the consensus that using PRP0001 in production
> > > platform firmware will be regarded as invalid?
> > >=20
> > > Because of that, it is not an option for a driver to avoid providing
> > > ACPI match data on a platform that uses ACPI.
> > First of all, the driver that would have made use of it has been
> > restructed to not use mfd subdevices. It would not be affected anymore
> > through this patch set.
>=20
> So what exactly would be affected by it?
I won't have a use for myself anymore, but I still think the patch is
useful. Anyway,

MFD Devices without an assigned ACPI ID, if they are present on devices
with ACPI platform firmware.

>=20
> > Not sure if I should still send it as its own patch series though.
That is why I asked this question (see 1. sentence in the paragraph
above).

> >=20
> > The device of the driver has no ACPI ID allocated by the manufacturer,
> > as it is only used on a proprietary Linux OS (with their own modified
> > kernel).
>=20
> Do I understand correctly that there is an ACPI platform firmware on
> the board, but it doesn't enumerate the given device properly (that
> is, as an ACPI device object with a specific device ID)?
There is only a serial device in the ACPI platform firmware.
The device connected to the bus isn't specified.
>=20
> In which case there probably is a driver that can find that device
> somehow (it has hardcoded resources or similar).
Yes, that driver has `filp_open("/dev/ttyS1")` hardcoded.
>=20
> > The driver would have only been useful via device tree or an ACPI
> > Overlay.
>=20
> Do you mean a custom SSDT loaded via configfs or something else?
Yes, in my case via initrd.

>=20
> > Obviously, I don't have a PNP or ACPI Vendor ID, so I can't
> > assign one. The parent/main driver does only have a of compatible id.
> > As it needs to use PRP0001 anyway on ACPI, I thought it makes more
> > sense to also use PRP0001 there instead of matching it with a _ADR
> > which is "a grey area in the ACPI specification".
>=20
> You can't match a device with _ADR.  By itself, _ADR doesn't provide
> you with any information on the device in question, it only helps to
> connect it to some information that can be collected by other means.
> The role of it, at least in principle, is to allow some device objects
> in the ACPI hierarchy to be associated with devices enumerated by
> other means (like on a PCI bus).
This patch affects mfd devices. A bus device can via mfd register child
devices and those child devices will be matched to a fwnode if
available.

According to commit 98a3be44ffa67b812de7aa7aed9f2331edcfb1a5, there is
a board on the market with a sub-device that will be matched using _ADR
[1].

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D98a3be44ffa67b812de7aa7aed9f2331edcfb1a5

>=20
> The enumeration with the help of PRP0001 only works if there is a
> device object in the ACPI hierarchy and its _HID is PRP0001 or its
> _CID list contains PRP0001, there is a _DSD under it and a
> "compatible" property is returned by that _DSD.  Who's going to
> provide all of that for the given device?
A ACPI Overlay would do that.

>=20
> Moreover, if the device has some resources that the kernel needs to
> know about, there should be a _CRS under the device object in question
> and the resources should be listed there.  Or how are the resources
> going to be found otherwise?
Resources in mfd are usually handled by the parent device, not the mfd
child device. But yes, it would be using _CRS if any.

Thanks
- Markus Probst

--=-4WIOjhy6PzINbUusth1I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnCuygbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSFtwP/1LgDwm20IUO598xZFkV
t4Mp7zD16XTW4IGjuI5P9vUJCsMy/HFAVv6lW8b0bOalqzmzYjG9Ygxs5SBt4FAT
mu89voTYbjRdncUvN35nDbe/L0g7PTu3wMUd4rvOrbtFuNjhh9nX3C/DVfpEnBaH
wqLkHQ9apa7hu7F8cb9RetQp/5MTFBOjAxFsY+wUhnnjtdVF+ZWaQ2wNHV++7YLE
vSYzAa9GatYERBvUBmex1dssbl1rzzSojatgmbOXSL3+d7hBYfu1Flw9pdz7Fi1s
jQmiR1QP3ogEhj12IDtv3kYbNgtaHLCLFyHu2N7HCw/raOj8NSrtwH3wxkJL55vg
5dNY66UEYGtSh4g/5XY8fXY32AWfLzFn7OxqsGhp0fw7tMrz40orIWcN428tLp9N
PMfmofgv/6DIPBEITMUq1NmW0olkTRtRgg1H3AcYHd+YUfSA9uiC6nfrnZ2cb+E0
to803zAsfF7zXH51zNKrjB8zHP1F7WH7zwQk+4bNztZvpeze+QTxblEkl2s8I05k
6mI5GPEAWOQJ3BUGplQF4H3FA01SA/vomcNCJdQxhEQ31K8dsUyLNIymncSKvNZn
yTVwnEAGTohJ9Ln0EMf0N/7d3LwOGATawIqjjosQgEZuDaS3kiLrmRtmspT8qgLw
lYR2j/I03tOeDL0m0AMnCYqa
=0hMF
-----END PGP SIGNATURE-----

--=-4WIOjhy6PzINbUusth1I--

