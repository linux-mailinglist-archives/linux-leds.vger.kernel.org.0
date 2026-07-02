Return-Path: <linux-leds+bounces-8834-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7eHTA+pJRmpdNwsAu9opvQ
	(envelope-from <linux-leds+bounces-8834-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 13:22:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9D6F69CE
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 13:22:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Eh2EkCxu;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8834-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8834-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 316C03003602
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 11:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F663ECBCF;
	Thu,  2 Jul 2026 11:22:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5BA431E4F
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 11:22:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991335; cv=none; b=MybU66HgpINDoLj1tgEpicN5eQmVZ9f1O8eWvsv7LBE0JzRI/LXxsGun1eVSuqKvAOvZHRuxW06zEkt1cIOP/0vxN44ErR/soFvnbPLuGIwelcPJ4QuaNo4apZY2XBcgvcLrwrZfUnfH7bS1tbJ8Q+fmPFobJFFkZKehnMiM1b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991335; c=relaxed/simple;
	bh=h6Hjsd6YIlOqO7foxw2433GlwA8x369rcvFYjko/x58=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mPCzPHi+V5kMMWmvAHpgOvyrgE6ar23E9L9j4UxcXLFv3lYQeJr7MiIP7asFhMroQtdFzX/8g5ch6/0FixGQ2VcUnMDAMO57O+gTUX0MzM7FEOUikAt3WikhJ4kn1GQV11cVsntOtH5IgpOObwwoa5G+V6TumUHQgd6KnYrbOe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eh2EkCxu; arc=none smtp.client-ip=209.85.221.73
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4784d0fb9cfso408427f8f.2
        for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 04:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782991332; x=1783596132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ABHfhQD3F9b+S3MG2pxSXvPENP4iWnPQjn40BCzCts=;
        b=Eh2EkCxu6qZaJYcrUBXnS9AuMYDsFND6PrC+RoQUbqMBDifg7NevnSTSeHURJQnrur
         OAGxKYr2D+ZGlabR/kgftOQxLFOq+mf7DzZJwYpY2kgKvxDiC44fxLD/9FLcyjgEj+T0
         +0G1Lkbpj/UfJq1T1PqP747p8ea09be5ibpZ8IMxDCnFTtSzKUesLOgL5mbJQY50iiuo
         ux1LYd7LP5X/rNWJptrRvIlansMcf7dJab04zuUstN2M3JSEjxWUYOuUBi4Sqhx0IJrs
         JSluHPP9tv2ibPa8J7VVPCx5blFWBKNyTuK4IkIceXMDAR8T9D+v/Dl59fyREvXQg46P
         9cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782991332; x=1783596132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ABHfhQD3F9b+S3MG2pxSXvPENP4iWnPQjn40BCzCts=;
        b=I7F8E0dA9orJbg9nqHuKVq3U4A4git61Uv3Zf2MgxjvIRmgQz/sY4sTFrKb991J0I0
         XZCarOO2erS97rEX9uusfN4QmHh0HX5kO22BwGzXwPMDXFly57Hv9Wk9n/wGbYYYtROU
         SyF2LFTIrSES6yByR/1y1lwE/xHcCVqgmF8XB8RyF9wGanYuufjD163IlgO/FxNcRl8K
         VhmplIIyk/jflj5nBqHghoSTQdCLPkhzxu/2iEJhxhpuPRNaes5gUsKqYO4F7rdRfCpZ
         i8SOHKhmQNaO6GrWRLJlZ7A3L42VRjS33vj2vP2um+05iBNLUTEH9YSnkxR+SmMM4QZs
         UUog==
X-Forwarded-Encrypted: i=1; AFNElJ+Cfe1zRcj/T4IeDbG/LPK2tYa6MPtLGIpQBgTJ07yrEGTta0HCMqGBtb4yBe+QnHYcQsmHfJCE+BX0@vger.kernel.org
X-Gm-Message-State: AOJu0YxmV+BSayNttUZw7KQ/EkQ5Tavo/yRJrtapxDCEOcnxys9qrmNX
	Wqy2uYznSMYEFQLGYFlmaSX+GTw0KMOweZ2iKbfEX634zINA716KxGNKtK6Yu2qlRCDENRr33vK
	Mlnjp46xMeCtCsXDnlA==
X-Received: from wmby21.prod.google.com ([2002:a05:600c:c055:b0:493:bd67:3b3e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524a:b0:493:af0d:484c with SMTP id 5b1f17b1804b1-493c3df2fb5mr67180355e9.34.1782991332107;
 Thu, 02 Jul 2026 04:22:12 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:22:10 +0000
In-Reply-To: <9e020dbc48fa9f209248864cdd1b7b9ebf2eecc4.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260629-rust_leds-v21-0-4f0f19579db5@posteo.de>
 <20260629-rust_leds-v21-1-4f0f19579db5@posteo.de> <akZBsBrMlxd4qbBl@google.com>
 <9e020dbc48fa9f209248864cdd1b7b9ebf2eecc4.camel@posteo.de>
Message-ID: <akZJ4l3LzX4dEBOe@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8834-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,lechnology.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5F9D6F69CE

On Thu, Jul 02, 2026 at 11:00:30AM +0000, Markus Probst wrote:
> On Thu, 2026-07-02 at 10:47 +0000, Alice Ryhl wrote:
> > On Mon, Jun 29, 2026 at 01:10:28PM +0000, Markus Probst wrote:
> > > Implement the core abstractions needed for led class devices, including:
> > > 
> > > * `led::LedOps` - the trait for handling leds, including
> > >   `brightness_set`, `brightness_get` and `blink_set`
> > > 
> > > * `led::DeviceBuilder` - the builder for the led class device
> > > 
> > > * `led::Device` - a safe wrapper around `led_classdev`
> > > 
> > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > ---
> > >  MAINTAINERS               |   8 ++
> > >  rust/kernel/led.rs        | 288 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  rust/kernel/led/normal.rs | 230 ++++++++++++++++++++++++++++++++++++
> > >  rust/kernel/lib.rs        |   1 +
> > >  4 files changed, 527 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 15011f5752a9..ceb2285366ff 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -14662,6 +14662,14 @@ F:	drivers/leds/
> > >  F:	include/dt-bindings/leds/
> > >  F:	include/linux/leds.h
> > >  
> > > +LED SUBSYSTEM [RUST]
> > > +M:	Markus Probst <markus.probst@posteo.de>
> > > +L:	linux-leds@vger.kernel.org
> > > +L:	rust-for-linux@vger.kernel.org
> > > +S:	Maintained
> > > +F:	rust/kernel/led.rs
> > > +F:	rust/kernel/led/
> > > +
> > >  LEGO MINDSTORMS EV3
> > >  R:	David Lechner <david@lechnology.com>
> > >  S:	Maintained
> > > diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> > > new file mode 100644
> > > index 000000000000..c92d99d68497
> > > --- /dev/null
> > > +++ b/rust/kernel/led.rs
> > > @@ -0,0 +1,288 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +//! Abstractions for the leds driver model.
> > > +//!
> > > +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> > > +
> > > +use core::{
> > > +    marker::PhantomData,
> > > +    mem::transmute,
> > > +    ptr::NonNull, //
> > > +};
> > > +
> > > +use crate::{
> > > +    container_of,
> > > +    device::{
> > > +        self,
> > > +        property::FwNode,
> > > +        AsBusDevice,
> > > +        Bound, //
> > > +    },
> > > +    error::{
> > > +        from_result,
> > > +        to_result,
> > > +        VTABLE_DEFAULT_ERROR, //
> > > +    },
> > > +    macros::vtable,
> > > +    prelude::*,
> > > +    str::CStrExt,
> > 
> > CStrExt is in the prelude. Please check for unnecessary imports.
> There is a
> `use super::*;` in rust/kernel/led/normal.rs and
> rust/kernel/led/multicolor.rs, which both make use of CStrExt.
> The latter being in patch 3.

I understand that you are using it. However, it's still unnecessary
because you also imported prelude::*.

> > > diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> > > new file mode 100644
> > > index 000000000000..2769f690bb24
> > > --- /dev/null
> > > +++ b/rust/kernel/led/normal.rs
> > > @@ -0,0 +1,230 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +//! Led mode for the `struct led_classdev`.
> > > +//!
> > > +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
> > > +
> > > +use super::*;
> > > +
> > > +/// The led class device representation.
> > > +///
> > > +/// This structure represents the Rust abstraction for a led class device.
> > > +#[pin_data(PinnedDrop)]
> > > +pub struct Device<'bound, T: LedOps + 'bound> {
> > > +    #[pin]
> > > +    ops: T,
> > > +    #[pin]
> > > +    classdev: Opaque<bindings::led_classdev>,
> > > +    _p: PhantomData<&'bound ()>,
> > > +}
> > > +
> > > +impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
> > > +    /// Registers a new [`Device`].
> > > +    pub fn build<'bound: 'a, T: LedOps + 'bound>(
> > > +        self,
> > > +        parent: &'bound T::Bus,
> > > +        ops: impl PinInit<T, Error> + 'a,
> > > +    ) -> impl PinInit<Device<'bound, T>, Error> + 'a {
> > 
> > I think it would be useful to separate out the two lifetimes more
> > clearly. You have two sets of lifetimes:
> > 
> > * 'bound which is the duration in which the bus device is bound.
> > * 'a which is the duration in which the `name`/`devicename` fields are
> >   valid.
> > 
> > And these have different constraints because 'bound is much larger than
> > 'a. The 'bound lifetime is longer than the entire Device struct, but the
> > 'a lifetime only needs to last for the duration of the initialization
> > because (I assume) the strings are copied by `led_classdev_register_ext`
> > 
> > So under that logic, I would rename 'a to 'name or something like that
> > to indicate what it's the lifetime of.
> Preferably 'init, which can be used in other class device abstractions
> as well if needed.

Sounds good.

> > 
> > Note that if I'm wrong about the lifetime of the name strings, then this
> > code should be changed accordingly. It looks like you're actually
> > stashing the pointers in the led_classdev, and if that outlives this
> > initializer, then the current lifetimes are wrong, and Device must also
> > be annotated with 'name to indicate this additional lifetime.
> name and devicename only need to be valid for the duration of
> `led_classdev_register_ext`.

Great.

Alice

