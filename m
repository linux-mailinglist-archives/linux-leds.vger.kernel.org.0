Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0466C48B9A4
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jan 2022 22:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236023AbiAKVai (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jan 2022 16:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbiAKVah (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jan 2022 16:30:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262ADC06173F
        for <linux-leds@vger.kernel.org>; Tue, 11 Jan 2022 13:30:37 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1n7Oiw-0003k2-Tg; Tue, 11 Jan 2022 22:30:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1n7Oiw-009mAE-ES; Tue, 11 Jan 2022 22:30:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1n7Oiv-0003e2-2P; Tue, 11 Jan 2022 22:30:33 +0100
Date:   Tue, 11 Jan 2022 22:30:32 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Riku Voipio <riku.voipio@iki.fi>, kernel@pengutronix.de,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3] leds: pca9532: Make pca9532_destroy_devices() return
 void
Message-ID: <20220111213032.5hqlgptdqjxvnikj@pengutronix.de>
References: <20211021121639.79179-1-u.kleine-koenig@pengutronix.de>
 <20211022101707.1194979-1-u.kleine-koenig@pengutronix.de>
 <20220110072317.sysdgvuzvlzzbcsb@pengutronix.de>
 <20220111211223.GA26173@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bxuecp3vjrfwsgmv"
Content-Disposition: inline
In-Reply-To: <20220111211223.GA26173@duo.ucw.cz>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bxuecp3vjrfwsgmv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 10:12:23PM +0100, Pavel Machek wrote:
> On Mon 2022-01-10 08:23:17, Uwe Kleine-K=F6nig wrote:
> > On Fri, Oct 22, 2021 at 12:17:07PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Up to now pca9532_destroy_devices() returns always zero because it's
> > > always called with data !=3D NULL. Remove the never-taken error path =
and
> > > make it return void which makes it easier to see in the callers that
> > > there is no error to handle.
> > >=20
> > > Also the return value of i2c remove callbacks is ignored anyway.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > Ping. This patch is part of an effort to make the i2c remove callback a
> > void function, too. Are there any concerns, or plans to pick up this
> > patch?
>=20
> It looks like a simple cleanup with no effect outside of the
> driver. Am I wrong?

Yes, there is no intended effect on the compiled code.

The reason I want this patch is that I work on making the i2c remove
callback return void. As this has to touch all i2c drivers, the changes
to these should be as simple as possible, so ideally I just want to drop
the "return 0" there. Every return that might return a value !=3D 0 is
more complicated to handle there.

So it's just to prepare this change an to make the code a tad easier to
read for a human.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bxuecp3vjrfwsgmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHd9vUACgkQwfwUeK3K
7Anl9Af/YP7rslmWDqUYDbTFYI8P40ESKwVq4f8+9KUhYFtKgzkReBOROuo/XUgL
KGBn61Pzs1pqMvGziwLby58prugPsPJjgdA7aInh257n6xu2Xg+NzSarB0yg1NBT
9nSDYLHmaNwO5g9vqWfLJpdRFA3oxyNqx6JLo3T8VzRal3RmxcFMz80++BwH0KL/
teJ+R1KM/1FRi52fSVTP9To6Brnv3VGmW9yH7ViND5meAqmwjvvdBbdUE4FBXKbU
iZ1zj+XMJqM/X6Wrgc7AphxMg9Pe6BYkgC2miXEKldZ+0Xx2/8UrBjEx4ukc4aZ1
Dd3quzyuCk+Ve/QZFX4DmYc8/yclbw==
=E528
-----END PGP SIGNATURE-----

--bxuecp3vjrfwsgmv--
