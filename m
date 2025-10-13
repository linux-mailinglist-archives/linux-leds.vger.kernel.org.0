Return-Path: <linux-leds+bounces-5749-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF449BD2543
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 11:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013DA1884032
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCD82FDC3B;
	Mon, 13 Oct 2025 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4fgicOI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42A826290;
	Mon, 13 Oct 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348382; cv=none; b=IWAVyacMYZUxR5oXuFzYsqZMTekQqZlm1KOmXzPustSWtdg2f79oKReRxIT2FZvGBntashcAGbjRDJqflf7Y05ii7WD07c4WieBq6PgKRwQCH+Hsfw+FFLwBysMZzhDW8l6Ar+T7EgpYvu3QHp47kni7L7PMCcZD+oRs7Lh62Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348382; c=relaxed/simple;
	bh=hE0FwrSOKh3dm7K6R9z5HaueZzkmymUbPTbI75tC6Zo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=u9GBdXkY25HiIjAwxZzYxvlNAqtVpBekjkFUv8sOhapJhg0pTA1lSxfD5clcrWV1m4ETGirWNzf4KDenunbhZg/3J293lrf6cc0+xK32Z+hoHMSujuf59wTPaQPsn6275gF5DSOTIbbLxXobY/4IIRjpU9u7dEirtOcGy7zUdJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4fgicOI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F45DC4CEE7;
	Mon, 13 Oct 2025 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760348381;
	bh=hE0FwrSOKh3dm7K6R9z5HaueZzkmymUbPTbI75tC6Zo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=k4fgicOIBKTh7tew1kfCuccFT7HLc0VUfVB9UwM35UMNADRxc4O+y4ITi3kUssZZk
	 8kIK8skSp+uJczWdPSVc8WSHYP5vQWyG11MSPiipKb2nQrm3GGpVrEIEOnNt9lGnsv
	 4rFT053qUc/hKRhu16/a5PqVbpMaiO1EN20HFURgqmhWTTDrm3Y234dzmj/JPtqRuf
	 atUYWnFcMFp08/j4MuL9r9rVNXCA89NLFdAwKfspXPekHxQFGKWqtppp3YFFAgj8yI
	 efwdBLU/tj5NTpMPQhe1/cSlZ0u/b1x/kXkLxv+yb9Q7ArOYvyJPSEmuFzIbKMB55b
	 PdORK07DY4G/w==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 11:39:35 +0200
Message-Id: <DDH3F3QRN81U.2A00K8U33PSKA@kernel.org>
Cc: "Markus Probst" <markus.probst@posteo.de>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Lee Jones" <lee@kernel.org>, "Pavel Machek"
 <pavel@kernel.org>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] rust: add basic Pin<Vec<T, A>> abstractions
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20251012145221.172116-1-markus.probst@posteo.de>
 <20251012145221.172116-2-markus.probst@posteo.de>
 <DDGHGF4XOJQG.2MVGBMPK0KUQE@kernel.org>
 <e550b0862e9ea87e50688d1ec8f623638d170a3a.camel@posteo.de>
 <DDGNXV9KS3RS.2WHS4OOYM6DOP@kernel.org>
 <2a31fcd045582382987c8c1da7c4b7d58a1dff61.camel@posteo.de>
 <DDH1DE35H7L0.1Z2R655P701HR@kernel.org> <aOzEz23fWxHZbvdh@google.com>
In-Reply-To: <aOzEz23fWxHZbvdh@google.com>

On Mon Oct 13, 2025 at 11:22 AM CEST, Alice Ryhl wrote:
> On Mon, Oct 13, 2025 at 10:03:19AM +0200, Benno Lossin wrote:
>> And `Vec::pin_init_slice` would have the following signature:
>>=20
>>     fn pin_init_slice<T, I, E>(this: Vec<I>, flags: alloc::Flags) -> Res=
ult<Pin<Box<[T]>>>
>>     where
>>         I: PinInit<T, E>,
>>         Error: From<E>;
>
> We already have Box::pin_slice().

Oh that's perfect :) I still think that the helper vec function above
would be useful, if we want to use this pattern (collecting initializers
in a vec) more broadly.

---
Cheers,
Benno

