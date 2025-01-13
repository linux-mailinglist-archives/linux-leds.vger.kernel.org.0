Return-Path: <linux-leds+bounces-3757-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61CA0B688
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 13:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1C6A188375D
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 12:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0A01CAA9C;
	Mon, 13 Jan 2025 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="W96Kf6Le"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345F46B5;
	Mon, 13 Jan 2025 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770609; cv=none; b=Goj0UN0DOZt9E7yopDvzxEa+wJZblni/SOnm8O13bXGRlHPVrTmkxNVGY8C0w37pGX2dq64VzYeSpbFhtteUryYHVGC/73IO9x5bsqsVXRjDE5HqD8w9KMr1oJfQhU68XdAphOZy5E8ilcPEAquWZeCkGhiXs9l2CQ5Ohq6qEpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770609; c=relaxed/simple;
	bh=X55MW9Dg0Zi/RNAdNvnOWc+2TMmIMf4DTNcr3zscVk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqMEkVFD7aHPhOk65dWCxVT7w92dYRiNMUGdNVrAovxvnyMhTk9vnrYfrItewuY1HwM5vnL3zGuDHZAXzR7c8EWwYVc/MfQURx0Mlp3c7jxnCz/+4mpxRHg6DCDHiqHHlrVDN1pn4IvpXUlASSjgRMhgQHJ7JaQNQpC33iPKKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=W96Kf6Le; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1736770604; bh=Azv4UbYvX3F38g2x+W0M5pOtjjIlGZCAIrMpGofvm+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W96Kf6Leb2YWuj+wZE9h0QcmFTIKqKuhHJEHK3IUcDrt74rZfKkEIrLwGVHbNOQDQ
	 eVQLyYpl52OpozicStzikb/rRuCPrYqBV544i/+K+o1QjcB/o68f+udOj5yKn8ej9s
	 BAzdYRJdKDLXqmR6fvNakNYy6HhYWEXlRb2HvWg8=
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
Subject: [PATCH v2 4/5] rust: add I/O port abstractions with resource management
Date: Mon, 13 Jan 2025 13:16:19 +0100
Message-ID: <20250113121620.21598-5-me@kloenk.dev>
In-Reply-To: <20250113121620.21598-1-me@kloenk.dev>
References: <20250113121620.21598-1-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces abstractions for working with I/O port resources,
including the `Resource` and `Region` types. These abstractions facilitate
interaction with `ioport_resource`, enabling safe management of resource
reservations and memory accesses.

Additionally, helper functions such as `outb`, `outw`, and `outl` have been
provided to write values to these resources, with matching read functions
such as `inb`, `inw`, and `inl` for accessing the port memory.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
 rust/helpers/helpers.c |   1 +
 rust/helpers/ioport.c  |  42 ++++++++++
 rust/kernel/ioport.rs  | 169 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   2 +
 4 files changed, 214 insertions(+)
 create mode 100644 rust/helpers/ioport.c
 create mode 100644 rust/kernel/ioport.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index dcf827a61b52..b40aee82fa0f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -14,6 +14,7 @@
 #include "cred.c"
 #include "err.c"
 #include "fs.c"
+#include "ioport.c"
 #include "jump_label.c"
 #include "kunit.c"
 #include "mutex.c"
