Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACE43A8C6E
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jun 2021 01:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhFOX0S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Jun 2021 19:26:18 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:55282 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhFOX0S (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Jun 2021 19:26:18 -0400
Date:   Tue, 15 Jun 2021 23:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1623799451;
        bh=gvTsVB0nyLOfdLU3GhlgiAI9bgPedRw8XuYS3OruJnA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=DAS1kDmT2Pr/rsrCugalopBTp/KsEd5ZD3NRk5ZdrlQImkO8vwMCz9MasgWaHPClo
         1yBPggIN+Mwd6uTz27MUc6vjDFbXdrImwZwjZanJkfrl0mnIrs9CCaMAT1jME0aesQ
         F2qr99tAtTRnQZKrAB2wXYo4M11OTJMBcMBoFJB4=
To:     leo60228 <leo@60228.dev>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
Message-ID: <YqTP_mhFNQj00M90V9BqAinqDdpQt3Wuu7i6OmgckNDSo0l7htySl7jVBDbA4pHJ5DEH_SGAEGCHgBN1ubghTAcc7ct9AOfD8Nd-KLZFeyc=@protonmail.com>
In-Reply-To: <20210615221931.18148-1-leo@60228.dev>
References: <20210615221931.18148-1-leo@60228.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi

thanks for the patch. I have added a couple comments inline.
I have also CCd the linux-leds mailing list so that you can
hopefully receive some feedback from there as well.


2021. j=C3=BAnius 16., szerda 0:19 keltez=C3=A9ssel, leo60228 =C3=ADrta:

> The Acer Predator Helios 500's keyboard has four zones of RGB LEDs.
>
> This driver allows them to be controlled from Linux.
>
> Signed-off-by: leo60228 <leo@60228.dev>
> ---
>  MAINTAINERS                     |   6 ++
>  drivers/platform/x86/Kconfig    |  13 +++
>  drivers/platform/x86/Makefile   |   1 +
>  drivers/platform/x86/acer-led.c | 156 ++++++++++++++++++++++++++++++++
>  4 files changed, 176 insertions(+)
>  create mode 100644 drivers/platform/x86/acer-led.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc0ceef87..f647ea81c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -327,6 +327,12 @@ S:=09Maintained
>  W:=09http://piie.net/?section=3Dacerhdf
>  F:=09drivers/platform/x86/acerhdf.c
>
> +ACER PREDATOR LAPTOP LEDS
> +M:=09leo60228 <leo@60228.dev>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09drivers/platform/x86/acer-led.c
> +
>  ACER WMI LAPTOP EXTRAS
>  M:=09"Lee, Chun-Yi" <jlee@suse.com>
>  L:=09platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 60592fb88..7dc4fd1ef 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -190,6 +190,19 @@ config ACER_WMI
>  =09  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  =09  here.
>
> +config ACER_LED
> +=09tristate "Acer Predator Laptop LEDs"
> +=09depends on ACPI
> +=09depends on ACPI_WMI
> +=09depends on LEDS_CLASS
> +=09depends on NEW_LEDS
> +=09help
> +=09  This is a driver for the RGB keyboard LEDs in Acer Predator laptops=
.
> +=09  It was designed for the Acer Predator Helios 500.
> +
> +=09  If you choose to compile this driver as a module the module will be
> +=09  called acer-led.
> +
>  config AMD_PMC
>  =09tristate "AMD SoC PMC driver"
>  =09depends on ACPI && PCI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index dcc8cdb95..36722207b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_GIGABYTE_WMI)=09=09+=3D gigabyte-wmi.o
>  obj-$(CONFIG_ACERHDF)=09=09+=3D acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)=09+=3D acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)=09=09+=3D acer-wmi.o
> +obj-$(CONFIG_ACER_LED)=09=09+=3D acer-led.o
>
>  # AMD
>  obj-$(CONFIG_AMD_PMC)=09=09+=3D amd-pmc.o
> diff --git a/drivers/platform/x86/acer-led.c b/drivers/platform/x86/acer-=
led.c
> new file mode 100644
> index 000000000..82a7b099a
> --- /dev/null
> +++ b/drivers/platform/x86/acer-led.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Acer LED Driver
> + *
> + * Copyright (C) 2021 leo60228
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/leds.h>
> +#include <linux/wmi.h>
> +
> +MODULE_AUTHOR("leo60228");
> +MODULE_DESCRIPTION("Acer LED Driver");
> +MODULE_LICENSE("GPL");
> +
> +#define ACER_LED_METHOD_GUID "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
> +
> +struct acer_led {
> +=09char name[32];
> +=09struct led_classdev cdev;
> +=09struct acer_led_zone *zone;
> +};
> +
> +struct acer_led_zone {
> +=09int id;
> +=09struct acer_led red;
> +=09struct acer_led green;
> +=09struct acer_led blue;

There are multicolor leds (see Documentation/leds/leds-class-multicolor),
maybe that would be a better fit instead of creating 4x3 LED devices?


> +};
> +
> +struct acer_led_priv {
> +=09struct acer_led_zone zones[4];
> +};
> +
> +struct led_zone_set_param {
> +=09u8 zone;
> +=09u8 red;
> +=09u8 green;
> +=09u8 blue;
> +} __packed;
> +
> +static int acer_led_update_zone(struct acer_led_zone *zone)
> +{
> +=09int status;

Use `acpi_status` instead of `int`.


> +
> +=09struct led_zone_set_param set_params =3D {
> +=09=09.zone =3D 1 << zone->id,

You could potentially use `BIT(zone->id)` here.


> +=09=09.red =3D zone->red.cdev.brightness,
> +=09=09.green =3D zone->green.cdev.brightness,
> +=09=09.blue =3D zone->blue.cdev.brightness,
> +=09};
> +=09struct acpi_buffer set_input =3D {
> +=09=09sizeof(struct led_zone_set_param),

I think `sizeof(set_params)` would be better here.


> +=09=09&set_params
> +=09};
> +
> +=09status =3D wmi_evaluate_method(
> +=09=09ACER_LED_METHOD_GUID, 0, 0x6, &set_input, NULL);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EINVAL;

I'm not sure if `EINVAL` is the most appropriate error code in this case.
Maybe `EIO`? Or something similar?


> +
> +=09return 0;
> +}
> +
> +static int acer_led_set(struct led_classdev *cdev,
> +=09=09=09 enum led_brightness value)
> +{
> +=09struct acer_led *led =3D container_of(cdev, struct acer_led, cdev);
> +
> +=09return acer_led_update_zone(led->zone);
> +}
> +
> +static int acer_led_setup_led(struct wmi_device *wdev,
> +=09=09=09       struct acer_led *led,
> +=09=09=09       struct acer_led_zone *zone,
> +=09=09=09       const char *color)
> +{
> +=09snprintf(led->name, sizeof(led->name), "%s:kbd_backlight-%d",
> +=09=09 color, zone->id + 1);

This is not an appropriate LED class device name. Please see
Documentation/leds/leds-class for details.


> +=09led->cdev.name =3D led->name;
> +=09led->cdev.max_brightness =3D 255;
> +=09led->cdev.brightness_set_blocking =3D acer_led_set;
> +=09led->zone =3D zone;
> +
> +=09return devm_led_classdev_register(&wdev->dev, &led->cdev);
> +}
> +
> +static int acer_led_setup(struct wmi_device *wdev)
> +{
> +=09struct acer_led_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +=09int i, err =3D 0;
> +
> +=09for (i =3D 0; i < 4; i++) {

I'd suggest `i < ARRAY_SIZE(priv->zones)` here.


> +=09=09priv->zones[i].id =3D i;
> +
> +=09=09err =3D acer_led_setup_led(wdev, &priv->zones[i].red,
> +=09=09=09=09=09 &priv->zones[i], "red");
> +=09=09if (err)
> +=09=09=09return err;
> +
> +=09=09err =3D acer_led_setup_led(wdev, &priv->zones[i].green,
> +=09=09=09=09=09 &priv->zones[i], "green");
> +=09=09if (err)
> +=09=09=09return err;
> +
> +=09=09err =3D acer_led_setup_led(wdev, &priv->zones[i].blue,
> +=09=09=09=09=09 &priv->zones[i], "blue");
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int acer_led_probe(struct wmi_device *wdev, const void *context)
> +{
> +=09struct acer_led_priv *priv;
> +
> +=09priv =3D devm_kzalloc(
> +=09=09&wdev->dev, sizeof(struct acer_led_priv), GFP_KERNEL);

`sizeof(*priv)` is preferred.


> +=09if (!priv)
> +=09=09return -ENOMEM;
> +=09dev_set_drvdata(&wdev->dev, priv);
> +
> +=09return acer_led_setup(wdev);
> +}
> +
> +static const struct wmi_device_id acer_led_id_table[] =3D {
> +=09{ .guid_string =3D ACER_LED_METHOD_GUID },
> +=09{ },
> +};
> +
> +static struct wmi_driver acer_led_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "acer-led",
> +=09},
> +=09.id_table =3D acer_led_id_table,
> +=09.probe =3D acer_led_probe,
> +};
> +
> +static int __init acer_led_init(void)
> +{
> +=09return wmi_driver_register(&acer_led_driver);
> +}
> +late_initcall(acer_led_init);
> +
> +static void __exit acer_led_exit(void)
> +{
> +=09wmi_driver_unregister(&acer_led_driver);
> +}
> +module_exit(acer_led_exit);

You don't need to define init or exit methods explicitly.
Just use

  module_wmi_driver(acer_led_driver);

that should take care of everything.


> +
> +MODULE_DEVICE_TABLE(wmi, acer_led_id_table);
>
> base-commit: 009c9aa5be652675a06d5211e1640e02bbb1c33d
> --
> 2.28.0


Regards,
Barnab=C3=A1s P=C5=91cze
