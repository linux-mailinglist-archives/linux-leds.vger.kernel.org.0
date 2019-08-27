Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5FA29F46F
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 22:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730584AbfH0UoJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 16:44:09 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:57416 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728233AbfH0UoI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 27 Aug 2019 16:44:08 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 4C4A31A2443B;
        Tue, 27 Aug 2019 23:44:05 +0300 (EEST)
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <e59f9411-e762-fd62-55f1-3e29bd5c36ad@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Openpgp: preference=signencrypt
Autocrypt: addr=oleg@kaa.org.ua; prefer-encrypt=mutual; keydata=
 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
 WVdfrwbus0lVCELNSvCIW2IktSytUxjQfmjBMw==
Message-ID: <08a3898c-6556-516c-a057-650cc22a86b6@kaa.org.ua>
Date:   Tue, 27 Aug 2019 23:43:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e59f9411-e762-fd62-55f1-3e29bd5c36ad@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CVKuLoGxBhVz4rddBJBcs7cvZuYzbdYcZ"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CVKuLoGxBhVz4rddBJBcs7cvZuYzbdYcZ
Content-Type: multipart/mixed; boundary="Wj0af6c7Xpbwb455DfydjOBJOm1AA5j9U";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Message-ID: <08a3898c-6556-516c-a057-650cc22a86b6@kaa.org.ua>
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <e59f9411-e762-fd62-55f1-3e29bd5c36ad@gmail.com>
In-Reply-To: <e59f9411-e762-fd62-55f1-3e29bd5c36ad@gmail.com>

--Wj0af6c7Xpbwb455DfydjOBJOm1AA5j9U
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Jacek,

what status of linux-leds.git?
    git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

Is it outdated? Because I have a errors:
    drivers/leds/leds-el15203000.c:234:9: error: variable =E2=80=98init_d=
ata=E2=80=99 has initializer but incomplete type
      struct led_init_data init_data =3D {};
             ^~~~~~~~~~~~~

18.08.19 16:47, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> Hi Oleh,
>=20
> Please find my review remarks below.
>=20
> On 8/8/19 10:32 PM, Oleh Kravchenko wrote:
>> This patch adds a LED class driver for the RGB LEDs found on
>> the Crane Merchandising System EL15203000 LEDs board
>> (aka RED LEDs board).
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>  .../testing/sysfs-class-led-driver-el15203000 |  22 +
>>  drivers/leds/Kconfig                          |  13 +
>>  drivers/leds/Makefile                         |   1 +
>>  drivers/leds/leds-el15203000.c                | 478 +++++++++++++++++=
+
>>  4 files changed, 514 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-e=
l15203000
>>  create mode 100644 drivers/leds/leds-el15203000.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-el152030=
00 b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>> new file mode 100644
>> index 000000000000..91a483e493d9
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>> @@ -0,0 +1,22 @@
>> +What:		/sys/class/leds/<led>/hw_pattern
>> +Date:		August 2019
>> +KernelVersion:	5.3
>> +Description:
>> +		Specify a hardware pattern for the EL15203000 LED.
>> +		The LEDs board supports only predefined patterns by firmware
>> +		for specific LEDs.
>> +
>> +		Breathing mode for Screen frame light tube:
>> +		"0 4000 1 4000"
>> +
>> +		Cascade mode for Pipe LED:
>> +		"1 800 2 800 4 800 8 800 16 800 1 800 2 800 4 800 8 800 16 800"
>=20
> There's no point in repeating same sequence. Just require to provide it=

