Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02081CE539
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2020 22:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbgEKURe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 May 2020 16:17:34 -0400
Received: from lists.nic.cz ([217.31.204.67]:37998 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727873AbgEKURd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 11 May 2020 16:17:33 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 5D53213FABA;
        Mon, 11 May 2020 22:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1589228250; bh=UaooSKSC/bKv9YTOY1OlWol9C60SxoS4AzUiPwjDTnY=;
        h=Date:From:To;
        b=KhdYDlGxzi9AvMawsjezoM3X1K4OE6wGX7wG2ran9WJs010bcXK+n7blU+LzZbBzF
         mO2l+7PHld+lkTavOFgxUIPOGdz8viCYG+3Ln9gvgYmhp9JqbdYVfalia40wAEN+og
         JNAR7xo9mcc5DpkHUiI/EfSXLYy6Npd1wSosU9QY=
Date:   Mon, 11 May 2020 22:17:29 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: initial support for Turris Omnia LEDs
Message-ID: <20200511221729.09450e21@nic.cz>
In-Reply-To: <b6bc27c9-e34c-36c0-f5c0-73f4ed7b9429@ti.com>
References: <20200423065100.2652-1-marek.behun@nic.cz>
        <20200423065100.2652-3-marek.behun@nic.cz>
        <b6bc27c9-e34c-36c0-f5c0-73f4ed7b9429@ti.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 11 May 2020 14:54:02 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Marek
>=20
> On 4/23/20 1:51 AM, Marek Beh=C3=BAn wrote:
> > This adds basic support for LEDs on the front side of CZ.NIC's Turris
> > Omnia router.
> >
> > There are 12 RGB LEDs. The controller supports HW triggering mode for
> > the LEDs, but this driver does not support it yet, and sets all the LEDs
> > into SW mode upon probe.
> >
> > The user can either group all three channels of one RGB LED into one LED
> > classdev, or expose each channel as an individual LED classdev. This is
> > done by utilizing the 'led-sources' and 'color' DT properties. =20
>=20
> I think this would be a good candidate for the multicolor framework.=C2=
=A0 It=20
> would make the registration, brightness caching and color mapping easier
>=20
> We are waiting on maintainer feedback for this.
>=20
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D441958

Hi Dan, thanks for the review.

I just sent an email as response to Rob's review for dt-bindings, that
it seems it would be better to add this driver directly in multicolor
API. (I wanted to do it first without multicolor API support, because
multicolor API is taking a long time to be merged.)

>=20
> But until then comments below
>=20
> >
> > Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> > ---
> >   drivers/leds/Kconfig             |  11 ++
> >   drivers/leds/Makefile            |   1 +
> >   drivers/leds/leds-turris-omnia.c | 285 +++++++++++++++++++++++++++++++
> >   3 files changed, 297 insertions(+)
> >   create mode 100644 drivers/leds/leds-turris-omnia.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index c664d84e1667..7663a5cd9fb5 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -145,6 +145,17 @@ config LEDS_EL15203000
> >   	  To compile this driver as a module, choose M here: the module
> >   	  will be called leds-el15203000.
> >  =20
> > +config LEDS_TURRIS_OMNIA
> > +	tristate "LED support for CZ.NIC's Turris Omnia"
> > +	depends on LEDS_CLASS
> > +	depends on I2C =20
> REGMAP?

Isn't possible. Discussed with Jacek, see explanation at
https://www.spinics.net/lists/linux-leds/msg11583.html

> > +	depends on MACH_ARMADA_38X || COMPILE_TEST =20
> Why is tied to a Marvel processor?

Because Turris Omnia is the only device containing microcontroller with
firmware that understands this protocol, since it was invented by my
predecessors in CZ.NIC, and we don't want to bloat various
distributions package systems with kernel modules that won't ever be
used on devices they target. If a distribution's kernel is compiled to
also run on Armada 38x, then the driver will be present. For other ARM
processors or other architectures this driver is useless.

> > +	depends on OF
> > +	help
> > +	  This option enables basic support for the LEDs found on the front
> > +	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
> > +	  front panel.
> > +
> >   config LEDS_LM3530
> >   	tristate "LCD Backlight driver for LM3530"
> >   	depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 45235d5fb218..fd61421f7d40 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -83,6 +83,7 @@ obj-$(CONFIG_LEDS_TCA6507)		+=3D leds-tca6507.o
> >   obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+=3D leds-ti-lmu-common.o
> >   obj-$(CONFIG_LEDS_TLC591XX)		+=3D leds-tlc591xx.o
> >   obj-$(CONFIG_LEDS_TPS6105X)		+=3D leds-tps6105x.o
> > +obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+=3D leds-turris-omnia.o
> >   obj-$(CONFIG_LEDS_WM831X_STATUS)	+=3D leds-wm831x-status.o
> >   obj-$(CONFIG_LEDS_WM8350)		+=3D leds-wm8350.o
> >   obj-$(CONFIG_LEDS_WRAP)			+=3D leds-wrap.o
> > diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turri=
s-omnia.c
> > new file mode 100644
> > index 000000000000..aafb4be9b225
> > --- /dev/null
> > +++ b/drivers/leds/leds-turris-omnia.c
> > @@ -0,0 +1,285 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * CZ.NIC's Turris Omnia LEDs driver
> > + *
> > + * 2020 by Marek Behun <marek.behun@nic.cz>
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <uapi/linux/uleds.h>
> > +#include "leds.h"
> > +
> > +#define OMNIA_BOARD_LEDS		12
> > +
> > +#define CMD_LED_MODE			3
> > +#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
> > +#define CMD_LED_MODE_USER		0x10
> > +
> > +#define CMD_LED_STATE			4
> > +#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
> > +#define CMD_LED_STATE_ON		0x10
> > +
> > +#define CMD_LED_COLOR			5
> > +#define CMD_LED_SET_BRIGHTNESS		7
> > +#define CMD_LED_GET_BRIGHTNESS		8
> > +
> > +#define OMNIA_CMD			0
> > +
> > +#define OMNIA_CMD_LED_COLOR_LED		1
> > +#define OMNIA_CMD_LED_COLOR_R		2
> > +#define OMNIA_CMD_LED_COLOR_G		3
> > +#define OMNIA_CMD_LED_COLOR_B		4
> > +#define OMNIA_CMD_LED_COLOR_LEN		5
> > +
> > +struct omnia_led {
> > +	struct led_classdev cdev;
> > +	int reg, color;
> > +};
> > +
> > +#define to_omnia_led(l)	container_of(l, struct omnia_led, cdev)
> > +
> > +struct omnia_leds {
> > +	struct i2c_client *client;
> > +	struct mutex lock;
> > +	u8 cache[OMNIA_BOARD_LEDS][3];
> > +	int nleds;
> > +	struct omnia_led leds[0]; =20
> No need for the [0] in the flexible array

Ack.

> > +};
> > +
> > +static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
> > +					     enum led_brightness brightness)
> > +{
> > +	static const u8 color2cmd[] =3D {
> > +		[LED_COLOR_ID_RED] =3D OMNIA_CMD_LED_COLOR_R,
> > +		[LED_COLOR_ID_GREEN] =3D OMNIA_CMD_LED_COLOR_G,
> > +		[LED_COLOR_ID_BLUE] =3D OMNIA_CMD_LED_COLOR_B,
> > +	};
> > +	struct omnia_leds *leds =3D dev_get_drvdata(cdev->dev->parent);
> > +	struct omnia_led *led =3D to_omnia_led(cdev);
> > +	u8 buf[OMNIA_CMD_LED_COLOR_LEN], state;
> > +	int ret;
> > +
> > +	mutex_lock(&leds->lock);
> > +
> > +	buf[OMNIA_CMD] =3D CMD_LED_COLOR;
> > +	buf[OMNIA_CMD_LED_COLOR_LED] =3D led->reg;
> > +
> > +	if (led->color =3D=3D LED_COLOR_ID_WHITE) {
> > +		buf[OMNIA_CMD_LED_COLOR_R] =3D brightness;
> > +		buf[OMNIA_CMD_LED_COLOR_G] =3D brightness;
> > +		buf[OMNIA_CMD_LED_COLOR_B] =3D brightness;
> > +	} else {
> > +		buf[OMNIA_CMD_LED_COLOR_R] =3D leds->cache[led->reg][0];
> > +		buf[OMNIA_CMD_LED_COLOR_G] =3D leds->cache[led->reg][1];
> > +		buf[OMNIA_CMD_LED_COLOR_B] =3D leds->cache[led->reg][2];
> > +		buf[color2cmd[led->color]] =3D brightness;
> > +	}
> > +
> > +	state =3D CMD_LED_STATE_LED(led->reg);
> > +	if (buf[OMNIA_CMD_LED_COLOR_R] || buf[OMNIA_CMD_LED_COLOR_G] ||
> > +	    buf[OMNIA_CMD_LED_COLOR_B])
> > +		state |=3D CMD_LED_STATE_ON;
> > +
> > +	ret =3D i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
> > +	if (ret >=3D 0 && (state & CMD_LED_STATE_ON))
> > +		ret =3D i2c_master_send(leds->client, buf, 5); =20
> No check on ret?

The function returns ret.

> > +
> > +	leds->cache[led->reg][0] =3D buf[OMNIA_CMD_LED_COLOR_R];
> > +	leds->cache[led->reg][1] =3D buf[OMNIA_CMD_LED_COLOR_G];
> > +	leds->cache[led->reg][2] =3D buf[OMNIA_CMD_LED_COLOR_B];
> > +
> > +	mutex_unlock(&leds->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int omnia_led_register(struct omnia_leds *leds,
> > +			      struct fwnode_handle *node)
> > +{
> > +	struct i2c_client *client =3D leds->client;
> > +	struct led_init_data init_data =3D {};
> > +	struct device *dev =3D &client->dev;
> > +	struct omnia_led *led;
> > +	int ret, nsources, color;
> > +	u32 led_sources[3];
> > +
> > +	led =3D &leds->leds[leds->nleds];
> > +
> > +	nsources =3D fwnode_property_count_u32(node, "led-sources");
> > +	if (nsources !=3D 1 && nsources !=3D 3) {
> > +		dev_warn(dev,
> > +			 "Node %pfw: 'led-sources' must contain either 1 or 3 items!\n",
> > +			 node);
> > +		return 0;
> > +	}
> > +
> > +	ret =3D fwnode_property_read_u32_array(node, "led-sources", led_sourc=
es,
> > +					     nsources);
> > +	if (ret) {
> > +		dev_err(dev, "Node %pfw: 'led-sources' read failed: %i\n",
> > +			node, ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D fwnode_property_read_u32(node, "color", &led->color);
> > +	if (ret) {
> > +		dev_warn(dev, "Node %pfw: 'color' read failed!\n",
> > +			 node);
> > +		return 0;
> > +	}
> > +
> > +	if (nsources =3D=3D 3) {
> > +		if ((led_sources[0] % 3) !=3D 0 ||
> > +		    led_sources[1] !=3D led_sources[0] + 1 ||
> > +		    led_sources[2] !=3D led_sources[0] + 2 ||
> > +		    led_sources[2] >=3D OMNIA_BOARD_LEDS * 3) {
> > +			dev_warn(dev, "Node %pfw has invalid 'led-sources'!\n",
> > +				 node);
> > +			return 0;
> > +		}
> > +
> > +		color =3D LED_COLOR_ID_WHITE;
> > +	} else {
> > +		const int led_source_to_color[3] =3D {
> > +			LED_COLOR_ID_RED,
> > +			LED_COLOR_ID_GREEN,
> > +			LED_COLOR_ID_BLUE
> > +		};
> > +		color =3D led_source_to_color[led_sources[0] % 3];
> > +
> > +		if (led_sources[0] >=3D OMNIA_BOARD_LEDS * 3) {
> > +			dev_warn(dev, "Node %pfw has invalid 'led-sources'!\n",
> > +				 node);
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	if (led->color !=3D color) {
> > +		dev_warn(dev, "Node %pfw: 'color' should be %s!\n", node,
> > +			 led_colors[color]);
> > +		return 0;
> > +	}
> > +
> > +	init_data.fwnode =3D node;
> > +
> > +	led->reg =3D led_sources[0] / 3;
> > +	led->cdev.max_brightness =3D 255;
> > +	led->cdev.brightness_set_blocking =3D omnia_led_brightness_set_blocki=
ng;
> > +
> > +	fwnode_property_read_string(node, "linux,default-trigger",
> > +				    &led->cdev.default_trigger);
> > +
> > +	/* put the LED into software mode */
> > +	ret =3D i2c_smbus_write_byte_data(client, CMD_LED_MODE,
> > +					CMD_LED_MODE_LED(led->reg) |
> > +					CMD_LED_MODE_USER);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Cannot set LED %pfw to software mode: %i\n", node,
> > +			ret);
> > +		return ret;
> > +	}
> > +
> > +	/* disable the LED */
> > +	ret =3D i2c_smbus_write_byte_data(client, CMD_LED_STATE,
> > +						CMD_LED_STATE_LED(led->reg));
> > +	if (ret < 0) {
> > +		dev_err(dev, "Cannot set LED %pfw brightness: %i\n", node, ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Cannot register LED %pfw: %i\n", node, ret);
> > +		return ret;
> > +	}
> > +
> > +	++leds->nleds;
> > +
> > +	return 0;
> > +}
> > +
> > +static int omnia_leds_probe(struct i2c_client *client,
> > +			    const struct i2c_device_id *id)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	struct device_node *np =3D dev->of_node, *child;
> > +	struct omnia_leds *leds;
> > +	int ret, count;
> > +
> > +	count =3D of_get_available_child_count(np); =20
> device_get_child_node_count(&client->dev);

No problem with that, but why? This driver cannot be used without OF
anyway.

> > +	if (!count) {
> > +		dev_err(dev, "LEDs are not defined in device tree!\n");
> > +		return -ENODEV;
> > +	} else if (count > 3 * OMNIA_BOARD_LEDS) {
> > +		dev_err(dev, "Too many LEDs defined in device tree!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	leds =3D devm_kzalloc(dev, sizeof(*leds) + count * sizeof(leds->leds[=
0]),
> > +			    GFP_KERNEL); =20
> You can use this macro for flexible arrays struct_size(led, leds, count),

Ack, thx.

> > +	if (!leds)
> > +		return -ENOMEM;
> > +
> > +	leds->client =3D client;
> > +	i2c_set_clientdata(client, leds);
> > +
> > +	mutex_init(&leds->lock);
> > +
> > +	for_each_available_child_of_node(np, child) {
> > +		ret =3D omnia_led_register(leds, &child->fwnode);
> > +		if (ret < 0) =20
> if (ret) I don't see ret returning > 0

Ack.

> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int omnia_leds_remove(struct i2c_client *client)
> > +{
> > +	u8 buf[OMNIA_CMD_LED_COLOR_LEN];
> > +
> > +	/* put all LEDs into default (HW triggered) mode */
> > +	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
> > +				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
> > +
> > +	/* set all LEDs color to [255, 255, 255] */
> > +	buf[OMNIA_CMD] =3D CMD_LED_COLOR;
> > +	buf[OMNIA_CMD_LED_COLOR_LED] =3D OMNIA_BOARD_LEDS;
> > +	buf[OMNIA_CMD_LED_COLOR_R] =3D 255;
> > +	buf[OMNIA_CMD_LED_COLOR_G] =3D 255;
> > +	buf[OMNIA_CMD_LED_COLOR_B] =3D 255;
> > +
> > +	i2c_master_send(client, buf, 5);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id of_omnia_leds_match[] =3D {
> > +	{ .compatible =3D "cznic,turris-omnia-leds", },
> > +	{},
> > +};
> > +
> > +static const struct i2c_device_id omnia_id[] =3D {
> > +	{ "omnia", 0 },
> > +	{ }
> > +};
> > +
> > +static struct i2c_driver omnia_leds_driver =3D {
> > +	.probe		=3D omnia_leds_probe,
> > +	.remove		=3D omnia_leds_remove,
> > +	.id_table	=3D omnia_id,
> > +	.driver		=3D {
> > +		.name	=3D "leds-turris-omnia",
> > +		.of_match_table =3D of_omnia_leds_match,
> > +	},
> > +};
> > +
> > +module_i2c_driver(omnia_leds_driver);
> > +
> > +MODULE_AUTHOR("Marek Behun <marek.behun@nic.cz>");
> > +MODULE_DESCRIPTION("CZ.NIC's Turris Omnia LEDs");
> > +MODULE_LICENSE("GPL v2"); =20

