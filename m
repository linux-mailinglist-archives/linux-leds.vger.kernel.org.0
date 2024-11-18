Return-Path: <linux-leds+bounces-3408-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB69D0E5A
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 11:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B4E2813DE
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 10:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DD5193078;
	Mon, 18 Nov 2024 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyWSlQSP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DB413957E
	for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731925178; cv=none; b=b6akhWktbfGgqmrp5BCYRJd0noC3tCPhdYvBrXaCo/aJp70Z+t2ZNyKJyyDoo+isAB0E57tuCLXPa9ACqmBBPFC5vhaGlIfxTJXM56keWv6wyZdHmgJpxT9U3IosjlAYvn+nCCYTXn5x4lPqDEapoEfpv5zXs7+y6trVfMPOtUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731925178; c=relaxed/simple;
	bh=Rax6lueyWacS3m5xDCDewow2hehHpuuYcm6qKoAPoGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy4pr32QKdELr+INmrmoGUbXbAxdwVm/EWIgzL7GrEElaWdtIXX81fFAnFgq3n/lI+VD3LIePW1gDu2PBnoyPM48a36IEkN8eWnPvgQrlIV+mPzZ/nPhzpnSzCUQNyTdktOSlH30qjhu3LVpsPvJwVoNcwtKB3EvGoGJWxI+EXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyWSlQSP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3824709ee03so554064f8f.2
        for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731925174; x=1732529974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwWADfyCr2BC5TAT+DCbNFAyRnnXgdXIFe6xs1I/TUI=;
        b=OyWSlQSPHZtr5DN+PzopxWo+28jsbGU7otKxAv4a1NRTHBMDRoALWHbH0mEFrhttHB
         jArR3DCPtZ9z8r4fYhSnfaKijBTziiuDNEQRWNoskp5W7d9cj10Uwps0weHvndTkb4p0
         Pik++Pk94o0tweOOoYkf8fq/ILah09OpRTeiaPXYDTq/XJ7MPr7HmayEY/dMDWA/GX2r
         kSZeVstZ6nCC6Ezey+sMQLqJljmN/qLU0YpUQUACcN42mkUNDkKMYZmx1+EzwQxEd/DE
         SliGp3qy5FO66lGIaHmefBS1kifR7O0UkuIyhrz+f4Yx2p80ZPbmhu1TeYMKor4an7fA
         jR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731925174; x=1732529974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwWADfyCr2BC5TAT+DCbNFAyRnnXgdXIFe6xs1I/TUI=;
        b=oT35QrMDGgmYYAetGPCuKxv8nuxWapFiHtx4K10gKEKSjcK1k/TRatJJDGLafJ1CkI
         LmY4/1gGH6nksdCUwpBqX5VIXQAjwd2i4yyhxdgACGBBmiLdr36KKrOKgZGvlfQMAnlU
         PjKpIV1qfgj9axgSLmQysbduVc6VFFUN0uj/qbKMvflzJ2atqDhedcs2RZt1T03QHDeY
         5qlyeJ/UqSUwjqnEY/+zXgQkfycL1a5NewXV2/eB2iUbVhhX5thG0KTuOdVjK5FfbjRJ
         CPeKxhee7DSZ9zAhmh6P8T9OSEzTrfC5JioQ+Yc4LR87W2oh3tpaF5IdSDWPPnPL1Dni
         SXdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgse3+5cfdxD95YijFmtYzwLG/RWaJiCwHxoztc9Hb5RF7BH3+dlwRMBlbAivzrsRtbLdYme3uD6nr@vger.kernel.org
X-Gm-Message-State: AOJu0YxE0Fd2pYk1/rrbXdIzIyVLTEZHKsVIdYSOfgxIfhyizoZOxNbu
	dd38ZQmJCcQ2DfYwBMT1uZ9pMuqIQMwad8BzbvapQ2R98YOFFvJqhjRFbDa4zyB8ZwC3VDyTgj5
	1YxxxY5KqxtAbF34VtEgb4lTCRbXFIoCvK7ts
X-Google-Smtp-Source: AGHT+IFDuCFFF9qAITz79FZE1ou75NV3hWq3UbrD7F/i3+vJePDzNP2hkzupaucOBe8Jv8KaJYYyGiWVfLp+FISbZC4=
X-Received: by 2002:a05:6000:2587:b0:37e:d2b7:acd5 with SMTP id
 ffacd0b85a97d-38225a428f4mr8915076f8f.8.1731925172936; Mon, 18 Nov 2024
 02:19:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009105759.579579-1-me@kloenk.dev> <20241009105759.579579-2-me@kloenk.dev>
 <snsf4cc6valp5ovrrbjv7fefxtkthifsis5el4teajzwjhmv4x@ghxovfdqkhop>
