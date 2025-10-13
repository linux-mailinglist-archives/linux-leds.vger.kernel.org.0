Return-Path: <linux-leds+bounces-5745-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AABBD1EA4
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 10:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C1074ED408
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 08:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A784D2EB845;
	Mon, 13 Oct 2025 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPdDqU93"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFB42EB5DE;
	Mon, 13 Oct 2025 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342605; cv=none; b=oluZb7QUx5XoPc4k3P9N1ytOn3NySpEVmp/Hp64IOcQrHFL6AgWrImlZRvkzM0ZgD2VljlYL/v10GuNsiNHA5yW9s1SyOiyZjrF9+Ci21q9NY2fYzw6126JuRK1zzcVpRVn6C8ztNPDzC3i1MBLUnvwffxQRwkC7m+NNGaau/u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342605; c=relaxed/simple;
	bh=ISWExC7c0gJhdjKh1DPstfuLbXdo32wmETxjLgp8ZEI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=R3qwRUs+uTRrWc/a6BHEt+aUqrDNynC2jFVNQObp151n/u7Khw2pdL80ntFIRnghc8yredpIFAz3NZWOD/STmwidrR6HDhvOkzSJKgQS6xSgkb2VZFP392x32KSf9/OLm5RQj85LI27WRmd9DffYc5bObIfedeeILunLbvqYSHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPdDqU93; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D47CC4CEE7;
	Mon, 13 Oct 2025 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760342605;
	bh=ISWExC7c0gJhdjKh1DPstfuLbXdo32wmETxjLgp8ZEI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=IPdDqU93073rsE9vYZBYQbpyqGXzgcIpqxtOdjbcrjxUPOuzfJK7j10HS2D1MCa5t
	 ZCc+euuF56yqBB0I8ewzluqRw1Yx1Ohck8x1oT1vVhJIzwD3DLhVSycHvzeGcbuyVh
	 94UwD3VseQYs6yZ2VWSezmxhkXjFc+PeUaq8wBd21AK6HpogawnaAns2+JMAYEn57l
	 gpJqgQbemVdVTeAp0Aks3f48+Ql26Zv45Hr4Dtxz4G5zba7++sgg7HVd+9M8rqKDjp
	 NVdt6jgYClmt2C/PADywSFvdIqboQ5A2MlDs+D187vVYlFZu9O6IcKtgvi0LzQ6zLf
	 XF2Wpyhw8LB6Q==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 10:03:19 +0200
Message-Id: <DDH1DE35H7L0.1Z2R655P701HR@kernel.org>
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
 <DDGNXV9KS3RS.2WHS4OOYM6DOP@kernel.org>
 <2a31fcd045582382987c8c1da7c4b7d58a1dff61.camel@posteo.de>
In-Reply-To: <2a31fcd045582382987c8c1da7c4b7d58a1dff61.camel@posteo.de>

