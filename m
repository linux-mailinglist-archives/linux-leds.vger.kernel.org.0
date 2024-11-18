Return-Path: <linux-leds+bounces-3409-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE09D0E6E
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 11:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0314C281581
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 10:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E9918871A;
	Mon, 18 Nov 2024 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2hvfNMdZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C963919AA56
	for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731925367; cv=none; b=K47ToQSoY7T1i7wXz8oAI2ECkdcvJYCYpGa61ngDGm6WAWBYiIPRfomwhOA+25zAYtnyRhaThIjhldsHCuxuyjUdVHPszlGUD5AhjAFFG5NZfkP1NZEjpUYvhzZJePjHb1RJ/msNqEFLkh4taXo/Zd4BHsF8bqm6e/pcXKe1d34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731925367; c=relaxed/simple;
	bh=iuJuV5q/Ib9dcphDRf3TAd0YCwdozV2yCknG7HW3jZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1XskFl7+wymNjj/mRD3ggVpwx29uK8oiFuiOR1bt7DISk9aGOdJt6vBocj7Wt9DzE5GbZDn33Ynf9lpmhvKPA77tWD9wYNekQNg7fx4MkLfFok8lvvrWALUnB3EgqnmixemY5maO+61ODKaIAICnDhXHDqTNr1iXwq16A2eQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2hvfNMdZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53da3545908so1886950e87.1
        for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 02:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731925364; x=1732530164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjpjOtr4jTi2V8JGqsZR3B1wLA+5BzuRYojm/xVmucw=;
        b=2hvfNMdZ34WVWyZ9/lv/fJ2AdSOzEeg9bSP7uiT64Xs13kx/RCLURr17eyEIksNTni
         jssW7Ra/dxxUSZPtg29a4YTy+aOljUL6bEyEhKm2ZKa4JlaO/IZYfPUN8XL5U7iBxuaI
         TuPnuvwOaGDa+Aceq0uMrJAiKNWhJbgKO7QEmzsyIOlo8IizT4rktvZ0kgxshQx93nFA
         6rSaUPeSH3wBahwwo3Yez5Vlyntxa8aKr2zU8f8bc6M+BJ8P+cR6MfYTu24DczBCM/im
         NWegPlceKKTGeX1s+dyWmZWaEyt1uXXfekdSUMXIDTZlBXJlTnnvghKyAws42XaxILwt
         jPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731925364; x=1732530164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjpjOtr4jTi2V8JGqsZR3B1wLA+5BzuRYojm/xVmucw=;
        b=OE43VUDQDk45196PXMlsID5Ix2WhhrYzLC3d4LSPZXzb5n/PrdjOvQD9WbLNNuiEAe
         1BhZYI2lh3xJq7cFqynffGRcjBsfIGZE1piCi7mxGQ6VoDy6JwRE6HJqzmckpRGeMzM+
         nQcXEKQlbHf3d3A8DmSu4U04Sbs10iPipF0xI2+CMKx9wKCKTJpNXd80RGAaDEqJHQ84
         AlD6FSkFxsF58buoalC7Xjz8xPlOgGs0mRkYQxAWS+8XB7U5v5Dgfoet0olg6mn8RanR
         BnIz82ECj+CkqMwairK5Q3+IUSQ0XAg8jqvuT99OgvsdsJQv31VWvn+Jf87Pm9R0d4Es
         /I3g==
X-Forwarded-Encrypted: i=1; AJvYcCWMpx17ZdZA+pmINkWQKsv4Cv9koS04mTN2PwRJqI9mpxFHgtJsDw9A3OoWWid+C/uyE9frD2KtDswL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59c8DqRSH6JM2KQnJjfH1TB8Bktw7FskqPixbis3wG7mpxgVW
	iO2++9l5mT1vgjvjj+/5IS86Zx2LYQkXhQlaqAUiQyqe1RJJ5St+q7EPqdX21cUuaLt26TqN23k
	RjMV9Tm2cwz99lBa0zB/Ns9S1Q3d4H+Y8C3NA
