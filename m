Return-Path: <linux-leds+bounces-6291-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A9C7E836
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 23:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B8F32344DCE
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 22:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA70275AFB;
	Sun, 23 Nov 2025 22:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="XqtwLtvi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4320468E
	for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 22:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763937934; cv=none; b=nrm7CN9nrVBBfRSxVp+Y5x7obYlT41P/SSTdIRMVHjFvURww0ho8qE2oPjfoWCaNukCFfAfwR7rajZwUEwBRz4ehzkPzZ90F3oI+oraWxANdCCdSUJqRUe4stMAgH4/4DoWsExwx4AuOn9mwbm/LcojGsJjCOZ51U/UZkGuAHIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763937934; c=relaxed/simple;
	bh=BCi6jaxkclqDs49CwnzQOubDJwK1yph6sdyd7/VAZJs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MCySCwZlu01S+s7KoBnHrSo/RV/cbrIFRFv+k/ADtfN+OEjSqZbhQUeXYh8bxQTxDWURms1qObu53iPY7bLK8M9Ac19JwN7/aE2ifYOo9/E3MtbOgEG7wE+9NrolZ43biqvdvX8D8YqADoKAO0/oJNJhfleSS1GUQOuwi1saRvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=XqtwLtvi; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4452B240029
	for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 23:45:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1763937923; bh=/gypvWaw8d0Wy7Id7wcJoHvcCujoTbBkSQA+2Tf0vkc=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:OpenPGP:From;
	b=XqtwLtviO2AgcTsyCbFyCLxF7s1k0rGzRuLtMz0f7tBYjcDjd9e2TJIJgOT6IPt/L
	 23j0KJkDXV22K6FJt5GZi+1zLNC9IzGP4NlVncpnI4Ql+b/TCLl8hmTQqZoiFdnMzq
	 2xGet3md9H9T6rW2YtZoc3iTkd2dUJaPnFCWJLF5u1h6ZnUUccFw3sKPONNFag5/fy
	 fOP4Dkv7MMm5apiN9k0aytEVYNaYDoErAo2LL0W59BMKLuJbGPPLYF1mb698xhWp6q
	 TGK2ZlJpwmoJKzumwvTkGNRLa4FyZgTMXKqaPdfAzpiwSjjNSt26FBjF3C+H8xkC2V
	 OzUV8xMU+VE6w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dF3v41kRfz6tsb;
	Sun, 23 Nov 2025 23:45:20 +0100 (CET)
Message-ID: <9056176d97168a8a9506ccb46540721b1c30942a.camel@posteo.de>
Subject: Re: [PATCH 4/4] leds: add driver for synology atmega1608 controlled
 LEDs
From: Markus Probst <markus.probst@posteo.de>
To: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin
	 <igor.korotin.linux@gmail.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>,  Vlastimil Babka	 <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki	 <urezki@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Daniel Almeida
 <daniel.almeida@collabora.com>, 	linux-leds@vger.kernel.org,
 rust-for-linux@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Sun, 23 Nov 2025 22:45:22 +0000
In-Reply-To: <aSNnx6LNA/zMO4Gw@duo.ucw.cz>
References: <20251008181027.662616-1-markus.probst@posteo.de>
	 <20251008181027.662616-2-markus.probst@posteo.de>
	 <20251008181027.662616-3-markus.probst@posteo.de>
	 <20251008181027.662616-4-markus.probst@posteo.de>
	 <20251008181027.662616-5-markus.probst@posteo.de>
	 <aSNnx6LNA/zMO4Gw@duo.ucw.cz>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 R3rOFHA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

On Sun, 2025-11-23 at 21:00 +0100, Pavel Machek wrote:
> Hi!
>=20
> > The Atmega1608 is a microcontroller used by synology devices to control
> > leds via the i2c bus. It can handle up to 24 leds.
>=20
> Ok, but driver is not really for atmega1608, but for whatever code is
> running there, right?
>=20
> I would not mind that code being opensource.
>=20
> I would not mind if we had standard interface to these so the next
> person can reuse the protocol.
Me neither. But Synology is a company which seems to like proprietary
software. They have there own Linux-based (4.4.x kernel) operating
system, which is proprietary. Those devices are not intended for
installing other operating systems and doing so will certainly void the
warranty, but that doesn't stop me from doing it anyway.
>=20
>=20
> > +++ b/drivers/leds/Kconfig
> > @@ -323,6 +323,15 @@ config LEDS_WRAP
> >  	help
> >  	  This option enables support for the PCEngines WRAP programmable LED=
s.
> > =20
> > +config LEDS_ATMEGA1608
> > +	tristate "LED Support for Atmega1608 used in Synology devices"
>=20
> There's nothing Atmega specific, right?
Not that I am aware of. The driver interacts with code running on the
Atmega1608.

>=20
> "LED Support for Synology devices"?
I don't think thats the only driver they use for controlling disk leds
(although it seems the only synology specific they have added to their
kernel. They also seem to use LP3943 for some of their models,
according to their kernel config, which is already in the upstream
kernel), so it could mislead users into thinking this driver will be
useful on every synology device.

