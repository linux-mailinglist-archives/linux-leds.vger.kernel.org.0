Return-Path: <linux-leds+bounces-3016-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA529967DE
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 12:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5A11F22841
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 10:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6AE1917D7;
	Wed,  9 Oct 2024 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="lcHD6w76"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7B180A76;
	Wed,  9 Oct 2024 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471514; cv=none; b=GFQEma9c5/P2jlaQKNhtaeQA3b2t9OSxlWeqoYEDTG2DmOKsJsUtKYJpfedSvG1FTdE/3HXVLZX642s21Q+8WcXiiJ9pzI+02LvRQ+brnWz9Tb2FDqDwrTro1w8oThuFkT8/gK/pfA/AU0PbRCSdPiXeI1kkX6Yb5FWEo04X3I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471514; c=relaxed/simple;
	bh=PArS4hlJp5vABoJZsm8LNrE+8f6yfqryjBSUoHpBSBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETuhnkiFzLRsoETUavvH6RMQSJMgFUtbfV4dc/8Xl8CJ47NyrxgV33AjLysy+KieOMiOxbpONxUwPwpPplnMSk5FZfLv9lqTQUXH2hmGmdCmqq0GzWoENq/PiZcmRMed07Lt1aLnjsCPn0wm8lQgD20Unbe7FjkoUqkLdtFKk6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=lcHD6w76; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1728471502; bh=c6Ab05vHf0g89gSXiF5Z/OuQ2xCSXFcvbnfFpVG9ZLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lcHD6w76ZGzGKZGTeJ67kJr4ioJzHjR0M8DqCyqZ5aKmDaq9eMGPa1ykLruJ/CcAp
	 aSVhBupdZy5Xm5ioZJS/8hC3cZm4KVqWR9ryC5VC4tdQ8kx5NbKFaQmhMJR1aLdcw8
	 lhssdcyWFmQpT2Afx+Bc5rmrk+bQ9AZrJQb/geQQ=
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Fiona Behrens <me@kloenk.dev>
Subject: [RFC PATCH 1/2] rust: LED abstraction
Date: Wed,  9 Oct 2024 12:57:58 +0200
Message-ID: <20241009105759.579579-2-me@kloenk.dev>
In-Reply-To: <20241009105759.579579-1-me@kloenk.dev>
References: <20241009105759.579579-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add abstractions for a simple LED, supporting Single color LED and
hardware accelerated blinking.

This is implemented using a pinned Led struct which holds driver data
and the C led_classdev struct. The driver data then implements a
vtable which currently provides `brightness_set`, `brightness_get` and
`blink_set`. This LED is then registered with the LED core and
unregistered when it is dropped.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
 rust/kernel/leds.rs | 399 ++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs  |   2 +
 2 files changed, 401 insertions(+)
 create mode 100644 rust/kernel/leds.rs

