Return-Path: <linux-leds+bounces-5675-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E64BC63FE
	for <lists+linux-leds@lfdr.de>; Wed, 08 Oct 2025 20:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B96A034EEA9
	for <lists+linux-leds@lfdr.de>; Wed,  8 Oct 2025 18:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF692C028C;
	Wed,  8 Oct 2025 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="gM1ENKSE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C292C0F79
	for <linux-leds@vger.kernel.org>; Wed,  8 Oct 2025 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947057; cv=none; b=uj7/Jta3U03CJrWnt5donZGoINudhJPSxD6fxZDtP44GOFAU9ssoVQ/renIZC89Jhyq6tZCZqwv/v+NJyn8Jt1+xjuxFEy8m0MgiLyZX+6sKW2o/NWu79+oHdjWreetHU/imE2jZoRTTHAmP0RnAXsGbJbsN8mwB8RFup8NDO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947057; c=relaxed/simple;
	bh=9wHa2NsXWAKtyAdOkdyrbMj3P5LT1P+0xBazNJQx9Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoiXyMyIOYQs/wN7O86LgLp1PoNErULcA8yEKgQHP8FSo35nnQq7XwOvv2aBU+8kLBBHEjhlca9k+NA6yI69bAbvKnQzQRO857MwzluK3Ikk6Y/QdQmCP5DrXpcSCdO5CcSxY88XmZK68ktsdJnjmJ1b/qmg/jU5jGX0jVWoSsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=gM1ENKSE; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 7376F240105
	for <linux-leds@vger.kernel.org>; Wed,  8 Oct 2025 20:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1759947048; bh=XNe1KPk/bBREo5nDOhlFMfiW54nPpt8QW+L/MjqxhEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Autocrypt:OpenPGP:From;
	b=gM1ENKSEHQ/vfUp0cRLc1IO+g2TwjGuAMyu7fEZ6rsz+3VPaKHVPuC7sA9/g3DQ5Y
	 Neeql1f/bBOSaGm12OiMx0viiQ2vhYPy1g0leIe/si4D72lrkzMNuV9ZfCGTI4ntmG
	 Czc6Aj/S7cGGhYnvDWvkhWhGdB1tRCXXrCGObFg8uiCCWzRlwE/CMelJQdfn+1nfyV
	 lNrGwJQvoRJ3FCxX/UFwYsg2S02JTlIxolrUDyUcvzGD0wms7wIjOlCB+DV7qhrrOI
	 6URMBzpJ3kNURVuTzlRdJSe8VVqgADNkmFlaiIufEygoy1hYo7eq2GWIxblmYZDxej
	 3JaZCr0vuimuQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4chgzR65yxz9rxS;
	Wed,  8 Oct 2025 20:10:43 +0200 (CEST)
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
Subject: [PATCH 2/4] rust: add pinned wrapper of Vec
Date: Wed, 08 Oct 2025 18:10:45 +0000
Message-ID: <20251008181027.662616-3-markus.probst@posteo.de>
In-Reply-To: <20251008181027.662616-2-markus.probst@posteo.de>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=xsFNBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93qReNLkO
  WguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVAm76Ww+
  /pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt9k5JA
  RhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbmfAja
  oT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwTjRQ
  xBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1J+
  FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN6
  OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
  8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJC
  XCeMe4BO4iaxUQARAQABzRdtYXJrdXMucHJvYnN0QHBvc3Rlby5kZcLBkQQTAQgAOxYhBIJ0GMT0
  rFjncjDEczR2H/jnrUPSBQJog714AhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEDR2
  H/jnrUPSgdkQAISaTk2D345ehXEkn5z2yUEjaVjHIE7ziqRaOgn/QanCgeTUinIv6L6QXUFvvIfH
  1OLPwQ1hfvEg9NnNLyFezWSy6jvoVBTIPqicD/r3FkithnQ1IDkdSjrarPMxJkvuh3l7XZHo49GV
  HQ8i5zh5w4YISrcEtE99lJisvni2Jqx7we5tey9voQFDyM8jxlSWv3pmoUTCtBkX/eKHJXosgsuS
  B4TGDCVPOjla/emI5c9MhMG7O4WEEmoSdPbmraPw66YZD6uLyhV4DPHbiDWRzXWnClHSyjB9rky9
  lausFxogvu4l9H+KDsXIadNDWdLdu1/enS/wDd9zh5S78rY2jeXaG4mnf4seEKamZ7KQ6FIHrcyP
  ezdDzssPQcTQcGRMQzCn6wP3tlGk7rsfmyHMlFqdRoNNv+ZER/OkmZFPW655zRfbMi0vtrqK2Awm
  9ggobb1oktfd9PPNXMUY+DNVlgR2G7jLnenSoQausLUm0pHoNE8TWFv851Y6SOYnvn488sP1Tki5
  F3rKwclawQFHUXTCQw+QSh9ay8xgnNZfH+u9NY7w3gPoeKBOAFcBc2BtzcgekeWS8qgEmm2/oNFV
  G0ivPQbRx8FjRKbuF7g3YhgNZZ0ac8FneuUtJ2PkSIFTZhaAiC0utvxk0ndmWFiW4acEkMZGrLaM
  L2zWNjrqwsD2zsFNBGiDvXgBEADCXQy1n7wjRxG12DOVADawjghKcG+5LtEf31WftHKLFbp/HArj
  BhkT6mj+CCI1ClqY+FYU5CK/s0ScMfLxRGLZ0Ktzawb78vOgBVFT3yB1yWBTewsAXdqNqRooaUNo
  8cG/NNJLjhccH/7PO/FWX5qftOVUJ/AIsAhKQJ18Tc8Ik73v427EDxuKb9mTAnYQFA3Ev3hAiVbO
  6Rv39amVOfJ8sqwiSUGidj2Fctg2aB5JbeMln0KCUbTD1LhEFepeKypfofAXQbGwaCjAhmkWy/q3
  IT1mUrPxOngbxdRoOx1tGUC0HCMUW1sFaJgQPMmDcR0JGPOpgsKnitsSnN7ShcCr1buel7vLnUMD
  +TAZ5opdoF6HjAvAnBQaijtK6minkrM0seNXnCg0KkV8xhMNa6zCs1rq4GgjNLJue2EmuyHooHA4
  7JMoLVHcxVeuNTp6K2+XRx0Pk4e2Lj8IVy9yEYyrywEOC5XRW37KJjsiOAsumi1rkvM7QREWgUDe
  Xs0+RpxI3QrrANh71fLMRo7LKRF3Gvw13NVCCC9ea20P4PwhgWKStkwO2NO+YJsAoS1QycMi/vKu
  0EHhknYXamaSV50oZzHKmX56vEeJHTcngrM8R1SwJCYopCx9gkz90bTVYlitJa5hloWTYeMD7FNj
  Y6jfVSzgM/K4gMgUNDW/PPGeMwARAQABwsF2BBgBCAAgFiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IF
  AmiDvXgCGwwACgkQNHYf+OetQ9LHDBAAhk+ab8+WrbS/b1/gYW3q1KDiXU719nCtfkUVXKidW5Ec
  Idlr5HGt8ilLoxSWT2Zi368iHCXS0WenGgPwlv8ifvB7TOZiiTDZROZkXjEBmU4nYjJ7GymawpWv
  oQwjMsPuq6ysbzWtOZ7eILx7cI0FjQeJ/Q2baRJub0uAZNwBOxCkAS6lpk5Fntd2u8CWmDQo4SYp
  xeuQ+pwkp0yEP30RhN2BO2DXiBEGSZSYh+ioGbCHQPIV3iVj0h6lcCPOqopZqyeCfigeacBI0nvN
  jHWz/spzF3+4OS+3RJvoHtAQmProxyGib8iVsTxgZO3UUi4TSODeEt0i0kHSPY4sCciOyXfAyYoD
  DFqhRjOEwBBxhr+scU4C1T2AflozvDwq3VSONjrKJUkhd8+WsdXxMdPFgBQuiKKwUy11mz6KQfcR
  wmDehF3UaUoxa+YIhWPbKmycxuX/D8SvnqavzAeAL1OcRbEI/HsoroVlEFbBRNBZLJUlnTPs8ZcU
  4+8rq5YX1GUrJL3jf6SAfSgO7UdkEET3PdcKFYtS+ruV1Cp5V0q4kCfI5jk25iiz8grM2wOzVSsc
  l1mEkhiEPH87HP0whhb544iioSnumd3HJKL7dzhRegsMizatupp8D65A2JziW0WKopa1iw9fti3A
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

