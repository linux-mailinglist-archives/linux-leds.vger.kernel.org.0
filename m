Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5441386B7
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jan 2020 14:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732946AbgALN4e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jan 2020 08:56:34 -0500
Received: from vm1.sequanux.org ([188.165.36.56]:53754 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732948AbgALN4e (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Jan 2020 08:56:34 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id D2FC2108639;
        Sun, 12 Jan 2020 14:56:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7BMPhpTweoVe; Sun, 12 Jan 2020 14:56:30 +0100 (CET)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 5ECDD1080C3;
        Sun, 12 Jan 2020 14:56:30 +0100 (CET)
Date:   Sun, 12 Jan 2020 14:56:30 +0100
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Vincent Donnefort <vdonnefort@gmail.com>
Subject: Re: [PATCH 2/2] leds: ns2: Convert to GPIO descriptors
Message-ID: <20200112135630.GF21102@kw.sim.vm.gnt>
References: <20200107141030.74052-1-linus.walleij@linaro.org>
 <20200107141030.74052-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EemXnrF2ob+xzFeB"
Content-Disposition: inline
In-Reply-To: <20200107141030.74052-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--EemXnrF2ob+xzFeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2020 at 03:10:29PM +0100, Linus Walleij wrote:
> This converts the NS2 LED driver to use GPIO descriptors.
> We take care to request the GPIOs "as is" which is what
> the current driver goes to lengths to achieve, then we use
> GPIOs throughout.
>=20
> As the nodes for each LED does not have any corresponding
> device, we need to use the DT-specific accessors to get these
> GPIO descriptors from the device tree.
>=20
> Cc: Simon Guinot <simon.guinot@sequanux.org>
> Cc: Vincent Donnefort <vdonnefort@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hi Linus and Pavel,

I have tested this patches on a LaCie d2 Network v2 board and the LEDs
are still working as expected.

Tested-by: Simon Guinot <simon.guinot@sequanux.org>

> ---
>  drivers/leds/leds-ns2.c | 73 +++++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
> index 6d37dda12c39..538ca5755602 100644
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@ -33,8 +33,8 @@ struct ns2_led_modval {
>  struct ns2_led {
>  	const char	*name;
>  	const char	*default_trigger;
> -	unsigned	cmd;
> -	unsigned	slow;
> +	struct gpio_desc *cmd;
> +	struct gpio_desc *slow;
>  	int		num_modes;
>  	struct ns2_led_modval *modval;
>  };
> @@ -53,8 +53,8 @@ struct ns2_led_platform_data {
> =20
>  struct ns2_led_data {
>  	struct led_classdev	cdev;
> -	unsigned int		cmd;
> -	unsigned int		slow;
> +	struct gpio_desc	*cmd;
> +	struct gpio_desc	*slow;
>  	bool			can_sleep;
>  	unsigned char		sata; /* True when SATA mode active. */
>  	rwlock_t		rw_lock; /* Lock GPIOs. */
> @@ -70,8 +70,8 @@ static int ns2_led_get_mode(struct ns2_led_data *led_da=
t,
>  	int cmd_level;
>  	int slow_level;
> =20
> -	cmd_level =3D gpio_get_value_cansleep(led_dat->cmd);
> -	slow_level =3D gpio_get_value_cansleep(led_dat->slow);
> +	cmd_level =3D gpiod_get_value_cansleep(led_dat->cmd);
> +	slow_level =3D gpiod_get_value_cansleep(led_dat->slow);
> =20
>  	for (i =3D 0; i < led_dat->num_modes; i++) {
>  		if (cmd_level =3D=3D led_dat->modval[i].cmd_level &&
> @@ -104,15 +104,15 @@ static void ns2_led_set_mode(struct ns2_led_data *l=
ed_dat,
>  	write_lock_irqsave(&led_dat->rw_lock, flags);
> =20
>  	if (!led_dat->can_sleep) {
> -		gpio_set_value(led_dat->cmd,
> -			       led_dat->modval[i].cmd_level);
> -		gpio_set_value(led_dat->slow,
> -			       led_dat->modval[i].slow_level);
> +		gpiod_set_value(led_dat->cmd,
> +				led_dat->modval[i].cmd_level);
> +		gpiod_set_value(led_dat->slow,
> +				led_dat->modval[i].slow_level);
>  		goto exit_unlock;
>  	}
> =20
> -	gpio_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
> -	gpio_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
> +	gpiod_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
> +	gpiod_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
> =20
>  exit_unlock:
>  	write_unlock_irqrestore(&led_dat->rw_lock, flags);
> @@ -200,26 +200,6 @@ create_ns2_led(struct platform_device *pdev, struct =
ns2_led_data *led_dat,
>  	int ret;
>  	enum ns2_led_modes mode;
> =20
> -	ret =3D devm_gpio_request_one(&pdev->dev, template->cmd,
> -			gpio_get_value_cansleep(template->cmd) ?
> -			GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
> -			template->name);
> -	if (ret) {
> -		dev_err(&pdev->dev, "%s: failed to setup command GPIO\n",
> -			template->name);
> -		return ret;
> -	}
> -
> -	ret =3D devm_gpio_request_one(&pdev->dev, template->slow,
> -			gpio_get_value_cansleep(template->slow) ?
> -			GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
> -			template->name);
> -	if (ret) {
> -		dev_err(&pdev->dev, "%s: failed to setup slow GPIO\n",
> -			template->name);
> -		return ret;
> -	}
> -
>  	rwlock_init(&led_dat->rw_lock);
> =20
>  	led_dat->cdev.name =3D template->name;
> @@ -229,8 +209,8 @@ create_ns2_led(struct platform_device *pdev, struct n=
s2_led_data *led_dat,
>  	led_dat->cdev.groups =3D ns2_led_groups;
>  	led_dat->cmd =3D template->cmd;
>  	led_dat->slow =3D template->slow;
> -	led_dat->can_sleep =3D gpio_cansleep(led_dat->cmd) |
> -				gpio_cansleep(led_dat->slow);
> +	led_dat->can_sleep =3D gpiod_cansleep(led_dat->cmd) |
> +				gpiod_cansleep(led_dat->slow);
>  	if (led_dat->can_sleep)
>  		led_dat->cdev.brightness_set_blocking =3D ns2_led_set_blocking;
>  	else
> @@ -285,17 +265,26 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns=
2_led_platform_data *pdata)
>  		const char *string;
>  		int i, num_modes;
>  		struct ns2_led_modval *modval;
> +		struct gpio_desc *gd;
> =20
> -		ret =3D of_get_named_gpio(child, "cmd-gpio", 0);
> -		if (ret < 0)
> -			goto err_node_put;
> -		led->cmd =3D ret;
> -		ret =3D of_get_named_gpio(child, "slow-gpio", 0);
> -		if (ret < 0)
> -			goto err_node_put;
> -		led->slow =3D ret;
>  		ret =3D of_property_read_string(child, "label", &string);
>  		led->name =3D (ret =3D=3D 0) ? string : child->name;
> +
> +		gd =3D gpiod_get_from_of_node(child, "cmd-gpio", 0,
> +					    GPIOD_ASIS, led->name);
> +		if (IS_ERR(gd)) {
> +			ret =3D PTR_ERR(gd);
> +			goto err_node_put;
> +		}
> +		led->cmd =3D gd;
> +		gd =3D gpiod_get_from_of_node(child, "slow-gpio", 0,
> +					    GPIOD_ASIS, led->name);
> +		if (IS_ERR(gd)) {
> +			ret =3D PTR_ERR(gd);
> +			goto err_node_put;
> +		}
> +		led->slow =3D gd;
> +
>  		ret =3D of_property_read_string(child, "linux,default-trigger",
>  					      &string);
>  		if (ret =3D=3D 0)
> --=20
> 2.23.0

--EemXnrF2ob+xzFeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl4bJY0ACgkQzyg/RDPm
szrophAAncRkakqtcf7bv0ZTYyPzJ3oNincknLggrAG9ySzRg6XpKeXqSYHgqaTQ
4VlKKNkk8/p2xwLIoyXt06wU8Zl3AzlNR93zEhVwodly1zel9Py/HnNWaGclvfYE
no62WgUa6P1r4F9aqiCNcIDJYLfQFo+PM9wo6+DvAeo4ei/4MLqQqH+BlNtFeXaG
/rVR8cH8wniZLVyyBDm/FuWL3AeKe9yS2pKjwranimPhLvF19FQU0Zerd/M2QdnV
06fWD/Ee8a+nWYy2CiYFGRhEbgotfHgvzS45+zNJZcv2zKu/5uMiwI/nIi6cT9dU
WgI9K4YBfgKdPzyrSlgxWzgt6MgeLJDvL0BPg+y38N9Y6yg0MQPc7UkrHyJKZrLb
1btr7dRP8GaUY1SdFnAWsNGYfY6FONLlF/Qq4muAIMof9VndD7bLBZr4LMknBSng
b4UhBdR2z1QrULcDqy5ucDk9yiLwLD4EWWnJBfMDykwKk3BfARtgNxAVj9zAEnlw
pnUOvKc7Vh5bqUf1AlPQIe9KXxbGn42IrAuozrqey7OmHwS3CNlYOvz1GLc+Lc4i
AjlQlqdYFl437hI7BxnCELbHhKiQTd4dU+r0C2ZlgrejIn98b6DjO07o3BorXo/r
ejs6qfsx+3nEfbQBdaeNO1y19YdIZt6dWjnQsRX+nkGbrbfhz/Q=
=VG2k
-----END PGP SIGNATURE-----

--EemXnrF2ob+xzFeB--
