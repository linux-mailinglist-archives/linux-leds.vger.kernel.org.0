Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB28721D3B7
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 12:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgGMK0N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 06:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729390AbgGMK0K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 06:26:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9863C061794
        for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2020 03:26:09 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1juves-0006lX-6S; Mon, 13 Jul 2020 12:26:02 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1juver-0008D8-6D; Mon, 13 Jul 2020 12:26:01 +0200
Date:   Mon, 13 Jul 2020 12:26:00 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@denx.de>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200713102600.ts672o72krjky5gi@pengutronix.de>
References: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
 <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
 <20200712082453.GI8295@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p7sgu6f4s3srokfq"
Content-Disposition: inline
In-Reply-To: <20200712082453.GI8295@amd>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--p7sgu6f4s3srokfq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Sun, Jul 12, 2020 at 10:24:53AM +0200, Pavel Machek wrote:
> > +++ b/drivers/leds/trigger/ledtrig-tty.c
> > @@ -0,0 +1,192 @@
> > +// SPDX-License-Identifier: GPL-2.0
>=20
> 2.0+ is preffered.

My employer requests GPL-2.0-only for kernel code.

> > +	while (firstrun ||
> > +	       icount.rx !=3D trigger_data->rx ||
> > +	       icount.tx !=3D trigger_data->tx) {
> > +
> > +		led_set_brightness(trigger_data->led_cdev, LED_ON);
> > +
> > +		msleep(100);
> > +
> > +		led_set_brightness(trigger_data->led_cdev, LED_OFF);
>=20
> Is this good idea inside workqueue?

What is "this"? The msleep? Calling led_set_brightness? What would you
recommend instead? Maybe led_set_brightness_nosleep()?

> > +		trigger_data->rx =3D icount.rx;
> > +		trigger_data->tx =3D icount.tx;
> > +		firstrun =3D false;
> > +
> > +		ret =3D tty_get_icount(trigger_data->tty, &icount);
> > +		if (ret)
> > +			return;
>=20
> Unbalanced locking.

indeed, will fix and resend after the above issues are resolved.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--p7sgu6f4s3srokfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8MNrYACgkQwfwUeK3K
7AmjaAgAhJ4ZfU4c7r1CzUjNGOMKD/u6/lkeH+6PbKNRLQA7PLSdkfAvfUitzLVH
p7CsYj4YavhWXRO9i3p7PDgMUUPeUWdpMq1pYBPOKspahP5hSDjI7ncvgOwhI4Ot
ANXhLG4jvYlMXa5054nHcPzSkPi5d30If4bg9et+F0+2dTRuVgiIibc5SDXHeOpJ
a0XKR6gLIog9F4ufu8H71Rz+eA/qK26xbvksv8OWpupLmi+EIg4ijsXiA1Iqgc4R
gnHYG7cu2oeyXJSXrHitK0415ZT0S//vMZrMPRQvWHiiLhjpYqJTHHpiP3oFTTyu
REWG/lIOh2q0yDn7dE7+yFG4oQt8sg==
=lxZ0
-----END PGP SIGNATURE-----

--p7sgu6f4s3srokfq--
