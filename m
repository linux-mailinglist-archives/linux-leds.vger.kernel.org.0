Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CEE28A311
	for <lists+linux-leds@lfdr.de>; Sun, 11 Oct 2020 01:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387447AbgJJW56 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Oct 2020 18:57:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48218 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730430AbgJJS5H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Oct 2020 14:57:07 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5E40D1C0B79; Sat, 10 Oct 2020 20:57:01 +0200 (CEST)
Date:   Sat, 10 Oct 2020 20:57:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Gabriel David <ultracoolguy4@protonmail.com>
Cc:     dmurphy@ti.com, kabel@blackhole.sk, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: lm3697: Rename struct into more appropriate name
Message-ID: <20201010185700.GA8218@amd>
References: <nH0fAuRxkhh0jdtlck5LucnuXiEY2wfpLF8C8spK8hebUUZ75xQOe-PjBtR7F8jEZ84l-o9rVJ3z9xvatOAJMjvbH5qCQIO5MuSOmpWr0ZQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <nH0fAuRxkhh0jdtlck5LucnuXiEY2wfpLF8C8spK8hebUUZ75xQOe-PjBtR7F8jEZ84l-o9rVJ3z9xvatOAJMjvbH5qCQIO5MuSOmpWr0ZQ=@protonmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-10-09 15:51:35, Gabriel David wrote:
> The mentioned struct, lm3697_led, was renamed to lm3697_bank since the
> structure is representing the control banks. This name, in my opinion,
> is more semantically correct. The pointers referring to it were also
> renamed.

> Signed-off-by: Gabriel David <ultracoolguy4@protonmail.com>
> ---
> Yes, this is the same Gabriel David from ultracoolguy@tutanota.org and
> ultracoolguy@disroot.org. If you want me to confirm it I'll gladly do
> it.

No problem with that, and no need to resend. This can proably wait
for 5.11...

I'd like some comment from Dan... and perhaps I'd want to understand
what the difference between LED and bank is.

=2E..there can be more than one LED connected to the given bank, that's
what you are pointing out?

=2E..but these LEDs will always work in unison, and they are handled as
single LED by Linux, right?

Best regards,
								Pavel

