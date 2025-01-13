Return-Path: <linux-leds+bounces-3758-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A4A0B6C4
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBFC3164F2B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 12:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0BB22A4DC;
	Mon, 13 Jan 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="gr/FaBBZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E22045B6;
	Mon, 13 Jan 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771051; cv=none; b=ChWuWIdfo6YwNJaEOlrYRPsLmfBFboifpKgqWUDAT49E2M0US5Z4TDuHH7D7Jlcm7cKfVwk1Qk8bMN4k16O7JigXKOiiDOWCPjV9hKhKALgP+YrI19nHvbbl3tJ9Wcm1bgmkLH/PI/ToVvJxStsxVQORCbdGBfXPVIsInNtjrX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771051; c=relaxed/simple;
	bh=+PyEeSLPl5fE9v99iZI8bcIBW0o1ZJP1R07PF4JjW4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1sGx+VNLaZS1LiiRGAW+jpGNs7gf3se8spC8lHevkIdx0OeAgdJkIrcebTVn1x6BE9K6SXtmHA+CZyh8F6i1depojYYpXT7Tn+Nvk5X8tJTRMFNAAPF+EYd7hn0JNscr9SrV7Nn7sIL+S/JQ9n9s2vUCaJ9zc+w9wMCYdJuHfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=gr/FaBBZ; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1736770603; bh=x0QnlD4Vmg0Kp9RPBCFlDIqtOrxbMyJ6d+E77AZiYnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gr/FaBBZ/rq7Tayhhek7CHotdp9asjD45HwjqHXnvbczirWaRJ2i253tt1uJk8hfw
	 2CG5oMjWMIZ5/WtU8AHSdogPFTBJhg1Os1Ax3CukaOwZ7/7TpD1pbsFdVCKAutVXxM
	 cRNoVmfbWXF7VeaRDKoTIH1UA/Mx1N0sb3QWGD2E=
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
Subject: [PATCH v2 3/5] rust: leds: Add hardware trigger support for hardware-controlled LEDs
Date: Mon, 13 Jan 2025 13:16:18 +0100
Message-ID: <20250113121620.21598-4-me@kloenk.dev>
In-Reply-To: <20250113121620.21598-1-me@kloenk.dev>
References: <20250113121620.21598-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds abstraction for hardware trigger support in LEDs, enabling LEDs to
be controlled by external hardware events.

An `Arc` is embedded within the `led_classdev` to manage the lifecycle
of the hardware trigger, ensuring proper reference counting and cleanup
when the LED is dropped.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
 MAINTAINERS                  |   1 +
 rust/kernel/leds.rs          |  95 +++++++++++++++++++++++---
 rust/kernel/leds/triggers.rs | 128 +++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+), 10 deletions(-)
 create mode 100644 rust/kernel/leds/triggers.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index cef929b57159..954dbd311a55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13020,6 +13020,7 @@ F:	drivers/leds/
 F:	include/dt-bindings/leds/
 F:	include/linux/leds.h
 F:	rust/kernel/leds.rs
+F:	rust/kernel/leds/
 
 LEGO MINDSTORMS EV3
 R:	David Lechner <david@lechnology.com>
diff --git a/rust/kernel/leds.rs b/rust/kernel/leds.rs
index 980af7c405d4..f10a10b56e23 100644
--- a/rust/kernel/leds.rs
+++ b/rust/kernel/leds.rs
@@ -10,9 +10,14 @@
 use crate::error::from_result;
 use crate::ffi::c_ulong;
 use crate::prelude::*;
+#[cfg(CONFIG_LEDS_TRIGGERS)]
+use crate::sync::Arc;
 use crate::time::Delta;
 use crate::types::Opaque;
 
+#[cfg(CONFIG_LEDS_TRIGGERS)]
+pub mod triggers;
+
 /// Color of an LED.
 #[allow(missing_docs)]
 #[derive(Copy, Clone)]
@@ -110,12 +115,34 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 }
 
 /// Data used for led registration.
-#[derive(Clone)]
-pub struct LedConfig<'name> {
+pub struct LedConfig<'name, T> {
     /// Name to give the led.
     pub name: Option<&'name CStr>,
     /// Color of the LED.
     pub color: Color,
+    /// Private data of the LED.
+    pub data: T,
+
+    /// Default trigger name.
+    pub default_trigger: Option<&'static CStr>,
+    /// Hardware trigger.
+    ///
+    /// Setting this to some also defaults the default trigger to this hardware trigger.
+    /// Use `default_trigger: Some("none")` to overwrite this.
+    #[cfg(CONFIG_LEDS_TRIGGERS)]
+    pub hardware_trigger: Option<Arc<triggers::Hardware<T>>>,
+}
+
+impl<'name, T> LedConfig<'name, T> {
+    /// Create a new LedConfig
+    pub fn new(color: Color, data: T) -> Self {
+        Self {
+            color,
+            data,
+            // SAFETY: all other fields are valid with zeroes.
+            ..unsafe { core::mem::zeroed() }
+        }
+    }
 }
 
 /// A Led backed by a C `struct led_classdev`, additionally offering
