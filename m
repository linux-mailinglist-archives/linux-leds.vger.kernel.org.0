Return-Path: <linux-leds+bounces-5741-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70FBD0CC2
	for <lists+linux-leds@lfdr.de>; Sun, 12 Oct 2025 23:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142D33B8335
	for <lists+linux-leds@lfdr.de>; Sun, 12 Oct 2025 21:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2956F1F541E;
	Sun, 12 Oct 2025 21:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRK/gecj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE184BE49;
	Sun, 12 Oct 2025 21:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760304715; cv=none; b=fXte267ZGCeM+SMq93xfG+ojNG2y2se38986th61iK2yDHUTSZ04y0vip3eo4UgQuhHIDi1UTNKTAlgbCV5RPiE/6okV3OWT61894UmfJLTZ9Po976DrH69wTQzystz/j7SE0BQUMf3KXM7UmkP0ftggM2e362+t/bHaOTzEoU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760304715; c=relaxed/simple;
	bh=fbT54186VjkUDXY7U0Duys4FLq0KRJ5Rvgvyy7ATokk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Aj/37GZDOWxlsAkottmlPVygRRLBeO4/86OCOGLDissjEFCS+EXpVR7uekpxrMuAIHHXdCPetKxrcCqi6DzcvRDrGau3qruGgId7LJzA6Ui52GxN+kuRPVaMb5Y7YZCvQMUstFd2WpfhDx8weuiRwyM+VzrZQ49n38uAKP5+2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRK/gecj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2182C4CEE7;
	Sun, 12 Oct 2025 21:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760304714;
	bh=fbT54186VjkUDXY7U0Duys4FLq0KRJ5Rvgvyy7ATokk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=qRK/gecj4jZgT2O4KXO7kHAPoJuyPTsWAhNcj2xrDWidsd0MipLtoQIlzXqrMMTjn
	 NdHgtTDLPuzN5DUROu8rCRvFH9QtL3olkf7eDa1OQ0l0JylTPPS5H3S5kki2LR5XI/
	 0FOqJjZEz03OQE0iHU6Ts4O66AjL2hRO6rEjTLS17YzD1ARkbSvNerY18HZNxfb7tZ
	 r/ETOJrF+KAt6j/kmJ2HLFyRuwTPjMcv1ROXJMqJ8wTFsFbWAmwo4JnJSUOI0ei8Ew
	 r9aowFU2FMxS0jj2ccvNOpxVTs9YpUv++PVHQWKOF7uZdSOBj9MpGAGGlp1A4knWY6
	 r2smo/nT/k4PQ==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Oct 2025 23:31:48 +0200
Message-Id: <DDGNXV9KS3RS.2WHS4OOYM6DOP@kernel.org>
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
 <DDGHGF4XOJQG.2MVGBMPK0KUQE@kernel.org>
 <e550b0862e9ea87e50688d1ec8f623638d170a3a.camel@posteo.de>
In-Reply-To: <e550b0862e9ea87e50688d1ec8f623638d170a3a.camel@posteo.de>

On Sun Oct 12, 2025 at 6:57 PM CEST, Markus Probst wrote:
> From what I can tell, there is no way to get a `Pin<&mut Vec<T, A>>`
> from a `&mut Pin<Vec<T, A>>`. We can only get `Pin<&mut [T]>` which is
> not usable in our case.

Hmm yeah that's true.

> If there is way, without the extension trait or an extra struct, I
> would be happy to implement it.

