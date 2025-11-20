Return-Path: <linux-leds+bounces-6246-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE98C73C11
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 12:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 599BA2AC15
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 11:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534883203AA;
	Thu, 20 Nov 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uo1J8/rz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8252F60A1
	for <linux-leds@vger.kernel.org>; Thu, 20 Nov 2025 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638480; cv=none; b=JgxL2ttT9MJBO6mPYsjDph90T5kRjHiDnqR3eZ46AeWPmhhRero/bEm0bhG6e0ZVYlkD/OWM0T9f+8qoxmkinNgpZmItPPw1jRFIydYnghtc+74Cm9D0ccTClTEMZ5fyubENprLZ/bE/+VuAj9w/rR/aim+l5jJZPZbcVdkvFrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638480; c=relaxed/simple;
	bh=KP9M7UM3DOMv7x2JJX8u2Wkqx8XiQYNRNIYo7FJg4jA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lFJRQSdTDwqlp58cUg6gaRKrTs4eWB+wN3dquIsLlv9GcFXEmIjD4S6HlCo+ydSRZTDdEBWxxiPM3e8b4+mOug63FF/5B+onjJ1Auu5Vadnevg47AxvlTL/Ceqo14ZVJTHowyjhrB26klr0jI108wDtUfzOfiZrcLU4q8BJD/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uo1J8/rz; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2ffe9335so598411f8f.1
        for <linux-leds@vger.kernel.org>; Thu, 20 Nov 2025 03:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763638476; x=1764243276; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=irYXhJk+YQeGcC0lwAQH2NJi0CRJgcwHwSYlTrUVyWo=;
        b=Uo1J8/rzzOmAykhT8QeEoNjiD6ByR+ITbQqY/pEojvQzQt0YqxBWm211NH+un7gAjA
         AOEzFu+0m4+xlWyylQc2fe8O7yq8JvSlpyw9LBPsI5gbSkNpSfHeSOY+I6lhxQo5mpwL
         tyOiRIRenq0YE3T7tkaog3kqSc8kMWgHh7ux4UI/ikxLZkgrzqG+Hek5Q0QC+is/tiRG
         qNjMwS2YFKBFZHLRuLnEj0ubMUY02ymLwmOmfrXaiXyb+cK70LwrksfxEQvt8mqZXbtl
         iMd4+UHqtdLR1L0HmMq5meWoqzzINeRCjEKl/M7O//rY/qpA5v85tIXSaG1nV/aHr1QQ
         2ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638476; x=1764243276;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irYXhJk+YQeGcC0lwAQH2NJi0CRJgcwHwSYlTrUVyWo=;
        b=DziY9ktfAn1ythGQmcjFJcGM95wFhPaBC8/vu9AggGw+uncI6LiCeKCS8OGdXeFdJO
         rWIbB6y+ZQWjDnSW4IoMGib6aY7xZ0M59tJf8bScmCnWJygY5fXBsREtNfODcIxJK7rW
         YUE0q8YAyc+ULwks9KhADvlshSl1Ps+kOGFXtNs5t+2VAh4phHzqVaj3HW7Oe9mT+lxP
         vbro4GqBLNOqcKpEZoK7yxpMLuoitzwcKLVAjzrGy273XBfUKx8jx56Fxsc8mB0/cVGH
         fNrsx2OvUgWUBgCU0frJPpOZZUqxPwGb0BGNPd+PbWsva5a+teRKAvJljPVVaFaLWeob
         YXhw==
X-Forwarded-Encrypted: i=1; AJvYcCWy9UVL5/bSx4zfiIPyeOzOpQ0EaHn2XVdLwQFwroPpcE6IeognnNQbaSw6GRi8GZe+RWnXRGW+a2s/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc6RDHLw6h2CRS31E4IZN49XoKWwvH84oX10NDJF/ERyckFd5i
	noqMKn5k4lOlQTy8cJ4jLGEenAEkhAktvHjdhxlX4lZM6wga8c2daULuWpUcnXgvej4WFcyCZrH
	QcIDdnYFw80/QwcnTOQ==
