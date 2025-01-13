Return-Path: <linux-leds+bounces-3760-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44786A0B6C5
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3C9E3A9647
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 12:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7914922A4F0;
	Mon, 13 Jan 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="UVookwmN"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6540C22A4C9;
	Mon, 13 Jan 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771051; cv=none; b=bTHiCucqobVlePJlfZNfOboG0HErJ0YqPZY4Ml/m8pV3+iFPjMQsBYUueBwvyN/UBtTv/hCHMgIN/I63c7/y/zd1GY1MKapO+4MJc6RP9MXrbOaUcnm2qega/9xUbXINadMNXRg8DM6ODVgsDj4luHIVlfdPdtoxplhNhSJNaGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771051; c=relaxed/simple;
	bh=JxQrjhfQua1UPTB7LP0NnSsEip8MpWDJk6oZB+7lVzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hYZGu7/Wad4VLr6LYyf5FIwclG0MuOnJ8Pdib1sCjKoxMcrviBMcPJZLIasycl2K0aMXICuo7h4PAq21AHf4UzgZelGjK2AHkEmkhBJBUoyvcnpqyG5KuZqdDxniRqYQcanT9xcfV5Jxgp8WBpTndJJy/MulxD+QQVmlm7JGlYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=UVookwmN; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1736770595; bh=oIYUpJZWmX3EKdYtvqehbHpWLlRjmPQUlS6wHvNK1S4=;
	h=From:To:Cc:Subject:Date;
	b=UVookwmNJupH0rGpOiXqhQrvhdXutCWW+TXENycuDt6c4fORQvYJrZauFle5XTngQ
	 cbv4G1wZ89zt9HbrGq0xIekyR9GdvbLervqddr3m1jHslmCoxQH7pweEPxOwiPr/yG
	 pI16qZODgluMddL4pLPQNrGx5/KSvuDzhNKZpHKU=
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Fiona Behrens <me@kloenk.dev>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Peter Koch <pkoch@lenovo.com>,
	rust-for-linux@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Rust LED Driver Abstractions and Lenovo SE10 Driver with DMI and I/O Port Support
Date: Mon, 13 Jan 2025 13:16:15 +0100
Message-ID: <20250113121620.21598-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces Rust LED abstractions and provides a driver for the Lenovo ThinkEdge SE10 using those abstractions.

1. DMI Abstraction:
    - Introduced Rust macros and types for DMI-based system matching, providing functionality similar to the `MODULE_DEVICE_TABLE(dmi, x)` macro in C. This abstraction allows system-specific matching using DMI fields.

2. LED Abstractions:
    - Introduced a generic LED abstraction that supports on/off control, brightness levels, and hardware blinking.
    - The abstraction is implemented using a vtable, with a struct that holds the generic driver data and is pinned for direct LED registration.

3. I/O Port Abstractions:
    - Added abstractions for hardware I/O port memory access, enabling the driver to interact with hardware ports.

4. LED Driver for Lenovo ThinkEdge SE10:
    - A driver is implemented for the red LED on the front panel of the Lenovo ThinkEdge SE10, utilizing the previously introduced LED abstractions, I/O port abstractions, and DMI matching.
    - The driver supports on/off control and a WWAN hardware trigger.

Additionally, the LED abstraction has been prepared to support multicolor LEDs in the future. While this functionality is planned, it has not yet been implemented, as I do not have a consumer for it at this time.

Would it make sense to add the Rust DMI abstractions to the existing DMI/SMBIOS SUPPORT entry in the MAINTAINERS file?

This series depends on `rust: time: Introduce Delta type` by FUJITA Tomonori[1].

I send this previously without the SE10 driver as an RFC[2], and now have a driver to consume the APIs.

[1]: https://lore.kernel.org/rust-for-linux/20241220061853.2782878-3-fujita.tomonori@gmail.com/
[2]: https://lore.kernel.org/rust-for-linux/20241009105759.579579-1-me@kloenk.dev/

Fiona Behrens (5):
  rust: dmi: Add abstractions for DMI
  rust: leds: Add Rust bindings for LED subsystem
  rust: leds: Add hardware trigger support for hardware-controlled LEDs
  rust: add I/O port abstractions with resource management
  leds: leds_lenovo_se10: LED driver for Lenovo SE10 platform

 MAINTAINERS                      |   2 +
 drivers/leds/Kconfig             |  10 +
 drivers/leds/Makefile            |   1 +
 drivers/leds/leds_lenovo_se10.rs | 132 ++++++++
 rust/bindings/bindings_helper.h  |   1 +
 rust/helpers/helpers.c           |   1 +
 rust/helpers/ioport.c            |  42 +++
 rust/kernel/dmi.rs               | 533 +++++++++++++++++++++++++++++++
 rust/kernel/ioport.rs            | 169 ++++++++++
 rust/kernel/leds.rs              | 416 ++++++++++++++++++++++++
 rust/kernel/leds/triggers.rs     | 128 ++++++++
 rust/kernel/lib.rs               |   6 +
 rust/kernel/time.rs              |   7 +
 13 files changed, 1448 insertions(+)
 create mode 100644 drivers/leds/leds_lenovo_se10.rs
 create mode 100644 rust/helpers/ioport.c
 create mode 100644 rust/kernel/dmi.rs
 create mode 100644 rust/kernel/ioport.rs
 create mode 100644 rust/kernel/leds.rs
 create mode 100644 rust/kernel/leds/triggers.rs

-- 
2.47.0


