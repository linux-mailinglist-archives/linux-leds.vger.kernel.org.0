Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C22E6102BB6
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 19:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKSSd5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 13:33:57 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43648 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfKSSd4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 13:33:56 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJIXgds037810;
        Tue, 19 Nov 2019 12:33:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574188422;
        bh=8pK3SXLXjYCxY82v7l4ZX3F1pn7se04Pm/vVlaxoCso=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=V6SuhijJgP4JlwdJ1DVfiviwwoS40GyKCK0Wn/5rQWdlzTx/wGOVlGB/NGnHJqcOQ
         07b6VGs8ChQo3Lc3xww+nFTehMSQK7bq23Q8s9a3iA0aKOWTPn+ChogmVCHRHpCqwt
         Bwn3TkaYNHbkn0C5rhb43DWypnoQcN7f4b5myp2Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJIXgH4103677
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 12:33:42 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 12:33:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 12:33:42 -0600
Received: from [10.250.33.226] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJIXfXh105615;
        Tue, 19 Nov 2019 12:33:42 -0600
Subject: Re: [PATCH v2 3/4] leds: tps6105x: add driver for mfd chip led mode
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20191119154611.29625-1-TheSven73@gmail.com>
 <20191119154611.29625-4-TheSven73@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <23217b5b-90f4-748a-c008-9ae7ef82c6dd@ti.com>
Date:   Tue, 19 Nov 2019 12:32:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119154611.29625-4-TheSven73@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sven

On 11/19/19 9:46 AM, Sven Van Asbroeck wrote:
> This driver adds support for the led operational mode of the
> tps6105x mfd device.
How many LEDs does this device support?
>
> Example usage, devicetree:
>
> i2c0 {
> 	tps61052@33 {
> 		compatible = "ti,tps61052";
> 		reg = <0x33>;
>
> 		led {
> 			label = "tps-led";
> 		};
> 	};
> };
>
> Example usage, platform data in machine layer:
>
>   #include <linux/mfd/tps6105x.h>
>
>   struct tps6105x_platform_data pdata = {
>           .mode = TPS6105X_MODE_TORCH,
>           .led_label = "tps-led",
>   };
>
> Tree: next-20191118
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>   drivers/leds/Kconfig         | 10 +++++
>   drivers/leds/Makefile        |  1 +
>   drivers/leds/leds-tps6105x.c | 87 ++++++++++++++++++++++++++++++++++++
>   include/linux/mfd/tps6105x.h |  1 +
>   4 files changed, 99 insertions(+)
>   create mode 100644 drivers/leds/leds-tps6105x.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4b68520ac251..7c7ceaa824a2 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -836,6 +836,16 @@ config LEDS_LM36274
>   	  Say Y to enable the LM36274 LED driver for TI LMU devices.
>   	  This supports the LED device LM36274.
>   
> +config LEDS_TPS6105X
> +	tristate "LED support for TI TPS6105X"
> +	depends on LEDS_CLASS
> +	depends on TPS6105X
> +	default y if TPS6105X
> +	help
> +	  This driver supports TPS61050/TPS61052 led chips.
> +	  It is a single boost converter primarily for white LEDs and
> +	  audio amplifiers.
> +
>   comment "LED Triggers"
>   source "drivers/leds/trigger/Kconfig"
>   
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2da39e896ce8..d7e1107753fb 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
>   obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>   obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
>   obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
> +obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
>   
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-tps6105x.c b/drivers/leds/leds-tps6105x.c
> new file mode 100644
> index 000000000000..87dbe4846df6
> --- /dev/null
> +++ b/drivers/leds/leds-tps6105x.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/tps6105x.h>
> +#include <linux/regmap.h>
> +
> +struct tps6105x_priv {
> +	struct regmap *regmap;
> +	struct led_classdev cdev;
> +};
> +
> +static int tps6105x_brightness_set(struct led_classdev *cdev,
> +				  enum led_brightness brightness)
> +{
> +	struct tps6105x_priv *priv = container_of(cdev, struct tps6105x_priv,
> +							cdev);
> +
> +	return regmap_update_bits(priv->regmap, TPS6105X_REG_0,
> +		TPS6105X_REG0_TORCHC_MASK,
> +		brightness << TPS6105X_REG0_TORCHC_SHIFT);
> +}
> +
> +static const char *label_from_dt(struct device *dev)
> +{
> +	struct device_node *led =
> +		of_get_child_by_name(dev->parent->of_node, "led");
Prefer device_* calls as opposed to of_* calls.
> +	const char *label;
> +
> +	if (!led) {
> +		dev_err(dev, "led node not found");
> +		return NULL;
> +	}
> +	if (of_property_read_string(led, "label", &label))
same as above
> +		label = NULL;
> +	of_node_put(led);
> +
> +	return label;
> +}
> +
> +static int tps6105x_led_probe(struct platform_device *pdev)
> +{
> +	struct tps6105x *tps6105x = dev_get_platdata(&pdev->dev);
> +	struct tps6105x_platform_data *pdata = tps6105x->pdata;
> +	struct tps6105x_priv *priv;
> +	const char *label;
> +	int ret;
> +
> +	/* This instance is not set for torch mode so bail out */
> +	if (pdata->mode != TPS6105X_MODE_TORCH) {
> +		dev_info(&pdev->dev,
> +			"chip not in torch mode, exit probe");
> +		return -EINVAL;
> +	}
> +
> +	label = pdata->led_label ?: label_from_dt(&pdev->dev);

Since this is a new driver do we really have to continue to use the 
pdata for the init

data?  Can't we just get the label from the DT node now like other drivers?

Dan


