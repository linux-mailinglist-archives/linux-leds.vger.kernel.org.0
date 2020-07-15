Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083642214D4
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgGOTED (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 15:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgGOTEC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 15:04:02 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0EBC061755
        for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2020 12:04:01 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 8B02E140968;
        Wed, 15 Jul 2020 21:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594839839; bh=cP//GL37Cq50wkq8K7H8oUMrN2xAOrA+k/scmU8dnyI=;
        h=Date:From:To;
        b=e92WUzeb5hpo2/bNNDpflQZNZ9W5XOHZVt4AZhw7uji/6Yibunnqt6kE+QdEh0ASr
         TbdglkiaxJVyyK6llkzyy7OBiUEVqg5T7SjDR6twxQbNAYDolViYpFgz7eNUAV4Rjy
         j41aZimrw1H9GCN0h+5fyo6DPUVpibf4m14roysc=
Date:   Wed, 15 Jul 2020 21:03:58 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 2/2] leds: initial support for Turris Omnia LEDs
Message-ID: <20200715210358.567e0df5@dellmb.labs.office.nic.cz>
In-Reply-To: <e274c075-c630-6217-1124-b207c6f67bac@ti.com>
References: <20200715124034.9804-1-marek.behun@nic.cz>
        <20200715124034.9804-3-marek.behun@nic.cz>
        <e274c075-c630-6217-1124-b207c6f67bac@ti.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wed, 15 Jul 2020 08:27:51 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Can this be built as a module?

Yes. But only if MC framework is compiled in. If MC framework is
compiled as module as well, this results in
  FATAL: modpost: GPL-incompatible module led-class-multicolor.ko uses
  GPL-only symbol 'led_set_brightness'

> > +struct omnia_led {
> > +	struct led_classdev_mc mc_cdev;
> > +	struct mc_subled subled_info[3]; =20
> nit. #define the 3 and use it here and when indicating the num_colors

Meh, ok


> > +#define to_omnia_led(l)		container_of(l, struct
> > omnia_led, mc_cdev) =20
> Spacing look to be off here.

thx

> > +
> > +struct omnia_leds {
> > +	struct i2c_client *client;
> > +	struct mutex lock;
> > +	int nleds; =20
> This does=C2=A0 not seem to be used anywhere except for during registering

Hmmm, I'll try to rewrite this

> > +	struct omnia_led leds[0]; =20
> Remove the 0 as this should be a flexible array

Thx

> > +	led_mc_calc_color_components(&led->mc_cdev, brightness); =20
>=20
> Do you need this in the lock as well?

You are right

> > +	led->subled_info[0].color_index =3D LED_COLOR_ID_RED;
> > +	led->subled_info[0].channel =3D 0;
> > +	led->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
> > +	led->subled_info[1].channel =3D 1;
> > +	led->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
> > +	led->subled_info[2].channel =3D 2; =20
>=20
> OK this is why you may want to have sub-nodes.=C2=A0 Where reg is the
> channel and color is the color.=C2=A0 Then you can do a for_each_child.

Rob says that it doesn't need to be in DT if the controller only
supports RGB LEDs. This controller is only in Turris Omnia which was
never made with another kind of LEDs. So I think it is pointless and
would only grow the DT and complicate the driver.

> > +	cdev->max_brightness =3D 255; =20
> This is not needed.=C2=A0 It is defaulted to LED_FULL in led_class

This was discussed last year and resulted in LED_FULL being
declared obsolete in the header file.

> > +/*
> > + * On the front panel of the Turris Omnia router there is also a
> > button which can be used to control
> > + * the intensity of all the LEDs at once, so that if they are too
> > bright, user can dim them.
> > + * The microcontroller cycles between 8 levels of this global
> > brightness (from 100% to 0%), but this
> > + * setting can have any integer value between 0 and 100.
> > + * It is usable to be able to change this value from software, so
> > that it does not start at 100% =20
> This does not make sense.

It does. The user changes the brightness of all 12 LEDs with the button
to his liking and wants to have the same setting after powering
the router on again.

> > + * after every power on and annoy the user.
> > + * We expose this setting via a sysfs attribute file called
> > "brightness". This file lives in the
> > + * device directory of the LED controller, not an individual LED,
> > so it should not confuse users.
> > + */ =20
>=20
> Sorry if this has been discussed already
>=20
> This seems a bit wonky.=C2=A0 You are overriding the brightness set by th=
e=20
> LED class.

I am not. Pressing the button does not change the brightness read from
the /sys/class/leds/<LED>/brightness file. This is different brightness,
it is above the classic brightnes in the PWM hierarchy in the
microcontroller. I discussed this with Pavel and he said we can call
this file brightness as well (since it is brightness of the whole
panel), and the file does not reside in /sys/class/leds/<LED> directory.

> Does this button have an interrupt to the processor or does it go to
> the micro controller?
>=20
> Where is the current power on value stored?=C2=A0 If this is stored in th=
e=20
> micro maybe reading that value at power up and setting the brightness=20
> would be better.
>=20
> > +static ssize_t brightness_show(struct device *dev, struct
> > device_attribute *a, char *buf) +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct omnia_leds *leds =3D i2c_get_clientdata(client);
> > +	int ret;
> > +
> > +	mutex_lock(&leds->lock);
> > +	ret =3D i2c_smbus_read_byte_data(client,
> > CMD_LED_GET_BRIGHTNESS);
> > +	mutex_unlock(&leds->lock);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return sprintf(buf, "%d\n", ret);
> > +}
> > +
> > +static ssize_t brightness_store(struct device *dev, struct
> > device_attribute *a, const char *buf,led =3D &leds->leds[leds->nleds];
> > +				size_t count)
> > +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct omnia_leds *leds =3D i2c_get_clientdata(client);
> > +	unsigned int brightness;
> > +	int ret;
> > +
> > +	if (sscanf(buf, "%u", &brightness) !=3D 1)
> > +		return -EINVAL;
> > +
> > +	if (brightness > 100)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&leds->lock);
> > +	ret =3D i2c_smbus_write_byte_data(client,
> > CMD_LED_SET_BRIGHTNESS, (u8) brightness);
> > +	mutex_unlock(&leds->lock);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_RW(brightness);
> > +
> > +static struct attribute *omnia_led_controller_attrs[] =3D {
> > +	&dev_attr_brightness.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(omnia_led_controller);
> > +
> > +static int omnia_leds_probe(struct i2c_client *client,
> > +			    const struct i2c_device_id *id)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	struct device_node *np =3D dev->of_node, *child;
> > +	struct omnia_leds *leds;
> > +	int ret, count;
> > +
> > +	count =3D of_get_available_child_count(np);
> > +	if (!count) {
> > +		dev_err(dev, "LEDs are not defined in device
> > tree!\n");
> > +		return -ENODEV;
> > +	} else if (count > OMNIA_BOARD_LEDS) {
> > +		dev_err(dev, "Too many LEDs defined in device
> > tree!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	leds =3D devm_kzalloc(dev, sizeof(*leds) + count *
> > sizeof(leds->leds[0]),
> > +			    GFP_KERNEL); =20
> Use the macro struct_size(led, leds, count)

thx
