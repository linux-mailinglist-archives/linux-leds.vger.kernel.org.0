Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3733B69F95F
	for <lists+linux-leds@lfdr.de>; Wed, 22 Feb 2023 17:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbjBVQyH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Feb 2023 11:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbjBVQyF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Feb 2023 11:54:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F9A5BB3
        for <linux-leds@vger.kernel.org>; Wed, 22 Feb 2023 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677084796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h5zUU+aJ7Z+iVb3z5ISDGd1flVdL3X2DUURMitbPWhg=;
        b=bGRgyE53zPntgKVrhFV2ygQTp6gwpJR72NYUhAvpbYk5Rrf6wqNOF25+ABMlMM1UAwE8hw
        DpfCFL6HAnectzk4LQQgR0xx7JsvNFHfAj7lhZbPximAvz6ITdWwoXOioCG3yBWJriz7ak
        8z3wer0a/yfE6gHZo3rP1ZxqN/RWnPE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-cKAXmD2COO6NbLrEp4QKug-1; Wed, 22 Feb 2023 11:53:15 -0500
X-MC-Unique: cKAXmD2COO6NbLrEp4QKug-1
Received: by mail-ed1-f69.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso11506176edb.4
        for <linux-leds@vger.kernel.org>; Wed, 22 Feb 2023 08:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5zUU+aJ7Z+iVb3z5ISDGd1flVdL3X2DUURMitbPWhg=;
        b=UqOEkvFo+d+owb7dErKuG8WW6ObtxzSOrwdEz42E3wNyEzeCRyT9b1z1DRvcxc0xD/
         g3gnd1R2C1wSv6/+6Kmf25Hl6wkPBf+jGQo5KciCPu5HSd2JSWWIrBjMMp9T9TW2HrFN
         6wEqCKzwV+HISImhN/bZDhza2FkG49MIcpL8BHoQHbAJMv//su/sD57IJarL2aRAaOGV
         F00FXKwLwoLodwKTJf12A2AKTJLL4YdXtS9b57Op9Cw5pm6q69H+GJI6M2yH1a7dnrCC
         F5BUOHp+gcF2KFrCsmODMPmHiDG8916Um87FRnKnoVXoFbDBxELIPeaYxZCPbkW0Atsp
         mAOQ==
X-Gm-Message-State: AO0yUKVmpIkylQXdlA+qa+y7fFgvmUSCy4zGhLHVWJZHi7VwOFunZ6Y/
        +cGd5uyV6cd2CDCDVHZioggJTh8ev6n/FH/z9NfPR1aG+baGTKwZuP8qeEMhRsWwdyQXDlTHycW
        tqWvV31dB5FhHl1Q03hTzBw==
X-Received: by 2002:a05:6402:647:b0:4ab:ec2:3cd1 with SMTP id u7-20020a056402064700b004ab0ec23cd1mr6744157edx.25.1677084794312;
        Wed, 22 Feb 2023 08:53:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/aklv8wp7kO8cNqdv5efE18JZl366TtsvFP0NVC/K/plVkJNS4PfjBHDX42z9oKo0Dm8hLeg==
X-Received: by 2002:a05:6402:647:b0:4ab:ec2:3cd1 with SMTP id u7-20020a056402064700b004ab0ec23cd1mr6744139edx.25.1677084793960;
        Wed, 22 Feb 2023 08:53:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p11-20020a056402074b00b004acc1374849sm2729874edy.82.2023.02.22.08.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:53:13 -0800 (PST)
Message-ID: <2a0f7d36-ef0c-1c29-5f01-6115275e78dd@redhat.com>
Date:   Wed, 22 Feb 2023 17:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH 3/3] leds: tps68470: Add LED control for tps68470
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230213124520.1635257-1-hpa@redhat.com>
 <20230213124520.1635257-4-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230213124520.1635257-4-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kate,

