Return-Path: <linux-leds+bounces-3759-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0DA0B6C6
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A42507A42B9
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 12:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A34722A4EB;
	Mon, 13 Jan 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="cc5YoBTr"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F36922CF20;
	Mon, 13 Jan 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771051; cv=none; b=jTwgU843LlCvdfDI9j1SFU7u0S7F4xouUnKCTKhOvOFCMOS0izeuZptayrC7FmMtik87HrJ36qM695p4YAMV2giBh2FsoUL5McrWXtr4ZQ41aeVEbTArkETfzwal9EFyOzGdiMAirK+AUfbuUaK5sXuikA3stgJu6ad/bdhT5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771051; c=relaxed/simple;
	bh=InkuYB3k/SBuKJMcUmu2oiNJ9VcPHoKX+PwDidrViFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cR7V3n1BrIGwidXW8P/SvO15ryNPKVPfLCslrFXQ6JCs9g2QpsvywljM6Ot1YRKOgSIrgGXnxvED4jM2BS181KuYHXojwC8W1/e4IJF6oyNEVTgzInf8QVDJ8lZJcHIPNNc/VVgpx0FMurCZlscdwrVeyKxJgx0HZclbAfUEuZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=cc5YoBTr; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1736770601; bh=8Z1dr9VJxgVBQHf7eEsadNYIMRjUk4lfj7X3rMMik84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cc5YoBTrFP4S3g5BwxqFgc26iocyx3eZ7N3XkeH5s0Ras9et0aDn4Wpcoq2f99rgz
	 pnx5kcqj4PQGjjNb2HyddHtAnUfqLtJqjxBuI2bw7KGa/HV4kH6BO+LprPGNQAVrQ0
	 3G62UJl8P9zowSZXaN4Q4bKb/snc+GKxhjwQgYMM=
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
Subject: [PATCH v2 2/5] rust: leds: Add Rust bindings for LED subsystem
Date: Mon, 13 Jan 2025 13:16:17 +0100
Message-ID: <20250113121620.21598-3-me@kloenk.dev>
In-Reply-To: <20250113121620.21598-1-me@kloenk.dev>
References: <20250113121620.21598-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces Rust support for the LED subsystem, adding abstractions
for the `led_classdev` struct and implementing core LED operations such as
`brightness_set`, `brightness_get`, and `blink_set` via a vtable trait.

A `Color` enum is defined to represent various LED colors, and a `LedConfig`
struct is used to configure LED properties such as name and color. The `Led`
struct wraps the C `led_classdev` and ensures proper memory management by being
pinned and automatically unregistered when dropped.

Support for a devm register variant is not included in this patch.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
 MAINTAINERS         |   1 +
 rust/kernel/leds.rs | 341 ++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs  |   2 +
 rust/kernel/time.rs |   7 +
 4 files changed, 351 insertions(+)
 create mode 100644 rust/kernel/leds.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 30cbc3d44cd5..cef929b57159 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13019,6 +13019,7 @@ F:	Documentation/leds/
 F:	drivers/leds/
 F:	include/dt-bindings/leds/
 F:	include/linux/leds.h
+F:	rust/kernel/leds.rs
 
 LEGO MINDSTORMS EV3
 R:	David Lechner <david@lechnology.com>
