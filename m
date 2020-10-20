Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620C7293BC3
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 14:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406251AbgJTMgN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 08:36:13 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47486 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406246AbgJTMgM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 08:36:12 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 04A411C0B8D; Tue, 20 Oct 2020 14:36:10 +0200 (CEST)
Date:   Tue, 20 Oct 2020 14:36:09 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v9 3/3] leds: trigger: implement a tty trigger
Message-ID: <20201020123609.GD19856@duo.ucw.cz>
References: <20201018204022.910815-1-u.kleine-koenig@pengutronix.de>
 <20201018204022.910815-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Xm/fll+QQv+hsKip"
Content-Disposition: inline
In-Reply-To: <20201018204022.910815-4-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Xm/fll+QQv+hsKip
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Usage is as follows:
>=20
> 	myled=3Dledname
> 	tty=3DttyS0
>=20
> 	echo tty > /sys/class/leds/$myled/trigger
> 	echo $tty > /sys/class/leds/$myled/ttyname
>=20
> . When this new trigger is active it periodically checks the tty's
> statistics and when it changed since the last check the led is flashed
> once.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---

> +static ssize_t ttyname_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +	ssize_t len =3D 0;

Unused value. Not sure if some checker will complain.

> +static ssize_t ttyname_store(struct device *dev,
> +			     struct device_attribute *attr, const char *buf,
> +			     size_t size)
> +{
> +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +	char *ttyname;
> +	ssize_t ret =3D size;

> +	ledtrig_tty_halt(trigger_data);
> +
> +	mutex_lock(&trigger_data->mutex);
> +
> +	if (size > 0 && buf[size - 1] =3D=3D '\n')
> +		size -=3D 1;
> +
> +	if (size) {
> +		ttyname =3D kmemdup_nul(buf, size, GFP_KERNEL);
> +		if (!ttyname) {
> +			ret =3D -ENOMEM;
> +			goto out_unlock;

If this happens, you return error to the user and
trigger_data->ttyname remains with the old value, but trigger is now
stopped. That is not exactly consistent.


> +static void ledtrig_tty_work(struct work_struct *work)
> +{
> +	struct ledtrig_tty_data *trigger_data =3D
> +		container_of(work, struct ledtrig_tty_data, dwork.work);
> +	struct serial_icounter_struct icount;
> +	int ret;
> +
> +	mutex_lock(&trigger_data->mutex);
> +
> +	BUG_ON(!trigger_data->ttyname);
> +
> +	/* try to get the tty corresponding to $ttyname */
> +	if (!trigger_data->tty) {
> +		dev_t devno;
> +		struct tty_struct *tty;
> +		int ret;
> +
> +		ret =3D tty_dev_name_to_number(trigger_data->ttyname, &devno);
> +		if (ret < 0)
> +			/*
> +			 * A device with this name might appear later, so keep
> +			 * retrying.
> +			 */
> +			goto out;

Poll every 100 msec... Hmm.... Okay, I guess?

> +	ret =3D tty_get_icount(trigger_data->tty, &icount);
> +	if (ret) {
> +		mutex_unlock(&trigger_data->mutex);
> +		dev_info(trigger_data->tty->dev, "Failed to get icount, stopped pollin=
g\n");
> +		mutex_unlock(&trigger_data->mutex);

Eh?

> +		return;
> +	}
> +
> +	if (icount.rx !=3D trigger_data->rx ||
> +	    icount.tx !=3D trigger_data->tx) {
> +		led_set_brightness(trigger_data->led_cdev, LED_ON);

Are you sure about LED_ON here? It should use current brightness
selected by brightness file...

> +static int ledtrig_tty_activate(struct led_classdev *led_cdev)
> +{
> +	struct ledtrig_tty_data *trigger_data;
> +
> +	trigger_data =3D kzalloc(sizeof(*trigger_data), GFP_KERNEL);
> +	if (!trigger_data)
> +		return -ENOMEM;
> +
> +	led_set_trigger_data(led_cdev, trigger_data);
> +
> +	INIT_DELAYED_WORK(&trigger_data->dwork, ledtrig_tty_work);
> +	trigger_data->led_cdev =3D led_cdev;
> +	mutex_init(&trigger_data->mutex);

How is this protected from concurrent access from sysfs?

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--Xm/fll+QQv+hsKip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX47ZuQAKCRAw5/Bqldv6
8jLcAJ4yb82/HCdd/XZfoeI9zFLNCZgJagCgiWsD9kePtsTio6g9/pFmCBGVfN4=
=WDRg
-----END PGP SIGNATURE-----

--Xm/fll+QQv+hsKip--