In-Reply-To: <snsf4cc6valp5ovrrbjv7fefxtkthifsis5el4teajzwjhmv4x@ghxovfdqkhop>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Nov 2024 11:19:21 +0100
Message-ID: <CAH5fLghthWr4r0v=2xNE_UJntG6o6qRzdqHj_nu8AKUwUWh2Aw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rust: LED abstraction
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Fiona Behrens <me@kloenk.dev>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 4:47=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> On Wed, Oct 09, 2024 at 12:57:58PM +0200, Fiona Behrens wrote:
>
> > +/// Color of an LED.
> > +#[derive(Copy, Clone)]
> > +pub enum Color {
> > +    /// White
> > +    White,
> > +    /// Red
> > +    Red,
> > +    /// Green
> > +    Green,
> > +    /// Blue
> > +    Blue,
> > +    /// Amber
> > +    Amber,
> > +    /// Violet
> > +    Violet,
> > +    /// Yellow
> > +    Yellow,
> > +    /// Purple
> > +    Purple,
> > +    /// Orange
> > +    Orange,
> > +    /// Pink
> > +    Pink,
> > +    /// Cyan
> > +    Cyan,
> > +    /// Lime
> > +    Lime,
>
> Why these repetitions?

My guess is that it's to silence the warning about undocumented public
items. It may make sense to just silence the warning in this case.

> > +impl TryFrom<u32> for Color {
> > +    type Error =3D Error;
> > +
> > +    fn try_from(value: u32) -> Result<Self, Self::Error> {
> > +        Ok(match value {
> > +            bindings::LED_COLOR_ID_WHITE =3D> Color::White,
> > +            bindings::LED_COLOR_ID_RED =3D> Color::Red,
> > +            bindings::LED_COLOR_ID_GREEN =3D> Color::Green,
> > +            bindings::LED_COLOR_ID_BLUE =3D> Color::Blue,
> > +            bindings::LED_COLOR_ID_AMBER =3D> Color::Amber,
> > +            bindings::LED_COLOR_ID_VIOLET =3D> Color::Violet,
> > +            bindings::LED_COLOR_ID_YELLOW =3D> Color::Yellow,
> > +            bindings::LED_COLOR_ID_PURPLE =3D> Color::Purple,
> > +            bindings::LED_COLOR_ID_ORANGE =3D> Color::Orange,
> > +            bindings::LED_COLOR_ID_PINK =3D> Color::Pink,
> > +            bindings::LED_COLOR_ID_CYAN =3D> Color::Cyan,
> > +            bindings::LED_COLOR_ID_LIME =3D> Color::Lime,
> > +            bindings::LED_COLOR_ID_IR =3D> Color::IR,
> > +            bindings::LED_COLOR_ID_MULTI =3D> Color::Multi,
> > +            bindings::LED_COLOR_ID_RGB =3D> Color::RGB,
> > +            _ =3D> return Err(EINVAL),
> > +        })
> > +    }
> > +}
>
> How does Rust compile these? If these constants compile to the same
> numeric values, i.e. if
>   LED_COLOR_ID_AMBER =3D=3D Color::Amber,
> will the compiler compile away the function?

Well, it can't compile away the part where it returns EINVAL when the
u32 is not a valid color. But other than that, these matches are
usually optimized pretty well. I just tried a few different examples
in godbolt to confirm it. See e.g.:
https://rust.godbolt.org/z/WWM7891zW

That said, this relies on the assumption that they are represented
using the same values. We probably want to change the declaration to
this:

#[derive(Copy, Clone)]
pub enum Color {
    White =3D bindings::LED_COLOR_ID_WHITE,
    Red =3D bindings::LED_COLOR_ID_RED,
    Green =3D bindings::LED_COLOR_ID_GREEN,
    ...
}

That way we are guaranteed that the enum uses the right values for the
enum to make the conversion free.

> How do enums work in Rust?

In this case, the enum has no fields. In that case, the enum is a
value that is only allowed to have certain values.

Enums are also allowed to have fields. In this case, you can think of
it as a discriminated union, though in some cases Rust will store it
in a more clever way. You can look up the "null pointer optimization"
for an example of that.

> > +impl<'a, T> Led<T>
>
> offtopic, what is 'a ? What does the ' mean? Is impl<> something like
> template in c++?

Things starting with a tick are lifetimes, so 'a is the name of a
lifetime. That said, this usage of lifetimes looks incorrect to me, so
I wouldn't look too closely at this instance.

As for impl<>, then yes sort of. It is the <> that makes it like a
template. When you have an `impl TypeName { ... }` block, then that
defines methods for `TypeName`, which you can call as either
`value.method(...)` or `TypeName::method(...)` depending on the
signature. When you write `impl<T>`, then this means that it is a
template (we use the word "generic" in Rust rather than "template"),
that is

impl<T> TypeName<T> { ... }

becomes the following infinite list of impl blocks:

impl TypeName<i32> { ... }
impl TypeName<u32> { ... }
impl TypeName<String> { ... }
impl TypeName<TcpStream> { ... }
// ... and so on for all possible types

This logic works anywhere that <T> appears. For example, `struct
TypeName<T> { ... }` is short-hand for the following infinite list of
structs:

struct TypeName<i32> { ... }
struct TypeName<u32> { ... }
struct TypeName<String> { ... }
struct TypeName<TcpStream> { ... }
// ... and so on for all possible types

Of course, only things in this infinite list that you actually use end
up in the final binary.

The `where T: Operations` part is a filter for the infinite list. It
restricts it so that only types `T` that implement the `Operations`
trait are present in the list; all other types are filtered out.

> > +where
> > +    T: Operations + 'a,
>
> What does + mean here?

This is the same as:
where
    T: Operations,
    T: 'a
that is, apply two filters to the infinite list I mentioned above. The
meaning of `T: 'a` when the RHS is a lifetime is that `T` must not be
a type containing a lifetime annotation shorter than 'a.

> > +/// LED brightness.
> > +#[derive(Debug, Copy, Clone)]
> > +pub enum Brightness {
> > +    /// LED off.
> > +    Off,
> > +    /// Led set to the given value.
> > +    On(NonZeroU8),
> > +}
> > +
> > +impl Brightness {
> > +    /// Half LED brightness
> > +    // SAFETY: constant value non zero
> > +    pub const HALF: Self =3D Self::On(unsafe { NonZeroU8::new_unchecke=
d(127) });
> > +    /// Full LED brightness.
> > +    pub const FULL: Self =3D Self::On(NonZeroU8::MAX);
>
> These LED_OFF, LED_ON, LED_HALF and LED_FULL are deprecated constants
> that should not be used anymore. enum led_brightness will be either
> uint8_t or usigned int in the future.
>
> Is it possible to not infect Rust with these deprecated constants?
>
> Marek

