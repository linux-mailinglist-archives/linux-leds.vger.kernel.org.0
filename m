Return-Path: <linux-leds+bounces-777-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AF784D398
	for <lists+linux-leds@lfdr.de>; Wed,  7 Feb 2024 22:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0707928B21E
	for <lists+linux-leds@lfdr.de>; Wed,  7 Feb 2024 21:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02793128839;
	Wed,  7 Feb 2024 21:17:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de [80.67.18.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0279F127B50;
	Wed,  7 Feb 2024 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.67.18.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707340669; cv=none; b=YVQUAhtPm5gH6XA33S92qwd5CiNDyiHR2fxNcdwlrALV7ngyCpGPyAPWHOVJEMkQiVQki7L3U394gGZYllR7vTE+sLxXu18Nw2k1QPjzCnZqNTVh0XQQIc5kujIhcjvNlpXbMohkXihTeZqjw2nrsGHWZTtOGqfURXMw4Wmbti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707340669; c=relaxed/simple;
	bh=7Z7QiMjRCTd48g4Pt3cMz3pYjp0C4WAHvzgb+5qhWLE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=epjsr3P4DEfs0hn6n3O2s/XLv5DiibThYLwShaW7SHmdcefjtUIv2vCkaj8n6DGJ8ZqKpGN1qL2e7gA6ziE+e6rkqKcrXCIUqZDHGQ94ZBGtFj9pMZ7uRpkMxXW7PRg87STk1Xg3dnJ3IXoZKpuzOUqconDFmC8gGXymAE02hpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; arc=none smtp.client-ip=80.67.18.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
Received: from [92.206.191.17] (helo=note-book.lan)
	by smtprelay03.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <git@apitzsch.eu>)
	id 1rXp4r-000000006xC-0Lf1;
	Wed, 07 Feb 2024 22:03:29 +0100
Message-ID: <b1cffa5999204fd27693bad8c9f0d815172d28aa.camel@apitzsch.eu>
Subject: Re: [PATCH 2/2] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Kate Hsuan <hpa@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, Hans de
 Goede <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Date: Wed, 07 Feb 2024 22:03:27 +0100
In-Reply-To: <20240207061006.407066-3-hpa@redhat.com>
References: <20240207061006.407066-1-hpa@redhat.com>
	 <20240207061006.407066-3-hpa@redhat.com>
