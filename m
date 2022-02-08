Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15FD4AD3E4
	for <lists+linux-leds@lfdr.de>; Tue,  8 Feb 2022 09:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349389AbiBHIpP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Feb 2022 03:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240114AbiBHIpO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Feb 2022 03:45:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10739C03FEC3
        for <linux-leds@vger.kernel.org>; Tue,  8 Feb 2022 00:45:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nHM7c-0002nx-8S; Tue, 08 Feb 2022 09:45:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nHM7b-00FGOW-QO; Tue, 08 Feb 2022 09:45:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nHM7a-00Bh2Q-5r; Tue, 08 Feb 2022 09:45:10 +0100
Date:   Tue, 8 Feb 2022 09:45:07 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sascha Hauer <kernel@pengutronix.de>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: lm3692x: Return 0 from remove callback
Message-ID: <20220208084507.6dzjkl3sfjnjak22@pengutronix.de>
References: <20220206220812.21471-1-u.kleine-koenig@pengutronix.de>
 <CAHp75VdHjN94JXsfdF+K-zG2RL_mtZov3aB+4wdQKO8BRKBhgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f6l47tyjnvdfl3xv"
Content-Disposition: inline
In-Reply-To: <CAHp75VdHjN94JXsfdF+K-zG2RL_mtZov3aB+4wdQKO8BRKBhgQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--f6l47tyjnvdfl3xv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 05:23:40PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 7, 2022 at 5:08 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > The only difference between returning zero or a non-zero value is that
> > for the non-zero case the i2c will print a generic error message
> > ("remove failed (-ESOMETHING), will be ignored").
> >
> > In this case however the driver itself already emitted a more helpful
> > error message, so the additional error message isn't helpful at all.
> >
> > The long-term goal is to make the i2c remove callback return void, maki=
ng
> > all implementations return 0 is preparatory work for this change.
>=20
> ...
>=20
> > +       lm3692x_leds_disable(led);
>=20
> Since it emits a message, perhaps converting it to void also can be
> done here. Otherwise what's the point to have it int?

There is another caller (lm3692x_leds_disable) where the return value is
used. So I didn't convert it to return void.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--f6l47tyjnvdfl3xv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmICLZAACgkQwfwUeK3K
7AkP/Af/X2ZYALgSWEq1GFiMDBHZDMS4Dq/q1ng4c8rphV8t0Hy4/sAhvX2i/AAR
vZWyHtP7YoCvAKRq+QMC72NZw2iAT5qqy8ylSPM2AYNauzIzQa4rdsi2YG0lFaQu
0/oYypvCexlfD5BUpIrWZV6d7ihcU1FRSgmBs0YzEdsTzNfSU9X8ZCFFjVybe3Cz
eIlpfTqwuTHSLGGYlVsBtf5TTRMzUe40wG9OOK2H3GnaUKW8SKrKXLobVgqsQHGZ
BnDGibsDcDC7tnYZWGfNJsX9Cah7DG/kb4sNDRuBcka1Jtg6nlTpscn3nAQ7qmWa
2lZOV8ym9sNu3FbB+1vKGWY6eAjvOg==
=tfwP
-----END PGP SIGNATURE-----

--f6l47tyjnvdfl3xv--
