Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194FA1B894B
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 22:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgDYUXK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 16:23:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53508 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUXK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 16:23:10 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C17151C0238; Sat, 25 Apr 2020 22:23:07 +0200 (CEST)
Date:   Sat, 25 Apr 2020 22:23:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 03/17] leds: multicolor: Introduce a multicolor class
 definition
Message-ID: <20200425202306.GA23926@amd>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20200423155524.13971-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

ting/sysfs-class-led-multicolor
> new file mode 100644
> index 000000000000..ada0dbecfeab
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -0,0 +1,42 @@
> +What:		/sys/class/leds/<led>/multi_led_index
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read
> +		The multi_led_index array, when read, will output the LED colors
> +		by name as they are indexed in the multi_led_intensity file.

Can we make it multi_index? We are already in leds directory, and it
is a bit shorter.

> +What:		/sys/class/leds/<led>/num_multi_leds
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read
> +		The num_multi_leds indicates the number of LEDs defined in the
> +		multi_led_intensity and multi_led_index files.

Please drop this one.

> +What:		/sys/class/leds/<led>/multi_led_intensity
> +Date:		March 2020
> +KernelVersion:	5.8
> +Contact:	Dan Murphy <dmurphy@ti.com>
> +Description:	read/write
> +		Intensity level for the LED color within the array.
> +		The intensities for each color must be entered based on the
> +		multi_led_index array.

And let this one be multi_intensity.

> +For more details on hue and lightness notions please refer to
> +https://en.wikipedia.org/wiki/CIECAM02.

I'd drop this reference. multi_intensity file controls both hue and
saturation AFAICT.

> +Example:
> +A user first writes the multi_led_intensity file with the brightness lev=
els
> +for each LED that are necessary to achieve a blueish violet output from a
> +multicolor LED group.

I don't believe we can guarantee that. 255/255/255 will produce
different colors on different hardware (not white), and 43/226/138
will also produce different colors....

> +cat /sys/class/leds/multicolor:status/multi_led_index
> +green blue red

Hmm. We should really make sure LEDs are ordered as "red green
blue". Yes, userspace should support any order, but...

> +The user can control the brightness of that multicolor LED group by writ=
ing the
> +parent 'brightness' control.  Assuming a parent max_brightness of 255 th=
e user

delete "parent", twice?


> +	for (i =3D 0; i < mcled_cdev->num_colors; i++)
> +		mcled_cdev->multicolor_info[i].color_brightness =3D brightness *
> +					  mcled_cdev->multicolor_info[i].color_led_intensity /
> +					  led_cdev->max_brightness;

It would be good to get this under ~80 characters. Perhaps shorter
identifiers would help... shortening multicolor_ to mc_?

> +static ssize_t multi_led_intensity_store(struct device *dev,
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
> +			dev_err(led_cdev->dev,

dev_dbg, at most. It is user-triggerable.

> +				"Incorrect number of LEDs expected %i values intensity was not appli=
ed\n",
> +				mcled_cdev->num_colors);
> +			goto err_out;

Should not we return -ERRNO to userspace on error?

> +		}
> +		offset +=3D nrchars;
> +	}

This checks for "not enough" intensities. Do we need check for "too
many" intensities?

> +static ssize_t multi_led_intensity_show(struct device *dev,
> +			      struct device_attribute *intensity_attr,
> +			      char *buf)
> +{
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
> +	int len =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < mcled_cdev->num_colors; i++)
> +		len +=3D sprintf(buf + len, "%d ",
> +			    mcled_cdev->multicolor_info[i].color_led_intensity);
> +
> +	len +=3D sprintf(buf + len, "%s", "\n");

This will result in extra " " before end of line.

Please don't use "%s", "\n" to add single character. "\n" would be enough.


> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
> +	int len =3D 0;
> +	int index;
> +	int i;
> +
> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
> +		index =3D mcled_cdev->multicolor_info[i].color_index;
> +		len +=3D sprintf(buf + len, "%s ", led_colors[index]);
> +	}
> +
> +	len +=3D sprintf(buf + len, "%s", "\n");

Same here.

> +int led_classdev_multicolor_register_ext(struct device *parent,
> +				     struct led_classdev_mc *mcled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	struct led_classdev *led_cdev;
> +
> +	if (!mcled_cdev)
> +		return -EINVAL;
> +
> +	if (!mcled_cdev->num_colors)
> +		return -EINVAL;

if (num_colors > max)... ?

> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED

Usual style is "_LINUX_MULTICOLOR_LEDS_H".

> +#else
> +
> +static inline  int led_classdev_multicolor_register_ext(struct device *p=
arent,

double space after "inline".

> +					    struct led_classdev_mc *mcled_cdev,
> +					    struct led_init_data *init_data)
> +{
> +	return -EINVAL;
> +}

Do we need to include these stubs? I guess it is okay to have them,
OTOH I'd expect drivers to depend on MULTICOLOR being available...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6knCoACgkQMOfwapXb+vIlngCfVtVp+9AEDBtMLIKrXWNdHdO1
U80AoLCygmEY8j6xNGdmLlZpdZ8FFP3i
=wf6Q
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