Autocrypt: addr=git@apitzsch.eu; prefer-encrypt=mutual;
 keydata=mQINBFZtkcEBEADF2OvkhLgFvPPShI0KqafRlTDlrZw5H7pGDHUCxh0Tnxsj7r1V6N7M8L2ck9GBhoQ9uSNeer9sYJV3QCMs6uIJD8XV60fsLrGZxSnZejYxAmT5IMp7hHZ6EXtgbRBwPUUymfKpMJ55pmyNFBkxWxQA6E33X/rH0ddtGmAsw+g6tOHBY+byBDZrsAZ7MLKqGVaW7IZCQAk4yzO7cLnLVHS2Pk4EOaG+XR/NYQ+jTfMtszD/zSW6hwskGZ6RbADHzCbV01105lnh61jvzpKPXMNTJ31L13orLJyaok1PUfyH0KZp8xki8+cXUxy+4m0QXVJemnnBNW5DG3YEpQ59jXn3I7Eu2pzn2N+NcjqK8sjOffXSccIyz8jwYdhASL5psEvQqZ6t60fvkwQw7++IZvs2BPmaCiQRo415/jZrEkBBE3xi1qdb3HEmpeASVaxkinM5O44bmQdsWTyamuuUOqziHZc9MO0lR0M1vUwnnQ3sZBu2lPx/HBLGWWOyzeERalqkXQz1w2p487Gc+fC8ZLXp7oknfX0Mo1hwTQ+2g2bf78xdsIhqH15KgRE/QiazM87mkaIcHz7UE+ikkffODyjtzGuaqDHQIUqpKIiXGKXoKzENFJel71Wb2FoSMXJfMNE/zEOE5ifufDkBGlwEqEUmkHzu7BbSPootR0GUInzm5QARAQABtCNBbmRyw6kgQXBpdHpzY2ggPGFuZHJlQGFwaXR6c2NoLmV1PokCVwQTAQoAQQIbAwIeAQIXgAULCQgHAgYVCgkICwIEFgIDAQIZARYhBGs5YOi9bIzbfpKzQoJ34hc2fkk7BQJlw9i0BQkROFXvAAoJEIJ34hc2fkk7KJ4QAKtMhUxRoxiV44UbPQiXIQzwBR0RJVdef5GJ3lViRZ6VNtjGjT+5yOi48B8vtUMJkPPOS1w7WvoKuJR16VvV4T/0gVkZxMwlmH4X9nnzBW0aONPupMZgp
	DJptWX6w8KJYVvx32nMVkORrstL+pHggt1BlW+DuZj919sQzEEgqPE4zIXboWFj3uu1h1ywbyosI7mrIWBV/dgfFe4fUOilJanUXmWNDoU+kwnV1WdZGi15mYRunw0KJTPj90xVnVyhg0xY4tRUkxJrm8Wi3yumBSfW32xeq5uDRKIO4t7A68FQT8fVoQ+jJNEPrN1BXr9CMhlxs6La7yrL6OeCjHKoGIjb8FhPrsyjmvkWVb9a7Ea4UwuW+0QLFIAqkEMtTx575d/x6YZUwmmbPoxKPkrbxcO0fXsJHo7WiWnxnD/wsbasazoKKwm+gjK0UCPQ0yyN1Zm59OKTee3WQdq7wDYbvMZLAlkipKwFZLPy5VHWSN8RuYNYcOSO9PnhTY+4RwCq67cPsEVIyx0fGwZnXycJbzH/IhEEny8mgNFuNx0u13NNDQqAq/LBCoX2aDCQvxSSakoM67A/qVja3ODscdJYx65D56I11DgMjm492szILIdhWLFgEhYB9ePHhDs9vayqzT0zScwTBnd+mv+ADh/b/tey/LOY8UhaIl0O/vFpNtYWtCFBbmRyw6kgQXBpdHpzY2ggPGdpdEBhcGl0enNjaC5ldT6JAlQEEwEKAD4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQRrOWDovWyM236Ss0KCd+IXNn5JOwUCZcPYtAUJEThV7wAKCRCCd+IXNn5JO7dREACaVRpsSdmXc0ilmxHrm4FZANnCVAhWlrLbUG8XDxlH4xZTJ+qNbBAKwqtB11UTQsWftijPE4Qo9Vi223gJkVbczUf/XTdgMxckITg4pEwJxWNzmADGNYEazqPi1MbhwgK3NfX3N/ZXltaQtfNJzfpXTCg+V8wzzYriIxXx8dnUu8vJDVTRjj48fk4jd4iqa/XR/Vbe55F2QcvL94RI5Wn8GDtIwQ34ByD/DSdILutXoWLak/PkXAIskCRjuXa1c1Ur/8g5xi64Ko
	DdQ0gmO362pwWrCCqv3DwyUAw/Q84nOBkE6h0bndPJf4xi8IjJ13x8YxzkW3wES29tF/yfinUJAnlS5GNf/JSgWGkzQQUyrYwI7bDl4PZjU6FNyqWGblnW/bCi6JFf1NAVbeUHfK9NYWe71TuKnikNWl53R7y5psbtcK6eqw3kOIZIifn+79b53tedX40bg8gvQKyKYX1HX1cmu02hqAwWaQRjIps6vPJv7+RQF2DFRTkG+3Kc2eeMzAoPZ8peJm4t6Cp3ZUgZ36Bjl0oU2iFlG3XdBcaXT5NNFNvpWzG1HfIkcwdMQ2KCrsm3m2w6XZXzyInkubUz9y/pPk7aS4aZ1HAQ64rlhRe8Fgbo+Z5vRiglvQRaDNyut3Z/5aVWYC2X4nwChQKu1CT9i8hD43rQusQdeB1K17kCDQRWbZHBARAA35+q2gnCcqTJm3MCqTsGGfsKIpGSn7qnr7l7C+jomiQSfg84SP0f4GclhBfSghpgUqBFiIgv3BzJREDrziSaJLwRp+NKILkZ2QW41JccushDEcUCVWnZpViUF1als6PU4M8uHmfzoNXZtAaeTKpA3eeOyUPUuNm4lSZH9Aq20BeCNDy9puzCnjpKWemI2oVC5J0eNQ+tw3sOtO7GeOWZiDh/eciJAEF08H1FnJ+4Gs04NQUjAKiZobQIqJI2PuRWPUs2Ijjx7mp7SPNU/rmKXFWXT3o83WMxo41QLoyJoMnaocM7AeTT4PVv3Fnl7o9S36joAaFVZ7zTp86JluQavNK74y35sYTiDTSSeqpmOlcyGIjrqtOyCXoxHpwIL56YkHmsJ9b4zriFS/CplQJ5aXaUDiDNfbt+9Zm7KI4g6J59h5tQGVwz/4pmre02NJFh1yiILCfOkGtAr1uJAemk0P1E/5SmrTMSj5/zpuHV+wsUjMpRKoREWYBgHzypaJC93h9N+Wl2KjDdwfg7cBboKBKTjbjaofhkG6f4noKagB7IAEKf14EUg1e
	r5/Xx0McgWkIzYEvmRJspoPoSH5DLSd05QwJmMjXoLsq74iRUf0Y8glNEquc7u8aDtfORxxzfcY2WuL6WsOy7YrKHpinrlODwgI1/zUXQirPIGdFV9MsAEQEAAYkCPAQYAQoAJgIbDBYhBGs5YOi9bIzbfpKzQoJ34hc2fkk7BQJlw9jKBQkROFXvAAoJEIJ34hc2fkk7viQP/16kem3254PxffX9/hVPiBrxN82mpCD6K/jEQNYxow095kkUKdJ3o0GPL2/SNaHlbxGS3sPC1i8Q5qYoFukyxZtWr5ZQgF429aJjJcqN2N6SJi2n2IJIVcBntVB3VYMQf5nCHOsCoUsv4BSBoMKI2aRTLL6a8rsgLmWuWvQalOlaFVihmurfstcTEV823w7UwpNhLEuStSnisk2SK/NJZERFVQF3sdyqawMsY2KFRRiG7QHlOlqCYm0fRmzCPFu2spBYjQ/KHvX0p/5O4ooncdEleV53trWqdrWZB9J9SL6cpNIxTkCYh9/OHJot/xsH+SqTs1DDByf9namPorK0eNepCxJgGpfn2z5adYzk4p2qdkzPKSRrZvUlTiC8qvgG3MUecb6aaIeMa5BqZj8DsYqMX5+IHCHWHvGyDL5XNZz9NEWfKcQlwawd/P/lDZqGlMczbDrqmOISeqpyA2dr9FAejJwNRtCrxTS50mi7Kl6LXT2ghBftXvBCqZHp3/mrUgsOFquVx2h7VK4P4L09iP1PIyACGMEtZCDGvuY8wFiZlA2XXDikTDFXhCWlsQT036272hmn+9fk2xtGHP4ImWKJQsaBxIRMl7rjedt3QIpQqmG5vgQSML9EDYimGueH5cC/4wGVM7mDMgv84k4YSl5wFfc9iM8ClBGkmFjaGc/Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=

