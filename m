Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C1526FDCE
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 15:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgIRNHt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Sep 2020 09:07:49 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:34925 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbgIRNHt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Sep 2020 09:07:49 -0400
X-Greylist: delayed 336 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 09:07:48 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id DD51E108655;
        Fri, 18 Sep 2020 15:02:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id b2L6HY669rjA; Fri, 18 Sep 2020 15:02:06 +0200 (CEST)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id C77B61085D5;
        Fri, 18 Sep 2020 15:02:06 +0200 (CEST)
Date:   Fri, 18 Sep 2020 15:02:06 +0200
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds v1 10/10] leds: ns2: refactor and use struct
 led_init_data
Message-ID: <20200918130206.GE29951@kw.sim.vm.gnt>
References: <20200916231650.11484-1-marek.behun@nic.cz>
 <20200916231650.11484-11-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline
In-Reply-To: <20200916231650.11484-11-marek.behun@nic.cz>
User-Agent: Mutt/1.6.0 (2016-04-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 01:16:50AM +0200, Marek Beh=C3=BAn wrote:

Hi Marek,

> By using struct led_init_data when registering we do not need to parse
> `label` DT property nor `linux,default-trigger` property.
>=20
> Also, move forward from platform data to device tree only:
> since commit c7896490dd1a ("leds: ns2: Absorb platform data") the
> platform data structure is absorbed into the driver, because nothing
> else in the source tree used it. Since nobody complained and all usage

Well, I probably should have...

I am using this driver on the Seagate Superbee NAS devices. This devices
are based on a x86 SoC. Since I have been unable to get from the ODM the
LED information written in the ACPI tables, then platform data are used
to pass the LED description to the driver.

The support of this boards is not available mainline yet but it is still
on my todo list. So that's why I am complaining right now :) If it is
not too much trouble I'd like to keep platform data support in this
driver.

Thanks in advance.

Simon

> of this driver is via device tree, refactor the code to work with
> device tree only. As Linus Walleij wrote, the device tree should be the
> way forward anyway.
>=20
> Also build this driver if COMPILE_TEST is enabled.
>=20
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Cc: Simon Guinot <simon.guinot@sequanux.org>
> Cc: Simon Guinot <sguinot@lacie.com>
> Cc: Vincent Donnefort <vdonnefort@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/leds/Kconfig    |   2 +-
>  drivers/leds/leds-ns2.c | 361 ++++++++++++----------------------------
>  2 files changed, 112 insertions(+), 251 deletions(-)
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4f6464a169d57..58c33636afdbf 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -644,7 +644,7 @@ config LEDS_MC13783
>  config LEDS_NS2
>  	tristate "LED support for Network Space v2 GPIO LEDs"
>  	depends on LEDS_CLASS
> -	depends on MACH_KIRKWOOD || MACH_ARMADA_370
> +	depends on MACH_KIRKWOOD || MACH_ARMADA_370 || COMPILE_TEST
>  	default y
>  	help
>  	  This option enables support for the dual-GPIO LEDs found on the
> diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
> index bd806e7c8017b..6a5d326c5bddc 100644
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@ -30,20 +30,6 @@ struct ns2_led_modval {
>  	int			slow_level;
>  };
> =20
> -struct ns2_led {
> -	const char	*name;
> -	const char	*default_trigger;
> -	struct gpio_desc *cmd;
> -	struct gpio_desc *slow;
> -	int		num_modes;
> -	struct ns2_led_modval *modval;
> -};
> -
> -struct ns2_led_platform_data {
> -	int		num_leds;
> -	struct ns2_led	*leds;
> -};
> -
>  /*
>   * The Network Space v2 dual-GPIO LED is wired to a CPLD. Three differen=
t LED
>   * modes are available: off, on and SATA activity blinking. The LED mode=
s are
> @@ -51,7 +37,7 @@ struct ns2_led_platform_data {
>   * for the command/slow GPIOs corresponds to a LED mode.
>   */
> =20
> -struct ns2_led_data {
> +struct ns2_led {
>  	struct led_classdev	cdev;
>  	struct gpio_desc	*cmd;
>  	struct gpio_desc	*slow;
> @@ -62,95 +48,81 @@ struct ns2_led_data {
>  	struct ns2_led_modval	*modval;
>  };
> =20
> -static int ns2_led_get_mode(struct ns2_led_data *led_dat,
> -			    enum ns2_led_modes *mode)
> +static int ns2_led_get_mode(struct ns2_led *led, enum ns2_led_modes *mod=
e)
>  {
> -	int i;
> -	int ret =3D -EINVAL;
> -	int cmd_level;
> -	int slow_level;
> -
> -	cmd_level =3D gpiod_get_value_cansleep(led_dat->cmd);
> -	slow_level =3D gpiod_get_value_cansleep(led_dat->slow);
> -
> -	for (i =3D 0; i < led_dat->num_modes; i++) {
> -		if (cmd_level =3D=3D led_dat->modval[i].cmd_level &&
> -		    slow_level =3D=3D led_dat->modval[i].slow_level) {
> -			*mode =3D led_dat->modval[i].mode;
> -			ret =3D 0;
> -			break;
> +	int i, cmd_level, slow_level;
> +
> +	cmd_level =3D gpiod_get_value_cansleep(led->cmd);
> +	slow_level =3D gpiod_get_value_cansleep(led->slow);
> +
> +	for (i =3D 0; i < led->num_modes; i++) {
> +		if (cmd_level =3D=3D led->modval[i].cmd_level &&
> +		    slow_level =3D=3D led->modval[i].slow_level) {
> +			*mode =3D led->modval[i].mode;
> +			return 0;
>  		}
>  	}
> =20
> -	return ret;
> +	return -EINVAL;
>  }
> =20
> -static void ns2_led_set_mode(struct ns2_led_data *led_dat,
> -			     enum ns2_led_modes mode)
> +static void ns2_led_set_mode(struct ns2_led *led, enum ns2_led_modes mod=
e)
>  {
>  	int i;
> -	bool found =3D false;
>  	unsigned long flags;
> =20
> -	for (i =3D 0; i < led_dat->num_modes; i++)
> -		if (mode =3D=3D led_dat->modval[i].mode) {
> -			found =3D true;
> +	for (i =3D 0; i < led->num_modes; i++)
> +		if (mode =3D=3D led->modval[i].mode)
>  			break;
> -		}
> =20
> -	if (!found)
> +	if (i =3D=3D led->num_modes)
>  		return;
> =20
> -	write_lock_irqsave(&led_dat->rw_lock, flags);
> +	write_lock_irqsave(&led->rw_lock, flags);
> =20
> -	if (!led_dat->can_sleep) {
> -		gpiod_set_value(led_dat->cmd,
> -				led_dat->modval[i].cmd_level);
> -		gpiod_set_value(led_dat->slow,
> -				led_dat->modval[i].slow_level);
> +	if (!led->can_sleep) {
> +		gpiod_set_value(led->cmd, led->modval[i].cmd_level);
> +		gpiod_set_value(led->slow, led->modval[i].slow_level);
>  		goto exit_unlock;
>  	}
> =20
> -	gpiod_set_value_cansleep(led_dat->cmd, led_dat->modval[i].cmd_level);
> -	gpiod_set_value_cansleep(led_dat->slow, led_dat->modval[i].slow_level);
> +	gpiod_set_value_cansleep(led->cmd, led->modval[i].cmd_level);
> +	gpiod_set_value_cansleep(led->slow, led->modval[i].slow_level);
> =20
>  exit_unlock:
> -	write_unlock_irqrestore(&led_dat->rw_lock, flags);
> +	write_unlock_irqrestore(&led->rw_lock, flags);
>  }
> =20
>  static void ns2_led_set(struct led_classdev *led_cdev,
>  			enum led_brightness value)
>  {
> -	struct ns2_led_data *led_dat =3D
> -		container_of(led_cdev, struct ns2_led_data, cdev);
> +	struct ns2_led *led =3D container_of(led_cdev, struct ns2_led, cdev);
>  	enum ns2_led_modes mode;
> =20
>  	if (value =3D=3D LED_OFF)
>  		mode =3D NS_V2_LED_OFF;
> -	else if (led_dat->sata)
> +	else if (led->sata)
>  		mode =3D NS_V2_LED_SATA;
>  	else
>  		mode =3D NS_V2_LED_ON;
> =20
> -	ns2_led_set_mode(led_dat, mode);
> +	ns2_led_set_mode(led, mode);
>  }
> =20
>  static int ns2_led_set_blocking(struct led_classdev *led_cdev,
> -			enum led_brightness value)
> +				enum led_brightness value)
>  {
>  	ns2_led_set(led_cdev, value);
>  	return 0;
>  }
> =20
> -static ssize_t ns2_led_sata_store(struct device *dev,
> -				  struct device_attribute *attr,
> -				  const char *buff, size_t count)
> +static ssize_t sata_store(struct device *dev, struct device_attribute *a=
ttr,
> +			  const char *buff, size_t count)
>  {
>  	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> -	struct ns2_led_data *led_dat =3D
> -		container_of(led_cdev, struct ns2_led_data, cdev);
> -	int ret;
> +	struct ns2_led *led =3D container_of(led_cdev, struct ns2_led, cdev);
>  	unsigned long enable;
> +	int ret;
> =20
>  	ret =3D kstrtoul(buff, 10, &enable);
>  	if (ret < 0)
> @@ -158,34 +130,33 @@ static ssize_t ns2_led_sata_store(struct device *de=
v,
> =20
>  	enable =3D !!enable;
> =20
> -	if (led_dat->sata =3D=3D enable)
> +	if (led->sata =3D=3D enable)
>  		goto exit;
> =20
> -	led_dat->sata =3D enable;
> +	led->sata =3D enable;
> =20
>  	if (!led_get_brightness(led_cdev))
>  		goto exit;
> =20
>  	if (enable)
> -		ns2_led_set_mode(led_dat, NS_V2_LED_SATA);
> +		ns2_led_set_mode(led, NS_V2_LED_SATA);
>  	else
> -		ns2_led_set_mode(led_dat, NS_V2_LED_ON);
> +		ns2_led_set_mode(led, NS_V2_LED_ON);
> =20
>  exit:
>  	return count;
>  }
> =20
> -static ssize_t ns2_led_sata_show(struct device *dev,
> -				 struct device_attribute *attr, char *buf)
> +static ssize_t sata_show(struct device *dev, struct device_attribute *at=
tr,
> +			 char *buf)
>  {
>  	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> -	struct ns2_led_data *led_dat =3D
> -		container_of(led_cdev, struct ns2_led_data, cdev);
> +	struct ns2_led *led =3D container_of(led_cdev, struct ns2_led, cdev);
> =20
> -	return sprintf(buf, "%d\n", led_dat->sata);
> +	return sprintf(buf, "%d\n", led->sata);
>  }
> =20
> -static DEVICE_ATTR(sata, 0644, ns2_led_sata_show, ns2_led_sata_store);
> +static DEVICE_ATTR_RW(sata);
> =20
>  static struct attribute *ns2_led_attrs[] =3D {
>  	&dev_attr_sata.attr,
> @@ -193,147 +164,101 @@ static struct attribute *ns2_led_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(ns2_led);
> =20
> -static int
> -create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_da=
t,
> -	       const struct ns2_led *template)
> +static int ns2_led_register(struct device *dev, struct ns2_led *led,
> +			    struct device_node *np)
>  {
> -	int ret;
> +	struct led_init_data init_data =3D {};
> +	struct ns2_led_modval *modval;
>  	enum ns2_led_modes mode;
> +	int ret, nmodes, i;
> +
> +	led->cmd =3D devm_gpiod_get_from_of_node(dev, np, "cmd-gpio", 0,
> +					       GPIOD_ASIS, np->name);
> +	if (IS_ERR(led->cmd))
> +		return PTR_ERR(led->cmd);
> +
> +	led->slow =3D devm_gpiod_get_from_of_node(dev, np, "slow-gpio", 0,
> +						GPIOD_ASIS, np->name);
> +	if (IS_ERR(led->slow))
> +		return PTR_ERR(led->slow);
> +
> +	ret =3D of_property_count_u32_elems(np, "modes-map");
> +	if (ret <=3D 0 || ret % 3) {
> +		dev_err(dev, "Missing or malformed modes-map in node %pOF\n",
> +			np);
> +		return ret < 0 ? ret : -EINVAL;
> +	}
> +
> +	nmodes =3D ret / 3;
> +	modval =3D devm_kcalloc(dev, nmodes, sizeof(*modval), GFP_KERNEL);
> +	if (!modval)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < nmodes; ++i) {
> +		u32 val;
> +
> +		of_property_read_u32_index(np, "modes-map", 3 * i, &val);
> +		modval[i].mode =3D val;
> +		of_property_read_u32_index(np, "modes-map", 3 * i + 1, &val);
> +		modval[i].cmd_level =3D val;
> +		of_property_read_u32_index(np, "modes-map", 3 * i + 2, &val);
> +		modval[i].slow_level =3D val;
> +	}
> +
> +	led->num_modes =3D nmodes;
> +	led->modval =3D modval;
> =20
> -	rwlock_init(&led_dat->rw_lock);
> -
> -	led_dat->cdev.name =3D template->name;
> -	led_dat->cdev.default_trigger =3D template->default_trigger;
> -	led_dat->cdev.blink_set =3D NULL;
> -	led_dat->cdev.flags |=3D LED_CORE_SUSPENDRESUME;
> -	led_dat->cdev.groups =3D ns2_led_groups;
> -	led_dat->cmd =3D template->cmd;
> -	led_dat->slow =3D template->slow;
> -	led_dat->can_sleep =3D gpiod_cansleep(led_dat->cmd) |
> -				gpiod_cansleep(led_dat->slow);
> -	if (led_dat->can_sleep)
> -		led_dat->cdev.brightness_set_blocking =3D ns2_led_set_blocking;
> +	rwlock_init(&led->rw_lock);
> +
> +	led->cdev.flags |=3D LED_CORE_SUSPENDRESUME;
> +	led->cdev.groups =3D ns2_led_groups;
> +	led->can_sleep =3D gpiod_cansleep(led->cmd) || gpiod_cansleep(led->slow=
);
> +	if (led->can_sleep)
> +		led->cdev.brightness_set_blocking =3D ns2_led_set_blocking;
>  	else
> -		led_dat->cdev.brightness_set =3D ns2_led_set;
> -	led_dat->modval =3D template->modval;
> -	led_dat->num_modes =3D template->num_modes;
> +		led->cdev.brightness_set =3D ns2_led_set;
> =20
> -	ret =3D ns2_led_get_mode(led_dat, &mode);
> +	ret =3D ns2_led_get_mode(led, &mode);
>  	if (ret < 0)
>  		return ret;
> =20
>  	/* Set LED initial state. */
> -	led_dat->sata =3D (mode =3D=3D NS_V2_LED_SATA) ? 1 : 0;
> -	led_dat->cdev.brightness =3D
> -		(mode =3D=3D NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
> +	led->sata =3D (mode =3D=3D NS_V2_LED_SATA) ? 1 : 0;
> +	led->cdev.brightness =3D (mode =3D=3D NS_V2_LED_OFF) ? LED_OFF : LED_FU=
LL;
> =20
> -	ret =3D led_classdev_register(&pdev->dev, &led_dat->cdev);
> -	if (ret < 0)
> -		return ret;
> +	init_data.fwnode =3D of_fwnode_handle(np);
> =20
> -	return 0;
> -}
> +	ret =3D devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to register LED for node %pOF\n", np);
> =20
> -static void delete_ns2_led(struct ns2_led_data *led_dat)
> -{
> -	led_classdev_unregister(&led_dat->cdev);
> +	return ret;
>  }
> =20
> -#ifdef CONFIG_OF_GPIO
> -/*
> - * Translate OpenFirmware node properties into platform_data.
> - */
> -static int
> -ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *=
pdata)
> +static int ns2_led_probe(struct platform_device *pdev)
>  {
> -	struct device_node *np =3D dev->of_node;
> +	struct device *dev =3D &pdev->dev;
>  	struct device_node *child;
> -	struct ns2_led *led, *leds;
> -	int ret, num_leds =3D 0;
> +	struct ns2_led *leds;
> +	int count, ret;
> =20
> -	num_leds =3D of_get_child_count(np);
> -	if (!num_leds)
> +	count =3D device_get_child_node_count(dev);
> +	if (count < 1) {
> +		dev_err(dev, "Device has no child nodes\n");
>  		return -ENODEV;
> +	}
> =20
> -	leds =3D devm_kcalloc(dev, num_leds, sizeof(struct ns2_led),
> -			    GFP_KERNEL);
> +	leds =3D devm_kzalloc(dev, array_size(count, sizeof(*leds)), GFP_KERNEL=
);
>  	if (!leds)
>  		return -ENOMEM;
> =20
> -	led =3D leds;
> -	for_each_child_of_node(np, child) {
> -		const char *string;
> -		int i, num_modes;
> -		struct ns2_led_modval *modval;
> -		struct gpio_desc *gd;
> -
> -		ret =3D of_property_read_string(child, "label", &string);
> -		led->name =3D (ret =3D=3D 0) ? string : child->name;
> -
> -		gd =3D gpiod_get_from_of_node(child, "cmd-gpio", 0,
> -					    GPIOD_ASIS, led->name);
> -		if (IS_ERR(gd)) {
> -			ret =3D PTR_ERR(gd);
> -			goto err_node_put;
> -		}
> -		led->cmd =3D gd;
> -		gd =3D gpiod_get_from_of_node(child, "slow-gpio", 0,
> -					    GPIOD_ASIS, led->name);
> -		if (IS_ERR(gd)) {
> -			ret =3D PTR_ERR(gd);
> -			goto err_node_put;
> -		}
> -		led->slow =3D gd;
> -
> -		ret =3D of_property_read_string(child, "linux,default-trigger",
> -					      &string);
> -		if (ret =3D=3D 0)
> -			led->default_trigger =3D string;
> -
> -		ret =3D of_property_count_u32_elems(child, "modes-map");
> -		if (ret < 0 || ret % 3) {
> -			dev_err(dev,
> -				"Missing or malformed modes-map property\n");
> -			ret =3D -EINVAL;
> -			goto err_node_put;
> -		}
> -
> -		num_modes =3D ret / 3;
> -		modval =3D devm_kcalloc(dev,
> -				      num_modes,
> -				      sizeof(struct ns2_led_modval),
> -				      GFP_KERNEL);
> -		if (!modval) {
> -			ret =3D -ENOMEM;
> -			goto err_node_put;
> -		}
> -
> -		for (i =3D 0; i < num_modes; i++) {
> -			of_property_read_u32_index(child,
> -						"modes-map", 3 * i,
> -						(u32 *) &modval[i].mode);
> -			of_property_read_u32_index(child,
> -						"modes-map", 3 * i + 1,
> -						(u32 *) &modval[i].cmd_level);
> -			of_property_read_u32_index(child,
> -						"modes-map", 3 * i + 2,
> -						(u32 *) &modval[i].slow_level);
> -		}
> -
> -		led->num_modes =3D num_modes;
> -		led->modval =3D modval;
> -
> -		led++;
> +	for_each_available_child_of_node(dev_of_node(dev), child) {
> +		ret =3D ns2_led_register(dev, leds++, child);
> +		if (ret)
> +			return ret;
>  	}
> =20
> -	pdata->leds =3D leds;
> -	pdata->num_leds =3D num_leds;
> -
>  	return 0;
> -
> -err_node_put:
> -	of_node_put(child);
> -	return ret;
>  }
> =20
>  static const struct of_device_id of_ns2_leds_match[] =3D {
> @@ -341,73 +266,9 @@ static const struct of_device_id of_ns2_leds_match[]=
 =3D {
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
> -#endif /* CONFIG_OF_GPIO */
> -
> -struct ns2_led_priv {
> -	int num_leds;
> -	struct ns2_led_data leds_data[];
> -};
> -
> -static int ns2_led_probe(struct platform_device *pdev)
> -{
> -	struct ns2_led_platform_data *pdata =3D dev_get_platdata(&pdev->dev);
> -	struct ns2_led_priv *priv;
> -	int i;
> -	int ret;
> -
> -#ifdef CONFIG_OF_GPIO
> -	if (!pdata) {
> -		pdata =3D devm_kzalloc(&pdev->dev,
> -				     sizeof(struct ns2_led_platform_data),
> -				     GFP_KERNEL);
> -		if (!pdata)
> -			return -ENOMEM;
> -
> -		ret =3D ns2_leds_get_of_pdata(&pdev->dev, pdata);
> -		if (ret)
> -			return ret;
> -	}
> -#else
> -	if (!pdata)
> -		return -EINVAL;
> -#endif /* CONFIG_OF_GPIO */
> -
> -	priv =3D devm_kzalloc(&pdev->dev, struct_size(priv, leds_data, pdata->n=
um_leds), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -	priv->num_leds =3D pdata->num_leds;
> -
> -	for (i =3D 0; i < priv->num_leds; i++) {
> -		ret =3D create_ns2_led(pdev, &priv->leds_data[i],
> -				     &pdata->leds[i]);
> -		if (ret < 0) {
> -			for (i =3D i - 1; i >=3D 0; i--)
> -				delete_ns2_led(&priv->leds_data[i]);
> -			return ret;
> -		}
> -	}
> -
> -	platform_set_drvdata(pdev, priv);
> -
> -	return 0;
> -}
> -
> -static int ns2_led_remove(struct platform_device *pdev)
> -{
> -	int i;
> -	struct ns2_led_priv *priv;
> -
> -	priv =3D platform_get_drvdata(pdev);
> -
> -	for (i =3D 0; i < priv->num_leds; i++)
> -		delete_ns2_led(&priv->leds_data[i]);
> -
> -	return 0;
> -}
> =20
>  static struct platform_driver ns2_led_driver =3D {
>  	.probe		=3D ns2_led_probe,
> -	.remove		=3D ns2_led_remove,
>  	.driver		=3D {
>  		.name		=3D "leds-ns2",
>  		.of_match_table	=3D of_match_ptr(of_ns2_leds_match),
> --=20
> 2.26.2

--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl9kr84ACgkQzyg/RDPm
szpwVxAAmJURjuiV/cxgCNsp00mSr6lRMB0ne85mXWpu0eNCgHx1vHFvZAGmKUh2
vEkwE2XmmCbRCp8AsYMQ8E3/OJeD5rS/zu8BFvaHux6y3SdaxZ1kqT45VoXckG6j
EU4cJidrn5PpDWl3z82L6I2xl9E6IODO3v/M2mQHfS/PX7yXQoqGTxSYz66yBc1U
qqIf345vmUisxqI4/NG2GNQ2+ADjkzeizxmUpICVKHb8npgL+Q+MLdQl/p9K1Nah
mqTj2TMyipmbDbQpDZ7XgKDMRrB8FbCnbXtzSCb1RVhkjRtAMXaNuZjEUgTG0g4b
ObX4LOzhuFRN8fG62TTHzEscCa/WIAC2iQQnSIO8BRt9oozqQlBUtcyoak4Cqg4N
qjeLOZ5Y51tn2hdlUWnEH4TeXCnDM4W8abS7RdsoctmWjgacLPfXzuMtV+F21UUB
Yxxk9TRO0x/6Vr6vZ6q+7iYIYYmOTwuJZrWAcE2PTTTzST252UzPCG/nO2ne17Dq
vDYGiBc4ZqdkWyzht7PpxGsQ711x58rYBQpHmAhXeV+AaNT+EsC4kCTu4ejicd3k
Ul3TsQvYwHcTkpz4aXUKfK6hYtf9hk2ktLlsxVScCWuvVyUSIqhSvvjb7BKw47+F
8PfhPG3A4BSPTIuqPOuWzEeEYpytUQRhwLBZJ9T/tiCRADAqi1g=
=iGJa
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--