@@ -141,8 +168,7 @@ impl<T> Led<T>
     #[cfg(CONFIG_LEDS_CLASS)]
     pub fn register<'a>(
         device: Option<&'a Device>,
-        config: &'a LedConfig<'a>,
-        data: T,
+        config: LedConfig<'a, T>,
     ) -> impl PinInit<Self, Error> + 'a
     where
         T: 'a,
@@ -188,14 +214,46 @@ pub fn register<'a>(
                 unsafe { ptr::write(set_fn_ptr, Some(blink_set::<T>)) };
             }
 
+        #[cfg(CONFIG_LEDS_TRIGGERS)]
+        if let Some(trigger) = config.hardware_trigger {
+            let trigger = trigger.into_raw();
+            // SAFETY: `place` is pointing to a live allocation.
+            let trigger_type_ptr = unsafe { ptr::addr_of_mut!((*place).trigger_type) };
+            // SAFETY: `trigger` is a valid pointer
+            let hw_trigger = unsafe { ptr::addr_of!((*trigger).hw_type) };
+            // SAFETY: `trigger_type_ptr` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(trigger_type_ptr, hw_trigger.cast_mut().cast()) };
+
+            // SAFETY: trigger points to a valid hardware trigger struct.
+            let trigger_name_ptr = unsafe { Opaque::raw_get(ptr::addr_of!( (*trigger).trigger)) };
+            // SAFETY: trigger points to a valid hardware trigger struct.
+            let trigger_name_ptr = unsafe { (*trigger_name_ptr).name };
+            // SAFETY: `place` is pointing to a live allocation.
+            let default_trigger_ptr = unsafe { ptr::addr_of_mut!((*place).default_trigger) };
+            // SAFETY: `default_trigger_ptr` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(default_trigger_ptr, trigger_name_ptr) };
+
+            // SAFETY: `place` is pointing to a live allocation.
+            let hw_ctrl_trigger_ptr = unsafe { ptr::addr_of_mut!((*place).hw_control_trigger) };
+            // SAFETY: `hw_ctrl_trigger_ptr` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(hw_ctrl_trigger_ptr, trigger_name_ptr) };
+        }
+
+        // After hw trigger impl, to overwrite default trigger
+        if let Some(default_trigger) = config.default_trigger {
+            // SAFETY: `place` is pointing to a live allocation.
+            let default_trigger_ptr = unsafe { ptr::addr_of_mut!((*place).default_trigger) };
+            // SAFETY: `default_trigger_ptr` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(default_trigger_ptr, default_trigger.as_char_ptr()) };
+        }
 
-            let dev = device.map(|dev| dev.as_raw()).unwrap_or(ptr::null_mut());
-            // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
-            crate::error::to_result(unsafe {
-                bindings::led_classdev_register_ext(dev, place, ptr::null_mut())
-            })
+        let dev = device.map(|dev| dev.as_raw()).unwrap_or(ptr::null_mut());
+        // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
+        crate::error::to_result(unsafe {
+                    bindings::led_classdev_register_ext(dev, place, ptr::null_mut())
+        })
             }),
-            data: data,
+            data: config.data,
         })
     }
 }
@@ -220,6 +278,23 @@ fn drop(self: Pin<&mut Self>) {
         unsafe {
             bindings::led_classdev_unregister(self.led.get())
         }
+
+        // drop trigger if there is a hw trigger defined.
+        #[cfg(CONFIG_LEDS_TRIGGERS)]
+        {
+            // SAFETY: `self.led` is a valid led.
+            let hw_trigger_type =
+                unsafe { ptr::read(ptr::addr_of!((*self.led.get()).trigger_type)) };
+            if !hw_trigger_type.is_null() {
+                // SAFETY: hw_trigger_type is a valid and non null pointer into a Hardware trigger.
+                let hw_trigger_type = unsafe {
+                    crate::container_of!(hw_trigger_type, triggers::Hardware<T>, hw_type)
+                };
+                // SAFETY: `hw_trigger_type` is a valid pointer that came from an arc.
+                let hw_trigger_type = unsafe { Arc::from_raw(hw_trigger_type) };
+                drop(hw_trigger_type);
+            }
+        }
     }
 }
 
