Return-Path: <linux-leds+bounces-8830-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3DQIAx5FRmrQNQsAu9opvQ
	(envelope-from <linux-leds+bounces-8830-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 13:01:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDB76F6578
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 13:01:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=UhVycY0j;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8830-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8830-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4140B3261157
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 10:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599463C3451;
	Thu,  2 Jul 2026 10:47:17 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CAB3C345B
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 10:47:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989237; cv=none; b=ZZHyjBQsQfG0AliSQDCiDrIgPZEoLssuZyRJbcaA6FXI8gnYxmRLakkCIfM/4iNcyxa6PU4OVTSykoWBlE3xQja/tdc0lQC69PefX9STAPkAtNyXgJOAGu38M53YpONJ9ztTHnpuyXCX0637PpMNX4bB7Vi+UNOvVUzbPeh9RAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989237; c=relaxed/simple;
	bh=C9b8OXYr1ZfIVQ125i9stdL0TvlKMUbAI/41Fzjjh2A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ee6fBdE6DMNUGogLA/GSTMjZaO9ay0RGQlfraxoQHFhI+wvLo/HTlxAmzDmwbOIniadgTwVnRRUhV9xZHgLO2IIIf4QgaEgmO1JVB3g0cGcKtAgai3w6+s/SRPRvH3aLoIq8Pu3S12B9cmS8/3GkQpcr3lFrHTeiH+zVy1yVgW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UhVycY0j; arc=none smtp.client-ip=209.85.128.73
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493b54823bdso3025205e9.0
        for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782989234; x=1783594034; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQQYcZxBeNQUvYJ0vw0eFdw9XqDhM+2aUNMCPPXFL7A=;
        b=UhVycY0jVHszZ0jxfIKWJUcWaLmpPZyGOx9T/gkrJ3Ya4Am10lYw0vUgKvOzZBKtx/
         6mLFnl4PGQDZBWxFYwydct83c0skjWBESjBA1izzBMDgwnnbTyGTyI+z+41ym/2hlNru
         orIxvl8qqxfkthiH3CIpsTBiifs2Hl2rhf6WHZnzXHea4/L88icTOSQHvgizm9pxw7f3
         7715ngsDzGakLKIdJIxZiXOmTT0u0ik8sMocQcGTDsM9Ax2vDPZWsU5mgXZugjuyl86d
         BruDYbiFNYM2rEh+Ab3AKmA0QVkjIeG0gwseGtGDrsjuU3alJ6YDblIDlkO+tWH6lIX2
         zDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989234; x=1783594034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQQYcZxBeNQUvYJ0vw0eFdw9XqDhM+2aUNMCPPXFL7A=;
        b=bpE1gE35Rx0UIvu/6YSXCbRum2GMlF1Qs1SJzmeOhmPFdQzFgQ+bSyhydwnnM7i93n
         WCtyTuRPLQigiMgiwaHEp0mzvaotCmh8ZmIorcbFYoSfVVDza21nF10+wMzEP4hI7bR0
         9BbAbVSW04SL2PfvdKiaU6+sWMXbE4S1t6Zlh6dqzhiw5GxiwEnaVJThvUqjwW6VgesR
         22ud3Xir9e+lii2pcrEe/3OTb0CmDi2ojwlcXPsCk+yNqCnw/q2/pSOkbOLBw9P/XX2a
         0xKAVH7EsOFMxLtQLy6HsiIEFfRTVYHzVEmf7L/I1n+GL3vJp93NvvNUranc0ixsjAye
         mjpA==
X-Forwarded-Encrypted: i=1; AFNElJ+V5Un0h+2otFfWxZX/BBfqrSBqfU6Rd1oOSZ+DVINOjXGGvCKR9BQcJTl2+as1TdwO+ssDyAReWNch@vger.kernel.org
X-Gm-Message-State: AOJu0Yy77R6VKEvzGreedNuG8s3krRrgcA9eJKVVatXuQx6u4h7D7KWL
	aYgN8oiYaRHDCA7quqSjf0oe3Gct0lWiElQKWvFqpSOt2f120oyKfml7Eb67w3CziZIbTK5XDq+
	xdtrWbkGvXtgGXnPppA==
X-Received: from wmfo12.prod.google.com ([2002:a05:600c:2e0c:b0:493:b55e:f03f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8411:b0:493:b4a3:5ab0 with SMTP id 5b1f17b1804b1-493c8c8c80cmr57425e9.13.1782989233695;
 Thu, 02 Jul 2026 03:47:13 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:47:12 +0000
In-Reply-To: <20260629-rust_leds-v21-1-4f0f19579db5@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260629-rust_leds-v21-0-4f0f19579db5@posteo.de> <20260629-rust_leds-v21-1-4f0f19579db5@posteo.de>
Message-ID: <akZBsBrMlxd4qbBl@google.com>
Subject: Re: [PATCH v21 1/3] rust: leds: add basic led classdev abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Ira Weiny <iweiny@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8830-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-leds@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:lee@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:leon@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rafael@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:iweiny@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,umich.edu,google.com,collabora.com,nvidia.com,onurozkan.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,posteo.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FDB76F6578

On Mon, Jun 29, 2026 at 01:10:28PM +0000, Markus Probst wrote:
> Implement the core abstractions needed for led class devices, including:
> 
> * `led::LedOps` - the trait for handling leds, including
>   `brightness_set`, `brightness_get` and `blink_set`
> 
> * `led::DeviceBuilder` - the builder for the led class device
> 
> * `led::Device` - a safe wrapper around `led_classdev`
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  MAINTAINERS               |   8 ++
>  rust/kernel/led.rs        | 288 ++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/led/normal.rs | 230 ++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs        |   1 +
>  4 files changed, 527 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..ceb2285366ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14662,6 +14662,14 @@ F:	drivers/leds/
>  F:	include/dt-bindings/leds/
>  F:	include/linux/leds.h
>  
> +LED SUBSYSTEM [RUST]
> +M:	Markus Probst <markus.probst@posteo.de>
> +L:	linux-leds@vger.kernel.org
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/led.rs
> +F:	rust/kernel/led/
> +
>  LEGO MINDSTORMS EV3
>  R:	David Lechner <david@lechnology.com>
>  S:	Maintained
> diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> new file mode 100644
> index 000000000000..c92d99d68497
> --- /dev/null
> +++ b/rust/kernel/led.rs
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the leds driver model.
> +//!
> +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> +
> +use core::{
> +    marker::PhantomData,
> +    mem::transmute,
> +    ptr::NonNull, //
> +};
> +
> +use crate::{
> +    container_of,
> +    device::{
> +        self,
> +        property::FwNode,
> +        AsBusDevice,
> +        Bound, //
> +    },
> +    error::{
> +        from_result,
> +        to_result,
> +        VTABLE_DEFAULT_ERROR, //
> +    },
> +    macros::vtable,
> +    prelude::*,
> +    str::CStrExt,

CStrExt is in the prelude. Please check for unnecessary imports.

> diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> new file mode 100644
> index 000000000000..2769f690bb24
> --- /dev/null
> +++ b/rust/kernel/led/normal.rs
> @@ -0,0 +1,230 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Led mode for the `struct led_classdev`.
> +//!
> +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> +
> +use super::*;
> +
> +/// The led class device representation.
> +///
> +/// This structure represents the Rust abstraction for a led class device.
> +#[pin_data(PinnedDrop)]
> +pub struct Device<'bound, T: LedOps + 'bound> {
> +    #[pin]
> +    ops: T,
> +    #[pin]
> +    classdev: Opaque<bindings::led_classdev>,
> +    _p: PhantomData<&'bound ()>,
> +}
> +
> +impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
> +    /// Registers a new [`Device`].
> +    pub fn build<'bound: 'a, T: LedOps + 'bound>(
> +        self,
> +        parent: &'bound T::Bus,
> +        ops: impl PinInit<T, Error> + 'a,
> +    ) -> impl PinInit<Device<'bound, T>, Error> + 'a {

I think it would be useful to separate out the two lifetimes more
clearly. You have two sets of lifetimes:

* 'bound which is the duration in which the bus device is bound.
* 'a which is the duration in which the `name`/`devicename` fields are
  valid.

And these have different constraints because 'bound is much larger than
'a. The 'bound lifetime is longer than the entire Device struct, but the
'a lifetime only needs to last for the duration of the initialization
because (I assume) the strings are copied by `led_classdev_register_ext`

So under that logic, I would rename 'a to 'name or something like that
to indicate what it's the lifetime of.

Note that if I'm wrong about the lifetime of the name strings, then this
code should be changed accordingly. It looks like you're actually
stashing the pointers in the led_classdev, and if that outlives this
initializer, then the current lifetimes are wrong, and Device must also
be annotated with 'name to indicate this additional lifetime.

> +        const_assert!(T::MAX_BRIGHTNESS <= i32::MAX.unsigned_abs() || !T::HAS_BRIGHTNESS_GET);
> +
> +        try_pin_init!(Device {
> +            ops <- ops,
> +            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_classdev| {
> +                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
> +                // `led_classdev` gets fully initialized in-place by
> +                // `led_classdev_register_ext` including `mutex` and `list_head`.
> +                unsafe {
> +                    ptr.write(bindings::led_classdev {
> +                        brightness_set: (!T::BLOCKING)
> +                            .then_some(Adapter::<T>::brightness_set_callback),
> +                        brightness_set_blocking: T::BLOCKING
> +                            .then_some(Adapter::<T>::brightness_set_blocking_callback),
> +                        brightness_get: T::HAS_BRIGHTNESS_GET
> +                            .then_some(Adapter::<T>::brightness_get_callback),
> +                        blink_set: T::HAS_BLINK_SET.then_some(Adapter::<T>::blink_set_callback),
> +                        max_brightness: T::MAX_BRIGHTNESS,
> +                        brightness: self.initial_brightness,
> +                        color: self.color as u32,
> +                        name: self.name.map_or(core::ptr::null(), CStrExt::as_char_ptr),
> +                        ..bindings::led_classdev::default()
> +                    })
> +                };
> +
> +                let mut init_data = bindings::led_init_data {
> +                    fwnode: self
> +                        .fwnode
> +                        .as_ref()
> +                        .map_or(core::ptr::null_mut(), |fwnode| fwnode.as_raw()),
> +                    default_label: core::ptr::null(),
> +                    devicename: self
> +                        .devicename
> +                        .map_or(core::ptr::null(), CStrExt::as_char_ptr),
> +                    devname_mandatory: self.devname_mandatory,
> +                };
> +
> +                // SAFETY:
> +                // - `parent.as_ref().as_raw()` is guaranteed to be a pointer to a valid
> +                //    `device`.
> +                // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev`.
> +                to_result(unsafe {
> +                    bindings::led_classdev_register_ext(
> +                        parent.as_ref().as_raw(),
> +                        ptr,
> +                        if self.name.is_none() {
> +                            &raw mut init_data
> +                        } else {
> +                            core::ptr::null_mut()
> +                        },
> +                    )
> +                })?;
> +
> +                core::mem::forget(self.fwnode); // keep the reference count incremented
> +
> +                Ok::<_, Error>(())
> +            }),
> +            _p: PhantomData,
> +        })
> +    }
> +}

Alice