But I agree the config naming could be better.

>=20
> > +	depends on LEDS_CLASS
> > +	depends on I2C
> > +	depends on RUST
> > +	help
> > +	  This option enables support for the Atmega1608 microcontroller used
> > +	  as led controller in synology devices.
>=20
> led->LED
> synology->Synology
>=20
> > +++ b/drivers/leds/leds_atmega1608.rs
> > @@ -0,0 +1,377 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Led Driver for Synology devices using Atmega1608 as Led Controller=
.
>=20
> Led->LED
>=20
> > +//! Atmega1608 is a microcontroller from Microchip Technology, it is u=
sed
> > +//! as a led controller in synology nas devices.
>=20
> led->LED
>=20
> (Please fix globally).
>=20
> > +//! # Limitations
> > +//!
> > +//! DIM0 (and DIM1) are shared across all leds, meaning if DIM0 is use=
d by
> > +//! multiple leds, these multiple leds cannot have different brightnes=
s
> > +//! levels. The same does apply for the hardware accelerated blinking.
> > +//!
> > +//! In other words, for all 24 leds there can either only be one brigh=
tness other
> > +//! than 0 and 255, or one hardware accelerated blinking delay.
> > +//!
> > +//! Furthermore the off and on delay in hardware accelerated blinking =
cannot
> > +//! have different values and have to be equal. We solve this by calcu=
lating
> > +//! the average of those numbers and use it as delay for both. The del=
ay
> > +//! cannot be larger than 765 ms (255*3).
> > +//!
> > +//! While hardware accelerated blinking is on, the led cycles between
> > +//! the current brightness for the mode and full brightness. Because o=
f this
> > +//! behaviour, we hardcode the brightness value of 128 if hardware acc=
elerated
> > +//! blinking is used.
>=20
> Maybe we should just pretend that hw acceleration does not exist? Or
> pretend it can only do single blinking rate.
>=20
> > +
> > +kernel::module_i2c_driver! {
> > +    type: Atmega1608LedDriver,
> > +    name: "atmega1608",
> > +    authors: ["Markus Probst <markus.probst@posteo.de>"],
> > +    description: "Led Driver for Synology devices using Atmega1608 as =
Led Controller",
> > +    license: "GPL v2",
> > +}
>=20
> This should be called synologyLedDriver or something. We have driver
> for Thinkpad LEDs. We don't care what kind of hardware it runs on.
>=20
>=20
> > +impl LedHandler for Atmega1608Led {
> > +    const BLOCKING: bool =3D true;
> > +    const BLINK: bool =3D true;
> > +    const MAX_BRIGHTNESS: u32 =3D 255;
> > +
> > +    fn brightness_set(&self, brightness: u32) -> Result<()> {
> > +        let brightness =3D u8::try_from(brightness).unwrap_or(255);
> > +
> > +        let mode =3D self.update_mode(match brightness {
> > +            0 =3D> Atmega1608LedMode::Off,
> > +            255 | 254 =3D> Atmega1608LedMode::On,
> > +            _ =3D> Atmega1608LedMode::Dim0,
> > +        })?;
>=20
> Umm... so the hardware can only do on / off and dim. And dim is
> strange.
>=20
> Certainly MAX_BRIGHTNESS should not be 255, but 1 (or 2 if you want to
> support dim mode).
>=20
> One idea: Use hardware diming to have three levels. So MAX_BRIGHTNESS
> =3D 2. Then ignore hardware accelerated blinking. And you should have
> working and simpler driver.
Those LEDs are labeled "Disk 1", "Disk 2", "Disk 3", "Disk 4" ..., I
think blinking is more important here than brightness. The main purpose
of those leds is to show disk activity (blink) and issues (different
color). Pretending it can only do a single blinking rate seems to be
the way to go.

Another reason why brightness is less important here:

There are other leds: Status, Power, USB, Alert which are handled by a
different driver (communication through uart). I am also currently
working on supporting these (the driver would be in the drivers/mfd
tree as it takes care of other things too. I have a working prototyp,
but its far from being ready for the kernel).

Synology devices have a global brightness setting, having an impact on
all the leds mentioned above (not just via the atmega1608).
On my Synology NAS device (DS923+), its controlled via the '0x2e' i2c
data address (outside of the atmega1608 range) on the same i2c bus, but
that will propably differ per device (they have an xml config on each
device, for how to control the brightness). I think this should be
handled by userspace via i2c-dev (default is MAX brightness) and not by
the kernel.



Also I noticed, that there isn't a "per-disk led trigger", which did
actually suprise me. Just need to search "NAS" on the web and I find
enough devices (not just from Synology) having a per-disk led, which
proabably run Linux. There is "disk-activity", but thats for all the
disks. Is there another way for linking the disk activity of one
specific disk to a specific led that I missed? Otherwise I would write
(in C) a led trigger for this purpose.

Thanks
- Markus Probst

>=20
> Thanks and best regards,
> 								Pavel

