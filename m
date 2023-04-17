Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6C66E4811
	for <lists+linux-leds@lfdr.de>; Mon, 17 Apr 2023 14:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjDQMoM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Apr 2023 08:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjDQMoL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 08:44:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B64C106
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 05:44:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1poODH-0007Bx-7P; Mon, 17 Apr 2023 14:44:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poODG-00Bsex-0s; Mon, 17 Apr 2023 14:44:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poODE-00Dvbs-O5; Mon, 17 Apr 2023 14:44:04 +0200
Date:   Mon, 17 Apr 2023 14:44:03 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
Message-ID: <20230417124403.j64c2lftgyqo2a67@pengutronix.de>
References: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
 <ZD07hLV1gs+gw26s@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k6oyklcrso3ikb32"
Content-Disposition: inline
In-Reply-To: <ZD07hLV1gs+gw26s@duo.ucw.cz>
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


--k6oyklcrso3ikb32
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Apr 17, 2023 at 02:28:52PM +0200, Pavel Machek wrote:
> > After commit ba8a86e4dadb ("leds: trigger/tty: Use
> > led_set_brightness_sync() from workqueue") this is the second try to
> > pick the right function to set the LED brightness from a trigger.
> >=20
> > led_set_brightness_sync() has the problem that it doesn't work for LEDs
> > without a .brightness_set_blocking() callback. This is (among others)
> > the case for LEDs connected to non-sleeping GPIOs.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I don't think this is right.
>=20
> _nosleep calls _nopm, which assmues it can't sleep, and schedules
> another workqueue to set the LED.

Then which is the right variant?
led_set_brightness() and led_set_brightness_nosleep() set via a workqueue
(which is bad) and led_set_brightness_sync() doesn't work for some LEDs
(notably LEDs on non-sleeping GPIOs).

=46rom reading the code comments led_set_brightness_sync() sounds like the
right function to call, so maybe we only need to fix gpio-led (and maybe
some others)?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k6oyklcrso3ikb32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ9PxIACgkQj4D7WH0S
/k4HAwgAi3LS3majkWu3i9Q1vTXGXq8NIFmw3evy16Gg2TG/jCgCpWeWhxXiSv4w
BKQTLtLGvtK4dhnp64q/VXZ+mPpG/lecWZ9/cvvinsEhZzQfyKz0kdI5GQUZdjYv
xpMQ+SboZgd7Qkdc/ys5QnWKm4ZqHZyIXYbMFo5ORte2u7zk1R/XgVbPAO4Uyync
vGB1G5YmYdll28Y59cF5tk8/Dz5WIJ7v2SldvJ1CgtdXLQbHFVDmLuOmVJNU3Yus
AEibLDNrVgkf5L8JafB4AKrIMMjOVbUOm1zsKwpOqvvJKoVDX3Z669podnXDdcJO
rbV/ZXzt8b0/BSj72Ai96doCt3xExg==
=4DzX
-----END PGP SIGNATURE-----

--k6oyklcrso3ikb32--
