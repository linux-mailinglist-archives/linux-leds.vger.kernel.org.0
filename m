Return-Path: <linux-leds+bounces-7858-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK6DKo+o72mpDgEAu9opvQ
	(envelope-from <linux-leds+bounces-7858-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 20:18:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50932478670
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 20:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D5943071861
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 18:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E313E92B1;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6ZDL3zX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22983E866B;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313563; cv=none; b=g5PFmUd0csec0ootFQjOgEaOVj4oRSGGAtC2cbo7tt/WBo6RI2AS0aoHzLVXh5sUGqPEi2ovT1qTKl56HKf4fjz7U3MTAZYCt9IY5kgz1mF4WIvusDq7p8h6bNv1E2Q6/hGpRnWkBlCYxC+RxCtG7oaqwlzgoZ8o/XMgewRZ3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313563; c=relaxed/simple;
	bh=CU913D+a5kujOyhGi8EAAoLBoFnPhVBXVmRD4oU9EN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwCMjCTZ3iAeisSYjQPuic7/ZnQAtieZrkVyWApUCEx9RfY26x7hOXOi0RvbdAR2a6d0xFitRzEVVL0qeY6+Ut1J/JH/iYt7EnXWqsfHJ7M6RirHMeBP+/b6FsSdL+/Z81NCfoLHqG6lD+bIIXMy5/uCgTkANFz+PPHLS4x19pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6ZDL3zX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83E39C2BCB4;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777313563;
	bh=CU913D+a5kujOyhGi8EAAoLBoFnPhVBXVmRD4oU9EN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g6ZDL3zXCQJdYtkgayO4WBciElcp1vqQm0yi5MhBcbCiQUCQQ2cctQvA9q5mcV873
	 Os3sg0AI8A8+AdaDJCcY8DWu/N1fL46kKMES23Bx0ruF0F7YW4S6JFeGM/4iT/pqBB
	 iXQnyRGRLbgsLcfJmIqQymdTw/6dSUtjiXS9qN7CDhqwFNYTToG+UIDVm/GBB4ub9l
	 omvH0/vA/y4CpFuMrmNaVZwble9hCicc3XMa9QlL9EjVRaUoQAalSJ88UZ5lvoCCw1
	 gEVPtpzwBeWbjE0QLAJCEskViillW4oRGpFbp0s4nAtD4s9jYz4nvH42tfamN+/9Dm
	 AM8h5QZycDqDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761B0FF8868;
	Mon, 27 Apr 2026 18:12:43 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Mon, 27 Apr 2026 20:12:40 +0200
Subject: [PATCH v11 2/2] platform: Add initial synology microp driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-synology_microp_initial-v11-2-9c1bd5a6f3ed@posteo.de>
References: <20260427-synology_microp_initial-v11-0-9c1bd5a6f3ed@posteo.de>
In-Reply-To: <20260427-synology_microp_initial-v11-0-9c1bd5a6f3ed@posteo.de>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18465;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=HEv8sshYEI/b8Az/GiL4/6i95LpmsFA+uEEUDO1A64A=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp76caez6AcjJ/e1sCvS1Qbt/HO4sKeHp9YbpB8
 Gg4YrnjLT+JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCae+nGhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9IgWRAAqQnjnvLMzCyCdg95v8ZGgqU6m+tmzB0
 UJCe9Hkb097IVM2yT4JeAZhy7hEkDBhnhbiXrIFjaQmPJ1a3Ss2+kUEixJ3RnsgYs9GpDOD6eIR
 1SrBoY9oKfCzuYAJwMGpAWjItafpWMN5fKbQCnQ0l8Rba83RtB597AjerRTMFzllQH/0xmEtkyJ
 gB5fWwMdaTUQC4iQkH8/DtYlaLeks+GE5sP8rxuG/ZS/MZhS1u6cE0WrjnYMFdCrpPsSWv/2X5p
 gr9bnfaAhXYNo0dfErICPdO1jucl6k7TuI0cPDnxblUtV88dLGsws60EH4c6n67kpcRzxQLQCYb
 KMGB7qr2reW4NXeGR3EhNs/1qBbFX/hS+n8pHx1+DR5RD/ajLCRbLx8EtpN9yUpyOpixI8tFdhK
 a9okRbcv0CCJKgvWxfAIjDTf6gWtXjeremR/3MUZRw0FnJh5HDwRIvmnyFl6Fq4W0K0m9dLXg4b
 uQzR/6FlwQFkFM9LO9Unldlr1BUiPXPUW7B+8clNo8n9tM41kFOlFT8RGB33VppGFLWrBBFzrCy
 WBUmqUAZUaTvvFGUDXb4GpL2DT1DotXSJga9jqLJRcmzTkkR52dsDtKf+G8ztO9U6emoJpwm5qz
 K7kXfEsC6v+ypeKpErxLEdDm7JolDXqnpupZyMvrHxxKiAbYmwaA=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de
X-Rspamd-Queue-Id: 50932478670
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7858-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:replyto,posteo.de:mid,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Markus Probst <markus.probst@posteo.de>

Add a initial synology microp driver, written in Rust.
The driver targets a microcontroller found in Synology NAS devices. It
currently only supports controlling of the power led, status led, alert
led and usb led. Other components such as fan control or handling
on-device buttons will be added once the required rust abstractions are
there.

This driver can be used both on arm and x86, thus it goes into the root
directory of drivers/platform.

Tested successfully on a Synology DS923+.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 MAINTAINERS                                        |   7 +
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/synology_microp/Kconfig           |  13 +
 drivers/platform/synology_microp/Makefile          |   3 +
 drivers/platform/synology_microp/command.rs        |  54 ++++
 drivers/platform/synology_microp/led.rs            | 287 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          |  49 ++++
 .../platform/synology_microp/synology_microp.rs    |  90 +++++++
 9 files changed, 506 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cce5359c23e..779cadd74df8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25785,6 +25785,13 @@ F:	drivers/dma-buf/sync_*
 F:	include/linux/sync_file.h
 F:	include/uapi/linux/sync_file.h
 
+SYNOLOGY MICROP DRIVER
+M:	Markus Probst <markus.probst@posteo.de>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/synology,ds918p-microp.yaml
+F:	drivers/platform/synology_microp/
+
 SYNOPSYS ARC ARCHITECTURE
 M:	Vineet Gupta <vgupta@kernel.org>
 L:	linux-snps-arc@lists.infradead.org
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..996050566a4a 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -22,3 +22,5 @@ source "drivers/platform/arm64/Kconfig"
 source "drivers/platform/raspberrypi/Kconfig"
 
 source "drivers/platform/wmi/Kconfig"
+
+source "drivers/platform/synology_microp/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..2381872e9133 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
 obj-$(CONFIG_ACPI_WMI)		+= wmi/
+obj-$(CONFIG_SYNOLOGY_MICROP)	+= synology_microp/
diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platform/synology_microp/Kconfig
new file mode 100644
index 000000000000..8878cfb7bcdd
--- /dev/null
+++ b/drivers/platform/synology_microp/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config SYNOLOGY_MICROP
+	tristate "Synology Microp driver"
+	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
+	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS
+	help
+	  Enable support for the EC found in Synology NAS devices.
+
+	  This is needed to properly shutdown and reboot the device, as well as
+	  additional functionality like fan and LED control.
+
+	  This driver is work in progress and may not be fully functional.
diff --git a/drivers/platform/synology_microp/Makefile b/drivers/platform/synology_microp/Makefile
new file mode 100644
index 000000000000..63585ccf76e4
--- /dev/null
+++ b/drivers/platform/synology_microp/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += synology_microp.o
diff --git a/drivers/platform/synology_microp/command.rs b/drivers/platform/synology_microp/command.rs
new file mode 100644
index 000000000000..58cb2f3cb3da
--- /dev/null
+++ b/drivers/platform/synology_microp/command.rs
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device::Bound,
+    error::Result,
+    serdev, //
+};
+
+use crate::led;
+
+#[expect(
+    clippy::enum_variant_names,
+    reason = "future variants will not end with Led"
+)]
+pub(crate) enum Command {
+    PowerLed(led::State),
+    StatusLed(led::StatusLedColor, led::State),
+    AlertLed(led::State),
+    UsbLed(led::State),
+    EsataLed(led::State),
+}
+
+impl Command {
+    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
+        dev.write_all(
+            match self {
+                Self::PowerLed(led::State::On) => &[0x34],
+                Self::PowerLed(led::State::Blink) => &[0x35],
+                Self::PowerLed(led::State::Off) => &[0x36],
+
+                Self::StatusLed(_, led::State::Off) => &[0x37],
+                Self::StatusLed(led::StatusLedColor::Green, led::State::On) => &[0x38],
+                Self::StatusLed(led::StatusLedColor::Green, led::State::Blink) => &[0x39],
+                Self::StatusLed(led::StatusLedColor::Amber, led::State::On) => &[0x3A],
+                Self::StatusLed(led::StatusLedColor::Amber, led::State::Blink) => &[0x3B],
+
+                Self::AlertLed(led::State::On) => &[0x4C, 0x41, 0x31],
+                Self::AlertLed(led::State::Blink) => &[0x4C, 0x41, 0x32],
+                Self::AlertLed(led::State::Off) => &[0x4C, 0x41, 0x33],
+
+                Self::UsbLed(led::State::On) => &[0x40],
+                Self::UsbLed(led::State::Blink) => &[0x41],
+                Self::UsbLed(led::State::Off) => &[0x42],
+
+                Self::EsataLed(led::State::On) => &[0x4C, 0x45, 0x31],
+                Self::EsataLed(led::State::Blink) => &[0x4C, 0x45, 0x32],
+                Self::EsataLed(led::State::Off) => &[0x4C, 0x45, 0x33],
+            },
+            serdev::Timeout::Max,
+        )?;
+        dev.wait_until_sent(serdev::Timeout::Max);
+        Ok(())
+    }
+}
diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/synology_microp/led.rs
new file mode 100644
index 000000000000..8b8d1ba531ab
--- /dev/null
+++ b/drivers/platform/synology_microp/led.rs
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device::Bound,
+    devres::{
+        self,
+        Devres, //
+    },
+    led::{
+        self,
+        LedOps,
+        MultiColorSubLed, //
+    },
+    new_mutex,
+    prelude::*,
+    serdev,
+    str::CString,
+    sync::Mutex,
+    time::Delta, //
+};
+use pin_init::pin_init_scope;
+
+use crate::{
+    command::Command,
+    model::Model, //
+};
+
+#[pin_data]
+pub(crate) struct Data {
+    #[pin]
+    status: Devres<led::MultiColorDevice<StatusLedHandler>>,
+    power_name: CString,
+    #[pin]
+    power: Devres<led::Device<LedHandler>>,
+}
+
+impl Data {
+    pub(super) fn register<'a>(
+        dev: &'a serdev::Device<Bound>,
+        model: &'a Model,
+    ) -> impl PinInit<Self, Error> + 'a {
+        pin_init_scope(move || {
+            if let Some(color) = model.led_alert {
+                let name =
+                    CString::try_from_fmt(fmt!("synology:{}:alarm", color.as_c_str().to_str()?))?;
+                devres::register(
+                    dev.as_ref(),
+                    led::DeviceBuilder::new().color(color).name(&name).build(
+                        dev,
+                        try_pin_init!(LedHandler {
+                            blink <- new_mutex!(false),
+                            command: Command::AlertLed,
+                        }),
+                    ),
+                    GFP_KERNEL,
+                )?;
+            }
+
+            if model.led_usb_copy {
+                devres::register(
+                    dev.as_ref(),
+                    led::DeviceBuilder::new()
+                        .color(led::Color::Green)
+                        .name(c"synology:green:usb")
+                        .build(
+                            dev,
+                            try_pin_init!(LedHandler {
+                                blink <- new_mutex!(false),
+                                command: Command::UsbLed,
+                            }),
+                        ),
+                    GFP_KERNEL,
+                )?;
+            }
+
+            if model.led_esata {
+                devres::register(
+                    dev.as_ref(),
+                    led::DeviceBuilder::new()
+                        .color(led::Color::Green)
+                        .name(c"synology:green:esata")
+                        .build(
+                            dev,
+                            try_pin_init!(LedHandler {
+                                blink <- new_mutex!(false),
+                                command: Command::EsataLed,
+                            }),
+                        ),
+                    GFP_KERNEL,
+                )?;
+            }
+
+            Ok(try_pin_init!(Self {
+                status <- led::DeviceBuilder::new()
+                    .color(led::Color::Multi)
+                    .name(c"synology:multicolor:status")
+                    .build_multicolor(
+                        dev,
+                        try_pin_init!(StatusLedHandler {
+                            blink <- new_mutex!(false),
+                        }),
+                        StatusLedHandler::SUBLEDS,
+                    ),
+                power_name: CString::try_from_fmt(fmt!(
+                    "synology:{}:power",
+                    model.led_power.as_c_str().to_str()?
+                ))?,
+                power <- led::DeviceBuilder::new()
+                    .color(model.led_power)
+                    .name(power_name)
+                    .build(
+                        dev,
+                        try_pin_init!(LedHandler {
+                            blink <- new_mutex!(true),
+                            command: Command::PowerLed,
+                        }),
+                    ),
+            }))
+        })
+    }
+}
+
+#[derive(Copy, Clone)]
+pub(crate) enum StatusLedColor {
+    Green,
+    Amber,
+}
+
+#[derive(Copy, Clone)]
+pub(crate) enum State {
+    On,
+    Blink,
+    Off,
+}
+
+#[pin_data]
+struct LedHandler {
+    #[pin]
+    blink: Mutex<bool>,
+    command: fn(State) -> Command,
+}
+
+/// Blink delay measured using video recording on DS923+ for Power and Status Led.
+///
+/// We assume it is the same for all other leds and models.
+const BLINK_DELAY: Delta = Delta::from_millis(167);
+
+#[vtable]
+impl LedOps for LedHandler {
+    type Bus = serdev::Device<Bound>;
+    type Mode = led::Normal;
+    const BLOCKING: bool = true;
+    const MAX_BRIGHTNESS: u32 = 1;
+
+    fn brightness_set(
+        &self,
+        dev: &Self::Bus,
+        _classdev: &led::Device<Self>,
+        brightness: u32,
+    ) -> Result<()> {
+        let mut blink = self.blink.lock();
+        (self.command)(if brightness == 0 {
+            *blink = false;
+            State::Off
+        } else if *blink {
+            State::Blink
+        } else {
+            State::On
+        })
+        .write(dev)?;
+
+        Ok(())
+    }
+
+    fn blink_set(
+        &self,
+        dev: &Self::Bus,
+        _classdev: &led::Device<Self>,
+        delay_on: &mut usize,
+        delay_off: &mut usize,
+    ) -> Result<()> {
+        let mut blink = self.blink.lock();
+
+        (self.command)(if *delay_on == 0 && *delay_off != 0 {
+            *blink = false;
+
+            State::Off
+        } else if *delay_on != 0 && *delay_off == 0 {
+            *blink = false;
+
+            State::On
+        } else {
+            *blink = true;
+            *delay_on = BLINK_DELAY.as_millis() as usize;
+            *delay_off = BLINK_DELAY.as_millis() as usize;
+
+            State::Blink
+        })
+        .write(dev)
+    }
+}
+
+#[pin_data]
+struct StatusLedHandler {
+    #[pin]
+    blink: Mutex<bool>,
+}
+
+impl StatusLedHandler {
+    const SUBLEDS: &[MultiColorSubLed] = &[
+        MultiColorSubLed::new(led::Color::Green).initial_intensity(1),
+        MultiColorSubLed::new(led::Color::Amber),
+    ];
+}
+
+#[vtable]
+impl LedOps for StatusLedHandler {
+    type Bus = serdev::Device<Bound>;
+    type Mode = led::MultiColor;
+    const BLOCKING: bool = true;
+    const MAX_BRIGHTNESS: u32 = 1;
+
+    fn brightness_set(
+        &self,
+        dev: &Self::Bus,
+        classdev: &led::MultiColorDevice<Self>,
+        brightness: u32,
+    ) -> Result<()> {
+        let mut blink = self.blink.lock();
+        if brightness == 0 {
+            *blink = false;
+        }
+
+        let (color, subled_brightness) = if classdev.subleds()[1].intensity == 0 {
+            (StatusLedColor::Green, classdev.subleds()[0].brightness)
+        } else {
+            (StatusLedColor::Amber, classdev.subleds()[1].brightness)
+        };
+
+        Command::StatusLed(
+            color,
+            if subled_brightness == 0 {
+                State::Off
+            } else if *blink {
+                State::Blink
+            } else {
+                State::On
+            },
+        )
+        .write(dev)
+    }
+
+    fn blink_set(
+        &self,
+        dev: &Self::Bus,
+        classdev: &led::MultiColorDevice<Self>,
+        delay_on: &mut usize,
+        delay_off: &mut usize,
+    ) -> Result<()> {
+        let mut blink = self.blink.lock();
+        *blink = true;
+
+        let (color, subled_intensity) = if classdev.subleds()[1].intensity == 0 {
+            (StatusLedColor::Green, classdev.subleds()[0].intensity)
+        } else {
+            (StatusLedColor::Amber, classdev.subleds()[1].intensity)
+        };
+        Command::StatusLed(
+            color,
+            if *delay_on == 0 && *delay_off != 0 {
+                *blink = false;
+                State::Off
+            } else if subled_intensity == 0 {
+                State::Off
+            } else if *delay_on != 0 && *delay_off == 0 {
+                *blink = false;
+                State::On
+            } else {
+                *delay_on = BLINK_DELAY.as_millis() as usize;
+                *delay_off = BLINK_DELAY.as_millis() as usize;
+
+                State::Blink
+            },
+        )
+        .write(dev)
+    }
+}
diff --git a/drivers/platform/synology_microp/model.rs b/drivers/platform/synology_microp/model.rs
new file mode 100644
index 000000000000..715d8840f56b
--- /dev/null
+++ b/drivers/platform/synology_microp/model.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::led::Color;
+
+pub(crate) struct Model {
+    pub(crate) led_power: Color,
+    pub(crate) led_alert: Option<Color>,
+    pub(crate) led_usb_copy: bool,
+    pub(crate) led_esata: bool,
+}
+
+impl Model {
+    pub(super) const fn new() -> Self {
+        Self {
+            led_power: Color::Blue,
+            led_alert: None,
+            led_usb_copy: false,
+            led_esata: false,
+        }
+    }
+
+    pub(super) const fn led_power(self, color: Color) -> Self {
+        Self {
+            led_power: color,
+            ..self
+        }
+    }
+
+    pub(super) const fn led_alert(self, color: Color) -> Self {
+        Self {
+            led_alert: Some(color),
+            ..self
+        }
+    }
+
+    pub(super) const fn led_esata(self) -> Self {
+        Self {
+            led_esata: true,
+            ..self
+        }
+    }
+
+    pub(super) const fn led_usb_copy(self) -> Self {
+        Self {
+            led_usb_copy: true,
+            ..self
+        }
+    }
+}
diff --git a/drivers/platform/synology_microp/synology_microp.rs b/drivers/platform/synology_microp/synology_microp.rs
new file mode 100644
index 000000000000..e2fff82dba7d
--- /dev/null
+++ b/drivers/platform/synology_microp/synology_microp.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Synology Microp driver
+
+use kernel::{
+    device,
+    led::Color,
+    of::{
+        DeviceId,
+        IdTable, //
+    },
+    of_device_table,
+    prelude::*,
+    serdev, //
+};
+use pin_init::pin_init_scope;
+
+use crate::model::Model;
+
+pub(crate) mod command;
+mod led;
+mod model;
+
+kernel::module_serdev_device_driver! {
+    type: SynologyMicropDriver,
+    name: "synology_microp",
+    authors: ["Markus Probst <markus.probst@posteo.de>"],
+    description: "Synology Microp driver",
+    license: "GPL v2",
+}
+
+#[rustfmt::skip]
+of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    Model,
+    [
+        // apollolake
+        (DeviceId::new(c"synology,ds918p-microp"), Model::new()),
+
+        // evansport
+        (DeviceId::new(c"synology,ds214play-microp"), Model::new()),
+
+        // geminilakenk
+        (DeviceId::new(c"synology,ds225p-microp"), Model::new().led_usb_copy()),
+
+        // pineview
+        (DeviceId::new(c"synology,ds710p-microp"), Model::new().led_esata()),
+        (DeviceId::new(c"synology,ds1010p-microp"), Model::new().led_alert(Color::Amber)),
+
+        // rtd1296
+        (DeviceId::new(c"synology,ds118-microp"), Model::new()),
+
+        // rtd1619b
+        (DeviceId::new(c"synology,ds223-microp"), Model::new().led_usb_copy()),
+
+        // v1000
+        (DeviceId::new(c"synology,ds1823xsp-microp"), Model::new()),
+        (DeviceId::new(c"synology,rs1221p-microp"), Model::new().led_power(Color::Green)),
+    ]
+);
+
+#[pin_data]
+struct SynologyMicropDriver {
+    #[pin]
+    led: led::Data,
+}
+
+#[vtable]
+impl serdev::Driver for SynologyMicropDriver {
+    type IdInfo = Model;
+    const OF_ID_TABLE: Option<IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        dev: &serdev::Device<device::Core>,
+        model: Option<&Model>,
+    ) -> impl PinInit<Self, kernel::error::Error> {
+        pin_init_scope(move || {
+            let model = model.ok_or(EINVAL)?;
+
+            dev.set_baudrate(9600).map_err(|_| EINVAL)?;
+            dev.set_flow_control(false);
+            dev.set_parity(serdev::Parity::None)?;
+
+            Ok(try_pin_init!(Self {
+                led <- led::Data::register(dev, model),
+            }))
+        })
+    }
+}

-- 
2.53.0



