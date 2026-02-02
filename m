Return-Path: <linux-leds+bounces-6822-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHPhJDPXgGnMBwMAu9opvQ
	(envelope-from <linux-leds+bounces-6822-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 02 Feb 2026 17:56:19 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE29CF3D8
	for <lists+linux-leds@lfdr.de>; Mon, 02 Feb 2026 17:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA0E4300E71F
	for <lists+linux-leds@lfdr.de>; Mon,  2 Feb 2026 16:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C06437E2EF;
	Mon,  2 Feb 2026 16:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="afYJsc4z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BFC279DAF
	for <linux-leds@vger.kernel.org>; Mon,  2 Feb 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051195; cv=none; b=AyRlLH9FRP4fS6H+jwNQG6M+UWz49aytBaN6RllbJt9JocYOEDLFjwEe+EoMXtxtCj+Fs14WIGM4bjQMdLRFhDCsIBSDiBc/INiI2lrl8YzIpJ0g7nsIFVcvK/H3RvHmRv6wjXN9FLm0GkRe8HIomi1DYppNh51M2CX8SB2lsI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051195; c=relaxed/simple;
	bh=sg5lOJ82Rm9k2A/07hFHMuMMIKFXLpJRttT/YR3RZx4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fwGd+KF4bEuRfRhiHD10nx45D7x1KYlXEn/b+f1xBOe8KNY1P56BcJcGMDu1gD/I5HEAE/JdtZevR7PZZlaV3xCt2l3i1YGWjqashi8GgXRw6pb4zcNf9MkEwgt7nyBuDauK3E1RNYcnPyJWHF17wbCdovA9NdmybOrwmgAsZ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=afYJsc4z; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 10422240027
	for <linux-leds@vger.kernel.org>; Mon,  2 Feb 2026 17:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1770051191; bh=8V8qsCnc48DQnh6n4vcsVCGlXwfEvo8ScYvoeNQuMRk=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=afYJsc4zmAp/gyUlFlL4kJVvgW0OOoSr8iRh9XATiWKBm1kvyofSwoadbTc7viGyN
	 Kdv5vMSsc/1KJz+Pc/nLOb50uYCnvWyLWR8y/3EYIyTPCJ0nAtvzTQX8ILWaS9DkVE
	 OgEBUGaGoTZi3H5pzMRqWsbLvWenE01S092/7TihugOdp8MMU6vdP0lEz/pckZzmg6
	 KUWjS9aOZXhz/CbYK9Qx8tHXye6epJaMFD+bVhTUdT1PWuZtOOQMnMyGw57RKsagOG
	 dvN/w9TotDxrZk0rQDuRuwQCqrgQtkHW+hTnmmo6aeLWpZdW9orggtBued1iYpkZFQ
	 eDl/3p8MtbR2g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f4Xjv55Hpz6trs;
	Mon,  2 Feb 2026 17:53:07 +0100 (CET)
Message-ID: <3fbc5be7ae889501dc8562376aa38707f0e8bdd4.camel@posteo.de>
Subject: Re: [PATCH v11 1/3] rust: leds: add basic led classdev abstractions
From: Markus Probst <markus.probst@posteo.de>
To: Gary Guo <gary@garyguo.net>, Lee Jones <lee@kernel.org>, Pavel Machek	
 <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave
 Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, Leon
 Romanovsky	 <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki"	
 <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?=	 <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Date: Mon, 02 Feb 2026 16:53:09 +0000
In-Reply-To: <DG4L9K0RYU1R.38F7D0ZY2YL3J@garyguo.net>
References: <20260202-rust_leds-v11-0-585d1c8be20c@posteo.de>
	 <20260202-rust_leds-v11-1-585d1c8be20c@posteo.de>
	 <DG4L9K0RYU1R.38F7D0ZY2YL3J@garyguo.net>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-15GcYmSI1xxtn5McwTZl"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6822-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,linuxfoundation.org,intel.com,gmail.com,protonmail.com,google.com,umich.edu];
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
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lechnology.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:email,posteo.de:dkim,posteo.de:mid]
X-Rspamd-Queue-Id: 2AE29CF3D8
X-Rspamd-Action: no action


