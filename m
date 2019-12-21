Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 534D1128ADC
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 19:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfLUSkv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 13:40:51 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39836 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUSkv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 13:40:51 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E89261C24DF; Sat, 21 Dec 2019 19:40:48 +0100 (CET)
Date:   Sat, 21 Dec 2019 19:40:47 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 3/3] leds: trigger: implement a tty trigger
Message-ID: <20191221184047.GC32732@amd>
References: <20191219093947.15502-1-u.kleine-koenig@pengutronix.de>
 <20191219093947.15502-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline
In-Reply-To: <20191219093947.15502-4-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> @@ -0,0 +1,6 @@
> +What:		/sys/class/leds/<led>/dev
> +Date:		Dec 2019
> +KernelVersion:	5.6
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Specifies $major:$minor of the triggering tty

Ok, sounds reasonable.

> +static ssize_t dev_store(struct device *dev,
> +			 struct device_attribute *attr, const char *buf,
> +			 size_t size)
> +{
> +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +	struct tty_struct *tty;
> +	unsigned major, minor;
> +	int ret;
> +
> +	if (size =3D=3D 0 || (size =3D=3D 1 && buf[0] =3D=3D '\n')) {
> +		tty =3D NULL;
> +	} else {
> +		ret =3D sscanf(buf, "%u:%u", &major, &minor);
> +		if (ret < 2)
> +			return -EINVAL;

If user writes 1:2:badparsingofdata into the file, it will pass, right?

> +		tty =3D tty_kopen_shared(MKDEV(major, minor));
> +		if (IS_ERR(tty))
> +			return PTR_ERR(tty);
> +	}

Do you need to do some kind of tty_kclose()? What happens if the
device disappears, for example because the USB modem is unplugged?

> +static void ledtrig_tty_work(struct work_struct *work)
> +{
> +	struct ledtrig_tty_data *trigger_data =3D
> +		container_of(work, struct ledtrig_tty_data, dwork.work);
> +	struct serial_icounter_struct icount;
> +	int ret;
> +
> +	if (!trigger_data->tty) {
> +		led_set_brightness(trigger_data->led_cdev, LED_OFF);
> +		return;
> +	}
> +
> +	ret =3D tty_get_icount(trigger_data->tty, &icount);
> +	if (ret)
> +		return;
> +
> +	if (icount.rx !=3D trigger_data->rx ||
> +	    icount.tx !=3D trigger_data->tx) {
> +		unsigned long delay_on =3D 100, delay_off =3D 100;
> +
> +		led_blink_set_oneshot(trigger_data->led_cdev,
> +				      &delay_on, &delay_off, 0);
> +
> +		trigger_data->rx =3D icount.rx;
> +		trigger_data->tx =3D icount.tx;
> +	}

Since you are polling this, anyway, can you just manipulate brightness
directly instead of using _oneshot()? _oneshot() will likely invoke
another set of workqueues.

LED triggers were meant to operate directly from the events, not based
on statistics like this.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+Zy8ACgkQMOfwapXb+vJ0dgCeLqD9SCu9m3syOgPa93HY9ffE
mUEAoJY9gjrZcyazwvSyPr0hxWpq8WMN
=ip+U
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
