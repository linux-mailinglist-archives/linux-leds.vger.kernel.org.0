Return-Path: <linux-leds+bounces-7464-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IlUH7axwmmRkwQAu9opvQ
	(envelope-from <linux-leds+bounces-7464-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 16:45:58 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B274131850D
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 16:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48CF6306A048
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 15:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FC0407567;
	Tue, 24 Mar 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Ynlwaq5R"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A06402456
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366250; cv=none; b=tRBY6WDDfeRzRYZ2XlE9hod4Wf7MoNdi/8uxbHlgH1vgAT+VuWHLg+sJ82obKkFmhN7sltn0BA9T8u4oCOdHbp4hFg0skl1/XNkIrpCG4goTLkdYD1Kz1B99pIf+uQgO3QWklM4+diGJot/bXmngqjbWQjm1UCJt+QurV8eqRZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366250; c=relaxed/simple;
	bh=AFkZQoQFstyy/dwGWmvovM3jX8wDVNpwJfI/V0n4b9I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p72zOSi8FtnpxkMcVn5ZdiVThBzQb+PpBHRuOk0YMJl8Vy8rGObtOpiGa2lMzMz4zpCAsYc5AFxca0m8hcC+OwuFXHIsPHqcibEKm5quYDCRhwEyKzNuEbumjg8H77bKPsXDihpTRy0AytDrYMzxXEh6HmYJGsEo2p4FdFCyMCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Ynlwaq5R; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8B56D240101
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 16:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1774366240; bh=TdylBglHESQc63FZeWoNveBg2huikViD/E4pJuXNAd4=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=Ynlwaq5R0ESX6LDeft9LnAiYXA55D3EDEayHUkezmna3qfAEktqtHUCdzBu00qq2t
	 UDe5m3kqzeDopoQW0f6GUZZSONrl1C+b2F7WxzUwrckaDl5Vm6KY6XXOkn0vcXpg8c
	 0NnWgqCA4HI5QuRbbDH/QEwk2ONOPE7jqmCHumShq3pdfHLnnwAq+rS7OiXDnj5WT/
	 qA08qtIGK2rKrOKWUK4Nx+HJNqrVrQehT/bFYdLr/U9OB8qyNVENF/mP2imNA0wXr6
	 QfuQaYDoa8tr5IO5oOnQaVhrWR8EFlHS7zHsr92AQFMZn8jqBlfkk4CSZuu3eQuFQi
	 QkxvpTlzud16w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fgDWb08gfz6tsf;
	Tue, 24 Mar 2026 16:30:34 +0100 (CET)
Message-ID: <e8ffc9902c0af24ce6fde2d8712ea588b36e9194.camel@posteo.de>
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
Date: Tue, 24 Mar 2026 15:30:38 +0000
In-Reply-To: <CAJZ5v0jxHO2EH5NeEsMkxGz5xqVL00tO-W1JpaVd=GhwgQ3T=A@mail.gmail.com>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
	 <20260313-synology_microp_initial-v3-3-ad6ac463a201@posteo.de>
	 <CAJZ5v0jxHO2EH5NeEsMkxGz5xqVL00tO-W1JpaVd=GhwgQ3T=A@mail.gmail.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-eySGLK0BCKOzVjRv4LWn"
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-7464-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,posteo.de:dkim,posteo.de:email,posteo.de:mid]
X-Rspamd-Queue-Id: B274131850D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-eySGLK0BCKOzVjRv4LWn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-23 at 20:57 +0100, Rafael J. Wysocki wrote:
> On Fri, Mar 13, 2026 at 8:03=E2=80=AFPM Markus Probst via B4 Relay
> <devnull+markus.probst.posteo.de@kernel.org> wrote:
> >=20
> > From: Markus Probst <markus.probst@posteo.de>
> >=20
> > Add a function to match acpi devices against of_device_ids. This will b=
e
> > used in the following commit ("mfd: match acpi devices against PRP0001"=
)
> > to match mfd sub-devices against a of compatible string.
>=20
> Please always spell ACPI in capitals in patch subjects, comments,
> changelogs, etc.  It is not a regular word.
Ok.
>=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  drivers/acpi/bus.c      | 7 +++++++
> >  include/acpi/acpi_bus.h | 2 ++
> >  2 files changed, 9 insertions(+)
> >=20
> > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > index f6707325f582..5ddcc56edc87 100644
> > --- a/drivers/acpi/bus.c
> > +++ b/drivers/acpi/bus.c
> > @@ -1044,6 +1044,13 @@ int acpi_match_device_ids(struct acpi_device *de=
vice,
> >  }
> >  EXPORT_SYMBOL(acpi_match_device_ids);
> >=20
>=20
> Missing kerneldoc.
The same amount of kerneldoc as `acpi_match_device_ids`, if I am not
mistaken.
>=20
> > +int acpi_of_match_device_ids(struct acpi_device *device,
> > +                         const struct of_device_id *ids)
> > +{
> > +       return __acpi_match_device(device, NULL, ids, NULL, NULL) ? 0 :=
 -ENOENT;
> > +}
> > +EXPORT_SYMBOL(acpi_of_match_device_ids);
>=20
> Are you aware of the consensus that using PRP0001 in production
> platform firmware will be regarded as invalid?
>=20
> Because of that, it is not an option for a driver to avoid providing
> ACPI match data on a platform that uses ACPI.
First of all, the driver that would have made use of it has been
restructed to not use mfd subdevices. It would not be affected anymore
through this patch set. Not sure if I should still send it as its own
patch series though.

