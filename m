Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717A6544747
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jun 2022 11:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233983AbiFIJXN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jun 2022 05:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbiFIJXM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jun 2022 05:23:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5912B18A
        for <linux-leds@vger.kernel.org>; Thu,  9 Jun 2022 02:23:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nzENh-00015X-JK; Thu, 09 Jun 2022 11:23:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nzENh-007M2y-U0; Thu, 09 Jun 2022 11:23:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nzENf-00F9xV-KT; Thu, 09 Jun 2022 11:23:07 +0200
Date:   Thu, 9 Jun 2022 11:23:06 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] leds: lm3697: Remove duplicated error reporting in
 .remove()
Message-ID: <20220609092306.bptity7k2bss37qe@pengutronix.de>
References: <20220515161227.339514-1-u.kleine-koenig@pengutronix.de>
 <20220515161227.339514-2-u.kleine-koenig@pengutronix.de>
 <20220601093537.hsje2sgh7jiv65th@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zg4jylflj6cmhze4"
Content-Disposition: inline
In-Reply-To: <20220601093537.hsje2sgh7jiv65th@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zg4jylflj6cmhze4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Wed, Jun 01, 2022 at 11:35:37AM +0200, Uwe Kleine-K=F6nig wrote:
> On Sun, May 15, 2022 at 06:12:27PM +0200, Uwe Kleine-K=F6nig wrote:
> > Returning an error value from an i2c remove callback results in an error
> > message being emitted by the i2c core, but otherwise it doesn't make a
> > difference. The device goes away anyhow and the devm cleanups are
> > called.
> >=20
> > As lm3697_remove() already emits an error message on failure and the
> > additional error message by the i2c core doesn't add any useful
> > information, don't pass the error value up the stack. Instead continue
> > to clean up and return 0.
> >=20
> > This patch is a preparation for making i2c remove callbacks return void.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> you merged patch 1 of this series (which is in Linus Torvald's tree
> now). But you neither commented nor merged this patch. I assume you just
> missed this one?

Just a quick additional note: I want to tackle making i2c remove
callbacks return void after the next merge window and this is a
preparing patch for that. So it would be great if that patch made it in
in the post 5.19 merge window. Otherwise I'll send this patch together
with the callback change to get accepted via the i2c tree.

See
https://lore.kernel.org/linux-i2c/20220609091018.q52fhowlsdbdkct5@pengutron=
ix.de/
for some more details.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zg4jylflj6cmhze4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKhu/cACgkQwfwUeK3K
7AktKwgAjB9uxtdNbcxtftiopEeiAcHcLDsbUX1e3RaGeehHFINKTjtzyogB96UF
VNoU6MsxdcrHKRbH/G0mUvXRYmEOTM71qjVH1BE93Xmd1ppJTNx5teNzGL+fUFeZ
d6oZhXef+YqHJ3CN49LOz5zM+sPQn6vEVrLikTlrEdZZLMFXpRApXI4PISNUM11h
TLQY8Z7WyEGdMFZAlxCeVR9Bed9yVSpoFcqEjUKwy7FA9ZgHJPVpnlYZNyB8cV5C
32wP8X6o5ozhlbcH6BxP0s5Ro2G0QU9jGEbMANmmgmxS18yS4RSkPMy9oFFl67n4
Y2chNVnj/MWEpoL8QpfAwA/4ptHbsg==
=rp00
-----END PGP SIGNATURE-----

--zg4jylflj6cmhze4--
