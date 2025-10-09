Return-Path: <linux-leds+bounces-5717-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C91BCA8B9
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 20:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 843E64FBB52
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 18:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8311B253944;
	Thu,  9 Oct 2025 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="WZwXHv0+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B8246762
	for <linux-leds@vger.kernel.org>; Thu,  9 Oct 2025 18:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033569; cv=none; b=dyFcyGqxa3K/ElC/wG/0MRrirxr6Hh8AuUGcCO52xoJNlkc1l1bHHHFjbKTVWz/0olaUK799SWBz6wwEz5QlwJgA8icujgKcLwuZ9IxBhiWWsSZIkcaSZSHu7eZBuoQOw0V+KzKcyhPQ2W8sy/4IpzB4GwsEl81StZjJs0xYC54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033569; c=relaxed/simple;
	bh=PAecgnfdNq1Hqxfp0EFOmz2gTKEcvYOmX5moVh3sdP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blFkhkM4/6cEqFTlBA2CH8ejP5gSI8NERIOD81AQwH0/mHi7pUHNrIpxHUegxwJ7jnReZEr5P4++GM5aTlKbFt15plmzrvAq8924HNR8QT1SJ51I52OwJKQwG8euahtmNbu8hRgoU6nFogcWrI60Mebn+ci3TNfl09GKIxXTBXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=WZwXHv0+; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 14690240028
	for <linux-leds@vger.kernel.org>; Thu,  9 Oct 2025 20:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760033559; bh=ncVlEKivhRYPCuOIP80w7mJvf+o2lut254H9afBGamw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Autocrypt:OpenPGP:From;
	b=WZwXHv0+M00VJFUCtCSCNRkNeLq498va0dUsU2QkZq215LnOLyWgBMhBPsi+S5uil
	 mr2EsEcUlceDYcR8+yQvLC2/rSConnajsUvoxSz/PSFVE9lQYNMuQ++akj5SLUdwHF
	 l7CJQ+dCyBxuVql3vgeA8FgNsGw6o8p8UbqApQnkhrQQsWenMaRLxWx/m2y9k3bSoZ
	 w5sGRPQUViPs9GZPwToszQpOv7Zny3r2kHD7Z+JEdaNu2kb+q4hugTThmnaFwADQXS
	 dG1Pq9z5gHt3D/DJP/t45hOaglEyHuWnyHIqzx9ZvB9/KzU6qzFLb6KBdkvo4J1Q2P
	 oqtwYJw8KcRQA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cjHz52kCZz9rxL;
	Thu,  9 Oct 2025 20:12:33 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Markus Probst <markus.probst@posteo.de>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 2/2] rust: leds: add basic led classdev abstractions
Date: Thu, 09 Oct 2025 18:12:34 +0000
Message-ID: <20251009181203.248471-3-markus.probst@posteo.de>
In-Reply-To: <20251009181203.248471-1-markus.probst@posteo.de>
References: <20251009181203.248471-1-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

Implement the core abstractions needed for led class devices, including:

* `led::Handler` - the trait for handling leds, including
  `brightness_set`

* `led::InitData` - data set for the led class device

* `led::Device` - a safe wrapper around `led_classdev`

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/led.rs | 296 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   1 +
 2 files changed, 297 insertions(+)
 create mode 100644 rust/kernel/led.rs

diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
new file mode 100644
index 000000000000..2ceafedaae5a
--- /dev/null
+++ b/rust/kernel/led.rs
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for the leds driver model.
+//!
+//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
+
+use core::pin::Pin;
+
+use pin_init::{pin_data, pinned_drop, PinInit};
+
+use crate::{
+    alloc::KBox,
+    container_of,
+    device::{self, property::FwNode},
+    error::{code::EINVAL, from_result, to_result, Error, Result},
+    prelude::GFP_KERNEL,
+    str::CStr,
+    try_pin_init,
+    types::Opaque,
+};
+
+/// The led class device representation.
+///
+/// This structure represents the Rust abstraction for a C `struct led_classdev`.
+#[pin_data(PinnedDrop)]
+pub struct Device {
+    handler: KBox<dyn HandlerImpl>,
+    #[pin]
+    classdev: Opaque<bindings::led_classdev>,
+}
+
+/// The led init data representation.
+///
+/// This structure represents the Rust abstraction for a C `struct led_init_data`.
+#[derive(Default)]
+pub struct InitData<'a> {
+    fwnode: Option<&'a FwNode>,
+    default_label: Option<&'a CStr>,
+    devicename: Option<&'a CStr>,
+    devname_mandatory: bool,
+}
+
+impl InitData<'static> {
+    /// Creates a new [`InitData`]
+    pub fn new() -> Self {
+        Self::default()
+    }
+}
+
+impl<'a> InitData<'a> {
+    /// Sets the firmware node
+    pub fn fwnode<'b, 'c>(self, fwnode: &'b FwNode) -> InitData<'c>
+    where
+        'a: 'c,
+        'b: 'c,
+    {
+        InitData {
+            fwnode: Some(fwnode),
+            ..self
+        }
+    }
+
+    /// Sets a default label
+    pub fn default_label<'b, 'c>(self, label: &'b CStr) -> InitData<'c>
+    where
+        'a: 'c,
+        'b: 'c,
+    {
+        InitData {
+            default_label: Some(label),
+            ..self
+        }
+    }
+
+    /// Sets the device name
+    pub fn devicename<'b, 'c>(self, devicename: &'b CStr) -> InitData<'c>
+    where
+        'a: 'c,
+        'b: 'c,
+    {
+        InitData {
+            devicename: Some(devicename),
+            ..self
+        }
+    }
+
+    /// Sets if a device name is mandatory
+    pub fn devicename_mandatory(self, mandatory: bool) -> Self {
+        Self {
+            devname_mandatory: mandatory,
+
+            ..self
+        }
+    }
+}
+
+/// The led handler trait.
+///
+/// # Examples
+///
+///```
+/// # use kernel::{c_str, led, alloc::KBox, error::{Result, code::ENOSYS}};
+/// # use core::pin::Pin;
+///
+/// struct MyHandler;
+///
+///
+/// impl led::Handler for MyHandler {
+///     const BLOCKING = false;
+///     const MAX_BRIGHTNESS = 255;
+///
+///     fn brightness_set(&self, _brightness: u32) -> Result<()> {
+///         // Set the brightness for the led here
+///         Ok(())
+///     }
+/// }
+///
+/// fn register_my_led() -> Result<Pin<KBox<led::Device>>> {
+///     let handler = MyHandler;
+///     KBox::pin_init(led::Device::new(
+///         None,
+///         None,
+///         led::InitData::new()
+///             .default_label(c_str!("my_led")),
+///         handler,
+///     ))
+/// }
+///```
+/// Led drivers must implement this trait in order to register and handle a [`Device`].
+pub trait Handler {
+    /// If set true, [`Handler::brightness_set`] and [`Handler::blink_set`] must not sleep
+    /// and perform the operation immediately.
+    const BLOCKING: bool;
+    /// Set this to true, if [`Handler::blink_set`] is implemented.
+    const BLINK: bool = false;
+    /// The max brightness level
+    const MAX_BRIGHTNESS: u32;
+
+    /// Sets the brightness level
+    ///
+    /// See also [`Handler::BLOCKING`]
+    fn brightness_set(&self, brightness: u32) -> Result<()>;
+
+    /// Activates hardware accelerated blinking.
+    ///
+    /// delays are in milliseconds. If both are zero, a sensible default should be chosen.
+    /// The caller should adjust the timings in that case and if it can't match the values
+    /// specified exactly. Setting the brightness to 0 will disable the hardware accelerated
+    /// blinking.
+    ///
+    /// See also [`Handler::BLOCKING`]
+    fn blink_set(&self, _delay_on: &mut usize, _delay_off: &mut usize) -> Result<()> {
+        Err(EINVAL)
+    }
+}
+
+trait HandlerImpl {
+    fn brightness_set(&self, brightness: u32) -> Result<()>;
+    fn blink_set(&self, delay_on: &mut usize, delay_off: &mut usize) -> Result<()>;
+}
+
+impl<T: Handler> HandlerImpl for T {
+    fn brightness_set(&self, brightness: u32) -> Result<()> {
+        T::brightness_set(self, brightness)
+    }
+
+    fn blink_set(&self, delay_on: &mut usize, delay_off: &mut usize) -> Result<()> {
+        T::blink_set(self, delay_on, delay_off)
+    }
+}
+
+// SAFETY: A `led::Device` can be unregistered from any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: `led::Device` can be shared among threads because all methods of `led::Device`
+// are thread safe.
+unsafe impl Sync for Device {}
+
+impl Device {
+    /// Registers a new led classdev.
+    ///
+    /// The [`Device`] will be unregistered and drop.
+    pub fn new<'a, T: Handler + 'static>(
+        parent: Option<&'a device::Device>,
+        init_data: InitData<'a>,
+        handler: T,
+    ) -> impl PinInit<Self, Error> + use<'a, T> {
+        try_pin_init!(Self {
+            handler <- {
+                let handler: KBox<dyn HandlerImpl> = KBox::<T>::new(handler, GFP_KERNEL)?;
+                Ok::<_, Error>(handler)
+            },
+            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_classdev| {
+                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
+                unsafe { ptr.write(bindings::led_classdev {
+                    max_brightness: T::MAX_BRIGHTNESS,
+                    brightness_set: T::BLOCKING.then_some(
+                        brightness_set as unsafe extern "C" fn(*mut bindings::led_classdev, u32)
+                    ),
+                    brightness_set_blocking: (!T::BLOCKING).then_some(
+                        brightness_set_blocking
+                            as unsafe extern "C" fn(*mut bindings::led_classdev,u32) -> i32
+                    ),
+                    blink_set: T::BLINK.then_some(
+                        blink_set
+                            as unsafe extern "C" fn(*mut bindings::led_classdev, *mut usize,
+                                                    *mut usize) -> i32
+                    ),
+                    .. bindings::led_classdev::default()
+                }) };
+
+                let mut init_data = bindings::led_init_data {
+                    fwnode: init_data.fwnode.map_or(core::ptr::null_mut(), FwNode::as_raw),
+                    default_label: init_data.default_label
+                                            .map_or(core::ptr::null(), CStr::as_char_ptr),
+                    devicename: init_data.devicename.map_or(core::ptr::null(), CStr::as_char_ptr),
+                    devname_mandatory: init_data.devname_mandatory,
+                };
+
+                let parent = parent
+                    .map_or(core::ptr::null_mut(), device::Device::as_raw);
+
+                // SAFETY:
+                // - `parent` is guaranteed to be a pointer to a valid `device`
+                //    or a null pointer.
+                // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev`.
+                to_result(unsafe {
+                    bindings::led_classdev_register_ext(parent, ptr, &mut init_data)
+                })
+            }),
+        })
+    }
+}
+
+extern "C" fn brightness_set(led_cdev: *mut bindings::led_classdev, brightness: u32) {
+    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `Device`.
+    let classdev = unsafe {
+        &*container_of!(
+            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
+            Device,
+            classdev
+        )
+    };
+    let _ = classdev.handler.brightness_set(brightness);
+}
+
+extern "C" fn brightness_set_blocking(
+    led_cdev: *mut bindings::led_classdev,
+    brightness: u32,
+) -> i32 {
+    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `Device`.
+    let classdev = unsafe {
+        &*container_of!(
+            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
+            Device,
+            classdev
+        )
+    };
+    from_result(|| {
+        classdev.handler.brightness_set(brightness)?;
+        Ok(0)
+    })
+}
+
+extern "C" fn blink_set(
+    led_cdev: *mut bindings::led_classdev,
+    delay_on: *mut usize,
+    delay_off: *mut usize,
+) -> i32 {
+    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `Device`.
+    let classdev = unsafe {
+        &*container_of!(
+            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
+            Device,
+            classdev
+        )
+    };
+    from_result(|| {
+        classdev.handler.blink_set(
+            // SAFETY: `delay_on` is guaranteed to be a valid pointer to usize
+            unsafe { &mut *delay_on },
+            // SAFETY: `delay_on` is guaranteed to be a valid pointer to usize
+            unsafe { &mut *delay_off },
+        )?;
+        Ok(0)
+    })
+}
+
+#[pinned_drop]
+impl PinnedDrop for Device {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: The existence of `self` guarantees that `self.classdev` has previously been
+        // successfully registered with `led_classdev_register_ext`
+        unsafe { bindings::led_classdev_unregister(self.classdev.get()) };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e5247f584ad2..f42c60da21ae 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -97,6 +97,7 @@
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
+pub mod led;
 pub mod list;
 pub mod miscdevice;
 pub mod mm;
-- 
2.49.1


