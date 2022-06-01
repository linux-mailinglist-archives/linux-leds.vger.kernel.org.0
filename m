Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70ADF53A0A0
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jun 2022 11:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351240AbiFAJf7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Jun 2022 05:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351243AbiFAJfn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Jun 2022 05:35:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9894D8FD5F
        for <linux-leds@vger.kernel.org>; Wed,  1 Jun 2022 02:35:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nwKlP-00084N-Ex; Wed, 01 Jun 2022 11:35:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nwKlP-005oIV-W6; Wed, 01 Jun 2022 11:35:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nwKlN-00DUBR-Vh; Wed, 01 Jun 2022 11:35:37 +0200
Date:   Wed, 1 Jun 2022 11:35:37 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel@pengutronix.de, linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lm3697: Remove duplicated error reporting in
 .remove()
Message-ID: <20220601093537.hsje2sgh7jiv65th@pengutronix.de>
References: <20220515161227.339514-1-u.kleine-koenig@pengutronix.de>
 <20220515161227.339514-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bbmmlfji47eb4l7h"
Content-Disposition: inline
In-Reply-To: <20220515161227.339514-2-u.kleine-koenig@pengutronix.de>
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


--bbmmlfji47eb4l7h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Sun, May 15, 2022 at 06:12:27PM +0200, Uwe Kleine-K=F6nig wrote:
> Returning an error value from an i2c remove callback results in an error
> message being emitted by the i2c core, but otherwise it doesn't make a
> difference. The device goes away anyhow and the devm cleanups are
> called.
>=20
> As lm3697_remove() already emits an error message on failure and the
> additional error message by the i2c core doesn't add any useful
> information, don't pass the error value up the stack. Instead continue
> to clean up and return 0.
>=20
> This patch is a preparation for making i2c remove callbacks return void.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

you merged patch 1 of this series (which is in Linus Torvald's tree
now). But you neither commented nor merged this patch. I assume you just
missed this one?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bbmmlfji47eb4l7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKXMucACgkQwfwUeK3K
7AmonQf/VNxtir/XiURbfjiYbTYvDhQNT7O8l/FdrVeA64+CFDKr5poEvWSh5FeK
ZjKCkBmsYNI68NcHoFGM0jtt2tIMpxv4BdxahSDewc+A3O35xV2kJ5nuDM+u60++
y6sndA+lMo2F8JA5xOMGyK/ZersDRTA2dg4a5/m09ucq5RcvsmoO6IOTvLFE4jmY
ne1Nk3mcdbnL/PvVdJBNhz6JSuo1NG0pbroZuhAEXTeKBNqAOpxbxIQXJeH4QQCs
0vmNU50dQlDVF+b7U8MhNR1Oke1NYNoGJ64MWCbx5O9oKwSknyAhipoEw4GLTjl3
Pym/Z6kP/Uxy6YeYlfH3CqjVQDYQDQ==
=AXDa
-----END PGP SIGNATURE-----

--bbmmlfji47eb4l7h--
