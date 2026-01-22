Return-Path: <linux-leds+bounces-6700-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEA4LH0rcmmadwAAu9opvQ
	(envelope-from <linux-leds+bounces-6700-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 14:51:57 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE1678D1
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 14:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59D7188BACA
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 12:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215783ACEF4;
	Thu, 22 Jan 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="BL3LXz8V"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583C5328630
	for <linux-leds@vger.kernel.org>; Thu, 22 Jan 2026 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085739; cv=none; b=LSVOrG/f11Yyq27dZFkh0KpitZKdYRoV5/gvwv1OhPg1py7qP7n7AUztlbTh9b66NwNkR2K+ApSXAy5Vv4Z4+oXWsyDI6zjCnnHuGYo1Aq54Idutk5li9b5+qgoefTtoJPfxYe6pDYr/feFjtLXpHVkFy1lDBR08MZk4NS9Ib2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085739; c=relaxed/simple;
	bh=oze6adWzrJ+HpxukBJFnQYx9QkB+rLEBvyg04ko90iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBWAjApzHudzvrlA8AUMdGGzmVXTj9lSE0rFypVOly1Hzu6Mcc1x0q7DAIXV0VcyRNA4JBdX+IUmUIF/3Bk3v1gc7yksSIIMGp2oC5avaa5OD0GOommUDt3re5ozR/K1UK/trTKuI5jpxnLuIsNKTM7y9y7ncQICBthgCYfwUe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=BL3LXz8V; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 812C9240027
	for <linux-leds@vger.kernel.org>; Thu, 22 Jan 2026 13:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1769085733; bh=Rur+tkKy3c2ScRB7ACUgcumNtXqeeL3axM7KhupMMP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=BL3LXz8V2WNsQKD4Y0DpiTwBjOl2afeTJ7Pk90xDSQqdBQUtD40Wx4rUZSW2kgsDh
	 e5QGRxZJPLYaXEDy3FlUV9LhsEkQ9MZFyIQ0jM1Z6R3egfjlLiEXrnuwLIpVbWfICQ
	 juL5oA/12FNx7dmh1S7dUipIjveQnWDSauRYRYyfs6W1SvJ1XA7QCOJ1I6ehxL29H7
	 8KljgMuW4TFdqUU/D88ZvSyWaDPWood1tR0YobFsUnDiYlQkb5nvORGJ1xuaLkkBxZ
	 y79NH0iOF5odkWIJVGRnbnACPtNCjW6F10636MNx2Hzovc28MI/Nng/PIRg3ipC2J0
	 u117KkrNuwniw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dxggQ38Vxz6twp;
	Thu, 22 Jan 2026 13:42:10 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Thu, 22 Jan 2026 12:42:12 +0000
Subject: [PATCH RESEND v10 3/3] rust: leds: add multicolor classdev
 abstractions
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-rust_leds-v10-3-fb9edb04b080@posteo.de>
References: <20260122-rust_leds-v10-0-fb9edb04b080@posteo.de>
In-Reply-To: <20260122-rust_leds-v10-0-fb9edb04b080@posteo.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=20416;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=oze6adWzrJ+HpxukBJFnQYx9QkB+rLEBvyg04ko90iM=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpchsXa0ssYwITQ6Pqp+ky60Ra03O06+dlGWZ7N
 3kqp/37uXOJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaXIbFxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9I2yA/9E9vnLdFUxIkJSPJAxssnjlDIBjzXzqL
 SMHpbHyBX0N9BswYbeYQIJ/BT+KVQROeKwi4P7lct5a5ADtBaRpQ3kDLFk+V1YyqLvzYcF33Q/e
 1o4RRSbgqoG5TA204F1WJc/rYiz4hsRfPCabic1W7mDgb3JRRqopWMtbK6kMMQ8GVjTqkfivSAS
 0wh/Q+gPSJep7lNd1zWIBElqmcwQAjVF0tCHS6xP1S0o8amuAaCEWmD9frCFo7NxlC8T8Lsf+zT
 I6ITkHk95OtCnebp+MGhgbj2dVmPrhq5m8E15ABI+EIaDpLO6RbFD5ZSJQEwSt65fxl/yiu7MC9
 5Kqe2yJrbdNrJl4bP8dLxAGBVA8n0t4LLBygdJkQnL0+pc2M1qa3M/K8ggJGskCuyeWnn3lXg/p
 K2WFzfPvn4RKkcyb/8euxJJunjChUjS570nXkgaxdfP4mEIRz9AhE9tJW+9q6Mz2uh9p5N7NAjJ
 z5rt09HiPNmNvsNrnxEEm32YEZHENrtvYUnnDfdocOTQpakffur+Xyif6ieVQvAvTYLDCKxMZj7
 yc/wRNKoM/rzUPNN2tIuHubec+S8YpYu13+pAWabcc1amxRp1cMoHWFSQO1sVYpPN2jyoKfLWRw
 F9g14zJz12j+XVA5/LfYQGP852TE4pTpqUic0lxGNn6piw+R83fI=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[posteo.de,none];
	DKIM_TRACE(0.00)[posteo.de:+];
	TAGGED_FROM(0.00)[bounces-6700-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1ECE1678D1
X-Rspamd-Action: no action

Implement the abstractions needed for multicolor led class devices,
including:

* `led::MultiColor` - the led mode implementation

* `MultiColorSubLed` - a safe wrapper arround `mc_subled`

* `led::MultiColorDevice` - a safe wrapper around `led_classdev_mc`

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/led.rs              |  30 +++-
 rust/kernel/led/multicolor.rs   | 384 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 414 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b42..765a4198b85d 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -62,6 +62,7 @@
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/mdio.h>
 #include <linux/mm.h>
 #include <linux/miscdevice.h>
diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
index a9eb2e8e480c..e20857fd1644 100644
--- a/rust/kernel/led.rs
+++ b/rust/kernel/led.rs
@@ -33,8 +33,12 @@
     }, //
 };
 
