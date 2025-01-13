Return-Path: <linux-leds+bounces-3763-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C2A0B7ED
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 14:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2539B3A5E8C
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBA5171A7;
	Mon, 13 Jan 2025 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="kzHcGARf"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F0625757;
	Mon, 13 Jan 2025 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774189; cv=pass; b=RuGKE/ZD916diINwxSYLfBP6kt41NgENsc7UvjbtPTv1lgYXMr76qxYSsjOt5OulWDXKcUj48OavDfeinkXN0rBkxYSvUcfeVmYh1SfwX+Gco9hlxZ1cAYgiIPRkcQzkZa9WZ6+JwAebNHouWEwSID8LtiqW9gC6MEQEjqxNekc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774189; c=relaxed/simple;
	bh=a29455R9QFPGGVOVJIPzZsUQnhjtCPGM15+pIA6MZJQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ok9Mi5xGnu084vxn7Kl03wyoQfZ71nBJg/T7pXQwFv5mDq4s0Vsx0WLNcyU3BU5tKoNOTx6yDJxzo9E6NMNZ+tCOK7Mg5vDFm9IyAIwB5SarY9txMi01ih6axUPmK2pn4gAxrfnSCYNqY0g0/LKwEVotWwyIsNqeRWCTXIodtWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=kzHcGARf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1736774155; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dfMhg50fBuuijU0qieDZqs32xBVwOPSBDQt9nDtoLTs3QVZ/+6/9/iC47IVhK+Os0M6gI8k4SZasG2HWFR6Q6IKh2c1GuAjr+wPQzo6HMyXwbi2d/IlPk2QQ940S4as3DEiXbJ7hQD8l6wxjrQ1o4As7GZ8hQytgYQ8dCd74z3U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736774155; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bDcv/7gn0KIQQK+t5PzxUVNwz3mh5FX4s7Tlln3eVHU=; 
	b=SflCo1AMlHpw1IsLiAdaAnTo/LCAaMmk7WWaYX717CF6Vr0AlJUK8wQ2hDiZTuJlIwSYuUc5kMrpZQILjqNAkxIs1eBMKeyTOZcJCB7+SyKUUeWOtA6abvKhDrhxR6AIbF+8c+IONANyHfub3anoA7eQN3GC4rsJegbcMXhtBLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736774155;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=bDcv/7gn0KIQQK+t5PzxUVNwz3mh5FX4s7Tlln3eVHU=;
	b=kzHcGARfHee46J+20J0MC04BBcYjInKXb4/gvP43vbfb3XJ4ASkXYKesOOhJRBCO
	sJrjwH0pDxN4DY1bX41O++t1Y0Whetz4Bz4QMlE3SOpMonXC+/WmWAIETQrDWZfr2eY
	yaCKF8bOKBXFZt39k2YM+P/6mhKnSGHlsMhY42Ls=
Received: by mx.zohomail.com with SMTPS id 1736774152429192.98179319347696;
	Mon, 13 Jan 2025 05:15:52 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2 4/5] rust: add I/O port abstractions with resource
 management
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250113121620.21598-5-me@kloenk.dev>
Date: Mon, 13 Jan 2025 10:15:35 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Peter Koch <pkoch@lenovo.com>,
 rust-for-linux@vger.kernel.org,
 linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C204B39-B714-452D-8F90-8FE426470244@collabora.com>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-5-me@kloenk.dev>
To: Fiona Behrens <me@kloenk.dev>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Fiona,

> On 13 Jan 2025, at 09:16, Fiona Behrens <me@kloenk.dev> wrote:
>=20
> This patch introduces abstractions for working with I/O port =
resources,
> including the `Resource` and `Region` types. These abstractions =
facilitate
> interaction with `ioport_resource`, enabling safe management of =
resource
> reservations and memory accesses.
>=20
> Additionally, helper functions such as `outb`, `outw`, and `outl` have =
been
> provided to write values to these resources, with matching read =
functions
> such as `inb`, `inw`, and `inl` for accessing the port memory.
>=20
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> ---
> rust/helpers/helpers.c |   1 +
> rust/helpers/ioport.c  |  42 ++++++++++
> rust/kernel/ioport.rs  | 169 +++++++++++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs     |   2 +
> 4 files changed, 214 insertions(+)
> create mode 100644 rust/helpers/ioport.c
> create mode 100644 rust/kernel/ioport.rs
>=20
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index dcf827a61b52..b40aee82fa0f 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -14,6 +14,7 @@
> #include "cred.c"
> #include "err.c"
> #include "fs.c"
> +#include "ioport.c"
> #include "jump_label.c"
> #include "kunit.c"
> #include "mutex.c"
> diff --git a/rust/helpers/ioport.c b/rust/helpers/ioport.c
> new file mode 100644
> index 000000000000..d9c9e2093b98
> --- /dev/null
> +++ b/rust/helpers/ioport.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ioport.h>
> +#include <linux/io.h>
> +
> +struct resource *rust_helper_request_region(resource_size_t start,
> +    resource_size_t n, const char *name)
> +{
> + return request_region(start, n, name);
> +}
> +
> +struct resource *rust_helper_request_muxed_region(resource_size_t =
start,
> +  resource_size_t n,
> +  const char *name)
> +{
> + return request_muxed_region(start, n, name);
> +}
> +
> +void rust_helper_release_region(resource_size_t start, =
resource_size_t n)
> +{
> + release_region(start, n);
> +}
> +
> +#define define_rust_helper_out(name, type)                      \
> + void rust_helper_##name(type value, unsigned long addr) \
> + {                                                       \
> + (name)(value, addr);                            \
> + }
> +
> +define_rust_helper_out(outb, u8);
> +define_rust_helper_out(outw, u16);
> +define_rust_helper_out(outl, u32);
> +
> +#define define_rust_helper_in(name, type)           \
> + type rust_helper_##name(unsigned long addr) \
> + {                                           \
> + return (name)(addr);                \
> + }
> +
> +define_rust_helper_in(inb, u8);
> +define_rust_helper_in(inw, u16);
> +define_rust_helper_in(inl, u32);
> diff --git a/rust/kernel/ioport.rs b/rust/kernel/ioport.rs
> new file mode 100644
> index 000000000000..9bc342cb4663
> --- /dev/null
> +++ b/rust/kernel/ioport.rs
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions of routines for detecting, reserving and
> +//! allocating system resources.
> +//!
> +//! C header: =
[`include/linux/ioport.h`](srctree/include/linux/ioport.h)
> +
> +use core::ops::Deref;
> +use core::ptr;
> +
> +use crate::prelude::*;
> +use crate::types::Opaque;
> +
> +/// Resource Size type.
> +/// This is a type alias to `u64`
> +/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.
> +#[cfg(CONFIG_PHYS_ADDR_T_64BIT)]
> +pub type ResourceSize =3D u64;
> +
> +/// Resource Size type.
> +/// This is a type alias to `u32`
> +/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.
> +#[cfg(not(CONFIG_PHYS_ADDR_T_64BIT))]
> +pub type ResourceSize =3D u32;
> +
> +/// Resource node.
> +#[repr(transparent)]
> +pub struct Resource(Opaque<bindings::resource>);

This is a conflict with [0]

[0]: =
https://lore.kernel.org/rust-for-linux/20250109133057.243751-1-daniel.alme=
ida@collabora.com/

=E2=80=94 Daniel=

