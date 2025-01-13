Return-Path: <linux-leds+bounces-3762-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271AA0B7C7
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 14:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 506AE3A4A72
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1651C22A4D2;
	Mon, 13 Jan 2025 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el9zlBBp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB322045B2;
	Mon, 13 Jan 2025 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773864; cv=none; b=PPZ8UbH2ni889OgCB95mPrLuTwRuSbTTNnyzrXjfS+bEWNeFaZpTSwh55+gfSn7BIBdSdYsqYuHgwU6r7X6Pe07FQj4CD/lkSFcJtjZZ9t4g6coFl/xWr0AnCviDddSfX+QY2pE9X2DQKdKGZX1cIWy9pwSrs7k8H7L0ApUjM3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773864; c=relaxed/simple;
	bh=Sa5ZISg0z+ntugA86i8FspanCvrFn8XYflpBz61M2zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/IPbqUGZlFneNJB4hf7MHM/mejKF/t1mwLpJgi+9nK5ldSc7gmrqQnmhthO5pNr5yCl9WZBsNILN2pMwK8wb/SpXJ3+Z11kvPwIMcLkIW0t6PBxd5zhoWpz7QHQRZ8sfgjbj1NHqNRVAI3OfS0HrAKhYR5tjxWyxWzS9I1E81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el9zlBBp; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ef7733a1dcso994781a91.3;
        Mon, 13 Jan 2025 05:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736773860; x=1737378660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdJDhp+iY4n7yIgrSVYba1PlflJYQ6SUiiKbLS23I7Q=;
        b=el9zlBBp6mInCFzxeSuSaJcdLj8vqvTzNg7oiYLWBYtRqkalU/eG2hHvLNfgp3Qmno
         aF6DT+E3YwxWbXjCvbhJz5UhrhbrQMmBGD30mUJ9wiAwAfoIqXbGSXQQWIck981/UxYB
         Al+OD5jajJMUH0N4Soxpvkva96P6nIb9LwJplcnVO+9cMM8H3A4Fw8WQ8Y6epE5DFEl5
         9ie0SoNQlr26TAfVCMmKzeYZBD4QfHbksg7b7GTRjgJI9t69B9NTkWqQuDdkGYBpVWMV
         AqA9sESC7Yph05c4w87Z1pZZjbF27gg0BTgak33XuyqnYSlOdb6TTuhVmff+KOJzJqAF
         ZxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736773860; x=1737378660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdJDhp+iY4n7yIgrSVYba1PlflJYQ6SUiiKbLS23I7Q=;
        b=Ipf9BnynxNi92OS4Yd/XSxmWnpKO3Y55nRkaSscTn7lE0hOUDre4dGodumTmmfojEK
         oTmlDetahUmXeyML8gWFToi5AGYZQMEIDNH0Yv6kJtZE/7qT7F5OlzIp4coOYOsP908a
         0JMt/RXdnOYOwLC692ZDE/1hdfO39XSelkMAQjLGxscMpy0rk+mxf9g+nt4+YpIY/ZkP
         dQ4IHxw9UevpcT01v06eYCzQQIrGX+lHO6AIKOMhfwdXc8XMB+Og+6VMQ7UgAvz5Fm/K
         SPXxbgDgOuaJkbUZ/fWQqcX+L5Fq1M2nBwa6vNMa7brFPGL5hQZR79VBDijJ4DQrduV7
         9Cqw==
X-Forwarded-Encrypted: i=1; AJvYcCVrM+s/5vkEs6dZZHRFihAoZUTL19ZI313wS7wurYPCaBN7+zDh/qKExV3hyHnhLJjKaev+S4fMevbHjNRrlEg=@vger.kernel.org, AJvYcCWio6HDiNJGg9kQ5msPD1kk6zcRTNILBGOidha4FwCA32WrUl9g5b83zhW63voXE8pcrECCu/NXwGU5bA==@vger.kernel.org, AJvYcCXwLR8taf8udHM+NWQE2pYkODK7x44NltPbfphdIlfABRU2x08FufrLiIQIncyUpGN43Z4Saqr1NM3W3vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfy9hpmDs7GvPMz+J7Zkd0mCAs4KLeLsgUFCTZH+UQBk8JRUW
	bpq/cTmns2EOYCmB9DqCb9aFYZBRYO+2IDeTRfvWo5BEFqXuzBW8NKiR4PCJ57eRd2mfXD2+Tob
	WvFaeUa9sF/mTreGan4YQDQZ0XB4=
X-Gm-Gg: ASbGncu15YIE8m0HIdspT/l81e4RRVTJouUo+jY+zUVJkMEdc7ujRdiJukPClxL+KB2
	aj7VixVZ3pljDnj+Hq8zyQpNDnk4fRXN5ey6uvQ==
