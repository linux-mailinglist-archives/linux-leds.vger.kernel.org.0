Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8C55264F4
	for <lists+linux-leds@lfdr.de>; Fri, 13 May 2022 16:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbiEMOnr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 May 2022 10:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382170AbiEMOmJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 May 2022 10:42:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34276980A9
        for <linux-leds@vger.kernel.org>; Fri, 13 May 2022 07:37:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1npWPd-0007iu-W8; Fri, 13 May 2022 16:37:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1npWPe-0026F7-8P; Fri, 13 May 2022 16:37:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1npWPc-009TQx-7D; Fri, 13 May 2022 16:37:00 +0200
Date:   Fri, 13 May 2022 16:36:57 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lm3601x: Don't use mutex after it was destroyed
Message-ID: <20220513143657.5tak6tdmuuxpkyw2@pengutronix.de>
References: <20220513081832.263863-1-u.kleine-koenig@pengutronix.de>
 <20220513140255.GA18001@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nwwahpns3zyosq7h"
Content-Disposition: inline
In-Reply-To: <20220513140255.GA18001@duo.ucw.cz>
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


--nwwahpns3zyosq7h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

[dropped Dan Murphy from Cc:, the email address doesn't work]

On Fri, May 13, 2022 at 04:02:55PM +0200, Pavel Machek wrote:
> Hi!
>=20
> > The mutex might still be in use until the devm cleanup callback
> > devm_led_classdev_flash_release() is called. This only happens some time
> > after lm3601x_remove() completed.
>=20
> I'm sure lots of "use after free" can be fixed by simply removing the
> resource freeing...

I agree in general. Mutexes are a bit special here and often are not
destroyed. mutex_destroy() is a no-op usually and with debugging enabled
only does

	lock->magic =3D NULL;

which catches use-after-destroy. So IMHO just dropping the mutex_destroy
is fine.

> but lets fix this properly.

I don't understand that part. Does that mean you pick up my patch, or
that you create a better fix?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nwwahpns3zyosq7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJ+bQYACgkQwfwUeK3K
7AnQpgf/TdCRE82ssQgwxOQE0C4UBLn3FAvl505Z4RyvSHhLcAt6FlIEpXKHWuvq
KD/sF0wkgEQ/T7BTAvF49WNH3gpPnTpT0WmX/3uLJo7c+tJwb6u8IR0FPIlGsL7n
gltyOGcqxrTyOBJ4G8X9kAfi3Vm9UAc1HV1M2r3HArUan50wsTYAfZlegaWP3i1J
OGsiTCxZUwcON1m7/5L+rqUwpA0HxoQ5KvktL/DyTqYKY/3wYohEqIsuSeYKY5Lo
ROePcyOTM6JuelA2tifpaySYI1hAcG+a4XY/hVCnWMvv9QPcwbSv5HsW3q1nK3Ec
WiVQMQmzY7NYbTU4gL+mUj8SRmpG0g==
=i335
-----END PGP SIGNATURE-----

--nwwahpns3zyosq7h--