Implement a wrapper of Vec that guarantees that its content will never be
moved, unless the item implements Unpin, allowing PinInit to be
initialized on the Vec.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 rust/kernel/alloc/kvec.rs | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3c72e0bdddb8..3576929b2e12 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -21,6 +21,7 @@
     slice,
     slice::SliceIndex,
 };
+use pin_init::PinInit;
 
 mod errors;
 pub use self::errors::{InsertError, PushError, RemoveError};
@@ -109,6 +110,11 @@ pub struct Vec<T, A: Allocator> {
     _p: PhantomData<A>,
 }
 
+/// A pinned wrapper of the [`Vec`] type.
+///
+/// It is guaranteed that the contents will never be moved, unless T implements Unpin.
+pub struct PinnedVec<T, A: Allocator>(Vec<T, A>);
+
 /// Type alias for [`Vec`] with a [`Kmalloc`] allocator.
 ///
 /// # Examples
@@ -121,6 +127,8 @@ pub struct Vec<T, A: Allocator> {
 /// # Ok::<(), Error>(())
 /// ```
 pub type KVec<T> = Vec<T, Kmalloc>;
+/// Type alias for [`PinnedVec`] with a [`Kmalloc`] allocator.
+pub type KPinnedVec<T> = PinnedVec<T, Kmalloc>;
 
 /// Type alias for [`Vec`] with a [`Vmalloc`] allocator.
 ///
@@ -134,6 +142,8 @@ pub struct Vec<T, A: Allocator> {
 /// # Ok::<(), Error>(())
 /// ```
 pub type VVec<T> = Vec<T, Vmalloc>;
+/// Type alias for [`PinnedVec`] with a [`Vmalloc`] allocator.
+pub type VPinnedVec<T> = PinnedVec<T, Vmalloc>;
 
 /// Type alias for [`Vec`] with a [`KVmalloc`] allocator.
 ///
@@ -147,6 +157,8 @@ pub struct Vec<T, A: Allocator> {
 /// # Ok::<(), Error>(())
 /// ```
 pub type KVVec<T> = Vec<T, KVmalloc>;
+/// Type alias for [`PinnedVec`] with a [`KVmalloc`] allocator.
+pub type KVPinnedVec<T> = PinnedVec<T, KVmalloc>;
 
 // SAFETY: `Vec` is `Send` if `T` is `Send` because `Vec` owns its elements.
 unsafe impl<T, A> Send for Vec<T, A>
@@ -1294,6 +1306,80 @@ fn drop(&mut self) {
     }
 }
 
+impl<T, A: Allocator> PinnedVec<T, A> {
+    /// Creates a new [`PinnedVec`] instance with at least the given capacity.
+    pub fn with_capacity(capacity: usize, flags: Flags) -> Result<Self, AllocError> {
+        Vec::with_capacity(capacity, flags).map(Self)
+    }
+
+    /// Shortens the vector, setting the length to `len` and drops the removed values.
+    /// If `len` is greater than or equal to the current length, this does nothing.
+    ///
+    /// This has no effect on the capacity and will not allocate.
+    pub fn truncate(&mut self, len: usize) {
+        self.0.truncate(len);
+    }
+
+    /// Pin-initializes P and appends it to the back of the [`Vec`] instance without reallocating.
+    pub fn push_pin_init<E, P: PinInit<T, E>>(&mut self, init: P) -> Result<(), E>
+    where
+        E: From<PushError<P>>,
+    {
+        if self.0.len() < self.0.capacity() {
+            let spare = self.0.spare_capacity_mut();
+            // SAFETY: the length is less than the capacity, so `spare` is non-empty.
+            unsafe { init.__pinned_init(spare.get_unchecked_mut(0).as_mut_ptr())? };
+            // SAFETY: We just initialised the first spare entry, so it is safe to
+            // increase the length by 1. We also know that the new length is <= capacity.
+            unsafe { self.0.inc_len(1) };
+            Ok(())
+        } else {
+            Err(E::from(PushError(init)))
+        }
+    }
+
+    /// Removes the last element from a vector and drops it returning true, or false if it is empty.
+    pub fn pop(&mut self) -> bool {
+        if self.is_empty() {
+            return false;
+        }
+
+        // SAFETY: We just checked that the length is at least one.
+        let ptr: *mut [T] = unsafe { self.0.dec_len(1) };
+
+        // SAFETY: the contract of `dec_len` guarantees that the elements in `ptr` are
+        // valid elements whose ownership has been transferred to the caller.
+        unsafe { ptr::drop_in_place(ptr) };
+        true
+    }
+}
+
+impl<T, A: Allocator> Deref for PinnedVec<T, A> {
+    type Target = Vec<T, A>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl<T: Unpin, A: Allocator> DerefMut for PinnedVec<T, A> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.0
+    }
+}
+
+impl<T, A: Allocator> From<Vec<T, A>> for PinnedVec<T, A> {
+    fn from(value: Vec<T, A>) -> Self {
+        Self(value)
+    }
+}
+
+impl<T: Unpin, A: Allocator> From<PinnedVec<T, A>> for Vec<T, A> {
+    fn from(value: PinnedVec<T, A>) -> Self {
+        value.0
+    }
+}
+
 #[macros::kunit_tests(rust_kvec_kunit)]
 mod tests {
     use super::*;
-- 
2.49.1


