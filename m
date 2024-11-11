Return-Path: <linux-leds+bounces-3368-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41069C3B14
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E634C1C21CA4
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 09:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72381527A7;
	Mon, 11 Nov 2024 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIvuiUM+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB16A224D6;
	Mon, 11 Nov 2024 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318068; cv=none; b=LP9RutuaYsbfNYkZbi04prUYf50JKwDhol2WDiZeJTkY/NEAjSzTLBMsQbQEhi92cP4WokCcc/rSknnsb+hj0AXV3oRu7+mQgMdwqKuiguwLZ6nNbz4SELDNtbzZHdBckbu8/gXb2SCeLgqsF2h44+HGM/NL5GUhAzfqNRtjsn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318068; c=relaxed/simple;
	bh=Z4jSMiSPL1S9y+kW2x469PcEBIPM0+q8m43FKd34St4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4ShAR7wv2Jne9sJJLRmOiBD73DlRiad1E1coS8RqXGcxFc8KRIUGdr4WKgaqC0a2rBn+ZL7kkpG4FsH41Plo9RGrakFPii2qLTQeAFyXcKT/OcbLo2fs/HAZwKsxgc1WwXkXR6DIxjPb9EKzrs7CFPDgYxMBuwT+4kCMByQwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIvuiUM+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61100C4CED0;
	Mon, 11 Nov 2024 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731318068;
	bh=Z4jSMiSPL1S9y+kW2x469PcEBIPM0+q8m43FKd34St4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIvuiUM+qye/J0ErzpvtizsbKNP2j/8yx1z93R6EL+f8MHOb+2W+SZDEncZeS2q1n
	 WXVeoRHfQNKEUZ+6bq7il6WP1+5hbpycpiDW1ycEuHldR5KU2L3v4U1nb92O9rGs1C
	 r9sujbBIaK7pFND3XfS7ygPlF0a++tE5+HTib8VXcQwPsuzdHC+IZWAhYaGipK6ivv
	 yDU+o7YM7RHVxB8yXX+ArPnii6841sEuwIZYldYLMgIIzbzw4jPHASnybzkAWLToT0
	 drC9t9ixOeWoPYxO6qi3I/+p6xmUeN4ddWGe3lB9/9Rt7pRvJbhOT7PtIrE5NATOmT
	 i+yn9eF73fgYA==
Date: Mon, 11 Nov 2024 09:41:02 +0000
From: Lee Jones <lee@kernel.org>
To: Fiona Behrens <me@kloenk.dev>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] rust: LED abstractions
Message-ID: <20241111094102.GA8552@google.com>
References: <20241009105759.579579-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009105759.579579-1-me@kloenk.dev>

On Wed, 09 Oct 2024, Fiona Behrens wrote:

> This RFC implements a basic LED abstraction to show how this would work with rust.
> 
> Currently this just implements a sample driver, to show how to use the abstraction, which just
> prints the requested state, supporting a on/off LED and an led with brightness level up to 255 and
> hardware blinking. I intend to write a hardware specific driver for submitting.
> 
> The abstractions is a generic struct that holds a generic driver data on which the vtable is
> implemented. Because this struct also holds the c led_classdev (include/linux/leds.h) struct this
> struct is pinned and is using pin_init to create and directly register the LED.
> Dropping the struct unregisteres the LED. I plan to also add devm functions later, but as device
> abstractions in rust are not yet that far I opted agains that for the first iteration of the LED
> abstractions.
> 
> This is currently using core::time::Duration for the blinking interval, but will likely change that
> to use the Delta time type from FUJITA Tomonori [1].
> 
> This is requiring the Opaque::try_ffi_init patch by Alice Ryhl[2] which just got merged into
> char-misc-testing.
> 
> [1]: https://lore.kernel.org/rust-for-linux/20241005122531.20298-3-fujita.tomonori@gmail.com/
> [2]: https://lore.kernel.org/rust-for-linux/20240926-b4-miscdevice-v1-1-7349c2b2837a@google.com/
> 
> Fiona Behrens (2):
>   rust: LED abstraction
>   samples: rust: led sample
> 
>  rust/kernel/leds.rs      | 399 +++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs       |   2 +
>  samples/rust/Kconfig     |  10 +
>  samples/rust/Makefile    |   1 +
>  samples/rust/rust_led.rs | 103 ++++++++++
>  5 files changed, 515 insertions(+)
>  create mode 100644 rust/kernel/leds.rs
>  create mode 100644 samples/rust/rust_led.rs

FYI: I'm not ignoring this patch-set.  On the contrary.  I'm trying to
place myself into a position where I can not only review it with some
confidence, but use it to author LED drivers.

-- 
Lee Jones [李琼斯]

