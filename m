Return-Path: <linux-leds+bounces-5790-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7FBDF403
	for <lists+linux-leds@lfdr.de>; Wed, 15 Oct 2025 17:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899051A60314
	for <lists+linux-leds@lfdr.de>; Wed, 15 Oct 2025 15:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BECC2D6623;
	Wed, 15 Oct 2025 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="ICrcqYps"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEE52D0631
	for <linux-leds@vger.kernel.org>; Wed, 15 Oct 2025 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540570; cv=none; b=fyC0qqz+CV6cU9rzt+8KQiFz/RjnV1sGuwd9yPOx4GvxdySvxXtCyYrukvv1OFDb5a1b2OwG75MMXty54yccucrCv7zNltW/IF4NQRBkszO355cWdiLcgHSZfSVy5C+O1MUT1NS3ONMtEEwCCuaVQ1BOkonCHQoZpHrGwDoV6wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540570; c=relaxed/simple;
	bh=hHvO7+pAuANETqlkdKcLeY8V60XOi07rOreJSG/Jdp4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C6ldzGarriWYHtFWHpHS/x1vQCDuaTZGZBnIlNtCArEVYq3IVhgBx/UZiWjx0k+5p+DkDQFo2rN9SzJHbrrtXKGKLUzM14CVnowqbSaT1aTlrBzhj5ERWYfnpB/4Fg7oW+jBKIzZv1j2wfHWkHv+xj7Sgaq3c57KbOCKKqPLK88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=ICrcqYps; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 5A6BA240104
	for <linux-leds@vger.kernel.org>; Wed, 15 Oct 2025 17:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760540561; bh=7vRn8VJxRxqVRWolykt9lD+vLVOYMFlK1KobOslfuNw=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Autocrypt:OpenPGP:From;
	b=ICrcqYpsQ7GNY5y1C0CaOCKAzodxxE/OYFBqv588qpjnO0qnFlE344Qw/2DGgSZ5a
	 zO6q+mUGMiVFRbK+6mowhXU69KOi23wyAjkg4904DqzoRddeGWjFsq9OKA5oadqhZ5
	 UBPmVPCwJo0Hc7AXohBogV4j37FzzgEShV13YhxzgkhQ2yKgY1pTIZzdx1ukVElRF7
	 idebzus40Tso/yAtldu/3pO3OqPusZXSU04ff3+1Iac6XI/XG1SargBVPpZlIIZs+4
	 UC0chboiMYuZ+MRKAAbvEKaBKnA+ekARP57dzAettoWm2fG0pPJUfXE6BsXL3zJHuR
	 hdzqQKv3b/DMA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cmvTC3NSqz9rxP;
	Wed, 15 Oct 2025 17:02:39 +0200 (CEST)
Message-ID: <25f3fd337ce5e58915125c4e2eb85ef4d7af3627.camel@posteo.de>
Subject: Re: [PATCH v4 2/2] rust: leds: add basic led classdev abstractions
From: Markus Probst <markus.probst@posteo.de>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"	
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Boqun Feng	
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com,  Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Date: Wed, 15 Oct 2025 15:02:40 +0000
In-Reply-To: <DDIZC4MK2CFW.1DPDIJR4HPKGY@kernel.org>
References: <20251012145221.172116-1-markus.probst@posteo.de>
	 <20251012145221.172116-3-markus.probst@posteo.de>
	 <aO1GM4WXs37Zpm0G@google.com>
	 <7de58fd25b52dd5195c8ac06ed4df5a1e60e5070.camel@posteo.de>
	 <DDIZC4MK2CFW.1DPDIJR4HPKGY@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

