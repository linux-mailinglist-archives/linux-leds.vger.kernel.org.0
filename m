Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4626E50BA
	for <lists+linux-leds@lfdr.de>; Mon, 17 Apr 2023 21:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjDQTSG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Apr 2023 15:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjDQTSE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 15:18:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4676D46A1
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 12:18:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1poUMQ-0003Wd-GC; Mon, 17 Apr 2023 21:17:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poUMP-00BwhX-Cv; Mon, 17 Apr 2023 21:17:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1poUMO-00E0ii-KV; Mon, 17 Apr 2023 21:17:56 +0200
Date:   Mon, 17 Apr 2023 21:17:56 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
Message-ID: <20230417191756.ex6b4u4lausfatqm@pengutronix.de>
References: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
 <ZD07hLV1gs+gw26s@duo.ucw.cz>
 <20230417124403.j64c2lftgyqo2a67@pengutronix.de>
 <90efe25c-fea5-cdd0-8bd3-16b9e53e8b56@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zk4nvkgtqon2zvbp"
Content-Disposition: inline
In-Reply-To: <90efe25c-fea5-cdd0-8bd3-16b9e53e8b56@gmail.com>
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


--zk4nvkgtqon2zvbp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 08:33:31PM +0200, Jacek Anaszewski wrote:
> Hi Uwe,
>=20
> On 4/17/23 14:44, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Mon, Apr 17, 2023 at 02:28:52PM +0200, Pavel Machek wrote:
> > > > After commit ba8a86e4dadb ("leds: trigger/tty: Use
> > > > led_set_brightness_sync() from workqueue") this is the second try to
> > > > pick the right function to set the LED brightness from a trigger.
> > > >=20
> > > > led_set_brightness_sync() has the problem that it doesn't work for =
LEDs
> > > > without a .brightness_set_blocking() callback. This is (among other=
s)
> > > > the case for LEDs connected to non-sleeping GPIOs.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >=20
> > > I don't think this is right.
> > >=20
> > > _nosleep calls _nopm, which assmues it can't sleep, and schedules
> > > another workqueue to set the LED.
> >=20
> > Then which is the right variant?
> > led_set_brightness() and led_set_brightness_nosleep() set via a workque=
ue
> > (which is bad) and led_set_brightness_sync() doesn't work for some LEDs
> > (notably LEDs on non-sleeping GPIOs).
>=20
> Can you remind me the context of this patch, why using workqueue is
> bad here?

The workqueue is only needed if you have a slow LED and want to set the
brightness in atomic context. However if you are allowed to sleep that
is just needless overhead.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zk4nvkgtqon2zvbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ9m2MACgkQj4D7WH0S
/k4bPwgArIjCj9M3qYdcvF6L7RU2bru+ouV3C/a4GV9uv+k/SdAIdsu55/lKWfFD
dWanHHRqpLQfH4nHfPFvjGOiKselx53G5Usn1JAaugdU3UW1RmJKP06Pt1dNwH1Z
1B4N6E4A5PycUBcPZEW9BBqMej4Y4g8m0DXtHVnbV6GXopo7SVpkhLRA+cSy/sJK
eAPCexXek8s9AsEQNPJ5pBb0K8Z55V2WZozM63/WuV3bI0eH8b+LrI/g22+F2BzO
Lup9iAG1Cs65s7vYDrU9APo1cZPMWiYVbuHXRMQeFX3ndDBYC7rEKyqvOVsGvdT+
kqbK85Y/3adZPDTWAIIDtmETVg7Buw==
=HAF+
-----END PGP SIGNATURE-----

--zk4nvkgtqon2zvbp--
