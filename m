Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5CE32FD36
	for <lists+linux-leds@lfdr.de>; Sat,  6 Mar 2021 21:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhCFUkO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Mar 2021 15:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhCFUkG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Mar 2021 15:40:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743AEC06175F
        for <linux-leds@vger.kernel.org>; Sat,  6 Mar 2021 12:40:06 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1lIdiR-0008Lm-H2; Sat, 06 Mar 2021 21:39:59 +0100
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:7dba:e827:788e:df30])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id A471F5EF45C;
        Sat,  6 Mar 2021 20:39:55 +0000 (UTC)
Date:   Sat, 6 Mar 2021 21:39:54 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Boqun Feng <boqun.feng@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        schuchmann@schleissheimer.de
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
References: <20201102104152.GG9930@xps-13-7390>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t7snmzm7huw3tosc"
Content-Disposition: inline
In-Reply-To: <20201102104152.GG9930@xps-13-7390>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--t7snmzm7huw3tosc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello *,

On 02.11.2020 11:41:52, Andrea Righi wrote:
> We have the following potential deadlock condition:
>=20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>  WARNING: possible irq lock inversion dependency detected
>  5.10.0-rc2+ #25 Not tainted
>  --------------------------------------------------------
>  swapper/3/0 just changed the state of lock:
>  ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+0x27=
/0x200
>  but this lock took another, HARDIRQ-READ-unsafe lock in the past:
>   (&trig->leddev_list_lock){.+.?}-{2:2}
>=20
>  and interrupts could create inverse lock ordering between them.

[...]

> ---
>  drivers/leds/led-triggers.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 91da90cfb11d..16d1a93a10a8 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -378,14 +378,15 @@ void led_trigger_event(struct led_trigger *trig,
>  			enum led_brightness brightness)
>  {
>  	struct led_classdev *led_cdev;
> +	unsigned long flags;
> =20
>  	if (!trig)
>  		return;
> =20
> -	read_lock(&trig->leddev_list_lock);
> +	read_lock_irqsave(&trig->leddev_list_lock, flags);
>  	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
>  		led_set_brightness(led_cdev, brightness);
> -	read_unlock(&trig->leddev_list_lock);
> +	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_event);

meanwhile this patch hit v5.10.x stable and caused a performance
degradation on our use case:

It's an embedded ARM system, 4x Cortex A53, with an SPI attached CAN
controller. CAN stands for Controller Area Network and here used to
connect to some automotive equipment. Over CAN an ISOTP (a CAN-specific
Transport Protocol) transfer is running. With this patch, we see CAN
frames delayed for ~6ms, the usual gap between CAN frames is 240=C2=B5s.

Reverting this patch, restores the old performance.

What is the best way to solve this dilemma? Identify the critical path
in our use case? Is there a way we can get around the irqsave in
led_trigger_event()?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--t7snmzm7huw3tosc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmBD6JgACgkQqclaivrt
76m1rwf+KLjRgkIr5BXzcwO/8aQVUzeWEPQpb7c/U3NwClPoNhSv8RPLGoSd7GZq
rUTND0+a6HLVMZI62T4lzq9vMAG4DWPN7KFUyxFyyWOaHtwGfcizNb3LuH2lxaWF
RlTMT3VPgVxQxgxuK2KjPWXFHHqJxWy8AbebA1FtMiXpqVB3BcWiMWcqki3RNAdG
d9EMW48rKOYRNyjGJIWd5yFWBf9TLEy6grmlC7+9klugC47F5GgPzQp2yvUPPr8t
bPu3NXCCd6PtRS4S1Vb0IuKLr2lQ+NDVRDqjczibAGBIa5rSqAaTXrABxs41oD9L
/tlILnp/m7RLUq9htDU7JOwZsoReAA==
=PJhf
-----END PGP SIGNATURE-----

--t7snmzm7huw3tosc--