--=-15GcYmSI1xxtn5McwTZl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-02 at 15:41 +0000, Gary Guo wrote:
> On Mon Feb 2, 2026 at 1:52 PM GMT, Markus Probst wrote:
> > Implement the core abstractions needed for led class devices, including=
:
> >=20
> > * `led::LedOps` - the trait for handling leds, including
> >   `brightness_set`, `brightness_get` and `blink_set`
> >=20
> > * `led::InitData` - data set for the led class device
> >=20
> > * `led::Device` - a safe wrapper around `led_classdev`
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  MAINTAINERS        |   7 +
> >  rust/kernel/led.rs | 453 +++++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  rust/kernel/lib.rs |   1 +
> >  3 files changed, 461 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0efa8cc6775b..26765fecb9a9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14279,6 +14279,13 @@ F:	drivers/leds/
> >  F:	include/dt-bindings/leds/
> >  F:	include/linux/leds.h
> > =20
> > +LED SUBSYSTEM [RUST]
> > +M:	Markus Probst <markus.probst@posteo.de>
> > +L:	linux-leds@vger.kernel.org
> > +L:	rust-for-linux@vger.kernel.org
> > +S:	Maintained
> > +F:	rust/kernel/led.rs
> > +
> >  LEGO MINDSTORMS EV3
> >  R:	David Lechner <david@lechnology.com>
> >  S:	Maintained
> > diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> > new file mode 100644
> > index 000000000000..9acb6946f3da
> > --- /dev/null
> > +++ b/rust/kernel/led.rs
> > @@ -0,0 +1,453 @@
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
> > +    devres::Devres,
> > +    error::{
> > +        from_result,
> > +        to_result,
> > +        VTABLE_DEFAULT_ERROR, //
> > +    },
> > +    macros::vtable,
> > +    prelude::*,
> > +    str::CStrExt,
> > +    types::{
> > +        ARef,
> > +        Opaque, //
> > +    }, //
> > +};
> > +
> > +/// The led class device representation.
> > +///
> > +/// This structure represents the Rust abstraction for a C `struct led=
_classdev`.
> > +#[pin_data(PinnedDrop)]
> > +pub struct Device<T: LedOps> {
> > +    #[pin]
> > +    ops: T,
> > +    #[pin]
> > +    classdev: Opaque<bindings::led_classdev>,
> > +}
> > +
> > +/// The led init data representation.
> > +///
> > +/// This structure represents the Rust abstraction for a C `struct led=
_init_data` with additional
> > +/// fields from `struct led_classdev`.
> > +#[derive(Default)]
> > +pub struct InitData<'a> {
> > +    fwnode: Option<ARef<FwNode>>,
> > +    devicename: Option<&'a CStr>,
> > +    devname_mandatory: bool,
> > +    initial_brightness: u32,
> > +    default_trigger: Option<&'a CStr>,
> > +    color: Color,
> > +}
>=20
> It appears to me that while this reflects on the C API, on the Rust side =
this is
> more commonly known as the builder pattern.
>=20
> I think this should properly be name `led::DeviceBuilder`, as it does mor=
e than
> what `led_init_data` does on the C side (e.g. initial_brightness).
>=20
> Perhaps the device creation can be part of this too, e.g.
>=20
>     LedDeviceBuilder::new()
>         .fwnode(...)
>         .devicename(...)
>         .initial_brightness(...)
>         .build(parent, ops)
>=20
> ?
>=20
>=20
> > +
> > +impl InitData<'static> {
> > +    /// Creates a new [`InitData`].
> > +    pub fn new() -> Self {
> > +        Self::default()
> > +    }
> > +}
> > +
> > +impl<'a> InitData<'a> {
> > +    /// Sets the firmware node.
> > +    pub fn fwnode(self, fwnode: Option<ARef<FwNode>>) -> Self {
> > +        Self { fwnode, ..self }
> > +    }
> > +
> > +    /// Sets the device name.
> > +    pub fn devicename(self, devicename: &'a CStr) -> Self {
> > +        Self {
> > +            devicename: Some(devicename),
> > +            ..self
> > +        }
> > +    }
> > +
> > +    /// Sets if a device name is mandatory.
> > +    pub fn devicename_mandatory(self, mandatory: bool) -> Self {
> > +        Self {
> > +            devname_mandatory: mandatory,
> > +            ..self
> > +        }
> > +    }
> > +
> > +    /// Sets the initial brightness value for the led.
> > +    ///
> > +    /// The default brightness is 0.
> > +    /// If [`LedOps::brightness_get`] is implemented, this value will =
be ignored.
> > +    pub fn initial_brightness(self, brightness: u32) -> Self {
> > +        Self {
> > +            initial_brightness: brightness,
> > +            ..self
> > +        }
> > +    }
> > +
> > +    /// Set the default led trigger.
> > +    ///
> > +    /// This value can be overwritten by the "linux,default-trigger" f=
wnode property.
> > +    pub fn default_trigger(self, trigger: &'a CStr) -> Self {
> > +        Self {
> > +            default_trigger: Some(trigger),
> > +            ..self
> > +        }
> > +    }
> > +
> > +    /// Sets the color of the led.
> > +    ///
> > +    /// This value can be overwritten by the "color" fwnode property.
> > +    pub fn color(self, color: Color) -> Self {
> > +        Self { color, ..self }
> > +    }
> > +}
> > +
> > +/// Trait defining the operations for a LED driver.
> > +///
> > +/// # Examples
> > +/// ```
> > +/// use kernel::{
> > +///      device,
> > +///      devres::Devres,
> > +///      led,
> > +///      macros::vtable,
> > +///      platform,
> > +///      prelude::*, //
> > +///  };
> > +///
> > +/// struct MyLedOps;
> > +///
> > +///
> > +/// #[vtable]
> > +/// impl led::LedOps for MyLedOps {
> > +///     type Bus =3D platform::Device<device::Bound>;
> > +///     const BLOCKING: bool =3D false;
> > +///     const MAX_BRIGHTNESS: u32 =3D 255;
> > +///
> > +///     fn brightness_set(
> > +///         &self,
> > +///         _dev: &platform::Device<device::Bound>,
> > +///         _classdev: &led::Device<Self>,
> > +///         _brightness: u32
> > +///     ) -> Result<()> {
> > +///         // Set the brightness for the led here
> > +///         Ok(())
> > +///     }
> > +/// }
> > +///
> > +/// fn register_my_led(
> > +///     parent: &platform::Device<device::Bound>,
> > +/// ) -> Result<Pin<KBox<Devres<led::Device<MyLedOps>>>>> {
> > +///     KBox::pin_init(led::Device::new(
> > +///         parent,
> > +///         led::InitData::new(),
> > +///         Ok(MyLedOps),
> > +///     ), GFP_KERNEL)
> > +/// }
> > +/// ```
> > +/// Led drivers must implement this trait in order to register and han=
dle a [`Device`].
> > +#[vtable]
> > +pub trait LedOps: Send + 'static + Sized {
> > +    /// The bus device required by the implementation.
> > +    #[allow(private_bounds)]
> > +    type Bus: AsBusDevice<Bound>;
> > +    /// If set true, [`LedOps::brightness_set`] and [`LedOps::blink_se=
t`] must perform the
> > +    /// operation immediately. If set false, they must not sleep.
> > +    const BLOCKING: bool;
> > +    /// The max brightness level.
> > +    const MAX_BRIGHTNESS: u32;
> > +
> > +    /// Sets the brightness level.
> > +    ///
> > +    /// See also [`LedOps::BLOCKING`].
> > +    fn brightness_set(
> > +        &self,
> > +        dev: &Self::Bus,
> > +        classdev: &Device<Self>,
> > +        brightness: u32,
> > +    ) -> Result<()>;
> > +
> > +    /// Gets the current brightness level.
> > +    fn brightness_get(&self, _dev: &Self::Bus, _classdev: &Device<Self=
>) -> u32 {
> > +        build_error!(VTABLE_DEFAULT_ERROR)
> > +    }
> > +
> > +    /// Activates hardware accelerated blinking.
> > +    ///
> > +    /// delays are in milliseconds. If both are zero, a sensible defau=
lt should be chosen.
> > +    /// The caller should adjust the timings in that case and if it ca=
n't match the values
> > +    /// specified exactly. Setting the brightness to 0 will disable th=
e hardware accelerated
> > +    /// blinking.
> > +    ///
> > +    /// See also [`LedOps::BLOCKING`].
> > +    fn blink_set(
> > +        &self,
> > +        _dev: &Self::Bus,
> > +        _classdev: &Device<Self>,
> > +        _delay_on: &mut usize,
> > +        _delay_off: &mut usize,
> > +    ) -> Result<()> {
> > +        build_error!(VTABLE_DEFAULT_ERROR)
> > +    }
> > +}
> > +
> > +/// Led colors.
> > +#[derive(Copy, Clone, Debug, Default)]
> > +#[repr(u32)]
> > +#[non_exhaustive]
> > +#[expect(
> > +    missing_docs,
> > +    reason =3D "it shouldn't be necessary to document each color"
> > +)]
> > +pub enum Color {
> > +    #[default]
> > +    White =3D bindings::LED_COLOR_ID_WHITE,
> > +    Red =3D bindings::LED_COLOR_ID_RED,
> > +    Green =3D bindings::LED_COLOR_ID_GREEN,
> > +    Blue =3D bindings::LED_COLOR_ID_BLUE,
> > +    Amber =3D bindings::LED_COLOR_ID_AMBER,
> > +    Violet =3D bindings::LED_COLOR_ID_VIOLET,
> > +    Yellow =3D bindings::LED_COLOR_ID_YELLOW,
> > +    Ir =3D bindings::LED_COLOR_ID_IR,
> > +    Multi =3D bindings::LED_COLOR_ID_MULTI,
> > +    Rgb =3D bindings::LED_COLOR_ID_RGB,
> > +    Purple =3D bindings::LED_COLOR_ID_PURPLE,
> > +    Orange =3D bindings::LED_COLOR_ID_ORANGE,
> > +    Pink =3D bindings::LED_COLOR_ID_PINK,
> > +    Cyan =3D bindings::LED_COLOR_ID_CYAN,
> > +    Lime =3D bindings::LED_COLOR_ID_LIME,
> > +}
> > +
> > +impl TryFrom<u32> for Color {
> > +    type Error =3D Error;
> > +
> > +    fn try_from(value: u32) -> core::result::Result<Self, Self::Error>=
 {
> > +        const _: () =3D {
> > +            assert!(bindings::LED_COLOR_ID_MAX =3D=3D 15);
> > +        };
>=20
> `static_assert!()` and move this out from the impl.
>=20
> > +        if value < bindings::LED_COLOR_ID_MAX {
> > +            // SAFETY:
> > +            // - `Color` is represented as `u32`
> > +            // - the const block above guarantees that no additional c=
olor has been added
> > +            // - `value` is guaranteed to be in the color id range
> > +            Ok(unsafe { transmute::<u32, Color>(value) })
> > +        } else {
> > +            Err(EINVAL)
> > +        }
> > +    }
> > +}
> > +
> > +// SAFETY: A `led::Device` can be unregistered from any thread.
> > +unsafe impl<T: LedOps + Send> Send for Device<T> {}
> > +
> > +// SAFETY: `led::Device` can be shared among threads because all metho=
ds of `led::Device`
> > +// are thread safe.
> > +unsafe impl<T: LedOps + Sync> Sync for Device<T> {}
> > +
> > +impl<T: LedOps> Device<T> {
> > +    /// Registers a new led classdev.
> > +    ///
> > +    /// The [`Device`] will be unregistered on drop.
> > +    pub fn new<'a>(
> > +        parent: &'a T::Bus,
> > +        init_data: InitData<'a>,
> > +        ops: impl PinInit<T, Error> + 'a,
> > +    ) -> impl PinInit<Devres<Self>, Error> + 'a {
> > +        Devres::new(
> > +            parent.as_ref(),
> > +            try_pin_init!(Self {
> > +                ops <- ops,
> > +                classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::=
led_classdev| {
> > +                    // SAFETY: `try_ffi_init` guarantees that `ptr` is=
 valid for write.
> > +                    // `led_classdev` gets fully initialized in-place =
by
> > +                    // `led_classdev_register_ext` including `mutex` a=
nd `list_head`.
> > +                    unsafe {
> > +                        ptr.write(bindings::led_classdev {
> > +                            brightness_set: (!T::BLOCKING)
> > +                                .then_some(Adapter::<T>::brightness_se=
t_callback),
> > +                            brightness_set_blocking: T::BLOCKING
> > +                                .then_some(Adapter::<T>::brightness_se=
t_blocking_callback),
> > +                            brightness_get: T::HAS_BRIGHTNESS_GET
> > +                                .then_some(Adapter::<T>::brightness_ge=
t_callback),
> > +                            blink_set: T::HAS_BLINK_SET.then_some(Adap=
ter::<T>::blink_set_callback),
> > +                            max_brightness: T::MAX_BRIGHTNESS,
> > +                            brightness: init_data.initial_brightness,
> > +                            default_trigger: init_data
> > +                                .default_trigger
> > +                                .map_or(core::ptr::null(), CStrExt::as=
_char_ptr),
> > +                            color: init_data.color as u32,
> > +                            ..bindings::led_classdev::default()
> > +                        })
> > +                    };
> > +
> > +                    let mut init_data_raw =3D bindings::led_init_data =
{
> > +                        fwnode: init_data
> > +                            .fwnode
> > +                            .as_ref()
> > +                            .map_or(core::ptr::null_mut(), |fwnode| fw=
node.as_raw()),
>=20
> This should be `fwnode.into_raw()` which directly takes the ownership for
> `ARef`, rather than `as_raw()` and forget the `ARef` later.
With into_raw(), the reference count of fwnode would not decrement if
the registration fails.

Thanks
- Markus Probst

>=20
> Best,
> Gary
>=20
> > +                        default_label: core::ptr::null(),
> > +                        devicename: init_data
> > +                            .devicename
> > +                            .map_or(core::ptr::null(), CStrExt::as_cha=
r_ptr),
> > +                        devname_mandatory: init_data.devname_mandatory=
,
> > +                    };
> > +
> > +                    // SAFETY:
> > +                    // - `parent.as_raw()` is guaranteed to be a point=
er to a valid `device`
> > +                    //    or a null pointer.
> > +                    // - `ptr` is guaranteed to be a pointer to an ini=
tialized `led_classdev`.
> > +                    to_result(unsafe {
> > +                        bindings::led_classdev_register_ext(
> > +                            parent.as_ref().as_raw(),
> > +                            ptr,
> > +                            &raw mut init_data_raw,
> > +                        )
> > +                    })?;
> > +
> > +                    core::mem::forget(init_data.fwnode); // keep the r=
eference count incremented
> > +
> > +                    Ok::<_, Error>(())
> > +                }),
> > +            }),
> > +        )
> > +    }
> > +
> > +    /// # Safety
> > +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedde=
d within a
> > +    /// `led::Device`.
> > +    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &=
'a Self {
> > +        // SAFETY: The function's contract guarantees that `led_cdev` =
points to a `led_classdev`
> > +        // field embedded within a valid `led::Device`. `container_of!=
` can therefore
> > +        // safely calculate the address of the containing struct.
> > +        unsafe { &*container_of!(Opaque::cast_from(led_cdev), Self, cl=
assdev) }
> > +    }
> > +
> > +    fn parent(&self) -> &device::Device<Bound> {
> > +        // SAFETY:
> > +        // - `self.classdev.get()` is guaranteed to be a valid pointer=
 to `led_classdev`.
> > +        unsafe { device::Device::from_raw((*(*self.classdev.get()).dev=
).parent) }
> > +    }
> > +}

--=-15GcYmSI1xxtn5McwTZl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmA1mcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSNewP/2fCYssYjOiL8Yex1A0e
B7JHZUfNcYixYzpKmhbqh57yhrlzNSz0OGvPU806HBL1/uJ3Uy0R/FODy5DcPVWV
KrocF3vlsBuSvlD+UbNEwDAgJ06TTjkL8slXvBJ2VNte0gSGsoK7l+oUn2WprdsB
9Icc2nhhxtORkqICimaTE7I9P9pS7VtWKFe+Kl2niKsTtQkUFS3+eO6OsZnOPskD
cZDtgUHI+maARXOrTVSN3LXkTbWYA2NalcU8IPrrBhAyfkOCssOOkJv3WgkwruCV
4xnGmVhyC7RSjIexuPSLLLygQGiF+wH+g5rvQhKemeYG5ZXvl8IAkdpNoFnFrz4Y
CaPBf0s4iosKLLYQtlLvBJa2cJeRz+Dr6pLYa8pOFml8+psrBSq7yCXbSeHpu00x
JGTmR35X055+wQMENZDWV02NT6lo2s4BvTJ0grqlsNQ/TLE6TiUeQsKGUT2NZm5H
iyNqxckXpZfwxGcvKNv5oO3oHtjibl/xI0LLKG154GrVRXZvjL8IloN8LgUij3pz
2yqKX/B+lPES1nG0BKa4u0wnhgOHKnamsB0J5yC3iEXvIEdWX3wVdjgdBO1bXuAU
z9t4qUf0buT6Vks3I85SXiJaa76UROtO/Rp1voeDtkOmNQvijN1mBw8AVr3OvCJg
ShWkqhNKW9YM2RSCIdEKMzwa
=pxYF
-----END PGP SIGNATURE-----

--=-15GcYmSI1xxtn5McwTZl--

