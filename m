Return-Path: <linux-leds+bounces-3761-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B34A0B6C7
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07CC43A9C7B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 12:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E744A22AE74;
	Mon, 13 Jan 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="kShao7ND"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6539F21ADB4;
	Mon, 13 Jan 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771051; cv=none; b=FbuoINWdlnNiuolUpkP/IrmGB4xw4+gTTnAU9pMLJyLrb88rayXd1iMX3yhatgez/4ljFQwLUTr3sYOLDNJ+/zIepOQGDYeb1UzfoVF48588WFSsYKn1Eox7J6I7Vh0YBB/VKqt9fvGe0z2ebj94pBpKgIh77/4ayOTb4SAIcG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771051; c=relaxed/simple;
	bh=v1FkIg0y/Lsvezk57cy/ddGUUthGoVCIM714Z16DW0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=toT/tLwzoUlB6aoTqDJ8OdBzJSIfMO71+pD32dJzn6YHLSDfPn/SDDU1lYghEejh6RoTjc1u1Anp44XUESeZ4r2rrRwuUUANQf9lO26SC9rzR4R+RkYYsDhzc+YAiFlqMAjCgNsdicBasqJeFQORgpwaeYpWxUQmYh5+VyxMDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=kShao7ND; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1736770599; bh=zzgEIqqDKEZfXjxsOgvFdJFD0KDPqRzLi2JQNHpyhfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kShao7NDNhW39ynkTbA+PdVgQwGHlbXhThDImLsFXGeJlfCrIYQbOdEwJtr+vgsmJ
	 j7k0LccZTTKhdF3vZ9l0eiXqpf8OunwwEmFnFhiLWbmM+kdp+yqvV4qPlrHok5awFX
	 9YkUIVran3p5K81gUekf7fw3k61nr7gfEdgNfjjc=
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
	linux-kernel@vger.kernel.org,
	Sebastian Walz <sivizius@sivizius.eu>
Subject: [PATCH v2 1/5] rust: dmi: Add abstractions for DMI
Date: Mon, 13 Jan 2025 13:16:16 +0100
Message-ID: <20250113121620.21598-2-me@kloenk.dev>
In-Reply-To: <20250113121620.21598-1-me@kloenk.dev>
References: <20250113121620.21598-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce Rust macros and types to support DMI-based system matching,
providing functionality similar to the `MODULE_DEVICE_TABLE(dmi, x)`
macro in C.

- Add the `dmi_system_id!` macro for defining system identifiers and
  matching specific DMI fields.
- Add the `dmi_device_table!` macro, which allows module aliases to be
  available after a full build when compiled as a module.
- Define the `Field` enum for DMI field IDs, ensuring compatibility
  with existing C bindings.

These abstractions enable writing Rust kernel drivers that rely on DMI
data for system-specific behavior and autoloading.

Co-developed-by: Sebastian Walz <sivizius@sivizius.eu>
Signed-off-by: Sebastian Walz <sivizius@sivizius.eu>
Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/dmi.rs              | 533 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 536 insertions(+)
 create mode 100644 rust/kernel/dmi.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 5c4dfe22f41a..d20b2a6af9c9 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,6 +11,7 @@
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
 #include <linux/cred.h>