So I tried to look for the usage site of this and I found this usage in
your v1:

    +        let mut leds =3D KPinnedVec::with_capacity(
    +            Atmega1608LedAddress::VALUES.len() * Atmega1608LedId::VALU=
ES.len(),
    +            GFP_KERNEL,
    +        )?;
    +
    +        let mut i =3D 0;
    +        for addr in Atmega1608LedAddress::VALUES {
    +            let mode_lock =3D Arc::pin_init(new_mutex!(()), GFP_KERNEL=
)?;
    +
    +            for id in Atmega1608LedId::VALUES {
    +                let Some(child) =3D
    +                    fwnode.get_child_by_name(&CString::try_from_fmt(fm=
t!("led@{i}"))?)
    +                else {
    +                    continue;
    +                };
    +
    +                let client =3D ARef::clone(&client);
    +                let mode_lock =3D Arc::clone(&mode_lock);
    +
    +                leds.push_pin_init(LedClassDev::new(
    +                    Some(idev),
    +                    None,
    +                    LedInitData::new().fwnode(&child),
    +                    Atmega1608Led {
    +                        addr,
    +                        id,
    +                        client,
    +
    +                        mode_lock,
    +                    },
    +                ))?;
    +                i +=3D 1;
    +            }
    +        }
    +        Ok(KBox::new(Self { client, leds }, GFP_KERNEL)?.into())

And I think using `Vec` for this is just wrong. `Vec` is a data
structure that supports growing and shrinking the allocation. But you
just need a fixed size buffer that holds all your data. Do you think
that `Pin<Box<[LedClassDev]>>` would suffice if it had proper support
from pin-init?

Also, please don't top-post [1] and take a look at your mail client
configuration, it puts lots of extra `> ` at the end which looks pretty
strange [2].

[1]: https://docs.kernel.org/process/submitting-patches.html#use-trimmed-in=
terleaved-replies-in-email-discussions
[2]: https://lore.kernel.org/all/e550b0862e9ea87e50688d1ec8f623638d170a3a.c=
amel@posteo.de

---
Cheers,
Benno

> Thanks
> - Markus Probst
>
> On Sun, 2025-10-12 at 18:26 +0200, Benno Lossin wrote:
>> On Sun Oct 12, 2025 at 4:52 PM CEST, Markus Probst wrote:
>> > @@ -109,6 +111,21 @@ pub struct Vec<T, A: Allocator> {
>> > =C2=A0=C2=A0=C2=A0=C2=A0 _p: PhantomData<A>,
>> > =C2=A0}
>> > =C2=A0
>> > +/// Extension for Pin<Vec<T, A>>
>> > +pub trait PinnedVecExt<T> {
>>=20
>> Why is this an extension trait? Couldn't we directly implement this
>> on
>> `Vec<T>` with `self: Pin<&mut Self>`?
>>=20
>> ---
>> Cheers,
>> Benno
>>=20
>> > +=C2=A0=C2=A0=C2=A0 /// Pin-initializes P and appends it to the back o=
f the
>> > [`Vec`] instance without reallocating.
>> > +=C2=A0=C2=A0=C2=A0 fn push_pin_init<E: From<PushError<P>>, P: PinInit=
<T, E>>(&mut
>> > self, init: P) -> Result<(), E>;
>> > +
>> > +=C2=A0=C2=A0=C2=A0 /// Shortens the vector, setting the length to `le=
n` and drops
>> > the removed values.
>> > +=C2=A0=C2=A0=C2=A0 /// If `len` is greater than or equal to the curre=
nt length,
>> > this does nothing.
>> > +=C2=A0=C2=A0=C2=A0 ///
>> > +=C2=A0=C2=A0=C2=A0 /// This has no effect on the capacity and will no=
t allocate.
>> > +=C2=A0=C2=A0=C2=A0 fn truncate(&mut self, len: usize);
>> > +
>> > +=C2=A0=C2=A0=C2=A0 /// Removes the last element from a vector and dro=
ps it
>> > returning true, or false if it is empty.
>> > +=C2=A0=C2=A0=C2=A0 fn pop(&mut self) -> bool;
>> > +}
>> > +
>> > =C2=A0/// Type alias for [`Vec`] with a [`Kmalloc`] allocator.
>> > =C2=A0///
>> > =C2=A0/// # Examples

