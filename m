Return-Path: <linux-leds+bounces-5730-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B923BBCEBA8
	for <lists+linux-leds@lfdr.de>; Sat, 11 Oct 2025 00:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC46B19A2AD9
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 22:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E688427A12C;
	Fri, 10 Oct 2025 22:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Ok8jKUB2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91992798EA
	for <linux-leds@vger.kernel.org>; Fri, 10 Oct 2025 22:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760136840; cv=none; b=T2zlRXK0CUIeumDhJNQ8i8bg+2og54vLTtRHOw9KMnNNxrIrjKqeKEmaMUbLkgpuvg/Y+wJ2vWQJlTcOjj5Bx02gb0PDznqk5odH7P3TLcEcLoAzearu7jB2R6sVckF7nOCCBFC2fz8+/g8NM8hEZ+nqAA9DMDWHJY1a7CIsHfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760136840; c=relaxed/simple;
	bh=SRZeeT6WFfS7qF3NEqWnJkw4ui14/yghSMrEf3tuOVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIa/2xcwUkjYMOhRBNgPNOdcQjk3igOchSZ8FMyX7Ha7w5yBl0cPmxcYknWpzlxTCYEtfzuBqUk8OUzn8zIhcwdSfnxPBPz7vzT26VZ/ZhKpUB+TG1kkxuG48MvdlXKBpBTRQLaayheVhufNoOOEONYciHFbRNsyqkWTH5h0izk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Ok8jKUB2; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 476A6240105
	for <linux-leds@vger.kernel.org>; Sat, 11 Oct 2025 00:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760136836; bh=5lmAtN9vcxTOzyOK6mDVeCukdU4Nwkr6xfJNm9/RsLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Autocrypt:OpenPGP:From;
	b=Ok8jKUB2FsXczelBZNf7aouKEK8utpt/u07MdkGH6y/05erLWhsfpkRFh8wieigtE
	 4tvLZyiwts+rpLnHSCTuXaLuHJHOGp2LAIQUiL7pnQv8xYkpkXaZhTEaiLMq2lXsvp
	 qT0AM9feQowOli5BoGRJrIqOt0WpJABUlPuH3pZaeiUEfr5dg0cL7YXs/51SgVQEyG
	 RgdaqyrLEGVPG/8s6ByKwoGDPaoDLu52NuraAFy0GeFch/UlQhoOkbC4YyCCEN/RYq
	 GjnHdNMkbNigJa0e+l9mnbn6X/zpFhGrW+flW58WZ7f5wsx9Og3lqRsIz+adorg+yR
	 mvOFf/B8iQczg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ck29G4Jwfz6txY;
	Sat, 11 Oct 2025 00:53:54 +0200 (CEST)
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
Subject: [PATCH v3 1/2] rust: add basic Pin<Vec<T, A>> abstractions
Date: Fri, 10 Oct 2025 22:53:55 +0000
Message-ID: <20251010225349.734350-2-markus.probst@posteo.de>
In-Reply-To: <20251010225349.734350-1-markus.probst@posteo.de>
References: <20251010225349.734350-1-markus.probst@posteo.de>
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

Implement core Pin<Vec<T, A>> abstractions, including
 * `Vec::pin` and `Vec::into_pin` for constructing a `Pin<Vec<T, A>>`.
   If T does not implement `Unpin`, its values will never be moved.
 * an extension for `Pin<Vec<T, A>>` allowing PinInit to be initialied on a
   Pin<Vec>, as well as truncating and popping values from the Vec

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/alloc.rs      |  1 +
 rust/kernel/alloc/kvec.rs | 86 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/prelude.rs    |  2 +-
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index a2c49e5494d3..d1a1200fc1bd 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -22,6 +22,7 @@
 pub use self::kvec::IntoIter;
 pub use self::kvec::KVVec;
 pub use self::kvec::KVec;
+pub use self::kvec::PinnedVecExt;
 pub use self::kvec::VVec;
 pub use self::kvec::Vec;
 
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3c72e0bdddb8..d5582a7f17e9 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -16,11 +16,13 @@
     ops::DerefMut,
     ops::Index,
     ops::IndexMut,
+    pin::Pin,
     ptr,
     ptr::NonNull,
     slice,
     slice::SliceIndex,
 };
+use pin_init::PinInit;
 
 mod errors;
 pub use self::errors::{InsertError, PushError, RemoveError};
@@ -109,6 +111,21 @@ pub struct Vec<T, A: Allocator> {
     _p: PhantomData<A>,
 }
 
