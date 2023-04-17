Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC0D6E54B1
	for <lists+linux-leds@lfdr.de>; Tue, 18 Apr 2023 00:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjDQW12 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Apr 2023 18:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjDQW11 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 18:27:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96933ABF
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 15:27:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1poXJi-0000tF-9v; Tue, 18 Apr 2023 00:27:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poXJh-00ByO0-2O; Tue, 18 Apr 2023 00:27:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poXJg-00E2ZV-Ad; Tue, 18 Apr 2023 00:27:20 +0200
Date:   Tue, 18 Apr 2023 00:27:20 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
Message-ID: <20230417222720.i6p6kovzoejysbqt@pengutronix.de>
References: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
 <ZD07hLV1gs+gw26s@duo.ucw.cz>
 <20230417124403.j64c2lftgyqo2a67@pengutronix.de>
 <90efe25c-fea5-cdd0-8bd3-16b9e53e8b56@gmail.com>
 <20230417191756.ex6b4u4lausfatqm@pengutronix.de>
 <5af7920c-d38e-c6e7-3671-53bc5ba7ef8c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bf5zdsw7rs35a7du"
Content-Disposition: inline
In-Reply-To: <5af7920c-d38e-c6e7-3671-53bc5ba7ef8c@gmail.com>
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


--bf5zdsw7rs35a7du
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hello Jacek,

On Mon, Apr 17, 2023 at 09:51:06PM +0200, Jacek Anaszewski wrote:
> On 4/17/23 21:17, Uwe Kleine-K=F6nig wrote:
> > On Mon, Apr 17, 2023 at 08:33:31PM +0200, Jacek Anaszewski wrote:
> > > On 4/17/23 14:44, Uwe Kleine-K=F6nig wrote:
> > > > On Mon, Apr 17, 2023 at 02:28:52PM +0200, Pavel Machek wrote:
> > > > > > After commit ba8a86e4dadb ("leds: trigger/tty: Use
> > > > > > led_set_brightness_sync() from workqueue") this is the second t=
ry to
> > > > > > pick the right function to set the LED brightness from a trigge=
r.
> > > > > >=20
> > > > > > led_set_brightness_sync() has the problem that it doesn't work =
for LEDs
> > > > > > without a .brightness_set_blocking() callback. This is (among o=
thers)
> > > > > > the case for LEDs connected to non-sleeping GPIOs.
> > > > > >=20
> > > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.=
de>
> > > > >=20
> > > > > I don't think this is right.
> > > > >=20
> > > > > _nosleep calls _nopm, which assmues it can't sleep, and schedules
> > > > > another workqueue to set the LED.
> > > >=20
> > > > Then which is the right variant?
> > > > led_set_brightness() and led_set_brightness_nosleep() set via a wor=
kqueue
> > > > (which is bad) and led_set_brightness_sync() doesn't work for some =
LEDs
> > > > (notably LEDs on non-sleeping GPIOs).
> > >=20
> > > Can you remind me the context of this patch, why using workqueue is
> > > bad here?
> >=20
> > The workqueue is only needed if you have a slow LED and want to set the
> > brightness in atomic context. However if you are allowed to sleep that
> > is just needless overhead.
>=20
> OK, now I get it. So new functions will be needed, something like
> below (skipped args, need more thinking about corner cases, e.g.
> interactions with led_classdev_suspend()):
>=20
> int led_set_brightness_cansleep()
>     led_cdev->brightness =3D min(value, led_cdev->max_brightness);
>=20
>     if (led_cdev->flags & LED_SUSPENDED)
>         return 0;
>=20
>     return led_set_brightness_nopm_cansleep();
>=20
>=20
> int led_set_brightness_nopm_cansleep()
>     ret =3D__led_set_brightness();
>     if (ret =3D=3D -ENOTSUPP)
>         ret =3D __led_set_brightness_blocking();
>=20
>     return ret;

Did you just reinvent led_set_brightness_sync() and the only thing we
need is:

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index ce4e79939731..4f718609032b 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -83,8 +83,7 @@ static int create_gpio_led(const struct gpio_led *templat=
e,
 	led_dat->can_sleep =3D gpiod_cansleep(led_dat->gpiod);
 	if (!led_dat->can_sleep)
 		led_dat->cdev.brightness_set =3D gpio_led_set;
-	else
-		led_dat->cdev.brightness_set_blocking =3D gpio_led_set_blocking;
+	led_dat->cdev.brightness_set_blocking =3D gpio_led_set_blocking;
 	led_dat->blinking =3D 0;
 	if (blink_set) {
 		led_dat->platform_gpio_blink_set =3D blink_set;

?

> As a quick fix I would apply led_set_brightness_nosleep() nonetheless.
> Does it have any observed downsides?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bf5zdsw7rs35a7du
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ9x8cACgkQj4D7WH0S
/k7koAf/YVOXjn84hUe4kholovHdP33N9knbcBZU99qKYKw6Awhul9KzQ9Db8U+Z
Jr93NmbPIxn8MV/KYtCBpR7t89G97nby8HqudOWp3Iovi5CdPHv/BguydLqLLUCf
HK3PcN85w54/q46R+xaXA12ERqOr/n/IyqwR5z00wlNKhAXVbrFNn5pDRvOboaez
mx95r/ayQYElQOnY6QCynqhQRN5RuhRLT7GXPlDFIpvDXEGCE3Xn2JVa+hE8PG0U
KChg23/3/YmdqYJan8VnmZk5b5+9r6INsrpz67MKofC2k60VBVrRffqI7qRlGDdF
C8+gXoseCFmdESPEhRYsXZfEorpLAw==
=WEUg
-----END PGP SIGNATURE-----

--bf5zdsw7rs35a7du--
