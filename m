Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11199CD36F
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2019 18:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfJFQM5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Oct 2019 12:12:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44196 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfJFQM5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Oct 2019 12:12:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id z9so12365354wrl.11;
        Sun, 06 Oct 2019 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H/RC8fa4phMiTl0fZ6cmGkMitGhuEjSxmNIynGMoGII=;
        b=KUWuuPp2q6hp6ZCD6PPSHIwXOhPsPUdYOpB/io4+BfYQPRK1OU0CTxwOjhtgzoCCHQ
         lNRm5yqZ9GFbRrP0CqZkyU7yJkILrZ96E7lxoQQmhRg8lcP0dXgs9BmFOkp5ok6OhQL6
         ZF/K0kRB9CMsQVrEqQtFEByXnRdpP8r3b6NznjFEr6/UuP4KOvf14oc+cXQRdJHhHwf+
         8AbvwXkcctuTu+3EOhLpqSvB4mWZCiPur4phcfnWeKgtWtyatsX5yT2KMdsRIfpn30Mp
         MbcMFEQJwhbKLpRHi5OmXA817VZT1Z2mbxSsGJt0LC5EI9YqBi8fhXOFCj0+A0WCeRNu
         hmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H/RC8fa4phMiTl0fZ6cmGkMitGhuEjSxmNIynGMoGII=;
        b=i9qFfau44eyXlCZMrNe/1+vAcVSKWuQMy1qeZMdLKnKJFAhNjfO2x503F+twFjiqvW
         RwbnzQT8EeC0T9OaN25/T+SEQ9gFf1rzzXDZifSHsh7K4DFZLU0u4lKkriNyl3RPPAMY
         IwpRObXMc6wNaYcGn+Mns0ZMESWqmcQSQrVgFzLWDZDsGq3vJH8TSqRlRMe8GCHoZ8VH
         /Gt63DJbtvIefyYgeErl/C2V7CU9mZ3VMAziCr6+xSit5dKBzb5pApypj+Ee6RpAEAYi
         oAa6yhtEO6sGtH2eEYeuBABxIj0yy0skPenY8j7UgVWU7rIHFFI9qG+b8wsyV12BvAbt
         xTFA==
X-Gm-Message-State: APjAAAWs4G00HIwnpgkrwWvFUwuoLdIFk2bYoGmvJz+7FfHM7SMljb15
        qIlmMsdh28JvVu+JOmHdWvbNdyM9
X-Google-Smtp-Source: APXvYqxzTEixg2QQjRnSf9oDMBLuEK1tB/oc0r+TPmSb3hodzECorfwoXw7unVye9q9uTtBX9sXszg==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr18056435wrv.338.1570378373483;
        Sun, 06 Oct 2019 09:12:53 -0700 (PDT)
Received: from [192.168.1.19] (bgw69.neoplus.adsl.tpnet.pl. [83.28.86.69])
        by smtp.gmail.com with ESMTPSA id t17sm27597759wrp.72.2019.10.06.09.12.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Oct 2019 09:12:52 -0700 (PDT)
Subject: Re: [PATCH v10 06/16] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191001145620.11123-1-dmurphy@ti.com>
 <20191001145620.11123-7-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d674fcb2-922e-7801-a3a1-ee86f571eb64@gmail.com>
Date:   Sun, 6 Oct 2019 18:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001145620.11123-7-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/1/19 4:56 PM, Dan Murphy wrote:
> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
> The difference in these parts are the number of
> LED outputs where the:
> 
> LP5036 can control 36 LEDs
> LP5030 can control 30 LEDs
> LP5024 can control 24 LEDs
> LP5018 can control 18 LEDs
> LP5012 can control 12 LEDs
> LP5009 can control 9 LEDs
> 
> The device has the ability to group LED output into control banks
> so that multiple LED banks can be controlled with the same mixing and
> brightness.  Inversely the LEDs can also be controlled independently.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig       |  11 +
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-lp50xx.c | 784 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 796 insertions(+)
>  create mode 100644 drivers/leds/leds-lp50xx.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index cfb1ebb6517f..84f60e35c5ee 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -363,6 +363,17 @@ config LEDS_LP3952
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called leds-lp3952.
>  
> +config LEDS_LP50XX
> +	tristate "LED Support for TI LP5036/30/24/18/12/9 LED driver chip"
> +	depends on LEDS_CLASS && REGMAP_I2C
> +	depends on LEDS_CLASS_MULTI_COLOR
> +	help
> +	  If you say yes here you get support for the Texas Instruments
> +	  LP5036, LP5030, LP5024, LP5018, LP5012 and LP5009 LED driver.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp50xx.
> +
>  config LEDS_LP55XX_COMMON
>  	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>  	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 841038cfe35b..7a208a0f7b84 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
>  obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
>  obj-$(CONFIG_LEDS_LP3944)		+= leds-lp3944.o
>  obj-$(CONFIG_LEDS_LP3952)		+= leds-lp3952.o
> +obj-$(CONFIG_LEDS_LP50XX)		+= leds-lp50xx.o
>  obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
>  obj-$(CONFIG_LEDS_LP5521)		+= leds-lp5521.o
>  obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
[...]
> +static int lp50xx_probe_dt(struct lp50xx *priv)
> +{
> +	u32 led_banks[LP5036_MAX_LED_MODULES];
> +	struct fwnode_handle *child = NULL;
> +	struct fwnode_handle *led_node = NULL;
> +	struct led_init_data init_data;
> +	struct lp50xx_led *led;
> +	int num_colors;
> +	u32 color_id;
> +	int led_number;
> +	size_t i = 0;
> +	int ret;
> +
> +	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
> +						   "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->enable_gpio)) {
> +		ret = PTR_ERR(priv->enable_gpio);
> +		dev_err(&priv->client->dev, "Failed to get enable gpio: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	priv->regulator = devm_regulator_get(&priv->client->dev, "vled");
> +	if (IS_ERR(priv->regulator))
> +		priv->regulator = NULL;
> +
> +	device_for_each_child_node(&priv->client->dev, child) {
> +		led = &priv->leds[i];
> +		if (fwnode_property_present(child, "ti,led-bank")) {
> +			ret = fwnode_property_read_u32_array(child,
> +							     "ti,led-bank",
> +							     NULL, 0);
> +			ret = fwnode_property_read_u32_array(child,
> +							     "ti,led-bank",
> +							     led_banks,
> +							     ret);

You could check if bank numbers are within a range.

> +			if (ret) {
> +				dev_err(&priv->client->dev,
> +					"led-bank property is missing\n");
> +				fwnode_handle_put(child);
> +				goto child_out;
> +			}
> +
> +			priv->num_of_banked_leds = ARRAY_SIZE(led_banks);
> +
> +			ret = lp50xx_set_banks(priv, led_banks);
> +			if (ret) {
> +				dev_err(&priv->client->dev,
> +					"Cannot setup banked LEDs\n");
> +				fwnode_handle_put(child);
> +				goto child_out;
> +			}
> +			led->ctrl_bank_enabled = 1;
> +
> +		} else {
> +			ret = fwnode_property_read_u32(child, "reg",
> +					       &led_number);

The same applies to the led_number.

> +			if (ret) {
> +				dev_err(&priv->client->dev,
> +					"led reg property missing\n");
> +				fwnode_handle_put(child);
> +				goto child_out;
> +			}
> +
> +			led->led_number = led_number;
> +		}

-- 
Best regards,
Jacek Anaszewski
