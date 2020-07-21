Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B92228979
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jul 2020 21:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730902AbgGUTs0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Jul 2020 15:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730994AbgGUTsY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jul 2020 15:48:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879ABC061794
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2020 12:48:24 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jxyFO-0001s2-C9; Tue, 21 Jul 2020 21:48:18 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jxyFL-0002S5-Pn; Tue, 21 Jul 2020 21:48:15 +0200
Date:   Tue, 21 Jul 2020 21:48:15 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        kernel@pengutronix.de, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200721194815.mmkqccrkbgrly4xz@pengutronix.de>
References: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
 <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
 <20200714071355.GY3453@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zvqjc74lbtmuk5mp"
Content-Disposition: inline
In-Reply-To: <20200714071355.GY3453@localhost>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zvqjc74lbtmuk5mp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Johan,

On Tue, Jul 14, 2020 at 09:13:55AM +0200, Johan Hovold wrote:
> On Tue, Jul 07, 2020 at 06:59:58PM +0200, Uwe Kleine-K=F6nig wrote:
> > +	while (firstrun ||
> > +	       icount.rx !=3D trigger_data->rx ||
> > +	       icount.tx !=3D trigger_data->tx) {
> > +
> > +		led_set_brightness(trigger_data->led_cdev, LED_ON);
> > +
> > +		msleep(100);
> > +
> > +		led_set_brightness(trigger_data->led_cdev, LED_OFF);
> > +
> > +		trigger_data->rx =3D icount.rx;
> > +		trigger_data->tx =3D icount.tx;
> > +		firstrun =3D false;
> > +
> > +		ret =3D tty_get_icount(trigger_data->tty, &icount);
> > +		if (ret)
> > +			return;
> > +	}
>=20
> Haven't looked at the latest proposal in detail, but this looks broken
> as you can potentially loop indefinitely in a worker thread, and with no
> way to stop the trigger (delayed work).

I don't think that potentially looping indefinitely is a problem, but
indeed it should drop the lock during each iteration. Will think about
how to adapt.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zvqjc74lbtmuk5mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8XRnwACgkQwfwUeK3K
7Amnzgf7B6qXFayz/hez5dZd56jkGWR2qylUkUhIOVrcN2Hy/4LQVN19AQApbKxm
yJenogV8p+3pTPsMPlhmUUI3+XxCCkroJBiLfWM8RFFUWX9TSq4CcDLRT9yTR3xs
EmUdBFsiSyo2TbSyodkrrIh94Z67X9dTLfBscPQ0efohhnZwvkfN/AUYv0it+OOI
Ey2kTi2hDQiVLjuHqjGzis3BBTNZ+dEtiVWxG1PSspVQS+SVkK3NYLs1EOyyQK2e
35egTCI/Pu5AE0r5lGTmedJY4r3FJ8/ryv4XU/EGdksRbstsDIBG5URpDO9qFgh1
PbgnINd7pMuotKk05cWlSNfAt9INrw==
=p7Zb
-----END PGP SIGNATURE-----

--zvqjc74lbtmuk5mp--
