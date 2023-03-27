Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0276CA2F4
	for <lists+linux-leds@lfdr.de>; Mon, 27 Mar 2023 13:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbjC0L67 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Mar 2023 07:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjC0L66 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Mar 2023 07:58:58 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45801BE2
        for <linux-leds@vger.kernel.org>; Mon, 27 Mar 2023 04:58:57 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5D21A1C0AB3; Mon, 27 Mar 2023 13:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679918336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KtGQ+WBEVr9hPIr8c8jIgxnRTqSGvWIUyuYXmQfyVg8=;
        b=o1x7LmfLbM/gYYOig2CKJRnTW/kSUVtVHebkyUimCnMFhwhrxaT4qegmJi2rnajCoY42DF
        CyPE3h9Z7wF5cMX0bIL9FxjO4YE3Qf8Jr7PUnT4rYOfDPi7pDJcWYCDJUgip1LgWmwKSL2
        ZO2Ror+zuCIipjrL/RgEZgyZWwQ+ueo=
Date:   Mon, 27 Mar 2023 13:58:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Vasut <marex@denx.de>, lee.jones@linaro.org
Cc:     linux-leds@vger.kernel.org,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>
Subject: Re: [PATCH] leds: gpio: Configure per-LED pin control
Message-ID: <ZCGE/6hzeJNeJKTj@duo.ucw.cz>
References: <20221107003133.377704-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6l3u6MzT+MxU1NEp"
Content-Disposition: inline
In-Reply-To: <20221107003133.377704-1-marex@denx.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6l3u6MzT+MxU1NEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Each gpio-leds DT node DT subnode can have a pinctrl property assigned
> to it, parse the DT subnode pinctrl properties and configure each pin
> accordingly.

Do we need update to
Documentation/devicetree/bindings/leds/leds-gpio.yaml ?

Otherwise looks good to me.

Thank you,
								Pavel

> +++ b/drivers/leds/leds-gpio.c
> @@ -13,6 +13,7 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> @@ -77,6 +78,7 @@ static int create_gpio_led(const struct gpio_led *templ=
ate,
>  	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
>  {
>  	struct led_init_data init_data =3D {};
> +	struct pinctrl *pinctrl;
>  	int ret, state;
> =20
>  	led_dat->cdev.default_trigger =3D template->default_trigger;
> @@ -119,6 +121,22 @@ static int create_gpio_led(const struct gpio_led *te=
mplate,
>  						     &init_data);
>  	}
> =20
> +	if (ret)
> +		return ret;
> +
> +	pinctrl =3D devm_pinctrl_get_select_default(led_dat->cdev.dev);
> +	if (IS_ERR(pinctrl)) {
> +		ret =3D PTR_ERR(pinctrl);
> +		if (ret !=3D -ENODEV) {
> +			dev_warn(led_dat->cdev.dev,
> +				 "Failed to select %pOF pinctrl: %d\n",
> +				 to_of_node(fwnode), ret);
> +		} else {
> +			/* pinctrl-%d not present, not an error */
> +			ret =3D 0;
> +		}
> +	}
> +
>  	return ret;
>  }
> =20

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--6l3u6MzT+MxU1NEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZCGE/wAKCRAw5/Bqldv6
8qF8AJ9OOnYM/67myhOEk3cgqltSQu/cygCgoEgayhnzddD3dBMs8XGM0lL8bEw=
=v45L
-----END PGP SIGNATURE-----

--6l3u6MzT+MxU1NEp--
