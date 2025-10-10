Return-Path: <linux-leds+bounces-5720-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3357DBCCC85
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 13:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26FA319E638C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 11:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB1F285C8B;
	Fri, 10 Oct 2025 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJ6N+oDz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5668C2820B2
	for <linux-leds@vger.kernel.org>; Fri, 10 Oct 2025 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760096007; cv=none; b=V1nEBUu0Vty1wUmfRe2rBQFTwycKfsNudl5r1hm62FgR8t6zXLyfZm7vOHs9+TZhYMzK5nItLn1A6/m+6ELKA/B+ieaiprk5/XrdThtYyGZnX7Ee00P/hHipQMzaNp7DHQFUS6vwzKtjM+hPp7esXklkDHwm41I69UQVVT1lrEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760096007; c=relaxed/simple;
	bh=r3zKZRotjPWQlgOeKsaLGYW9tbVEWlL8OkX4yQy1Ci0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UB3/0zsrzDm8qktqJefb1d3BO69iJc0naZUP1hqVOb4SHoG+P7hsJSk/hNkM9d65hyEaxLokw7LK/1vDY0kU7YVmSkfid/W0VZxw7MGRp6BHrEDNs1SVSIsGkPKN0Lzv9aCHAlwh6mDres6kmZ10C2gUaquKcdldG9IDY3kfCe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OJ6N+oDz; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-634ad8328fdso2059383a12.0
        for <linux-leds@vger.kernel.org>; Fri, 10 Oct 2025 04:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760096004; x=1760700804; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IH1YDvYsxX3hjWroQNK0cNnu+sMWw/N2vm++yhHs9VI=;
        b=OJ6N+oDz7xYwWz7sl3zhKIPAxZ0OsVSVWmwMPiQoi3yeb11mUi5sOHmzRCLMIUG/s2
         X8ODB6HL7coo7ZQBu5yziWRKmwg+2W2BExSdtywn4wbpPBfaG4kxKPyp64OX5aHdWSUT
         edJ3bQ8QBdS5TqiW5yAsk8StZqTM0GXOloths6BPBEzGrkjNwLpC3fY+J09yEFotYbRz
         6z9dwwVCdQepVHKmlexWXOnjwl345Kw4mrZjPtBg4b7k/3DenufI+iT4V1bu/G0TEeBq
         czlIL+nptFvt38jqzgnnCDLgoYKDs0pGgdhPFnDpSG1akQO1CM/yWwpMGdvgmWuQ5U9c
         epKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760096004; x=1760700804;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IH1YDvYsxX3hjWroQNK0cNnu+sMWw/N2vm++yhHs9VI=;
        b=CIL4+KWWfoi89Pmg3tOzdeT4DHgvZlb93LhYQrTRH52V0wQLFQyQzQoKszEvsgS7Hr
         +Q3MWGKe6dOHPuN4+Kv5QCtVbYr5WezjaMbAXjCovh1tr56uULKj7ADnnjYBY1v+B6yI
         /mdpxHW9TQT9gU5iK+OXA7yKX04O4MTRE/ehXaYC+tnAKSzpPz0/G3WgBmBFCWM9/bgV
         T8jTx+HZavLgpP244nO+/YWk6SNdsBD7IwLeMymndJ/cBkQhPVE7jS3LVMK9tjiVOwUN
         HVHnh/T0BEyO4kyuNBAAR9sP9BP2Wmveq65hxGQTQmgMex72FlB5K7hXyV0AckuAnhU8
         ulQw==
X-Forwarded-Encrypted: i=1; AJvYcCVmlu5ae6i2Nj1rC75F2Pj7QETvBKtTKy0b2hdk7yiUZ3qZL2C3oHCNCuCLTQBt0at9WlPHBAT+xi4L@vger.kernel.org
X-Gm-Message-State: AOJu0YxSeJFKCOi/F2gDq4kj4hee48xUO8Paa4glXgQZxNurXaPKdZhW
	8pghlxnXyJCn3c7VKktOzhMeA3xSYd18lCJiICHoxXmHee1HE7Iv6UpvggKYC5/GUBzs7BW+ocl
	ERHq/hVqK0i3RxdDlxA==
X-Google-Smtp-Source: AGHT+IFV6v++ooPwo8zgY/r4GJHECl9wGwude+Hat/aZ5a07QvQNNKNLo0YbYD1Zbr62UXM08XqQmvhtFgNoZlY=
X-Received: from edbio4-n1.prod.google.com ([2002:a05:6402:2184:10b0:62d:a09d:445f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3483:b0:63a:50e:e828 with SMTP id 4fb4d7f45d1cf-63a050eee43mr4613252a12.35.1760096003647;
 Fri, 10 Oct 2025 04:33:23 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:33:22 +0000
In-Reply-To: <20251009181203.248471-2-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251009181203.248471-1-markus.probst@posteo.de> <20251009181203.248471-2-markus.probst@posteo.de>
Message-ID: <aOjvAozHB8T2PZbm@google.com>
Subject: Re: [PATCH v2 1/2] rust: add basic Pin<Vec<T, A>> abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 09, 2025 at 06:12:33PM +0000, Markus Probst wrote:
> Implement core Pin<Vec<T, A>> abstractions, including
>  * `Vec::pin` and `Vec::into_pin` for constructing a `Pin<Vec<T, A>>`.
>    If T does not implement `Unpin`, its values will never be moved.
>  * an extension for `Pin<Vec<T, A>>` allowing PinInit to be initialied on a
>    Pin<Vec>, as well as truncating and popping values from the Vec
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  rust/kernel/alloc.rs      |  1 +
>  rust/kernel/alloc/kvec.rs | 86 +++++++++++++++++++++++++++++++++++++++
>  rust/kernel/prelude.rs    |  2 +-
>  3 files changed, 88 insertions(+), 1 deletion(-)
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
> +    /// Pin-initializes P and appends it to the back of the [`Vec`] instance without reallocating.
> +    fn push_pin_init<E: From<PushError<P>>, P: PinInit<T, E>>(&mut self, init: P) -> Result<(), E>;
> +
> +    /// Shortens the vector, setting the length to `len` and drops the removed values.
> +    /// If `len` is greater than or equal to the current length, this does nothing.
> +    ///
> +    /// This has no effect on the capacity and will not allocate.
> +    fn truncate(&mut self, len: usize);
> +
> +    /// Removes the last element from a vector and drops it returning true, or false if it is empty.
> +    fn pop(&mut self) -> bool;
> +}

Please no extension traits just for this. Just provide `self: Pin<&mut Self>`
methods on Vec.

Alice

