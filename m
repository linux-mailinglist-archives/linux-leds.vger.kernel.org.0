Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD6C014069
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 16:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfEEOzK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 10:55:10 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:49907 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727584AbfEEOzK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 10:55:10 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id A1F2F23824A4;
        Sun,  5 May 2019 16:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557068108;
        bh=bsgtWNy6pbx05K2sykOC962eE4Fs+b2eQbRXo2rNrXU=; l=8827;
        h=Subject:To:From;
        b=h4qflJwfi2d4RXWryA3vf9enN5LLD8Q3LxGDnXLWiQjzE8QmOunAxd9/C8BwCmAhQ
         0bpM0zBAIKQK1q0pvQT0TgRCFTAJt4xhGWgw8+h5GO7nHaBPT31ck1f3ko25cCOScJ
         k68+i1Q8Ta7prtghOmSCcytEYZBikmq3302Zgmmw=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v2 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505125242.10298-1-oss@c-mauderer.de>
 <20190505125242.10298-2-oss@c-mauderer.de>
 <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <56cc935a-0b31-e806-19cd-a111295e2fff@c-mauderer.de>
Date:   Sun, 5 May 2019 16:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155706810799.100373.8429823232049536692@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/05/2019 16:48, Jacek Anaszewski wrote:
> Hi Christian,
> 
> Thank you for the update. I have some trivial nits,
> please refer below.

Hello Jacek,

thanks for having a look. I don't have problems with the changes and
will integrate them into a v3. Sorry for the style nitpicks for example
with the (ret != 0). It's different for each project and I haven't
written much code with Linux style yet.

I'll wait for another few hours in case someone else wants additional
changes before posting v3.

Best regards

Christian

