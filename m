Return-Path: <linux-leds+bounces-3014-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B53609967DA
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 12:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 620691F2170F
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 10:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F1B190462;
	Wed,  9 Oct 2024 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="AF3iWQtq"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413581C6BE;
	Wed,  9 Oct 2024 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471513; cv=none; b=fT8mql9ocirzsj0JPG14+oXS3uadY2t81qmZoEVhZLKUb+BPqK74Vr8r7WiPD7zJIjpAnC17aAAnOo4X84KjOWpaPeExH9wMp5HZxbdpRMfcVs/qsxTkp9fyRxYT4huwRVNX7aObXZ2jkpQ7CTM5ozl3BsTB85CYh1uv04hFBQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471513; c=relaxed/simple;
	bh=U0peQhNULcnz+IjPznqWs/PO8wKX3bQGhAM5MBMG65s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i86rRkvmED0WbSZp3DqMu5VhvDPEiwD5dfScKWr7k7DBqfBSMqh+PVyiG1xR+Ci5GOo55j+grzcavhIuOuT3NzzHlm6CI0te8PrwnwS7cbaliubVICsRl7V+Xb3Ek4lyjAuPnaN8Mj2FL8ytgERrPo1vcnfEbeC7IsKg+cuJ6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=AF3iWQtq; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1728471501; bh=VVQDLEqsT0ID1IOlTpqpJf13k82U9F4qCKU4K4Mfbqw=;
	h=From:To:Cc:Subject:Date;
	b=AF3iWQtq6E2MUvIqABrhsxi8zAtM9F50vzgzHSlCzGS6FSYl8qG+SFoES8Nfm4FB0
	 MqjYf2fxmGt4pi1b7Olr1fweLRYp1pVjVvSSDMZoEYLhrDwLg3aTOuUu8rlHHf2yAu
	 dGFJZDHtqLhjGHJIvgV4NKEkbFPgKJyuDPr6+XQI=
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Fiona Behrens <me@kloenk.dev>
Subject: [RFC PATCH 0/2] rust: LED abstractions
Date: Wed,  9 Oct 2024 12:57:57 +0200
Message-ID: <20241009105759.579579-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC implements a basic LED abstraction to show how this would work with rust.

Currently this just implements a sample driver, to show how to use the abstraction, which just
prints the requested state, supporting a on/off LED and an led with brightness level up to 255 and
hardware blinking. I intend to write a hardware specific driver for submitting.

The abstractions is a generic struct that holds a generic driver data on which the vtable is
implemented. Because this struct also holds the c led_classdev (include/linux/leds.h) struct this
struct is pinned and is using pin_init to create and directly register the LED.
Dropping the struct unregisteres the LED. I plan to also add devm functions later, but as device
abstractions in rust are not yet that far I opted agains that for the first iteration of the LED
abstractions.

This is currently using core::time::Duration for the blinking interval, but will likely change that
to use the Delta time type from FUJITA Tomonori [1].

This is requiring the Opaque::try_ffi_init patch by Alice Ryhl[2] which just got merged into
char-misc-testing.

[1]: https://lore.kernel.org/rust-for-linux/20241005122531.20298-3-fujita.tomonori@gmail.com/
[2]: https://lore.kernel.org/rust-for-linux/20240926-b4-miscdevice-v1-1-7349c2b2837a@google.com/

Fiona Behrens (2):
  rust: LED abstraction
  samples: rust: led sample

 rust/kernel/leds.rs      | 399 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs       |   2 +
 samples/rust/Kconfig     |  10 +
 samples/rust/Makefile    |   1 +
 samples/rust/rust_led.rs | 103 ++++++++++
 5 files changed, 515 insertions(+)
 create mode 100644 rust/kernel/leds.rs
 create mode 100644 samples/rust/rust_led.rs

-- 
2.46.0


