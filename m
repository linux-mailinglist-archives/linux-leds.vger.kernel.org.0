Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49C8368285
	for <lists+linux-leds@lfdr.de>; Thu, 22 Apr 2021 16:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236534AbhDVOhj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Apr 2021 10:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236465AbhDVOhi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Apr 2021 10:37:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF62BC06174A
        for <linux-leds@vger.kernel.org>; Thu, 22 Apr 2021 07:37:03 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZaRq-000211-A4; Thu, 22 Apr 2021 16:36:54 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZaRo-0003px-Pz; Thu, 22 Apr 2021 16:36:52 +0200
Date:   Thu, 22 Apr 2021 16:36:52 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Juergen Borleis <jbe@pengutronix.de>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] leds: trigger/tty: feature data direction
Message-ID: <20210422143652.wjtk7bz2f556jiru@pengutronix.de>
References: <20210422074702.8831-1-jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ot3yk6y67ms7lokt"
Content-Disposition: inline
In-Reply-To: <20210422074702.8831-1-jbe@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ot3yk6y67ms7lokt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello J=FCrgen,

On Thu, Apr 22, 2021 at 09:47:02AM +0200, Juergen Borleis wrote:
> The current implementation just signals a visible feedback on all kind of
> activity on the corresponding TTY. But sometimes it is useful to see what
> kind of activity just happens. This change adds the capability to filter
> the direction of TTY's data flow. It enables a user to forward both
> directions to separate LEDs for tx and rx on demand. Default behavior is
> still both directions.
>=20
> Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
> ---
>  Documentation/leds/ledtrig-tty.rst | 47 ++++++++++++++++++++++++++

I think putting the change to the documentation into a separate patch is
a good idea as it explains the usage in general and not only adapts it
to the changes to the source. Other than that: Thanks for this document.

>  drivers/leds/trigger/ledtrig-tty.c | 53 +++++++++++++++++++++++++++++-
>  2 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/leds/ledtrig-tty.rst
>=20
> diff --git a/Documentation/leds/ledtrig-tty.rst b/Documentation/leds/ledt=
rig-tty.rst
> new file mode 100644
> index 00000000..6fc765c
> --- /dev/null
> +++ b/Documentation/leds/ledtrig-tty.rst
> @@ -0,0 +1,47 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +LED TTY Trigger
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This LED trigger flashes the LED whenever some data flows are happen on =
the
> +corresponding TTY device. The TTY device can be freely selected, as well=
 as the
> +data flow direction.
> +
> +TTY trigger can be enabled and disabled from user space on led class dev=
ices,
> +that support this trigger as shown below::
> +
> +	echo tty > trigger
> +	echo none > trigger
> +
> +This trigger exports two properties, 'ttyname' and 'dirfilter'. When the
> +tty trigger is activated both properties are set to default values, whic=
h means
> +no related TTY device yet and the LED would flash on both directions.
> +
> +Selecting a corresponding trigger TTY::
> +
> +	echo ttyS0 > ttyname
> +
> +This LED will now flash on data flow in both directions of 'ttyS0'.
> +
> +Selecting a direction::
> +
> +	echo in > dirfilter
> +	echo out > dirfilter
> +	echo inout > dirfilter
> +
> +This selection will flash the LED on data flow in the selected direction.
> +
> +Example
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +With the 'dirfilter' property one can use two LEDs to give a user a sepa=
rate
> +visual feedback about data flow.
> +
> +Flash on data send on one LED::
> +
> +	echo ttyS0 > ttyname
> +	echo out > dirfilter
> +
> +Flash on data receive on a second LED::
> +
> +	echo ttyS0 > ttyname
> +	echo in > dirfilter
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/le=
dtrig-tty.c
> index f62db7e..d3bd231 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -14,6 +14,8 @@ struct ledtrig_tty_data {
>  	const char *ttyname;
>  	struct tty_struct *tty;
>  	int rx, tx;
> +	unsigned indirection:1;
> +	unsigned outdirection:1;
>  };
> =20
>  static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
> @@ -76,6 +78,47 @@ static ssize_t ttyname_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(ttyname);
> =20
> +static ssize_t dirfilter_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +
> +	if (trigger_data->indirection)
> +		return (ssize_t)sprintf(buf, "in\n");
> +	if (trigger_data->outdirection)
> +		return (ssize_t)sprintf(buf, "out\n");
> +	return (ssize_t)sprintf(buf, "inout\n");

I would prefer to call this TX and RX to match the UART lines. This
would then allow to expand the trigger to also blink on handshaking
signals or RI. Then maybe a file per signal is sensible?

> +}
> +
> +static ssize_t dirfilter_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +	ssize_t ret =3D size;
> +
> +	if (size > 0 && buf[size - 1] =3D=3D '\n')
> +		size -=3D 1;
> +
> +	if (size) {
> +		if (!strncmp(buf, "in", size)) {
> +			trigger_data->indirection =3D 1;
> +			trigger_data->outdirection =3D 0;
> +			return ret;
> +		}
> +		if (!strncmp(buf, "out", size)) {
> +			trigger_data->indirection =3D 0;
> +			trigger_data->outdirection =3D 1;
> +			return ret;
> +		}
> +	}
> +
> +	trigger_data->indirection =3D 0;
> +	trigger_data->outdirection =3D 0;

It would be natural to have these two =3D 1 if "inout" is written.

> +	return ret;
> +}
> +static DEVICE_ATTR_RW(dirfilter);
> +
>  static void ledtrig_tty_work(struct work_struct *work)
>  {
>  	struct ledtrig_tty_data *trigger_data =3D
> @@ -122,7 +165,14 @@ static void ledtrig_tty_work(struct work_struct *wor=
k)
> =20
>  	if (icount.rx !=3D trigger_data->rx ||
>  	    icount.tx !=3D trigger_data->tx) {
> -		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
> +		if (trigger_data->indirection) {
> +			if (icount.rx !=3D trigger_data->rx)
> +				led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
> +		} else if (trigger_data->outdirection) {
> +			if (icount.tx !=3D trigger_data->tx)
> +				led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
> +		} else
> +			led_set_brightness_sync(trigger_data->led_cdev, LED_ON);

With the above suggestion, this can be simplified to:

	if ((icount.rx !=3D trigger_data->rx && trigger_data->indirection) ||
	    (icount.tx !=3D trigger_data->tx && trigger_data->outdirection)) {
		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
	    =09
		...
	=09

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ot3yk6y67ms7lokt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCBigEACgkQwfwUeK3K
7Am48Qf9Hbki5LcmN2GsB8VCLWllTfrVpXEKQbys3S/NGhfSC39Gxy5UyKs1f03y
PuuhBjXijCYjfGRFzjCjm3t+hrMoxO0G6QWNm75duBcm8vl9Wsrwoij/jdvY1xBw
2hzTlIVQ5yCQRYvV5Dgb5J+aQRgXEyAASlbVRapdeEbMbFtfFrXYLngCtOrAEt5Q
hYdKdDYJHn+8EXtUpdWKmA/tRq+0THDA3SnkMq1WZos35A7at8ejg2vjYENsF6vI
7RzUFXx/8kPwZjYAC6ZHUh+TN9Xc7pX+QkIQZ/xpfln9KfwWu5Au8+X/RBokAt9Q
M94QwPvy+EedxFy4ZlLcSDbw83lgww==
=3hZR
-----END PGP SIGNATURE-----

--ot3yk6y67ms7lokt--
