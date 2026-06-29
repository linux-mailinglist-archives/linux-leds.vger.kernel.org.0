Return-Path: <linux-leds+bounces-8793-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dUKsGhujQmo4/AkAu9opvQ
	(envelope-from <linux-leds+bounces-8793-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 18:53:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F27446DD874
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 18:53:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=CTfXWUe2;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8793-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8793-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEA0930454B6
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 16:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE71F44BCB5;
	Mon, 29 Jun 2026 16:52:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E8466B7B
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 16:52:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751944; cv=none; b=EF5zSmV9Xtbvfa1XgKoemXYv4TSFfJkloIbd9HMgSUDDdJXKarOp0r1cx/1gfHABScmbxGYITm/y0+MslMfgHrdbMmrrgqaEwg6Eah+bzfAuZSIUDsFAcMczbZLJx7GoY5gPW+x8wh46eNocUGEDGgcYP0loYOwFX4Hp5ZkTxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751944; c=relaxed/simple;
	bh=wIUrrw0qKtxpcB6LGyArP24tOQNI6debCXPle3XRmhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQ1MOTcR6Ydki8omFiSswXQADwINCYWGRgkMAAO3FAyCs38TWf8f2DARiypSHp5f41tOynCLZFEsQ1DUV7B1wbCn5uSxSM91+B2o9C5+nEFSy4BD4vwr/DY0Njc9gog7KJi4kCtx62vWGMNKjnE0/peATSuMF0l76QMGsAhAUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=CTfXWUe2; arc=none smtp.client-ip=185.67.36.65
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 19746240035
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 18:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782751937; bh=yeEf295x5kQ7F5BMxAXysH15ME3tcL08IsmKWjJIIpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=CTfXWUe2t+qHsy0kTMkWntpcdCwkmm5zc9UMSJZEv1K1dzwqf7CrAMv7b7DfvlKHA
	 ptnhG1dSCr+xMtbthrtJBiye/zJN8wc8frHYrdfishpT7/o+76Z73G9N1DhXxFb5Vg
	 AobfVS+Ma0YjNpnbdgYJUnT0IQHERT45f3dcAEoaTQj6+iIGTXIShCBpUEE5F7nhkM
	 LRbNcx6nvRkXiIHiE3eIAfklrD810XwWVTMsIMSV2x61dI6GZ81C/+ICspXk0LEANM
	 0t0BYw/Z/k+0635pBHq+jNM2dHLu80KHrqQ2q/mcmH5xCn9uJDhwaL5mcNFtesBxRc
	 hDO2Iguc0YYDg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gpsl12f50z6v07;
	Mon, 29 Jun 2026 18:52:13 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Mon, 29 Jun 2026 16:52:15 +0000
Subject: [PATCH v16 2/2] platform: Add initial synology microp driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-synology_microp_initial-v16-2-601e91c49e0d@posteo.de>
References: <20260629-synology_microp_initial-v16-0-601e91c49e0d@posteo.de>
In-Reply-To: <20260629-synology_microp_initial-v16-0-601e91c49e0d@posteo.de>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=19655;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=wIUrrw0qKtxpcB6LGyArP24tOQNI6debCXPle3XRmhw=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqQqK3OauXFApf9jRO16ayiPtKgtKDMNfnXUIaI
 AihScfFhDeJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCakKitxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9K4Gg//S6OyFHQD+NRHDlm/N4YEuNBVxUvHh6R
 vUbq27FhcERyWVlRIIRbKfGuEJ5+ewAXCkyiE58xVwwzx6MlixbeAxPdTSze34Yt+dnDKXCN488
 KbIdI80Aq1MqnbJiwSszaUPjsrWgVKHdJvaz2S9KSaoQUufPGZXEcM5Wwe43nw1jRlV+B2x5XWE
 qj2UlHUujQocOqLiyCp8vKtp5PVfSzHwTqUQIT3p2FLscqQqVdvQepOTUgUu0pf3IMcfp4O6b7R
 Hj38JPc0OHOFouVwC/+VauL//z4xiD4ur7ZzPBwygkJ+6kzeDi7sSX8lMtLF40SGpVSeL1dnwNs
 fyVCnm3ES1kbQyYCJDpukXpiLEFwy55JoZTVCVstuHJjvJD828QwSem0DCngG/MuapJsc9PThFh
 WDsTFtipNL4X7a9eCXf+fsuO2pk7NWxU1lCGlhTfbS1hb0ito8GiQAsuoHni/sw6WvzLWNIcqy0
 K59sv4/mbRrKHrlf+RCMgzd9VPAkuvM32+3EYqiI+kArZujHP5VMInzfbnEiHslBLAvc/mECmnO
 Fjxi5JBSWi4uqzDjvUP8mhw6keDArPM9GWtAlLj7vXR5Oy+ulmSiNSFkw1U5KYdhZg9Nl4BwcGh
 QmoD2krf4cUWyjmPoMrxlZWUD8+z1ZOMXN2TV5rsMX25Cc8ihQok=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8793-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,collabora.com,nvidia.com,onurozkan.dev];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:lee@kernel.org,m:pavel@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:gregkh@linuxfoundation.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:platform-driver-x86@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:markus.probst@posteo.de,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F27446DD874

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
 drivers/platform/synology_microp/Makefile          |   5 +
 drivers/platform/synology_microp/command.rs        |  54 ++++
 drivers/platform/synology_microp/led.rs            | 297 +++++++++++++++++++++
 drivers/platform/synology_microp/model.rs          |  49 ++++
 .../platform/synology_microp/synology_microp.rs    |  91 +++++++
 9 files changed, 519 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c1b8e5105d0..95bc19811a0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26141,6 +26141,13 @@ F:	drivers/dma-buf/sync_*
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
index 000000000000..2681a793d6d8
--- /dev/null
+++ b/drivers/platform/synology_microp/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_SYNOLOGY_MICROP) += synology-microp.o
+synology-microp-y += synology_microp.o
+
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
index 000000000000..ce57adfd307f
--- /dev/null
+++ b/drivers/platform/synology_microp/led.rs
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device::Bound,
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
+pub(crate) struct Data<'bound> {
+    #[pin]
+    status: led::MultiColorDevice<'bound, StatusLedHandler>,
+    power_name: CString,
+    #[pin]
+    power: led::Device<'bound, LedHandler>,
+    alert: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
+    usb_copy: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
+    esata: Option<Pin<KBox<led::Device<'bound, LedHandler>>>>,
+}
+
+impl<'bound> Data<'bound> {
+    pub(super) fn register<'a>(
+        dev: &'bound serdev::Device<Bound>,
+        model: &'a Model,
+    ) -> impl PinInit<Self, Error> + 'a
+    where
+        'bound: 'a,
+    {
+        pin_init_scope(move || {
+            Ok(try_pin_init!(Self {
+                status <- led::DeviceBuilder::new()
+                    .color(led::Color::Multi)
+                    .name(c"synology:multicolor:status")
+                    .build_multicolor(
+                        dev,
+                        try_pin_init!(StatusLedHandler {
+                            blink <- new_mutex!(false),
+                        }),
+                        &[
+                            MultiColorSubLed::new(led::Color::Green).initial_intensity(1),
+                            MultiColorSubLed::new(led::Color::Amber),
+                        ],
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
+                            blink <- new_mutex!(false),
+                            command: Command::PowerLed,
+                        }),
+                    ),
+                alert: {
+                    if let Some(color) = model.led_alert {
+                        let name = CString::try_from_fmt(fmt!(
+                            "synology:{}:alarm",
+                            color.as_c_str().to_str()?
+                        ))?;
+                        Some(KBox::pin_init(
+                            led::DeviceBuilder::new().color(color).name(&name).build(
+                                dev,
+                                try_pin_init!(LedHandler {
+                                    blink <- new_mutex!(false),
+                                    command: Command::AlertLed,
+                                }),
+                            ),
+                            GFP_KERNEL,
+                        )?)
+                    } else {
+                        None
+                    }
+                },
+                usb_copy: {
+                    if model.led_usb_copy {
+                        Some(KBox::pin_init(
+                            led::DeviceBuilder::new()
+                                .color(led::Color::Green)
+                                .name(c"synology:green:usb")
+                                .build(
+                                    dev,
+                                    try_pin_init!(LedHandler {
+                                        blink <- new_mutex!(false),
+                                        command: Command::UsbLed,
+                                    }),
+                                ),
+                            GFP_KERNEL,
+                        )?)
+                    } else {
+                        None
+                    }
+                },
+                esata: {
+                    if model.led_esata {
+                        Some(KBox::pin_init(
+                            led::DeviceBuilder::new()
+                                .color(led::Color::Green)
+                                .name(c"synology:green:esata")
+                                .build(
+                                    dev,
+                                    try_pin_init!(LedHandler {
+                                        blink <- new_mutex!(false),
+                                        command: Command::EsataLed,
+                                    }),
+                                ),
+                            GFP_KERNEL,
+                        )?)
+                    } else {
+                        None
+                    }
+                },
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
+    fn brightness_set<'bound>(
+        &self,
+        dev: &'bound Self::Bus,
+        _classdev: &led::Device<'bound, Self>,
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
+    fn blink_set<'bound>(
+        &self,
+        dev: &'bound Self::Bus,
+        _classdev: &led::Device<'bound, Self>,
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
+#[vtable]
+impl LedOps for StatusLedHandler {
+    type Bus = serdev::Device<Bound>;
+    type Mode = led::MultiColor;
+    const BLOCKING: bool = true;
+    const MAX_BRIGHTNESS: u32 = 1;
+
+    fn brightness_set<'bound>(
+        &self,
+        dev: &'bound Self::Bus,
+        classdev: &led::MultiColorDevice<'bound, Self>,
+        brightness: u32,
+    ) -> Result<()> {
+        let mut blink = self.blink.lock();
+        if brightness == 0 {
+            *blink = false;
+        }
+
+        let amber_brightness = classdev.subleds()[1].brightness();
+
+        let (color, subled_brightness) = if amber_brightness == 0 {
+            (StatusLedColor::Green, classdev.subleds()[0].brightness())
+        } else {
+            (StatusLedColor::Amber, amber_brightness)
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
+    fn blink_set<'bound>(
+        &self,
+        dev: &'bound Self::Bus,
+        classdev: &led::MultiColorDevice<'bound, Self>,
+        delay_on: &mut usize,
+        delay_off: &mut usize,
+    ) -> Result<()> {
+        let mut blink = self.blink.lock();
+        *blink = true;
+
+        let amber_intensity = classdev.subleds()[1].intensity();
+
+        let (color, subled_intensity) = if amber_intensity == 0 {
+            (StatusLedColor::Green, classdev.subleds()[0].intensity())
+        } else {
+            (StatusLedColor::Amber, amber_intensity)
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
index 000000000000..f7168309e611
--- /dev/null
+++ b/drivers/platform/synology_microp/synology_microp.rs
@@ -0,0 +1,91 @@
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
+    type: SynologyMicropDriver<'static>,
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
+struct SynologyMicropDriver<'bound> {
+    #[pin]
+    led: led::Data<'bound>,
+}
+
+#[vtable]
+impl serdev::Driver for SynologyMicropDriver<'_> {
+    type IdInfo = Model;
+    type Data<'bound> = SynologyMicropDriver<'bound>;
+    const OF_ID_TABLE: Option<IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe<'bound>(
+        dev: &'bound serdev::Device<device::Core<'_>>,
+        model: Option<&'bound Model>,
+    ) -> impl PinInit<Self::Data<'bound>, kernel::error::Error> + 'bound {
+        pin_init_scope(move || {
+            let model = model.ok_or(EINVAL)?;
+
+            dev.set_baudrate(9600).map_err(|_| EINVAL)?;
+            dev.set_flow_control(false);
+            dev.set_parity(serdev::Parity::None)?;
+
+            Ok(try_pin_init!(SynologyMicropDriver {
+                led <- led::Data::register(dev, model),
+            }))
+        })
+    }
+}

-- 
2.53.0


