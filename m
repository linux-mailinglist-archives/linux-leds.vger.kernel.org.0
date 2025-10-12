Return-Path: <linux-leds+bounces-5738-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E18BD07BB
	for <lists+linux-leds@lfdr.de>; Sun, 12 Oct 2025 18:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 87CA94F15CD
	for <lists+linux-leds@lfdr.de>; Sun, 12 Oct 2025 16:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3045328F935;
	Sun, 12 Oct 2025 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbiXILGd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559882ECD3F;
	Sun, 12 Oct 2025 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286421; cv=none; b=nZN8pmmX4uybrwY3Y3Tzm9ByNTjpOaik47/nEcrbNgULCdpCl9u3tNc0U2pJjTiCItlN1C7ohWlrIR/fosoreY6nd9QWoLBmGV5izT8uoESonJiiLIBxSYDC/TBoyi4+gZKhAGE01TjgMlfasMHXA4D48i+9dGtVKuJ7aXGiERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286421; c=relaxed/simple;
	bh=HHLlazyWrs3xJ8OR9sGj0YwRDI8+jLqgm9ufarBqtJ0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=a0w0sUhBL1Gfx9GH1zOgDxPZx77uZF4Ad6eXC1p9BbhhFPRaMDzjGy09Vc1KEvFVMW4h5NCXvmNPMl0Z/Z5Dv8rLkcN85wh2lqywdhBzdpbWuCYBjPtv3933A0cI6iE3pgHh+UuCLSVyM+oY7zTy5e25PqVRyzlKDj56a4QAtwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbiXILGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5F0C4CEE7;
	Sun, 12 Oct 2025 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760286420;
	bh=HHLlazyWrs3xJ8OR9sGj0YwRDI8+jLqgm9ufarBqtJ0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=cbiXILGdwQ0UXa6xKEmiXppdP2ARW7WhIuQfLS6VUemYLD5EC74bJF9LSPZqlm/O6
	 ZLQWkT7fTBJkdzF1EdU2OuSTPy0dBCVDoSVpIJDFG/MZwgPU0teCuz3Us6EUUZ/OCA
	 kMFJP0dONe5FgCalKZUruRVJBKZWQf9eHLNinT4CNnLRca1lMPojksj/fb7GHrHtkx
	 jkusM2vhI9v72rHJAd/jzSCQfpF/J+v+gPBaU/rTt9smsE45V1L8a8jdpmZkPA68w1
	 ALnMGGTNowgZr7v0T1jMQX4EcM3tiv/EoG5o80OC7FtEIxWafCaEApX7LirwPCumHX
	 jegde9H11kiBA==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Oct 2025 18:26:54 +0200
Message-Id: <DDGHGF4XOJQG.2MVGBMPK0KUQE@kernel.org>
Cc: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] rust: add basic Pin<Vec<T, A>> abstractions
From: "Benno Lossin" <lossin@kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Lee Jones" <lee@kernel.org>, "Pavel Machek"
 <pavel@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251012145221.172116-1-markus.probst@posteo.de>
 <20251012145221.172116-2-markus.probst@posteo.de>
In-Reply-To: <20251012145221.172116-2-markus.probst@posteo.de>

On Sun Oct 12, 2025 at 4:52 PM CEST, Markus Probst wrote:
> @@ -109,6 +111,21 @@ pub struct Vec<T, A: Allocator> {
>      _p: PhantomData<A>,
>  }
> =20
> +/// Extension for Pin<Vec<T, A>>
> +pub trait PinnedVecExt<T> {

Why is this an extension trait? Couldn't we directly implement this on
`Vec<T>` with `self: Pin<&mut Self>`?

---
Cheers,
Benno

> +    /// Pin-initializes P and appends it to the back of the [`Vec`] inst=
ance without reallocating.
> +    fn push_pin_init<E: From<PushError<P>>, P: PinInit<T, E>>(&mut self,=
 init: P) -> Result<(), E>;
> +
> +    /// Shortens the vector, setting the length to `len` and drops the r=
emoved values.
> +    /// If `len` is greater than or equal to the current length, this do=
es nothing.
> +    ///
> +    /// This has no effect on the capacity and will not allocate.
> +    fn truncate(&mut self, len: usize);
> +
> +    /// Removes the last element from a vector and drops it returning tr=
ue, or false if it is empty.
> +    fn pop(&mut self) -> bool;
> +}
> +
>  /// Type alias for [`Vec`] with a [`Kmalloc`] allocator.
>  ///
>  /// # Examples

