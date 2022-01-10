Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624C74890B0
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jan 2022 08:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239215AbiAJHX1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jan 2022 02:23:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbiAJHXY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jan 2022 02:23:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B1BC06173F
        for <linux-leds@vger.kernel.org>; Sun,  9 Jan 2022 23:23:24 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1n6p1W-0004DB-3v; Mon, 10 Jan 2022 08:23:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1n6p1V-009Tx9-JB; Mon, 10 Jan 2022 08:23:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1n6p1U-0008WA-Cf; Mon, 10 Jan 2022 08:23:20 +0100
Date:   Mon, 10 Jan 2022 08:23:17 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v3] leds: pca9532: Make pca9532_destroy_devices() return
 void
Message-ID: <20220110072317.sysdgvuzvlzzbcsb@pengutronix.de>
References: <20211021121639.79179-1-u.kleine-koenig@pengutronix.de>
 <20211022101707.1194979-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4rurkupalcydptow"
Content-Disposition: inline
In-Reply-To: <20211022101707.1194979-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4rurkupalcydptow
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2021 at 12:17:07PM +0200, Uwe Kleine-K=F6nig wrote:
> Up to now pca9532_destroy_devices() returns always zero because it's
> always called with data !=3D NULL. Remove the never-taken error path and
> make it return void which makes it easier to see in the callers that
> there is no error to handle.
>=20
> Also the return value of i2c remove callbacks is ignored anyway.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Ping. This patch is part of an effort to make the i2c remove callback a
void function, too. Are there any concerns, or plans to pick up this
patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4rurkupalcydptow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHb3uIACgkQwfwUeK3K
7AldVAgAjTKogAR/SXM6pZocKiqtFKoL5O966QBiqvVFps5hPDChyVvXlfL58dff
a7p51HLnrKJlxb2F5chJBrEDwzlzdn+iWIak5T9EvpDW2KvnIcl47XsXLk7404Uz
hzF2SfJB3GvWb9NGI1RhdCGZwVlxPXTvad0zN/QiVeMpK4D0/tpGrmR5AlpwPdfx
PGZTNldQquoOd5V/8LSunV8WQvUORoJqfaA925aO5pI+/v1Ygv7QtjpU1YJ+jlaX
gX1x8gDEDrmvRADdO3es7HX2taD+ay2D6tFqp/jUJXXcS0L3YfRCtQpUDxcU7t1h
zS73vAvET+Zl/rvVUL8tUsKtu0yAeQ==
=OevM
-----END PGP SIGNATURE-----

--4rurkupalcydptow--
