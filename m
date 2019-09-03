Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9555A72C3
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 20:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfICSuJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 14:50:09 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41972 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfICSuJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Sep 2019 14:50:09 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 0D6C581B28; Tue,  3 Sep 2019 20:49:52 +0200 (CEST)
Date:   Tue, 3 Sep 2019 20:50:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: ns2: Fix wrong boolean expression
Message-ID: <20190903185006.GA10875@amd>
References: <20190903125020.20482-1-oleg@kaa.org.ua>
 <20190903125020.20482-2-oleg@kaa.org.ua>
 <20190903141241.GB8199@amd>
 <e7384bf0-dc94-f678-5aaa-e936b27f1650@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <e7384bf0-dc94-f678-5aaa-e936b27f1650@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-09-03 19:00:21, Oleh Kravchenko wrote:
> Hello Pavel,
>=20
> 03.09.19 17:12, Pavel Machek =D0=BF=D0=B8=D1=88=D0=B5:
> > On Tue 2019-09-03 15:50:20, Oleh Kravchenko wrote:
> >> Error was detected by PVS-Studio:
> >> V792 The '__gpio_cansleep' function located to the right of
> >> the operator '|' will be called regardless of the value of
> >> the left operand. Perhaps, it is better to use '||'.
> > 1st: original code is not wrong
>=20
> '|' is bitwise operation, if it really means *OR* then should be '||' -
> led_dat->can_sleep is bool.

I see that || would be more natural. But | also works.

> > 2nd: you are introducing a bug
>=20
> No, because if GPIOs *slow* can sleep and GPIO *cmd* can't sleep
> it will call gpio_set_value_cansleep() for both.

If just one of them can sleep, can_sleep will be 0, and bad things
will happen, right?


> >> @@ -205,7 +205,7 @@ create_ns2_led(struct platform_device *pdev, struc=
t ns2_led_data *led_dat,
> >>  	led_dat->cdev.groups =3D ns2_led_groups;
> >>  	led_dat->cmd =3D template->cmd;
> >>  	led_dat->slow =3D template->slow;
> >> -	led_dat->can_sleep =3D gpio_cansleep(led_dat->cmd) |
> >> +	led_dat->can_sleep =3D gpio_cansleep(led_dat->cmd) &&
> >>  				gpio_cansleep(led_dat->slow);
> >>  	if (led_dat->can_sleep)
> >>  		led_dat->cdev.brightness_set_blocking =3D ns2_led_set_blocking;

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1utd4ACgkQMOfwapXb+vJLBQCfUjNrNKGKLsaQRqc2zqd3lnyV
07UAmgPk26wRRsVAzJzqIYqc5y5S3ST5
=99gR
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