diff --git a/rust/kernel/leds.rs b/rust/kernel/leds.rs
new file mode 100644
index 000000000000..980af7c405d4
--- /dev/null
+++ b/rust/kernel/leds.rs
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! LED subsystem.
+//!
+//! C header: [`includes/linux/leds.h`](srctree/include/linux/leds.h)
+
+use core::ptr;
+
+use crate::device::Device;
+use crate::error::from_result;
+use crate::ffi::c_ulong;
+use crate::prelude::*;
+use crate::time::Delta;
+use crate::types::Opaque;
+
+/// Color of an LED.
+#[allow(missing_docs)]
+#[derive(Copy, Clone)]
+#[repr(u32)]
+pub enum Color {
+    White = bindings::LED_COLOR_ID_WHITE,
+    Red = bindings::LED_COLOR_ID_RED,
+    Green = bindings::LED_COLOR_ID_GREEN,
+    Blue = bindings::LED_COLOR_ID_BLUE,
+    Amber = bindings::LED_COLOR_ID_AMBER,
+    Violet = bindings::LED_COLOR_ID_VIOLET,
+    Yellow = bindings::LED_COLOR_ID_YELLOW,
+    Purple = bindings::LED_COLOR_ID_PURPLE,
+    Orange = bindings::LED_COLOR_ID_ORANGE,
+    Pink = bindings::LED_COLOR_ID_PINK,
+    Cyan = bindings::LED_COLOR_ID_CYAN,
+    Lime = bindings::LED_COLOR_ID_LIME,
+
+    /// Infrared
+    IR = bindings::LED_COLOR_ID_IR,
+    /// Multicolor LEDs
+    Multi = bindings::LED_COLOR_ID_MULTI,
+    /// Multicolor LEDs that can do arbitrary color,
+    /// so this would include `RGBW` and similar
+    RGB = bindings::LED_COLOR_ID_RGB,
+}
+
+impl Color {
+    /// Get String representation of the Color.
+    pub fn name_cstr(&self) -> Option<&'static CStr> {
+        // SAFETY: C function call, enum is valid argument.
+        let name = unsafe { bindings::led_get_color_name(u32::from(self) as u8) };
+        if name.is_null() {
+            return None;
+        }
+        // SAFETY: pointer from above, valid for static lifetime.
+        Some(unsafe { CStr::from_char_ptr(name) })
+    }
+
+    /// Get String representation of the Color as rust type.
+    #[inline]
+    pub fn name(&self) -> Option<&'static str> {
+        self.name_cstr().map(|name|
+		 // SAFETY: name from C name array which is valid UTF-8.
+		 unsafe { name.as_str_unchecked() })
+    }
+}
+
+impl core::fmt::Display for Color {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        f.write_str(self.name().unwrap_or("Invalid color"))
+    }
+}
+
+impl From<Color> for u32 {
+    fn from(color: Color) -> Self {
+        color as u32
+    }
+}
+
+impl From<&Color> for u32 {
+    fn from(color: &Color) -> Self {
+        (*color).into()
+    }
+}
+
+impl TryFrom<u32> for Color {
+    type Error = Error;
+
+    /// Tris to convert a u32 into a [`Color`].
+    ///
+    /// # Errors
+    ///
+    /// Returns [`EINVAL`] if the color is not known.
+    fn try_from(value: u32) -> Result<Self, Self::Error> {
+        Ok(match value {
+            bindings::LED_COLOR_ID_WHITE => Color::White,
+            bindings::LED_COLOR_ID_RED => Color::Red,
+            bindings::LED_COLOR_ID_GREEN => Color::Green,
+            bindings::LED_COLOR_ID_BLUE => Color::Blue,
+            bindings::LED_COLOR_ID_AMBER => Color::Amber,
+            bindings::LED_COLOR_ID_VIOLET => Color::Violet,
+            bindings::LED_COLOR_ID_YELLOW => Color::Yellow,
+            bindings::LED_COLOR_ID_PURPLE => Color::Purple,
+            bindings::LED_COLOR_ID_ORANGE => Color::Orange,
+            bindings::LED_COLOR_ID_PINK => Color::Pink,
+            bindings::LED_COLOR_ID_CYAN => Color::Cyan,
+            bindings::LED_COLOR_ID_LIME => Color::Lime,
+            bindings::LED_COLOR_ID_IR => Color::IR,
+            bindings::LED_COLOR_ID_MULTI => Color::Multi,
+            bindings::LED_COLOR_ID_RGB => Color::RGB,
+            _ => return Err(EINVAL),
+        })
+    }
+}
+
+/// Data used for led registration.
+#[derive(Clone)]
+pub struct LedConfig<'name> {
+    /// Name to give the led.
+    pub name: Option<&'name CStr>,
+    /// Color of the LED.
+    pub color: Color,
+}
+
+/// A Led backed by a C `struct led_classdev`, additionally offering
+/// driver data storage.
+///
+/// The LED is unregistered once this LED struct is dropped.
+// TODO: add devm register variant
+#[pin_data(PinnedDrop)]
+pub struct Led<T> {
+    #[pin]
+    led: Opaque<bindings::led_classdev>,
+    /// Driver private data
+    pub data: T,
+}
+
+impl<T> Led<T>
+where
+    T: Operations<This = Led<T>>,
+{
+    /// Register a new LED.
+    ///
+    /// Copies the name if provided so that the lifetime of the name can end after the init function.
+    #[cfg(CONFIG_LEDS_CLASS)]
+    pub fn register<'a>(
+        device: Option<&'a Device>,
+        config: &'a LedConfig<'a>,
+        data: T,
+    ) -> impl PinInit<Self, Error> + 'a
+    where
+        T: 'a,
+    {
+        try_pin_init!(Self {
+            led <- Opaque::try_ffi_init(move |place: *mut bindings::led_classdev| {
+            // SAFETY: `place` is a pointer to a live allocation, so erasing is valid.
+            unsafe { place.write_bytes(0, 1) };
+
+            if let Some(name) = &config.name {
+                // SAFETY: `place` is a pointer to a live allocation.
+                let name_ptr = unsafe { ptr::addr_of_mut!((*place).name) };
+                // SAFETY: `name_ptr` points to a valid allocation and we have exclusive access.
+                unsafe { ptr::write(name_ptr, name.as_char_ptr()) };
+            }
+
+            // SAFETY: `place` is a pointer to a live allocation.
+            let color_ptr = unsafe { ptr::addr_of_mut!((*place).color) };
+            // SAFETY: `color_ptr` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(color_ptr, config.color.into()) };
+
+            // SAFETY: `place` is a pointer to a live allocation.
+            let max_brightness_ptr = unsafe { ptr::addr_of_mut!((*place).max_brightness) };
+            // SAFETY: `max_brightness_ptr` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(max_brightness_ptr, T::MAX_BRIGHTNESS as _) };
+
+            // SAFETY: `place` is a pointer to a live allocation.
+            let set_fn_ptr: *mut Option<_> = unsafe { ptr::addr_of_mut!((*place).brightness_set) };
+            // SAFETY: `set_fn_ptr` points to valid allocation and we have exclusive access.
+            unsafe { ptr::write(set_fn_ptr, Some(brightness_set::<T>)) };
+
+            if T::HAS_BRIGHTNESS_GET {
+                // SAFETY: `place` is pointing to a live allocation.
+                let get_fn_ptr: *mut Option<_> = unsafe { ptr::addr_of_mut!((*place).brightness_get) };
+                // SAFETY: `get_fn_ptr` points to a valid allocation and we have exclusive access.
+                unsafe { ptr::write(get_fn_ptr, Some(brightness_get::<T>)) };
+            }
+
+            if T::HAS_BLINK_SET {
+                // SAFETY: `place` is pointing to a live allocation.
+                let set_fn_ptr: *mut Option<_> = unsafe { ptr::addr_of_mut!((*place).blink_set) };
+                // SAFETY: `get_fn_ptr` points to a valid allocation and we have exclusive access.
+                unsafe { ptr::write(set_fn_ptr, Some(blink_set::<T>)) };
+            }
+
+
+            let dev = device.map(|dev| dev.as_raw()).unwrap_or(ptr::null_mut());
+            // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
+            crate::error::to_result(unsafe {
+                bindings::led_classdev_register_ext(dev, place, ptr::null_mut())
+            })
+            }),
+            data: data,
+        })
+    }
+}
+
+impl<T> private::Sealed for Led<T> {}
+
+impl<T> FromLedClassdev for Led<T> {
+    #[inline]
+    unsafe fn led_container_of(ptr: *mut bindings::led_classdev) -> *mut Self {
+        let ptr = ptr.cast::<Opaque<bindings::led_classdev>>();
+
+        // SAFETY: By the safety requirement of this function ptr is embedded in self.
+        unsafe { crate::container_of!(ptr, Self, led).cast_mut() }
+    }
+}
+
+#[pinned_drop]
+impl<T> PinnedDrop for Led<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: led is pointing to a live allocation
+        #[cfg(CONFIG_LEDS_CLASS)]
+        unsafe {
+            bindings::led_classdev_unregister(self.led.get())
+        }
+    }
+}
+
+// SAFETY: `struct led_classdev` holds a mutex.
+unsafe impl<T: Send> Send for Led<T> {}
+// SAFETY: `struct led_classdev` holds a mutex.
+unsafe impl<T: Sync> Sync for Led<T> {}
+
+/// Led operations vtable.
+// TODO: add blocking variant (either via const generic or second trait)
+#[macros::vtable]
+pub trait Operations: Sized {
+    /// The maximum brightnes this led supports.
+    const MAX_BRIGHTNESS: u8;
+
+    /// Type of the container to use as self in the callbacks.
+    ///
+    /// This is most often [`Led<Self>`].
+    type This: FromLedClassdev;
+
+    /// Set LED brightness level.
+    /// This functions must not sleep.
+    fn brightness_set(this: &mut Self::This, brightness: u8);
+
+    /// Get the LED brightness level.
+    fn brightness_get(_this: &mut Self::This) -> u8 {
+        crate::build_error(crate::error::VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Activae hardware accelerated blink, delays are in milliseconds
+    fn blink_set(
+        _this: &mut Self::This,
+        _delay_on: Delta,
+        _delay_off: Delta,
+    ) -> Result<(Delta, Delta)> {
+        crate::build_error(crate::error::VTABLE_DEFAULT_ERROR)
+    }
+}
+
+/// `brightness_set` function pointer
+///
+/// # Safety
+///
+/// `led_cdev` must be passed by the corresponding callback in `led_classdev`
+unsafe extern "C" fn brightness_set<T>(
+    led_cdev: *mut bindings::led_classdev,
+    brightness: bindings::led_brightness,
+) where
+    T: Operations,
+{
+    // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `T::This<T>`.
+    let led = unsafe { &mut *(T::This::led_container_of(led_cdev.cast())) };
+    T::brightness_set(led, brightness as _);
+}
+
+/// `brightness_get` function pointer
+///
+/// # Safety
+///
+/// `led_cdev` must be passed by the corresponding callback in `led_classdev`
+unsafe extern "C" fn brightness_get<T>(
+    led_cdev: *mut bindings::led_classdev,
+) -> bindings::led_brightness
+where
+    T: Operations,
+{
+    // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `T::This<T>`.
+    let led = unsafe { &mut *(T::This::led_container_of(led_cdev.cast())) };
+    T::brightness_get(led) as _
+}
+
+/// `blink_set` function pointer
+///
+/// # Safety
+///
+/// `led_cdev` must be passed by the corresponding callback in `led_classdev`
+unsafe extern "C" fn blink_set<T>(
+    led_cdev: *mut bindings::led_classdev,
+    delay_on: *mut c_ulong,
+    delay_off: *mut c_ulong,
+) -> i32
+where
+    T: Operations,
+{
+    from_result(|| {
+        // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `T::This<T>`.
+        let led = unsafe { &mut *(T::This::led_container_of(led_cdev.cast())) };
+
+        // SAFETY: By the safety requirement of this function `delay_on` is pointing to a valid `c_ulong`.
+        let on = Delta::from_millis(unsafe { *delay_on } as i64);
+        // SAFETY: By the safety requirement of this function `delay_off` is pointing to a valid `c_ulong`.
+        let off = Delta::from_millis(unsafe { *delay_off } as i64);
+
+        let (on, off) = T::blink_set(led, on, off)?;
+
+        // writing back return values
+        // SAFETY: By the safety requirement of this function `delay_on` is pointing to a valid `c_ulong`.
+        unsafe { ptr::write(delay_on, on.as_millis_ceil() as c_ulong) };
+        // SAFETY: By the safety requirement of this function `delay_off` is pointing to a valid `c_ulong`.
+        unsafe { ptr::write(delay_off, off.as_millis_ceil() as c_ulong) };
+
+        Ok(0)
+    })
+}
+
+/// Trait to get the type from a `led_classdev` pointer.
+pub trait FromLedClassdev: private::Sealed {
+    /// Get pointer to the outer type from a `led_classdev` pointer.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to a [`bindings::led_classdev`] field in a struct of type `Self`.
+    unsafe fn led_container_of(ptr: *mut bindings::led_classdev) -> *mut Self;
+}
+
+mod private {
+    /// Marker that a trait cannot be implemented outside of this crate
+    pub trait Sealed {}
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e21f2e607963..8895a1683f82 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,8 @@
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
+#[cfg(CONFIG_NEW_LEDS)]
+pub mod leds;
 pub mod list;
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 38da79925586..3c348ce4a7c2 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -143,4 +143,11 @@ pub fn as_nanos(self) -> i64 {
     pub fn as_micros_ceil(self) -> i64 {
         self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
     }
+
+    /// Return the smallest number of milliseconds greater than or equal
+    /// to the value in the `Delta`.
+    #[inline]
+    pub fn as_millis_ceil(self) -> i64 {
+        self.as_nanos().saturating_add(NSEC_PER_MSEC - 1) / NSEC_PER_MSEC
+    }
 }
-- 
2.47.0