X-Google-Smtp-Source: AGHT+IEZ0eBnMjmOp6HX5wMSHA5Bjt/VzflvzwE0qjWxJaryCmf+Xl5JR+1DtxvTGFmREncYHZpcQue6+XSitcpBy/8=
X-Received: by 2002:a05:6512:2252:b0:536:7a24:8e82 with SMTP id
 2adb3069b0e04-53dab29ba62mr3666839e87.13.1731925363792; Mon, 18 Nov 2024
 02:22:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009105759.579579-1-me@kloenk.dev> <20241009105759.579579-2-me@kloenk.dev>
In-Reply-To: <20241009105759.579579-2-me@kloenk.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Nov 2024 11:22:31 +0100
Message-ID: <CAH5fLggju9ZYPD7LRTZKXJ9dhuLJ0uAS-USAokeoSvjOiN1v=w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rust: LED abstraction
To: Fiona Behrens <me@kloenk.dev>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:58=E2=80=AFPM Fiona Behrens <me@kloenk.dev> wrote=
:
> +impl<'a, T> Led<T>
> +where
> +    T: Operations + 'a,
> +{
> +    /// Register a new LED with a predefine name.
> +    pub fn register_with_name(
> +        name: &'a CStr,
> +        device: Option<&'a Device>,
> +        config: &'a LedConfig,
> +        data: T,
> +    ) -> impl PinInit<Self, Error> + 'a {
> +        try_pin_init!( Self {
> +            led <- Opaque::try_ffi_init(move |place: *mut bindings::led_=
classdev| {
> +            // SAFETY: `place` is a pointer to a live allocation, so era=
sing is valid.
> +            unsafe { place.write_bytes(0, 1) };
> +
> +            // SAFETY: `place` is a pointer to a live allocation of `bin=
dings::led_classdev`.
> +            unsafe { Self::build_with_name(place, name) };
> +
> +            // SAFETY: `place` is a pointer to a live allocation of `bin=
dings::led_classdev`.
> +            unsafe { Self::build_config(place, config) };
> +
> +            // SAFETY: `place` is a pointer to a live allocation of `bin=
dings::led_classdev`.
> +            unsafe { Self::build_vtable(place) };
> +
> +        let dev =3D device.map(|dev| dev.as_raw()).unwrap_or(ptr::null_m=
ut());
> +            // SAFETY: `place` is a pointer to a live allocation of `bin=
dings::led_classdev`.
> +        crate::error::to_result(unsafe {
> +            bindings::led_classdev_register_ext(dev, place, ptr::null_mu=
t())
> +        })
> +            }),
> +            data: data,
> +        })
> +    }
> +
> +    /// Add nameto the led_classdev.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` has to be valid.
> +    unsafe fn build_with_name(ptr: *mut bindings::led_classdev, name: &'=
a CStr) {
> +        // SAFETY: `ptr` is pointing to a live allocation, so the deref =
is safe.
> +        let name_ptr =3D unsafe { ptr::addr_of_mut!((*ptr).name) };
> +        // SAFETY: `name_ptr` points to a valid allocation and we have e=
xclusive access.
> +        unsafe { ptr::write(name_ptr, name.as_char_ptr()) };
> +    }
> +
> +    /// Add config to led_classdev.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` has to be valid.
> +    unsafe fn build_config(ptr: *mut bindings::led_classdev, config: &'a=
 LedConfig) {
> +        // SAFETY: `ptr` is pointing to a live allocation, so the deref =
is safe.
> +        let color_ptr =3D unsafe { ptr::addr_of_mut!((*ptr).color) };
> +        // SAFETY: `color_ptr` points to a valid allocation and we have =
exclusive access.
> +        unsafe { ptr::write(color_ptr, config.color.into()) };
> +    }
> +}

This usage of lifetimes looks incorrect to me. It looks like you are
trying to say that the references must be valid for longer than the
Led<T>, but what you are writing here does not enforce that. The Led
struct must be annotated with the 'a lifetime if you want that, but
I'm inclined to say you should not go for the lifetime solution in the
first place.

Alice