X-Google-Smtp-Source: AGHT+IGD6vFBG/qnJRTeI0Egc5o0fCaTq+k3AZilSs3nMUa4+yW7KKG3PYKjSiBTF3vYiJw3LYHTcpA/ftuQTWQ=
X-Received: from wrbfq12.prod.google.com ([2002:a05:6000:2a0c:b0:42b:33e5:eba0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2210:b0:42b:3dbe:3a43 with SMTP id ffacd0b85a97d-42cb9a65043mr2524994f8f.50.1763638476264;
 Thu, 20 Nov 2025 03:34:36 -0800 (PST)
Date: Thu, 20 Nov 2025 11:34:35 +0000
In-Reply-To: <20251119-rust_leds-v9-1-86c15da19063@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251119-rust_leds-v9-0-86c15da19063@posteo.de> <20251119-rust_leds-v9-1-86c15da19063@posteo.de>
Message-ID: <aR78ywVnpWaOEeJ-@google.com>
Subject: Re: [PATCH v9 1/3] rust: leds: add basic led classdev abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 19, 2025 at 02:11:21PM +0000, Markus Probst wrote:
> Implement the core abstractions needed for led class devices, including:
> 
> * `led::LedOps` - the trait for handling leds, including
>   `brightness_set`, `brightness_get` and `blink_set`
> 
> * `led::InitData` - data set for the led class device
> 
> * `led::Device` - a safe wrapper around `led_classdev`
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  MAINTAINERS        |   7 +
>  rust/kernel/led.rs | 472 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs |   1 +
>  3 files changed, 480 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b71ea515240a..80cb030911b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14112,6 +14112,13 @@ F:	drivers/leds/
>  F:	include/dt-bindings/leds/
>  F:	include/linux/leds.h
>  
> +LED SUBSYSTEM [RUST]
> +M:	Markus Probst <markus.probst@posteo.de>
> +L:	linux-leds@vger.kernel.org
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/led.rs
> +
>  LEGO MINDSTORMS EV3
>  R:	David Lechner <david@lechnology.com>
>  S:	Maintained
> diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> new file mode 100644
> index 000000000000..fca55f02be8d
> --- /dev/null
> +++ b/rust/kernel/led.rs
> @@ -0,0 +1,472 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the leds driver model.
> +//!
> +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> +
> +use core::{
> +    marker::PhantomData,
> +    mem::transmute,
> +    pin::Pin,
> +    ptr::NonNull, //
> +};
> +
> +use pin_init::{
> +    pin_data,
> +    pinned_drop,
> +    PinInit, //
> +};
> +
> +use crate::{
> +    build_error,
> +    container_of,
> +    device::{
> +        self,
> +        property::FwNode,
> +        AsBusDevice,
> +        Bound, //
> +    },
> +    devres::Devres,
> +    error::{
> +        code::EINVAL,
> +        from_result,
> +        to_result,
> +        Error,
> +        Result,
> +        VTABLE_DEFAULT_ERROR, //
> +    },
> +    macros::vtable,
> +    str::CStr,
> +    try_pin_init,
> +    types::{
> +        ARef,
> +        Opaque, //
> +    }, //
> +};

Please import kernel::prelude::* and remove all the imports that are
available from the prelude.

> +impl<'a> InitData<'a> {
> +    /// Sets the firmware node
> +    pub fn fwnode(self, fwnode: Option<ARef<FwNode>>) -> Self {

I'm thinking that perhaps this should just be a `&'a FwNode` instead?
That way, you can increment the refcount in Device::new() if
registration is successful.

> +        Self { fwnode, ..self }
> +    }
> +
> +    /// Sets a default label

There are many missing periods in doc-comments.

> +/// Trait defining the operations for a LED driver.
> +///
> +/// # Examples
> +///
> +///```
> +/// # use kernel::{
> +/// #     c_str, device, devres::Devres,
> +/// #     error::Result, led,
> +/// #     macros::vtable, platform, prelude::*,
> +/// # };
> +/// # use core::pin::Pin;
> +///
> +/// struct MyLedOps;

When using # in examples, please do not have an empty line before
beginning the example. It shows up as a weird extra empty line in the
rendered docs.

You could consider just making the imports displayed here also.

Also the ``` both above and below the example usually has a space:

/// ```

rather than

///```

> +                    // SAFETY:
> +                    // - `parent.as_raw()` is guaranteed to be a pointer to a valid `device`
> +                    //    or a null pointer.
> +                    // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev`.
> +                    to_result(unsafe {
> +                        bindings::led_classdev_register_ext(
> +                            parent.as_ref().as_raw(),
> +                            ptr,
> +                            &mut init_data_raw,
> +                        )
> +                    })?;
> +
> +                    core::mem::forget(init_data.fwnode); // keep the reference count incremented

This led abstraction implicitly takes a refcount on the fwnode and then
drops it when the device is unbound.

Lee, can you confirm that taking a refcount on the fwnode is the right
way to use the LED subsytem?

Alice

