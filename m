Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6FDA6AE7
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 16:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbfICOMp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 10:12:45 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57583 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729473AbfICOMp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Sep 2019 10:12:45 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id C787981FA1; Tue,  3 Sep 2019 16:12:28 +0200 (CEST)
Date:   Tue, 3 Sep 2019 16:12:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: ns2: Fix wrong boolean expression
Message-ID: <20190903141241.GB8199@amd>
References: <20190903125020.20482-1-oleg@kaa.org.ua>
 <20190903125020.20482-2-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline
In-Reply-To: <20190903125020.20482-2-oleg@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-09-03 15:50:20, Oleh Kravchenko wrote:
> Error was detected by PVS-Studio:
> V792 The '__gpio_cansleep' function located to the right of
> the operator '|' will be called regardless of the value of
> the left operand. Perhaps, it is better to use '||'.

1st: original code is not wrong

2nd: you are introducing a bug


> @@ -205,7 +205,7 @@ create_ns2_led(struct platform_device *pdev, struct n=
s2_led_data *led_dat,
>  	led_dat->cdev.groups =3D ns2_led_groups;
>  	led_dat->cmd =3D template->cmd;
>  	led_dat->slow =3D template->slow;
> -	led_dat->can_sleep =3D gpio_cansleep(led_dat->cmd) |
> +	led_dat->can_sleep =3D gpio_cansleep(led_dat->cmd) &&
>  				gpio_cansleep(led_dat->slow);
>  	if (led_dat->can_sleep)
>  		led_dat->cdev.brightness_set_blocking =3D ns2_led_set_blocking;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1udNkACgkQMOfwapXb+vJriACeKLtV0bUJ7IPl4Fvd+EQwv6YI
RfcAoI7TUC8/dMG0ffMeVbHlWKKyJaTf
=NwwL
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
