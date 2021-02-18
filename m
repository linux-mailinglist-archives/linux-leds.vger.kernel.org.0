Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899DE31ECA3
	for <lists+linux-leds@lfdr.de>; Thu, 18 Feb 2021 18:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbhBRQ5T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Feb 2021 11:57:19 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33088 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbhBRNj6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Feb 2021 08:39:58 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 54CDC1C0B96; Thu, 18 Feb 2021 14:37:33 +0100 (CET)
Date:   Thu, 18 Feb 2021 14:37:33 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v11] leds: trigger: implement a tty trigger
Message-ID: <20210218133733.GB12948@duo.ucw.cz>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
 <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
 <X/8cwD51DYhzRdDO@kroah.com>
 <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Close, but see below:

> +static ssize_t ttyname_store(struct device *dev,
> +			     struct device_attribute *attr, const char *buf,
> +			     size_t size)
> +{
> +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +	char *ttyname;
> +	ssize_t ret =3D size;
> +	bool running;
> +
> +	if (size > 0 && buf[size - 1] =3D=3D '\n')
> +		size -=3D 1;
> +
> +	if (size) {
> +		ttyname =3D kmemdup_nul(buf, size, GFP_KERNEL);
> +		if (!ttyname) {
> +			ret =3D -ENOMEM;
> +			goto out_unlock;

Unlock without a lock:

> +out_unlock:
> +	mutex_unlock(&trigger_data->mutex);
> +
> +	if (ttyname && !running)
> +		ledtrig_tty_restart(trigger_data);
> +
> +	return ret;
> +}

> +
> +		tty =3D tty_kopen_shared(devno);
> +		if (IS_ERR(tty) || !tty)
> +			/* What to do? retry or abort */
> +			goto out;

Abort would make sense to me.

> +	if (icount.rx !=3D trigger_data->rx ||
> +	    icount.tx !=3D trigger_data->tx) {
> +		led_set_brightness(trigger_data->led_cdev, LED_ON);

Please use _sync version.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC5tnAAKCRAw5/Bqldv6
8pRZAKDDhPaKHu/d3L/BzvQkd/cxuh0RdACeI7qjDXvHzWha9QIrUjivRsnhSV8=
=5t8h
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
