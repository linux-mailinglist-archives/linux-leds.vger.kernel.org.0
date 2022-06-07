Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBEB153F676
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jun 2022 08:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbiFGGqV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jun 2022 02:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbiFGGqS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jun 2022 02:46:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1381452E7E
        for <linux-leds@vger.kernel.org>; Mon,  6 Jun 2022 23:46:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySyl-0006ax-Sq; Tue, 07 Jun 2022 08:46:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySym-006wTz-7E; Tue, 07 Jun 2022 08:46:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nySyj-00EiN8-KQ; Tue, 07 Jun 2022 08:46:13 +0200
Date:   Tue, 7 Jun 2022 08:46:10 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>, kernel@pengutronix.de,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lm3601x: Don't use mutex after it was destroyed
Message-ID: <20220607064610.sjgkhxct7bqy6wyt@pengutronix.de>
References: <20220513081832.263863-1-u.kleine-koenig@pengutronix.de>
 <20220513140255.GA18001@duo.ucw.cz>
 <20220513143657.5tak6tdmuuxpkyw2@pengutronix.de>
 <20220523073510.ujpgmz5sjrgt4fkj@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t5vukiszaxyp4exc"
Content-Disposition: inline
In-Reply-To: <20220523073510.ujpgmz5sjrgt4fkj@pengutronix.de>
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


--t5vukiszaxyp4exc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Mon, May 23, 2022 at 09:35:10AM +0200, Uwe Kleine-K=F6nig wrote:
> On Fri, May 13, 2022 at 04:36:57PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Fri, May 13, 2022 at 04:02:55PM +0200, Pavel Machek wrote:
> > > > The mutex might still be in use until the devm cleanup callback
> > > > devm_led_classdev_flash_release() is called. This only happens some=
 time
> > > > after lm3601x_remove() completed.
> > >=20
> > > I'm sure lots of "use after free" can be fixed by simply removing the
> > > resource freeing...
> >=20
> > I agree in general. Mutexes are a bit special here and often are not
> > destroyed. mutex_destroy() is a no-op usually and with debugging enabled
> > only does
> >=20
> > 	lock->magic =3D NULL;
> >=20
> > which catches use-after-destroy. So IMHO just dropping the mutex_destroy
> > is fine.
> >=20
> > > but lets fix this properly.
> >=20
> > I don't understand that part. Does that mean you pick up my patch, or
> > that you create a better fix?
>=20
> You didn't pick up this patch up to now and also I didn't see a better
> fix.
>=20
> So I wonder what is your plan/vision here. The obvious alternatives are
> to call mutex_destroy only in a devm callback that is registered before
> calling lm3601x_register_leds(), or don't used devm to register the LED.

Any news on this? If you're waiting for a better fix from me, please
tell my your expectations. A devm variant of mutex_init would be an
option, but that feels like a very big hammer for a small nail. I still
consider my patch fine.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t5vukiszaxyp4exc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKe9DAACgkQwfwUeK3K
7AleJwgAgQE3ali2ei29bsxPSotvmpm9o+UZjxJIHl635wPtNURI4yxcFnfhfJr3
P9iSyBB3r2e0/OXVdC30wU6ZmfoUJKGgxLwkbNGnjXlNtz3GwwxM/B2DqaCa7Imp
31qI1Ni4zppNyg/6JYkf3ty57ktUj3HGt6GRPKS3WCrz+41P+kUNQwJ3KbAxeO58
gq92KiEav7Cm1zQbSbKuQ1HwoZg/BfDlfbyfqkdQMiDMhdjp+dznp8PAi1AID0tc
VbagSMgobNJZ+JOom1/oXzi+6txEe9SZ2fLl9X1jYe+gajfGzK2RepVv3jD2C1nx
0VN0DvNEikIow1hdrD3z0dmLXNKUmQ==
=7n4M
-----END PGP SIGNATURE-----

--t5vukiszaxyp4exc--