+#[cfg(CONFIG_LEDS_CLASS_MULTICOLOR)]
+mod multicolor;
 mod normal;
 
+#[cfg(CONFIG_LEDS_CLASS_MULTICOLOR)]
+pub use multicolor::{MultiColor, MultiColorDevice, MultiColorSubLed};
 pub use normal::{Device, Normal};
 
 /// The led init data representation.
@@ -229,7 +233,24 @@ pub enum Color {
     Violet = bindings::LED_COLOR_ID_VIOLET,
     Yellow = bindings::LED_COLOR_ID_YELLOW,
     Ir = bindings::LED_COLOR_ID_IR,
+    #[cfg_attr(
+        CONFIG_LEDS_CLASS_MULTICOLOR,
+        doc = "Use this color for a [`MultiColor`] led."
+    )]
+    #[cfg_attr(
+        not(CONFIG_LEDS_CLASS_MULTICOLOR),
+        doc = "Use this color for a `MultiColor` led."
+    )]
+    /// If the led supports RGB, use [`Color::Rgb`] instead.
     Multi = bindings::LED_COLOR_ID_MULTI,
+    #[cfg_attr(
+        CONFIG_LEDS_CLASS_MULTICOLOR,
+        doc = "Use this color for a [`MultiColor`] led with rgb support."
+    )]
+    #[cfg_attr(
+        not(CONFIG_LEDS_CLASS_MULTICOLOR),
+        doc = "Use this color for a `MultiColor` led with rgb support."
+    )]
     Rgb = bindings::LED_COLOR_ID_RGB,
     Purple = bindings::LED_COLOR_ID_PURPLE,
     Orange = bindings::LED_COLOR_ID_ORANGE,
@@ -261,7 +282,14 @@ fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
 ///
 /// Each led mode has its own led class device type with different capabilities.
 ///