diff --git a/rust/helpers/ioport.c b/rust/helpers/ioport.c
new file mode 100644
index 000000000000..d9c9e2093b98
--- /dev/null
+++ b/rust/helpers/ioport.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ioport.h>
+#include <linux/io.h>
+
+struct resource *rust_helper_request_region(resource_size_t start,
+					    resource_size_t n, const char *name)
+{
+	return request_region(start, n, name);
+}
+
+struct resource *rust_helper_request_muxed_region(resource_size_t start,
+						  resource_size_t n,
+						  const char *name)
+{
+	return request_muxed_region(start, n, name);
+}
+
+void rust_helper_release_region(resource_size_t start, resource_size_t n)
+{
+	release_region(start, n);
+}
+
+#define define_rust_helper_out(name, type)                      \
+	void rust_helper_##name(type value, unsigned long addr) \
+	{                                                       \
+		(name)(value, addr);                            \
+	}
+
+define_rust_helper_out(outb, u8);
+define_rust_helper_out(outw, u16);
+define_rust_helper_out(outl, u32);
+
+#define define_rust_helper_in(name, type)           \
+	type rust_helper_##name(unsigned long addr) \
+	{                                           \
+		return (name)(addr);                \
+	}
+
+define_rust_helper_in(inb, u8);
+define_rust_helper_in(inw, u16);
+define_rust_helper_in(inl, u32);
diff --git a/rust/kernel/ioport.rs b/rust/kernel/ioport.rs
new file mode 100644
index 000000000000..9bc342cb4663
--- /dev/null
+++ b/rust/kernel/ioport.rs
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions of routines for detecting, reserving and
+//! allocating system resources.
+//!
+//! C header: [`include/linux/ioport.h`](srctree/include/linux/ioport.h)
+
+use core::ops::Deref;
+use core::ptr;
+
+use crate::prelude::*;
+use crate::types::Opaque;
+
+/// Resource Size type.
+/// This is a type alias to `u64`
+/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.
+#[cfg(CONFIG_PHYS_ADDR_T_64BIT)]
+pub type ResourceSize = u64;
+
+/// Resource Size type.
+/// This is a type alias to `u32`
+/// depending on the config option `CONFIG_PHYS_ADDR_T_64BIT`.
+#[cfg(not(CONFIG_PHYS_ADDR_T_64BIT))]
+pub type ResourceSize = u32;
+
+/// Resource node.
+#[repr(transparent)]
+pub struct Resource(Opaque<bindings::resource>);
+
+impl Resource {
+    /// Convert a raw C `struct resource` pointer to a `&'a Resource`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is valid, non-null.
+    pub unsafe fn as_ref<'a>(ptr: *mut bindings::resource) -> &'a Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Return raw pointer to the resource.
+    pub fn as_raw(&self) -> *mut bindings::resource {
+        self.0.get()
+    }
+
+    /// Get name of the resource.
+    pub fn name(&self) -> &CStr {
+        // SAFETY: self.get is valid and of type `bindings::resource`
+        let name_ptr = unsafe { ptr::read(ptr::addr_of!((*self.as_raw()).name)) };
+        // SAFETY: `name_ptr` is a valid char pointer from the resource
+        unsafe { CStr::from_char_ptr(name_ptr) }
+    }
+
+    /// Get the start of the [`Resource`].
+    #[inline]
+    pub fn start(&self) -> ResourceSize {
+        // SAFETY: self.get is valid and of type `bindings::resource`
+        unsafe { ptr::read(ptr::addr_of!((*self.as_raw()).start)) }
+    }
+
+    /// Get the end of the [`Resource`].
+    #[inline]
+    pub fn end(&self) -> ResourceSize {
+        // SAFETY: self.get is valid and of type `bindings::resource`
+        unsafe { ptr::read(ptr::addr_of!((*self.as_raw()).start)) }
+    }
+
+    /// Get the length of the Resource.
+    // Empty resource (len = 0) does not make any sense.`
+    #[allow(clippy::len_without_is_empty)]
+    pub fn len(&self) -> ResourceSize {
+        self.end() - self.start() + 1
+    }
+}
+
+/// Requested region using `request_region`. This will release the region when dropped.
+///
+/// This uses port memory from the `ioport_resource` parent resource.
+pub struct Region<'name>(&'name Resource);
+
+impl<'name> Region<'name> {
+    /// Request a new muxed region from the `ioport_resource` region.
+    #[inline]
+    pub fn request_muxed(start: ResourceSize, n: ResourceSize, name: &'name CStr) -> Option<Self> {
+        // SAFETY: C ffi call. `name` is valid for lifetime of `Self`
+        unsafe { Self::from_resource(bindings::request_muxed_region(start, n, name.as_char_ptr())) }
+    }
+
+    /// Request a new region from the `ioport_resource` region.
+    #[inline]
+    pub fn request(start: ResourceSize, n: ResourceSize, name: &'name CStr) -> Option<Self> {
+        // SAFETY: C ffi call. `name` is valid for lifetime of `Self`
+        unsafe { Self::from_resource(bindings::request_region(start, n, name.as_char_ptr())) }
+    }
+
+    /// Get a resource pointer and return a resource if the pointer is non-null.
+    ///
+    /// Helper for `request` and `request_muxed`.
+    ///
+    /// # Safety
+    ///
+    /// `resource` has to be a valid or null pointer to a resource.
+    unsafe fn from_resource(resource: *mut bindings::resource) -> Option<Self> {
+        if resource.is_null() {
+            None
+        } else {
+            // SAFETY: resource is a valid resource by the function requirements and non-null.
+            Some(Self(unsafe { Resource::as_ref(resource) }))
+        }
+    }
+}
+
+macro_rules! define_out {
+    ($name:ident => $type:ty) => {
+	#[doc = concat!("Write [`", stringify!($type), "`] value into port memory region at the given offset.")]
+	pub fn $name(&self, value: $type, offset: ResourceSize) {
+	    let address = self.start() + offset;
+	    debug_assert!((address + (core::mem::size_of::<$type>() as ResourceSize)) <= (self.end() + 1));
+	    // SAFETY: ffi call, address is in the region
+	    unsafe { bindings::$name(value, address) };
+	}
+    };
+    ($($name:ident => $type:ty;)*) => {
+	$(define_out! { $name => $type })*
+    };
+}
+
+macro_rules! define_in {
+    ($name:ident => $type:ty) => {
+	#[doc = concat!("Read [`", stringify!($type), "`] value from port memory region at the given offset.")]
+	pub fn $name(&self, offset: ResourceSize) -> $type {
+	    let address = self.start() + offset;
+	    debug_assert!((address + (core::mem::size_of::<$type>() as ResourceSize)) <= (self.end() + 1));
+	    // SAFETY: ffi call, address is in the region
+	    unsafe { bindings::$name(address) }
+	}
+    };
+    ($($name:ident => $type:ty;)*) => {
+	$(define_in! { $name => $type })*
+    };
+}
+
+impl Region<'_> {
+    define_out! {
+        outb => u8;
+        outw => u16;
+        outl => u32;
+    }
+    define_in! {
+        inb => u8;
+        inw => u16;
+        inl => u32;
+    }
+}
+
+impl Drop for Region<'_> {
+    fn drop(&mut self) {
+        // SAFETY: ffi call, resource is valid.
+        unsafe { bindings::release_region(self.start(), self.len()) };
+    }
+}
+
+impl Deref for Region<'_> {
+    type Target = Resource;
+
+    fn deref(&self) -> &Self::Target {
+        self.0
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 8895a1683f82..99cd706c40e7 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -43,6 +43,8 @@
 pub mod fs;
 pub mod init;
 pub mod ioctl;
+#[cfg(CONFIG_HAS_IOPORT)]
+pub mod ioport;
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
-- 
2.47.0