+#include <linux/dmi.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/file.h>
diff --git a/rust/kernel/dmi.rs b/rust/kernel/dmi.rs
new file mode 100644
index 000000000000..ba2a010d0e55
--- /dev/null
+++ b/rust/kernel/dmi.rs
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DMI support.
+//!
+//! C header: [`inlcude/linux/dmi.h`](srctree/include/linux/dmi.h)
+
+use core::marker::PhantomData;
+use core::num::NonZeroU32;
+use core::ops::Deref;
+
+use crate::prelude::*;
+use crate::str::CStr;
+
+/// Create a new [`SystemId`].
+///
+/// # Examples
+///
+/// Create a [`SystemId`] that matches if the [`BiosVendor`] is `qemu`.
+///
+/// ```
+/// let system_id = kernel::dmi_system_id!("qemu": [
+///     BiosVendor: "qemu" @exact,
+///     ProductFamily: "rust",
+/// ]);
+/// assert_eq!(system_id.matches()[0].slot().unwrap().unwrap(), kernel::dmi::Field::BiosVendor);
+/// assert_eq!(system_id.matches()[0].exact_match(), true);
+/// assert_eq!(system_id.matches()[1].exact_match(), false);
+/// ```
+///
+/// A [`SystemId`] cannot hold more than 4 matches and must not be empty,
+/// otherwise it will fail to compile.
+///
+// TODO: replace with `compile_fail` when supported.
+/// ```ignore
+/// let system_id = kernel::dmi_system_id!("qemu": [
+///     BiosVendor: "qemu",
+///     BiosVersion: "8.0",
+///     ProductName: "doctest",
+///     ProductFamily: "rust",
+///     BoardVendor: "qemu"
+/// ]);
+/// ```
+///
+/// [`BiosVendor`]: Field::BiosVendor
+#[macro_export]
+macro_rules! dmi_system_id {
+    (@strmatch, $slot:ident, $match:literal) => {
+        $crate::dmi::StrMatch::new($crate::dmi::Field::$slot, $match)
+    };
+    (@strmatch, $slot:ident, $match:literal, @exact) => {
+        $crate::dmi::StrMatch::new_exact($crate::dmi::Field::$slot, $match)
+    };
+    ($ident:literal: [$($slot:ident: $match:literal $(@$exact:ident)? $(,)?)+]) => {
+	const {
+	    match $crate::dmi::SystemId::new_from_slice($crate::c_str!($ident), &[
+		$($crate::dmi_system_id!(@strmatch, $slot, $match$(, @$exact)?),)+
+	    ]) {
+		Some(v) => v,
+		_ => $crate::build_error("Invalid length for matches"),
+	    }
+	}
+    };
+}
+
+/// Create a new static [`SystemIdList`] and export it as a device table to generate alias
+/// definitions to load the driver from userspace if compiled as module.
+///
+/// # Examples
+///
+/// Create a device table with the name `QEMU_DMI_TABLE` that loads the driver if the
+/// [`BiosVendor`] is `qemu`.
+///
+/// ```
+/// kernel::dmi_device_table!(1, QEMU_DMI_TABLE, ["qemu": [BiosVendor: "qemu"]]);
+/// # assert_eq!(QEMU_DMI_TABLE.len(), 1);
+/// ```
+///
+/// [`BiosVendor`]: Field::BiosVendor
+#[macro_export]
+macro_rules! dmi_device_table {
+    (
+	$N:literal,
+	$name:ident,
+	[$($ident:literal: [$($slot:ident: $match:literal $(, @$exact:ident)?$(,)?)+]$(,)?)+]
+    ) => {
+	#[cfg_attr(MODULE, export_name = concat!("__mod_device_table__dmi__", stringify!($name)))]
+	#[cfg_attr(MODULE, used)]
+	static $name: $crate::dmi::SystemIdList<'static, $N> =
+	    $crate::dmi::SystemIdList::new([$(
+		$crate::dmi_system_id!($ident: [$($slot: $match $(, @$exact)?)+]),
+	    )+]);
+    };
+}
+
+/// DMI field id.
+#[derive(Debug, PartialEq, Eq, Copy, Clone)]
+#[repr(u8)]
+pub enum Field {
+    // None
+    /// Bios Vendor
+    BiosVendor = bindings::dmi_field_DMI_BIOS_VENDOR as u8,
+    /// Bios Version
+    BiosVersion = bindings::dmi_field_DMI_BIOS_VERSION as u8,
+    /// Bios Date
+    BiosDate = bindings::dmi_field_DMI_BIOS_DATE as u8,
+    /// Bios Release
+    BiosRelease = bindings::dmi_field_DMI_BIOS_RELEASE as u8,
+    /// Embedded Controller Firmware Release
+    EcFirmwareRelease = bindings::dmi_field_DMI_EC_FIRMWARE_RELEASE as u8,
+    /// System Vendor
+    SysVendor = bindings::dmi_field_DMI_SYS_VENDOR as u8,
+    /// Product Name
+    ProductName = bindings::dmi_field_DMI_PRODUCT_NAME as u8,
+    /// Product Version
+    ProductVersion = bindings::dmi_field_DMI_PRODUCT_VERSION as u8,
+    /// Product Serial
+    ProductSerial = bindings::dmi_field_DMI_PRODUCT_SERIAL as u8,
+    /// Product UUID
+    ProductUuid = bindings::dmi_field_DMI_PRODUCT_UUID as u8,
+    /// Product SKU
+    ProductSku = bindings::dmi_field_DMI_PRODUCT_SKU as u8,
+    /// Product Family
+    ProductFamily = bindings::dmi_field_DMI_PRODUCT_FAMILY as u8,
+    /// Board Vendor
+    BoardVendor = bindings::dmi_field_DMI_BOARD_VENDOR as u8,
+    /// Board Name
+    BoardName = bindings::dmi_field_DMI_BOARD_NAME as u8,
+    /// Board Version
+    BoardVersion = bindings::dmi_field_DMI_BOARD_VERSION as u8,
+    /// Board Serial
+    BoardSerial = bindings::dmi_field_DMI_BOARD_SERIAL as u8,
+    /// Board Asset Tag
+    BoardAssetTag = bindings::dmi_field_DMI_BOARD_ASSET_TAG as u8,
+    /// Chassis Vendor
+    ChassisVendor = bindings::dmi_field_DMI_CHASSIS_VENDOR as u8,
+    /// Chassis Type
+    ChassisType = bindings::dmi_field_DMI_CHASSIS_TYPE as u8,
+    /// Chassis Version
+    ChassisVersion = bindings::dmi_field_DMI_CHASSIS_VERSION as u8,
+    /// Chassis Serial
+    ChassisSerial = bindings::dmi_field_DMI_CHASSIS_SERIAL as u8,
+    /// Chassis Asset Tag
+    ChassisAssetTag = bindings::dmi_field_DMI_CHASSIS_ASSET_TAG as u8,
+    // StringMax,
+    // OemString,
+}
+
+impl Field {
+    /// Return DMI data value.
+    ///
+    /// Returns one DMI data value, can be used to perform complex DMI data checks.
+    pub fn get_system_info(self) -> Option<&'static CStr> {
+        // SAFETY: C call, self is a valid enum
+        let ptr = unsafe { bindings::dmi_get_system_info(self as u8 as _) };
+        if ptr.is_null() {
+            None
+        } else {
+            // SAFETY: ptr checked to be none null above and to be a valid char ptr.
+            Some(unsafe { CStr::from_char_ptr(ptr) })
+        }
+    }
+
+    /// Compare a string to the dmi field (if exists).
+    ///
+    /// Returns true if the requested field equals to the check value (including None).
+    /// wraps the `dmi_match` C function.
+    pub fn compare(self, value: Option<&CStr>) -> bool {
+        // SAFETY: C call, self is valid enum and value is null or a string
+        unsafe {
+            bindings::dmi_match(
+                self as u8 as _,
+                value.map(CStr::as_char_ptr).unwrap_or(core::ptr::null()),
+            )
+        }
+    }
+}
+
+impl TryFrom<u8> for Field {
+    type Error = Error;
+
+    /// Tries to convert a u8 id to a [`Field`].
+    ///
+    /// # Errors
+    ///
+    /// Returns [`EINVAL`] if the id does not match a known field.
+    fn try_from(value: u8) -> Result<Self, Self::Error> {
+        Ok(match value as u32 {
+            bindings::dmi_field_DMI_BIOS_VENDOR => Self::BiosVendor,
+            bindings::dmi_field_DMI_BIOS_VERSION => Self::BiosVersion,
+            bindings::dmi_field_DMI_BIOS_DATE => Self::BiosDate,
+            bindings::dmi_field_DMI_BIOS_RELEASE => Self::BiosRelease,
+            bindings::dmi_field_DMI_EC_FIRMWARE_RELEASE => Self::EcFirmwareRelease,
+            bindings::dmi_field_DMI_SYS_VENDOR => Self::SysVendor,
+            bindings::dmi_field_DMI_PRODUCT_NAME => Self::ProductName,
+            bindings::dmi_field_DMI_PRODUCT_VERSION => Self::ProductVersion,
+            bindings::dmi_field_DMI_PRODUCT_SERIAL => Self::ProductSerial,
+            bindings::dmi_field_DMI_PRODUCT_UUID => Self::ProductUuid,
+            bindings::dmi_field_DMI_PRODUCT_SKU => Self::ProductSku,
+            bindings::dmi_field_DMI_PRODUCT_FAMILY => Self::ProductFamily,
+            bindings::dmi_field_DMI_BOARD_VENDOR => Self::BoardVendor,
+            bindings::dmi_field_DMI_BOARD_NAME => Self::BoardName,
+            bindings::dmi_field_DMI_BOARD_VERSION => Self::BoardVersion,
+            bindings::dmi_field_DMI_BOARD_SERIAL => Self::BoardSerial,
+            bindings::dmi_field_DMI_BOARD_ASSET_TAG => Self::BoardAssetTag,
+            bindings::dmi_field_DMI_CHASSIS_VENDOR => Self::ChassisVendor,
+            bindings::dmi_field_DMI_CHASSIS_TYPE => Self::ChassisType,
+            bindings::dmi_field_DMI_CHASSIS_VERSION => Self::ChassisVersion,
+            bindings::dmi_field_DMI_CHASSIS_SERIAL => Self::ChassisSerial,
+            bindings::dmi_field_DMI_CHASSIS_ASSET_TAG => Self::ChassisAssetTag,
+            _ => return Err(EINVAL),
+        })
+    }
+}
+
+/// String Match entry for DMI.
+///
+/// Wraps the C struct `dmi_strmatch`.
+#[derive(Copy, Clone)]
+#[repr(transparent)]
+pub struct StrMatch(bindings::dmi_strmatch);
+
+impl StrMatch {
+    /// Zeroed match entry.
+    pub const ZERO: Self = {
+        // SAFETY: all zero is a valid match with slot none.
+        unsafe { core::mem::zeroed() }
+    };
+
+    /// Create a new String match entry that is not an exact match.
+    ///
+    /// This function copies the string into it's own allocation.
+    #[inline]
+    pub const fn new(slot: Field, substr: &str) -> Self {
+        Self::new_with_exact(slot, substr, false)
+    }
+
+    /// Create a new String match entry that wants an exact match.
+    ///
+    /// This function copies the string into it's own allocation.
+    #[inline]
+    pub const fn new_exact(slot: Field, substr: &str) -> Self {
+        Self::new_with_exact(slot, substr, true)
+    }
+
+    /// Create a new String match entry.
+    ///
+    /// This function copies the string into it's own allocation.
+    pub const fn new_with_exact(slot: Field, substr: &str, exact: bool) -> Self {
+        #[cfg(target_endian = "little")]
+        let (exactshift, slotshift) = (7, 0);
+        #[cfg(target_endian = "big")]
+        let (exactshift, slotshift) = (0, 1);
+
+        let bitfield = (exact as u8) << exactshift | (slot as u8) << slotshift;
+
+        let mut this = Self(bindings::dmi_strmatch {
+            _bitfield_1: bindings::__BindgenBitfieldUnit::new([bitfield]),
+            ..Self::ZERO.0
+        });
+
+        // copy substr into this
+        // core::ptr::copy_nonoverlapping is not const as mutable ref.
+        let input = substr.as_bytes();
+        let mut index = input.len();
+        let max = this.0.substr.len() - 1;
+        if index > max {
+            // TODO: find a way to generate warning from const
+            index = max;
+        }
+        loop {
+            if index == 0 {
+                break;
+            }
+
+            index -= 1;
+            this.0.substr[index] = input[index] as i8;
+        }
+
+        this
+    }
+
+    /// Return the slot this entry matches.
+    ///
+    /// # Errors
+    ///
+    /// Returns `Ok(None)` if the slot has the value 0, or [`EINVAL`] if the field id is unknown.
+    ///
+    /// # Examples
+    /// ```
+    /// # use kernel::dmi::{StrMatch, Field};
+    /// let strmatch = StrMatch::new(Field::BiosVendor, "qemu");
+    /// assert_eq!(strmatch.slot().unwrap().unwrap(), Field::BiosVendor);
+    /// ```
+    pub fn slot(&self) -> Result<Option<Field>> {
+        let slot = self.0.slot();
+        if slot == 0 {
+            Ok(None)
+        } else {
+            Some(Field::try_from(slot)).transpose()
+        }
+    }
+
+    /// Return if this match wants an exact match.
+    ///
+    /// # Examples
+    /// ```
+    /// # use kernel::dmi::{StrMatch, Field};
+    /// let strmatch = StrMatch::new_exact(Field::BiosVendor, "qemu");
+    /// assert_eq!(strmatch.exact_match(), true);
+    /// ```
+    #[inline]
+    pub fn exact_match(&self) -> bool {
+        self.0.exact_match() == 1
+    }
+
+    /// Return the substring to match for.
+    ///
+    /// # Examples
+    /// ```
+    /// # use kernel::dmi::{StrMatch, Field};
+    /// let strmatch = StrMatch::new(Field::BiosVendor, "qemu");
+    /// assert_eq!(strmatch.substr(), "qemu");
+    /// ```
+    pub fn substr(&self) -> &str {
+        let len = self.0.substr.into_iter().take_while(|x| *x != 0).count();
+        // SAFETY: substr is a valid str for len of len
+        unsafe {
+            core::str::from_utf8_unchecked(core::slice::from_raw_parts(
+                self.0.substr.as_ptr().cast(),
+                len,
+            ))
+        }
+    }
+}
+
+impl core::fmt::Debug for StrMatch {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        f.debug_struct("StrMatch")
+            .field("slot", &self.slot().ok().flatten())
+            .field("exact_match", &self.exact_match())
+            .field("substr", &self.substr())
+            .finish()
+    }
+}
+
+impl PartialEq for StrMatch {
+    fn eq(&self, other: &Self) -> bool {
+        self.0._bitfield_1 == other.0._bitfield_1 && self.0.substr == other.0.substr
+    }
+}
+
+impl Eq for StrMatch {}
+
+/// DMI system ID.
+///
+/// To create a system ID in a const context the macro [`kernel::dmi_system_id`] can be used.
+///
+/// Wraps the C struct `dmi_system_id`.
+#[repr(transparent)]
+pub struct SystemId<'a> {
+    id: bindings::dmi_system_id,
+    // lifetime anchor for ident, driver data and callback
+    _a: PhantomData<&'a ()>,
+}
+
+impl SystemId<'static> {
+    /// zeroed [`SystemId`] for trailing list.
+    pub const ZERO: Self = {
+        // SAFETY: all fields zeroed is valid.
+        unsafe { core::mem::zeroed() }
+    };
+}
+
+impl<'a> SystemId<'a> {
+    /// Create a new SystemId from a matches array.
+    pub const fn new(ident: &'a CStr, matches: [StrMatch; 4]) -> Self {
+        Self {
+            id: bindings::dmi_system_id {
+                callback: None,
+                ident: ident.as_char_ptr(),
+                // SAFETY: StrMatch is transparent over bindings::dmi_strmatch
+                matches: unsafe {
+                    core::mem::transmute::<[StrMatch; 4], [bindings::dmi_strmatch; 4]>(matches)
+                },
+                driver_data: core::ptr::null_mut(),
+            },
+            _a: PhantomData,
+        }
+    }
+
+    /// Createa n new SystemId from a slice of matches, filling missing entries with [`StrMatch::ZERO`].
+    ///
+    /// Copying the matches, only provided to be used in macros.
+    #[doc(hidden)]
+    pub const fn new_from_slice(ident: &'a CStr, matches: &[StrMatch]) -> Option<Self> {
+        if matches.is_empty() || matches.len() > 4 {
+            return None;
+        }
+
+        let mut matches_a = [StrMatch::ZERO; 4];
+        let mut index = matches.len();
+        loop {
+            index -= 1;
+            matches_a[index] = matches[index];
+
+            if index == 0 {
+                break;
+            }
+        }
+        Some(Self::new(ident, matches_a))
+    }
+
+    /// Return the ident of the given SystemId.
+    ///
+    /// Returns a option as the C api allows to not set the ident.
+    pub fn ident_cstr(&self) -> Option<&'a CStr> {
+        let ident_ptr = self.id.ident;
+        if ident_ptr.is_null() {
+            return None;
+        }
+
+        // SAFETY: ident_ptr is valid and non null.
+        Some(unsafe { CStr::from_char_ptr(ident_ptr) })
+    }
+
+    /// Return the ident of the given SystemId as a rust [`str`].
+    ///
+    /// Returns a option as the C api allows to not set the ident.
+    /// See [`ident_cstr`].
+    ///
+    /// [`ident_cstr`]: Self::ident_cstr
+    #[inline]
+    pub fn ident(&self) -> Option<&'a str> {
+        self.ident_cstr().map(CStr::to_str).and_then(Result::ok)
+    }
+
+    /// Set the ident from the given optional string.
+    ///
+    /// Set to None to remove the ident.
+    pub fn set_ident(&mut self, ident: Option<&'a CStr>) {
+        if let Some(ident) = ident {
+            self.id.ident = ident.as_char_ptr();
+        } else {
+            self.id.ident = core::ptr::null();
+        }
+    }
+
+    /// Return the [`StrMatch`] array in the SystemId.
+    pub fn matches(&self) -> &[StrMatch; 4] {
+        // SAFETY: StrMatch is transparent over bindings::dmi_strmatch
+        unsafe { core::mem::transmute(&self.id.matches) }
+    }
+
+    /// Return a mutable reference to the StrMatch array in the SystemId.
+    pub fn matches_mut(&mut self) -> &mut [StrMatch; 4] {
+        // SAFETY: StrMatch is transparent over bindings::dmi_strmatch
+        unsafe { core::mem::transmute(&mut self.id.matches) }
+    }
+}
+
+impl core::fmt::Debug for SystemId<'_> {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        f.debug_struct("SystemId")
+            .field("ident", &self.ident())
+            .field("matches", &self.matches())
+            .field("callback", &self.id.callback)
+            .field("driver_data", &self.id.driver_data)
+            .finish()
+    }
+}
+
+// SAFETY: pointer to allocation with sufficent lifetime
+unsafe impl<'a> Sync for SystemId<'a> {}
+// SAFETY: pointer to allocation with sufficent lifetime
+unsafe impl<'a> Send for SystemId<'a> {}
+
+/// List of SystemIds, containing a zero sentinel to be used with dmi functions.
+///
+/// Can be exported as a device table with the [`kernel::dmi_device_table`] macro.
+#[repr(C)]
+pub struct SystemIdList<'a, const N: usize> {
+    ids: [SystemId<'a>; N],
+    sentinel: SystemId<'static>,
+}
+
+impl<'a, const N: usize> SystemIdList<'a, N> {
+    /// Create a new list from the given Id list, adding a zero sentinel.
+    pub const fn new(ids: [SystemId<'a>; N]) -> Self {
+        Self {
+            ids,
+            sentinel: SystemId::ZERO,
+        }
+    }
+
+    /// Check system DMI data
+    ///
+    /// Walk the blacklist table running matching functions until someone
+    /// returns non zero or we hit the end. Callback function is called for
+    /// each successful match. Returns the number of matches.
+    pub fn check_system(&self) -> Option<NonZeroU32> {
+        // SAFETY: C call, self has a sentinel
+        NonZeroU32::new(unsafe { bindings::dmi_check_system(self.as_raw_ptr()) as u32 })
+    }
+
+    /// Find the first match.
+    ///
+    /// Walk the blacklist table until the first match is found, and returns it.
+    pub fn first_match(&self) -> Option<&SystemId<'a>> {
+        // SAFETY: C call, self has a sentinel
+        let ptr = unsafe { bindings::dmi_first_match(self.as_raw_ptr()) };
+        if ptr.is_null() {
+            None
+        } else {
+            // SAFETY: ptr is non null. SystemId is transparent
+            Some(unsafe { &*ptr.cast() })
+        }
+    }
+
+    /// Return the raw pointer to the dmi_system_id array, including a terminating zero sentinel.
+    pub fn as_raw_ptr(&self) -> *const bindings::dmi_system_id {
+        // ids is the first element in the struct, safe to use as base pointer.
+        // SystemId is transparent over bindings::dmi_system_id
+        self.ids.as_ptr().cast()
+    }
+}
+
+impl<'a, const N: usize> Deref for SystemIdList<'a, N> {
+    type Target = [SystemId<'a>; N];
+
+    fn deref(&self) -> &Self::Target {
+        &self.ids
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a3..e21f2e607963 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -35,6 +35,8 @@
 mod build_assert;
 pub mod cred;
 pub mod device;
+#[cfg(CONFIG_DMI)]
+pub mod dmi;
 pub mod error;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
-- 
2.47.0