On 2/13/23 13:45, Kate Hsuan wrote:
> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
> tps68470 provides 4 levels of power status for LEDB, so after setting
> TPS68470_ILEDCTL_ENB, the current status field (TPS68470_ILEDCTL_CTRLB)
> should also be set according to the brightness value from user space.
> These two LEDs can be controlled through the LED class of sysfs
> (tps68470-leda and tps68470-ledb).
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/leds/Kconfig         |  12 +++
>  drivers/leds/Makefile        |   1 +
>  drivers/leds/leds-tps68470.c | 170 +++++++++++++++++++++++++++++++++++
>  3 files changed, 183 insertions(+)
>  create mode 100644 drivers/leds/leds-tps68470.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 499d0f215a8b..453404cb1329 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -846,6 +846,18 @@ config LEDS_TPS6105X
>  	  It is a single boost converter primarily for white LEDs and
>  	  audio amplifiers.
>  
> +config LEDS_TPS68470
> +	tristate "LED support for TI TPS68470"
> +	depends on LEDS_CLASS
> +	depends on INTEL_SKL_INT3472
> +	help
> +	  This driver supports TPS68470 PMIC with LED chip.
> +	  It provide two LED controllers, including an indicator LED
> +	  and a flash LED.
> +
> +	  To compile this driver as a module, choose M and it will be
> +	  called leds-tps68470
> +
>  config LEDS_IP30
>  	tristate "LED support for SGI Octane machines"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 4fd2f92cd198..0a2ec01e27d9 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>  obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>  obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
>  obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
> +obj-$(CONFIG_LEDS_TPS68470)		+= leds-tps68470.o
>  
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
> new file mode 100644
> index 000000000000..6243e7a4a718
> --- /dev/null
> +++ b/drivers/leds/leds-tps68470.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED driver for TPS68470 PMIC
> + *
> + * Copyright (C) 2023 Red Hat
> + *
> + * Authors:
> + *	Kate Hsuan <hpa@redhat.com>
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/tps68470.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/leds.h>
> +
> +struct tps68470_led_data {
> +	struct regmap *tps68470_regmap;
> +	unsigned int brightness_a;
> +	unsigned int brightness_b;
> +	struct led_classdev leda_cdev;
> +	struct led_classdev ledb_cdev;
> +};
> +
> +enum ctrlb_current {
> +	CTRLB_2MA	= 0,
> +	CTRLB_4MA	= 1,
> +	CTRLB_8MA	= 2,
> +	CTRLB_16MA	= 3,
> +};
> +
> +static int set_ledb_current(struct regmap *regmap,
> +			    unsigned int *data_brightness,
> +			    enum led_brightness brightness)
> +{
> +	unsigned int ledb_current;
> +
> +	switch (brightness) {
> +	case LED_HALF:
> +		ledb_current = CTRLB_8MA;
> +		break;
> +	case LED_FULL:
> +		ledb_current = CTRLB_16MA;
> +		break;

LED_FULL is 255, now a days the LED class supports custom
brightness ranges, so you could just set max_brightness to 4
and then use brightness 1-4 to map to the 4 values.

> +	case LED_ON:
> +		ledb_current = CTRLB_4MA;
> +		break;
> +	case LED_OFF:
> +		ledb_current = CTRLB_2MA;
> +		break;

This makes no sense, when brightness == LED_OFF you
disable the LEDB output, so the configured current does
not matter.

But I believe that mapping the current to brightness is
not how this should be done / modeled. With the separate
on/off toggle this is clearly not intended to allow dimming
a LED. This is configurable to allow adjusting for different
notification LED types, but the intention is still for LEDB
to be used as a simple on/off notification LED.

(The lack of e.g. actual PWM / fine grained current control
vs doubling the current each step to me is another clear
indication the current is intended to be set once and not
for dimming purposes)

So IMHO both LED pins should have a max_brightness of 1 and
the sysfs API (or internal kernel users) should only be able
to turn them on/off (sysfs brightness 1/0)

The setting of the current should be done through a device
property. Lets call this "ti,ledb-current" with allowed
values of 2, 4, 8, 16. You can then try to get a configured
current for the pin using device-properties from probe()
and only set the current once if the property is their, e.g.
something like this:

probe ()
{
	u32 curr;

	ret = device_property_read_u32(dev, "ti,ledb-current", &curr);
	if (ret == 0) {
		switch (curr) {
		case  2: current = CTRLB_2MA; break;
		case  4: current = CTRLB_4MA; break;
		case  8: current = CTRLB_8MA; break;
		case 16: current = CTRLB_16MA; break;
		default:
			dev_err(dev, "Invalid LEDB curr value: %d\n", curr);
			return -EINVAL;
		}

		regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, TPS68470_ILEDCTL_CTRLB, curr);
	}


> +	default:
> +		return -EINVAL;
> +	}
> +
> +	*data_brightness = brightness;
> +	return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL,
> +				  TPS68470_ILEDCTL_CTRLB, ledb_current);
> +}
> +
> +static int tps68470_brightness_set(struct led_classdev *led_cdev,
> +				   enum led_brightness brightness)
> +{
> +	struct tps68470_led_data *data;
> +	struct regmap *regmap;
> +	unsigned int mask;
> +	unsigned int value;
> +	int ret;
> +
> +	if (!strncmp(led_cdev->name, "tps68470-ileda", 14)) {
> +		data = container_of(led_cdev, struct tps68470_led_data, leda_cdev);
> +		regmap = data->tps68470_regmap;
> +		data->brightness_a = brightness ? TPS68470_ILEDCTL_ENA : 0;
> +		mask = TPS68470_ILEDCTL_ENA;
> +		value = data->brightness_a;
> +	} else if (!strncmp(led_cdev->name, "tps68470-iledb", 14)) {
> +		data = container_of(led_cdev, struct tps68470_led_data, ledb_cdev);
> +		regmap = data->tps68470_regmap;
> +		mask = TPS68470_ILEDCTL_ENB;
> +		value = brightness ? TPS68470_ILEDCTL_ENB : 0;
> +		/* Set current state for ledb */
> +		ret = set_ledb_current(regmap, &data->brightness_b, brightness);
> +		if (ret)
> +			goto err_exit;
> +	} else
> +		return -EINVAL;
> +
> +	ret = regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, mask, value);
> +
> +err_exit:
> +	return ret;
> +}