On Wed, 2025-10-15 at 16:52 +0200, Danilo Krummrich wrote:
> On Wed Oct 15, 2025 at 3:44 PM CEST, Markus Probst wrote:
> > On Mon, 2025-10-13 at 18:34 +0000, Alice RyhlV wrote:
> > > On Sun, Oct 12, 2025 at 02:52:39PM +0000, Markus Probst wrote:
> > > > Implement the core abstractions needed for led class devices,
> > > > including:
> > > >=20
> > > > * `led::LedOps` - the trait for handling leds, including
> > > > =C2=A0 `brightness_set`, `brightness_get` and `blink_set`
> > > >=20
> > > > * `led::InitData` - data set for the led class device
> > > >=20
> > > > * `led::Device` - a safe wrapper around `led_classdev`
> > > >=20
> > > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > >=20
> > > > +pub trait LedOps: Send + 'static + Sized {
> > > > +=C2=A0=C2=A0=C2=A0 /// If set true, [`LedOps::brightness_set`] and
> > > > [`LedOps::blink_set`] must not sleep
> > > > +=C2=A0=C2=A0=C2=A0 /// and perform the operation immediately.
> > > > +=C2=A0=C2=A0=C2=A0 const BLOCKING: bool;
> > > > +=C2=A0=C2=A0=C2=A0 /// The max brightness level
> > > > +=C2=A0=C2=A0=C2=A0 const MAX_BRIGHTNESS: u32;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /// Sets the brightness level.
> > > > +=C2=A0=C2=A0=C2=A0 ///
> > > > +=C2=A0=C2=A0=C2=A0 /// See also [`LedOps::BLOCKING`]
> > > > +=C2=A0=C2=A0=C2=A0 fn brightness_set(&self, brightness: u32) -> Re=
sult<()>;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /// Gets the current brightness level.
> > > > +=C2=A0=C2=A0=C2=A0 fn brightness_get(&self) -> u32 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_error!(VTABLE_DEF=
AULT_ERROR)
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /// Activates hardware accelerated blinking.
> > > > +=C2=A0=C2=A0=C2=A0 ///
> > > > +=C2=A0=C2=A0=C2=A0 /// delays are in milliseconds. If both are zer=
o, a
> > > > sensible
> > > > default should be chosen.
> > > > +=C2=A0=C2=A0=C2=A0 /// The caller should adjust the timings in tha=
t case and
> > > > if
> > > > it can't match the values
> > > > +=C2=A0=C2=A0=C2=A0 /// specified exactly. Setting the brightness t=
o 0 will
> > > > disable the hardware accelerated
> > > > +=C2=A0=C2=A0=C2=A0 /// blinking.
> > > > +=C2=A0=C2=A0=C2=A0 ///
> > > > +=C2=A0=C2=A0=C2=A0 /// See also [`LedOps::BLOCKING`]
> > > > +=C2=A0=C2=A0=C2=A0 fn blink_set(&self, _delay_on: &mut usize, _del=
ay_off:
> > > > &mut
> > > > usize) -> Result<()> {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_error!(VTABLE_DEF=
AULT_ERROR)
> > > > +=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > These functions should probably take a &Device<Bound> argument so
> > > that
> > > they can use methods that require a bound device (such as IO).
> > How about instead something like
> >=20
> > mod device {
> >=20
> > =C2=A0 unsafe trait Container<Ctx: DeviceContext>: AsRef<Device<Ctx>> {
> > =C2=A0=C2=A0=C2=A0 const Offset: usize;
> >=20
> > =C2=A0=C2=A0=C2=A0 unsafe fn from_device(dev: &Device<Ctx>) -> &Self {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <implementation here>
> > =C2=A0=C2=A0=C2=A0 }
> > =C2=A0 }
> >=20
> > =C2=A0 unsafe impl Device<Ctx> for Container<Ctx> {
> > =C2=A0=C2=A0=C2=A0 const Offset: usize =3D 0;
> > =C2=A0 }
> >=20
> > }
> >=20
> > And instead of passing &Device<Bound> to the functions, we should
> > add a
> > type parameter to LedOps, e.g.:
> >=20
> > trait LedOps<T: device::Container<device::Bound>> {
> >=20
> > =C2=A0 ...
> >=20
> > =C2=A0 fn brightness_set(&self, dev: &T, brightness: u32) -> Result<()>=
;
> >=20
> > =C2=A0 ...
> >=20
> > }
> >=20
> > impl<T: LedOps<E>, E: device::Container<device::Bound>> Device<T> {
> >=20
> > =C2=A0 pub fn new<'a>(
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent: &'a E,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init_data: InitData<'a>,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ops: T,
> > =C2=A0=C2=A0=C2=A0 ) -> impl PinInit<Devres<Self>, Error> + 'a {
> > =C2=A0=C2=A0=C2=A0=C2=A0 ...
> > =C2=A0 }
> >=20
> > =C2=A0 ...
> >=20
> > }
> >=20
> > In the example of i2c (or any other container for `struct device`),
> > we
> > implement the device::Container trait:
> >=20
> > mod i2c {
> >=20
> > =C2=A0 unsafe impl device::Container for I2cClient {
> > =C2=A0=C2=A0=C2=A0 const Offset: usize =3D offset_of!(bindings::i2c_cli=
ent, dev);
> > =C2=A0 }
> >=20
> > }
> > This allows the LedOps function to use any functions from the
> > I2cClient
> > or any other device container which may be used (removing the need
> > to
> > store it inside the LedOps implementations struct). It still allows
> > Device<Bound> to be used, as it also would implement
> > device::Container.
>=20
> I had a similar idea in the past, but it has some disadvantages:
>=20
> =C2=A0 (1) You have to implement the upcast from a generic device to a bu=
s
> device for
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 every bus device.
Not necessarily every, like I said `container::Device` itself also
would implement `device::Container` (still allowing &Device<Bound>).

>=20
> =C2=A0 (2) You have to store a Box<dyn T> in the Rust LED class device;
> the C struct
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device can't carry the fat pointer.
Why carry a fat pointer (assuming you mean pointers to unsized types)?
We already know the address of it with the `struct led_classdev`-
>`parent` field, we just need to substract the offset from `<T as
Container>::Offset`, and we have the address of the device container
(like `struct i2c_client`). No Box needed.

Thanks
- Markus Probst


>=20
> The alternative would be to provide a safe method for bus devices to
> upgrade to
> a bound device by presenting its corresponding &Device<Bound> base
> device, for
> instance:
>=20
> 	impl I2cClient {
> 	=C2=A0=C2=A0=C2=A0 pub fn into_bound<'a>(&'a self, &'a Device<Bound>) ->
> Result<&'a I2cClient<Bound>> {
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Fails if the presented `&D=
evice<Bound` is not the
> base device of `self`.
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> 	=C2=A0=C2=A0=C2=A0 }
> 	}
>=20
> The advantage is that this can easily be implemented with a macro for
> all bus
> devices.
>=20
> There is a slight downside in ergonomics due to the into_bound() call
> though:
>=20
> 	fn brightness_set(&self, parent: &Device<Bound>, brightness:
> u32) -> Result {
> 	=C2=A0=C2=A0=C2=A0 let i2c: &I2cClient<Bound> =3D
> self.i2c.into_bound(parent)?;
>=20
> 	=C2=A0=C2=A0=C2=A0 ...
> 	}

