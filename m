Return-Path: <linux-leds+bounces-5713-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1EBBCA6F0
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 19:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 750A319E4DD8
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 17:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B72223AE87;
	Thu,  9 Oct 2025 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="HI09IMJK"
X-Original-To: linux-leds@vger.kernel.org
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416F1E2614;
	Thu,  9 Oct 2025 17:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760032375; cv=none; b=P0FQ6h+QhIVHE8D/3zwqg1BREVP5p5AUEDPePRkI/3+tc4UdaDpa5rNdIEbWjgjWAOPPbIHrBM1aphIxsqPdNoOn27vUfXFPacUvfWPp3MVpDKOVhP7y+2sKl2uRtoFjQOT+y3SlB7LuU7ExVDEaKxJhUJ7aveXT1HT4q6D0igw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760032375; c=relaxed/simple;
	bh=qtU2rFo8yI3jNIeXdNxhBqMCScYY1yTPc0U4P8t46gM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nzbz/o37tscDXcR/GGzhQwN+GHIvbWI+nJCi9kAK6z+8dOMTSD4gpL6VBqQ14UBAWxmoU4ZbbVB65Vw0KGPR3gHs/lydjoziKVg2naADDrvAt9z8vUBKJ5xqivWD27MgFUD8b9eM/XNI+76XS7vHlytOrnoTRdk4sbIINz6KbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=HI09IMJK; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:942:0:640:e3c0:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id D6FF6815F8;
	Thu, 09 Oct 2025 20:45:12 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 6jO01WfL2a60-nQyH15nE;
	Thu, 09 Oct 2025 20:45:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760031912;
	bh=x7K5fTud9s21pFBlBGR3b/kQuJRZd7zsdo5BIJhLpmo=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=HI09IMJKXD8NPZsFam4A++R5vfUAxnXGjOl9rDNcKrba76BuwmlzQIj+9i7QyQky5
	 bWCTeC3wRYhYAqkAg89YZMpPm7EnexnKw8o0KXbjT5hX+m1h1TtuLvPmB8ZQodeg6X
	 bjjoDMZvIuLCfzxeR1YaaYxZCgjRbQNcLdl8VyAI=
Authentication-Results: mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 9 Oct 2025 20:45:04 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Markus Probst <markus.probst@posteo.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: add basic Pin<Vec<T, A>> abstractions
Message-ID: <20251009204504.6b833fa1@nimda.home>
In-Reply-To: <20251009170739.235221-2-markus.probst@posteo.de>
References: <20251009170739.235221-1-markus.probst@posteo.de>
	<20251009170739.235221-2-markus.probst@posteo.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 09 Oct 2025 17:07:56 +0000
Markus Probst <markus.probst@posteo.de> wrote:

Hi Markus,

I noticed a few typos in the code comments and the commit descriptions.

> Implement core Pin<Vec<T, A>> abstractions, incluing
>  * `Vec::pin` and `Vec::into_pin` for constructing a `Pin<Vec<T, A>>`.
>    If T does not implement `Unpin`, it values will never be moved.
>  * a extension for `Pin<Vec<T, A>>` allowing PinInit to be initialied
> on a Pin<Vec>, as well as truncating and poping values from the Vec
> 

"incluing" -> "including"
"it values will..." -> "its values will..."
"a extension" -> "an extension"
"initialied" -> "initialized"
"poping values" -> "popping values"

Thanks,
Onur

> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  rust/kernel/alloc.rs      |  1 +
>  rust/kernel/alloc/kvec.rs | 86
> +++++++++++++++++++++++++++++++++++++++ rust/kernel/prelude.rs    |
> 2 +- 3 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index a2c49e5494d3..9c129eaf0625 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -24,6 +24,7 @@
>  pub use self::kvec::KVec;
>  pub use self::kvec::VVec;
>  pub use self::kvec::Vec;
> +pub use self::kvec::PinnedVecExt;
>  
>  /// Indicates an allocation error.
>  #[derive(Copy, Clone, PartialEq, Eq, Debug)]
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 3c72e0bdddb8..d5582a7f17e9 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -16,11 +16,13 @@
>      ops::DerefMut,
>      ops::Index,
>      ops::IndexMut,
> +    pin::Pin,
>      ptr,
>      ptr::NonNull,
>      slice,
>      slice::SliceIndex,
>  };
> +use pin_init::PinInit;
>  
>  mod errors;
>  pub use self::errors::{InsertError, PushError, RemoveError};
> @@ -109,6 +111,21 @@ pub struct Vec<T, A: Allocator> {
>      _p: PhantomData<A>,
>  }
>  
> +/// Extension for Pin<Vec<T, A>>
> +pub trait PinnedVecExt<T> {
> +    /// Pin-initializes P and appends it to the back of the [`Vec`]
> instance without reallocating.
> +    fn push_pin_init<E: From<PushError<P>>, P: PinInit<T, E>>(&mut
> self, init: P) -> Result<(), E>; +
> +    /// Shortens the vector, setting the length to `len` and drops
> the removed values.
> +    /// If `len` is greater than or equal to the current length,
> this does nothing.
> +    ///
> +    /// This has no effect on the capacity and will not allocate.
> +    fn truncate(&mut self, len: usize);
> +
> +    /// Removes the last element from a vector and drops it
> returning true, or false if it is empty.
> +    fn pop(&mut self) -> bool;
> +}
> +
>  /// Type alias for [`Vec`] with a [`Kmalloc`] allocator.
>  ///
>  /// # Examples
> @@ -719,6 +736,18 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut
> T) -> bool) { }
>          self.truncate(num_kept);
>      }
> +
> +    /// Constructs a new `Pin<Vec<T, A>>`.
> +    #[inline]
> +    pub fn pin(capacity: usize, flags: Flags) -> Result<Pin<Self>,
> AllocError> {
> +        Self::with_capacity(capacity, flags).map(Pin::<Self>::from)
> +    }
> +
> +    /// Convert a [`Vec<T,A>`] to a [`Pin<Vec<T,A>>`]. If `T` does
> not implement
> +    /// [`Unpin`], then its values will be pinned in memory and
> can't be moved.
> +    pub fn into_pin(this: Self) -> Pin<Self> {
> +        this.into()
> +    }
>  }
>  
>  impl<T: Clone, A: Allocator> Vec<T, A> {
> @@ -1294,6 +1323,63 @@ fn drop(&mut self) {
>      }
>  }
>  
> +impl<T, A: Allocator> PinnedVecExt<T> for Pin<Vec<T, A>> {
> +    fn truncate(&mut self, len: usize) {
> +        // SAFETY: truncate will not reallocate the Vec
> +        // CAST: Pin<Ptr> is a transparent wrapper of Ptr
> +        unsafe { &mut *core::ptr::from_mut(self).cast::<Vec<T, A>>()
> }.truncate(len);
> +    }
> +
> +    fn push_pin_init<E: From<PushError<P>>, P: PinInit<T, E>>(&mut
> self, init: P) -> Result<(), E> {
> +        // SAFETY: capacity, spare_capacity_mut and inc_len will not
> +        // reallocate the Vec.
> +        // CAST: Pin<Ptr> is a transparent wrapper of Ptr
> +        let this = unsafe { &mut
> *core::ptr::from_mut(self).cast::<Vec<T, A>>() }; +
> +        if this.len() < this.capacity() {
> +            let spare = this.spare_capacity_mut();
> +            // SAFETY: the length is less than the capacity, so
> `spare` is non-empty.
> +            unsafe {
> init.__pinned_init(spare.get_unchecked_mut(0).as_mut_ptr())? };
> +            // SAFETY: We just initialised the first spare entry, so
> it is safe to
> +            // increase the length by 1. We also know that the new
> length is <= capacity.
> +            unsafe { this.inc_len(1) };
> +            Ok(())
> +        } else {
> +            Err(E::from(PushError(init)))
> +        }
> +    }
> +
> +    fn pop(&mut self) -> bool {
> +        if self.is_empty() {
> +            return false;
> +        }
> +
> +        // SAFETY:
> +        // - We just checked that the length is at least one.
> +        // - dec_len will not reallocate the Vec
> +        // CAST: Pin<Ptr> is a transparent wrapper of Ptr
> +        let ptr: *mut [T] = unsafe {
> (*core::ptr::from_mut(self).cast::<Vec<T, A>>()).dec_len(1) }; +
> +        // SAFETY: the contract of `dec_len` guarantees that the
> elements in `ptr` are
> +        // valid elements whose ownership has been transferred to
> the caller.
> +        unsafe { ptr::drop_in_place(ptr) };
> +        true
> +    }
> +}
> +
> +impl<T, A: Allocator> From<Vec<T, A>> for Pin<Vec<T, A>> {
> +    /// Converts a `Vec<T, A>` into a `Pin<Vec<T, A>>`. If `T` does
> not implement [`Unpin`], then
> +    /// every value in v will be pinned in memory and can't be moved.
> +    ///
> +    /// This moves `v` into `Pin` without moving any of the values
> of `v` or allocating and copying
> +    /// any memory.
> +    fn from(v: Vec<T, A>) -> Self {
> +        // SAFETY: The values wrapped inside a `Pin<Vec<T, A>>`
> cannot be moved or replaced as long
> +        // as `T` does not implement `Unpin`.
> +        unsafe { Pin::new_unchecked(v) }
> +    }
> +}
> +
>  #[macros::kunit_tests(rust_kvec_kunit)]
>  mod tests {
>      use super::*;
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index 25fe97aafd02..7179e2ca2a14 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -19,7 +19,7 @@
>      c_ushort, c_void,
>  };
>  
> -pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec,
> VBox, VVec, Vec}; +pub use crate::alloc::{flags::*, Box, KBox, KVBox,
> KVVec, KVec, PinnedVecExt, VBox, VVec, Vec}; 
>  #[doc(no_inline)]
>  pub use macros::{export, kunit_tests, module, vtable};