> +
> +static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct tps68470_led_data *data = container_of(led_cdev,
> +						      struct tps68470_led_data,
> +						      ledb_cdev);

This container_of only works for led_b not for led_a.

> +
> +	if (!strncmp(led_cdev->name, "tps68470-ileda", 14))
> +		return data->brightness_a;
> +	else if (!strncmp(led_cdev->name, "tps68470-iledb", 14))
> +		return data->brightness_b;
> +
> +	return -EINVAL;
> +}

Instead of this strcmp magic, please just use 2 separate
brightness_get functions (thus also solving the container_of
problem above). And please also do the same for brightness_set.

Regards,

Hans


> +
> +static int tps68470_led_probe(struct platform_device *pdev)
> +{
> +	int ret = 0;
> +	struct tps68470_led_data *tps68470_led;
> +
> +	tps68470_led = devm_kzalloc(&pdev->dev, sizeof(struct tps68470_led_data),
> +				    GFP_KERNEL);
> +	if (!tps68470_led)
> +		return -ENOMEM;
> +
> +	tps68470_led->tps68470_regmap = dev_get_drvdata(pdev->dev.parent);
> +	tps68470_led->leda_cdev.name = "tps68470-ileda";
> +	tps68470_led->leda_cdev.max_brightness = 1;
> +	tps68470_led->leda_cdev.brightness_set_blocking = tps68470_brightness_set;
> +	tps68470_led->leda_cdev.brightness_get = tps68470_brightness_get;
> +	tps68470_led->leda_cdev.dev = &pdev->dev;
> +	tps68470_led->brightness_a = 0;
> +	ret = led_classdev_register(&pdev->dev, &tps68470_led->leda_cdev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to register LEDA: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tps68470_led->tps68470_regmap = dev_get_drvdata(pdev->dev.parent);
> +	tps68470_led->ledb_cdev.name = "tps68470-iledb";
> +	tps68470_led->ledb_cdev.max_brightness = 255;
> +	tps68470_led->ledb_cdev.brightness_set_blocking = tps68470_brightness_set;
> +	tps68470_led->ledb_cdev.brightness_get = tps68470_brightness_get;
> +	tps68470_led->ledb_cdev.dev = &pdev->dev;
> +	tps68470_led->brightness_b = 0;
> +	ret = led_classdev_register(&pdev->dev, &tps68470_led->ledb_cdev);
> +	if (ret < 0) {

		You are forgetting to unregister the other LED here.

But instead of adding an unregister here, please just switch to
devm_led_classdev_register() for both LEDs and then... (continued below)

> +		dev_err(&pdev->dev, "Failed to register LEDB: %d\n", ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, tps68470_led);
> +
> +	return ret;
> +}
> +
> +static int tps68470_led_remove(struct platform_device *pdev)
> +{
> +	struct tps68470_led_data *data = platform_get_drvdata(pdev);
> +
> +	led_classdev_unregister(&data->leda_cdev);
> +	led_classdev_unregister(&data->ledb_cdev);
> +
> +	return 0;
> +}

You can remove the tps68470_led_remove() function since the
devm framework now takes care of unregistering on probe-errors
and on driver unbinding (aka remove).

> +
> +static struct platform_driver tps68470_led_driver = {
> +	.driver = {
> +		   .name = "tps68470-led",
> +	},
> +	.probe = tps68470_led_probe,
> +	.remove = tps68470_led_remove,
> +};
> +module_platform_driver(tps68470_led_driver);
> +
> +MODULE_ALIAS("platform:tps68470-led");
> +MODULE_DESCRIPTION("LED driver for TPS68470 PMIC");
> +MODULE_LICENSE("GPL v2");

Regards,

Hans

