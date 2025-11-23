Return-Path: <linux-leds+bounces-6288-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D084C7E6E6
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 21:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9339B345D4B
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 20:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CEE262FE7;
	Sun, 23 Nov 2025 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="SMZOVaEy"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A996B1FC0ED;
	Sun, 23 Nov 2025 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763928014; cv=none; b=htxtIuh80qIgo0cWwNizmVU5XgvaAQBV5iFG198RXmB4F6FAAicyyLGheHxC/r2pcz96s66ivKgLj7yjD4H0RYSNkLgJaRK3c4UKKw4ZiqMtvzkp3XshS8Ha9oBaquQ4gSQZM9AB2o5uR1cUcf9zjCbEWLvBlnsnH/h7aCxlDnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763928014; c=relaxed/simple;
	bh=Ac4w/2qaMlSK29KALn0ymvJ0GzJtTUmkJP9FYF0O0TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/3BiIv+co6kvPnMMCf12eNVK2rxjA3eLEE9RiO+X30jAUxortA4avBaCh7rcdt6VYg000lHKP8n9oaa2hEQ/C57ZZQ+owFkRqsDHPKsBoeY0M/aQrY8Z5Bry2tugUkf8c4w4aSaSuE3h/lkmgSM4MXgqy6zB0XfQx8I0Xzs3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=SMZOVaEy; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 43FE51C00AB; Sun, 23 Nov 2025 21:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1763928008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HnoTdBVfy5g1p+j501uJwrZMnSQol/c8v+FIFCf5wKU=;
	b=SMZOVaEy/qvCksbSjeSrvQ0o6pOSPPF5ZDP9Jqt9N4oj7o1d0W07if1qLpMnl+rcc5zgnQ
	Z5R6tGTXsJdvwD2KMhKI4wjVXk2AMHq8C/xwX6lObClOEgbNAAe7EmcBv5ZYRCFipZDOmB
	Q9MFFr1F+ZkfT+EzH2+hNHeQJBdpxug=
Date: Sun, 23 Nov 2025 21:00:07 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-leds@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] leds: add driver for synology atmega1608 controlled
 LEDs
Message-ID: <aSNnx6LNA/zMO4Gw@duo.ucw.cz>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
 <20251008181027.662616-3-markus.probst@posteo.de>
 <20251008181027.662616-4-markus.probst@posteo.de>
 <20251008181027.662616-5-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C/8vHck61TzN1G0S"
Content-Disposition: inline
In-Reply-To: <20251008181027.662616-5-markus.probst@posteo.de>


--C/8vHck61TzN1G0S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The Atmega1608 is a microcontroller used by synology devices to control
> leds via the i2c bus. It can handle up to 24 leds.

Ok, but driver is not really for atmega1608, but for whatever code is
running there, right?

I would not mind that code being opensource.

I would not mind if we had standard interface to these so the next
person can reuse the protocol.


> +++ b/drivers/leds/Kconfig
> @@ -323,6 +323,15 @@ config LEDS_WRAP
>  	help
>  	  This option enables support for the PCEngines WRAP programmable LEDs.
> =20
> +config LEDS_ATMEGA1608
> +	tristate "LED Support for Atmega1608 used in Synology devices"

There's nothing Atmega specific, right?

"LED Support for Synology devices"?

> +	depends on LEDS_CLASS
> +	depends on I2C
> +	depends on RUST
> +	help
> +	  This option enables support for the Atmega1608 microcontroller used
> +	  as led controller in synology devices.

led->LED
synology->Synology

> +++ b/drivers/leds/leds_atmega1608.rs
> @@ -0,0 +1,377 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Led Driver for Synology devices using Atmega1608 as Led Controller.

Led->LED

> +//! Atmega1608 is a microcontroller from Microchip Technology, it is used
> +//! as a led controller in synology nas devices.

led->LED

(Please fix globally).

> +//! # Limitations
> +//!
> +//! DIM0 (and DIM1) are shared across all leds, meaning if DIM0 is used =
by
> +//! multiple leds, these multiple leds cannot have different brightness
> +//! levels. The same does apply for the hardware accelerated blinking.
> +//!
> +//! In other words, for all 24 leds there can either only be one brightn=
ess other
> +//! than 0 and 255, or one hardware accelerated blinking delay.
> +//!
> +//! Furthermore the off and on delay in hardware accelerated blinking ca=
nnot
> +//! have different values and have to be equal. We solve this by calcula=
ting
> +//! the average of those numbers and use it as delay for both. The delay
> +//! cannot be larger than 765 ms (255*3).
> +//!
> +//! While hardware accelerated blinking is on, the led cycles between
> +//! the current brightness for the mode and full brightness. Because of =
this
> +//! behaviour, we hardcode the brightness value of 128 if hardware accel=
erated
> +//! blinking is used.

Maybe we should just pretend that hw acceleration does not exist? Or
pretend it can only do single blinking rate.

> +
> +kernel::module_i2c_driver! {
> +    type: Atmega1608LedDriver,
> +    name: "atmega1608",
> +    authors: ["Markus Probst <markus.probst@posteo.de>"],
> +    description: "Led Driver for Synology devices using Atmega1608 as Le=
d Controller",
> +    license: "GPL v2",
> +}

This should be called synologyLedDriver or something. We have driver
for Thinkpad LEDs. We don't care what kind of hardware it runs on.


> +impl LedHandler for Atmega1608Led {
> +    const BLOCKING: bool =3D true;
> +    const BLINK: bool =3D true;
> +    const MAX_BRIGHTNESS: u32 =3D 255;
> +
> +    fn brightness_set(&self, brightness: u32) -> Result<()> {
> +        let brightness =3D u8::try_from(brightness).unwrap_or(255);
> +
> +        let mode =3D self.update_mode(match brightness {
> +            0 =3D> Atmega1608LedMode::Off,
> +            255 | 254 =3D> Atmega1608LedMode::On,
> +            _ =3D> Atmega1608LedMode::Dim0,
> +        })?;

Umm... so the hardware can only do on / off and dim. And dim is
strange.

Certainly MAX_BRIGHTNESS should not be 255, but 1 (or 2 if you want to
support dim mode).

One idea: Use hardware diming to have three levels. So MAX_BRIGHTNESS
=3D 2. Then ignore hardware accelerated blinking. And you should have
working and simpler driver.

Thanks and best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--C/8vHck61TzN1G0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSNnxwAKCRAw5/Bqldv6
8tlyAJ9nXKek8rSN/EpHtcz2x6HDubBkRwCeKWOtDvDkmKAqZ4psb7nxhNZQOjU=
=NPGx
-----END PGP SIGNATURE-----

--C/8vHck61TzN1G0S--

