Return-Path: <linux-leds+bounces-3764-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 337AAA0B827
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 14:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132F1188637E
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2ED018E361;
	Mon, 13 Jan 2025 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="Bu3qa6+n"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D2B25760;
	Mon, 13 Jan 2025 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774940; cv=none; b=Gv55SxTnzSd2W5bwymIdzi7o7xABT7o6d31pn5aVzfulQKeY4BUDMccZj5qX1mMqNC4KodbEiXmMhnmul9oCaDwliVPBQyHiUXfAUcaR+pkEBzbYoUbkwmPCcnEIgJPgn5nu9Lj6uxMGAku7aiG08PxKyLzxwSKqhZPGbj8EFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774940; c=relaxed/simple;
	bh=xf9WqrDKk9XENZYR8Hmb72Zb7PWZLe+L7uzYUb/bcDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ocVVbP+3zYyDdTwwiwJMTo29rIf8kV67B9nYDWfSFFRPMNbFqTuBCQwFixwqPDFo6CojBy2eE6QEtCQVfsAfUT3FUUEXCFFPYiKHJnvwWPZWoREQy/SuUx7jvrIcMFXCbmE2CCg11oN/L7sWChukzuPqo03tQsNVhQz9ng+4f2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=Bu3qa6+n; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1736774933; bh=ToDAPe7C16PVVuwTXSWdRMuIKvhUofTeEU9jtzBijcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bu3qa6+n2wqedKaykwb9kQRQkU7yTsDnd4TTQiYcPHt+SAZrU6Y8W1Q6DryWY76GN
	 eMPBecC/5YbcSF45pHw1Eze7JsLpL9PoUrtsZ5yH5QATHAkgPhEgi+9av8btifjPVK
	 EaLpHQlK73h54ZI2ileaCx5ICB99Qv9VuxWDnX3o=
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Peter Koch <pkoch@lenovo.com>, rust-for-linux@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] rust: add I/O port abstractions with resource
 management
Date: Mon, 13 Jan 2025 14:28:10 +0100
Message-ID: <A0B919A0-5B44-4298-8696-026BCB96ED56@kloenk.dev>
In-Reply-To: <9C204B39-B714-452D-8F90-8FE426470244@collabora.com>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-5-me@kloenk.dev>
 <9C204B39-B714-452D-8F90-8FE426470244@collabora.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 13 Jan 2025, at 14:15, Daniel Almeida wrote:

> Hi Fiona,
>
>> On 13 Jan 2025, at 09:16, Fiona Behrens <me@kloenk.dev> wrote:
>>
>> This patch introduces abstractions for working with I/O port resources=
,
>> including the `Resource` and `Region` types. These abstractions facili=
tate
>> interaction with `ioport_resource`, enabling safe management of resour=
ce
>> reservations and memory accesses.
>>
>> Additionally, helper functions such as `outb`, `outw`, and `outl` have=
 been
>> provided to write values to these resources, with matching read functi=
ons
>> such as `inb`, `inw`, and `inl` for accessing the port memory.
>>
>> Signed-off-by: Fiona Behrens <me@kloenk.dev>
>> ---
>> rust/helpers/helpers.c |   1 +
>> rust/helpers/ioport.c  |  42 ++++++++++
>> rust/kernel/ioport.rs  | 169 +++++++++++++++++++++++++++++++++++++++++=

>> rust/kernel/lib.rs     |   2 +
>> 4 files changed, 214 insertions(+)
>> create mode 100644 rust/helpers/ioport.c
>> create mode 100644 rust/kernel/ioport.rs
>>
>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>> index dcf827a61b52..b40aee82fa0f 100644
>> --- a/rust/helpers/helpers.c
>> +++ b/rust/helpers/helpers.c
>> @@ -14,6 +14,7 @@
>> #include "cred.c"
>> #include "err.c"
>> #include "fs.c"
>> +#include "ioport.c"
>> #include "jump_label.c"
>> #include "kunit.c"
>> #include "mutex.c"
>> diff --git a/rust/helpers/ioport.c b/rust/helpers/ioport.c
>> new file mode 100644
>> index 000000000000..d9c9e2093b98
>> --- /dev/null
>> +++ b/rust/helpers/ioport.c
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/ioport.h>
>> +#include <linux/io.h>
>> +
>> +struct resource *rust_helper_request_region(resource_size_t start,
>> +    resource_size_t n, const char *name)
>> +{
>> + return request_region(start, n, name);
>> +}
>> +
>> +struct resource *rust_helper_request_muxed_region(resource_size_t sta=
rt,
>> +  resource_size_t n,
>> +  const char *name)
>> +{
>> + return request_muxed_region(start, n, name);
>> +}
>> +
>> +void rust_helper_release_region(resource_size_t start, resource_size_=
t n)
>> +{
>> + release_region(start, n);
>> +}
>> +
>> +#define define_rust_helper_out(name, type)                      \
>> + void rust_helper_##name(type value, unsigned long addr) \
>> + {                                                       \
>> + (name)(value, addr);                            \
>> + }
>> +
>> +define_rust_helper_out(outb, u8);
>> +define_rust_helper_out(outw, u16);
>> +define_rust_helper_out(outl, u32);
>> +
>> +#define define_rust_helper_in(name, type)           \
>> + type rust_helper_##name(unsigned long addr) \
>> + {                                           \
>> + return (name)(addr);                \
>> + }
>> +
>> +define_rust_helper_in(inb, u8);
>> +define_rust_helper_in(inw, u16);
>> +define_rust_helper_in(inl, u32);
>> diff --git a/rust/kernel/ioport.rs b/rust/kernel/ioport.rs
>> new file mode 100644
>> index 000000000000..9bc342cb4663
>> --- /dev/null
>> +++ b/rust/kernel/ioport.rs
>> @@ -0,0 +1,169 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Abstractions of routines for detecting, reserving and
>> +//! allocating system resources.
>> +//!
>> +//! C header: [`include/linux/ioport.h`](srctree/include/linux/ioport=
=2Eh)
>> +
>> +use core::ops::Deref;
>> +use core::ptr;
>> +
>> +use crate::prelude::*;
>> +use crate::types::Opaque;
>> +
>> +/// Resource Size type.
>> +/// This is a type alias to `u64`
>> +/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.
>> +#[cfg(CONFIG_PHYS_ADDR_T_64BIT)]
>> +pub type ResourceSize =3D u64;
>> +
>> +/// Resource Size type.
>> +/// This is a type alias to `u32`
>> +/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.
>> +#[cfg(not(CONFIG_PHYS_ADDR_T_64BIT))]
>> +pub type ResourceSize =3D u32;
>> +
>> +/// Resource node.
>> +#[repr(transparent)]
>> +pub struct Resource(Opaque<bindings::resource>);
>
> This is a conflict with [0]

Ah missed that, only saw the IO abstraction in the same series but it did=
 not work for my use case, and then somehow missed this, will rework to u=
se that as base in the next version

Thanks
Fiona

>
> [0]: https://lore.kernel.org/rust-for-linux/20250109133057.243751-1-dan=
iel.almeida@collabora.com/
>
> =E2=80=94 Daniel

