Return-Path: <linux-leds+bounces-5764-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F9BD3BA3
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 16:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFFB04FB1FD
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 14:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80ED25A642;
	Mon, 13 Oct 2025 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNrFiN1A"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8E212DDA1;
	Mon, 13 Oct 2025 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366831; cv=none; b=dnB6Lh6B6jQhSdJX0dcq8NTe5I/TRm2V9aZ6zu/VRLdN6VPilIByVA8MpWxRfm5/f/mrzNkIDlklLZZdkNs6XMLirmbHeR8E524WpdAM7JBAhYwckGdxLvgks6lp81FPelewUsDoTUdFTfkNGmiwwRgQt8kPTRba0QrXaOb/nYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366831; c=relaxed/simple;
	bh=UszqnfPExzN/pXDJzghixK2YWh4rh+o850/Us1oA9dw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=soG3d5Cn9iKj4K8gQlJosrSUGiNfCz154HUjVViWOvlRKI4xSOJuJjoUui0ijBXQTI+kWlWQ2Td0h9rxZclYAZ5viLXTTMTdE6Zb89UR5Vv91bdmS7AX8yYuD22DtueIXvVNIAjXDjanTg8W1MXn5BiRy44bpH8CIRNZLT+IN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNrFiN1A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B802AC4CEE7;
	Mon, 13 Oct 2025 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760366831;
	bh=UszqnfPExzN/pXDJzghixK2YWh4rh+o850/Us1oA9dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNrFiN1AEOx+bZoxRfYZiZX1EMEvEqOA655+X++QtbuICKYQoQx73zLPiJyHbPYqh
	 fYTpl4Q1GU/d/f/Q0nwHrV4yCqYlfogaKsLCNphTW6bajntgUqOXeybgv09Z5trv1y
	 8acIr9SzOceKudAYWhziAHQNN6sOKART3DEdH9AulyQh3i1ZOStHIFdUTxhct4Iiwt
	 eVMB0Z1X7NYRtTVq9xZKzT2a/uyBerMGPHtfx4pDEpfEo+4PnjbG52uggioJukCRxz
	 5D4HAZepf4NyEWSfMJDIZgxLqEcC3Ar9Et/N7n9rvmAoAGLYP9+EVt2CX1ce86R12b
	 Cer6ifyem1Idg==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 16:47:05 +0200
Message-Id: <DDH9YJEJVF3V.I1SQK1WZ775R@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Lee Jones" <lee@kernel.org>, "Pavel Machek"
 <pavel@kernel.org>
Cc: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] rust: add basic Pin<Vec<T, A>> abstractions
X-Mailer: aerc 0.21.0
References: <20251012145221.172116-1-markus.probst@posteo.de>
 <20251012145221.172116-2-markus.probst@posteo.de>
 <DDGHGF4XOJQG.2MVGBMPK0KUQE@kernel.org>
 <e550b0862e9ea87e50688d1ec8f623638d170a3a.camel@posteo.de>
 <DDGNXV9KS3RS.2WHS4OOYM6DOP@kernel.org>
 <2a31fcd045582382987c8c1da7c4b7d58a1dff61.camel@posteo.de>
 <DDH1DE35H7L0.1Z2R655P701HR@kernel.org>
 <4bfba51907578cc0f4f25368240720f4148a2736.camel@posteo.de>
In-Reply-To: <4bfba51907578cc0f4f25368240720f4148a2736.camel@posteo.de>

