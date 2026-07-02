Return-Path: <linux-leds+bounces-8831-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V86DMshGRmp0NgsAu9opvQ
	(envelope-from <linux-leds+bounces-8831-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 13:08:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073C6F6732
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 13:08:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=ETUkP+B0;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8831-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8831-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19F21301BF58
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 11:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9E53C9EC2;
	Thu,  2 Jul 2026 11:00:37 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223083C09F2
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 11:00:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990037; cv=none; b=Rewtb68DIRz5B7wQoiA82ZiTXL4Jcerh1kN5tEsvoX0f9bngnBZQI/KeyymOa3vktjpD9p+nZN+fckqmdZfcy4kRpk51gBXaD+J5jA9Z4qFN0+lECy0M9v36A8SctQyT1OFstu9OD+wCbrJpD51k3KrQOgZOk88cW4gClfuH5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990037; c=relaxed/simple;
	bh=KHWCYUVuhtcsgw2V/h+NtWFjs3VoSWVhGRMxsnYWmyE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CDhfm97tOM8DD+nnHJERb8fBnZahS6Pp2axWsZVTTYwAuO2e8dsv/SWFxZ5aG+iS1ddGUyz24L5zt7H0pzIvaaAmGhVYrHC532L1unFpPwfo6vdSQUaZXj4YgQfG3JBkuEJr5UiqSeydF4Rmrl2iT8xViVZU3qvvcqjqVcB30fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=ETUkP+B0; arc=none smtp.client-ip=185.67.36.65
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 009CD240029
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 13:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782990032; bh=UlrVrUhb+agw5JkOK/GWTWKtpgb8UdjkLfNtb/LdcLc=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=ETUkP+B0o4qDVl75pbQCo7UamQpItlimJZDUrXuuv3MA5o8n43fgnWKlYJP0PkzUA
	 hO0g31/vri3ll9tZ4AdY+d1kqjeUmvJ+vV6fhm82K8PLRHbMyT1nMTAiAS1ypAXvS+
	 RzXZXql4aZ5KuTnlnLUer8u3wsr2wPLaaZ+gZmNTDRCJ9LnT8CKaHUvTiJBnOOPw7s
	 /sm/fenTAmCKQ9qdvZCM+NEmrlYB5Ldb94it8N0rFYjyzA9nR/14ufBdbP5zJUBYG9
	 wqcioqjuf11e+TTjF60shvkNYbQ60uhykZ/p5/tyNbZg99Gr+rUTfUXHBrbcZhqU6N
	 T+h/sou7Tn5Uw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4grYnl1W7kz6v0l;
	Thu,  2 Jul 2026 13:00:27 +0200 (CEST)
Message-ID: <9e020dbc48fa9f209248864cdd1b7b9ebf2eecc4.camel@posteo.de>
Subject: Re: [PATCH v21 1/3] rust: leds: add basic led classdev abstractions
From: Markus Probst <markus.probst@posteo.de>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman
 <david.m.ertman@intel.com>, Leon Romanovsky	 <leon@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor	 <alex.gaynor@gmail.com>, Gary Guo
 <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich	 <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas	 <bhelgaas@google.com>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	 <kwilczynski@kernel.org>, Boqun Feng <boqun@kernel.org>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?ISO-8859-1?Q?=D6zkan?=
 <work@onurozkan.dev>, Ira Weiny	 <iweiny@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Date: Thu, 02 Jul 2026 11:00:30 +0000
In-Reply-To: <akZBsBrMlxd4qbBl@google.com>
References: <20260629-rust_leds-v21-0-4f0f19579db5@posteo.de>
	 <20260629-rust_leds-v21-1-4f0f19579db5@posteo.de>
	 <akZBsBrMlxd4qbBl@google.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SMxfPUxs0+6zl/vTzNMM"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,umich.edu,google.com,collabora.com,nvidia.com,onurozkan.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8831-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:lee@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:leon@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rafael@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:iweiny@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lechnology.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6073C6F6732


--=-SMxfPUxs0+6zl/vTzNMM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-02 at 10:47 +0000, Alice Ryhl wrote:
> On Mon, Jun 29, 2026 at 01:10:28PM +0000, Markus Probst wrote:
> > Implement the core abstractions needed for led class devices, including=
:
> >=20
> > * `led::LedOps` - the trait for handling leds, including
> >   `brightness_set`, `brightness_get` and `blink_set`
> >=20
> > * `led::DeviceBuilder` - the builder for the led class device
> >=20
> > * `led::Device` - a safe wrapper around `led_classdev`
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  MAINTAINERS               |   8 ++
> >  rust/kernel/led.rs        | 288 ++++++++++++++++++++++++++++++++++++++=
++++++++
> >  rust/kernel/led/normal.rs | 230 ++++++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs        |   1 +
> >  4 files changed, 527 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 15011f5752a9..ceb2285366ff 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14662,6 +14662,14 @@ F:	drivers/leds/
> >  F:	include/dt-bindings/leds/
> >  F:	include/linux/leds.h
> > =20
> > +LED SUBSYSTEM [RUST]
> > +M:	Markus Probst <markus.probst@posteo.de>
> > +L:	linux-leds@vger.kernel.org
> > +L:	rust-for-linux@vger.kernel.org
> > +S:	Maintained
> > +F:	rust/kernel/led.rs
> > +F:	rust/kernel/led/
> > +
> >  LEGO MINDSTORMS EV3
> >  R:	David Lechner <david@lechnology.com>
> >  S:	Maintained
> > diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> > new file mode 100644
> > index 000000000000..c92d99d68497
> > --- /dev/null
> > +++ b/rust/kernel/led.rs
> > @@ -0,0 +1,288 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Abstractions for the leds driver model.
> > +//!
> > +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> > +
> > +use core::{
> > +    marker::PhantomData,
> > +    mem::transmute,
> > +    ptr::NonNull, //
> > +};
> > +
> > +use crate::{
> > +    container_of,
> > +    device::{
> > +        self,
> > +        property::FwNode,
> > +        AsBusDevice,
> > +        Bound, //
> > +    },
> > +    error::{
> > +        from_result,
> > +        to_result,
> > +        VTABLE_DEFAULT_ERROR, //
> > +    },
> > +    macros::vtable,
> > +    prelude::*,
> > +    str::CStrExt,
>=20
> CStrExt is in the prelude. Please check for unnecessary imports.
There is a
`use super::*;` in rust/kernel/led/normal.rs and
rust/kernel/led/multicolor.rs, which both make use of CStrExt.
The latter being in patch 3.
>=20
> > diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> > new file mode 100644
> > index 000000000000..2769f690bb24
> > --- /dev/null
> > +++ b/rust/kernel/led/normal.rs
> > @@ -0,0 +1,230 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Led mode for the `struct led_classdev`.
> > +//!
> > +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> > +
> > +use super::*;
> > +
> > +/// The led class device representation.
> > +///
> > +/// This structure represents the Rust abstraction for a led class dev=
ice.
> > +#[pin_data(PinnedDrop)]
> > +pub struct Device<'bound, T: LedOps + 'bound> {
> > +    #[pin]
> > +    ops: T,
> > +    #[pin]
> > +    classdev: Opaque<bindings::led_classdev>,
> > +    _p: PhantomData<&'bound ()>,
> > +}
> > +
> > +impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
> > +    /// Registers a new [`Device`].
> > +    pub fn build<'bound: 'a, T: LedOps + 'bound>(
> > +        self,
> > +        parent: &'bound T::Bus,
> > +        ops: impl PinInit<T, Error> + 'a,
> > +    ) -> impl PinInit<Device<'bound, T>, Error> + 'a {
>=20
> I think it would be useful to separate out the two lifetimes more
> clearly. You have two sets of lifetimes:
>=20
> * 'bound which is the duration in which the bus device is bound.
> * 'a which is the duration in which the `name`/`devicename` fields are
>   valid.
>=20
> And these have different constraints because 'bound is much larger than
> 'a. The 'bound lifetime is longer than the entire Device struct, but the
> 'a lifetime only needs to last for the duration of the initialization
> because (I assume) the strings are copied by `led_classdev_register_ext`
>=20
> So under that logic, I would rename 'a to 'name or something like that
> to indicate what it's the lifetime of.
Preferably 'init, which can be used in other class device abstractions
as well if needed.
>=20
> Note that if I'm wrong about the lifetime of the name strings, then this
> code should be changed accordingly. It looks like you're actually
> stashing the pointers in the led_classdev, and if that outlives this
> initializer, then the current lifetimes are wrong, and Device must also
> be annotated with 'name to indicate this additional lifetime.
name and devicename only need to be valid for the duration of
`led_classdev_register_ext`.

>=20
> > +        const_assert!(T::MAX_BRIGHTNESS <=3D i32::MAX.unsigned_abs() |=
| !T::HAS_BRIGHTNESS_GET);
> > +
> > +        try_pin_init!(Device {
> > +            ops <- ops,
> > +            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_=
classdev| {
> > +                // SAFETY: `try_ffi_init` guarantees that `ptr` is val=
id for write.
> > +                // `led_classdev` gets fully initialized in-place by
> > +                // `led_classdev_register_ext` including `mutex` and `=
list_head`.
> > +                unsafe {
> > +                    ptr.write(bindings::led_classdev {
> > +                        brightness_set: (!T::BLOCKING)
> > +                            .then_some(Adapter::<T>::brightness_set_ca=
llback),
> > +                        brightness_set_blocking: T::BLOCKING
> > +                            .then_some(Adapter::<T>::brightness_set_bl=
ocking_callback),
> > +                        brightness_get: T::HAS_BRIGHTNESS_GET
> > +                            .then_some(Adapter::<T>::brightness_get_ca=
llback),
> > +                        blink_set: T::HAS_BLINK_SET.then_some(Adapter:=
:<T>::blink_set_callback),
> > +                        max_brightness: T::MAX_BRIGHTNESS,
> > +                        brightness: self.initial_brightness,
> > +                        color: self.color as u32,
> > +                        name: self.name.map_or(core::ptr::null(), CStr=
Ext::as_char_ptr),
> > +                        ..bindings::led_classdev::default()
> > +                    })
> > +                };
> > +
> > +                let mut init_data =3D bindings::led_init_data {
> > +                    fwnode: self
> > +                        .fwnode
> > +                        .as_ref()
> > +                        .map_or(core::ptr::null_mut(), |fwnode| fwnode=
.as_raw()),
> > +                    default_label: core::ptr::null(),
> > +                    devicename: self
> > +                        .devicename
> > +                        .map_or(core::ptr::null(), CStrExt::as_char_pt=
r),
> > +                    devname_mandatory: self.devname_mandatory,
> > +                };
> > +
> > +                // SAFETY:
> > +                // - `parent.as_ref().as_raw()` is guaranteed to be a =
pointer to a valid
> > +                //    `device`.
> > +                // - `ptr` is guaranteed to be a pointer to an initial=
ized `led_classdev`.
> > +                to_result(unsafe {
> > +                    bindings::led_classdev_register_ext(
> > +                        parent.as_ref().as_raw(),
> > +                        ptr,
> > +                        if self.name.is_none() {
> > +                            &raw mut init_data
> > +                        } else {
> > +                            core::ptr::null_mut()
> > +                        },
> > +                    )
> > +                })?;
> > +
> > +                core::mem::forget(self.fwnode); // keep the reference =
count incremented
> > +
> > +                Ok::<_, Error>(())
> > +            }),
> > +            _p: PhantomData,
> > +        })
> > +    }
> > +}
Thanks
- Markus Probst


>=20
> Alice

--=-SMxfPUxs0+6zl/vTzNMM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmpGRMgbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSstgP/jeRhMo6ufOlvpqQ8e6k
QXE8GZP3zMcxatGN6muc70zN9JwvtkveUebLL2P8G+eotsIm6vIvahrj1QRGPeWO
B0shZowBe0hN8os3NjCh7f19bxDVXnwtOyzy9knRUaWuOhIwfuu8B3jhNWrWVreN
w9q82dO0dnQpMhteeKMulnsSdgx+JJ9aP1H0D4COf1l890bf6jk2AKjOOUry/9mg
z6lsy4T9QD/7ipmdpJf81kLZUVAXjqYJt7uqqy4yV+S3nTKFA5fxoexGruBTGZDI
lt6eBXmhdmYkGm2QNYcpplOtx+KOCP53luMeg1jVCPahxHyVTegmQLwpQHB4QPxz
v9rFWCZPYdcU5ToHZ9Zz28ykRZy4Xgg6RkDnnNb8MyDtfQeNIrie5F8WCfBuqKjE
p6o0bkWk3I5lyXYigV2jq4iet/SXEKT8xNiE+4NfdG24xCZaYoymtDj7a7JbkuFe
Zkxw3yi9p2GJCJ27eZRkikg8b4sIy6YwyP1ckM9wA8j8AgBWB+Vy8XouYVCG6sHQ
QCaCY+hougwkoCQP7TI+fWBThc+QtWYODqT3X1iekiM8/3/ynDFV3UqYnYMdJNpH
/BRFgC2uqY1WpjX2tl7ud0bDn/PYbc4Nxo/WzePnoYST5HKm9o1agolvZN+yPE0d
VFzvJ3qCeqEVCRyNtQWnq6bU
=hQoD
-----END PGP SIGNATURE-----

--=-SMxfPUxs0+6zl/vTzNMM--

