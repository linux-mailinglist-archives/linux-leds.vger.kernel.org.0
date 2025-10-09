Return-Path: <linux-leds+bounces-5695-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A14BC8FBB
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 14:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C49A1881E22
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 12:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F39D2C2364;
	Thu,  9 Oct 2025 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRwwgTm0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64CC155C88;
	Thu,  9 Oct 2025 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012452; cv=none; b=PHGXFhX3qeiQVjUFMMaVGMGzrl9O6H54OHKj4yUMN8SToflFe9p9oyNz4eyLlPPuVEM7r0WvCnz1gp7Bu3e5LrQ//GtW7YJA40EXlRlrgeMJvUuhvVymRWDXL/Yo56vbyQxdDslY7du0iJ92eVVJDbEILEU/DOxbajLvJrq8Ch4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012452; c=relaxed/simple;
	bh=352bQYtSmF2wZFrnOjhn2+1NCdjiIvXYcTVAA+gJcoo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Il6ZQwk1wEM+PZECQr4Thvq1xaJzMW/K1wGS7OKBQCqefxFQRodT1crHmRruuJCR7ADGba3DgfmMuSU/I/TBnm5QinEyI8w7QGWEUNceUA3qE0ps9rZIUapyNEWiB07R0eZZsmi6iQb6tEW2AA57aSN5CqlWsghMSCwQqLP+G9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRwwgTm0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E24EC4CEE7;
	Thu,  9 Oct 2025 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760012451;
	bh=352bQYtSmF2wZFrnOjhn2+1NCdjiIvXYcTVAA+gJcoo=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=TRwwgTm0HhQDaLXtpcTc9zr6WjDsCZeuYUF1Vv2pmp5h4+N3GwZXp85qL8XhEjI7a
	 u54noCl4LgF+q00ThZz3fooLbVj/cnr6f3xo4blMxqmm+PchmSJ3YDu1II6mPpb56u
	 Rvm5MF3NEHDF7cANDHyLxvnOy8bXviRpzWaKCLrxTbeeqkyUAVNRWTR1gUsBXSEmQE
	 tWKCL6yoWeV/TyqZmWVHC7/spY9fMNaLpUIPja8Iniku4OQwtg1FU6yc5dE57UKBNB
	 MBV9PfKGYZJhPxa/E7zB/6izYmY89MuEAkw4dEXsK8PoBQq4GoWcNZqRJQNAyS+B4G
	 RpjyuF8HQbfng==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 14:20:45 +0200
Message-Id: <DDDSCBNFRLG9.26UA3ZEOA9LJH@kernel.org>
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
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 4/4] leds: add driver for synology atmega1608 controlled
 LEDs
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
 <20251008181027.662616-3-markus.probst@posteo.de>
 <20251008181027.662616-4-markus.probst@posteo.de>
 <20251008181027.662616-5-markus.probst@posteo.de>
In-Reply-To: <20251008181027.662616-5-markus.probst@posteo.de>

(Not a full review (let's work out the dependencies first), but there's one
thing that stood out to me.)

On Wed Oct 8, 2025 at 8:10 PM CEST, Markus Probst wrote:
> +struct Atmega1608Led {
> +    addr: Atmega1608LedAddress,
> +    id: Atmega1608LedId,
> +
> +    client: ARef<I2cClient>,
> +
> +    mode_lock: Arc<Mutex<()>>,

Mutex<()> raises an eyebrow, since a mutex that doesn't protect anything is
pointless. So, I assume it is protecting some data, but in an unsound way.

> +impl Atmega1608Led {
> +    fn update_mode(&self, mode: Atmega1608LedMode) -> Result<Atmega1608L=
edMode> {
> +        let _guard =3D self.mode_lock.lock();

What exactly does the mutex protect in the code below?

> +
> +        let mut current =3D self
> +            .client
> +            .read_byte_data(self.addr as u8)
> +            .inspect_err(|err| {
> +                dev_err!(
> +                    self.client.as_ref(),
> +                    "failed to read {:#2x}: {err:?}\n",
> +                    self.addr as u8
> +                );
> +            })?;
> +
> +        current =3D
> +            (current & !self.id.mask()) | (((mode as u8) << self.id.shif=
t()) & self.id.mask());
> +
> +        self.client
> +            .write_byte_data(self.addr as u8, current)
> +            .inspect_err(|err| {
> +                dev_err!(
> +                    self.client.as_ref(),
> +                    "failed to write {:#2x}: {err:?}",
> +                    self.addr as u8
> +                );
> +            })?;
> +
> +        Ok(mode)
> +    }
> +}