X-Google-Smtp-Source: AGHT+IEIcnrpgv25CLwOlLmjYFRnYgPUL2G6leVb0yLbPATss4ojfSeRE6/BYRG99iNfypNeQM8RPxal703I6KxAu6E=
X-Received: by 2002:a17:90b:5184:b0:2ea:853a:99e0 with SMTP id
 98e67ed59e1d1-2f5490aa11cmr11756947a91.5.1736773860107; Mon, 13 Jan 2025
 05:11:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113121620.21598-1-me@kloenk.dev> <20250113121620.21598-3-me@kloenk.dev>
In-Reply-To: <20250113121620.21598-3-me@kloenk.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Jan 2025 14:10:48 +0100
X-Gm-Features: AbW1kvZ06MslHfqwY1XC4kMC8S7Kmzlo_96sjpBTemjO0VBoc8jxW5-acj1KrXg
Message-ID: <CANiq72mSTBC0=kdNxqRvZR+MWwGwO_7yO+nMTvkp4LSNU9HAZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: leds: Add Rust bindings for LED subsystem
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee@kernel.org>, Jean Delvare <jdelvare@suse.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Peter Koch <pkoch@lenovo.com>, 
	rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fiona,

Thanks for this! I noticed a procedural thing (the last diff chunk,
please see below), so I took the chance to give a few quick
surface-level comments I noticed while scrolling, mostly on docs :)

On Mon, Jan 13, 2025 at 1:16=E2=80=AFPM Fiona Behrens <me@kloenk.dev> wrote=
:
>
> +    /// Get String representation of the Color.

[`String`], [`Color`]

i.e. please format, and use intra-doc links where possible/reasonable.

> +        // SAFETY: pointer from above, valid for static lifetime.

In general, try to explain why, not just what, in the safety comments,
i.e. why it is valid for a static lifetime? e.g. does the C API
guarantee it?

> +    /// Get String representation of the Color as rust type.
> +    #[inline]
> +    pub fn name(&self) -> Option<&'static str> {

"Rust type"

However, I am not sure what it is trying to say. I would have thought
it is a custom newtype of something or perhaps something strange is
going on, but I guess you are referring to `str` vs. `CStr`? In
general, I don't think we need to say "as a Rust type" -- it may
confuse more than help.

> +                // SAFETY: name from C name array which is valid UTF-8.

What guarantees this? i.e. I imagine you looked into all the cases
from the static table, so I would for instance say: "All values in the
C name array are valid UTF-8." or similar (perhaps mention which
array, so that people can e.g. grep).

> +impl core::fmt::Display for Color {
> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result=
 {
> +        f.write_str(self.name().unwrap_or("Invalid color"))
> +    }
> +}

Can this happen? If not, should `Color` have an `# Invariant` and
would we need the `Option<...>` for names then?

In any case, here, shouldn't the error be bubbled up?

> +    /// Tris to convert a u32 into a [`Color`].

Typo: Tries
Format: [`u32`]

There are also other typos ("brightnes", "Activae") -- I recommend
`checkpatch.pl` with the `--codespell` flag which may help catching
some of these.

> +    /// Get the LED brightness level.
> +    fn brightness_get(_this: &mut Self::This) -> u8 {
> +        crate::build_error(crate::error::VTABLE_DEFAULT_ERROR)
> +    }

Please use the macro instead (see 15f2f9313a39 ("rust: use the
`build_error!` macro, not the hidden function")). Soon we will have it
in the prelude too (see 4401565fe92b ("rust: add `build_error!` to the
prelude")), by the way.

> +        // SAFETY: By the safety requirement of this function `delay_on`=
 is pointing to a valid `c_ulong`.
> +        let on =3D Delta::from_millis(unsafe { *delay_on } as i64);

I didn't look into most comments, but e.g. I noticed this one does not
look correct -- the safety requirements for this function do not
mention anything about `delay_on`, no?

> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 38da79925586..3c348ce4a7c2 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -143,4 +143,11 @@ pub fn as_nanos(self) -> i64 {
>      pub fn as_micros_ceil(self) -> i64 {
>          self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USE=
C
>      }
> +
> +    /// Return the smallest number of milliseconds greater than or equal
> +    /// to the value in the `Delta`.
> +    #[inline]
> +    pub fn as_millis_ceil(self) -> i64 {
> +        self.as_nanos().saturating_add(NSEC_PER_MSEC - 1) / NSEC_PER_MSE=
C
> +    }

This should probably be its own patch, with Cc to the timekeeping
maintainers etc.

Cheers,
Miguel

