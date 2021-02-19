Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859CC31F6D9
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 10:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhBSJyb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 04:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhBSJyB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 04:54:01 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A516C0617A9
        for <linux-leds@vger.kernel.org>; Fri, 19 Feb 2021 01:52:58 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lD2T2-0000Yz-2i; Fri, 19 Feb 2021 10:52:56 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lD2T1-00010Y-Lb; Fri, 19 Feb 2021 10:52:55 +0100
Date:   Fri, 19 Feb 2021 10:52:54 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernel@pengutronix.de, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: trigger/tty: Use led_set_brightness_sync()
 from workqueue
Message-ID: <20210219095254.ky33qlb3cvy5btpe@pengutronix.de>
References: <20210219082955.5007-1-u.kleine-koenig@pengutronix.de>
 <20210219082955.5007-2-u.kleine-koenig@pengutronix.de>
 <20210219094632.GB5641@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cyunj7rgpbaisqx6"
Content-Disposition: inline
In-Reply-To: <20210219094632.GB5641@duo.ucw.cz>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--cyunj7rgpbaisqx6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 10:46:32AM +0100, Pavel Machek wrote:
> On Fri 2021-02-19 09:29:55, Uwe Kleine-K=F6nig wrote:
> > led_set_brightness() involves scheduling a workqueue. As here the led's
> > brightness setting is done in context of the trigger's workqueue this is
> > unjustified overhead and it's more sensible to use
> > led_set_brightness_sync().
>=20
> Acked-by: Pavel Machek <pavel@ucw.cz>

Who is expected to pick these two up? I assume Greg as the commit that
is fixed here is only in his try for now?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cyunj7rgpbaisqx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAvinMACgkQwfwUeK3K
7Am9Cgf/dPaXYBI/smn1ucrFOeRQrSii8j4/iNzs1sj1ITzKh8CW2XXQfRqmMJrZ
Zga25pglYn0+rg2E1WY7ac62SW5W58a1k1F/Ib/1W6IEXu2bEB/a38kRqnTcsgRh
ELBQb7U+9Nlv/qK5k/4TCUhnwqQ713eYvvE5l2Jt75EL3VbW7AcCLGJ84okXVlfZ
FV8nhoMyPHbXmr/hNFQy04xHdc2hWyevVC6kQbuhvXFZhumcJ+idMj1OnFUz03JL
Mr0fGuxHORCxorYT+bJjI8CDoBVPftW9c9foJHL9IBWqA1GYwBpw8YRzKvEwROe7
kuBShrLaA6lzhsiJLFwSWaxDacTukg==
=2Xnq
-----END PGP SIGNATURE-----

--cyunj7rgpbaisqx6--