> once:
>=20
> "1 800 2 800 4 800 8 800 16 800"
>=20
>> +
>> +		Inverted cascade mode for Pipe LED:
>> +		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 15 =
800"
>=20
> The same story:
>=20
> "30 800 29 800 27 800 23 800 15 800"
>=20
>> +
>> +		Bounce mode for Pipe LED:
>> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
>> +
>> +		Inverted bounce mode for Pipe LED:
>> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 =
800"
>=20
> These can be left as they are now.
>=20
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 760f73a49c9f..0cbdb9ba5213 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -129,6 +129,19 @@ config LEDS_CR0014114
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called leds-cr0014114.
>> =20
>> +config LEDS_EL15203000
>> +	tristate "LED Support for Crane EL15203000"
>> +	depends on LEDS_CLASS
>> +	depends on SPI
>> +	depends on OF
>> +	help
>> +	  This option enables support for EL15203000 LED Board
>> +	  (aka RED LED board) which is widely used in coffee vending
>> +	  machines produced by Crane Merchandising Systems.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called leds-el15203000.
>> +
>>  config LEDS_LM3530
>>  	tristate "LCD Backlight driver for LM3530"
>>  	depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 1e9702ebffee..1f193ffc2feb 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+=3D leds-lm3601x.o
>>  # LED SPI Drivers
>>  obj-$(CONFIG_LEDS_CR0014114)		+=3D leds-cr0014114.o
>>  obj-$(CONFIG_LEDS_DAC124S085)		+=3D leds-dac124s085.o
>> +obj-$(CONFIG_LEDS_EL15203000)		+=3D leds-el15203000.o
>> =20
>>  # LED Userspace Drivers
>>  obj-$(CONFIG_LEDS_USER)			+=3D uleds.o
>> diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el1520=
3000.c
>> new file mode 100644
>> index 000000000000..c62da5ec6630
>> --- /dev/null
>> +++ b/drivers/leds/leds-el15203000.c
>> @@ -0,0 +1,478 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2019 Crane Merchandising Systems. All rights reserve=
d.
>> +// Copyright (C) 2019 Oleh Kravchenko <oleg@kaa.org.ua>
>> +
>> +#include <linux/delay.h>
>> +#include <linux/leds.h>
>> +#include <linux/limits.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/spi/spi.h>
>> +#include <uapi/linux/uleds.h>
>> +
>> +/*
>> + * EL15203000 SPI protocol description:
>> + * +-----+------------+
>> + * | LED | BRIGHTNESS |
>> + * +-----+------------+
>> + * |  1  |      1     |
>> + * +-----+------------+
>> + * (*) LEDs MCU board expects 20 msec delay per byte.
>> + *
>> + * LEDs:
>> + * +----------+--------------+---------------------------------------=
----+
>> + * |    ID    |     NAME     |         DESCRIPTION                   =
    |
>> + * +----------+--------------+---------------------------------------=
----+
>> + * | 'P' 0x50 |     Pipe     | Consists from 5 LEDs, controlled by bo=
ard |
>> + * +----------+--------------+---------------------------------------=
----+
>> + * | 'S' 0x53 | Screen frame | Light tube around the screen          =
    |
>> + * +----------+--------------+---------------------------------------=
----+
>> + * | 'V' 0x56 | Vending area | Highlights a cup of coffee            =
    |
>> + * +----------+--------------+---------------------------------------=
----+
>> + *
>> + * BRIGHTNESS:
>> + * +----------+-----------------+--------------+--------------+
>> + * |  VALUES  |       PIPE      | SCREEN FRAME | VENDING AREA |
>> + * +----------+-----------------+--------------+--------------+
>> + * | '0' 0x30 |                      Off                      |
>> + * +----------+-----------------------------------------------+
>> + * | '1' 0x31 |                      On                       |
>> + * +----------+-----------------+--------------+--------------+
>> + * | '2' 0x32 |     Cascade     |   Breathing  |
>> + * +----------+-----------------+--------------+
>> + * | '3' 0x33 | Inverse cascade |
>> + * +----------+-----------------+
>> + * | '4' 0x34 |     Bounce      |
>> + * +----------+-----------------+
>> + * | '5' 0x35 | Inverse bounce  |
>> + * +----------+-----------------+
>> + */
>> +
>> +/* EL15203000 default settings */
>> +#define EL_FW_DELAY_USEC	20000
>> +
>> +enum el15203000_brightness {
>=20
> Please change 'brightness' to 'command' or so. Brightness is misleading=

> since this device supports in fact only one level of brightness for
> non-pattern use case.
>=20
>> +	/* for all LEDs */
>> +	EL_OFF			=3D '0',
>> +	EL_ON			=3D '1',
>> +
>> +	/* for Screen LED */
>> +	EL_SCREEN_BREATHING	=3D '2',
>> +
>> +	/* for Pipe LED */
>> +	EL_PIPE_CASCADE		=3D '2',
>> +	EL_PIPE_INV_CASCADE	=3D '3',
>> +	EL_PIPE_BOUNCE		=3D '4',
>> +	EL_PIPE_INV_BOUNCE	=3D '5',
>> +};
>> +
>> +struct el15203000_led {
>> +	struct el15203000	*priv;
>> +	struct led_classdev	ldev;
>> +	char			name[LED_MAX_NAME_SIZE];
>=20
> This field will not be needed if we switch to
> devm_led_classdev_register_ext().
>=20
>> +	u8			reg;
>> +};
>> +
>> +struct el15203000 {
>> +	struct device		*dev;
>> +	struct mutex		lock;
>> +	struct spi_device	*spi;
>> +	unsigned long		delay;
>> +	size_t			count;
>> +	struct el15203000_led	leds[];
>> +};
>> +
>> +static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
>> +{
>> +	int		ret;
>> +	u8		cmd[2];
>> +	size_t		i;
>> +	unsigned long	jdelay, udelay, now;
>> +
>> +	mutex_lock(&led->priv->lock);
>> +
>> +	dev_dbg(led->priv->dev, "Set brightness of %s to %d",
>> +		led->name, brightness);
>> +
>> +	/* to avoid SPI mistiming with firmware we should wait some time */
>> +	now =3D jiffies;
>> +	if (time_after(led->priv->delay, now)) {
>> +		jdelay =3D led->priv->delay - now;
>> +		udelay =3D jiffies_to_usecs(jdelay);
>> +
>> +		dev_dbg(led->priv->dev, "Wait %luus (%lu jiffies) to sync",
>> +			udelay, jdelay);
>> +
>> +		usleep_range(udelay, udelay + 1);
>> +	}
>> +
>> +	cmd[0] =3D led->reg;
>> +	cmd[1] =3D brightness;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(cmd); i++) {
>> +		if (i)
>> +			usleep_range(EL_FW_DELAY_USEC,
>> +				     EL_FW_DELAY_USEC + 1);
>> +
>> +		ret =3D spi_write(led->priv->spi, &cmd[i], sizeof(cmd[i]));
>> +		if (ret) {
>> +			dev_err(led->priv->dev,
>> +				"spi_write() error %d", ret);
>> +			break;
>> +		}
>> +	}
>> +
>> +	led->priv->delay =3D jiffies + usecs_to_jiffies(EL_FW_DELAY_USEC);
>> +
>> +	mutex_unlock(&led->priv->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int el15203000_set_blocking(struct led_classdev *ldev,
>> +				   enum led_brightness brightness)
>> +{
>> +	struct el15203000_led	*led =3D container_of(ldev,
>> +						    struct el15203000_led,
>> +						    ldev);
>> +
>> +	return el15203000_cmd(led, brightness =3D=3D LED_OFF ? EL_OFF : EL_O=
N);
>> +}
>> +
>> +static int led_pattern_cmp(const struct led_pattern *p1, u32 p1_len,
>> +			   const struct led_pattern *p2, u32 p2_len)
>> +{
>> +	u32 i;
>> +
>> +	if (p1_len !=3D p2_len)
>> +		return -1;
>> +
>> +	for (i =3D 0; i < p1_len; i ++)
>> +		if (p1[i].delta_t !=3D p2[i].delta_t ||
>> +		    p1[i].brightness !=3D p2[i].brightness)
>> +			return -1;
>> +
>> +	return 0;
>> +}
>> +
>> +int el15203000_pattern_set_S(struct led_classdev *ldev,
>> +			     struct led_pattern *pattern,
>> +			     u32 len, int repeat)
>> +{
>> +	struct el15203000_led	*led =3D container_of(ldev,
>> +						    struct el15203000_led,
>> +						    ldev);
>> +	struct led_pattern	scr_pattern[] =3D {{
>> +		.delta_t	=3D 4000,
>> +		.brightness	=3D 0,
>> +	}, {
>> +		.delta_t	=3D 4000,
>> +		.brightness	=3D 1,
>> +	}};
>> +
>> +	if (repeat > 0)
>> +		return -EINVAL;
>> +
>> +	if (led_pattern_cmp(scr_pattern, ARRAY_SIZE(scr_pattern), pattern, l=
en))
>> +		return -EINVAL;
>> +
>> +	dev_dbg(led->priv->dev, "Breathing mode for '%s'", led->name);
>> +
>> +	return el15203000_cmd(led, EL_SCREEN_BREATHING);
>> +}
>> +
>> +int el15203000_pattern_set_P(struct led_classdev *ldev,
>> +			   struct led_pattern *pattern,
>> +			   u32 len, int repeat)
>> +{
>> +	struct el15203000_led	*led =3D container_of(ldev,
>> +						    struct el15203000_led,
>> +						    ldev);
>> +
>> +	struct led_pattern cascade[] =3D {{
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 1,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 2,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 4,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 8,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 16,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 1,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 2,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 4,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 8,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 16,
>> +	}};
>> +
>> +	struct led_pattern inv_cascade[] =3D {{
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 30,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 29,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 27,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 23,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 15,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 30,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 29,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 27,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 23,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 15,
>> +	}};
>> +
>> +	struct led_pattern	bounce[] =3D {{
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 1,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 2,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 4,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 8,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 16,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 16,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 8,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 4,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 2,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 1,
>> +	}};
>> +
>> +	struct led_pattern	inv_bounce[] =3D {{
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 30,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 29,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 27,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 23,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 15,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 15,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 23,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 27,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 29,
>> +	}, {
>> +		.delta_t	=3D 800,
>> +		.brightness	=3D 30,
>> +	}};
>=20
> There is no need for these arrays. We can come up with formulas for
> validating the pattern tuples. Basically all of them involve difference=
s
> in brightness being powers of two:
>=20
> "1 800 2 800 4 800 8 800 16 800"
>=20
> Here each next step should be equal to (1 << i) staring from i =3D 0.
>=20
> "30 800 29 800 27 800 23 800 15 800"
>=20
> brightness =3D 30;
> for (i =3D 0; i < pattern_len; i++) {
> 	br_diff =3D (i > 0) ? (1 << (i - 1)) : 0;
> 	brightness -=3D br_diff;
> }
>=20
> "1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
>=20
> "30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"=

>=20
> Above two can be handled by slightly modifying what I proposed above.
>=20
> And for delta_t just require by default always 800.
>=20
>> +	if (repeat > 0)
>> +		return -EINVAL;
>> +
>> +	if (!led_pattern_cmp(cascade, ARRAY_SIZE(cascade), pattern, len)) {
>> +		dev_dbg(led->priv->dev, "Cascade mode for '%s'", led->name);
>> +		return el15203000_cmd(led, EL_PIPE_CASCADE);
>> +	} else if (!led_pattern_cmp(inv_cascade, ARRAY_SIZE(inv_cascade), pa=
ttern, len)) {
>> +		dev_dbg(led->priv->dev, "Inverse cascade mode for '%s'", led->name)=
;
>> +		return el15203000_cmd(led, EL_PIPE_INV_CASCADE);
>> +	} else if (!led_pattern_cmp(bounce, ARRAY_SIZE(bounce), pattern, len=
)) {
>> +		dev_dbg(led->priv->dev, "Bounce mode for '%s'", led->name);
>> +		return el15203000_cmd(led, EL_PIPE_BOUNCE);
>> +	} else if (!led_pattern_cmp(inv_bounce, ARRAY_SIZE(inv_bounce), patt=
ern, len)) {
>> +		dev_dbg(led->priv->dev, "Inverse bounce mode for '%s'", led->name);=

>> +		return el15203000_cmd(led, EL_PIPE_INV_BOUNCE);
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +int el15203000_pattern_clear(struct led_classdev *ldev)
>> +{
>> +	struct el15203000_led	*led =3D container_of(ldev,
>> +						    struct el15203000_led,
>> +						    ldev);
>> +
>> +	return el15203000_cmd(led, EL_OFF);
>> +}
>> +
>> +static int el15203000_probe_dt(struct el15203000 *priv)
>> +{
>> +	size_t			i =3D 0;
>> +	struct el15203000_led	*led;
>> +	struct fwnode_handle	*child;
>> +	int			ret;
>> +	const char		*str;
>> +	u32			reg;
>> +
>> +	device_for_each_child_node(priv->dev, child) {
> 		struct led_init_data init_data =3D {};
>=20
> Please add above declaration here.
>=20
>> +		led =3D &priv->leds[i];
>> +
>> +		ret =3D fwnode_property_read_u32(child, "reg", &reg);
>> +		if (ret) {
>> +			dev_err(priv->dev, "LED without ID number");
>> +			fwnode_handle_put(child);
>> +
>> +			return ret;
>> +		}
>> +
>> +		if (reg > U8_MAX) {
>> +			dev_err(priv->dev, "LED value %d is invalid", reg);
>> +			fwnode_handle_put(child);
>> +
>> +			return -EINVAL;
>> +		}
>> +
>> +		led->reg =3D reg;
>> +
>> +		ret =3D fwnode_property_read_string(child, "label", &str);
>> +		if (ret)
>> +			str =3D ":";
>> +		snprintf(led->name, sizeof(led->name), "el15203000:%s", str);
>=20
> And instead of the four above lines please just do the below assignment=
:
>=20
> 		init_data.fwnode =3D child;
>=20
> but let's do it right before calling devm_led_classdev_register_ext().
>=20
>> +
>> +		fwnode_property_read_string(child, "linux,default-trigger",
>> +					    &led->ldev.default_trigger);
>> +
>> +		led->ldev.max_brightness	  =3D LED_ON;
>> +		led->priv			  =3D priv;
>> +		led->ldev.name			  =3D led->name;
>=20
> Please also remove the above line.
>=20
>> +		led->ldev.brightness_set_blocking =3D el15203000_set_blocking;
>> +
>> +		if (reg =3D=3D 'S') {
>> +			led->ldev.pattern_set	=3D el15203000_pattern_set_S;
>> +			led->ldev.pattern_clear	=3D el15203000_pattern_clear;
>> +		} else if (reg =3D=3D 'P') {
>> +			led->ldev.pattern_set	=3D el15203000_pattern_set_P;
>> +			led->ldev.pattern_clear	=3D el15203000_pattern_clear;
>> +		}
>> +
>> +		ret =3D devm_led_classdev_register(priv->dev, &led->ldev);
>=20
> And here let's switch to the new LED registration API:
>=20
> 		ret =3D devm_led_classdev_register_ext(priv->dev, &led->ldev, &init_d=
ata);
>=20
>=20
>> +		if (ret) {
>> +			dev_err(priv->dev,
>> +				"failed to register LED device %s, err %d",
>> +				led->name, ret);
>> +			fwnode_handle_put(child);
>> +			return ret;
>> +		}
>> +
>> +		i++;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int el15203000_probe(struct spi_device *spi)
>> +{
>> +	struct el15203000	*priv;
>> +	size_t			count;
>> +	int			ret;
>> +
>> +	count =3D device_get_child_node_count(&spi->dev);
>> +	if (!count) {
>> +		dev_err(&spi->dev, "LEDs are not defined in device tree!");
>> +		return -ENODEV;
>> +	}
>> +
>> +	priv =3D devm_kzalloc(&spi->dev, struct_size(priv, leds, count),
>> +			    GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&priv->lock);
>> +	priv->count	=3D count;
>> +	priv->dev	=3D &spi->dev;
>> +	priv->spi	=3D spi;
>> +	priv->delay	=3D jiffies -
>> +			  usecs_to_jiffies(EL_FW_DELAY_USEC);
>> +
>> +	ret =3D el15203000_probe_dt(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	spi_set_drvdata(spi, priv);
>> +	dev_dbg(priv->dev, "%zd LEDs registered", priv->count);
>=20
> Please remove this debug log.
>=20
>> +
>> +	return 0;
>> +}
>> +
>> +static int el15203000_remove(struct spi_device *spi)
>> +{
>> +	struct el15203000 *priv =3D spi_get_drvdata(spi);
>> +
>> +	mutex_destroy(&priv->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id el15203000_dt_ids[] =3D {
>> +	{ .compatible =3D "crane,el15203000", },
>> +	{},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, el15203000_dt_ids);
>> +
>> +static struct spi_driver el15203000_driver =3D {
>> +	.probe		=3D el15203000_probe,
>> +	.remove		=3D el15203000_remove,
>> +	.driver =3D {
>> +		.name		=3D KBUILD_MODNAME,
>> +		.of_match_table	=3D el15203000_dt_ids,
>> +	},
>> +};
>> +
>> +module_spi_driver(el15203000_driver);
>> +
>> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
>> +MODULE_DESCRIPTION("el15203000 LED driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("spi:el15203000");
>>
>=20
> Please also fix the issues checkpatch.pl complains about.
>=20

--=20
Best regards,
Oleh Kravchenko



--Wj0af6c7Xpbwb455DfydjOBJOm1AA5j9U--

--CVKuLoGxBhVz4rddBJBcs7cvZuYzbdYcZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1llg0ACgkQ0xNJm20p
l4xg/A/7B0vrjmP71v08fMqIF5pAkriem84t2HpQIp03qdn5epKfrf84KxYpkf/i
8CGukOmYatbzRzpAa0NHHKOVK3QhfGHlPDJJ/ilQEkDwNN/dRph2p2jNFaDAvJKL
dN+KDjipF+UPVQrTSgz8Db1s0DBdWscCpJJs7ReXz83rt26mjbbZ0N9r2PH1SKcM
qeYBIDdUJaTsZ7R7+4TpkOJN5liK/MGvZf5vC+3mmKQRBwEdJnR1xQ7TDZ//m1Q4
MwaTXoFLEEc1mMkuaOrZ44Cy14KGtxhlfMkyKoWjVHfekJK6o9QXAKWKWw3Yayya
phV7C1nDnFzXJ9F0MnbhbxpZG3H5uwUVKM9jxH5sKPdMjJxhzXIfxuG0nUBPKPuc
XQDDwi8GFbUkWdRQRY2Lvp0zu7rEM21+FmCPgkbSl2mxAC6KfOMOHj0e5H7L33d6
Nv+pK7wECBdTXzB4Py5tRvPxfZFA/9k2WD9bSiKQDjHBvx3t3MmL4CaCfcIZ0Z3Q
B52gvVQdazwp0g/TzonVxj+0r+5RFJkSJpq7o8vrP+zNlXDZymheUVgIRtYXX99L
VxuuEe0CR8DLiGu/c6oNPqe/yEuXS3V4ni683MDRJs0mZXAKoclm0Io4hHrtnjKI
YtqQwH97tz2BQdmywVs4AWMtfVFUlLVJqwbUPnnXoOXfXa/vxaM=
=byz7
-----END PGP SIGNATURE-----

--CVKuLoGxBhVz4rddBJBcs7cvZuYzbdYcZ--
