Return-Path: <linux-leds+bounces-5728-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1DDBCE971
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 23:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DEA84F48AE
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 21:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633D53016E3;
	Fri, 10 Oct 2025 21:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="gA8RxDlW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797A2ED860
	for <linux-leds@vger.kernel.org>; Fri, 10 Oct 2025 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130858; cv=none; b=XqL3iYGnU97byX1ofd/YgcPssYrlfsoDIXFWkowc2675LHGfqNZnIcq/fx7+MQfujWwefwWAEq4MbnSD/9h79zy//MZ0ZqKK64LKZg8JdnG/RE66N2e6saPVsmoc2jPCalBVtxahXQHyZX9Gzdog95q/6GKkbO47EE35Er0otbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130858; c=relaxed/simple;
	bh=tBXWf+kYSdFQSa6c+ZkdKlqIQPsi02XHseYQ0sNDpk4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jfALKhx0MBIWRVejyGLyKUqFIulgwvkRwzy5zS3BXnwEZRCoRv6tKRVaG+W07IxteWKtIzop4N2yJ7F4OYJbcUmqE2xA5GaxRc/apqEjIuo6WAnjkAdcw/jWjDlNjJ2e6yArNow8ikPDm9HVqN38c2FOTwmx4qjX6qIRGNV54YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=gA8RxDlW; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A5F04240101
	for <linux-leds@vger.kernel.org>; Fri, 10 Oct 2025 23:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760130848; bh=tBXWf+kYSdFQSa6c+ZkdKlqIQPsi02XHseYQ0sNDpk4=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Autocrypt:OpenPGP:From;
	b=gA8RxDlWhko5kmY6cjAUyfVJTF/YvN77uC/nJYnKmHXUaRcGVcduaYp3C6K2TJAM0
	 T0Xa3l1HCEeDUguCkqAFAU5VhWnep1yzRmpreAmu8rEXXYxcyei8QMwmjo85G2sEn1
	 aXOZRl1sKs6dOjnG5A4sCFQdbAovidsFvxdx6Uaw2rbnckM8SKSNFDPpxGlm4O8i8k
	 nmNDikGfQ6xepQ6BknRQO+KBfNIF1e2ESeq557/LW17VbEZ5rYZMNOE9YGgaOYfwyf
	 E8A6wPCF2vLjlJOuQP1vKHukJQG/zk0aixGz1gsR0DPItazYqyLYKbdS2am+ijROsn
	 vhCRacYuTDmYw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cjzy63dCcz9rxW;
	Fri, 10 Oct 2025 23:14:06 +0200 (CEST)
Message-ID: <b3a2617eda71a4a4ca0e0181afc26a33d42b1ba9.camel@posteo.de>
Subject: Re: [PATCH v2 1/2] rust: add basic Pin<Vec<T, A>> abstractions
From: Markus Probst <markus.probst@posteo.de>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"	
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Boqun Feng	
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com,  Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Date: Fri, 10 Oct 2025 21:14:07 +0000
In-Reply-To: <aOjvAozHB8T2PZbm@google.com>
References: <20251009181203.248471-1-markus.probst@posteo.de>
	 <20251009181203.248471-2-markus.probst@posteo.de>
	 <aOjvAozHB8T2PZbm@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

I might be wrong here, but as far as I know, it is not possible to get
a `Pin<&mut Vec<T, A>>` from a `&mut Pin<Vec<T, A>>`, only a `&mut
Pin<&mut [T, A]>` which is not usable by any of these methods.

Thanks
- Markus Probst

On Fri, 2025-10-10 at 11:33 +0000, Alice Ryhl wrote:
> On Thu, Oct 09, 2025 at 06:12:33PM +0000, Markus Probst wrote:
> > Implement core Pin<Vec<T, A>> abstractions, including
> > =C2=A0* `Vec::pin` and `Vec::into_pin` for constructing a `Pin<Vec<T,
> > A>>`.
> > =C2=A0=C2=A0 If T does not implement `Unpin`, its values will never be =
moved.
> > =C2=A0* an extension for `Pin<Vec<T, A>>` allowing PinInit to be
> > initialied on a
> > =C2=A0=C2=A0 Pin<Vec>, as well as truncating and popping values from th=
e Vec
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> > =C2=A0rust/kernel/alloc.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0rust/kernel/alloc/kvec.rs | 86
> > +++++++++++++++++++++++++++++++++++++++
> > =C2=A0rust/kernel/prelude.rs=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A03 files changed, 88 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> > index a2c49e5494d3..9c129eaf0625 100644
> > --- a/rust/kernel/alloc.rs
> > +++ b/rust/kernel/alloc.rs
> > @@ -24,6 +24,7 @@
> > =C2=A0pub use self::kvec::KVec;
> > =C2=A0pub use self::kvec::VVec;
> > =C2=A0pub use self::kvec::Vec;
> > +pub use self::kvec::PinnedVecExt;
> > =C2=A0
> > =C2=A0/// Indicates an allocation error.
> > =C2=A0#[derive(Copy, Clone, PartialEq, Eq, Debug)]
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index 3c72e0bdddb8..d5582a7f17e9 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -16,11 +16,13 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0 ops::DerefMut,
> > =C2=A0=C2=A0=C2=A0=C2=A0 ops::Index,
> > =C2=A0=C2=A0=C2=A0=C2=A0 ops::IndexMut,
> > +=C2=A0=C2=A0=C2=A0 pin::Pin,
> > =C2=A0=C2=A0=C2=A0=C2=A0 ptr,
> > =C2=A0=C2=A0=C2=A0=C2=A0 ptr::NonNull,
> > =C2=A0=C2=A0=C2=A0=C2=A0 slice,
> > =C2=A0=C2=A0=C2=A0=C2=A0 slice::SliceIndex,
> > =C2=A0};
> > +use pin_init::PinInit;
> > =C2=A0
> > =C2=A0mod errors;
> > =C2=A0pub use self::errors::{InsertError, PushError, RemoveError};
> > @@ -109,6 +111,21 @@ pub struct Vec<T, A: Allocator> {
> > =C2=A0=C2=A0=C2=A0=C2=A0 _p: PhantomData<A>,
> > =C2=A0}
> > =C2=A0
> > +/// Extension for Pin<Vec<T, A>>
> > +pub trait PinnedVecExt<T> {
> > +=C2=A0=C2=A0=C2=A0 /// Pin-initializes P and appends it to the back of=
 the
> > [`Vec`] instance without reallocating.
> > +=C2=A0=C2=A0=C2=A0 fn push_pin_init<E: From<PushError<P>>, P: PinInit<=
T, E>>(&mut
> > self, init: P) -> Result<(), E>;
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Shortens the vector, setting the length to `len=
` and drops
> > the removed values.
> > +=C2=A0=C2=A0=C2=A0 /// If `len` is greater than or equal to the curren=
t length,
> > this does nothing.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// This has no effect on the capacity and will not=
 allocate.
> > +=C2=A0=C2=A0=C2=A0 fn truncate(&mut self, len: usize);
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Removes the last element from a vector and drop=
s it
> > returning true, or false if it is empty.
> > +=C2=A0=C2=A0=C2=A0 fn pop(&mut self) -> bool;
> > +}
>=20
> Please no extension traits just for this. Just provide `self:
> Pin<&mut Self>`
> methods on Vec.
>=20
> Alice

