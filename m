Return-Path: <linux-leds+bounces-3015-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DE9967DC
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 12:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9451F28410A
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 10:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4829C190667;
	Wed,  9 Oct 2024 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="ZyGEMPci"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA35418BC36;
	Wed,  9 Oct 2024 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471514; cv=none; b=lyRnXYcbjsDatS/J2fcoOrY96CbPAImCYtnvYXVppG1KDRA4r2ZJOgpy4K8kLxarKg5OKvCpbBuI1s8L7ojC9yXPCjoKTNDzh/7Rt4RIVw9Tw4pmR63Nly3oGw3IA3Uv+ki1C0+WmCXjO1TkwMugY1BkPaIHuKJxe1IEtIA3pQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471514; c=relaxed/simple;
	bh=/L0HeoREtlbZRvzxpfTCUjU7nLGJzk145c5MdADPt6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NY3EkEQRhfEYpmlSQtWRLx5xAjUd7dRnnlootDjehyTm/dSKFIaqET7DSiS8Ik/TSb3KPvzb6Od2LH/2WoY7RK4ains+MPuqtJTcsMvbvEm1kMg28YyWsp6VAU0mP6wSUhxniP6xYTLC188eYfOyrnbQG+4kKh65wXd1eyOhhDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=ZyGEMPci; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1728471503; bh=YCDuk3KEgjZaCFi5Pt7v/P59ADMvQb3dHrp/CUXem8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZyGEMPci225eQjGaKqKHqbAzI/arjNl+dBz8irFHyPXiPesqrq62SsX4dXfVxQ4TZ
	 ps3bvUOmtunpRdtNZ/B5bkIaRPdca3hS5O5T0ZnI4Yqh5EXjkECG0OY5vmVvo2vkT1
	 q210b13efooSpHBfQt2LkoC8Yw3E3uijHQKwrYMQ=
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
Subject: [RFC PATCH 2/2] samples: rust: led sample
Date: Wed,  9 Oct 2024 12:57:59 +0200
Message-ID: <20241009105759.579579-3-me@kloenk.dev>
In-Reply-To: <20241009105759.579579-1-me@kloenk.dev>
References: <20241009105759.579579-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide an initial sample LED driver that just prints the current
requested LED state.

This is not intended to be merged, but as a placeholder until the
abstactions for hardware access are written.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
 samples/rust/Kconfig     |  10 ++++
 samples/rust/Makefile    |   1 +
 samples/rust/rust_led.rs | 103 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 samples/rust/rust_led.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b0f74a81c8f9..910f15ef6951 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -30,6 +30,16 @@ config SAMPLE_RUST_PRINT
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_LED
+       tristate "Led subsystem"
+       help
+	This option builds the Rust LED subsystem sample.
+
+	To compile this as a module, choose M here:
+	the module will be called rust_led.
+
+	If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 03086dabbea4..1299ca1e9ebb 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_LED)			+= rust_led.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/rust_led.rs b/samples/rust/rust_led.rs
new file mode 100644
index 000000000000..0085f7484ea1
--- /dev/null
+++ b/samples/rust/rust_led.rs
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Rust LED sample.
+
+use core::time::Duration;
+
+use kernel::c_str;
+use kernel::leds::{Brightness, Color, Led, LedConfig, Operations};
+use kernel::prelude::*;
+
+module! {
+    type: RustLed,
+    name: "rust_led",
+    author: "Rust for Linux Contributors",
+    description: "Rust led sample",
+    license: "GPL",
+}
+
+/// Rust LED sample driver
+// Hold references in scope as droping would unregister the LED
+#[allow(dead_code)]
+struct RustLed {
+    /// LED which just supports on/off.
+    on_off: Pin<Box<Led<LedOnOff>>>,
+    /// LED which supports brightness levels and blinking.
+    blink: Pin<Box<Led<LedBlinking>>>,
+}
+
+impl kernel::Module for RustLed {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("registering on_off led\n");
+        let on_off = Box::pin_init(
+            Led::register_with_name(
+                c_str!("sample:red:on_off"),
+                None,
+                &LedConfig { color: Color::Red },
+                LedOnOff,
+            ),
+            GFP_KERNEL,
+        )?;
+
+        let blink = Box::pin_init(
+            Led::register_with_name(
+                c_str!("sample:green:blink"),
+                None,
+                &LedConfig {
+                    color: Color::Green,
+                },
+                LedBlinking,
+            ),
+            GFP_KERNEL,
+        )?;
+
+        Ok(Self { on_off, blink })
+    }
+}
+
+struct LedOnOff;
+
+#[vtable]
+impl Operations for LedOnOff {
+    const MAX_BRIGHTNESS: u8 = 1;
+
+    fn brightness_set(_this: &mut Led<Self>, brightness: Brightness) {
+        match brightness {
+            Brightness::Off => pr_info!("Switching led off\n"),
+            Brightness::On(v) => pr_info!("Switching led on: {}\n", v.get()),
+        }
+    }
+}
+
+struct LedBlinking;
+
+impl LedBlinking {
+    const HW_DURATION: Duration = Duration::from_millis(1000);
+}
+
+#[vtable]
+impl Operations for LedBlinking {
+    const MAX_BRIGHTNESS: u8 = 255;
+
+    fn brightness_set(_this: &mut Led<Self>, brightness: Brightness) {
+        match brightness {
+            Brightness::Off => pr_info!("blinking: off\n"),
+            Brightness::On(v) => pr_info!("blinking: on at {}\n", v.get()),
+        }
+    }
+
+    fn blink_set(
+        _this: &mut Led<Self>,
+        delay_on: Duration,
+        delay_off: Duration,
+    ) -> Result<(Duration, Duration)> {
+        pr_info!("blinking: try delay {delay_on:?} {delay_off:?}\n");
+        if !(delay_on.is_zero() && delay_off.is_zero())
+            && !(delay_on == Self::HW_DURATION && delay_off == Self::HW_DURATION)
+        {
+            return Err(EINVAL);
+        }
+
+        pr_info!("blinking: setting dealy\n");
+        Ok((Self::HW_DURATION, Self::HW_DURATION))
+    }
+}
-- 
2.46.0


