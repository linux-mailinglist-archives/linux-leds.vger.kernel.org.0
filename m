Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3170921C4EC
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2020 17:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgGKP5i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 11 Jul 2020 11:57:38 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46258 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbgGKP5i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 11 Jul 2020 11:57:38 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1F7CE1C0BD2; Sat, 11 Jul 2020 17:57:35 +0200 (CEST)
Date:   Sat, 11 Jul 2020 17:57:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v29 03/16] leds: multicolor: Introduce a multicolor class
 definition
Message-ID: <20200711155734.GA21726@amd>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20200622185919.2131-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce a multicolor class that groups colored LEDs
> within a LED node.

> +What:		/sys/class/leds/<led>/multi_intensity
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Intensity level for the LED color within an array of integers.

? "This file contains array of integers".

> +		The intensities for each color must be entered based on the
> +		multi_index array.

This does not make sense to me. "Order of components is described by
the multi_index array"?

> The max_intensity should not exceed

"max_intensity" -> "maximum intensity"?

> +		/sys/class/leds/<led>/max_brightness.

> +Multicolor Class Brightness Control
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The multicolor class framework will calculate each monochrome LEDs inten=
sity.

?

> +static ssize_t multi_intensity_store(struct device *dev,
> +				struct device_attribute *intensity_attr,
> +				const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
> +	int nrchars, offset =3D 0;
> +	int intensity_value[LED_COLOR_ID_MAX];
> +	int i;
> +	ssize_t ret;
> +
> +	mutex_lock(&led_cdev->led_access);
> +
> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
> +		ret =3D sscanf(buf + offset, "%i%n",
> +			     &intensity_value[i], &nrchars);
> +		if (ret !=3D 1) {
> +			dev_dbg(led_cdev->dev,
> +				"Incorrect number of LEDs expected %i values intensity was not appli=
ed\n",
> +				mcled_cdev->num_colors);
> +			ret =3D -EINVAL;
> +			goto err_out;
> +		}
> +		offset +=3D nrchars;
> +	}
> +
> +	/* account for the space at the end of the buffer */
> +	offset++;

space? I'd expect \n there. And it would be good to verify it is
indeed \n, so that for example "0 0 0b" is not accepted.

Please remove the dev_dbg()s that can be triggered by userspace. We
don't want users spamming the logs.

> +static ssize_t multi_intensity_show(struct device *dev,
> +			      struct device_attribute *intensity_attr,
> +			      char *buf)
> +{
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
> +	int len =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
> +		len +=3D sprintf(buf + len, "%d",
> +			       mcled_cdev->subled_info[i].intensity);
> +		len +=3D sprintf(buf + len, " ");

We should not really put " " before newline.

> +static ssize_t multi_index_show(struct device *dev,
> +			      struct device_attribute *multi_index_attr,
> +			      char *buf)
> +{
> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
> +		index =3D mcled_cdev->subled_info[i].color_index;
> +		len +=3D sprintf(buf + len, "%s", led_colors[index]);
> +		len +=3D sprintf(buf + len, " ");
> +	}

We should not really put " " before newline.

> +{
> +	struct led_classdev *led_cdev;
> +
> +	if (!mcled_cdev)
> +		return -EINVAL;
> +
> +	if (!mcled_cdev->num_colors)
> +		return -EINVAL;

It is plain int, so you may want to check for <=3D 0? Or maybe make it
unsigned?

> +MODULE_LICENSE("GPL v2");

If your legal department allows that, GPL v2+ would be preffered
(globally).

> +struct mc_subled {
> +	int color_index;
> +	int brightness;
> +	int intensity;
> +	int channel;
> +};
> +
> +struct led_classdev_mc {
> +	/* led class device */
> +	struct led_classdev led_cdev;
> +	int num_colors;
> +
> +	struct mc_subled *subled_info;
> +};

Would some "unsigned"s make sense here to cut number of corner cases?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8J4W4ACgkQMOfwapXb+vKH+QCeKT1Udif6m7xNGEBzvGZd+FuN
MBoAoIoLjg2c6JgcTC4sA+OJgOAaBnuQ
=lZ/X
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