On Mon Oct 13, 2025 at 12:11 AM CEST, Markus Probst wrote:
> On Sun, 2025-10-12 at 23:31 +0200, Benno Lossin wrote:
>> On Sun Oct 12, 2025 at 6:57 PM CEST, Markus Probst wrote:
>> > From what I can tell, there is no way to get a `Pin<&mut Vec<T,
>> > A>>`
>> > from a `&mut Pin<Vec<T, A>>`. We can only get `Pin<&mut [T]>` which
>> > is
>> > not usable in our case.
>>=20
>> Hmm yeah that's true.
>>=20
>> > If there is way, without the extension trait or an extra struct, I
>> > would be happy to implement it.
>>=20
>> So I tried to look for the usage site of this and I found this usage
>> in
>> your v1:
>>=20
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut l=
eds =3D KPinnedVec::with_capacity(
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Atmega1608LedAddress::VALUES.len() *
>> Atmega1608LedId::VALUES.len(),
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 GFP_KERNEL,
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )?;
>> =C2=A0=C2=A0=C2=A0 +
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut i=
 =3D 0;
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for addr =
in Atmega1608LedAddress::VALUES {
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 let mode_lock =3D Arc::pin_init(new_mutex!(()),
>> GFP_KERNEL)?;
>> =C2=A0=C2=A0=C2=A0 +
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 for id in Atmega1608LedId::VALUES {
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let Some(child) =3D
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> fwnode.get_child_by_name(&CString::try_from_fmt(fmt!("led@{i}"))?)
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else {
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0 +
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let client =3D ARef::clone(&client)=
;
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mode_lock =3D Arc::clone(&mode_=
lock);
>> =C2=A0=C2=A0=C2=A0 +
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 leds.push_pin_init(LedClassDev::new=
(
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some(idev),
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 None,
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LedInitData=
::new().fwnode(&child),
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Atmega1608L=
ed {
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 addr,
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 id,
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 client,
>> =C2=A0=C2=A0=C2=A0 +
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mode_lock,
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ))?;
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i +=3D 1;
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(KBox::=
new(Self { client, leds }, GFP_KERNEL)?.into())
>>=20
>> And I think using `Vec` for this is just wrong. `Vec` is a data
>> structure that supports growing and shrinking the allocation. But you
>> just need a fixed size buffer that holds all your data. Do you think
>> that `Pin<Box<[LedClassDev]>>` would suffice if it had proper support
>> from pin-init?
> As you can see in v1, the number of leds (or vec entries) depends on
> the fwnode (see the continue statement there). I don't think that
> counts as fixed size. `Pin<KBox<[Option<LedClassDev>]>>` could
> potentially be used instead of `Pin<KVec<LedClassDev>>` in my scenario,
> but that would require an extra byte of allocation for the max leds of
> 24 each and the code would look more ugly. At the point I use Option in
> the slice, its basically an unoptimized Vec (instead of storing the
> length, it stores if an item in the buffer is present or not).

You can just make the length of the slice be the desired length? (also,
`i` is never incremented in the `continue` case, so it will act like a
`break`?)

One option that we have would be storing the initializers in a vec:

    fn probe(
        pdev: &I2cClient<kernel::device::Core>,
        _id_info: Option<&Self::IdInfo>,
    ) -> Result<Pin<KBox<Self>>> {
        let idev =3D pdev.as_ref();
   =20
        let Some(fwnode) =3D idev.fwnode() else {
            return Err(EINVAL);
        };
   =20
        let client: ARef<I2cClient> =3D pdev.into();
   =20
        client
            .write_byte_data(1, 0)
            .inspect_err(|err| dev_err!(idev, "unable to remove led mask: {=
err:?}\n"))?;
   =20
        let mut led_init =3D KVec::new();
   =20
        let mut i =3D 0;
        for addr in Atmega1608LedAddress::VALUES {
            let mode_lock =3D Arc::pin_init(new_mutex!(()), GFP_KERNEL)?;
   =20
            for id in Atmega1608LedId::VALUES {
                let Some(child) =3D
                    fwnode.get_child_by_name(&CString::try_from_fmt(fmt!("l=
ed@{i}"))?)
                else {
                    continue;
                };
   =20
                let client =3D ARef::clone(&client);
                let mode_lock =3D Arc::clone(&mode_lock);
   =20
                led_init.push(LedClassDev::new(
                    Some(idev),
                    None,
                    LedInitData::new().fwnode(&child),
                    Atmega1608Led {
                        addr,
                        id,
                        client,
                        mode_lock,
                    },
                ))?;
                i +=3D 1;
            }
        }
        let leds =3D Vec::pin_init_slice(led_init, GFP_KERNEL)?;
        Ok(KBox::new(Self { client, leds }, GFP_KERNEL)?.into())
    }

And `Vec::pin_init_slice` would have the following signature:

    fn pin_init_slice<T, I, E>(this: Vec<I>, flags: alloc::Flags) -> Result=
<Pin<Box<[T]>>>
    where
        I: PinInit<T, E>,
        Error: From<E>;

---
Cheers,
Benno

>
>>=20
>> Also, please don't top-post [1] and take a look at your mail client
>> configuration, it puts lots of extra `> ` at the end which looks
>> pretty
>> strange [2].
> Yes, I did notice that. It is not present when writing a reply, but
> after it got sent for some reason (most replies, not all). It is GNOME
> Evolution in its default settings basically. My distro ships a 4 months
> outdated version (3.56.2), which shouldn't be too old, but I will
> investiage.
>
> Thanks
> - Markus Probst
>>=20
>> [1]:
>> https://docs.kernel.org/process/submitting-patches.html#use-trimmed-inte=
rleaved-replies-in-email-discussions
>> [2]:
>> https://lore.kernel.org/all/e550b0862e9ea87e50688d1ec8f623638d170a3a.cam=
el@posteo.de
>>=20
>> ---
>> Cheers,
>> Benno