On Mon Oct 13, 2025 at 3:43 PM CEST, Markus Probst wrote:
> On Mon, 2025-10-13 at 10:03 +0200, Benno Lossin wrote:
>> On Mon Oct 13, 2025 at 12:11 AM CEST, Markus Probst wrote:
>> > On Sun, 2025-10-12 at 23:31 +0200, Benno Lossin wrote:
>> > > On Sun Oct 12, 2025 at 6:57 PM CEST, Markus Probst wrote:
>> > > > From what I can tell, there is no way to get a `Pin<&mut Vec<T,
>> > > > A>>`
>> > > > from a `&mut Pin<Vec<T, A>>`. We can only get `Pin<&mut [T]>`
>> > > > which
>> > > > is
>> > > > not usable in our case.
>> > >=20
>> > > Hmm yeah that's true.
>> > >=20
>> > > > If there is way, without the extension trait or an extra
>> > > > struct, I
>> > > > would be happy to implement it.
>> > >=20
>> > > So I tried to look for the usage site of this and I found this
>> > > usage
>> > > in
>> > > your v1:
>> > >=20
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let m=
ut leds =3D KPinnedVec::with_capacity(
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Atmega1608LedAddress::VALUES.len() *
>> > > Atmega1608LedId::VALUES.len(),
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 GFP_KERNEL,
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )?;
>> > > =C2=A0=C2=A0=C2=A0 +
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let m=
ut i =3D 0;
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for a=
ddr in Atmega1608LedAddress::VALUES {
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 let mode_lock =3D Arc::pin_init(new_mutex!(()),
>> > > GFP_KERNEL)?;
>> > > =C2=A0=C2=A0=C2=A0 +
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 for id in Atmega1608LedId::VALUES {
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let Some(child) =3D
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> > > fwnode.get_child_by_name(&CString::try_from_fmt(fmt!("led@{i}"))?
>> > > )
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else {
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue=
;
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> > > =C2=A0=C2=A0=C2=A0 +
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let client =3D ARef::clone(&clie=
nt);
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mode_lock =3D Arc::clone(&mo=
de_lock);
>> > > =C2=A0=C2=A0=C2=A0 +
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 leds.push_pin_init(LedClassDev::=
new(
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some(ide=
v),
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 None,
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LedInitD=
ata::new().fwnode(&child),
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Atmega16=
08Led {
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 addr,
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 id,
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 client,
>> > > =C2=A0=C2=A0=C2=A0 +
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mode_lock,
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ))?;
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i +=3D 1;
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(KB=
ox::new(Self { client, leds },
>> > > GFP_KERNEL)?.into())
>> > >=20
>> > > And I think using `Vec` for this is just wrong. `Vec` is a data
>> > > structure that supports growing and shrinking the allocation. But
>> > > you
>> > > just need a fixed size buffer that holds all your data. Do you
>> > > think
>> > > that `Pin<Box<[LedClassDev]>>` would suffice if it had proper
>> > > support
>> > > from pin-init?
>> > As you can see in v1, the number of leds (or vec entries) depends
>> > on
>> > the fwnode (see the continue statement there). I don't think that
>> > counts as fixed size. `Pin<KBox<[Option<LedClassDev>]>>` could
>> > potentially be used instead of `Pin<KVec<LedClassDev>>` in my
>> > scenario,
>> > but that would require an extra byte of allocation for the max leds
>> > of
>> > 24 each and the code would look more ugly. At the point I use
>> > Option in
>> > the slice, its basically an unoptimized Vec (instead of storing the
>> > length, it stores if an item in the buffer is present or not).
>>=20
>> You can just make the length of the slice be the desired length?
> That would work, but creates another allocation on the heap (Vec<I>)
> that could have been avoided. I don't think it would make `Pin<Vec<T,
> A>>` obsolete.
>
> Or would you rather say, such allocations don't matter?

No, but you're already allocating once per inner loop invocation, the
`CString::try_from_fmt` function allocates :)

I don't know the kind of application that you're writing, does
performance matter? If yes, then just run your benchmark suite on both
versions and look at the difference. If you don't have a benchmark
suite, then perf probably isn't important enough.

Also if you really want to avoid the allocation, then you probably could
first query the length and store only that in a local var and then
create the initializers on-demand. But then again to query that you're
creating a string every loop iteration, which allocates :)

>> (also,
>> `i` is never incremented in the `continue` case, so it will act like
>> a
>> `break`?)
> You just found a bug in v1.

:)

> Thanks
> - Markus Probst
>
> [1] https://docs.rs/arrayvec/latest/arrayvec/struct.ArrayString.html

Did you forget to put a reference to this?

---
Cheers,
Benno