Hi,

Am Mittwoch, dem 07.02.2024 um 14:10 +0800 schrieb Kate Hsuan:
> This LED controller also installed on a Xiaomi pad2 and it is an x86
> platform. The original driver is based on the device tree and can't
> be used for this ACPI based system. This patch migrated the driver to
> use fwnode to access the properties. Moreover, the fwnode API
> supports device tree so this work would affect the original
would -> won't ?

> implementations.
>=20
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
> =C2=A0drivers/leds/rgb/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 -
> =C2=A0drivers/leds/rgb/leds-ktd202x.c | 68 ++++++++++++++++++++++--------=
-
> --
> =C2=A02 files changed, 45 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index a6a21f564673..f245dbd9a163 100644
> --- a/drivers/leds/rgb/Kconfig
> +++ b/drivers/leds/rgb/Kconfig
> @@ -17,7 +17,6 @@ config LEDS_GROUP_MULTICOLOR
> =C2=A0config LEDS_KTD202X
> =C2=A0	tristate "LED support for KTD202x Chips"
> =C2=A0	depends on I2C
> -	depends on OF
> =C2=A0	select REGMAP_I2C
> =C2=A0	help
> =C2=A0	=C2=A0 This option enables support for the Kinetic
> KTD2026/KTD2027
> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-
> ktd202x.c
> index 514965795a10..a1aef62e3db5 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -112,6 +112,8 @@ static int ktd202x_chip_disable(struct ktd202x
> *chip)
> =C2=A0
> =C2=A0	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
> KTD202X_ENABLE_CTRL_SLEEP);
> =C2=A0
> +	usleep_range(500, 600);
Why have you added the sleep?

