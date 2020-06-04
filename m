Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831C91EE5CD
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 15:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgFDNur (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 09:50:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34694 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728685AbgFDNur (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 09:50:47 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 613EF1C0BD2; Thu,  4 Jun 2020 15:50:45 +0200 (CEST)
Date:   Thu, 4 Jun 2020 15:50:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, matthias.bgg@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200604135045.GH7222@duo.ucw.cz>
References: <1591252004-12681-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline
In-Reply-To: <1591252004-12681-1-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +
> +#define MT6360_LED_DESC(_id)  {						\
> +	.cdev =3D {							\
> +		.name =3D "mt6360_isink" #_id,				\
> +		.max_brightness =3D MT6360_SINKCUR_MAX##_id,		\
> +		.brightness_set_blocking =3D mt6360_led_brightness_set,	\
> +		.brightness_get =3D mt6360_led_brightness_get,		\
> +		.blink_set =3D mt6360_led_blink_set,			\
> +	},								\
> +	.index =3D MT6360_LED_ISINK##_id,					\
> +	.currsel_reg =3D MT6360_CURRSEL_REG##_id,				\
> +	.currsel_mask =3D MT6360_CURRSEL_MASK##_id,			\
> +	.enable_mask =3D MT6360_LEDEN_MASK##_id,				\
> +	.mode_reg =3D MT6360_LEDMODE_REG##_id,				\
> +	.mode_mask =3D MT6360_LEDMODE_MASK##_id,				\
> +	.pwmduty_reg =3D MT6360_PWMDUTY_REG##_id,				\
> +	.pwmduty_mask =3D MT6360_PWMDUTY_MASK##_id,			\
> +	.pwmfreq_reg =3D MT6360_PWMFREQ_REG##_id,				\
> +	.pwmfreq_mask =3D MT6360_PWMFREQ_MASK##_id,			\
> +	.breath_regbase =3D MT6360_BREATH_REGBASE##_id,			\
> +}
> +
> +/* ISINK 1/2/3 for RGBLED, ISINK4 for MoonLight */
> +static const struct mt6360_led_classdev def_led_classdev[MT6360_LED_MAX]=
 =3D {
> +	MT6360_LED_DESC(1),
> +	MT6360_LED_DESC(2),
> +	MT6360_LED_DESC(3),
> +	MT6360_LED_DESC(4),
> +};

While this is pretty interesting abuse of the macros, please get rid
of it. I'm sure code will look better as a result.

> +static int mt6360_fled_strobe_set(
> +			       struct led_classdev_flash *fled_cdev, bool state)
> +{
> +	struct led_classdev *led_cdev =3D &fled_cdev->led_cdev;
> +	struct mt6360_led_data *mld =3D dev_get_drvdata(led_cdev->dev->parent);
> +	struct mt6360_fled_classdev *mtfled_cdev =3D (void *)fled_cdev;
> +	int id =3D mtfled_cdev->index, ret;
> +
> +	if (!(state ^ test_bit(id, &mld->fl_strobe_flags)))
> +		return 0;

Yup, and you can abuse xor operator too. Don't do that. I believe you
wanted to say:

+	if (state =3D=3D test_bit(id, &mld->fl_strobe_flags))
+		return 0;


> +	if (mt6360_fled_check_flags_if_any(&mld->fl_torch_flags)) {
> +		dev_err(led_cdev->dev,
> +			"Disable all leds torch [%lu]\n", mld->fl_torch_flags);
> +		return -EINVAL;
> +	}
> +	ret =3D regmap_update_bits(mld->regmap, mtfled_cdev->cs_enable_reg,
> +				 mtfled_cdev->cs_enable_mask, state ? 0xff : 0);
> +	if (ret < 0) {
> +		dev_err(led_cdev->dev, "Fail to set cs enable [%d]\n", state);
> +		goto out_strobe_set;
> +	}

Just return ret; no need for goto. (Please fix globally).

> +static int mt6360_fled_brightness_set(struct led_classdev *led_cdev,
> +				      enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *lcf =3D lcdev_to_flcdev(led_cdev);
> +	struct mt6360_led_data *mld =3D dev_get_drvdata(led_cdev->dev->parent);
> +	struct mt6360_fled_classdev *mtfled_cdev =3D (void *)lcf;
> +	int id =3D mtfled_cdev->index, shift, keep, ret;
> +
> +	if (mt6360_fled_check_flags_if_any(&mld->fl_strobe_flags)) {
> +		dev_err(led_cdev->dev,
> +		       "Disable all leds strobe [%lu]\n", mld->fl_strobe_flags);
> +		return -EINVAL;
> +	}
> +	if (brightness =3D=3D LED_OFF) {
> +		clear_bit(id, &mld->fl_torch_flags);
> +		keep =3D mt6360_fled_check_flags_if_any(&mld->fl_torch_flags);
> +		ret =3D regmap_update_bits(mld->regmap,
> +					 mtfled_cdev->torch_enable_reg,
> +					 mtfled_cdev->torch_enable_mask,
> +					 keep ? 0xff : 0);
> +		if (ret < 0) {
> +			dev_err(led_cdev->dev, "Fail to set torch disable\n");
> +			goto out_bright_set;
> +		}
> +		ret =3D regmap_update_bits(mld->regmap,
> +					 mtfled_cdev->cs_enable_reg,
> +					 mtfled_cdev->cs_enable_mask, 0);
> +		if (ret < 0)
> +			dev_err(led_cdev->dev, "Fail to set torch disable\n");
> +		goto out_bright_set;
> +	}

Should turning off the led go to separate function?



> +#define MT6360_FLED_DESC(_id)  {					\
> +	.fl_cdev =3D {							\
> +	 .led_cdev =3D {							\
> +		.name =3D "mt6360_fled_ch" #_id,				\
> +		.max_brightness =3D MT6360_TORBRIGHT_MAX##_id,		\
> +		.brightness_set_blocking =3D  mt6360_fled_brightness_set,	\
> +		.brightness_get =3D mt6360_fled_brightness_get,		\
> +		.flags =3D LED_DEV_CAP_FLASH,				\
> +	 },								\
> +	 .brightness =3D {						\
> +		.min =3D MT6360_STROBECUR_MIN,				\
> +		.step =3D MT6360_STROBECUR_STEP,				\
> +		.max =3D MT6360_STROBECUR_MAX,				\
> +		.val =3D MT6360_STROBECUR_MIN,				\
> +	 },								\
> +	 .timeout =3D {							\
> +		.min =3D MT6360_STRBTIMEOUT_MIN,				\
> +		.step =3D MT6360_STRBTIMEOUT_STEP,			\
> +		.max =3D MT6360_STRBTIMEOUT_MAX,				\
> +		.val =3D MT6360_STRBTIMEOUT_MIN,				\
> +	 },								\
> +	 .ops =3D &mt6360_fled_ops,					\
> +	},								\
> +	.index =3D MT6360_FLED_CH##_id,					\
> +	.cs_enable_reg =3D MT6360_CSENABLE_REG##_id,			\
> +	.cs_enable_mask =3D MT6360_CSENABLE_MASK##_id,			\
> +	.torch_bright_reg =3D MT6360_TORBRIGHT_REG##_id,			\
> +	.torch_bright_mask =3D MT6360_TORBRIGHT_MASK##_id,		\
> +	.torch_enable_reg =3D MT6360_TORENABLE_REG##_id,			\
> +	.torch_enable_mask =3D MT6360_TORENABLE_MASK##_id,		\
> +	.strobe_bright_reg =3D MT6360_STRBRIGHT_REG##_id,			\
> +	.strobe_bright_mask =3D MT6360_STRBRIGHT_MASK##_id,		\
> +	.strobe_enable_reg =3D MT6360_STRBENABLE_REG##_id,		\
> +	.strobe_enable_mask =3D MT6360_STRBENABLE_MASK##_id,		\
> +}
> +
> +static const struct mt6360_fled_classdev def_fled_classdev[MT6360_FLED_M=
AX] =3D {
> +	MT6360_FLED_DESC(1),
> +	MT6360_FLED_DESC(2),
> +};

Yeah, well, no.

> @@ -236,5 +241,4 @@ struct mt6360_pmu_data {
>  #define CHIP_VEN_MASK				(0xF0)
>  #define CHIP_VEN_MT6360				(0x50)
>  #define CHIP_REV_MASK				(0x0F)
> -
>  #endif /* __MT6360_H__ */

This one is unrelated and not really an improvement.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj8NQAKCRAw5/Bqldv6
8tGJAKCk/tQlh2dphyQmGz3W4P1KLZfCFgCfW2DcYsCMqf6HOjZrQg7Tw9n6pDg=
=oa9M
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--
