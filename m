Return-Path: <linux-leds+bounces-3756-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F3A0B687
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9343A753C
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 12:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D9B1CAA99;
	Mon, 13 Jan 2025 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="XQQptS2L"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6A1CAA8B;
	Mon, 13 Jan 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770609; cv=none; b=ZwUaxy+F1W1GwL9Rc9rSCIrbHGuD8XEqVE7v99D+2DLZ8+8tf2QhXLChQ3P8nMEiIRwT4iIYYI1TDfC++hvetlzRfrnFeAZB1CXqEPG/f974qzUuFo8Y/Ih/Mtz8PxqOXYoMWkAji7QtPQJMR7uFl9W5GQpevIPdmGPTZTwa7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770609; c=relaxed/simple;
	bh=UvvrAR9ApRUqao8isFWxMEwk6PPS7V9ANdkH0NAcR6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdkSam7AsrTwHxw3tJRAE98q0myvdVqoHTnOhORJfqBtQY5Ojg7NJ7ZcfpXjgY+rlAwLIzEx6+Sf4677yG0NGWIxG8MILy5jwYHfe4sBomGP7QdJ2SwFod3BcRozy7wcTOqT3B0Up8IDIJA4FjHAtk/niffxm2i7OQ0QLPL3DvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=XQQptS2L; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1736770605; bh=U8U0PrI/d9CyD4YsL382N2BEX1fb3wg8wSgKoWM6dhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XQQptS2Lz+1j0+jxKSfPAeWoz4SS5m4NIPeCQm5hRamsSV4jaX9ULL3EV5Ej14317
	 w3vDwzKmrlmmwLuhP2rA/++3B48bmhnc0sGWksRtrRaOPA6PbSeUdVULmLpMga5fh1
	 XCTn8WPv31L4/l2PQvUgDMUwSTAVfW2EXsGe9QSI=
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
Subject: [PATCH v2 5/5] leds: leds_lenovo_se10: LED driver for Lenovo SE10 platform
Date: Mon, 13 Jan 2025 13:16:20 +0100
Message-ID: <20250113121620.21598-6-me@kloenk.dev>
In-Reply-To: <20250113121620.21598-1-me@kloenk.dev>
References: <20250113121620.21598-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for the Lenovo ThinkEdge SE10 LED.

This driver supports controlling the red LED located on the front panel of the
Lenovo SE10 hardware. Additionally, it supports the hardware-triggered
functionality of the LED, which by default is tied to the WWAN trigger.

The driver is written in Rust and adds basic LED support for the SE10 platform.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
 drivers/leds/Kconfig             |  10 +++
 drivers/leds/Makefile            |   1 +
 drivers/leds/leds_lenovo_se10.rs | 132 +++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 drivers/leds/leds_lenovo_se10.rs

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b784bb74a837..89d9e98189d6 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -223,6 +223,16 @@ config LEDS_TURRIS_OMNIA
 	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
 	  front panel.
 
+config LEDS_LENOVO_SE10
+       tristate "LED support for Lenovo ThinkEdge SE10"
+       depends on RUST
+       depends on (X86 && DMI) || COMPILE_TEST
+       depends on HAS_IOPORT
+       imply LEDS_TRIGGERS
+       help
+	This option enables basic support for the LED found on the front of
+	Lenovo's SE10 ThinkEdge. There is one user controlable LED on the front panel.
+
 config LEDS_LM3530
 	tristate "LCD Backlight driver for LM3530"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 18afbb5a23ee..2cff22cbafcf 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
 obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
 obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
+obj-$(CONFIG_LEDS_LENOVO_SE10)		+= leds_lenovo_se10.o
 obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
 obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
 obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
