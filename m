Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D52621C80C
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 10:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgGLIY6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 04:24:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50330 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGLIY6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 04:24:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 50FAD1C0BD2; Sun, 12 Jul 2020 10:24:54 +0200 (CEST)
Date:   Sun, 12 Jul 2020 10:24:53 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v7 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200712082453.GI8295@amd>
References: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
 <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HkMjoL2LAeBLhbFV"
Content-Disposition: inline
In-Reply-To: <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--HkMjoL2LAeBLhbFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> @@ -0,0 +1,6 @@
> +What:		/sys/class/leds/<led>/ttyname
> +Date:		Jul 2020
> +KernelVersion:	5.8
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Specifies the tty device name of the triggering tty
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index ce9429ca6dde..40ff08c93f56 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -144,4 +144,11 @@ config LEDS_TRIGGER_AUDIO
>  	  the audio mute and mic-mute changes.
>  	  If unsure, say N
> =20
> +config LEDS_TRIGGER_TTY
> +	tristate "LED Trigger for TTY devices"
> +	depends on TTY
> +	help
> +	  This allows LEDs to be controlled by activity on ttys which includes
> +	  serial devices like /dev/ttyS0.

"This driver can be built as a module, resulting module will be
named.. If unsure, say N."

> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0

2.0+ is preffered.

> +
> +	while (firstrun ||
> +	       icount.rx !=3D trigger_data->rx ||
> +	       icount.tx !=3D trigger_data->tx) {
> +
> +		led_set_brightness(trigger_data->led_cdev, LED_ON);
> +
> +		msleep(100);
> +
> +		led_set_brightness(trigger_data->led_cdev, LED_OFF);

Is this good idea inside workqueue?

> +		trigger_data->rx =3D icount.rx;
> +		trigger_data->tx =3D icount.tx;
> +		firstrun =3D false;
> +
> +		ret =3D tty_get_icount(trigger_data->tty, &icount);
> +		if (ret)
> +			return;

Unbalanced locking.

> +	}
> +
> +out:
> +	mutex_unlock(&trigger_data->mutex);
> +	schedule_delayed_work(&trigger_data->dwork, msecs_to_jiffies(100));
> +}

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HkMjoL2LAeBLhbFV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8KyNUACgkQMOfwapXb+vIRGQCfcetd56bS9agQaVauYv2lHkvb
1s8An3uDX2YeCo929pVDkPHeyNch219x
=NlJV
-----END PGP SIGNATURE-----

--HkMjoL2LAeBLhbFV--
