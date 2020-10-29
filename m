Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0A129F3AD
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 18:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgJ2R60 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 13:58:26 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34492 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgJ2R60 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 13:58:26 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 860BE1C0B7A; Thu, 29 Oct 2020 18:58:23 +0100 (CET)
Date:   Thu, 29 Oct 2020 18:58:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, dmurphy@ti.com, robh+dt@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, marek.behun@nic.cz,
        luka.perkov@sartura.hr, andy.shevchenko@gmail.com,
        robert.marko@sartura.hr
Subject: Re: [PATCH v7 4/6] drivers: leds: Add the IEI WT61P803 PUZZLE LED
 driver
Message-ID: <20201029175823.GC26053@duo.ucw.cz>
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-5-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <20201025005916.64747-5-luka.kovacic@sartura.hr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add support for the IEI WT61P803 PUZZLE LED driver.
> Currently only the front panel power LED is supported,
> since it is the only LED on this board wired through the
> MCU.
>=20
> The LED is wired directly to the on-board MCU controller
> and is toggled using an MCU command.
>=20
> Support for more LEDs is going to be added in case more
> boards implement this microcontroller, as LEDs use many
> different GPIOs.

Not too bad.

> This driver depends on the IEI WT61P803 PUZZLE MFD driver.
>=20
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/leds/Kconfig                    |   8 ++
>  drivers/leds/Makefile                   |   1 +
>  drivers/leds/leds-iei-wt61p803-puzzle.c | 161 ++++++++++++++++++++++++
>  3 files changed, 170 insertions(+)

Can you put it into drivers/leds/simple? You'll have to create it.

> +++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Make sure this is consistent with MODULE_LICENSE("GPL");. GPLv2+ would
be nicer if you can.

> +	struct mutex lock;

Mutex is _way_ overkill for this. Please check that locking provided
by LED core is not sufficient. If not, please use atomic_t or
something.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5sCvwAKCRAw5/Bqldv6
8j2+AJ0YFU6C6xHNPs7C8KJPePRrlhWVKACeIeZqPPBPkCkofGyaQ0peDTHv+P8=
=3yWr
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
