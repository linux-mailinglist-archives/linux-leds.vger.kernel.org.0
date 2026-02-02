Return-Path: <linux-leds+bounces-6817-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILvdKOWsgGmiAQMAu9opvQ
	(envelope-from <linux-leds+bounces-6817-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 02 Feb 2026 14:55:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCAECCF95
	for <lists+linux-leds@lfdr.de>; Mon, 02 Feb 2026 14:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CB1C30689A3
	for <lists+linux-leds@lfdr.de>; Mon,  2 Feb 2026 13:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380FE35EDC9;
	Mon,  2 Feb 2026 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="CGpB9aMB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19F368268
	for <linux-leds@vger.kernel.org>; Mon,  2 Feb 2026 13:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040345; cv=none; b=GlBxd3sdzbAPE5iK3GV18E5rf0Q5hwz6J6P48KM5aUNB1veJ7fTeR3y2LySJ5LapNOat68bHjeP7boqdhYml4UJtQJshvViduX5VpbtCHj/pTJpULACYI/o2ROHphNz5bHhR9vScErHMv2coCH6aEsYob8IJhYc8wiqZ9bvUUJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040345; c=relaxed/simple;
	bh=4JqWnMhK6PLoPiefZoNEA93GP07694S3Z1Hk/HpgYUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SV/Qjm9w/CfXd9/KyKSF2R0IFoXOBaX/u1fAxKbWSRMJRDmSf7mKAZWGeZ1CaIyz1rKwI+nUpIpT5i6pMl1OFEF3Vw3rtqo1GB/iqni81nOF9YyxNIQFtZ6i++HQHEfSyRDlTKq/pKno24LDwDOtEQaWmtNXYnexmYfNkhFNWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=CGpB9aMB; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5990724002E
	for <linux-leds@vger.kernel.org>; Mon,  2 Feb 2026 14:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1770040341; bh=Raakbe0iRcI1qlqt5QiVs+83FkT9mKWPg/BdaQTh87U=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=CGpB9aMBI/gGicGNVa/QS2knlHMl7QLIRXC+bWml4uWuXgf/Wr1BY9hvDVm3zYfDr
	 6FCPmVQf5fI8RufUMYwZLxnHX5fWYWCzJIq3hqlD0axxArVO5uI1JGuwmdjcDmTCX1
	 5b4359mcUV30VCmvkc9weU2BScPEa7B8P7yYxCzIlj7SsvuaUniwSQk8LOrgIUaEBh
	 mH+ZQT9aFXvczJwpDwow8cXnvY6SjWfemjT0cHGW6ktf7pYDFxefTs7qtcklvYQV2S
	 a9jSyUFHbDiaLltAVF1494PlBHQEVC06kTC3rbmRjuUb3qV4twaSn7AdBbP4R4hPNM
	 DVmO/9OvxQBQQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f4SjF72Ccz6tsb;
	Mon,  2 Feb 2026 14:52:17 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Mon, 02 Feb 2026 13:52:20 +0000
Subject: [PATCH v11 1/3] rust: leds: add basic led classdev abstractions
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-rust_leds-v11-1-585d1c8be20c@posteo.de>
References: <20260202-rust_leds-v11-0-585d1c8be20c@posteo.de>
In-Reply-To: <20260202-rust_leds-v11-0-585d1c8be20c@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18258;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=4JqWnMhK6PLoPiefZoNEA93GP07694S3Z1Hk/HpgYUM=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpgKwI+hPrJlE5BZ7bu6wBoZGIj/FAHSen8LQod
 qTZA5ekekSJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaYCsCBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9LY+Q//S/qbX/hjPII9nLWMbYmsLo+PgrtZkli
 6JYH9CS7ddYIr2oULxu4J2fHCS1XF/a3dGXERepH8tt0oHeObAlukraThHJb5e2Ke5ACQ6PcPFL
 VHwLzFEuRmGMuUQjWvEre7tS0CohUFVn6I/o+XL2kxMyDDH1jEzj/14TwSnJnzMFJSECc+nHx6P
 2qbL/wH2v+knB/Rv2D9LTPswucDGYOb8W/WKkrVuQGUrJVM4k66sYxaRUDIaBHt9sxVK0XG3UId
 UaCQzSQI4mXNOSPl12n8armssKh8ctdb56TPRzdbR9NY0kDcpTOH0F0CD7/qhfYlDcxk5JxSuLy
 /TDesmitSP4qxpqQ4FK/aBkSQPQBrgocGJ2hL6zt+O/vAoXqv98g5BcRbDxmoj98qJhM0kAj0LB
 a8NAuWZ1XJITAFZgc+0kd+q4r4O4y2JV4hi40TLo8bou+JjVIQszvak0sirstYL9VVkoObpkwIo
 B7tUVjvcFTe5qW0NLTLe0T8TYS3+vr2/r7SFmZJysZIXouPgXb1Tw7ZmPMsLCRbUgXie0950PBJ
 TaIdlEt1OuWldd7UWUCyUOKsBCXNTCIo+7CKlorFSleVPfZTlcb2DcHq7UDWlVORrpCHVKKhO5F
 76AxkSNdsdB2o3Uvdlz6GDklM6+buCJ+aQpoEXLcmvKSzLjwnNwQ=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6817-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lechnology.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:email,posteo.de:dkim,posteo.de:mid]
