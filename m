Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFF631F590
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 09:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhBSIBb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 03:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhBSIBa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 03:01:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DB7C061786
        for <linux-leds@vger.kernel.org>; Fri, 19 Feb 2021 00:00:49 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lD0iP-00065p-7l; Fri, 19 Feb 2021 09:00:41 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lD0iN-0002Mb-Aj; Fri, 19 Feb 2021 09:00:39 +0100
Date:   Fri, 19 Feb 2021 09:00:38 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v11] leds: trigger: implement a tty trigger
Message-ID: <20210219080038.et46fcrha7ymw6b3@pengutronix.de>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
 <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
 <X/8cwD51DYhzRdDO@kroah.com>
 <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
 <20210218133733.GB12948@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q6kwadylrbth3xza"
Content-Disposition: inline
In-Reply-To: <20210218133733.GB12948@duo.ucw.cz>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--q6kwadylrbth3xza
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

On Thu, Feb 18, 2021 at 02:37:33PM +0100, Pavel Machek wrote:
> Close, but see below:
>=20
> > +static ssize_t ttyname_store(struct device *dev,
> > +			     struct device_attribute *attr, const char *buf,
> > +			     size_t size)
> > +{
> > +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev=
);
> > +	char *ttyname;
> > +	ssize_t ret =3D size;
> > +	bool running;
> > +
> > +	if (size > 0 && buf[size - 1] =3D=3D '\n')
> > +		size -=3D 1;
> > +
> > +	if (size) {
> > +		ttyname =3D kmemdup_nul(buf, size, GFP_KERNEL);
> > +		if (!ttyname) {
> > +			ret =3D -ENOMEM;
> > +			goto out_unlock;
>=20
> Unlock without a lock:
>=20
> > +out_unlock:
> > +	mutex_unlock(&trigger_data->mutex);

Indeed, I prepare an incremental patch that does return -ENOMEM instead
of goto out_unlock.

> > +
> > +	if (ttyname && !running)
> > +		ledtrig_tty_restart(trigger_data);
> > +
> > +	return ret;
> > +}
>=20
> > +
> > +		tty =3D tty_kopen_shared(devno);
> > +		if (IS_ERR(tty) || !tty)
> > +			/* What to do? retry or abort */
> > +			goto out;
>=20
> Abort would make sense to me.

In this case it would IMHO be sensible to already try the
tty_kopen_shared() in ttyname_store() and let that one fail if the tty
doesn't exist. I'll have to go through the history of this patch set, if
I remember correctly it was like that at one point.

> > +	if (icount.rx !=3D trigger_data->rx ||
> > +	    icount.tx !=3D trigger_data->tx) {
> > +		led_set_brightness(trigger_data->led_cdev, LED_ON);
>=20
> Please use _sync version.

OK, there are too many variants for me. I'll just believe you that
led_set_brightness_sync is the right one. (Hmm, on the other hand I'll
have to understand the difference for a good commit log. I'll dig into
that. "Pavel said so" probably isn't good enough :-))

Best regards and thanks for your review,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--q6kwadylrbth3xza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAvcCMACgkQwfwUeK3K
7Ak6kAf+ORfjH9Vt/IPGPAcl1T1fJrGcnokGruItFNxB3+WdEIPBZsw9iLkunAAO
tTkxGrn2tJuwkfJMsaucERnbM9daBXoAqQmDBEjp0JBWris2SfparsDnDPcSIJMG
RY9pN+1ChEPVm1hWiXd9S73jr8aMOjxJ1DppjtZeuzbwXDmujdnDCqcQ1dxZ+1TJ
4b55YZtTe8CGTfpKcX4/LpaUXII8wF4Iy7F+vM5axNoTpJYxViJEJimgHLoXQwaH
pj8R5oWMqzWN/9Cg+yGxDO4bDvGhQ5VNpNWTdiCh4reDo3rNzt7LjM7nbpgAYcgv
bvq0/yAwrMeakYN7NTJL827JWDWEXg==
=QeMs
-----END PGP SIGNATURE-----

--q6kwadylrbth3xza--