> 
> On 5/5/19 2:52 PM, oss@c-mauderer.de wrote:
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
>> This driver adds support for simple SPI based LED controller which use
>> only one byte for setting the brightness.
>>
>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>> ---
>>
>> Changes compared to v1:
>> - rename ubnt-spi to leds-spi-byte
>> - rework probe to get all parameters before allocating anything ->
>> error checks
>>    all collected together and initializing all fields of the device
>> structure is
>>    more obvious
>> - fix some unsteady indentations during variable declaration
>> - rework comment with protocol explanation
>> - handle case of off_bright > max_bright
>> - fix spelling in commit message
>> - mutex_destroy in remove
>> - change label to use either use the given one without a prefix or a
>> default one
>>    NOTE: Should the label be a mandatory parameter instead of the
>> default label?
>>
>>
>>   drivers/leds/Kconfig         |  12 ++++
>>   drivers/leds/Makefile        |   1 +
>>   drivers/leds/leds-spi-byte.c | 133 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 146 insertions(+)
>>   create mode 100644 drivers/leds/leds-spi-byte.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index a72f97fca57b..0866c55e8004 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -766,6 +766,18 @@ config LEDS_NIC78BX
>>         To compile this driver as a module, choose M here: the module
>>         will be called leds-nic78bx.
>>   +config LEDS_SPI_BYTE
>> +    tristate "LED support for SPI LED controller with a single byte"
>> +    depends on LEDS_CLASS
>> +    depends on SPI
>> +    depends on OF
>> +    help
>> +      This option enables support for LED controller which use a
>> single byte
>> +      for controlling the brightness. The minimum and maximum value
>> of the
>> +      byte can be configured via a device tree. The driver can be
>> used for
>> +      example for the microcontroller based LED controller in the
>> Ubiquiti
>> +      airCube ISP devices.
>> +
>>   comment "LED Triggers"
>>   source "drivers/leds/trigger/Kconfig"
>>   diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 4c1b0054f379..1786d7e2c236 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -75,6 +75,7 @@ obj-$(CONFIG_LEDS_PM8058)        += leds-pm8058.o
>>   obj-$(CONFIG_LEDS_MLXCPLD)        += leds-mlxcpld.o
>>   obj-$(CONFIG_LEDS_MLXREG)        += leds-mlxreg.o
>>   obj-$(CONFIG_LEDS_NIC78BX)        += leds-nic78bx.o
>> +obj-$(CONFIG_LEDS_SPI_BYTE)        += leds-spi-byte.o
>>   obj-$(CONFIG_LEDS_MT6323)        += leds-mt6323.o
>>   obj-$(CONFIG_LEDS_LM3692X)        += leds-lm3692x.o
>>   obj-$(CONFIG_LEDS_SC27XX_BLTC)        += leds-sc27xx-bltc.o
>> diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
>> new file mode 100644
>> index 000000000000..19a68bce1a7c
>> --- /dev/null
>> +++ b/drivers/leds/leds-spi-byte.c
>> @@ -0,0 +1,133 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2019 Christian Mauderer <oss@c-mauderer.de>
>> +
>> +/*
>> + * The driver can be used for controllers with a very simple SPI
>> protocol: Only
>> + * one byte between an off and a max value (defined by devicetree)
>> will be sent.
>> + */
>> +
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/mutex.h>
>> +#include <uapi/linux/uleds.h>
>> +
>> +struct spi_byte_led {
>> +    struct led_classdev    ldev;
>> +    struct spi_device    *spi;
>> +    char            name[LED_MAX_NAME_SIZE];
>> +    struct mutex        mutex;
>> +    u8            off_value;
>> +    u8            max_value;
>> +};
>> +
>> +static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
>> +                        enum led_brightness brightness)
>> +{
>> +    struct spi_byte_led *led = container_of(dev, struct spi_byte_led,
>> ldev);
>> +    u8 value;
>> +    int ret;
>> +
>> +    value = (u8) brightness + led->off_value;
>> +
>> +    mutex_lock(&led->mutex);
>> +    ret = spi_write(led->spi, &value, sizeof(value));
>> +    mutex_unlock(&led->mutex);
>> +
>> +    return ret;
>> +}
>> +
>> +static int spi_byte_probe(struct spi_device *spi)
>> +{
>> +    struct device *dev = &spi->dev;
>> +    struct device_node *child;
>> +    struct spi_byte_led *led;
>> +    int ret;
>> +    const char *default_name = "leds-spi-byte::";
>> +    const char *name;
>> +    u8 off_value;
>> +    u8 max_value;
>> +
>> +    if (!dev->of_node)
>> +        return -ENODEV;
>> +
>> +    if (of_get_child_count(dev->of_node) != 1) {
>> +        dev_err(dev, "Device must have exactly one LED sub-node.");
>> +        return -EINVAL;
>> +    }
>> +    child = of_get_next_child(dev->of_node, NULL);
>> +
>> +    ret = of_property_read_string(child, "label", &name);
>> +    if (ret != 0)
> 
> It is more customary to have "if (ret)" in such cases.
> Applies to all occurrences below.
> 
>> +        name = default_name;
>> +
>> +    ret = of_property_read_u8(child, "leds-spi-byte,off-value",
>> &off_value);
>> +    if (ret != 0) {
>> +        dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = of_property_read_u8(child, "leds-spi-byte,max-value",
>> &max_value);
>> +    if (ret != 0) {
>> +        dev_err(dev, "LED node needs a leds-spi-byte,max-value.");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (off_value >= max_value) {
>> +        dev_err(dev, "off-value has to be smaller than max-value.");
>> +        return -EINVAL;
>> +    }
>> +
>> +    led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>> +    if (!led)
>> +        return -ENOMEM;
>> +
>> +    led->spi = spi;
>> +    strlcpy(led->name, name, sizeof(led->name));
>> +    mutex_init(&led->mutex);
>> +    led->off_value = off_value;
>> +    led->max_value = max_value;
>> +    led->ldev.name = led->name;
>> +    led->ldev.brightness = LED_OFF;
> 
> This line is redundant - already zeroed by kzalloc.
> 
>> +    led->ldev.max_brightness = led->max_value - led->off_value;
>> +    led->ldev.brightness_set_blocking =
>> spi_byte_brightness_set_blocking;
>> +    ret = led_classdev_register(&spi->dev, &led->ldev);
> 
> Please use devm_led_classdev_register().
> 
>> +    if (ret >= 0)
>> +        spi_set_drvdata(spi, led);
> 
> This looks quite odd. Please shape it as below:
> 
>     if (ret)
>         return ret
> 
>     spi_set_drvdata(spi, led);
> 
>> +
>> +    return ret;
> 
>     s/ret/0/
> 
>> +}
>> +
>> +static int spi_byte_remove(struct spi_device *spi)
>> +{
>> +    struct spi_byte_led    *led = spi_get_drvdata(spi);
>> +
>> +    led_classdev_unregister(&led->ldev);
>> +    mutex_destroy(&led->mutex);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id spi_byte_dt_ids[] = {
>> +    { .compatible = "leds-spi-byte", },
>> +    {},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, spi_byte_dt_ids);
>> +
>> +static struct spi_driver spi_byte_driver = {
>> +    .probe        = spi_byte_probe,
>> +    .remove        = spi_byte_remove,
>> +    .driver = {
>> +        .name        = KBUILD_MODNAME,
>> +        .of_match_table    = spi_byte_dt_ids,
>> +    },
>> +};
>> +
>> +module_spi_driver(spi_byte_driver);
>> +
>> +MODULE_AUTHOR("Christian Mauderer <oss@c-mauderer.de>");
>> +MODULE_DESCRIPTION("single byte SPI LED driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("spi:leds-spi-byte");
>>
> 
