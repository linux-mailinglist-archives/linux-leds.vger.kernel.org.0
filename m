Return-Path: <linux-leds+bounces-5772-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF887BD608D
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 22:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E25534E298C
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 20:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E792DD60F;
	Mon, 13 Oct 2025 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuyrSFDV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DF72DD5EF;
	Mon, 13 Oct 2025 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386280; cv=none; b=GPL13OIGi3fsMMbuqAirFqfFKQ/f9AaTKx/slULB8miRBdkldTuC1vlvfv4WfFJS+IRL4L4HbRMUVEBg/rC7kzq+rq/gBX9kZE/B1d/qARk5fRNGmhk+J7Vow36vN+YKYzG3LcNVIZiCZueO/v08aUXfSOs9Zhxz61saCRgvS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386280; c=relaxed/simple;
	bh=tZQgx2DdMtTPUTPXKKDWr/eIk6lu79PDjdeIsNK+WvU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nMYLMusdEPFxD3Mct6iTrAl9G09kHrl2NgXryIDZH84v0Ru/8di0IYyUyXvBWaOZ9uEnwGoTZGr8Qr2CIw9+be985U+XZke4kLTQ7uW51NlSka4xGsExQ08GrUtInhTJXxu7COVACSGZtnSYeLD26nkYOvgdLpmTtWQ2fbvorZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuyrSFDV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A02C4CEE7;
	Mon, 13 Oct 2025 20:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760386280;
	bh=tZQgx2DdMtTPUTPXKKDWr/eIk6lu79PDjdeIsNK+WvU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=JuyrSFDVR08C3I7iaETbjtr4rGnex91U7WPgT90UTxKS/lveBFlc2Ggt1SL8CWWWZ
	 tcyGovTq4TmBzD6W19wGKrYCBB7KwWwoSoM3x0udKCK3cNmJWvPSeJu8ZlD2ctsvz8
	 PfvH8A8ObdbngpklN2BF5YELuoDLWDh9qPMdrBaFVY6CbOe26EW49UkLBBv7V/ApSJ
	 lJd+df4y5BfrF2mpO5XtmNjxxH2wOSHvklMOUVCq48jLQzMYRQ01w1xf4EcvIwiHcJ
	 GsAm1PlqmqZV8v2GLV0XWYaYxjHd3PTaA1i8itGas3oFQRPMgkoU+8tJ+G3lS9uGjt
	 H2LudypgZno3g==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 22:11:14 +0200
Message-Id: <DDHGUQ9B4J2K.X1VXMMU6O5O4@kernel.org>
Subject: Re: [PATCH v4 2/2] rust: leds: add basic led classdev abstractions
Cc: "Markus Probst" <markus.probst@posteo.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Lee Jones"
 <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-leds@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251012145221.172116-1-markus.probst@posteo.de>
 <20251012145221.172116-3-markus.probst@posteo.de>
 <aO1GM4WXs37Zpm0G@google.com>
In-Reply-To: <aO1GM4WXs37Zpm0G@google.com>

On Mon Oct 13, 2025 at 8:34 PM CEST, Alice Ryhl wrote:
> On Sun, Oct 12, 2025 at 02:52:39PM +0000, Markus Probst wrote:
>> Implement the core abstractions needed for led class devices, including:
>>=20
>> * `led::LedOps` - the trait for handling leds, including
>>   `brightness_set`, `brightness_get` and `blink_set`
>>=20
>> * `led::InitData` - data set for the led class device
>>=20
>> * `led::Device` - a safe wrapper around `led_classdev`
>>=20
>> Signed-off-by: Markus Probst <markus.probst@posteo.de>
>
>> +pub trait LedOps: Send + 'static + Sized {
>> +    /// If set true, [`LedOps::brightness_set`] and [`LedOps::blink_set=
`] must not sleep
>> +    /// and perform the operation immediately.
>> +    const BLOCKING: bool;
>> +    /// The max brightness level
>> +    const MAX_BRIGHTNESS: u32;
>> +
>> +    /// Sets the brightness level.
>> +    ///
>> +    /// See also [`LedOps::BLOCKING`]
>> +    fn brightness_set(&self, brightness: u32) -> Result<()>;
>> +
>> +    /// Gets the current brightness level.
>> +    fn brightness_get(&self) -> u32 {
>> +        build_error!(VTABLE_DEFAULT_ERROR)
>> +    }
>> +
>> +    /// Activates hardware accelerated blinking.
>> +    ///
>> +    /// delays are in milliseconds. If both are zero, a sensible defaul=
t should be chosen.
>> +    /// The caller should adjust the timings in that case and if it can=
't match the values
>> +    /// specified exactly. Setting the brightness to 0 will disable the=
 hardware accelerated
>> +    /// blinking.
>> +    ///
>> +    /// See also [`LedOps::BLOCKING`]
>> +    fn blink_set(&self, _delay_on: &mut usize, _delay_off: &mut usize) =
-> Result<()> {
>> +        build_error!(VTABLE_DEFAULT_ERROR)
>> +    }
>
> These functions should probably take a &Device<Bound> argument so that
> they can use methods that require a bound device (such as IO).

Indeed!

@Markus: Note that this guarantee is given by the LED device registration b=
eing
lifetime controlled by devres, while led_classdev_unregister() is synchroni=
zed
against those callbacks.

For the latter, please double check that this is actually the case -- I'm n=
ot
familiar with the LED subsystem, I'm reviewing from driver-core perspective=
. But
from a quick look it should be the case. :)