+/// Extension for Pin<Vec<T, A>>
+pub trait PinnedVecExt<T> {
+    /// Pin-initializes P and appends it to the back of the [`Vec`] instance without reallocating.
+    fn push_pin_init<E: From<PushError<P>>, P: PinInit<T, E>>(&mut self, init: P) -> Result<(), E>;
+
+    /// Shortens the vector, setting the length to `len` and drops the removed values.
+    /// If `len` is greater than or equal to the current length, this does nothing.
+    ///
+    /// This has no effect on the capacity and will not allocate.
+    fn truncate(&mut self, len: usize);
+
+    /// Removes the last element from a vector and drops it returning true, or false if it is empty.
+    fn pop(&mut self) -> bool;
+}
+
 /// Type alias for [`Vec`] with a [`Kmalloc`] allocator.
 ///
 /// # Examples
@@ -719,6 +736,18 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
         }
         self.truncate(num_kept);
     }
+
+    /// Constructs a new `Pin<Vec<T, A>>`.
+    #[inline]
+    pub fn pin(capacity: usize, flags: Flags) -> Result<Pin<Self>, AllocError> {
+        Self::with_capacity(capacity, flags).map(Pin::<Self>::from)
+    }
+
+    /// Convert a [`Vec<T,A>`] to a [`Pin<Vec<T,A>>`]. If `T` does not implement
+    /// [`Unpin`], then its values will be pinned in memory and can't be moved.
+    pub fn into_pin(this: Self) -> Pin<Self> {
+        this.into()
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
@@ -1294,6 +1323,63 @@ fn drop(&mut self) {
     }
 }
 
+impl<T, A: Allocator> PinnedVecExt<T> for Pin<Vec<T, A>> {
+    fn truncate(&mut self, len: usize) {
+        // SAFETY: truncate will not reallocate the Vec
+        // CAST: Pin<Ptr> is a transparent wrapper of Ptr
+        unsafe { &mut *core::ptr::from_mut(self).cast::<Vec<T, A>>() }.truncate(len);
+    }
+
+    fn push_pin_init<E: From<PushError<P>>, P: PinInit<T, E>>(&mut self, init: P) -> Result<(), E> {
+        // SAFETY: capacity, spare_capacity_mut and inc_len will not
+        // reallocate the Vec.
+        // CAST: Pin<Ptr> is a transparent wrapper of Ptr
+        let this = unsafe { &mut *core::ptr::from_mut(self).cast::<Vec<T, A>>() };
+
+        if this.len() < this.capacity() {
+            let spare = this.spare_capacity_mut();
+            // SAFETY: the length is less than the capacity, so `spare` is non-empty.
+            unsafe { init.__pinned_init(spare.get_unchecked_mut(0).as_mut_ptr())? };
+            // SAFETY: We just initialised the first spare entry, so it is safe to
+            // increase the length by 1. We also know that the new length is <= capacity.
+            unsafe { this.inc_len(1) };
+            Ok(())
+        } else {
+            Err(E::from(PushError(init)))
+        }
+    }
+
+    fn pop(&mut self) -> bool {
+        if self.is_empty() {
+            return false;
+        }
+
+        // SAFETY:
+        // - We just checked that the length is at least one.
+        // - dec_len will not reallocate the Vec
+        // CAST: Pin<Ptr> is a transparent wrapper of Ptr
+        let ptr: *mut [T] = unsafe { (*core::ptr::from_mut(self).cast::<Vec<T, A>>()).dec_len(1) };
+
+        // SAFETY: the contract of `dec_len` guarantees that the elements in `ptr` are
+        // valid elements whose ownership has been transferred to the caller.
+        unsafe { ptr::drop_in_place(ptr) };
+        true
+    }
+}
+
+impl<T, A: Allocator> From<Vec<T, A>> for Pin<Vec<T, A>> {
+    /// Converts a `Vec<T, A>` into a `Pin<Vec<T, A>>`. If `T` does not implement [`Unpin`], then
+    /// every value in v will be pinned in memory and can't be moved.
+    ///
+    /// This moves `v` into `Pin` without moving any of the values of `v` or allocating and copying
+    /// any memory.
+    fn from(v: Vec<T, A>) -> Self {
+        // SAFETY: The values wrapped inside a `Pin<Vec<T, A>>` cannot be moved or replaced as long
+        // as `T` does not implement `Unpin`.
+        unsafe { Pin::new_unchecked(v) }
+    }
+}
+
 #[macros::kunit_tests(rust_kvec_kunit)]
 mod tests {
     use super::*;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 25fe97aafd02..7179e2ca2a14 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -19,7 +19,7 @@
     c_ushort, c_void,
 };
 
-pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, VBox, VVec, Vec};
+pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, PinnedVecExt, VBox, VVec, Vec};
 
 #[doc(no_inline)]
 pub use macros::{export, kunit_tests, module, vtable};
-- 
2.49.1


