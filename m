Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2D71045D0
	for <lists+linux-leds@lfdr.de>; Wed, 20 Nov 2019 22:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfKTVdY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Nov 2019 16:33:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55712 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKTVdY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Nov 2019 16:33:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so1306560wmb.5;
        Wed, 20 Nov 2019 13:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3bT71mT//0rmqMbVopSGMz2TlECXTXdWEUiVMNeeKkI=;
        b=nhjgZy8+XMtoUaByV/hUEv2XqpyElWdm2pggwwEBezb65qi9ocEC7QI+05Yu87a8Xr
         g9MaMeQlyeGO548fNd5ytXlGCaM9/BBscq2zGD5lKnD3Z7L1jSwEd1K+IJ3iqHHzk2L6
         wVBaoGtcGB8L6eRJuYzFQlMg9jCyZsw7hhV6GAIOrtzlpFZdIHvF8vILszjDreGorxNt
         mpEm7rC/YlH5TL4tuDc9m+6xV+/qDkwINDoPflhwkJtrmBWLnhwMTMyOaPTn7CkbLBrE
         Z/5N7y6NVEFszGhXFRWJMD9zezXZmbJGWYgYrHx2BxEUUpQ459uLd0zwMXinmyL5Xpn4
         YD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3bT71mT//0rmqMbVopSGMz2TlECXTXdWEUiVMNeeKkI=;
        b=JZAHlp05+xUA5LqnKagrZFZIWC39RBLCEhB8KPeEX4VO88JtGQ9oLtXFbtnTDCcusk
         5YoDlp6lExqlP1t1zIY6BNBGpG6zVYX6kKwOIWXUzfRl3yVbZcBbqkM3BKmvXf9Zy9mx
         g06YhRiXtFbvVViJdo72K6/igG1gPgQEdmcbY3sAQRuBKmaR9rByhWO2NSux4NXv/2il
         yX2tmikxz0m8FNS1sfRhDcFQIdqaoXj+FP96OAEm0MlHO+PeXz4OWWXHOgy91WTXEEQd
         DK06+xO2P1pcHxc8BD5MJMMxyhKptckLomd8J+uIO56BzUz3rRcUGJk45nf2Zh011prx
         M0CA==
X-Gm-Message-State: APjAAAU1hSvj37404a7oGgsmeFXUgLvKv4Ao9VhJYz1H91wlfywq7B8Z
        Qf0H4zfZYwMJq8pwX6NNFUyVfNwj
X-Google-Smtp-Source: APXvYqwcYc3jcJro3cIhkNfEi2pT/jbla3JGN5TqCAUjH4RMdjYuGKbyj+D34aRb7btLgKpvLjjIow==
X-Received: by 2002:a1c:2d17:: with SMTP id t23mr5718195wmt.59.1574285598559;
        Wed, 20 Nov 2019 13:33:18 -0800 (PST)
Received: from [192.168.1.19] (civ146.neoplus.adsl.tpnet.pl. [83.31.45.146])
        by smtp.gmail.com with ESMTPSA id x8sm713218wrm.7.2019.11.20.13.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 13:33:17 -0800 (PST)
Subject: Re: [PATCH v3 2/3] leds: tps6105x: add driver for mfd chip led mode
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20191120144401.30452-1-TheSven73@gmail.com>
 <20191120144401.30452-3-TheSven73@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <07b85f68-3668-e354-3379-13d32e84466f@gmail.com>
Date:   Wed, 20 Nov 2019 22:33:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120144401.30452-3-TheSven73@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sven,

On 11/20/19 3:44 PM, Sven Van Asbroeck wrote:
> This driver adds support for the led operational mode of the
> tps6105x mfd device.
> 
> Example usage, devicetree:
> 
> i2c0 {
> 	tps61052@33 {
> 		compatible = "ti,tps61052";
> 		reg = <0x33>;
> 
> 		led {
> 		};
> 	};
> };

This is covered in DT bindings, it is redundant in the commit message.

> 
> Tree: next-20191118
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>  drivers/leds/Kconfig         | 10 ++++++
>  drivers/leds/Makefile        |  1 +
>  drivers/leds/leds-tps6105x.c | 67 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 drivers/leds/leds-tps6105x.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4b68520ac251..7c7ceaa824a2 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -836,6 +836,16 @@ config LEDS_LM36274
>  	  Say Y to enable the LM36274 LED driver for TI LMU devices.
>  	  This supports the LED device LM36274.
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
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>  
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2da39e896ce8..d7e1107753fb 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
>  obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>  obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
>  obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
> +obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
>  
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-tps6105x.c b/drivers/leds/leds-tps6105x.c
> new file mode 100644
> index 000000000000..44325251b3d6
> --- /dev/null
> +++ b/drivers/leds/leds-tps6105x.c
> @@ -0,0 +1,67 @@
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
> +static int tps6105x_led_probe(struct platform_device *pdev)
> +{
> +	struct tps6105x *tps6105x = dev_get_platdata(&pdev->dev);
> +	struct tps6105x_platform_data *pdata = tps6105x->pdata;
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
> +	priv->regmap = tps6105x->regmap;
> +	priv->cdev.name = "tps6105x::torch";

Please remove above line.

> +	priv->cdev.brightness_set_blocking = tps6105x_brightness_set;
> +	priv->cdev.max_brightness = 7;
> +
> +	ret = regmap_update_bits(tps6105x->regmap, TPS6105X_REG_0,
> +		TPS6105X_REG0_MODE_MASK | TPS6105X_REG0_TORCHC_MASK,
> +		TPS6105X_REG0_MODE_TORCH << TPS6105X_REG0_MODE_SHIFT);
> +	if (ret)
> +		return ret;
>

And use new LED registration API like below:

struct led_init_data init_data = {
	.devicename = "tps6105x",
	.default_label = ":torch" };

return devm_led_classdev_register_ext(&pdev->dev, &priv->cdev, &init_data);

This way you will make the driver capable of using LED core mechanism
for composing LED names, which will allow to use function and color
properties in DT, and automatically override the defaults from the
driver. If both properties are missing in DT, then you will get the LED
named tps6105x::torch.

> +	return devm_led_classdev_register(&pdev->dev, &priv->cdev);
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
> 

-- 
Best regards,
Jacek Anaszewski
