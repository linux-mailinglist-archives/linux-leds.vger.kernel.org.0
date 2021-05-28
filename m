Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B7939403C
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhE1JnD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbhE1JnC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:43:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07CBC06174A
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:41:24 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lmYza-0002Cr-7g; Fri, 28 May 2021 11:41:22 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lmYzZ-0006XL-M9; Fri, 28 May 2021 11:41:21 +0200
Date:   Fri, 28 May 2021 11:41:18 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 02/15] leds: leds-gpio-register: Supply description for
 param 'id'
Message-ID: <20210528094118.xw53q46i676wx6gb@pengutronix.de>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mdrebu3je54lqlzu"
Content-Disposition: inline
In-Reply-To: <20210528090629.1800173-3-lee.jones@linaro.org>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--mdrebu3je54lqlzu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Fri, May 28, 2021 at 10:06:16AM +0100, Lee Jones wrote:
> diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/leds-gpio-r=
egister.c
> index b9187e71e0cf2..de3f12c2b80d7 100644
> --- a/drivers/leds/leds-gpio-register.c
> +++ b/drivers/leds/leds-gpio-register.c
> @@ -11,6 +11,7 @@
>  /**
>   * gpio_led_register_device - register a gpio-led device
>   * @pdata: the platform data used for the new device
> + * @id: platform ID
>   *

Given that id is the first parameter and pdata the second I suggest to
swap the order here and describe id first.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mdrebu3je54lqlzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCwursACgkQwfwUeK3K
7An8FAf+MmHGbJmvOg7+qjoZXeOCznEP7N5ravdAFKRHYYDnrIDu3jD5RBWO6E7q
BAJFxljUFKxN2RmiZ6V/719agpFH1cA9oACNIdn8ddIIeRDjBubNa/A54qWa7PwS
nnvTSroK21YWYN9hfjAHIvuG+wA8x3T5FfEvW4mcHkaFru/sIPKzEyj3RnlBAUEa
WBl6A10e7T0pzM69W4rOIKHqJ2BGC7WuvsRnSkO1Mwysw4/PiuYgNtWRpDCBtOxn
109Mfb/TmhESORxWdl4EN7j4+aZ6i1JvTJSwBiqDxb0QlJhF/YNMknd6C0+162gh
R1z5ewVjGADSYWPZZarPnw56E8u3DA==
=TtFv
-----END PGP SIGNATURE-----

--mdrebu3je54lqlzu--
