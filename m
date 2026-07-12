Return-Path: <linux-leds+bounces-9043-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nJtDMlnOU2qqfAMAu9opvQ
	(envelope-from <linux-leds+bounces-9043-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:26:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB2E7457C2
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:26:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=X54mTcPK;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9043-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9043-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C12543006B6E
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 17:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AD0364940;
	Sun, 12 Jul 2026 17:26:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139BC3033F8;
	Sun, 12 Jul 2026 17:26:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783877207; cv=none; b=NeK7M1qd1rYRL4O0187d4+pfz5syvlNlMckBSPaweuRDOf5HJ70ACaE/l/akjBorW33sPQPD+aVLD3kbZTQXLmJGk/sL4FVkMysO5HlkUNGb3K/YN+BNbivaDdpeFCEHN7XICZL6k0xwsweKdD20M60/PhsiP3aES/4DaqxQrlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783877207; c=relaxed/simple;
	bh=j4jWVTdGTsg6V/wrpII/qzoz2prVMQXrawPHDQ7T/KU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dtv/Lkxijrqf6wp9AzVjlyCkWpRhS3MFCMjQv07jfyu+6bpK4aLk9Fuwen2kFzFFgzycCIIoS3X7lvoL6sUffGMbqK+pfp96/6Mj14PYsnH/6WBZL+EEjBrLnPhhSldQFaCiHPcR8Lu/0vtAyh6SCj8z4LF4bRNM+3k4avLlZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X54mTcPK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A88DEC2BCB9;
	Sun, 12 Jul 2026 17:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783877206;
	bh=j4jWVTdGTsg6V/wrpII/qzoz2prVMQXrawPHDQ7T/KU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X54mTcPKaln66RwRXUPNqiPSjoxsYOD8zXMR1XRvWktSb8W5emaSw6MuokSKJ1IW4
	 ujta5APjzsJ2Ua1GSy1kQXoGbtGClbQrj6dcusxqtfFV7mMaRnzuRYoSJGKnVDZZgi
	 ugo2FEePI7w/rwU7X3NV1Ib1MFzWrqyNtVDyMhFq1W5zc4Z2Wynhnm4eQNXg0dsEdM
	 6AOiKz4bS6AAfbV8IlwnX+Xt+/gzvvG4KxaPWa/nDy8xWCB5DRfsvhFdxrRnNg1gTd
	 FMIOj2GCU+aYcoXqh1eN1lLT5FIx/ec36bPp5QOP7zovk58/YMippZlrLkyMXg+6dx
	 piTybZSM5Q6Zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0D0C44501;
	Sun, 12 Jul 2026 17:26:46 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Sun, 12 Jul 2026 19:26:43 +0200
Subject: [PATCH v22 1/3] rust: leds: add basic led classdev abstractions
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-rust_leds-v22-1-055b0459a079@posteo.de>
References: <20260712-rust_leds-v22-0-055b0459a079@posteo.de>
In-Reply-To: <20260712-rust_leds-v22-0-055b0459a079@posteo.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Ira Weiny <iweiny@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20381;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=qKsll3wKFGmQbJoBcc4VRFIbSGrlHkH3TKLiPBXi7G4=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqU85Uuta9M6kgMOesAYi4IaCuhGlzR9qgShaU6
 cqguLLzK1qJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCalPOVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9LCZA//XZpoxUu2Nq89BaQZRoyHmjX5OS4LYsr
 iMmm6L6CB/+O/g2HEGqFNhHKdWV/X+00WQP66rQWi0Zg8B2LTMK7ObfopLj8hmk0y1mJ0XrHsqI
 3CgFXJYIdRdv2U8paIFG/c80N+OJnYKYCupJAnajQbfY8VnehI5h7FkkcJw0AqmQE0qsRZggFe8
 T6qG23b7yIUXi46t4C1u/8tLv+G5gYo3KnMD6sK+5Xs9sy60N/YzV1yUgp5OW9KvtfJKAqtSKxF
 s2A7qOBbu+FvlFRMcX3JrGrQ8wba9PU6d1FVSmf4GiLETZyyYy1Xx8Ilb/Zr7dMVE/le1MjsQdm
 pDH1xeYtGTt8i/838VWfymKzHEp8gN6hGRuPs35xWpt/hTUZ3exxRPekHbT/06j+rQG7M/2cDgf
 WUVySr/hAOZswRZRsxS3z2QXTV6zMUQRQNuCqDn3VuplLIxFBzGzXAJPjm5vmqHx1xgO9f2g7WV
 7VE6JbH8F3Yw2i2aI38xgwp/QGI2LXhbRVglqqRhQxPdmhTibgAjpBucXeKm+pBbgNXVju+d7y8
 62aAN5SFttfAoS/C1gjozh+YENG2DKCSGv30U6v5xuCXGAP6VPcPg3YY0fmbdLQUuIHFN3lSJdT
 cMP6rbyRDzuWy9AO7d0m1cNFWsJ30VUe3e8NzlP4tqQMWHH/H0bg=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9043-lists,linux-leds=lfdr.de,markus.probst.posteo.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:leon@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rafael@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:iweiny@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:markus.probst@posteo.de,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[markus.probst@posteo.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:replyto,posteo.de:mid,posteo.de:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lechnology.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DB2E7457C2

From: Markus Probst <markus.probst@posteo.de>

Implement the core abstractions needed for led class devices, including:

* `led::LedOps` - the trait for handling leds, including
  `brightness_set`, `brightness_get` and `blink_set`

* `led::DeviceBuilder` - the builder for the led class device

* `led::Device` - a safe wrapper around `led_classdev`

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 MAINTAINERS               |   8 ++
 rust/kernel/led.rs        | 287 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/led/normal.rs | 230 +++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs        |   1 +
 4 files changed, 526 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a8b0fd665ce..bfa4377023b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14662,6 +14662,14 @@ F:	drivers/leds/
 F:	include/dt-bindings/leds/
 F:	include/linux/leds.h
 
+LED SUBSYSTEM [RUST]
+M:	Markus Probst <markus.probst@posteo.de>
+L:	linux-leds@vger.kernel.org
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/led.rs
+F:	rust/kernel/led/
+
 LEGO MINDSTORMS EV3
 R:	David Lechner <david@lechnology.com>
 S:	Maintained
diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
new file mode 100644
index 000000000000..143f790eb6e4
--- /dev/null
+++ b/rust/kernel/led.rs
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for the leds driver model.
+//!
+//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
+
+use core::{
+    marker::PhantomData,
+    mem::transmute,
+    ptr::NonNull, //
+};
+
+use crate::{
+    container_of,
+    device::{
+        self,
+        property::FwNode,
+        AsBusDevice,
+        Bound, //
+    },
+    error::{
+        from_result,
+        to_result,
+        VTABLE_DEFAULT_ERROR, //
+    },
+    macros::vtable,
+    prelude::*,
+    sync::aref::ARef,
+    types::Opaque, //
+};
+
+mod normal;
+
+pub use normal::Device;
+
+/// The name of the led is determined by the driver.
+pub enum Named {}
+/// The name of the led is determined by its fwnode.
+pub enum Unnamed {}
+
+/// How the name of the led should be determined.
+pub trait DeviceBuilderState: private::Sealed {}
+
+impl DeviceBuilderState for Named {}
+impl private::Sealed for Named {}
+impl DeviceBuilderState for Unnamed {}
+impl private::Sealed for Unnamed {}
+
+/// The builder to register a led class device.
+///
+/// See [`LedOps`].
+pub struct DeviceBuilder<'init, S> {
+    fwnode: Option<ARef<FwNode>>,
+    name: Option<&'init CStr>,
+    devicename: Option<&'init CStr>,
+    devname_mandatory: bool,
+    initial_brightness: u32,
+    color: Color,
+    _p: PhantomData<S>,
+}
+
+impl<S: DeviceBuilderState> DeviceBuilder<'static, S> {
+    /// Creates a new [`DeviceBuilder`].
+    #[inline]
+    #[expect(
+        clippy::new_without_default,
+        reason = "no need and derive is prevented by S"
+    )]
+    pub fn new() -> Self {
+        Self {
+            fwnode: None,
+            name: None,
+            devicename: None,
+            devname_mandatory: false,
+            initial_brightness: 0,
+            color: Color::default(),
+            _p: PhantomData,
+        }
+    }
+}
+
+impl<'init> DeviceBuilder<'init, Unnamed> {
+    /// Sets the firmware node.
+    #[inline]
+    pub fn fwnode(self, fwnode: Option<ARef<FwNode>>) -> Self {
+        Self { fwnode, ..self }
+    }
+
+    /// Sets the device name.
+    #[inline]
+    pub fn devicename(self, devicename: &'init CStr) -> Self {
+        Self {
+            devicename: Some(devicename),
+            ..self
+        }
+    }
+
+    /// Sets if a device name is mandatory.
+    #[inline]
+    pub fn devicename_mandatory(self, mandatory: bool) -> Self {
+        Self {
+            devname_mandatory: mandatory,
+            ..self
+        }
+    }
+}
+
+impl<'init, S: DeviceBuilderState> DeviceBuilder<'init, S> {
+    /// Sets the initial brightness value for the led.
+    ///
+    /// The default brightness is 0.
+    /// If [`LedOps::brightness_get`] is implemented, this value will be ignored.
+    #[inline]
+    pub fn initial_brightness(self, brightness: u32) -> Self {
+        Self {
+            initial_brightness: brightness,
+            ..self
+        }
+    }
+
+    /// Sets the color of the led.
+    ///
+    /// This value can be overwritten by the "color" fwnode property.
+    #[inline]
+    pub fn color(self, color: Color) -> Self {
+        Self { color, ..self }
+    }
+}
+
+impl<'init> DeviceBuilder<'init, Named> {
+    /// Sets the name of the led.
+    ///
+    /// Setting this will prevent the fwnode from being used and prevents automatic name
+    /// composition.
+    #[inline]
+    pub fn name(self, name: &'init CStr) -> Self {
+        Self {
+            name: Some(name),
+            ..self
+        }
+    }
+}
+
+/// Trait defining the operations for a LED driver.
+///
+/// # Examples
+/// ```
+/// use kernel::{
+///      device,
+///      devres::Devres,
+///      led,
+///      macros::vtable,
+///      platform,
+///      prelude::*, //
+///  };
+///
+/// struct MyLedOps;
+///
+///
+/// #[vtable]
+/// impl led::LedOps for MyLedOps {
+///     type Bus = platform::Device<device::Bound>;
+///     const BLOCKING: bool = false;
+///     const MAX_BRIGHTNESS: u32 = 255;
+///
+///     fn brightness_set<'bound>(
+///         &self,
+///         _dev: &'bound platform::Device<device::Bound>,
+///         _classdev: &led::Device<'bound, Self>,
+///         _brightness: u32
+///     ) -> Result<()> {
+///         // Set the brightness for the led here
+///         Ok(())
+///     }
+/// }
+/// ```
+/// Led drivers must implement this trait in order to register and handle a [`Device`].
+#[vtable]
+pub trait LedOps: Send + Sync + Sized {
+    /// The bus device required by the implementation.
+    #[allow(private_bounds)]
+    type Bus: AsBusDevice<Bound>;
+
+    /// If set true, [`LedOps::brightness_set`] and [`LedOps::blink_set`] must perform the
+    /// operation immediately. If set false, they must not sleep.
+    const BLOCKING: bool;
+    /// The max brightness level.
+    const MAX_BRIGHTNESS: u32;
+
+    /// Sets the brightness level.
+    ///
+    /// See also [`LedOps::BLOCKING`].
+    fn brightness_set<'bound>(
+        &self,
+        dev: &'bound Self::Bus,
+        classdev: &Device<'bound, Self>,
+        brightness: u32,
+    ) -> Result<()>;
+
+    /// Gets the current brightness level.
+    fn brightness_get<'bound>(
+        &self,
+        dev: &'bound Self::Bus,
+        classdev: &Device<'bound, Self>,
+    ) -> Result<u32> {
+        let _ = (dev, classdev);
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Activates hardware accelerated blinking.
+    ///
+    /// delays are in milliseconds. If both are zero, a sensible default should be chosen.
+    /// The caller should adjust the timings in that case and if it can't match the values
+    /// specified exactly. Setting the brightness to 0 will disable the hardware accelerated
+    /// blinking.
+    ///
+    /// See also [`LedOps::BLOCKING`].
+    fn blink_set<'bound>(
+        &self,
+        dev: &'bound Self::Bus,
+        classdev: &Device<'bound, Self>,
+        delay_on: &mut usize,
+        delay_off: &mut usize,
+    ) -> Result<()> {
+        let _ = (dev, classdev, delay_on, delay_off);
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+}
+
+/// Led colors.
+#[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]
+#[repr(u32)]
+#[non_exhaustive]
+#[expect(
+    missing_docs,
+    reason = "it shouldn't be necessary to document each color"
+)]
+pub enum Color {
+    #[default]
+    White = bindings::LED_COLOR_ID_WHITE,
+    Red = bindings::LED_COLOR_ID_RED,
+    Green = bindings::LED_COLOR_ID_GREEN,
+    Blue = bindings::LED_COLOR_ID_BLUE,
+    Amber = bindings::LED_COLOR_ID_AMBER,
+    Violet = bindings::LED_COLOR_ID_VIOLET,
+    Yellow = bindings::LED_COLOR_ID_YELLOW,
+    Ir = bindings::LED_COLOR_ID_IR,
+    Multi = bindings::LED_COLOR_ID_MULTI,
+    Rgb = bindings::LED_COLOR_ID_RGB,
+    Purple = bindings::LED_COLOR_ID_PURPLE,
+    Orange = bindings::LED_COLOR_ID_ORANGE,
+    Pink = bindings::LED_COLOR_ID_PINK,
+    Cyan = bindings::LED_COLOR_ID_CYAN,
+    Lime = bindings::LED_COLOR_ID_LIME,
+}
+static_assert!(bindings::LED_COLOR_ID_MAX == 15);
+
+impl Color {
+    /// Name of the color
+    #[inline]
+    pub fn as_c_str(self) -> &'static CStr {
+        // SAFETY:
+        // - `self as u8` is a valid led color id.
+        // - `led_get_color_name` always returns a valid C string pointer.
+        unsafe { CStr::from_char_ptr(bindings::led_get_color_name(self as u8)) }
+    }
+}
+
+impl TryFrom<u32> for Color {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        if value < bindings::LED_COLOR_ID_MAX {
+            // SAFETY:
+            // - `Color` is represented as `u32`
+            // - the static_assert above guarantees that no additional color has been added
+            // - `value` is guaranteed to be in the color id range
+            Ok(unsafe { transmute::<u32, Color>(value) })
+        } else {
+            Err(EINVAL)
+        }
+    }
+}
+
+mod private {
+    pub trait Sealed {}
+}
diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
new file mode 100644
index 000000000000..816db7c57689
--- /dev/null
+++ b/rust/kernel/led/normal.rs
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Led mode for the `struct led_classdev`.
+//!
+//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
+
+use super::*;
+
+/// The led class device representation.
+///
+/// This structure represents the Rust abstraction for a led class device.
+#[pin_data(PinnedDrop)]
+pub struct Device<'bound, T: LedOps + 'bound> {
+    #[pin]
+    ops: T,
+    #[pin]
+    classdev: Opaque<bindings::led_classdev>,
+    _p: PhantomData<&'bound ()>,
+}
+
+impl<'init, S: DeviceBuilderState> DeviceBuilder<'init, S> {
+    /// Registers a new [`Device`].
+    pub fn build<'bound: 'init, T: LedOps + 'bound>(
+        self,
+        parent: &'bound T::Bus,
+        ops: impl PinInit<T, Error> + 'init,
+    ) -> impl PinInit<Device<'bound, T>, Error> + 'init {
+        const_assert!(T::MAX_BRIGHTNESS <= i32::MAX.unsigned_abs() || !T::HAS_BRIGHTNESS_GET);
+
+        try_pin_init!(Device {
+            ops <- ops,
+            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_classdev| {
+                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
+                // `led_classdev` gets fully initialized in-place by
+                // `led_classdev_register_ext` including `mutex` and `list_head`.
+                unsafe {
+                    ptr.write(bindings::led_classdev {
+                        brightness_set: (!T::BLOCKING)
+                            .then_some(Adapter::<T>::brightness_set_callback),
+                        brightness_set_blocking: T::BLOCKING
+                            .then_some(Adapter::<T>::brightness_set_blocking_callback),
+                        brightness_get: T::HAS_BRIGHTNESS_GET
+                            .then_some(Adapter::<T>::brightness_get_callback),
+                        blink_set: T::HAS_BLINK_SET.then_some(Adapter::<T>::blink_set_callback),
+                        max_brightness: T::MAX_BRIGHTNESS,
+                        brightness: self.initial_brightness,
+                        color: self.color as u32,
+                        name: self.name.map_or(core::ptr::null(), CStrExt::as_char_ptr),
+                        ..bindings::led_classdev::default()
+                    })
+                };
+
+                let mut init_data = bindings::led_init_data {
+                    fwnode: self
+                        .fwnode
+                        .as_ref()
+                        .map_or(core::ptr::null_mut(), |fwnode| fwnode.as_raw()),
+                    default_label: core::ptr::null(),
+                    devicename: self
+                        .devicename
+                        .map_or(core::ptr::null(), CStrExt::as_char_ptr),
+                    devname_mandatory: self.devname_mandatory,
+                };
+
+                // SAFETY:
+                // - `parent.as_ref().as_raw()` is guaranteed to be a pointer to a valid
+                //    `device`.
+                // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev`.
+                to_result(unsafe {
+                    bindings::led_classdev_register_ext(
+                        parent.as_ref().as_raw(),
+                        ptr,
+                        if self.name.is_none() {
+                            &raw mut init_data
+                        } else {
+                            core::ptr::null_mut()
+                        },
+                    )
+                })?;
+
+                core::mem::forget(self.fwnode); // keep the reference count incremented
+
+                Ok::<_, Error>(())
+            }),
+            _p: PhantomData,
+        })
+    }
+}
+
+impl<'bound, T: LedOps + 'bound> Device<'bound, T> {
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::Device`.
+    #[inline]
+    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &'a Self {
+        // SAFETY: The function's contract guarantees that `led_cdev` points to a `led_classdev`
+        // field embedded within a valid `led::Device`. `container_of!` can therefore
+        // safely calculate the address of the containing struct.
+        unsafe { &*container_of!(Opaque::cast_from(led_cdev), Self, classdev) }
+    }
+
+    #[inline]
+    fn parent(&self) -> &'bound device::Device<Bound> {
+        // SAFETY: `self.classdev.get()` is guaranteed to be a valid pointer to `led_classdev`.
+        unsafe { device::Device::from_raw((*(*self.classdev.get()).dev).parent) }
+    }
+}
+
+// SAFETY: A `led::Device` can be unregistered from any thread.
+unsafe impl<'bound, T: LedOps + 'bound + Send> Send for Device<'bound, T> {}
+
+// SAFETY: `led::Device` can be shared among threads because all methods of `led::Device`
+// are thread safe.
+unsafe impl<'bound, T: LedOps + 'bound + Sync> Sync for Device<'bound, T> {}
+
+struct Adapter<T: LedOps> {
+    _p: PhantomData<T>,
+}
+
+impl<T: LedOps> Adapter<T> {
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::Device`.
+    /// This function is called on setting the brightness of a led.
+    unsafe extern "C" fn brightness_set_callback(
+        led_cdev: *mut bindings::led_classdev,
+        brightness: u32,
+    ) {
+        // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+        // `led_classdev` embedded within a `led::Device`.
+        let classdev = unsafe { Device::<T>::from_raw(led_cdev) };
+        // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+        let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+        let _ = classdev.ops.brightness_set(parent, classdev, brightness);
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::Device`.
+    /// This function is called on setting the brightness of a led immediately.
+    unsafe extern "C" fn brightness_set_blocking_callback(
+        led_cdev: *mut bindings::led_classdev,
+        brightness: u32,
+    ) -> i32 {
+        from_result(|| {
+            // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+            // `led_classdev` embedded within a `led::Device`.
+            let classdev = unsafe { Device::<T>::from_raw(led_cdev) };
+            // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+            let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+            classdev.ops.brightness_set(parent, classdev, brightness)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::Device`.
+    /// This function is called on getting the brightness of a led.
+    unsafe extern "C" fn brightness_get_callback(led_cdev: *mut bindings::led_classdev) -> u32 {
+        // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+        // `led_classdev` embedded within a `led::Device`.
+        let classdev = unsafe { Device::<T>::from_raw(led_cdev) };
+        // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+        let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+        // CAST: Resulting value will be casted back to i32 in the led subsystem.
+        from_result(|| {
+            classdev
+                .ops
+                .brightness_get(parent, classdev)
+                .inspect(|val| debug_assert!(*val <= T::MAX_BRIGHTNESS))
+                .and_then(|val| Ok(i32::try_from(val)?))
+        }) as u32
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::Device`.
+    /// `delay_on` and `delay_off` must be valid pointers to `usize` and have
+    /// exclusive access for the period of this function.
+    /// This function is called on enabling hardware accelerated blinking.
+    unsafe extern "C" fn blink_set_callback(
+        led_cdev: *mut bindings::led_classdev,
+        delay_on: *mut usize,
+        delay_off: *mut usize,
+    ) -> i32 {
+        from_result(|| {
+            // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+            // `led_classdev` embedded within a `led::Device`.
+            let classdev = unsafe { Device::<T>::from_raw(led_cdev) };
+            // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+            let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+            classdev.ops.blink_set(
+                parent,
+                classdev,
+                // SAFETY: The function's contract guarantees that `delay_on` points to a `usize`
+                // and is exclusive for the period of this function.
+                unsafe { &mut *delay_on },
+                // SAFETY: The function's contract guarantees that `delay_off` points to a `usize`
+                // and is exclusive for the period of this function.
+                unsafe { &mut *delay_off },
+            )?;
+            Ok(0)
+        })
+    }
+}
+
+#[pinned_drop]
+impl<'bound, T: LedOps + 'bound> PinnedDrop for Device<'bound, T> {
+    fn drop(self: Pin<&mut Self>) {
+        let raw = self.classdev.get();
+        // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a
+        // valid `led_classdev`.
+        let dev: &device::Device = unsafe { device::Device::from_raw((*raw).dev) };
+
+        let _fwnode = dev
+            .fwnode()
+            // SAFETY: the reference count of `fwnode` has previously been
+            // incremented in `led::DeviceBuilder::build`.
+            .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode)) });
+
+        // SAFETY: The existence of `self` guarantees that `self.classdev` has previously been
+        // successfully registered with `led_classdev_register_ext`.
+        unsafe { bindings::led_classdev_unregister(raw) };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..09e4cc7a14db 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -90,6 +90,7 @@
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
+pub mod led;
 pub mod list;
 pub mod maple_tree;
 pub mod miscdevice;

-- 
2.54.0