The device of the driver has no ACPI ID allocated by the manufacturer,
as it is only used on a proprietary Linux OS (with their own modified
kernel).

The driver would have only been useful via device tree or an ACPI
Overlay. Obviously, I don't have a PNP or ACPI Vendor ID, so I can't
assign one. The parent/main driver does only have a of compatible id.
As it needs to use PRP0001 anyway on ACPI, I thought it makes more
sense to also use PRP0001 there instead of matching it with a _ADR
which is "a grey area in the ACPI specification".

Thanks
- Markus Probst

>=20
> > +
> >  bool acpi_driver_match_device(struct device *dev,
> >                               const struct device_driver *drv)
> >  {
> > diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> > index aad1a95e6863..0081b9e4aaee 100644
> > --- a/include/acpi/acpi_bus.h
> > +++ b/include/acpi/acpi_bus.h
> > @@ -677,6 +677,8 @@ void acpi_bus_trim(struct acpi_device *start);
> >  acpi_status acpi_bus_get_ejd(acpi_handle handle, acpi_handle * ejd);
> >  int acpi_match_device_ids(struct acpi_device *device,
> >                           const struct acpi_device_id *ids);
> > +int acpi_of_match_device_ids(struct acpi_device *device,
> > +                         const struct of_device_id *ids);
> >  void acpi_set_modalias(struct acpi_device *adev, const char *default_i=
d,
> >                        char *modalias, size_t len);
> >=20
> >=20
> > --
> > 2.52.0
> >=20
> >=20

--=-eySGLK0BCKOzVjRv4LWn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnCrg8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSyJcQAIdNJxt+dh0p+HWg0EJ9
4dysXiahWSceToUh6b1YoYF6bXQgR3mj5iMzdOsPoz4uBiqdFPMSHUPFKAzEVdSS
7Zi58NGMSHCugtmIHre8yar2oTK9/e7OnDZTxCq9OjbaTJ+jfQvLQGRdavTYWcDe
6rARxxz/boxlb0Un9L0WGpzw8D7qiwRBRuTgxmZkSREQ8mXFw6cVzp62CaGcjV9Q
qIgCPBzIZqH/wWzEoFHnzeHSkGqJa02ymTWfJuP2VIsUiCrcvJG0v1pYsyjXAFKB
UsxAclnJAwJDFQWQT/F/g76qOmmbpqFTr3AqMgTvD2HVk1FF5N0jQJOXsHYsNdYL
JAcXa3NDsNoi/Or50Sth0fYQ73204cR9uP6guEQ2UWkOh5AIvSy1ksGwqjPngCcA
f2iQPeabC4is4rxtmbWFubNBk+16qxSWOG36T4pHvQhmlafsHE823RyFQdGerUNd
D2dKR1Q1u/9+OHGcFs/ryDxNHuNue/3gGnhhcnumXZH7sIljW/RnEd/7eIyH+owa
2u0w+hCm9l9jqTxheBBVxVSsoi4KBkTcPXiFa+BMjdrBi5lKu3DeEFb+WLEed+dj
OmAovcBDv7hgCb3K59nJqhAUScLbILd0+vuqSwZJdZcJDO85ab/gyjPbOxsdWeci
3gGSzxYlCbtFh+SyAe9dnCel
=H6Zp
-----END PGP SIGNATURE-----

--=-eySGLK0BCKOzVjRv4LWn--