> +
> =C2=A0	ret =3D regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
> chip->regulators);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(chip->dev, "Failed to disable regulators:
> %d\n", ret);
> @@ -381,16 +383,18 @@ static int ktd202x_blink_mc_set(struct
> led_classdev *cdev,
> =C2=A0				 mc->num_colors);
> =C2=A0}
> =C2=A0
> -static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct
> device_node *np,
> +static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct
> fwnode_handle *np,
> =C2=A0				 struct ktd202x_led *led, struct
> led_init_data *init_data)
> =C2=A0{
> =C2=A0	struct led_classdev *cdev;
> -	struct device_node *child;
> +	struct fwnode_handle *child;
Nit, swap the above lines for reverse Christmas tree.

> =C2=A0	struct mc_subled *info;
> -	int num_channels;
> +	int num_channels =3D 0;
> =C2=A0	int i =3D 0;
> =C2=A0
> -	num_channels =3D of_get_available_child_count(np);
> +	fwnode_for_each_available_child_node(np, child) {
> +		num_channels++;
> +	}
> =C2=A0	if (!num_channels || num_channels > chip->num_leds)
> =C2=A0		return -EINVAL;
> =C2=A0
> @@ -398,22 +402,22 @@ static int ktd202x_setup_led_rgb(struct ktd202x
> *chip, struct device_node *np,
> =C2=A0	if (!info)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	for_each_available_child_of_node(np, child) {
> +	fwnode_for_each_available_child_node(np, child) {
> =C2=A0		u32 mono_color;
> =C2=A0		u32 reg;
> =C2=A0		int ret;
> =C2=A0
> -		ret =3D of_property_read_u32(child, "reg", &reg);
> +		ret =3D fwnode_property_read_u32(child, "reg", &reg);
> =C2=A0		if (ret !=3D 0 || reg >=3D chip->num_leds) {
> =C2=A0			dev_err(chip->dev, "invalid 'reg' of
> %pOFn\n", child);
> -			of_node_put(child);
> +			fwnode_handle_put(child);
> =C2=A0			return -EINVAL;
> =C2=A0		}
> =C2=A0
> -		ret =3D of_property_read_u32(child, "color",
> &mono_color);
> +		ret =3D fwnode_property_read_u32(child, "color",
> &mono_color);
> =C2=A0		if (ret < 0 && ret !=3D -EINVAL) {
> =C2=A0			dev_err(chip->dev, "failed to parse 'color'
> of %pOF\n", child);
> -			of_node_put(child);
> +			fwnode_handle_put(child);
> =C2=A0			return ret;
> =C2=A0		}
> =C2=A0
> @@ -433,14 +437,14 @@ static int ktd202x_setup_led_rgb(struct ktd202x
> *chip, struct device_node *np,
> =C2=A0	return devm_led_classdev_multicolor_register_ext(chip->dev,
> &led->mcdev, init_data);
> =C2=A0}
> =C2=A0
> -static int ktd202x_setup_led_single(struct ktd202x *chip, struct
> device_node *np,
> +static int ktd202x_setup_led_single(struct ktd202x *chip, struct
> fwnode_handle *np,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct ktd202x_led *led, struct
> led_init_data *init_data)
> =C2=A0{
> =C2=A0	struct led_classdev *cdev;
> =C2=A0	u32 reg;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D of_property_read_u32(np, "reg", &reg);
> +	ret =3D fwnode_property_read_u32(np, "reg", &reg);
> =C2=A0	if (ret !=3D 0 || reg >=3D chip->num_leds) {
> =C2=A0		dev_err(chip->dev, "invalid 'reg' of %pOFn\n", np);
> =C2=A0		return -EINVAL;
> @@ -454,7 +458,7 @@ static int ktd202x_setup_led_single(struct
> ktd202x *chip, struct device_node *np
> =C2=A0	return devm_led_classdev_register_ext(chip->dev, &led->cdev,
> init_data);
> =C2=A0}
> =C2=A0
> -static int ktd202x_add_led(struct ktd202x *chip, struct device_node
> *np, unsigned int index)
> +static int ktd202x_add_led(struct ktd202x *chip, struct
> fwnode_handle *np, unsigned int index)
> =C2=A0{
> =C2=A0	struct ktd202x_led *led =3D &chip->leds[index];
> =C2=A0	struct led_init_data init_data =3D {};
> @@ -463,14 +467,14 @@ static int ktd202x_add_led(struct ktd202x
> *chip, struct device_node *np, unsigne
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	/* Color property is optional in single color case */
> -	ret =3D of_property_read_u32(np, "color", &color);
> +	ret =3D fwnode_property_read_u32(np, "color", &color);
> =C2=A0	if (ret < 0 && ret !=3D -EINVAL) {
> =C2=A0		dev_err(chip->dev, "failed to parse 'color' of
> %pOF\n", np);
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> =C2=A0	led->chip =3D chip;
> -	init_data.fwnode =3D of_fwnode_handle(np);
> +	init_data.fwnode =3D np;
> =C2=A0
> =C2=A0	if (color =3D=3D LED_COLOR_ID_RGB) {
> =C2=A0		cdev =3D &led->mcdev.led_cdev;
> @@ -492,26 +496,30 @@ static int ktd202x_add_led(struct ktd202x
> *chip, struct device_node *np, unsigne
> =C2=A0
> =C2=A0static int ktd202x_probe_dt(struct ktd202x *chip)
> =C2=A0{
> -	struct device_node *np =3D dev_of_node(chip->dev), *child;
> -	int count;
> +	struct device *dev =3D chip->dev;
> +	struct fwnode_handle *np, *child;
Nit, swap the above lines.

> +	int count =3D 0;
Un-needed init.

> =C2=A0	int i =3D 0;
> =C2=A0
> -	chip->num_leds =3D (int)(unsigned
> long)of_device_get_match_data(chip->dev);
> +	count =3D device_get_child_node_count(dev);
> =C2=A0
> -	count =3D of_get_available_child_count(np);
> =C2=A0	if (!count || count > chip->num_leds)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	np =3D dev_fwnode(chip->dev);
> +	if (!np)
> +		return -ENODEV;
> +
> =C2=A0	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
> KTD202X_RSTR_RESET);
> =C2=A0
> =C2=A0	/* Allow the device to execute the complete reset */
> =C2=A0	usleep_range(200, 300);
> =C2=A0
> -	for_each_available_child_of_node(np, child) {
> +	fwnode_for_each_available_child_node(np, child) {
> =C2=A0		int ret =3D ktd202x_add_led(chip, child, i);
> =C2=A0
> =C2=A0		if (ret) {
> -			of_node_put(child);
> +			fwnode_handle_put(child);
> =C2=A0			return ret;
> =C2=A0		}
> =C2=A0		i++;
> @@ -533,7 +541,7 @@ static int ktd202x_probe(struct i2c_client
> *client)
> =C2=A0{
> =C2=A0	struct device *dev =3D &client->dev;
> =C2=A0	struct ktd202x *chip;
> -	int count;
> +	int count =3D 0;
Un-needed init.

> =C2=A0	int ret;
> =C2=A0
> =C2=A0	count =3D device_get_child_node_count(dev);
> @@ -568,6 +576,8 @@ static int ktd202x_probe(struct i2c_client
> *client)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	chip->num_leds =3D (int) (unsigned
> long)i2c_get_match_data(client);
> +
> =C2=A0	ret =3D ktd202x_probe_dt(chip);
> =C2=A0	if (ret < 0) {
> =C2=A0		regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
> chip->regulators);
> @@ -602,21 +612,33 @@ static void ktd202x_shutdown(struct i2c_client
> *client)
> =C2=A0	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL,
> KTD202X_RSTR_RESET);
> =C2=A0}
> =C2=A0
> +static const struct i2c_device_id ktd202x_id[] =3D {
> +	{"ktd2026", KTD2026_NUM_LEDS},
> +	{"ktd2027", KTD2027_NUM_LEDS},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ktd202x_id);
> +
> +#ifndef CONFIG_ACPI
> =C2=A0static const struct of_device_id ktd202x_match_table[] =3D {
> =C2=A0	{ .compatible =3D "kinetic,ktd2026", .data =3D (void
> *)KTD2026_NUM_LEDS },
> =C2=A0	{ .compatible =3D "kinetic,ktd2027", .data =3D (void
> *)KTD2027_NUM_LEDS },
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, ktd202x_match_table);
> +#endif
> =C2=A0
> =C2=A0static struct i2c_driver ktd202x_driver =3D {
> =C2=A0	.driver =3D {
> -		.name =3D "leds-ktd202x",
> -		.of_match_table =3D ktd202x_match_table,
> +		.name	=3D "leds-ktd202x",
Why was the space after "name" replaced by tab?

> +#ifndef CONFIG_ACPI
> +		.of_match_table =3D ktd20xx_match_table,
Typo: ktd20xx_match_table -> ktd202x_match_table

Andr=C3=A9

> +#endif
> =C2=A0	},
> =C2=A0	.probe =3D ktd202x_probe,
> =C2=A0	.remove =3D ktd202x_remove,
> =C2=A0	.shutdown =3D ktd202x_shutdown,
> +	.id_table =3D ktd202x_id,
> =C2=A0};
> =C2=A0module_i2c_driver(ktd202x_driver);
> =C2=A0


