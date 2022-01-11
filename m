Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF52848B931
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jan 2022 22:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233352AbiAKVMZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jan 2022 16:12:25 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:55016 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbiAKVMY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jan 2022 16:12:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AC9E71C0B76; Tue, 11 Jan 2022 22:12:23 +0100 (CET)
Date:   Tue, 11 Jan 2022 22:12:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Riku Voipio <riku.voipio@iki.fi>, linux-leds@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3] leds: pca9532: Make pca9532_destroy_devices() return
 void
Message-ID: <20220111211223.GA26173@duo.ucw.cz>
References: <20211021121639.79179-1-u.kleine-koenig@pengutronix.de>
 <20211022101707.1194979-1-u.kleine-koenig@pengutronix.de>
 <20220110072317.sysdgvuzvlzzbcsb@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <20220110072317.sysdgvuzvlzzbcsb@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2022-01-10 08:23:17, Uwe Kleine-K=F6nig wrote:
> On Fri, Oct 22, 2021 at 12:17:07PM +0200, Uwe Kleine-K=F6nig wrote:
> > Up to now pca9532_destroy_devices() returns always zero because it's
> > always called with data !=3D NULL. Remove the never-taken error path and
> > make it return void which makes it easier to see in the callers that
> > there is no error to handle.
> >=20
> > Also the return value of i2c remove callbacks is ignored anyway.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Ping. This patch is part of an effort to make the i2c remove callback a
> void function, too. Are there any concerns, or plans to pick up this
> patch?

It looks like a simple cleanup with no effect outside of the
driver. Am I wrong?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYd3ytwAKCRAw5/Bqldv6
8hGrAKCrwE1gLubEktwFVhw5WRTmfxZ79gCdFyIprKuTKP0LaDzX6jT+OsaFKSs=
=uabk
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