>  drivers/leds/leds-lm3697.c | 90 +++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
> index 31f5ed486839..c62f95fc17e8 100644
> --- a/drivers/leds/leds-lm3697.c
> +++ b/drivers/leds/leds-lm3697.c
> @@ -39,7 +39,7 @@
>  #define LM3697_MAX_CONTROL_BANKS 2
>=20
>  /**
> - * struct lm3697_led -
> + * struct lm3697_bank -
>   * @hvled_strings: Array of LED strings associated with a control bank
>   * @label: LED label
>   * @led_dev: LED class device
> @@ -48,7 +48,7 @@
>   * @control_bank: Control bank the LED is associated to. 0 is control ba=
nk A
>   *		   1 is control bank B
>   */
> -struct lm3697_led {
> +struct lm3697_bank {
>  	u32 hvled_strings[LM3697_MAX_LED_STRINGS];
>  	char label[LED_MAX_NAME_SIZE];
>  	struct led_classdev led_dev;
> @@ -80,7 +80,7 @@ struct lm3697 {
>  	int bank_cfg;
>  	int num_banks;
>=20
> -	struct lm3697_led leds[];
> +	struct lm3697_bank banks[];
>  };
>=20
>  static const struct reg_default lm3697_reg_defs[] =3D {
> @@ -113,52 +113,52 @@ static const struct regmap_config lm3697_regmap_con=
fig =3D {
>  static int lm3697_brightness_set(struct led_classdev *led_cdev,
>  				enum led_brightness brt_val)
>  {
> -	struct lm3697_led *led =3D container_of(led_cdev, struct lm3697_led,
> +	struct lm3697_bank *bank =3D container_of(led_cdev, struct lm3697_bank,
>  					      led_dev);
> -	int ctrl_en_val =3D (1 << led->control_bank);
> +	int ctrl_en_val =3D (1 << bank->control_bank);
>  	int ret;
>=20
> -	mutex_lock(&led->priv->lock);
> +	mutex_lock(&bank->priv->lock);
>=20
>  	if (brt_val =3D=3D LED_OFF) {
> -		ret =3D regmap_update_bits(led->priv->regmap, LM3697_CTRL_ENABLE,
> +		ret =3D regmap_update_bits(bank->priv->regmap, LM3697_CTRL_ENABLE,
>  					 ctrl_en_val, ~ctrl_en_val);
>  		if (ret) {
> -			dev_err(&led->priv->client->dev, "Cannot write ctrl register\n");
> +			dev_err(&bank->priv->client->dev, "Cannot write ctrl register\n");
>  			goto brightness_out;
>  		}
>=20
> -		led->enabled =3D LED_OFF;
> +		bank->enabled =3D LED_OFF;
>  	} else {
> -		ret =3D ti_lmu_common_set_brightness(&led->lmu_data, brt_val);
> +		ret =3D ti_lmu_common_set_brightness(&bank->lmu_data, brt_val);
>  		if (ret) {
> -			dev_err(&led->priv->client->dev,
> +			dev_err(&bank->priv->client->dev,
>  				"Cannot write brightness\n");
>  			goto brightness_out;
>  		}
>=20
> -		if (!led->enabled) {
> -			ret =3D regmap_update_bits(led->priv->regmap,
> +		if (!bank->enabled) {
> +			ret =3D regmap_update_bits(bank->priv->regmap,
>  						 LM3697_CTRL_ENABLE,
>  						 ctrl_en_val, ctrl_en_val);
>  			if (ret) {
> -				dev_err(&led->priv->client->dev,
> +				dev_err(&bank->priv->client->dev,
>  					"Cannot enable the device\n");
>  				goto brightness_out;
>  			}
>=20
> -			led->enabled =3D brt_val;
> +			bank->enabled =3D brt_val;
>  		}
>  	}
>=20
>  brightness_out:
> -	mutex_unlock(&led->priv->lock);
> +	mutex_unlock(&bank->priv->lock);
>  	return ret;
>  }
>=20
>  static int lm3697_init(struct lm3697 *priv)
>  {
> -	struct lm3697_led *led;
> +	struct lm3697_bank *bank;
>  	int i, ret;
>=20
>  	if (priv->enable_gpio) {
> @@ -182,8 +182,8 @@ static int lm3697_init(struct lm3697 *priv)
>  		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
>=20
>  	for (i =3D 0; i < priv->num_banks; i++) {
> -		led =3D &priv->leds[i];
> -		ret =3D ti_lmu_common_set_ramp(&led->lmu_data);
> +		bank =3D &priv->banks[i];
> +		ret =3D ti_lmu_common_set_ramp(&bank->lmu_data);
>  		if (ret)
>  			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
>  	}
> @@ -194,7 +194,7 @@ static int lm3697_init(struct lm3697 *priv)
>  static int lm3697_probe_dt(struct lm3697 *priv)
>  {
>  	struct fwnode_handle *child =3D NULL;
> -	struct lm3697_led *led;
> +	struct lm3697_bank *bank;
>  	const char *name;
>  	int control_bank;
>  	size_t i =3D 0;
> @@ -229,63 +229,63 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>  			goto child_out;
>  		}
>=20
> -		led =3D &priv->leds[i];
> +		bank =3D &priv->banks[i];
>=20
>  		ret =3D ti_lmu_common_get_brt_res(&priv->client->dev,
> -						child, &led->lmu_data);
> +						child, &bank->lmu_data);
>  		if (ret)
>  			dev_warn(&priv->client->dev, "brightness resolution property missing\=
n");
>=20
> -		led->control_bank =3D control_bank;
> -		led->lmu_data.regmap =3D priv->regmap;
> -		led->lmu_data.runtime_ramp_reg =3D LM3697_CTRL_A_RAMP +
> +		bank->control_bank =3D control_bank;
> +		bank->lmu_data.regmap =3D priv->regmap;
> +		bank->lmu_data.runtime_ramp_reg =3D LM3697_CTRL_A_RAMP +
>  						 control_bank;
> -		led->lmu_data.msb_brightness_reg =3D LM3697_CTRL_A_BRT_MSB +
> -						   led->control_bank * 2;
> -		led->lmu_data.lsb_brightness_reg =3D LM3697_CTRL_A_BRT_LSB +
> -						   led->control_bank * 2;
> +		bank->lmu_data.msb_brightness_reg =3D LM3697_CTRL_A_BRT_MSB +
> +						   bank->control_bank * 2;
> +		bank->lmu_data.lsb_brightness_reg =3D LM3697_CTRL_A_BRT_LSB +
> +						   bank->control_bank * 2;
>=20
> -		led->num_leds =3D fwnode_property_count_u32(child, "led-sources");
> -		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
> +		bank->num_leds =3D fwnode_property_count_u32(child, "led-sources");
> +		if (bank->num_leds > LM3697_MAX_LED_STRINGS) {
>  			dev_err(&priv->client->dev, "Too many LED strings defined\n");
>  			continue;
>  		}
>=20
>  		ret =3D fwnode_property_read_u32_array(child, "led-sources",
> -						    led->hvled_strings,
> -						    led->num_leds);
> +						    bank->hvled_strings,
> +						    bank->num_leds);
>  		if (ret) {
>  			dev_err(&priv->client->dev, "led-sources property missing\n");
>  			fwnode_handle_put(child);
>  			goto child_out;
>  		}
>=20
> -		for (j =3D 0; j < led->num_leds; j++)
> +		for (j =3D 0; j < bank->num_leds; j++)
>  			priv->bank_cfg |=3D
> -				(led->control_bank << led->hvled_strings[j]);
> +				(bank->control_bank << bank->hvled_strings[j]);
>=20
>  		ret =3D ti_lmu_common_get_ramp_params(&priv->client->dev,
> -						    child, &led->lmu_data);
> +						    child, &bank->lmu_data);
>  		if (ret)
>  			dev_warn(&priv->client->dev, "runtime-ramp properties missing\n");
>=20
>  		fwnode_property_read_string(child, "linux,default-trigger",
> -					    &led->led_dev.default_trigger);
> +					    &bank->led_dev.default_trigger);
>=20
>  		ret =3D fwnode_property_read_string(child, "label", &name);
>  		if (ret)
> -			snprintf(led->label, sizeof(led->label),
> +			snprintf(bank->label, sizeof(bank->label),
>  				"%s::", priv->client->name);
>  		else
> -			snprintf(led->label, sizeof(led->label),
> +			snprintf(bank->label, sizeof(bank->label),
>  				 "%s:%s", priv->client->name, name);
>=20
> -		led->priv =3D priv;
> -		led->led_dev.name =3D led->label;
> -		led->led_dev.max_brightness =3D led->lmu_data.max_brightness;
> -		led->led_dev.brightness_set_blocking =3D lm3697_brightness_set;
> +		bank->priv =3D priv;
> +		bank->led_dev.name =3D bank->label;
> +		bank->led_dev.max_brightness =3D bank->lmu_data.max_brightness;
> +		bank->led_dev.brightness_set_blocking =3D lm3697_brightness_set;
>=20
> -		ret =3D devm_led_classdev_register(priv->dev, &led->led_dev);
> +		ret =3D devm_led_classdev_register(priv->dev, &bank->led_dev);
>  		if (ret) {
>  			dev_err(&priv->client->dev, "led register err: %d\n",
>  				ret);
> @@ -313,7 +313,7 @@ static int lm3697_probe(struct i2c_client *client,
>  		return -ENODEV;
>  	}
>=20
> -	led =3D devm_kzalloc(&client->dev, struct_size(led, leds, count),
> +	led =3D devm_kzalloc(&client->dev, struct_size(led, banks, count),
>  			   GFP_KERNEL);
>  	if (!led)
>  		return -ENOMEM;
> --
> 2.28.0
>=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+CA/wACgkQMOfwapXb+vJZPACcDnfwMZnLfbWKNNDrkKHlQPch
ufEAnA9v6+ZCZ90q6xLXc3FN+iGyWmgG
=e9A2
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
