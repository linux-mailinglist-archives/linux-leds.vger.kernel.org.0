Return-Path: <linux-leds+bounces-3406-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0709CFFAF
	for <lists+linux-leds@lfdr.de>; Sat, 16 Nov 2024 16:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3800EB22CA0
	for <lists+linux-leds@lfdr.de>; Sat, 16 Nov 2024 15:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DAD7D3F4;
	Sat, 16 Nov 2024 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5zVHCkT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BA18052;
	Sat, 16 Nov 2024 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731772064; cv=none; b=f8B/Uyj4B8ZOtKaoUSYUy9GrvqtkoGPmSCSgF1whwjgdLlNFIjf3TSrtCsG97ttDg+QbOV9gEHvcY6dHVgui6XXULa5SAndVa2vu3BDHR+emHNMZeyk7/U1uTZw+R1PZgDnkHpyWolBVgwIac0iJpCZ61hQzQZT81p5Xa/O/1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731772064; c=relaxed/simple;
	bh=M49TRIBAVxrm/P8SCFGwuYjCl0z57oQDk6m2q50Svuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGPfhn0pedsecLqqrDcK1leVECTHjfGEt7WoOLkAa+k2+J8HyKvqrO759edPT18anLybPYDYFFTYxiBbUPUCvjFHYfGP0qtEmRmIZPqRyyT7gO1ay5g2z23qPMTj3TnyZSOrLy7RUO15bOWjOQUXaRVs+Zg53+3yNRyibHhPWAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5zVHCkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2B9C4CED2;
	Sat, 16 Nov 2024 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731772063;
	bh=M49TRIBAVxrm/P8SCFGwuYjCl0z57oQDk6m2q50Svuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5zVHCkTZaYCMKKFM1HCFdYbMaSkcG538fSL09v7tLe9+8FqvMykEUHwYf3Io4U+G
	 DkDHiM7vnKfgiyrZ51ogcqFviuK0aWXuh0tHMNe644GvKq3yl44B2iUKpRVppd+YMJ
	 sbm7r/12eT9rUqPV7x+NpU2BvpU2UTaJy1H3cQ6m0yd3RahjJtL50sFDQOA+sWde7d
	 +94/bH7fvAQ3jwb/0BlFiP4GT4sFi1SwL7CV4qn/wrxAxl8ekGYZMrsiTPVVapCDRh
	 aRPq5VIY3vxVjtQFf9WwAwEDP7FE2hAKM1lVODFmXRIBnThkdDMlU71alyvBlXzX6K
	 yvjo8DwMKzWMQ==
Date: Sat, 16 Nov 2024 16:47:37 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Fiona Behrens <me@kloenk.dev>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] rust: LED abstraction
Message-ID: <snsf4cc6valp5ovrrbjv7fefxtkthifsis5el4teajzwjhmv4x@ghxovfdqkhop>
References: <20241009105759.579579-1-me@kloenk.dev>
 <20241009105759.579579-2-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009105759.579579-2-me@kloenk.dev>

On Wed, Oct 09, 2024 at 12:57:58PM +0200, Fiona Behrens wrote:

> +/// Color of an LED.
> +#[derive(Copy, Clone)]
> +pub enum Color {
> +    /// White
> +    White,
> +    /// Red
> +    Red,
> +    /// Green
> +    Green,
> +    /// Blue
> +    Blue,
> +    /// Amber
> +    Amber,
> +    /// Violet
> +    Violet,
> +    /// Yellow
> +    Yellow,
> +    /// Purple
> +    Purple,
> +    /// Orange
> +    Orange,
> +    /// Pink
> +    Pink,
> +    /// Cyan
> +    Cyan,
> +    /// Lime
> +    Lime,

Why these repetitions?

> +impl TryFrom<u32> for Color {
> +    type Error = Error;
> +
> +    fn try_from(value: u32) -> Result<Self, Self::Error> {
> +        Ok(match value {
> +            bindings::LED_COLOR_ID_WHITE => Color::White,
> +            bindings::LED_COLOR_ID_RED => Color::Red,
> +            bindings::LED_COLOR_ID_GREEN => Color::Green,
> +            bindings::LED_COLOR_ID_BLUE => Color::Blue,
> +            bindings::LED_COLOR_ID_AMBER => Color::Amber,
> +            bindings::LED_COLOR_ID_VIOLET => Color::Violet,
> +            bindings::LED_COLOR_ID_YELLOW => Color::Yellow,
> +            bindings::LED_COLOR_ID_PURPLE => Color::Purple,
> +            bindings::LED_COLOR_ID_ORANGE => Color::Orange,
> +            bindings::LED_COLOR_ID_PINK => Color::Pink,
> +            bindings::LED_COLOR_ID_CYAN => Color::Cyan,
> +            bindings::LED_COLOR_ID_LIME => Color::Lime,
> +            bindings::LED_COLOR_ID_IR => Color::IR,
> +            bindings::LED_COLOR_ID_MULTI => Color::Multi,
> +            bindings::LED_COLOR_ID_RGB => Color::RGB,
> +            _ => return Err(EINVAL),
> +        })
> +    }
> +}

How does Rust compile these? If these constants compile to the same
numeric values, i.e. if
  LED_COLOR_ID_AMBER == Color::Amber,
will the compiler compile away the function?

How do enums work in Rust?

> +impl<'a, T> Led<T>

offtopic, what is 'a ? What does the ' mean? Is impl<> something like
template in c++?

> +where
> +    T: Operations + 'a,

What does + mean here?

> +/// LED brightness.
> +#[derive(Debug, Copy, Clone)]
> +pub enum Brightness {
> +    /// LED off.
> +    Off,
> +    /// Led set to the given value.
> +    On(NonZeroU8),
> +}
> +
> +impl Brightness {
> +    /// Half LED brightness
> +    // SAFETY: constant value non zero
> +    pub const HALF: Self = Self::On(unsafe { NonZeroU8::new_unchecked(127) });
> +    /// Full LED brightness.
> +    pub const FULL: Self = Self::On(NonZeroU8::MAX);

These LED_OFF, LED_ON, LED_HALF and LED_FULL are deprecated constants
that should not be used anymore. enum led_brightness will be either
uint8_t or usigned int in the future.

Is it possible to not infect Rust with these deprecated constants?

Marek