diff --git a/rust/kernel/leds.rs b/rust/kernel/leds.rs
new file mode 100644
index 000000000000..5348c1af5b31
--- /dev/null
+++ b/rust/kernel/leds.rs
@@ -0,0 +1,399 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! LED subsystem abstractions.
+//!
+//! C header: [`includes/linux/leds.h`](srctree/include/linux/leds.h)
+
+use core::ffi::c_ulong;
+use core::num::NonZeroU8;
+use core::ptr;
+use core::time::Duration;
+
+use crate::device::Device;
+use crate::{error::from_result, init::PinInit, prelude::*, types::Opaque};
+
+/// Color of an LED.
+#[derive(Copy, Clone)]
+pub enum Color {
+    /// White
+    White,
+    /// Red
+    Red,
+    /// Green
+    Green,
+    /// Blue
+    Blue,
+    /// Amber
+    Amber,
+    /// Violet
+    Violet,
+    /// Yellow
+    Yellow,
+    /// Purple
+    Purple,
+    /// Orange
+    Orange,
+    /// Pink
+    Pink,
+    /// Cyan
+    Cyan,
+    /// Lime
+    Lime,
+
+    /// Infrared
+    IR,
+    /// Multicolor LEDs
+    Multi,
+    /// Multicolor LEDs that can do arbitrary color,
+    /// so this would include `RGBW` and similar
+    RGB,
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
+    /// Get String representation of the Color.
+    #[inline]
+    pub fn name(&self) -> Option<&'static str> {
+        // SAFETY: name from C name array which is valid UTF-8.
+        self.name_cstr()
+            .map(|name| unsafe { name.as_str_unchecked() })
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
+        match color {
+            Color::White => bindings::LED_COLOR_ID_WHITE,
+            Color::Red => bindings::LED_COLOR_ID_RED,
+            Color::Green => bindings::LED_COLOR_ID_GREEN,
+            Color::Blue => bindings::LED_COLOR_ID_BLUE,
+            Color::Amber => bindings::LED_COLOR_ID_AMBER,
+            Color::Violet => bindings::LED_COLOR_ID_VIOLET,
+            Color::Yellow => bindings::LED_COLOR_ID_YELLOW,
+            Color::Purple => bindings::LED_COLOR_ID_PURPLE,
+            Color::Orange => bindings::LED_COLOR_ID_ORANGE,
+            Color::Pink => bindings::LED_COLOR_ID_PINK,
+            Color::Cyan => bindings::LED_COLOR_ID_CYAN,
+            Color::Lime => bindings::LED_COLOR_ID_LIME,
+            Color::IR => bindings::LED_COLOR_ID_IR,
+            Color::Multi => bindings::LED_COLOR_ID_MULTI,
+            Color::RGB => bindings::LED_COLOR_ID_RGB,
+        }
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
+/// Config for the LED.
+///
+/// Some fields are optional and only used depending on how the led is registered.
+pub struct LedConfig {
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
+impl<T> Led<T> {
+    /// Return a raw reference to `Self` from a raw `struct led_classdev` C pointer.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to a [`bindings::led_classdev`] field in a struct of type `Self`.
+    unsafe fn led_container_of(ptr: *mut bindings::led_classdev) -> *mut Self {
+        let ptr = ptr.cast::<Opaque<bindings::led_classdev>>();
+
+        // SAFETY: By the safety requirement of this function ptr is embedded in self.
+        unsafe { crate::container_of!(ptr, Self, led).cast_mut() }
+    }
+}
+
+impl<'a, T> Led<T>
+where
+    T: Operations + 'a,
+{
+    /// Register a new LED with a predefine name.
+    pub fn register_with_name(
+        name: &'a CStr,
+        device: Option<&'a Device>,
+        config: &'a LedConfig,
+        data: T,
+    ) -> impl PinInit<Self, Error> + 'a {
+        try_pin_init!( Self {
+            led <- Opaque::try_ffi_init(move |place: *mut bindings::led_classdev| {
+            // SAFETY: `place` is a pointer to a live allocation, so erasing is valid.
+            unsafe { place.write_bytes(0, 1) };
+
+            // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
+            unsafe { Self::build_with_name(place, name) };
+
+            // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
+            unsafe { Self::build_config(place, config) };
+
+            // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
+            unsafe { Self::build_vtable(place) };
+
+        let dev = device.map(|dev| dev.as_raw()).unwrap_or(ptr::null_mut());
+            // SAFETY: `place` is a pointer to a live allocation of `bindings::led_classdev`.
+        crate::error::to_result(unsafe {
+            bindings::led_classdev_register_ext(dev, place, ptr::null_mut())
+        })
+            }),
+            data: data,
+        })
+    }
+
+    /// Add nameto the led_classdev.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` has to be valid.
+    unsafe fn build_with_name(ptr: *mut bindings::led_classdev, name: &'a CStr) {
+        // SAFETY: `ptr` is pointing to a live allocation, so the deref is safe.
+        let name_ptr = unsafe { ptr::addr_of_mut!((*ptr).name) };
+        // SAFETY: `name_ptr` points to a valid allocation and we have exclusive access.
+        unsafe { ptr::write(name_ptr, name.as_char_ptr()) };
+    }
+
+    /// Add config to led_classdev.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` has to be valid.
+    unsafe fn build_config(ptr: *mut bindings::led_classdev, config: &'a LedConfig) {
+        // SAFETY: `ptr` is pointing to a live allocation, so the deref is safe.
+        let color_ptr = unsafe { ptr::addr_of_mut!((*ptr).color) };
+        // SAFETY: `color_ptr` points to a valid allocation and we have exclusive access.
+        unsafe { ptr::write(color_ptr, config.color.into()) };
+    }
+}
+
+impl<T> Led<T>
+where
+    T: Operations,
+{
+    /// Add the Operations vtable to the `led_classdev` struct.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` has to be valid.
+    unsafe fn build_vtable(ptr: *mut bindings::led_classdev) {
+        // SAFETY: `ptr` is pointing to a live allocation, so the deref is safe.
+        let max_brightness = unsafe { ptr::addr_of_mut!((*ptr).max_brightness) };
+        // SAFETY: `max_brightness` points to a valid allocation and we have exclusive access.
+        unsafe { ptr::write(max_brightness, T::MAX_BRIGHTNESS as _) };
+
+        // SAFETY: `ptr` is pointing to a live allocation, so the deref is safe.
+        let set_fn: *mut Option<_> = unsafe { ptr::addr_of_mut!((*ptr).brightness_set) };
+        // SAFETY: `set_fn` points to a valid allocation and we have exclusive access.
+        unsafe { ptr::write(set_fn, Some(brightness_set::<T>)) }
+
+        if T::HAS_BRIGHTNESS_GET {
+            // SAFETY: `ptr` is pointing to a live allocation, so the deref is safe.
+            let get_fn: *mut Option<_> = unsafe { ptr::addr_of_mut!((*ptr).brightness_get) };
+            // SAFETY: `set_fn` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(get_fn, Some(brightness_get::<T>)) }
+        }
+
+        if T::HAS_BLINK_SET {
+            // SAFETY: `ptr` is pointing to a live allocation, so the deref is safe.
+            let blink_fn: *mut Option<_> = unsafe { ptr::addr_of_mut!((*ptr).blink_set) };
+            // SAFETY: `set_fn` points to a valid allocation and we have exclusive access.
+            unsafe { ptr::write(blink_fn, Some(blink_set::<T>)) }
+        }
+    }
+}
+
+#[pinned_drop]
+impl<T> PinnedDrop for Led<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAEFTY: led is pointing to a live allocation
+        unsafe { bindings::led_classdev_unregister(self.led.get()) }
+    }
+}
+
+// SAFETY: `struct led_classdev` holds a mutex.
+unsafe impl<T: Send> Send for Led<T> {}
+// SAFETY: `struct led_classdev` holds a mutex.
+unsafe impl<T: Sync> Sync for Led<T> {}
+
+/// LED brightness.
+#[derive(Debug, Copy, Clone)]
+pub enum Brightness {
+    /// LED off.
+    Off,
+    /// Led set to the given value.
+    On(NonZeroU8),
+}
+
+impl Brightness {
+    /// Half LED brightness
+    // SAFETY: constant value non zero
+    pub const HALF: Self = Self::On(unsafe { NonZeroU8::new_unchecked(127) });
+    /// Full LED brightness.
+    pub const FULL: Self = Self::On(NonZeroU8::MAX);
+
+    /// Convert C brightness value to Rust brightness enum
+    fn from_c_enum(brightness: bindings::led_brightness) -> Self {
+        u8::try_from(brightness)
+            .map(NonZeroU8::new)
+            .map(|brightness| brightness.map(Self::On).unwrap_or(Self::Off))
+            .inspect_err(|_| pr_warn!("Brightness out of u8 range\n"))
+            .unwrap_or(Self::FULL)
+    }
+
+    /// Convert rust brightness enum to C value
+    fn as_c_enum(&self) -> bindings::led_brightness {
+        u8::from(self) as bindings::led_brightness
+    }
+}
+
+impl From<&Brightness> for u8 {
+    fn from(brightness: &Brightness) -> Self {
+        match brightness {
+            Brightness::Off => 0,
+            Brightness::On(v) => v.get(),
+        }
+    }
+}
+
+/// Led operations vtable.
+// TODO: add blocking variant (either via const generic or second trait)
+#[macros::vtable]
+pub trait Operations: Sized {
+    /// The maximum brightnes this led supports.
+    const MAX_BRIGHTNESS: u8;
+
+    /// Set LED brightness level.
+    /// This functions must not sleep.
+    fn brightness_set(this: &mut Led<Self>, brightness: Brightness);
+
+    /// Get the LED brightness level.
+    fn brightness_get(_this: &mut Led<Self>) -> Brightness {
+        crate::build_error(crate::error::VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Activae hardware accelerated blink, delays are in milliseconds
+    fn blink_set(
+        _this: &mut Led<Self>,
+        _delay_on: Duration,
+        _delay_off: Duration,
+    ) -> Result<(Duration, Duration)> {
+        crate::build_error(crate::error::VTABLE_DEFAULT_ERROR)
+    }
+}
+
+unsafe extern "C" fn brightness_set<T>(
+    led_cdev: *mut bindings::led_classdev,
+    brightness: bindings::led_brightness,
+) where
+    T: Operations,
+{
+    // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `Led<T>`
+    // struct.
+    let led = unsafe { &mut *(Led::<T>::led_container_of(led_cdev.cast())) };
+    let brightness = Brightness::from_c_enum(brightness);
+    T::brightness_set(led, brightness);
+}
+
+unsafe extern "C" fn brightness_get<T>(
+    led_cdev: *mut bindings::led_classdev,
+) -> bindings::led_brightness
+where
+    T: Operations,
+{
+    // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a `Led<T>`
+    // struct.
+    let led = unsafe { &mut *(Led::<T>::led_container_of(led_cdev.cast())) };
+    T::brightness_get(led).as_c_enum()
+}
+
+unsafe extern "C" fn blink_set<T>(
+    led_cdev: *mut bindings::led_classdev,
+    delay_on: *mut c_ulong,
+    delay_off: *mut c_ulong,
+) -> i32
+where
+    T: Operations,
+{
+    from_result(|| {
+        // SAFETY: By the safety requirement of this function `led_cdev` is embedded inside a
+        // `Led<T>` struct.
+        let led = unsafe { &mut *(Led::<T>::led_container_of(led_cdev.cast())) };
+
+        // SAFETY: By the safety requirement of this function `delay_on` is pointing to a valid
+        // `c_uint`
+        let on = Duration::from_millis(unsafe { *delay_on } as u64);
+        // SAFETY: By the safety requirement of this function `delay_off` is pointing to a valid
+        // `c_uint`
+        let off = Duration::from_millis(unsafe { *delay_off } as u64);
+
+        let (on, off) = T::blink_set(led, on, off)?;
+
+        // writing back return values
+        // SAFETY: By the safety requirement of this function `delay_on` is pointing to a valid
+        // `c_uint`
+        unsafe { ptr::write(delay_on, on.as_millis() as c_ulong) };
+        // SAFETY: By the safety requirement of this function `delay_off` is pointing to a valid
+        // `c_uint`
+        unsafe { ptr::write(delay_off, off.as_millis() as c_ulong) };
+
+        Ok(0)
+    })
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b5f4b3ce6b48..8df5f1cdf426 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -38,6 +38,8 @@
 pub mod ioctl;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
+#[cfg(CONFIG_NEW_LEDS)]
+pub mod leds;
 pub mod list;
 #[cfg(CONFIG_NET)]
 pub mod net;
-- 
2.46.0