diff --git a/rust/kernel/leds/triggers.rs b/rust/kernel/leds/triggers.rs
new file mode 100644
index 000000000000..d5f2b8252645
--- /dev/null
+++ b/rust/kernel/leds/triggers.rs
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! LED trigger abstractions.
+
+use core::marker::PhantomData;
+use core::ptr;
+
+use crate::error::{from_result, to_result};
+use crate::prelude::*;
+use crate::types::Opaque;
+
+use super::FromLedClassdev;
+
+/// LED Hardware trigger.
+///
+/// Used to impement a hardware operation mode for an LED.
+#[pin_data(PinnedDrop)]
+pub struct Hardware<T> {
+    #[pin]
+    pub(crate) hw_type: Opaque<bindings::led_hw_trigger_type>,
+    #[pin]
+    pub(crate) trigger: Opaque<bindings::led_trigger>,
+    _t: PhantomData<T>,
+}
+
+impl<T> Hardware<T>
+where
+    T: HardwareOperations,
+{
+    /// Register a new hardware Trigger with a given name.
+    pub fn register(name: &'static CStr) -> impl PinInit<Self, Error> {
+        try_pin_init!( Self {
+            // SAFETY: `led_hw_trigger_type` is valid with all zeroes.
+            hw_type: Opaque::new(unsafe { core::mem::zeroed() }),
+            trigger <- Opaque::try_ffi_init(move |place: *mut bindings::led_trigger| {
+            // SAFETY: `place` is a pointer to a live allocation, so erasing is valid.
+            unsafe { place.write_bytes(0, 1) };
+
+            // Add name
+            // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
+            let name_ptr = unsafe { ptr::addr_of_mut!((*place).name) };
+            // SAFETY: `name_ptr` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(name_ptr, name.as_char_ptr()) };
+
+            // Add fn pointers
+            // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
+            let activate_fn_ptr: *mut Option<_> = unsafe { ptr::addr_of_mut!((*place).activate) };
+            // SAFETY: `activate_fn_ptr` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(activate_fn_ptr, Some(trigger_activate::<T>)) };
+
+            if T::HAS_DEACTIVATE {
+                // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
+                let deactivate_fn_ptr: *mut Option<_> = unsafe { ptr::addr_of_mut!((*place).deactivate) };
+                // SAFETY: `deactivate_fn_ptr` points to a valid allocation and we have exclusive access.
+                unsafe { ptr::write(deactivate_fn_ptr, Some(trigger_deactivate::<T>)) };
+            }
+
+            // Add hardware trigger
+            // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
+            let trigger_type_ptr = unsafe { ptr::addr_of_mut!((*place).trigger_type) };
+            // SAFETY: `place` is pointing to a live allocation, so the deref is safe.
+            let trigger_type = unsafe { crate::container_of!(place, Self, trigger).cast_mut() };
+            // SAFETY: `trigger_type` is pointing to a live allocation of Self.
+            let trigger_type = unsafe { ptr::addr_of!((*trigger_type).hw_type) };
+            // SAFETY: `trigger_type_ptr` points to a valid allocation and we have exclusive access.
+            unsafe{ ptr::write(trigger_type_ptr, Opaque::raw_get(trigger_type)) };
+
+        // SAFETY: ffi call, `place` is sufficently filled with data at this point
+            to_result(unsafe {
+                bindings::led_trigger_register(place)
+            })
+            }),
+            _t: PhantomData,
+        })
+    }
+}
+
+#[pinned_drop]
+impl<T> PinnedDrop for Hardware<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: trigger is pointing to a live and registered allocation
+        unsafe {
+            bindings::led_trigger_unregister(self.trigger.get());
+        }
+    }
+}
+
+/// Operations for the Hardware trigger
+#[macros::vtable]
+pub trait HardwareOperations: super::Operations {
+    /// Activate the hardware trigger.
+    fn activate(this: &mut Self::This) -> Result;
+    /// Deactivate the hardware trigger.
+    fn deactivate(_this: &mut Self::This) {
+        crate::build_error(crate::error::VTABLE_DEFAULT_ERROR)
+    }
+}
+
+/// `trigger_activate` function pointer
+///
+/// # Safety
+///
+/// `led_cdev` must be passed by the corresponding callback in `led_trigger`.
+unsafe extern "C" fn trigger_activate<T>(led_cdev: *mut bindings::led_classdev) -> i32
+where
+    T: HardwareOperations,
+{
+    from_result(|| {
+        // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `T::This<T>`.
+        let led = unsafe { &mut *(T::This::led_container_of(led_cdev.cast())) };
+        T::activate(led)?;
+        Ok(0)
+    })
+}
+
+/// `trigger_deactivate` function pointer
+///
+/// # Safety
+///
+/// `led_cdev` must be passed by the corresponding callback in `led_trigger`.
+unsafe extern "C" fn trigger_deactivate<T>(led_cdev: *mut bindings::led_classdev)
+where
+    T: HardwareOperations,
+{
+    // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `T::This<T>`.
+    let led = unsafe { &mut *(T::This::led_container_of(led_cdev.cast())) };
+    T::deactivate(led)
+}
-- 
2.47.0


