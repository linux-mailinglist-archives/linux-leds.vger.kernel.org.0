Return-Path: <linux-leds+bounces-7465-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGAGL9K3wmlilAQAu9opvQ
	(envelope-from <linux-leds+bounces-7465-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 17:12:02 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DB318C18
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 17:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6EE13028F41
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 16:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B8F38C42C;
	Tue, 24 Mar 2026 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVB21Fo+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C13264617
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368092; cv=none; b=mpvh3Fd9o38cMEVy/fsB8thZXniQXewLyknBiqOdjhQYUe339R/dNwa2UyUYTIm+kc8xs4qe9g/bFP+wr3wCSMHbu855TQUs2zfkYy2PLG14wZcevJXPoZ9exWRjle9dlXdHzQSYoRYL4SVb7gL6wjqG4plMHcRInorLCJSb9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368092; c=relaxed/simple;
	bh=MOGi0JV4ZNfOjsgGZ/ADIOJMY48no6lV8jCg7ewXSzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzKB971X0AXIvJz4oynwLHw7Mp5E9d/GBqj53xNy/FV0TGaLydXu1LzIUc+vWRW11STL8UyM/UdvHbIAuznUazvY10xV6xHo3BB2p7t41gSdfoyzcmHNsYr5wlYG1Lv8mXvthXplqp5sfjnmIpg18fNJ7cJtu0ZWXtr03VI9Nyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVB21Fo+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1A1C2BCC6
	for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774368092;
	bh=MOGi0JV4ZNfOjsgGZ/ADIOJMY48no6lV8jCg7ewXSzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WVB21Fo+O7Zs4Oyj5si2An9Ps3ebguksgeeeAwqr5CdHTpYmG5KtIl0L1kUJHClLe
	 A1Jg/FHuxnUb61zK7vHr8QFMmvLHdz8DzSAxDTPu8UnQj0lydb86oEfUlxY0vw6vB6
	 XlsE/twIe/x3aABUmcoiSjeFY9Wqq0fIySzwiDF1UBtyj40VZljwFVkGrEJa39xk4C
	 Ic3BcECZC0rbSZtKBilR1TX6m8RFstHQhT9usYUKDIAxnRSAxLE7SVnCK310fbch14
	 xbQSV8BVCugqunqe9XCJvojwkCSe0w2NPzP3g8UJzqYcVQyMY7P0o2CO/jhNUpCR0Q
	 YU080OQi7cxkg==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4042905015cso2256851fac.0
        for <linux-leds@vger.kernel.org>; Tue, 24 Mar 2026 09:01:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvP8oZM1QMnyJHO45aj0ap1kgQGsfMQ710V88IEq/p+sHeSkYk8e+5RIw5Z/e8ADHi2lJwvlFJ9O1B@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdQhn+iNWJcL7tNMkmZFy+olJJRTUgWu4ORPUO3JmX9VM7HiD
	A9UuXBeWF80bvpKJXK2HEf40WPuKs6ZiArJ0ba6pslaEPwwCwUWDQePcKutbtorbcjdMt7pkzeu
	AcV2GctrPGolnmvX6r8iZJLpwfv8hTZg=
X-Received: by 2002:a05:6870:40ca:b0:41c:5ea1:b4e with SMTP id
 586e51a60fabf-41ca6bd33camr136194fac.0.1774368091372; Tue, 24 Mar 2026
 09:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
 <20260313-synology_microp_initial-v3-3-ad6ac463a201@posteo.de>
 <CAJZ5v0jxHO2EH5NeEsMkxGz5xqVL00tO-W1JpaVd=GhwgQ3T=A@mail.gmail.com> <e8ffc9902c0af24ce6fde2d8712ea588b36e9194.camel@posteo.de>
In-Reply-To: <e8ffc9902c0af24ce6fde2d8712ea588b36e9194.camel@posteo.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 24 Mar 2026 17:01:18 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jHQ7sHJ8SV25p2gQugC-a8f9oVFarS17NXwPzGOJUD0Q@mail.gmail.com>
X-Gm-Features: AQROBzDv-gLIyLVlaLI4MGuXPvB1psB6PmnWZDRsERdSTCHkDpp6XRnBMFQQ9_4
Message-ID: <CAJZ5v0jHQ7sHJ8SV25p2gQugC-a8f9oVFarS17NXwPzGOJUD0Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] acpi: add acpi_of_match_device_ids
To: Markus Probst <markus.probst@posteo.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7465-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,posteo.de:email]
X-Rspamd-Queue-Id: D27DB318C18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 4:30=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> On Mon, 2026-03-23 at 20:57 +0100, Rafael J. Wysocki wrote:
> > On Fri, Mar 13, 2026 at 8:03=E2=80=AFPM Markus Probst via B4 Relay
> > <devnull+markus.probst.posteo.de@kernel.org> wrote:
> > >
> > > From: Markus Probst <markus.probst@posteo.de>
> > >
> > > Add a function to match acpi devices against of_device_ids. This will=
 be
