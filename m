Return-Path: <linux-leds+bounces-5789-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E6BDF2C6
	for <lists+linux-leds@lfdr.de>; Wed, 15 Oct 2025 16:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F38513413F8
	for <lists+linux-leds@lfdr.de>; Wed, 15 Oct 2025 14:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623DD2D592A;
	Wed, 15 Oct 2025 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMjaH2Pu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358132D543A;
	Wed, 15 Oct 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539988; cv=none; b=Q+PDK61LSFjMzYtr5B50gYzeFEGtKWUttCavR6jlAPpTdC2A54Eaisd+6vW/p9Hloax3FE4UrSx7mJngxqmP73LfbZ7wRkW2wypxypUCHd7Fok46EAn7O2VcuUm9eU+a6LM9PZkqpi1Vx1wxpu7JrQZbGPY7HheJH5xEUkXjcYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539988; c=relaxed/simple;
	bh=3yLVFGOlww5RXYni2MEx8WeBhY2XKe8EMHLqPW6qXts=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EgmiIlmHZlwqsk0RJmDu1OPflj2Amps0fsz4pYByboy3NO+jy0ekOdfl9/gqn1iHrDd7VNP+JPeRCG8J52b4regZfNltDQJaOHkPopc/PDMxT25nEfycm+9FJz7jTTmxixSLGUcEvjaff17QDnn3AnrzX25CL7co7B5FgehKO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMjaH2Pu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CACC4CEF8;
	Wed, 15 Oct 2025 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760539983;
	bh=3yLVFGOlww5RXYni2MEx8WeBhY2XKe8EMHLqPW6qXts=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XMjaH2PuUrDOqwm3yLltGasN+KhCAqszhYtXbplRbpF8ceU69KStWtGkIQQOulKcw
	 Owq6UNSu0/c55mHH2AIGy5roE361X9xKcrrxMy+AJRSLgy94fWo3Tglk2dwwtMNt0Q
	 kRgEoH5V/9iNktiNz+Oj1cI8DgUbX0GulA+4GXgKkwmzq+SAHF6uxTBxSf06AQG7sg
	 kvkMheTPemD+akGT1hDXl4Y6Tw11NJdGhjgR1YMqJxBHRYu9fiMLnN7xvtxaa6iOve
	 6LCfNn14ZtTVZ22FvonrnRONSO7lmAFTVwuQ90xkCQsGzzP8CyJas+m97WgU5tVeSI
	 CQ9jjREl5ooLg==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 16:52:58 +0200
Message-Id: <DDIZC4MK2CFW.1DPDIJR4HPKGY@kernel.org>
Subject: Re: [PATCH v4 2/2] rust: leds: add basic led classdev abstractions
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Lee Jones" <lee@kernel.org>, "Pavel
 Machek" <pavel@kernel.org>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-leds@vger.kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251012145221.172116-1-markus.probst@posteo.de>
 <20251012145221.172116-3-markus.probst@posteo.de>
 <aO1GM4WXs37Zpm0G@google.com>
 <7de58fd25b52dd5195c8ac06ed4df5a1e60e5070.camel@posteo.de>
In-Reply-To: <7de58fd25b52dd5195c8ac06ed4df5a1e60e5070.camel@posteo.de>