-/// See [`Normal`].
+#[cfg_attr(
+    CONFIG_LEDS_CLASS_MULTICOLOR,
+    doc = "See [`Normal`] and [`MultiColor`]."
+)]
+#[cfg_attr(
+    not(CONFIG_LEDS_CLASS_MULTICOLOR),
+    doc = "See [`Normal`] and `MultiColor`."
+)]
 pub trait Mode: private::Sealed {
     /// The class device for the led mode.
     type Device<T: LedOps<Mode = Self>>;
diff --git a/rust/kernel/led/multicolor.rs b/rust/kernel/led/multicolor.rs
new file mode 100644
index 000000000000..84573fcae1c3
--- /dev/null
+++ b/rust/kernel/led/multicolor.rs
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Led mode for the `struct led_classdev_mc`.
+//!
+//! C header: [`include/linux/led-class-multicolor.h`](srctree/include/linux/led-class-multicolor.h)
+
+use crate::alloc::KVec;
+
+use super::*;
+
+/// The led mode for the `struct led_classdev_mc`. Leds with this mode can have multiple colors.
+pub enum MultiColor {}
+impl Mode for MultiColor {
+    type Device<T: LedOps<Mode = Self>> = MultiColorDevice<T>;
+}
+impl private::Sealed for MultiColor {}
+
+/// The multicolor sub led info representation.
+///
+/// This structure represents the Rust abstraction for a C `struct mc_subled`.
+#[repr(C)]
+#[derive(Copy, Clone, Debug)]
+#[non_exhaustive]
+pub struct MultiColorSubLed {
+    /// the color of the sub led
+    pub color: Color,
+    /// the brightness of the sub led.
+    ///
+    /// The value will be automatically calculated.
+    /// See `MultiColor::pre_brightness_set`.
+    pub brightness: u32,
+    /// the intensity of the sub led.
+    pub intensity: u32,
+    /// arbitrary data for the driver to store.
+    pub channel: u32,
+}
+
+// We directly pass a reference to the `subled_info` field in `led_classdev_mc` to the driver via
+// `Device::subleds()`.
+// We need safeguards to ensure `MultiColorSubLed` and `mc_subled` stay identical.
+const _: () = {
+    use core::mem::offset_of;
+
+    const fn assert_same_type<T>(_: &T, _: &T) {}
+
+    let rust_zeroed = MultiColorSubLed {
+        color: Color::White,
+        brightness: 0,
+        intensity: 0,
+        channel: 0,
+    };
+    let c_zeroed = bindings::mc_subled {
+        color_index: 0,
+        brightness: 0,
+        intensity: 0,
+        channel: 0,
+    };
+
+    assert!(offset_of!(MultiColorSubLed, color) == offset_of!(bindings::mc_subled, color_index));
+    assert_same_type(&0u32, &c_zeroed.color_index);
+
+    assert!(
+        offset_of!(MultiColorSubLed, brightness) == offset_of!(bindings::mc_subled, brightness)
+    );
+    assert_same_type(&rust_zeroed.brightness, &c_zeroed.brightness);
+
+    assert!(offset_of!(MultiColorSubLed, intensity) == offset_of!(bindings::mc_subled, intensity));
+    assert_same_type(&rust_zeroed.intensity, &c_zeroed.intensity);
+
+    assert!(offset_of!(MultiColorSubLed, channel) == offset_of!(bindings::mc_subled, channel));
+    assert_same_type(&rust_zeroed.channel, &c_zeroed.channel);
+
+    assert!(size_of::<MultiColorSubLed>() == size_of::<bindings::mc_subled>());
+};
+
+impl MultiColorSubLed {
+    /// Create a new multicolor sub led info.
+    pub const fn new(color: Color) -> Self {
+        Self {
+            color,
+            brightness: 0,
+            intensity: 0,
+            channel: 0,
+        }
+    }
+
+    /// Set arbitrary data for the driver.
+    pub const fn channel(mut self, channel: u32) -> Self {
+        self.channel = channel;
+        self
+    }
+
+    /// Set the initial intensity of the subled.
+    pub const fn initial_intensity(mut self, intensity: u32) -> Self {
+        self.intensity = intensity;
+        self
+    }
+}
+
+/// The multicolor led class device representation.
+///
+/// This structure represents the Rust abstraction for a multicolor led class device.
+#[pin_data(PinnedDrop)]
+pub struct MultiColorDevice<T: LedOps<Mode = MultiColor>> {
+    ops: T,
+    #[pin]
+    classdev: Opaque<bindings::led_classdev_mc>,
+}
+
+impl<T: LedOps<Mode = MultiColor>> MultiColorDevice<T> {
+    /// Registers a new led classdev.
+    ///
+    /// The [`MultiColorDevice`] will be unregistered on drop.
+    pub fn new<'a>(
+        parent: &'a T::Bus,
+        init_data: InitData<'a>,
+        ops: T,
+        subleds: &'a [MultiColorSubLed],
+    ) -> impl PinInit<Devres<Self>, Error> + 'a {
+        Devres::new(
+            parent.as_ref(),
+            try_pin_init!(Self {
+                ops,
+                classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_classdev_mc| {
+                    let mut used = 0;
+                    if subleds.iter().any(|subled| {
+                        let bit = 1 << (subled.color as u32);
+                        if (used & bit) != 0 {
+                            true
+                        } else {
+                            used |= bit;
+                            false
+                        }
+                    }) {
+                        dev_err!(parent.as_ref(), "duplicate color in multicolor led\n");
+                        return Err(EINVAL);
+                    }
+                    let mut subleds_vec = KVec::new();
+                    subleds_vec.extend_from_slice(subleds, GFP_KERNEL)?;
+                    let (subled_info, num_colors, capacity) = subleds_vec.into_raw_parts();
+                    debug_assert_eq!(num_colors, capacity);
+
+                    // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
+                    // `led_classdev_mc` gets fully initialized in-place by
+                    // `led_classdev_multicolor_register_ext` including `mutex` and `list_head`.
+                    unsafe {
+                        ptr.write(
+                            bindings::led_classdev_mc {
+                            led_cdev: bindings::led_classdev {
+                                brightness_set: (!T::BLOCKING)
+                                    .then_some(Adapter::<T>::brightness_set_callback),
+                                brightness_set_blocking: T::BLOCKING
+                                    .then_some(Adapter::<T>::brightness_set_blocking_callback),
+                                brightness_get: T::HAS_BRIGHTNESS_GET
+                                    .then_some(Adapter::<T>::brightness_get_callback),
+                                blink_set: T::HAS_BLINK_SET.then_some(Adapter::<T>::blink_set_callback),
+                                max_brightness: T::MAX_BRIGHTNESS,
+                                brightness: init_data.initial_brightness,
+                                default_trigger: init_data.default_trigger
+                                    .map_or(core::ptr::null(), CStrExt::as_char_ptr),
+                                color: init_data.color as u32,
+                                ..bindings::led_classdev::default()
+                            },
+                            num_colors: u32::try_from(num_colors)?,
+                            // CAST: The safeguards in the const block ensure that `MultiColorSubLed` has an
+                            // identical layout to `mc_subled`.
+                            subled_info: subled_info.cast::<bindings::mc_subled>(),
+                        })
+                    };
+
+                    let mut init_data_raw = bindings::led_init_data {
+                        fwnode: init_data.fwnode
+                            .as_ref()
+                            .map_or(core::ptr::null_mut(), |fwnode| fwnode.as_raw()),
+                        default_label: core::ptr::null(),
+                        devicename: init_data
+                            .devicename
+                            .map_or(core::ptr::null(), CStrExt::as_char_ptr),
+                        devname_mandatory: init_data.devname_mandatory,
+                    };
+
+                    // SAFETY:
+                    // - `parent.as_ref().as_raw()` is guaranteed to be a pointer to a valid
+                    //    `device`.
+                    // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev_mc`.
+                    to_result(unsafe {
+                        bindings::led_classdev_multicolor_register_ext(
+                            parent.as_ref().as_raw(),
+                            ptr,
+                            &raw mut init_data_raw,
+                        )
+                    }).inspect_err(|_err| {
+                        // SAFETY: `subled_info` is guaranteed to be a valid array pointer to `mc_subled` with the
+                        // length and capacity of `num_colors`.
+                        drop(unsafe {
+                            KVec::from_raw_parts(
+                                subled_info,
+                                num_colors,
+                                num_colors,
+                            )
+                        });
+                    })?;
+
+                    core::mem::forget(init_data.fwnode); // keep the reference count incremented
+
+                    Ok::<_, Error>(())
+                }),
+            }),
+        )
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &'a Self {
+        // SAFETY: The function's contract guarantees that `led_cdev` points to a `led_classdev`
+        // field embedded within a valid `led::MultiColorDevice`. `container_of!` can therefore
+        // safely calculate the address of the containing struct.
+        let led_mc_cdev = unsafe { container_of!(led_cdev, bindings::led_classdev_mc, led_cdev) };
+
+        // SAFETY: It is guaranteed that `led_mc_cdev` points to a `led_classdev_mc`
+        // field embedded within a valid `led::MultiColorDevice`. `container_of!` can therefore
+        // safely calculate the address of the containing struct.
+        unsafe { &*container_of!(Opaque::cast_from(led_mc_cdev), Self, classdev) }
+    }
+
+    fn parent(&self) -> &device::Device<Bound> {
+        // SAFETY: `self.classdev.get()` is guaranteed to be a valid pointer to `led_classdev_mc`.
+        unsafe { device::Device::from_raw((*(*self.classdev.get()).led_cdev.dev).parent) }
+    }
+
+    /// Returns the subleds passed to [`Device::new_multicolor`].
+    pub fn subleds(&self) -> &[MultiColorSubLed] {
+        // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a
+        // valid `led_classdev_mc`.
+        let raw = unsafe { &*self.classdev.get() };
+        // SAFETY: `raw.subled_info` is a valid pointer to `mc_subled[num_colors]`.
+        // CAST: The safeguards in the const block ensure that `MultiColorSubLed` has an identical
+        // layout to `mc_subled`.
+        unsafe {
+            core::slice::from_raw_parts(
+                raw.subled_info.cast::<MultiColorSubLed>(),
+                raw.num_colors as usize,
+            )
+        }
+    }
+}
+
+// SAFETY: A `led::MultiColorDevice` can be unregistered from any thread.
+unsafe impl<T: LedOps<Mode = MultiColor> + Send> Send for MultiColorDevice<T> {}
+
+// SAFETY: `led::MultiColorDevice` can be shared among threads because all methods of `led::Device`
+// are thread safe.
+unsafe impl<T: LedOps<Mode = MultiColor> + Sync> Sync for MultiColorDevice<T> {}
+
+struct Adapter<T: LedOps<Mode = MultiColor>> {
+    _p: PhantomData<T>,
+}
+
+impl<T: LedOps<Mode = MultiColor>> Adapter<T> {
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    /// This function is called on setting the brightness of a led.
+    unsafe extern "C" fn brightness_set_callback(
+        led_cdev: *mut bindings::led_classdev,
+        brightness: u32,
+    ) {
+        // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+        // `led_classdev` embedded within a `led::MultiColorDevice`.
+        let classdev = unsafe { MultiColorDevice::<T>::from_raw(led_cdev) };
+        // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+        let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+        // SAFETY: `classdev.classdev.get()` is guaranteed to be a pointer to a valid
+        // `led_classdev_mc`.
+        unsafe { bindings::led_mc_calc_color_components(classdev.classdev.get(), brightness) };
+
+        let _ = classdev.ops.brightness_set(parent, classdev, brightness);
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    /// This function is called on setting the brightness of a led immediately.
+    unsafe extern "C" fn brightness_set_blocking_callback(
+        led_cdev: *mut bindings::led_classdev,
+        brightness: u32,
+    ) -> i32 {
+        from_result(|| {
+            // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+            // `led_classdev` embedded within a `led::MultiColorDevice`.
+            let classdev = unsafe { MultiColorDevice::<T>::from_raw(led_cdev) };
+            // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+            let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+            // SAFETY: `classdev.classdev.get()` is guaranteed to be a pointer to a valid
+            // `led_classdev_mc`.
+            unsafe { bindings::led_mc_calc_color_components(classdev.classdev.get(), brightness) };
+
+            classdev.ops.brightness_set(parent, classdev, brightness)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
+    /// This function is called on getting the brightness of a led.
+    unsafe extern "C" fn brightness_get_callback(led_cdev: *mut bindings::led_classdev) -> u32 {
+        // SAFETY: The function's contract guarantees that `led_cdev` is a valid pointer to a
+        // `led_classdev` embedded within a `led::MultiColorDevice`.
+        let classdev = unsafe { MultiColorDevice::<T>::from_raw(led_cdev) };
+        // SAFETY: `classdev.parent()` is guaranteed to be contained in `T::Bus`.
+        let parent = unsafe { T::Bus::from_device(classdev.parent()) };
+
+        classdev.ops.brightness_get(parent, classdev)
+    }
+
+    /// # Safety
+    /// `led_cdev` must be a valid pointer to a `led_classdev` embedded within a
+    /// `led::MultiColorDevice`.
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
+            // `led_classdev` embedded within a `led::MultiColorDevice`.
+            let classdev = unsafe { MultiColorDevice::<T>::from_raw(led_cdev) };
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
+impl<T: LedOps<Mode = MultiColor>> PinnedDrop for MultiColorDevice<T> {
+    fn drop(self: Pin<&mut Self>) {
+        let raw = self.classdev.get();
+        // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a
+        // valid `led_classdev_mc`.
+        let dev: &device::Device = unsafe { device::Device::from_raw((*raw).led_cdev.dev) };
+
+        let _fwnode = dev
+            .fwnode()
+            // SAFETY: the reference count of `fwnode` has previously been
+            // incremented in `led::Device::new`.
+            .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode)) });
+
+        // SAFETY: The existence of `self` guarantees that `self.classdev` has previously been
+        // successfully registered with `led_classdev_multicolor_register_ext`.
+        unsafe { bindings::led_classdev_multicolor_unregister(raw) };
+
+        // SAFETY: `raw` is guaranteed to be a valid pointer to `led_classdev_mc`.
+        let led_cdev = unsafe { &*raw };
+
+        // SAFETY: `subled_info` is guaranteed to be a valid array pointer to `mc_subled` with the
+        // length and capacity of `led_cdev.num_colors`. See `led::MulticolorDevice::new`.
+        drop(unsafe {
+            KVec::from_raw_parts(
+                led_cdev.subled_info,
+                led_cdev.num_colors as usize,
+                led_cdev.num_colors as usize,
+            )
+        });
+    }
+}

-- 
2.52.0