X-Rspamd-Queue-Id: 1FCAECCF95
X-Rspamd-Action: no action

Implement the core abstractions needed for led class devices, including:

* `led::LedOps` - the trait for handling leds, including
  `brightness_set`, `brightness_get` and `blink_set`

* `led::InitData` - data set for the led class device

* `led::Device` - a safe wrapper around `led_classdev`

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 MAINTAINERS        |   7 +
 rust/kernel/led.rs | 453 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   1 +
 3 files changed, 461 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0efa8cc6775b..26765fecb9a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14279,6 +14279,13 @@ F:	drivers/leds/
 F:	include/dt-bindings/leds/
 F:	include/linux/leds.h
 
+LED SUBSYSTEM [RUST]
+M:	Markus Probst <markus.probst@posteo.de>
+L:	linux-leds@vger.kernel.org
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/led.rs
+
 LEGO MINDSTORMS EV3
 R:	David Lechner <david@lechnology.com>
 S:	Maintained
diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
new file mode 100644
index 000000000000..9acb6946f3da
--- /dev/null
+++ b/rust/kernel/led.rs
@@ -0,0 +1,453 @@
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
+    devres::Devres,
+    error::{
+        from_result,
+        to_result,
+        VTABLE_DEFAULT_ERROR, //
+    },
+    macros::vtable,
+    prelude::*,
+    str::CStrExt,
+    types::{
+        ARef,
+        Opaque, //
+    }, //
+};
+
+/// The led class device representation.
+///
+/// This structure represents the Rust abstraction for a C `struct led_classdev`.
+#[pin_data(PinnedDrop)]
+pub struct Device<T: LedOps> {
+    #[pin]
+    ops: T,
+    #[pin]
+    classdev: Opaque<bindings::led_classdev>,
+}
+
+/// The led init data representation.
+///
+/// This structure represents the Rust abstraction for a C `struct led_init_data` with additional
+/// fields from `struct led_classdev`.
+#[derive(Default)]
+pub struct InitData<'a> {
+    fwnode: Option<ARef<FwNode>>,
+    devicename: Option<&'a CStr>,
+    devname_mandatory: bool,
+    initial_brightness: u32,
+    default_trigger: Option<&'a CStr>,
+    color: Color,
+}
+
+impl InitData<'static> {
+    /// Creates a new [`InitData`].
+    pub fn new() -> Self {
+        Self::default()
+    }
+}
+
+impl<'a> InitData<'a> {
+    /// Sets the firmware node.
+    pub fn fwnode(self, fwnode: Option<ARef<FwNode>>) -> Self {
+        Self { fwnode, ..self }
+    }
+
+    /// Sets the device name.
+    pub fn devicename(self, devicename: &'a CStr) -> Self {
+        Self {
+            devicename: Some(devicename),
+            ..self
+        }
+    }
+
+    /// Sets if a device name is mandatory.
+    pub fn devicename_mandatory(self, mandatory: bool) -> Self {
+        Self {
+            devname_mandatory: mandatory,
+            ..self
+        }
+    }
+
+    /// Sets the initial brightness value for the led.
+    ///
+    /// The default brightness is 0.
+    /// If [`LedOps::brightness_get`] is implemented, this value will be ignored.
+    pub fn initial_brightness(self, brightness: u32) -> Self {
+        Self {
+            initial_brightness: brightness,
+            ..self
+        }
+    }
+
+    /// Set the default led trigger.
+    ///
+    /// This value can be overwritten by the "linux,default-trigger" fwnode property.
+    pub fn default_trigger(self, trigger: &'a CStr) -> Self {
+        Self {
+            default_trigger: Some(trigger),
+            ..self
+        }
+    }
+
+    /// Sets the color of the led.
+    ///
+    /// This value can be overwritten by the "color" fwnode property.
+    pub fn color(self, color: Color) -> Self {
+        Self { color, ..self }
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
+///     fn brightness_set(
+///         &self,
+///         _dev: &platform::Device<device::Bound>,
+///         _classdev: &led::Device<Self>,
+///         _brightness: u32
+///     ) -> Result<()> {
+///         // Set the brightness for the led here
+///         Ok(())
+///     }
+/// }
+///
+/// fn register_my_led(
+///     parent: &platform::Device<device::Bound>,
+/// ) -> Result<Pin<KBox<Devres<led::Device<MyLedOps>>>>> {
+///     KBox::pin_init(led::Device::new(
+///         parent,
+///         led::InitData::new(),
+///         Ok(MyLedOps),
+///     ), GFP_KERNEL)
+/// }
+/// ```
+/// Led drivers must implement this trait in order to register and handle a [`Device`].
+#[vtable]
+pub trait LedOps: Send + 'static + Sized {
+    /// The bus device required by the implementation.
+    #[allow(private_bounds)]
+    type Bus: AsBusDevice<Bound>;
+    /// If set true, [`LedOps::brightness_set`] and [`LedOps::blink_set`] must perform the
+    /// operation immediately. If set false, they must not sleep.
+    const BLOCKING: bool;
+    /// The max brightness level.
+    const MAX_BRIGHTNESS: u32;
+
+    /// Sets the brightness level.
+    ///
+    /// See also [`LedOps::BLOCKING`].
+    fn brightness_set(
+        &self,
+        dev: &Self::Bus,
+        classdev: &Device<Self>,
+        brightness: u32,
+    ) -> Result<()>;
+
+    /// Gets the current brightness level.
+    fn brightness_get(&self, _dev: &Self::Bus, _classdev: &Device<Self>) -> u32 {
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
+    fn blink_set(
+        &self,
+        _dev: &Self::Bus,
+        _classdev: &Device<Self>,
+        _delay_on: &mut usize,
+        _delay_off: &mut usize,
+    ) -> Result<()> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+}
+
+/// Led colors.
+#[derive(Copy, Clone, Debug, Default)]
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
+
+impl TryFrom<u32> for Color {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        const _: () = {
+            assert!(bindings::LED_COLOR_ID_MAX == 15);
+        };
+        if value < bindings::LED_COLOR_ID_MAX {
+            // SAFETY:
+            // - `Color` is represented as `u32`
+            // - the const block above guarantees that no additional color has been added
+            // - `value` is guaranteed to be in the color id range
+            Ok(unsafe { transmute::<u32, Color>(value) })
+        } else {
+            Err(EINVAL)
+        }
+    }
+}
+
+// SAFETY: A `led::Device` can be unregistered from any thread.
+unsafe impl<T: LedOps + Send> Send for Device<T> {}
+
+// SAFETY: `led::Device` can be shared among threads because all methods of `led::Device`
+// are thread safe.
+unsafe impl<T: LedOps + Sync> Sync for Device<T> {}
+
+impl<T: LedOps> Device<T> {
+    /// Registers a new led classdev.
+    ///
+    /// The [`Device`] will be unregistered on drop.
+    pub fn new<'a>(
+        parent: &'a T::Bus,
+        init_data: InitData<'a>,
+        ops: impl PinInit<T, Error> + 'a,
+    ) -> impl PinInit<Devres<Self>, Error> + 'a {
+        Devres::new(
+            parent.as_ref(),
+            try_pin_init!(Self {
+                ops <- ops,
+                classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_classdev| {
+                    // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
+                    // `led_classdev` gets fully initialized in-place by
+                    // `led_classdev_register_ext` including `mutex` and `list_head`.
+                    unsafe {
+                        ptr.write(bindings::led_classdev {
+                            brightness_set: (!T::BLOCKING)
+                                .then_some(Adapter::<T>::brightness_set_callback),
+                            brightness_set_blocking: T::BLOCKING
+                                .then_some(Adapter::<T>::brightness_set_blocking_callback),
+                            brightness_get: T::HAS_BRIGHTNESS_GET
+                                .then_some(Adapter::<T>::brightness_get_callback),
+                            blink_set: T::HAS_BLINK_SET.then_some(Adapter::<T>::blink_set_callback),
+                            max_brightness: T::MAX_BRIGHTNESS,
+                            brightness: init_data.initial_brightness,
+                            default_trigger: init_data
+                                .default_trigger
+                                .map_or(core::ptr::null(), CStrExt::as_char_ptr),
+                            color: init_data.color as u32,
+                            ..bindings::led_classdev::default()
+                        })
+                    };
+
+                    let mut init_data_raw = bindings::led_init_data {
+                        fwnode: init_data
+                            .fwnode
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
+                    // - `parent.as_raw()` is guaranteed to be a pointer to a valid `device`
+                    //    or a null pointer.
+                    // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev`.
+                    to_result(unsafe {
+                        bindings::led_classdev_register_ext(
+                            parent.as_ref().as_raw(),
+                            ptr,
+                            &raw mut init_data_raw,
+                        )
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
+    /// `led::Device`.
+    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &'a Self {
+        // SAFETY: The function's contract guarantees that `led_cdev` points to a `led_classdev`
+        // field embedded within a valid `led::Device`. `container_of!` can therefore
+        // safely calculate the address of the containing struct.
+        unsafe { &*container_of!(Opaque::cast_from(led_cdev), Self, classdev) }
+    }
+
+    fn parent(&self) -> &device::Device<Bound> {
+        // SAFETY:
+        // - `self.classdev.get()` is guaranteed to be a valid pointer to `led_classdev`.
+        unsafe { device::Device::from_raw((*(*self.classdev.get()).dev).parent) }
+    }
+}
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
+        classdev.ops.brightness_get(parent, classdev)
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
+impl<T: LedOps> PinnedDrop for Device<T> {
+    fn drop(self: Pin<&mut Self>) {
+        let raw = self.classdev.get();
+        // SAFETY: The existence of `self` guarantees that `self.classdev.get()` is a pointer to a
+        // valid `struct led_classdev`.
+        let dev: &device::Device = unsafe { device::Device::from_raw((*raw).dev) };
+
+        let _fwnode = dev
+            .fwnode()
+            // SAFETY: the reference count of `fwnode` has previously been
+            // incremented in `led::Device::new`.
+            .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode)) });
+
+        // SAFETY: The existence of `self` guarantees that `self.classdev` has previously been
+        // successfully registered with `led_classdev_register_ext`.
+        unsafe { bindings::led_classdev_unregister(self.classdev.get()) };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf120042..231818e0614b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -108,6 +108,7 @@
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
+pub mod led;
 pub mod list;
 pub mod maple_tree;
 pub mod miscdevice;

-- 
2.52.0