On Wed Oct 15, 2025 at 3:44 PM CEST, Markus Probst wrote:
> On Mon, 2025-10-13 at 18:34 +0000, Alice RyhlV wrote:
>> On Sun, Oct 12, 2025 at 02:52:39PM +0000, Markus Probst wrote:
>> > Implement the core abstractions needed for led class devices,
>> > including:
>> >=20
>> > * `led::LedOps` - the trait for handling leds, including
>> > =C2=A0 `brightness_set`, `brightness_get` and `blink_set`
>> >=20
>> > * `led::InitData` - data set for the led class device
>> >=20
>> > * `led::Device` - a safe wrapper around `led_classdev`
>> >=20
>> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
>>=20
>> > +pub trait LedOps: Send + 'static + Sized {
>> > +=C2=A0=C2=A0=C2=A0 /// If set true, [`LedOps::brightness_set`] and
>> > [`LedOps::blink_set`] must not sleep
>> > +=C2=A0=C2=A0=C2=A0 /// and perform the operation immediately.
>> > +=C2=A0=C2=A0=C2=A0 const BLOCKING: bool;
>> > +=C2=A0=C2=A0=C2=A0 /// The max brightness level
>> > +=C2=A0=C2=A0=C2=A0 const MAX_BRIGHTNESS: u32;
>> > +
>> > +=C2=A0=C2=A0=C2=A0 /// Sets the brightness level.
>> > +=C2=A0=C2=A0=C2=A0 ///
>> > +=C2=A0=C2=A0=C2=A0 /// See also [`LedOps::BLOCKING`]
>> > +=C2=A0=C2=A0=C2=A0 fn brightness_set(&self, brightness: u32) -> Resul=
t<()>;
>> > +
>> > +=C2=A0=C2=A0=C2=A0 /// Gets the current brightness level.
>> > +=C2=A0=C2=A0=C2=A0 fn brightness_get(&self) -> u32 {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_error!(VTABLE_DEFAUL=
T_ERROR)
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 /// Activates hardware accelerated blinking.
>> > +=C2=A0=C2=A0=C2=A0 ///
>> > +=C2=A0=C2=A0=C2=A0 /// delays are in milliseconds. If both are zero, =
a sensible
>> > default should be chosen.
>> > +=C2=A0=C2=A0=C2=A0 /// The caller should adjust the timings in that c=
ase and if
>> > it can't match the values
>> > +=C2=A0=C2=A0=C2=A0 /// specified exactly. Setting the brightness to 0=
 will
>> > disable the hardware accelerated
>> > +=C2=A0=C2=A0=C2=A0 /// blinking.
>> > +=C2=A0=C2=A0=C2=A0 ///
>> > +=C2=A0=C2=A0=C2=A0 /// See also [`LedOps::BLOCKING`]
>> > +=C2=A0=C2=A0=C2=A0 fn blink_set(&self, _delay_on: &mut usize, _delay_=
off: &mut
>> > usize) -> Result<()> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_error!(VTABLE_DEFAUL=
T_ERROR)
>> > +=C2=A0=C2=A0=C2=A0 }
>>=20
>> These functions should probably take a &Device<Bound> argument so
>> that
>> they can use methods that require a bound device (such as IO).
> How about instead something like
>
> mod device {
>
>   unsafe trait Container<Ctx: DeviceContext>: AsRef<Device<Ctx>> {
>     const Offset: usize;
>
>     unsafe fn from_device(dev: &Device<Ctx>) -> &Self {
>        <implementation here>
>     }
>   }
>
>   unsafe impl Device<Ctx> for Container<Ctx> {
>     const Offset: usize =3D 0;
>   }
>
> }
>
> And instead of passing &Device<Bound> to the functions, we should add a
> type parameter to LedOps, e.g.:
>
> trait LedOps<T: device::Container<device::Bound>> {
>
>   ...
>
>   fn brightness_set(&self, dev: &T, brightness: u32) -> Result<()>;
>
>   ...
>
> }
>
> impl<T: LedOps<E>, E: device::Container<device::Bound>> Device<T> {
>
>   pub fn new<'a>(
>         parent: &'a E,
>         init_data: InitData<'a>,
>         ops: T,
>     ) -> impl PinInit<Devres<Self>, Error> + 'a {
>      ...
>   }
>
>   ...
>
> }
>
> In the example of i2c (or any other container for `struct device`), we
> implement the device::Container trait:
>
> mod i2c {
>
>   unsafe impl device::Container for I2cClient {
>     const Offset: usize =3D offset_of!(bindings::i2c_client, dev);
>   }
>
> }
> This allows the LedOps function to use any functions from the I2cClient
> or any other device container which may be used (removing the need to
> store it inside the LedOps implementations struct). It still allows
> Device<Bound> to be used, as it also would implement device::Container.

I had a similar idea in the past, but it has some disadvantages:

  (1) You have to implement the upcast from a generic device to a bus devic=
e for
      every bus device.

  (2) You have to store a Box<dyn T> in the Rust LED class device; the C st=
ruct
      device can't carry the fat pointer.

The alternative would be to provide a safe method for bus devices to upgrad=
e to
a bound device by presenting its corresponding &Device<Bound> base device, =
for
instance:

	impl I2cClient {
	    pub fn into_bound<'a>(&'a self, &'a Device<Bound>) -> Result<&'a I2cCl=
ient<Bound>> {
	        // Fails if the presented `&Device<Bound` is not the base device o=
f `self`.
	        ...
	    }
	}

The advantage is that this can easily be implemented with a macro for all b=
us
devices.

There is a slight downside in ergonomics due to the into_bound() call thoug=
h:

	fn brightness_set(&self, parent: &Device<Bound>, brightness: u32) -> Resul=
t {
	    let i2c: &I2cClient<Bound> =3D self.i2c.into_bound(parent)?;

	    ...
	}

