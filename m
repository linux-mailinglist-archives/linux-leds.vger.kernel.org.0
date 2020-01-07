Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C63613228B
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2020 10:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgAGJef (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jan 2020 04:34:35 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35388 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgAGJef (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2020 04:34:35 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D70361C24DF; Tue,  7 Jan 2020 10:34:31 +0100 (CET)
Date:   Tue, 7 Jan 2020 10:34:31 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Pavel Machek <pavel@denx.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200107093431.GA21375@amd>
References: <20191219093947.15502-1-u.kleine-koenig@pengutronix.de>
 <20191219093947.15502-4-u.kleine-koenig@pengutronix.de>
 <20191221184047.GC32732@amd>
 <20191223100828.bqtda4zilc74fqfk@pengutronix.de>
 <20200106185918.GB597279@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200106185918.GB597279@kroah.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > +static ssize_t dev_store(struct device *dev,
> > > > +			 struct device_attribute *attr, const char *buf,
> > > > +			 size_t size)
> > > > +{
> > > > +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata=
(dev);
> > > > +	struct tty_struct *tty;
> > > > +	unsigned major, minor;
> > > > +	int ret;
> > > > +
> > > > +	if (size =3D=3D 0 || (size =3D=3D 1 && buf[0] =3D=3D '\n')) {
> > > > +		tty =3D NULL;
> > > > +	} else {
> > > > +		ret =3D sscanf(buf, "%u:%u", &major, &minor);
> > > > +		if (ret < 2)
> > > > +			return -EINVAL;
> > >=20
> > > If user writes 1:2:badparsingofdata into the file, it will pass, righ=
t?
> >=20
> > Yes, and it will have the same effect as writing 1:2. I wonder if this
> > is bad.

It is.

> > > > +static void ledtrig_tty_work(struct work_struct *work)
> > > > +{
> > > > +	struct ledtrig_tty_data *trigger_data =3D
> > > > +		container_of(work, struct ledtrig_tty_data, dwork.work);
> > > > +	struct serial_icounter_struct icount;
> > > > +	int ret;
> > > > +
> > > > +	if (!trigger_data->tty) {
> > > > +		led_set_brightness(trigger_data->led_cdev, LED_OFF);
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	ret =3D tty_get_icount(trigger_data->tty, &icount);
> > > > +	if (ret)
> > > > +		return;
> > > > +
> > > > +	if (icount.rx !=3D trigger_data->rx ||
> > > > +	    icount.tx !=3D trigger_data->tx) {
> > > > +		unsigned long delay_on =3D 100, delay_off =3D 100;
> > > > +
> > > > +		led_blink_set_oneshot(trigger_data->led_cdev,
> > > > +				      &delay_on, &delay_off, 0);
> > > > +
> > > > +		trigger_data->rx =3D icount.rx;
> > > > +		trigger_data->tx =3D icount.tx;
> > > > +	}
> > >=20
> > > Since you are polling this, anyway, can you just manipulate brightness
> > > directly instead of using _oneshot()? _oneshot() will likely invoke
> > > another set of workqueues.
> >=20
> > I copied that from the netdev trigger. I failed to find a suitable
> > helper function, did I miss that or does it need creating?

You don't need helper function. You are periodically checking the
statistics, anyway, so use it to turn the LED on/off directly, without
oneshot helper, which uses another workqueue internally.

> > > LED triggers were meant to operate directly from the events, not based
> > > on statistics like this.
> >=20
> > Ditto; just copied from the netdev trigger. I tried to find a suitable
> > place to add a trigger in the core, but this is hard without having to
> > modify all drivers; additionally this is in thier hot path. So I
> > considered using statistics a good idea. Greg also liked it and someone
> > before us for the network trigger, too ...
>=20
> This still looks ok to me, any objections to me merging it in my tty
> tree?

Yes.

I guess using statistics is kind-off acceptable, but the stuff I quote
above is not.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4UUKcACgkQMOfwapXb+vL5uQCeNvf67t8PqZ5q4MRcA2WOqY84
aLAAn27T5jw20c56A+HcP426wvkLKthd
=02sm
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
