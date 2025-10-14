Return-Path: <linux-leds+bounces-5782-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D803ABDA246
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 16:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 832D0188850C
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 14:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FD92FF64C;
	Tue, 14 Oct 2025 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="O4XD0DHQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F232701C4
	for <linux-leds@vger.kernel.org>; Tue, 14 Oct 2025 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453207; cv=none; b=t8NhYU+Inp/L7pRrUtlPqnpJu8mXzzBQO/T5atP7IET3bnYQ03g6UsbXSpr9FAVctr8tEGvE9ODF/IO5Ip0OPjB1sb46SpSdK65uWko3YmOqIHqeYIetDhvabKUnK8x8bKOeeqJN0Ju+ndDCT7eVtMx2odsi0pFZJdo1EBTo2S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453207; c=relaxed/simple;
	bh=mQD076zqipwjL0zhWvp4jYIm/DeAQnP22lZJv1kJu3s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=so889swK1AktDssIvixdOg5XOJclU+YG+OBczyzKHkQeLCGi829JWmANyUNenQKlzZVx9+sdQmb2ivvxkNf5M4g9rtIEqIfDWqAhGprNxKCl4e0kJyvi3y1bMJFAIWm8uPeg3j/MR1REgSpMaxA+5JTsoWxUQuuSyyVa2JsaDCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=O4XD0DHQ; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 474F5240028
	for <linux-leds@vger.kernel.org>; Tue, 14 Oct 2025 16:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760453203; bh=mQD076zqipwjL0zhWvp4jYIm/DeAQnP22lZJv1kJu3s=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Autocrypt:OpenPGP:From;
	b=O4XD0DHQilBK/3qihxb2hOZfYSUf2PAIBMQhQSdzIO7p6S8RbDwG5cC9Wi5ciTEv3
	 wf1jpPQ6CJftIE7ixYsUUJaKGxNY+oCOZ1yR6Yx1vrFIDz+Px7nJETOsF81O5L2iGJ
	 JFZX7+omfWzT4bsE8bvWmVf0dOM67c7aVJFHRQa8mXYSsmokN/bYa+3bPF/LURGgdM
	 tXVhv7x0MFu31iO62TeQ4OGM0VbU+MBJgOj6R9pJuiPgENqqgBYOQpYZE3bv/DVDF2
	 HGrZzPX6eZ7jjv3hBglpNhvkH8HyIoHBd89gWrUDrD6vOldZxK5UBTql/I4eYwTdGZ
	 Ti/PrMlIIftUw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cmH9D2NQyz6v1l;
	Tue, 14 Oct 2025 16:46:40 +0200 (CEST)
Message-ID: <d3e51448678bf5a94746cc34825c35073c02d00e.camel@posteo.de>
Subject: Re: [PATCH v4 2/2] rust: leds: add basic led classdev abstractions
From: Markus Probst <markus.probst@posteo.de>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Lorenzo
 Stoakes	 <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki
 <urezki@gmail.com>, Boqun Feng	 <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, bjorn3_gh@protonmail.com,  Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, 	rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-leds@vger.kernel.org
Date: Tue, 14 Oct 2025 14:46:42 +0000
In-Reply-To: <DDHGUQ9B4J2K.X1VXMMU6O5O4@kernel.org>
References: <20251012145221.172116-1-markus.probst@posteo.de>
	 <20251012145221.172116-3-markus.probst@posteo.de>
	 <aO1GM4WXs37Zpm0G@google.com> <DDHGUQ9B4J2K.X1VXMMU6O5O4@kernel.org>
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

On Mon, 2025-10-13 at 22:11 +0200, Danilo Krummrich wrote:
> On Mon Oct 13, 2025 at 8:34 PM CEST, Alice Ryhl wrote:
> > On Sun, Oct 12, 2025 at 02:52:39PM +0000, Markus Probst wrote:
> > > Implement the core abstractions needed for led class devices,
> > > including:
> > >=20
> > > * `led::LedOps` - the trait for handling leds, including
> > > =C2=A0 `brightness_set`, `brightness_get` and `blink_set`
> > >=20
> > > * `led::InitData` - data set for the led class device
> > >=20
> > > * `led::Device` - a safe wrapper around `led_classdev`
> > >=20
> > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> >=20
> > > +pub trait LedOps: Send + 'static + Sized {
> > > +=C2=A0=C2=A0=C2=A0 /// If set true, [`LedOps::brightness_set`] and
> > > [`LedOps::blink_set`] must not sleep
> > > +=C2=A0=C2=A0=C2=A0 /// and perform the operation immediately.
> > > +=C2=A0=C2=A0=C2=A0 const BLOCKING: bool;
> > > +=C2=A0=C2=A0=C2=A0 /// The max brightness level
> > > +=C2=A0=C2=A0=C2=A0 const MAX_BRIGHTNESS: u32;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /// Sets the brightness level.
> > > +=C2=A0=C2=A0=C2=A0 ///
> > > +=C2=A0=C2=A0=C2=A0 /// See also [`LedOps::BLOCKING`]
> > > +=C2=A0=C2=A0=C2=A0 fn brightness_set(&self, brightness: u32) -> Resu=
lt<()>;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /// Gets the current brightness level.
> > > +=C2=A0=C2=A0=C2=A0 fn brightness_get(&self) -> u32 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_error!(VTABLE_DEFAU=
LT_ERROR)
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /// Activates hardware accelerated blinking.
> > > +=C2=A0=C2=A0=C2=A0 ///
> > > +=C2=A0=C2=A0=C2=A0 /// delays are in milliseconds. If both are zero,=
 a sensible
> > > default should be chosen.
> > > +=C2=A0=C2=A0=C2=A0 /// The caller should adjust the timings in that =
case and if
> > > it can't match the values
> > > +=C2=A0=C2=A0=C2=A0 /// specified exactly. Setting the brightness to =
0 will
> > > disable the hardware accelerated
> > > +=C2=A0=C2=A0=C2=A0 /// blinking.
> > > +=C2=A0=C2=A0=C2=A0 ///
> > > +=C2=A0=C2=A0=C2=A0 /// See also [`LedOps::BLOCKING`]
> > > +=C2=A0=C2=A0=C2=A0 fn blink_set(&self, _delay_on: &mut usize, _delay=
_off: &mut
> > > usize) -> Result<()> {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_error!(VTABLE_DEFAU=
LT_ERROR)
> > > +=C2=A0=C2=A0=C2=A0 }
> >=20
> > These functions should probably take a &Device<Bound> argument so
> > that
> > they can use methods that require a bound device (such as IO).
>=20
> Indeed!
>=20
> @Markus: Note that this guarantee is given by the LED device
> registration being
> lifetime controlled by devres, while led_classdev_unregister() is
> synchronized
> against those callbacks.
>=20
> For the latter, please double check that this is actually the case --
> I'm not
> familiar with the LED subsystem, I'm reviewing from driver-core
> perspective. But
> from a quick look it should be the case. :)

There is also the led_classdev->dev device, but I assume you mean the
parent of the led classdev (the one being passed on register)?

Thanks
- Markus Probst

