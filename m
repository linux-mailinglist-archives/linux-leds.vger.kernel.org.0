Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B307A34A136
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 06:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhCZF4d (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 01:56:33 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:35061 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhCZF4S (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Mar 2021 01:56:18 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.50.81]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MekKJ-1lxcgt0pBF-00apl5; Fri, 26 Mar 2021 06:56:06 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1lPfRx-00082x-Ib; Fri, 26 Mar 2021 06:56:03 +0100
Date:   Fri, 26 Mar 2021 06:56:00 +0100
From:   Alexander Dahl <post@lespocky.de>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     pavel@ucw.cz, dmurphy@ti.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenhuiz@axis.com, lkml@axis.com,
        kernel@axis.com
Subject: Re: [PATCH v2 2/2] leds: leds-multi-gpio: Add multiple GPIOs LED
 driver
Message-ID: <20210326055559.izdyzb5gwgwthv4i@falbala.internal.home.lespocky.de>
Mail-Followup-To: Hermes Zhang <chenhui.zhang@axis.com>, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chenhuiz@axis.com, lkml@axis.com, kernel@axis.com
References: <20210326052801.17666-1-chenhui.zhang@axis.com>
 <20210326052801.17666-3-chenhui.zhang@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cs4lbx7vbcpfyflz"
Content-Disposition: inline
In-Reply-To: <20210326052801.17666-3-chenhui.zhang@axis.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 6f292c5989afda9b2d085d8bfa787912
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:v7x3cCNJXnqWRl1ZKekmdTYrpBJ49oA5BxbbvuUZge5S8Oz7x6d
 Kj+E5ZH+yYNerivHLA+9f09FBWrC+T+DHPWXPiwdbIxoMpMUPbQbQJMmL55ZnBsbQU9148i
 WiTFwfW49YEKU9Ow2SOCGGwAPkcJHmPWI92diUJkfHxRreTeAg5RvgeMUxfc02mIetROS3M
 wogm+g43ujmiFbOTM6SYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zvOhXWEHwMQ=:mnro2AWrS3KjOlITVo78Xf
 N6w7HqHk9KWDn8QSVRY2Ix1OMbRcsGGre+/CmsduXBHvK0JNvO4JlC3ODZJL/g0TfbquYN0fg
 ZEaFuL4b6kmx3ZAtutxU9rSY/mSFG/Q2X4zNCwdkeMZbi0KsIZNEw8lWuhiVz+L8x5uBrS/kV
 GO/ntVIK1Ukyn2HHrrT+jO82qyKqseNiZYtmjb+hFbRzUHKY6cCFnzEN4jxfAjZU9fQZIBtiD
 1L2XHJ2k2MhPGLZMDP8O/JaLo4F6AwH8NlGJUDALiFrUYEu3+zPXseF7+fyiW6I1Y/A2huwgp
 7T0kAdPNTwffDUNPR+9IMQ+RfJdoa0wm9ZajXwxJp240hVTgzw8xaJgiAHe7CfW10MTptYPU0
 mX+uHvUE1jtUVG4Undn4BseJQMmDl81dphd45zS/Ub/2u1JlzXha7K3tHnauBrAS4XIlni+0Q
 UgojUhXj6P81vTSrq0BIIH+sOxt+MU6gqlBk1iIXVfpM4dU4sZTc
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--cs4lbx7vbcpfyflz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Hermes,

great to see your improved series. See below for my remarks.

On Fri, Mar 26, 2021 at 01:28:01PM +0800, Hermes Zhang wrote:
> From: Hermes Zhang <chenhuiz@axis.com>
>=20
> Introduce a new multiple GPIOs LED driver. This LED will made of
> multiple GPIOs (up to 8) and will map different brightness to different
> GPIOs states which defined in dts file.
>=20
> Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
> ---
>  drivers/leds/Kconfig                  |   3 +
>  drivers/leds/Makefile                 |   3 +
>  drivers/leds/simple/Kconfig           |  23 ++++
>  drivers/leds/simple/Makefile          |   3 +
>  drivers/leds/simple/leds-multi-gpio.c | 144 ++++++++++++++++++++++++++
>  5 files changed, 176 insertions(+)
>  create mode 100644 drivers/leds/simple/Kconfig
>  create mode 100644 drivers/leds/simple/Makefile
>  create mode 100644 drivers/leds/simple/leds-multi-gpio.c
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b6742b4231bf..f95217b2fcf1 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -937,4 +937,7 @@ source "drivers/leds/trigger/Kconfig"
>  comment "LED Blink"
>  source "drivers/leds/blink/Kconfig"
> =20
> +comment "LED Simple"
> +source "drivers/leds/simple/Kconfig"
> +
>  endif # NEW_LEDS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2a698df9da57..26917d93fa03 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -111,3 +111,6 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+=3D trigger/
> =20
>  # LED Blink
>  obj-$(CONFIG_LEDS_BLINK)                +=3D blink/
> +
> +# LED Blink
> +obj-$(CONFIG_LEDS_SIMPLE)		+=3D simple/

That comment should read "LED Simple", right?

> diff --git a/drivers/leds/simple/Kconfig b/drivers/leds/simple/Kconfig
> new file mode 100644
> index 000000000000..7aef82701f86
> --- /dev/null
> +++ b/drivers/leds/simple/Kconfig
> @@ -0,0 +1,23 @@
> +menuconfig LEDS_SIMPLE
> +	bool "Simple LED support"
> +	depends on LEDS_CLASS
> +	help
> +	  This option enables simple leds support for the leds class.
> +	  If unsure, say Y.
> +
> +if LEDS_SIMPLE
> +
> +config LEDS_MULTI_GPIO
> +	tristate "LED Support for multiple GPIOs LED"
> +	depends on LEDS_CLASS
> +	depends on GPIOLIB
> +	depends on OF
> +	help
> +	  This option enables support for a multiple GPIOs LED. Such LED is made
> +	  of multiple GPIOs and could change the brightness by setting different
> +	  states of the GPIOs.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-multi-gpio.
> +
> +endif # LEDS_SIMPLE

I'm wondering why this is part of this driver? I suppose there's no
such folder yet, although Pavel suggested. Would it make sense to put
that Kconfig menu entry and folder creation to a separate commit?

> diff --git a/drivers/leds/simple/Makefile b/drivers/leds/simple/Makefile
> new file mode 100644
> index 000000000000..2ba655fdc175
> --- /dev/null
> +++ b/drivers/leds/simple/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_LEDS_MULTI_GPIO)	+=3D leds-multi-gpio.o
> diff --git a/drivers/leds/simple/leds-multi-gpio.c b/drivers/leds/simple/=
leds-multi-gpio.c
> new file mode 100644
> index 000000000000..14fdaa5a2aac
> --- /dev/null
> +++ b/drivers/leds/simple/leds-multi-gpio.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Axis Communications AB
> + */
> +
> +#include <linux/leds.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +
> +#define MAX_GPIO_NUM  8
> +
> +struct multi_gpio_led_priv {
> +	struct led_classdev cdev;
> +
> +	struct gpio_descs *gpios;
> +
> +	u16 nr_states;
> +
> +	u8 states[0];
> +};
> +
> +
> +static void multi_gpio_led_set(struct led_classdev *led_cdev,
> +	enum led_brightness value)
> +{
> +	struct multi_gpio_led_priv *priv;
> +	int idx;
> +
> +	DECLARE_BITMAP(values, MAX_GPIO_NUM);
> +
> +	priv =3D container_of(led_cdev, struct multi_gpio_led_priv, cdev);
> +
> +	idx =3D value > led_cdev->max_brightness ? led_cdev->max_brightness : v=
alue;
> +
> +	values[0] =3D priv->states[idx];
> +
> +	gpiod_set_array_value(priv->gpios->ndescs, priv->gpios->desc,
> +	    priv->gpios->info, values);
> +}
> +
> +static int multi_gpio_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D dev->of_node;
> +	struct multi_gpio_led_priv *priv =3D NULL;
> +	int ret;
> +	const char *state =3D NULL;
> +	struct led_init_data init_data =3D {};
> +	struct gpio_descs *gpios;
> +	u16 nr_states;
> +
> +	gpios =3D devm_gpiod_get_array(dev, "led", GPIOD_OUT_LOW);
> +	if (IS_ERR(gpios))
> +		return PTR_ERR(gpios);
> +
> +	if (gpios->ndescs >=3D MAX_GPIO_NUM) {
> +		dev_err(dev, "Too many GPIOs\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D of_property_count_u8_elems(node, "led-states");
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret !=3D 1 << gpios->ndescs) {
> +		dev_err(dev, "led-states number should equal to 2^led-gpios\n");
> +		return -EINVAL;
> +	}
> +
> +	nr_states =3D ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(struct multi_gpio_led_priv)
> +			+ sizeof(u8) * nr_states , GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret =3D of_property_read_u8_array(node, "led-states", priv->states, nr_=
states);
> +	if (ret)
> +		return ret;
> +
> +	priv->gpios =3D gpios;
> +	priv->nr_states =3D nr_states;
> +
> +	priv->cdev.max_brightness =3D nr_states;
> +	priv->cdev.default_trigger =3D of_get_property(node, "linux,default-tri=
gger", NULL);
> +	priv->cdev.brightness_set =3D multi_gpio_led_set;
> +
> +	init_data.fwnode =3D of_fwnode_handle(node);
> +
> +	ret =3D devm_led_classdev_register_ext(dev, &priv->cdev, &init_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	of_property_read_string(node, "default-state", &state);
> +	if (!strcmp(state, "on"))
> +		multi_gpio_led_set(&priv->cdev, priv->cdev.max_brightness);
> +	else
> +		multi_gpio_led_set(&priv->cdev, 0);
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	return 0;
> +}
> +
> +static void multi_gpio_led_shutdown(struct platform_device *pdev)
> +{
> +	struct multi_gpio_led_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	multi_gpio_led_set(&priv->cdev, 0);
> +}
> +
> +static int multi_gpio_led_remove(struct platform_device *pdev)
> +{
> +	multi_gpio_led_shutdown(pdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id of_multi_gpio_led_match[] =3D {
> +	{ .compatible =3D "multi-gpio-led", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_multi_gpio_led_match);
> +
> +static struct platform_driver multi_gpio_led_driver =3D {
> +	.probe		=3D multi_gpio_led_probe,
> +	.remove		=3D multi_gpio_led_remove,
> +	.shutdown	=3D multi_gpio_led_shutdown,
> +	.driver		=3D {
> +		.name	=3D "multi-gpio-led",
> +		.of_match_table =3D of_multi_gpio_led_match,
> +	},
> +};
> +
> +module_platform_driver(multi_gpio_led_driver);
> +
> +MODULE_AUTHOR("Hermes Zhang <chenhui.zhang@axis.com>");
> +MODULE_DESCRIPTION("Multiple GPIOs LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:leds-multi-gpio");

I did not review thouroughly, but in my mail the indentation looks
wrong. Did checkpatch complain?

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--cs4lbx7vbcpfyflz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmBdd2oACgkQNK3NAHIh
XMb12Q//QNtfcn/enw1QMK9Ys4vpXE566etGjqfa85FWCYX0zfqNUoXmbLt7HnEK
dnotzc9t8jQTGpQFiIuT/lZbNIhrh77HSr2DyfqnA2AxVXMQVFoURhgYWeR3Fif5
VxxZWBWQNZWgXJZnxRql2mAqjyhN8Gnh/fCZJqOcD/fSvc9bKPCytJTUVajSZizR
zssjqLALlhfjIPfgq7lqjtBvplmaVAxV8UrpxiXbBut1G5EoJUT37Nmshz5sFp6/
n6wStxKMcP1IlDjm8VyQIEeh/6XPx0MvCzB3hqqNK7St6MQOy1I7OrKW4pswDKLE
W6aLx9z4q/L+rqUXg/d4pbAkltIaNpiqqFIKuT7n2m2eOiCF0tXqNz2CFvN/zzZd
tmeETdBFNTLjQd0fLbzzOriCU5Z2vcxQORkGG4tzqvKgB7vrAyj8sVKe8bIdELEy
KlxyCHIGRiak2hspABK1h9pFjey14csugFB95o75og9lmMia3cmH4Ob9M/lzaaVi
pDyoT/jr+Qhj4UJ7+5rSe8DDZVt0Wv06BIvc0bdWAQM0nINFL4RnJVkLKdS1RuCU
fIC0UDvDpdjPraxaqrFC7fy7CAMwRLgpCSZPD9/IewK+VRo+vFLUCKCXfzyVCjRB
AF0vuaSX+RwdOAdQ9qv4Um4Gr4n/c2vz6TeTea+3AFN0oZZhD/E=
=DDH4
-----END PGP SIGNATURE-----

--cs4lbx7vbcpfyflz--