diff --git a/drivers/leds/leds_lenovo_se10.rs b/drivers/leds/leds_lenovo_se10.rs
new file mode 100644
index 000000000000..d704125610a4
--- /dev/null
+++ b/drivers/leds/leds_lenovo_se10.rs
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+//! LED driver for  Lenovo ThinkEdge SE10.
+
+use kernel::ioport::{Region, ResourceSize};
+#[cfg(CONFIG_LEDS_TRIGGERS)]
+use kernel::leds::triggers;
+use kernel::leds::{Led, LedConfig, Operations};
+use kernel::prelude::*;
+use kernel::time::Delta;
+use kernel::{c_str, dmi_device_table};
+
+module! {
+    type: SE10,
+    name: "leds_lenovo_se10",
+    author: "Fiona Behrens <me@kloenk.dev>",
+    description: "LED driver for Lenovo ThinkEdge SE10",
+    license: "GPL",
+}
+
+dmi_device_table!(5, SE10_DMI_TABLE, [
+    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NH"],
+    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NJ"],
+    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NK"],
+    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NL"],
+    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NM"],
+]);
+
+struct SE10 {
+    /// Led registration
+    _led: Pin<KBox<Led<LedSE10>>>,
+}
+
+impl kernel::Module for SE10 {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        if SE10_DMI_TABLE.check_system().is_none() {
+            return Err(ENODEV);
+        }
+
+        let led = KBox::try_pin_init(
+            Led::register(
+                None,
+                LedConfig {
+                    name: Some(c_str!("platform:red:user")),
+                    #[cfg(CONFIG_LEDS_TRIGGERS)]
+                    hardware_trigger: Some(kernel::sync::Arc::pin_init(
+                        triggers::Hardware::register(c_str!("wwan")),
+                        GFP_KERNEL,
+                    )?),
+                    ..LedConfig::new(kernel::leds::Color::Red, LedSE10)
+                },
+            ),
+            GFP_KERNEL,
+        )?;
+
+        Ok(Self { _led: led })
+    }
+}
+
+/// Valid led commands.
+#[repr(u8)]
+#[allow(missing_docs)]
+enum LedCommand {
+    #[cfg(CONFIG_LEDS_TRIGGERS)]
+    Trigger = 0xB2,
+    Off = 0xB3,
+    On = 0xB4,
+    Blink = 0xB5,
+}
+
+struct LedSE10;
+
+impl LedSE10 {
+    /// Base address of the command port.
+    const CMD_PORT: ResourceSize = 0x6C;
+    /// Length of the command port.
+    const CMD_LEN: ResourceSize = 1;
+    /// Blink duration the hardware supports.
+    const HW_DURATION: Delta = Delta::from_millis(1000);
+
+    /// Request led region.
+    fn request_cmd_region(&self) -> Result<Region<'static>> {
+        Region::request_muxed(Self::CMD_PORT, Self::CMD_LEN, c_str!("leds_lenovo_se10"))
+            .ok_or(EBUSY)
+    }
+
+    /// Send command.
+    fn send_cmd(&self, cmd: LedCommand) -> Result {
+        let region = self.request_cmd_region()?;
+        region.outb(cmd as u8, 0);
+        Ok(())
+    }
+}
+
+#[vtable]
+impl Operations for LedSE10 {
+    type This = Led<LedSE10>;
+
+    const MAX_BRIGHTNESS: u8 = 1;
+
+    fn brightness_set(this: &mut Self::This, brightness: u8) {
+        if let Err(e) = if brightness == 0 {
+            this.data.send_cmd(LedCommand::Off)
+        } else {
+            this.data.send_cmd(LedCommand::On)
+        } {
+            pr_warn!("Failed to set led: {e:?}\n)")
+        }
+    }
+
+    fn blink_set(
+        this: &mut Self::This,
+        delay_on: Delta,
+        delay_off: Delta,
+    ) -> Result<(Delta, Delta)> {
+        if !(delay_on.is_zero() && delay_off.is_zero()
+            || delay_on == Self::HW_DURATION && delay_off == Self::HW_DURATION)
+        {
+            return Err(EINVAL);
+        }
+
+        this.data.send_cmd(LedCommand::Blink)?;
+        Ok((Self::HW_DURATION, Self::HW_DURATION))
+    }
+}
+
+#[vtable]
+#[cfg(CONFIG_LEDS_TRIGGERS)]
+impl triggers::HardwareOperations for LedSE10 {
+    fn activate(this: &mut Self::This) -> Result {
+        this.data.send_cmd(LedCommand::Trigger)
+    }
+}
-- 
2.47.0


