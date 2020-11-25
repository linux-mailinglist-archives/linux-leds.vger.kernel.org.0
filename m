Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A862C3F12
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 12:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbgKYL0C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 06:26:02 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39604 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbgKYL0C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 06:26:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4720C1C0B7D; Wed, 25 Nov 2020 12:26:00 +0100 (CET)
Date:   Wed, 25 Nov 2020 12:25:59 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Marek Behun <kabel@blackhole.sk>,
        Gabriel David <ultracoolguy4@protonmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: lm3697: Rename struct into more appropriate name
Message-ID: <20201125112559.GD29328@amd>
References: <nH0fAuRxkhh0jdtlck5LucnuXiEY2wfpLF8C8spK8hebUUZ75xQOe-PjBtR7F8jEZ84l-o9rVJ3z9xvatOAJMjvbH5qCQIO5MuSOmpWr0ZQ=@protonmail.com>
 <20201010185700.GA8218@amd>
 <20201010235045.4ba8cf51@blackhole.sk>
 <3f83953a-57ba-1fdc-f3ae-d3679e05474d@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline
In-Reply-To: <3f83953a-57ba-1fdc-f3ae-d3679e05474d@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > From the perspective of Linux you see the two control banks as 2 LED
> >class devices (because you are setting brightness for control banks,
> >not for the LED strips).
>=20
> The way Marek explains it is correct and the way I wrote the driver
> intially.=A0 There is no direct control of the LEDs only controlling the 2
> banks.
>=20
> As an example a device can put LED string 1 and 2 on a single bank to
> control the backlight for a display and put LED string 3 on a different b=
ank
> to control the backlight of a keyboard. Like in the Droid and Droid 4
> devices.=A0 2 strings illuminate the display backlight and 1 string
> illuminates the keyboard the display backlight can have a independent
> brightness then the keyboard.
>=20
> To me the name of the structure does not impose any functional changes ju=
st
> semantic changes.=A0 And it just makes it a bit more difficult to back po=
rt
> functional fixes as this patch would be made mandatory for cherry picking=
=2E=A0
> But I do not get many requests to back port this driver so it maybe be a
> moot point.

Ok, sorry for the confusion, and .. I believe the code can stay as-is.

Bank is single entity Linux controls, and it does not need to know how
many pins are really controlled on the hardware level.

It will be confusing one way or another.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++P0cACgkQMOfwapXb+vIj6QCgjpcej4tuXeZEJMnlnQMtFLGp
xlgAoICqo8Vtn7a0gLImixk0DD3GMSyW
=/agp
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
