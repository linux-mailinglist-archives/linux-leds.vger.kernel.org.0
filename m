Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0010AD48D4
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 22:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfJKUEu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 16:04:50 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50238 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729055AbfJKUEu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 16:04:50 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so11590791wmg.0;
        Fri, 11 Oct 2019 13:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CCvC7hS+Qw2SK0rBUJRPdMFnrmvX7elCndWYCCyy89A=;
        b=ubNH10oaKFK/a1ZeGigoI+GZqbT+CtuZ4qUy+dgxurEZnnerAz65EnPCxnMWjYP0Ap
         iDIrmjjuYciNf/vLHYqJyqkLqfKRDAr5ErQAnzhEdeujXW6+hCI7xjb5+BQl22qRhdzc
         4XFH5AbAZXpAkG32lRL0PwlRpePRKsRONehGINAc11X3Z3KKVONP1czXdQ2SqLZsr+S1
         8YGFUSoRnEiFctInCswCS6EnYy73aG8HzEyl7d2hSLA/VEMj//Mb7HUc+9d15tTGYM/f
         6jvA8vZp3nrBd/JiEKpPtSFBmz7rMNtH8+zQvx+fr46QLzxJatfY3VqN8v97MtoxCfEs
         9Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CCvC7hS+Qw2SK0rBUJRPdMFnrmvX7elCndWYCCyy89A=;
        b=hXeHCqSTtFWqJbVxgwG6oEc6y6gsiuPq30xV1FIPCBCsdab9be73AAqFKsDFRz5til
         c+C/fZ+wlGhMppojD1Wg6k/tAu2Cg6+ih0CrG55b4h4WB/bdd76qME4+EcpuEK7hqzVa
         yhqPNfwvml4uA8uuQ9vA+wz6YfOnuLKlAZkKH4xvdxblJYDHNLY3lMkHHvC1dMuxSurt
         eyPz603diUFnQJCqTGyCnctHu6SdB21Y5V0sqatAydViTRHONF0vquDzPhkOXr/HFX3J
         aTODfFKjZ+hlxZrhyO76xJhHEWv48Tfqo6rm5ZuiHVbUq+7w+DHNzZiG3RUgISDXjy4r
         zLcw==
X-Gm-Message-State: APjAAAX3hxCdvyPqO0K22w5lGH6O68S9XGQB0lA4wKaAtfMjlN9IghgO
        jrVZabppubbu05WQuV8eVtBoQTC0
X-Google-Smtp-Source: APXvYqzZ2Ti7F39ZOKQLF7bWzqU3K84H62TM7X02l7f5piCk6bS9u7JC7XiRcbkL/CuOaA9mREwUhQ==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr4549491wmc.121.1570824286863;
        Fri, 11 Oct 2019 13:04:46 -0700 (PDT)
Received: from [192.168.1.19] (cjl71.neoplus.adsl.tpnet.pl. [83.31.61.71])
        by smtp.gmail.com with ESMTPSA id s12sm11414707wra.82.2019.10.11.13.04.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 13:04:46 -0700 (PDT)
Subject: Re: [PATCH v12 06/16] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191011130657.4713-1-dmurphy@ti.com>
 <20191011130657.4713-7-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2fe811df-d9d8-1608-6ad1-060b49df5b8f@gmail.com>
Date:   Fri, 11 Oct 2019 22:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011130657.4713-7-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/11/19 3:06 PM, Dan Murphy wrote:
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
>  drivers/leds/leds-lp50xx.c | 799 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 811 insertions(+)
>  create mode 100644 drivers/leds/leds-lp50xx.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a1ede89afc9e..fb614a6b9afa 100644
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
> +		fwnode_for_each_child_node(child, led_node) {
> +			ret = fwnode_property_read_u32(led_node, "color",
> +						       &color_id);
> +			if (ret)
> +				dev_err(&priv->client->dev,
> +				"Cannot read color\n");
> +
> +			set_bit(color_id, &led->mc_cdev.available_colors);
> +			num_colors++;
> +
> +		}
> +
> +		led->priv = priv;
> +		led->mc_cdev.num_leds = num_colors;
> +		led->mc_cdev.led_cdev = &led->led_dev;
> +		led->led_dev.brightness_set_blocking = lp50xx_brightness_set;
> +		led->led_dev.brightness_get = lp50xx_brightness_get;
> +		ret = led_classdev_multicolor_register_ext(&priv->client->dev,
> +						       &led->mc_cdev,
> +						       &init_data);

s/led_classdev/devm_led_classdev/

> +		if (ret) {
> +			dev_err(&priv->client->dev, "led register err: %d\n",
> +				ret);
> +			fwnode_handle_put(child);
> +			goto child_out;
> +		}
> +		i++;
> +	}
> +
> +child_out:
> +	return ret;
> +}
> +


-- 
Best regards,
Jacek Anaszewski
