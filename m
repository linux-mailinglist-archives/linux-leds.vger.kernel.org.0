Return-Path: <linux-leds+bounces-3421-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7F9D4A49
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 10:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489881F22723
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 09:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97771AAE37;
	Thu, 21 Nov 2024 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="cXEp51ru"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4295916C6B7;
	Thu, 21 Nov 2024 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732182998; cv=none; b=HGLU3sfgEgN4WLHRSL91pZU52aPoY/G4blN792Y3EC3eb0hhKfxJiNXScrO5IqBfN7j7T1lXKuxnaRKhw2bZzwB0y+WanQGlGWpLDRj/VJMI/zg3IASu5RLhDKTe+EV9cMtHgAiqekJ//CzH+UtB3epUdIIvSCbJFA1SYgyl4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732182998; c=relaxed/simple;
	bh=6a1lmDXRXaByFiYEkhzgdStYxEcDxqiScLYSKWsVP60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FNHxX/tHku+gWnPnjpJl1AMCTWKHICOKVNNEKLUD4dO9Etkvd9mUP644rNTvVgLAjehZn8OXuj4iIp0yH87A53Jk5JO8ZxaTE5QjVBbTuRbycSPMPJwxvet16u17FLcHl/06Leo1rk2/BHMDIkpAcjsgZJvBR6kcBzL9xqbakaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=cXEp51ru; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1732182470; bh=U0s3KJOlLfA2r4fDPFHTpZA+EytCFoDVxiqRkfVovus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cXEp51ruoUuqLv0ZG8cgYz14l94uKLBLx6Wc7UKvJcSQKdb1Yk6dFH1G773qd/p1C
	 3mTxnv22c8wR9QkomauNXmLSxNd+pSeg9CalIicmiP/XEo998GswIifpKiACobL03U
	 t2LbX3TZUjlvqDJZIFrMAfSu29gIO/fkCh8lR1xA=
To: Alice Ryhl <aliceryhl@google.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-leds@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] rust: LED abstraction
Date: Thu, 21 Nov 2024 10:47:49 +0100
Message-ID: <6F3F4134-23FF-4230-9DC2-219FACAF546E@kloenk.dev>
In-Reply-To: <CAH5fLggju9ZYPD7LRTZKXJ9dhuLJ0uAS-USAokeoSvjOiN1v=w@mail.gmail.com>
References: <20241009105759.579579-1-me@kloenk.dev>
 <20241009105759.579579-2-me@kloenk.dev>
 <CAH5fLggju9ZYPD7LRTZKXJ9dhuLJ0uAS-USAokeoSvjOiN1v=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 18 Nov 2024, at 11:22, Alice Ryhl wrote:

> On Wed, Oct 9, 2024 at 12:58=E2=80=AFPM Fiona Behrens <me@kloenk.dev> w=
rote:
>> +impl<'a, T> Led<T>
>> +where
>> +    T: Operations + 'a,
>> +{
>> +    /// Register a new LED with a predefine name.
>> +    pub fn register_with_name(
>> +        name: &'a CStr,
>> +        device: Option<&'a Device>,
>> +        config: &'a LedConfig,
>> +        data: T,
>> +    ) -> impl PinInit<Self, Error> + 'a {
>> +        try_pin_init!( Self {
>> +            led <- Opaque::try_ffi_init(move |place: *mut bindings::l=
ed_classdev| {
>> +            // SAFETY: `place` is a pointer to a live allocation, so =
erasing is valid.
>> +            unsafe { place.write_bytes(0, 1) };
>> +
>> +            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
>> +            unsafe { Self::build_with_name(place, name) };
>> +
>> +            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
>> +            unsafe { Self::build_config(place, config) };
>> +
>> +            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
>> +            unsafe { Self::build_vtable(place) };
>> +
>> +        let dev =3D device.map(|dev| dev.as_raw()).unwrap_or(ptr::nul=
l_mut());
>> +            // SAFETY: `place` is a pointer to a live allocation of `=
bindings::led_classdev`.
>> +        crate::error::to_result(unsafe {
>> +            bindings::led_classdev_register_ext(dev, place, ptr::null=
_mut())
>> +        })
>> +            }),
>> +            data: data,
>> +        })
>> +    }
>> +
>> +    /// Add nameto the led_classdev.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// `ptr` has to be valid.
>> +    unsafe fn build_with_name(ptr: *mut bindings::led_classdev, name:=
 &'a CStr) {
>> +        // SAFETY: `ptr` is pointing to a live allocation, so the der=
ef is safe.
>> +        let name_ptr =3D unsafe { ptr::addr_of_mut!((*ptr).name) };
>> +        // SAFETY: `name_ptr` points to a valid allocation and we hav=
e exclusive access.
>> +        unsafe { ptr::write(name_ptr, name.as_char_ptr()) };
>> +    }
>> +
>> +    /// Add config to led_classdev.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// `ptr` has to be valid.
>> +    unsafe fn build_config(ptr: *mut bindings::led_classdev, config: =
&'a LedConfig) {
>> +        // SAFETY: `ptr` is pointing to a live allocation, so the der=
ef is safe.
>> +        let color_ptr =3D unsafe { ptr::addr_of_mut!((*ptr).color) };=

>> +        // SAFETY: `color_ptr` points to a valid allocation and we ha=
ve exclusive access.
>> +        unsafe { ptr::write(color_ptr, config.color.into()) };
>> +    }
>> +}
>
> This usage of lifetimes looks incorrect to me. It looks like you are
> trying to say that the references must be valid for longer than the
> Led<T>, but what you are writing here does not enforce that. The Led
> struct must be annotated with the 'a lifetime if you want that, but
> I'm inclined to say you should not go for the lifetime solution in the
> first place.

The `led_classdev_register_ext` function copies the name, therefore the i=
dea was that the name only has to exists until the pin init function is c=
alled, which should be the case with how I used the lifetimes here

Fiona

>
> Alice

