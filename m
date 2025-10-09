Return-Path: <linux-leds+bounces-5698-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A40BC916E
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 14:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4953BC9A6
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 12:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD532DC346;
	Thu,  9 Oct 2025 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="px7rsuKA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F6A19E967;
	Thu,  9 Oct 2025 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013716; cv=none; b=Z9V06rG+eEWZd2YkPK47JC6CdGja1Mxrdva+xESebIFmRRfWE0NAnK7YJXC+ow5IGk8szxZR4MTltGzvqr+UpqzOyKQX6nm77G5kGM9XMCiBub9dabmgX8TGTmDrD7dmwNzN7uxQksYU6y71H8x5PfSl995TNSfDDMztRf4+oSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013716; c=relaxed/simple;
	bh=ThYRaiM1/P/U9DRfd5DuqT2AdjamSnICzMwo8iwj1dY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Hrw3kaPHwecKpBCjHIeILzhPEzqCpkBBY+oGx56XYO9r5bA/OwWi/ouV6lcfmzRja9khil7HO1X13r66/N184SxQ1eiazk0Xyah5ZSH48k/I5rs7t10O+6LcbSeIIRbQXP+exgUvJsRWEeeLTlMsUQbSsuzN7Y8APk4QGUPkyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=px7rsuKA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BCAC4CEE7;
	Thu,  9 Oct 2025 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760013716;
	bh=ThYRaiM1/P/U9DRfd5DuqT2AdjamSnICzMwo8iwj1dY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=px7rsuKA2weU3PF6ofKBjlufluWoXztWZSvGQGxgT0xcALPhzQcFAPUhfxEcqBQLP
	 ic9+JXm+5HM4Hg5kz08NtLwWbZTd9RwAtfTgD3g7eD4GMoPKlQ+otRp0YyYJPthzVA
	 l/lygAKOoPH667ixN6vH1ZFDxZSojevaDa4R1aT9TEURxiaSA4G/ano9twpPBivHtU
	 +oaFvgA2i4i66R8lX3uATZjuzSZbT4eyNxvaaHgd4OVnNaGgCTK92/Z8nplQc/U56j
	 yrJ9vyf0mNZBvu42ebzpwx1fxVMt/YEFpCIptwOi3Uh4InRVDgzIAGPaL2ng2lASy/
	 lrNfZie54AojQ==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 14:41:50 +0200
Message-Id: <DDDSSGI3H08V.1L6YQN2Q5C8TE@kernel.org>
Subject: Re: [PATCH 4/4] leds: add driver for synology atmega1608 controlled
 LEDs
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Igor
 Korotin" <igor.korotin.linux@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <linux-leds@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>, "Alexandre Courbot"
 <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
 <20251008181027.662616-3-markus.probst@posteo.de>
 <20251008181027.662616-4-markus.probst@posteo.de>
 <20251008181027.662616-5-markus.probst@posteo.de>
 <DDDSCBNFRLG9.26UA3ZEOA9LJH@kernel.org>
 <53fd34386cefd4a789c56a6e6d7c5618c06c531b.camel@posteo.de>
In-Reply-To: <53fd34386cefd4a789c56a6e6d7c5618c06c531b.camel@posteo.de>

(Cc: Alex)

On Thu Oct 9, 2025 at 2:30 PM CEST, Markus Probst wrote:
> On Thu, 2025-10-09 at 14:20 +0200, Danilo Krummrich wrote:
>> (Not a full review (let's work out the dependencies first), but
>> there's one
>> thing that stood out to me.)
>>=20
>> On Wed Oct 8, 2025 at 8:10 PM CEST, Markus Probst wrote:
>> > +struct Atmega1608Led {
>> > +=C2=A0=C2=A0=C2=A0 addr: Atmega1608LedAddress,
>> > +=C2=A0=C2=A0=C2=A0 id: Atmega1608LedId,
>> > +
>> > +=C2=A0=C2=A0=C2=A0 client: ARef<I2cClient>,
>> > +
>> > +=C2=A0=C2=A0=C2=A0 mode_lock: Arc<Mutex<()>>,
>>=20
>> Mutex<()> raises an eyebrow, since a mutex that doesn't protect
>> anything is
>> pointless. So, I assume it is protecting some data, but in an unsound
>> way.
>>=20
>> > +impl Atmega1608Led {
>> > +=C2=A0=C2=A0=C2=A0 fn update_mode(&self, mode: Atmega1608LedMode) ->
>> > Result<Atmega1608LedMode> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let _guard =3D self.mode_l=
ock.lock();
>>=20
>> What exactly does the mutex protect in the code below?
> Otherwise there would be a race condition. Each register has 8 bits,
> each led has 2 bits. If the led mode is updated at the same time with
> another one in the same register, it could lead to the first action
> being overwritten by the second.
> Meaning if two actions run at the same time:
> - led0 reads from the register
> - led1 reads from the register
> - led0 writes to the register
> - led1 writes to the register (the changes for led0 have been
> overwritten here, as it did read the register before led0 has written
> to it)

Ok, so you need exclusive access to a register. I think this is something t=
he
register abstraction I also mentioned in [1] could support.

@Alex: Have you thought about this already?

[1] https://lore.kernel.org/rust-for-linux/DDDS2V0V2NVJ.16ZKXCKUA1HUV@kerne=
l.org/

