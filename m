Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8682116EBD
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 15:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbfLIOM3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 09:12:29 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53868 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbfLIOM3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2019 09:12:29 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9ECInv038967;
        Mon, 9 Dec 2019 08:12:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575900738;
        bh=5OoN0aAf1+m+H15mUeLfOY0iq50ktGieToH8IRJysz8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Mxu8JAV0s847KTsyxqRTL6JvrMgBuJuCJnkkWXp7LexJw9xgIMYhN/wHdY5EXQbzf
         Q2Gs9wTv9GBvFV3lMTw1u4GqZDnJEVwRifrwvxM2pvS00MYyzWcwC3DzzgQiZib/Z0
         BFPCLhMT4wiHACuf/mXtRG8IjGkADQ3FeucfzmVI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9ECI1H029344
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Dec 2019 08:12:18 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 08:12:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 08:12:17 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9ECHE2021529;
        Mon, 9 Dec 2019 08:12:17 -0600
Subject: Re: [PATCH v5 1/2] leds: tps6105x: add driver for mfd chip led mode
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20191209140234.6558-1-TheSven73@gmail.com>
 <20191209140234.6558-2-TheSven73@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <81e05dad-8582-7673-7ff3-658d7f08ed6a@ti.com>
Date:   Mon, 9 Dec 2019 08:10:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209140234.6558-2-TheSven73@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sven

On 12/9/19 8:02 AM, Sven Van Asbroeck wrote:
> This driver adds support for the led operational mode of the
s/led/LED
> tps6105x mfd device.
s/mfd/MFD
>
> Tree: next-20191118
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>   drivers/leds/Kconfig         | 10 +++++
>   drivers/leds/Makefile        |  1 +
>   drivers/leds/leds-tps6105x.c | 83 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 94 insertions(+)
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
s/led/LED
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
> index 000000000000..ea2afaa3e3f0
> --- /dev/null
> +++ b/drivers/leds/leds-tps6105x.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +

Do you need a copyright?


> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/tps6105x.h>
> +#include <linux/regmap.h>
> +
> +struct tps6105x_priv {
> +	struct regmap *regmap;
> +	struct led_classdev cdev;
> +	struct fwnode_handle *fwnode;
> +};
> +
> +static void tps6105x_handle_put(void *data)
> +{
> +	struct tps6105x_priv *priv = data;
> +
> +	fwnode_handle_put(priv->fwnode);
> +}
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
> +static int tps6105x_led_probe(struct platform_device *pdev)
> +{
> +	struct tps6105x *tps6105x = dev_get_platdata(&pdev->dev);
> +	struct tps6105x_platform_data *pdata = tps6105x->pdata;
> +	struct led_init_data init_data = { };
> +	struct tps6105x_priv *priv;
> +	int ret;
> +
> +	/* This instance is not set for torch mode so bail out */
> +	if (pdata->mode != TPS6105X_MODE_TORCH) {
> +		dev_info(&pdev->dev,
> +			"chip not in torch mode, exit probe");
> +		return -EINVAL;
> +	}
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->fwnode = device_get_next_child_node(pdev->dev.parent, NULL);

Probably need to check for NULL on the return


> +	ret = devm_add_action_or_reset(&pdev->dev, tps6105x_handle_put, priv);
> +	if (ret)
> +		return ret;
> +	priv->regmap = tps6105x->regmap;
> +	priv->cdev.brightness_set_blocking = tps6105x_brightness_set;
> +	priv->cdev.max_brightness = 7;
> +	init_data.devicename = "tps6105x";
> +	init_data.default_label = ":torch";
> +	init_data.fwnode = priv->fwnode;
> +
> +	ret = regmap_update_bits(tps6105x->regmap, TPS6105X_REG_0,
> +		TPS6105X_REG0_MODE_MASK | TPS6105X_REG0_TORCHC_MASK,
> +		TPS6105X_REG0_MODE_TORCH << TPS6105X_REG0_MODE_SHIFT);
Checkpatch should have warned about alignment here
> +	if (ret)
> +		return ret;
> +
> +	return devm_led_classdev_register_ext(&pdev->dev, &priv->cdev,
> +					      &init_data);
> +}
> +
> +static struct platform_driver led_driver = {
> +	.probe = tps6105x_led_probe,
> +	.driver = {
> +		.name = "tps6105x-leds",
> +	},
> +};
> +
> +module_platform_driver(led_driver);
> +
> +MODULE_DESCRIPTION("TPS6105x led driver");
> +MODULE_AUTHOR("Sven Van Asbroeck <TheSven73@gmail.com>");
> +MODULE_LICENSE("GPL v2");