> > > used in the following commit ("mfd: match acpi devices against PRP000=
1")
> > > to match mfd sub-devices against a of compatible string.
> >
> > Please always spell ACPI in capitals in patch subjects, comments,
> > changelogs, etc.  It is not a regular word.
> Ok.
> >
> > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > ---
> > >  drivers/acpi/bus.c      | 7 +++++++
> > >  include/acpi/acpi_bus.h | 2 ++
> > >  2 files changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > > index f6707325f582..5ddcc56edc87 100644
> > > --- a/drivers/acpi/bus.c
> > > +++ b/drivers/acpi/bus.c
> > > @@ -1044,6 +1044,13 @@ int acpi_match_device_ids(struct acpi_device *=
device,
> > >  }
> > >  EXPORT_SYMBOL(acpi_match_device_ids);
> > >
> >
> > Missing kerneldoc.
> The same amount of kerneldoc as `acpi_match_device_ids`, if I am not
> mistaken.
> >
> > > +int acpi_of_match_device_ids(struct acpi_device *device,
> > > +                         const struct of_device_id *ids)
> > > +{
> > > +       return __acpi_match_device(device, NULL, ids, NULL, NULL) ? 0=
 : -ENOENT;
> > > +}
> > > +EXPORT_SYMBOL(acpi_of_match_device_ids);
> >
> > Are you aware of the consensus that using PRP0001 in production
> > platform firmware will be regarded as invalid?
> >
> > Because of that, it is not an option for a driver to avoid providing
> > ACPI match data on a platform that uses ACPI.
> First of all, the driver that would have made use of it has been
> restructed to not use mfd subdevices. It would not be affected anymore
> through this patch set.

So what exactly would be affected by it?

> Not sure if I should still send it as its own patch series though.
>
> The device of the driver has no ACPI ID allocated by the manufacturer,
> as it is only used on a proprietary Linux OS (with their own modified
> kernel).

Do I understand correctly that there is an ACPI platform firmware on
the board, but it doesn't enumerate the given device properly (that
is, as an ACPI device object with a specific device ID)?

In which case there probably is a driver that can find that device
somehow (it has hardcoded resources or similar).

> The driver would have only been useful via device tree or an ACPI
> Overlay.

Do you mean a custom SSDT loaded via configfs or something else?

> Obviously, I don't have a PNP or ACPI Vendor ID, so I can't
> assign one. The parent/main driver does only have a of compatible id.
> As it needs to use PRP0001 anyway on ACPI, I thought it makes more
> sense to also use PRP0001 there instead of matching it with a _ADR
> which is "a grey area in the ACPI specification".

You can't match a device with _ADR.  By itself, _ADR doesn't provide
you with any information on the device in question, it only helps to
connect it to some information that can be collected by other means.
The role of it, at least in principle, is to allow some device objects
in the ACPI hierarchy to be associated with devices enumerated by
other means (like on a PCI bus).

The enumeration with the help of PRP0001 only works if there is a
device object in the ACPI hierarchy and its _HID is PRP0001 or its
_CID list contains PRP0001, there is a _DSD under it and a
"compatible" property is returned by that _DSD.  Who's going to
provide all of that for the given device?

Moreover, if the device has some resources that the kernel needs to
know about, there should be a _CRS under the device object in question
and the resources should be listed there.  Or how are the resources
going to be found otherwise?

