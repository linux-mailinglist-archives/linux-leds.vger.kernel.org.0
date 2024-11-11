Return-Path: <linux-leds+bounces-3385-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 534279C3BF8
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 11:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D421C21B91
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7530C18B47C;
	Mon, 11 Nov 2024 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="STNo+WMR"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150AA17E46E;
	Mon, 11 Nov 2024 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731320993; cv=none; b=pw9RjLfgx7gXDxEeyrN/avS+yDVxkVeyKgZBKi5P18bn+3ChS6DTRX2X3JtmH+0NySxSbaPizq/EyLJGszdjrKCOa8ZdXm9Zk/vdHYAN/jBK7ax8onQ19LtuFVQrO+5DZMhyDhutR1F3Hats5CIzmJMcN5nz/UiTRwoASdgmLoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731320993; c=relaxed/simple;
	bh=bfZl5CREUTUHR4q8Niu6V5DmOW+Gu+Il2F3M01CaJ6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CImWGzbt3fFYJlPZTmrk0x4TUird9GZs2+HTQilWcIHoZ1mk1P18k3jf7iegqhRjZMPy/W1kF43CDK4UwPNEwc4PEkuhs1XfNEEwqr1zzqFudKF7+vbG7G4dyzGYqYM/m76WfAx3H/erP11dfnIZqpG7h4jppRVNWMAt+5vYKls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=STNo+WMR; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1731320493; bh=vZgICiMRxjJHJ0uPsv4p4obm0nF80+Ne6X/xLfL8LVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=STNo+WMRnTiW2hduFCpzkvIkfCuQ7S3gtU2lGTruFYGEYsgOW+0FlkM4FKMq4IbIW
	 YIfSDYeXrDpbo2Mdyt7csPwfnhiIN4lVEK9PYO8XGEbFLLlM4nL7yjAfmuHPzfCxXY
	 anSOtCnivu/DEQpAd62U4meueCw/U3ic/FVB5+l8=
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] rust: LED abstractions
Date: Mon, 11 Nov 2024 11:21:30 +0100
Message-ID: <468C6459-F13F-421D-B592-5B8425D57650@kloenk.dev>
In-Reply-To: <20241111094102.GA8552@google.com>
References: <20241009105759.579579-1-me@kloenk.dev>
 <20241111094102.GA8552@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 11 Nov 2024, at 10:41, Lee Jones wrote:

> On Wed, 09 Oct 2024, Fiona Behrens wrote:
>
>> This RFC implements a basic LED abstraction to show how this would wor=
k with rust.
>>
>> Currently this just implements a sample driver, to show how to use the=
 abstraction, which just
>> prints the requested state, supporting a on/off LED and an led with br=
ightness level up to 255 and
>> hardware blinking. I intend to write a hardware specific driver for su=
bmitting.
>>
>> The abstractions is a generic struct that holds a generic driver data =
on which the vtable is
>> implemented. Because this struct also holds the c led_classdev (includ=
e/linux/leds.h) struct this
>> struct is pinned and is using pin_init to create and directly register=
 the LED.
>> Dropping the struct unregisteres the LED. I plan to also add devm func=
tions later, but as device
>> abstractions in rust are not yet that far I opted agains that for the =
first iteration of the LED
>> abstractions.
>>
>> This is currently using core::time::Duration for the blinking interval=
, but will likely change that
>> to use the Delta time type from FUJITA Tomonori [1].
>>
>> This is requiring the Opaque::try_ffi_init patch by Alice Ryhl[2] whic=
h just got merged into
>> char-misc-testing.
>>
>> [1]: https://lore.kernel.org/rust-for-linux/20241005122531.20298-3-fuj=
ita.tomonori@gmail.com/
>> [2]: https://lore.kernel.org/rust-for-linux/20240926-b4-miscdevice-v1-=
1-7349c2b2837a@google.com/
>>
>> Fiona Behrens (2):
>>   rust: LED abstraction
>>   samples: rust: led sample
>>
>>  rust/kernel/leds.rs      | 399 ++++++++++++++++++++++++++++++++++++++=
+
>>  rust/kernel/lib.rs       |   2 +
>>  samples/rust/Kconfig     |  10 +
>>  samples/rust/Makefile    |   1 +
>>  samples/rust/rust_led.rs | 103 ++++++++++
>>  5 files changed, 515 insertions(+)
>>  create mode 100644 rust/kernel/leds.rs
>>  create mode 100644 samples/rust/rust_led.rs
>
> FYI: I'm not ignoring this patch-set.  On the contrary.  I'm trying to
> place myself into a position where I can not only review it with some
> confidence, but use it to author LED drivers.
>

Ah amazing, the first RFC was to probe for a general would LED accept rus=
t code, and this sounds like a yes. Nice!

Currently still working on a LED driver for a Lenovo board that does not =
(as of when I started, and think still not yet) have a C driver for the L=
ED. Current things missing is a static dmi match table (idea is to hardco=
ded that for now) and a abstraction for port memory but working on that, =
and can otherwise just go around that with unsafe calls in the driver its=
elf.

  - Fiona

> -- =

> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

