Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE828293B75
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 14:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394360AbgJTMZQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 08:25:16 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46658 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394323AbgJTMZQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 08:25:16 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DD2F21C0B87; Tue, 20 Oct 2020 14:25:14 +0200 (CEST)
Date:   Tue, 20 Oct 2020 14:25:14 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v9 1/3] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
Message-ID: <20201020122514.GB19856@duo.ucw.cz>
References: <20201018204022.910815-1-u.kleine-koenig@pengutronix.de>
 <20201018204022.910815-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline
In-Reply-To: <20201018204022.910815-2-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi1

> Introduce a new function tty_kopen_shared() that yields a struct
> tty_struct. The semantic difference to tty_kopen() is that the tty is
> expected to be used already. So rename tty_kopen() to
> tty_kopen_exclusive() for clearness, adapt the single user and put the
> common code in a new static helper function.
>=20
> tty_kopen_shared is to be used to implement an LED trigger for tty
> devices in one of the next patches.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/accessibility/speakup/spk_ttyio.c |  2 +-
>  drivers/tty/tty_io.c                      | 56 +++++++++++++++--------
>  include/linux/tty.h                       |  5 +-
>  3 files changed, 42 insertions(+), 21 deletions(-)

> -struct tty_struct *tty_kopen(dev_t device)
> +static struct tty_struct *tty_kopen(dev_t device, int shared)
>  {

bool? Otherwise I see nothing obviously wrong here.

But this is for Greg..

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX47XKgAKCRAw5/Bqldv6
8poUAJ47GGYkX0YR4cHDjohRyEs37ykMqACfeZ5CWvzwaW2K1qVEzjEWXbYwCZ8=
=70vk
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
