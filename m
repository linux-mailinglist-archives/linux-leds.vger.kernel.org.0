Return-Path: <linux-leds+bounces-5674-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CC0BC63FB
	for <lists+linux-leds@lfdr.de>; Wed, 08 Oct 2025 20:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CA964E1825
	for <lists+linux-leds@lfdr.de>; Wed,  8 Oct 2025 18:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6892C11E6;
	Wed,  8 Oct 2025 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Ld0DaSOq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671AF2C08B6
	for <linux-leds@vger.kernel.org>; Wed,  8 Oct 2025 18:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947056; cv=none; b=F/NoWR236/+dzMo15cbRcH+rBNLSWEnFpd3mW2KXM1lbkkgjz9NfEtnKKl2FbS6Xkj0QYTDvJkAVeT7f3tpGpAyHZpA7S1Gggv80cKE6+/4DiGQs4WUkKJKyd6vj4+uO+FtAzawC81/I0nLiHl2fYs0zVpdJ4u0xXbHkjl0he8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947056; c=relaxed/simple;
	bh=TensFLUA81g/x9L5G6Z4Yuw/GBe3HW5Htj5vNxykNyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHigG6d0nQ9wciCqad8NrAgmGDBfhwjeLSGE8GR7tHDpVAZRklUGLnFNhIOTx1ems9dSJZ6P/ZdwW7u9Oqqm4EHSoYGNGtPp2PHcc1WXH5swI2OlwogQaLocn1LTce9yDtPT+Jm8pMKlBz+hPYvyyNUwFrZ5ReA+TGaWHlG3KMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Ld0DaSOq; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3769724002F
	for <linux-leds@vger.kernel.org>; Wed,  8 Oct 2025 20:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1759947049; bh=6o5KG45PmF3kRE1S0MtEmvCsqg21dTOW7EJNjlfw1yY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Autocrypt:OpenPGP:From;
	b=Ld0DaSOqpJtr+0h9qcB2L/VXhbl+reTlMopC2ij3Jr8Mc0NuQkiIbiFIS1lVdpaVW
	 yFfCCbNdnf792JlHSx2k5hsaaTQN3gGsSKLjrgew+HJOayFp3MpmUJ7Ik+RqHnJaV7
	 eanB3nsKTDR4ACfZN5XBI/syqtZLqZbwO64F3erXOTrDwCFQrKMwnQXbglapqQwXH9
	 NO0sBinsWqyeXd7yaIHNIGDzT0DkQ7qD2pgrjiDNb0Lwat9hGYL87YCY9GJl0mHtej
	 ipuzAaR8F/5mtiVzIpd7zGVQhZqnS5dqthKxdzCaN9fc2by5fxR4jfPVT7Hv2acKAt
	 2mS73TLVgbPdQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4chgzT6Jcvz9rxX;
	Wed,  8 Oct 2025 20:10:45 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Markus Probst <markus.probst@posteo.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-leds@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] rust: leds: add basic led classdev abstractions
Date: Wed, 08 Oct 2025 18:10:47 +0000
Message-ID: <20251008181027.662616-4-markus.probst@posteo.de>
In-Reply-To: <20251008181027.662616-3-markus.probst@posteo.de>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
 <20251008181027.662616-3-markus.probst@posteo.de>
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

* `led::LedHandler` - the trait for handling leds, including
  `brightness_set`

* `led::LedInitData` - data set for the led class device

* `led::LedClassDev` - a safe wrapper arround `led_classdev`

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/led.rs | 299 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   1 +
 2 files changed, 300 insertions(+)
 create mode 100644 rust/kernel/led.rs

diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
new file mode 100644
index 000000000000..14f09a2c8c3b
--- /dev/null
+++ b/rust/kernel/led.rs
@@ -0,0 +1,299 @@
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
+    device::{property::FwNode, Device},
+    error::{code::EINVAL, from_result, to_result, Error, Result},
+    prelude::GFP_KERNEL,
+    str::{CStr, CString},
+    try_pin_init,
+    types::{ARef, Opaque},
+};
+
+/// The led class device representation.
+///
+/// This structure represents the Rust abstraction for a C `struct led_classdev`.
+#[pin_data(PinnedDrop)]
+pub struct LedClassDev {
+    default_trigger: Option<CString>,
+    parent: Option<ARef<Device>>,
+    handler: KBox<dyn LedHandlerImpl>,
+    #[pin]
+    classdev: Opaque<bindings::led_classdev>,
+}
+
+/// The led init data representation.
+///
+/// This structure represents the Rust abstraction for a C `struct led_init_data`.
+#[derive(Default)]
+pub struct LedInitData<'a> {
+    fwnode: Option<&'a FwNode>,
+    default_label: Option<&'a CStr>,
+    devicename: Option<&'a CStr>,
+    devname_mandatory: bool,
+}
+
+impl LedInitData<'static> {
+    /// Creates a new [`LedInitData`]
+    pub fn new() -> Self {
+        Self::default()
+    }
+}
+
+impl<'a> LedInitData<'a> {
+    /// Sets the firmware node
+    pub fn fwnode<'b, 'c>(self, fwnode: &'b FwNode) -> LedInitData<'c>
+    where
+        'a: 'c,
+        'b: 'c,
+    {
+        LedInitData {
+            fwnode: Some(fwnode),
+            ..self
+        }
+    }
+
+    /// Sets a default label
+    pub fn default_label<'b, 'c>(self, label: &'b CStr) -> LedInitData<'c>
+    where
+        'a: 'c,
+        'b: 'c,
+    {
+        LedInitData {
+            default_label: Some(label),
+            ..self
+        }
+    }
+
+    /// Sets the device name
+    pub fn devicename<'b, 'c>(self, devicename: &'b CStr) -> LedInitData<'c>
+    where
+        'a: 'c,
+        'b: 'c,
+    {
+        LedInitData {
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
+/// impl led::LedHandler for MyHandler {
+///     const BLOCKING = false;
+///     const MAX_BRIGHTNESS = 255;
+///
+///     fn brightness_set(&self, _brightness: u32) -> Result<()> {
+///         // Set the brightness for the led here
+///         Ok(())
+///     }
+/// }
+///
+/// fn register_my_led() -> Result<Pin<KBox<led::LedClassDev>>> {
+///     let handler = MyHandler;
+///     KBox::pin_init(led::LedClassDev::new(
+///         None,
+///         None,
+///         led::LedInitData::new()
+///             .default_label(c_str!("my_led")),
+///         handler,
+///     ))
+/// }
+///```
+/// Led drivers must implement this trait in order to register and handle a [`LedClassDev`].
+pub trait LedHandler {
+    /// If set true, [`LedHandler::brightness_set`] and [`LedHandler::blink_set`] must not sleep
+    /// and perform the operation immediately.
+    const BLOCKING: bool;
+    /// Set this to true, if [`LedHandler::blink_set`] is implemented.
+    const BLINK: bool = false;
+    /// The max brightness level
+    const MAX_BRIGHTNESS: u32;
+
+    /// Sets the brightness level
+    ///
+    /// See also [`LedHandler::BLOCKING`]
+    fn brightness_set(&self, brightness: u32) -> Result<()>;
+
+    /// Activates hardware accelerated blinking.
+    ///
+    /// delays are in milliseconds. If both are zero, a sensible default should be chosen.
+    /// The caller should adjust the timings in that case and if it can't match the values
+    /// specified exactly. Setting the brightness to 0 will disable the hardware accelerated
+    /// blinking.
+    ///
+    /// See also [`LedHandler::BLOCKING`]
+    fn blink_set(&self, _delay_on: &mut usize, _delay_off: &mut usize) -> Result<()> {
+        Err(EINVAL)
+    }
+}
+
+trait LedHandlerImpl {
+    fn brightness_set(&self, brightness: u32) -> Result<()>;
+    fn blink_set(&self, delay_on: &mut usize, delay_off: &mut usize) -> Result<()>;
+}
+
+impl<T: LedHandler> LedHandlerImpl for T {
+    fn brightness_set(&self, brightness: u32) -> Result<()> {
+        T::brightness_set(self, brightness)
+    }
+
+    fn blink_set(&self, delay_on: &mut usize, delay_off: &mut usize) -> Result<()> {
+        T::blink_set(self, delay_on, delay_off)
+    }
+}
+
+// SAFETY: A `LedClassDev` can be unregistered from any thread.
+unsafe impl Send for LedClassDev {}
+
+// SAFETY: `LedClassDev` can be shared among threads because all methods of `LedClassDev`
+// are thread safe.
+unsafe impl Sync for LedClassDev {}
+
+impl LedClassDev {
+    /// Registers a new led classdev.
+    ///
+    /// The [`LedClassDev`] will be unregistered and drop.
+    pub fn new<'a, T: LedHandler + 'static>(
+        parent: Option<&Device>,
+        default_trigger: Option<CString>,
+        init_data: LedInitData<'a>,
+        handler: T,
+    ) -> impl PinInit<Self, Error> + use<'a, T> {
+        let parent_ptr = parent.map_or(core::ptr::null_mut(), Device::as_raw);
+        let parent = parent.map(ARef::from);
+        try_pin_init!(Self {
+            default_trigger,
+            parent,
+            handler <- {
+                let handler: KBox<dyn LedHandlerImpl> = KBox::<T>::new(handler, GFP_KERNEL)?;
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
+                // SAFETY:
+                // - `parent_ptr` is guaranteed to be a pointer to a valid `device`
+                //    or a null pointer.
+                // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev`.
+                to_result(unsafe {
+                    bindings::led_classdev_register_ext(parent_ptr, ptr, &mut init_data)
+                })
+            }),
+        })
+    }
+}
+
+extern "C" fn brightness_set(led_cdev: *mut bindings::led_classdev, brightness: u32) {
+    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `LedClassDev`.
+    let classdev = unsafe {
+        &*container_of!(
+            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
+            LedClassDev,
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
+    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `LedClassDev`.
+    let classdev = unsafe {
+        &*container_of!(
+            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
+            LedClassDev,
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
+    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `LedClassDev`.
+    let classdev = unsafe {
+        &*container_of!(
+            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
+            LedClassDev,
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
+impl PinnedDrop for LedClassDev {
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


