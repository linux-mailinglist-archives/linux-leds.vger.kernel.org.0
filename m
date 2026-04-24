Return-Path: <linux-leds+bounces-7841-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIrkNa5g62kuMAAAu9opvQ
	(envelope-from <linux-leds+bounces-7841-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 14:23:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD5145E5F0
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 14:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77DEE301C11F
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 12:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033B93C8730;
	Fri, 24 Apr 2026 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="ljW8gM3X"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A43C9EFB
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033370; cv=none; b=sRGx8fuOKD317nG0nA+SMb9zmsdBoVSKTDVE2KXeMN4Z2AjLjj8kyF84rE3ODR16+vjxrVYw3ZEiINWSgv+twPeREOmrONKZFhDWhi7htE4pbC+VijAIWcfYyATZM+0zXgToI+WY2lX+P5BFXA/yDU6uGHQBCLstk2JBMJeDKvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033370; c=relaxed/simple;
	bh=bZwNc83l8BQfGGlvGxx719cPmzNJjMeEaaGznNQ5/0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TL57hhPlz9dvgxJlvhV+4EwhXM4uSfNLcWI87W3DHLDBJqwpsqF6i5AkipcWcID6ULcnhU/207tfBj5io0Vn+0NDzd0NwckYoRL/Ljm/VQ/mPd5hOrafMlrP8ygOrCcuhRjevNp4fOIHBZFZmu3FetbM77HTSCh0Feqc/MzzIUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=ljW8gM3X; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 3E159240103
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 14:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777033363; bh=trolniExTCCR+VWC1ceG1UW6FWD4u3toE64lwMMlpnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=ljW8gM3XJbrZQcdF8a1PzNQ2N8HBS5On8IWHK7TTKD3d0ornSAgZ3/eyf1gF2+kD7
	 dG3qao4AtDNneDQhsbWCDMesozzeO8NAmk82c7Cwm0hxSGojliC+zxZNXAebF5P5IZ
	 R1UYYLU2P4jaUajUbB1kbQcOJ1+kn0YAqm8oW6nbehc9evdjeq8H/rN9m32pXa/3dy
	 eRqeDWyKBfNZMdeHDU5cRm5Aq1fd22daaurdYz8tCidZg20yoXKjB5llsgULRsX2M2
	 k2OEc49mTod27gDt1NxGYahZsGBeb6DjzZ3Ag/bX2lOAmk9yCZO3HMNHAH2j9BkB19
	 /lCCyenv1K5dg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g2BtS0qy8z9rxP;
	Fri, 24 Apr 2026 14:22:40 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 24 Apr 2026 12:22:41 +0000
Subject: [PATCH v10 2/2] platform: Add initial synology microp driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-synology_microp_initial-v10-2-e852d2f3eba1@posteo.de>
References: <20260424-synology_microp_initial-v10-0-e852d2f3eba1@posteo.de>
In-Reply-To: <20260424-synology_microp_initial-v10-0-e852d2f3eba1@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18406;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=bZwNc83l8BQfGGlvGxx719cPmzNJjMeEaaGznNQ5/0M=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBp62CKADxYH+cqXxS3G+TL+ALVLfIskXswWwdS5
 sbU+HDKxE6JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaetgihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9IvnhAAi5Xxjky9kyj+axFMLI9/qoOOljAdXH1
 36DaLtLO7wp4ulQSBUGPEuCcKLp9baLPjAMR6KNKL30+ExnnrgQuTiMJo8+SWKGcK3g9rrmnbpa
 iPNWDxySAuCkLkykMCjqhtuBUETMehHZUQZVQWus1KGxDmGJ+ySp2pbdtphjVdgTJetS3+5KUil
 XyTZ9lNAfZYRH7tsir9tav9DkMHV2mg2Je0lG9otnWkfFFgB+GTH7DmZFoUEGUEL4vXexATMTM7
 o2rc3lyiAQdwqNy0QYJ08UWq1y6pkkQPPf8RJ5mV82ADPlnosOdDCkDVvdxVu4d5LcU4PlaRQKV
 oBw/eQj3I4cjLVUQGyjFGBpZNeYYTeaxRS9oL8EagrD3LfOTNbxKhVRO/oTAlL/1YjyLq2/PpkI
 SCcQXL+AEr6IM0deRtC4gLInWokiVufIhhypwEERVojUVRnX7C/L2q16SIRTNv7doHz61PimFok
 h9PUJeS79bEK38ayz5OzhE0ooAbpeONG7gh+SAGsAi7VEmaBSyq8KohbWemd8ymdwQjmsmwYafX
 28WimvNmkfWlTxrojuShortBx1w1Eg+N6tH1otF3W1hdB4aqW4TbW68E/KGou4yj57NhWjv/q8D
 UvEm4IkbrTa+x15TqhqSNJKeVWxlJJEq/skTGDBhJ5suauM8KxBY=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Queue-Id: 4DD5145E5F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7841-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

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
 drivers/platform/synology_microp/led.rs            | 286 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          |  49 ++++
 .../platform/synology_microp/synology_microp.rs    |  90 +++++++
 9 files changed, 505 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1c686846cdd..966e99d41b11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25555,6 +25555,13 @@ F:	drivers/dma-buf/sync_*
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
index 000000000000..7c4d8f2808f0
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
+	  Enable support for the MCU found in Synology NAS devices.
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
index 000000000000..430cb858e1c3
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
+                Self::StatusLed(led::StatusLedColor::Orange, led::State::On) => &[0x3A],
+                Self::StatusLed(led::StatusLedColor::Orange, led::State::Blink) => &[0x3B],
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
index 000000000000..7df2d51f5bc5
--- /dev/null
+++ b/drivers/platform/synology_microp/led.rs
@@ -0,0 +1,286 @@
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
+                let name = CString::try_from_fmt(fmt!("{}:alarm", color.as_c_str().to_str()?))?;
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
+                        .name(c"green:usb")
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
+                        .name(c"green:esata")
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
+                    .name(c"multicolor:status")
+                    .build_multicolor(
+                        dev,
+                        try_pin_init!(StatusLedHandler {
+                            blink <- new_mutex!(false),
+                        }),
+                        StatusLedHandler::SUBLEDS,
+                    ),
+                power_name: CString::try_from_fmt(fmt!(
+                    "{}:power",
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
+    Orange,
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
+        MultiColorSubLed::new(led::Color::Orange),
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
+            (StatusLedColor::Orange, classdev.subleds()[1].brightness)
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
+            (StatusLedColor::Orange, classdev.subleds()[1].intensity)
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
index 000000000000..19eb36bb39c2
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
+        (DeviceId::new(c"synology,ds1010p-microp"), Model::new().led_alert(Color::Orange)),
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


