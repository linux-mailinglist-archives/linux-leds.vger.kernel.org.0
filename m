Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0731316B024
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2020 20:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgBXTRJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Feb 2020 14:17:09 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38310 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgBXTRI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Feb 2020 14:17:08 -0500
Received: by mail-wm1-f66.google.com with SMTP id a9so504268wmj.3;
        Mon, 24 Feb 2020 11:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3sjrxqELhrwy8WgDXBV+GtpKg4K8/rsGrMchFYXjGWE=;
        b=tmAuv/68pB2FNi75lGd2A6lZ9BKsvou1ot8j8TicWriKiF+FVBaxtHkebW24BdutYy
         lXqMr/FOXgMCKXj40gh+KAGcyldBG40JV6I8O+tGG+5ZK7pCIPNgPRiywAoRcVoIslLq
         dls9mBhYwEve0LHjsxUmMdM0kKEvr7SbuYC1vBC85xxzkovCZw0tGHfmx1GfZ6qL+KAP
         Shp7zR3SMVR1bzLWA1dssbIv5knSvP57ceGj2NqdFNzaM6sFn0QUlvqg/t5YYIiGydAC
         hXuYliWuDdpssvzJyDXbOEz81nylssV2w4OPNomVGSg5YyOHevscXLC3L3QvM52QRaRY
         QoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3sjrxqELhrwy8WgDXBV+GtpKg4K8/rsGrMchFYXjGWE=;
        b=jBV5dOiZ/6Sr7okAYOhTdWtsRjAg+BZGYqJsV9X1DnGih7pBGvF1w381oNNu9BCL6H
         cXsTE0c85lALjSjf7TiWjxC6D4FyTgLhOXNbodlZe8P+AOYhpw2iiUGBW2s8IIo3LMk2
         LoL+O64+9ne/hj6RwbkUx+B3iFQbDN7PQ5OtAooysnF2W882EI244MLs1vP0SoME1S5I
         mTKDVS934z2NHN7KClSs826kqaLEjIqWIFIIeOHJExp8NTqnaJHy808aEDh+E0TGWTVT
         4ZYyiIoB6jpyCLYUyreKWjTdJvvJkUWqiK8mH6fT998vwlRZEKGJPZK82HzdiGj0uCbz
         XbqQ==
X-Gm-Message-State: APjAAAUv3/4WCc+RuqEhL1VUJfcYU6Li1UsolkMtafn2fQcDkBubUR1J
        3LvhrV55iNMJ3pS2ZaA5uukElkSA
X-Google-Smtp-Source: APXvYqxluC8k01P82sC8wEOfLJhlmbwZOHd/mG2w52h7DNHbisaLr1BEeIoy4q1USKGnRPYlAsvCBQ==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr483182wmj.27.1582571825201;
        Mon, 24 Feb 2020 11:17:05 -0800 (PST)
Received: from [192.168.1.23] (affg206.neoplus.adsl.tpnet.pl. [95.49.136.206])
        by smtp.gmail.com with ESMTPSA id h128sm524987wmh.33.2020.02.24.11.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 11:17:04 -0800 (PST)
Subject: Re: [PATCH v5] leds: add SGI IP30 led support
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20200224111733.10320-1-tbogendoerfer@suse.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0a3146ff-95c5-9f57-7c7c-0abbf13e2da4@gmail.com>
Date:   Mon, 24 Feb 2020 20:17:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224111733.10320-1-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Thomas,

Thank you for the update.

On 2/24/20 12:17 PM, Thomas Bogendoerfer wrote:
> This patch implemenets a driver to support the front panel LEDs of
> SGI Octane (IP30) workstations.
> 
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
> Changes in v5:
>   - use defines for led enumaration
>   - name red led fault and white led system
> 
> Changes in v4:
>   - simplified ip30led_set by using gated value from led framework
> 
> Changes in v3:
>   - rebased to 5.6-rc2
> 
> Changes in v2:
>   - use led names conforming to include/dt-bindings/leds/common.h
>   - read LED state from firmware
>   - leave setting up to user
> 
>  drivers/leds/Kconfig     | 11 +++++
>  drivers/leds/Makefile    |  1 +
>  drivers/leds/leds-ip30.c | 86 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/leds/leds-ip30.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d82f1dea3711..c664d84e1667 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -846,6 +846,17 @@ config LEDS_TPS6105X
>  	  It is a single boost converter primarily for white LEDs and
>  	  audio amplifiers.
>  
> +config LEDS_IP30
> +	tristate "LED support for SGI Octane machines"
> +	depends on LEDS_CLASS
> +	depends on SGI_MFD_IOC3
> +	help
> +	  This option enables support for the Red and White LEDs of
> +	  SGI Octane machines.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-ip30.
> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>  
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d7e1107753fb..46bd611a03a9 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>  obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
>  obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
>  obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
> +obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
>  
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-ip30.c b/drivers/leds/leds-ip30.c
> new file mode 100644
> index 000000000000..e95ea786a43e
> --- /dev/null
> +++ b/drivers/leds/leds-ip30.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED Driver for SGI Octane machines
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/leds.h>
> +
> +#define IP30_LED_SYSTEM	0
> +#define IP30_LED_FAULT	1
> +
> +struct ip30_led {
> +	struct led_classdev cdev;
> +	u32 __iomem *reg;
> +};
> +
> +static void ip30led_set(struct led_classdev *led_cdev,
> +			enum led_brightness value)
> +{
> +	struct ip30_led *led = container_of(led_cdev, struct ip30_led, cdev);
> +
> +	writel(value, led->reg);
> +}
> +
> +static int ip30led_create(struct platform_device *pdev, int num)
> +{
> +	struct resource *res;
> +	struct ip30_led *data;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, num);
> +	if (!res)
> +		return -EBUSY;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->reg = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(data->reg))
> +		return PTR_ERR(data->reg);
> +
> +
> +	switch (num) {
> +	case IP30_LED_SYSTEM:
> +		data->cdev.name = "white:system";
> +		break;
> +	case IP30_LED_FAULT:
> +		data->cdev.name = "red:fault";
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	data->cdev.brightness = readl(data->reg);
> +	data->cdev.max_brightness = 1;
> +	data->cdev.brightness_set = ip30led_set;
> +
> +	return devm_led_classdev_register(&pdev->dev, &data->cdev);
> +}
> +
> +static int ip30led_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = ip30led_create(pdev, IP30_LED_SYSTEM);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ip30led_create(pdev, IP30_LED_FAULT);
> +}
> +
> +static struct platform_driver ip30led_driver = {
> +	.probe		= ip30led_probe,
> +	.driver		= {
> +		.name		= "ip30-leds",
> +	},
> +};
> +
> +module_platform_driver(ip30led_driver);
> +
> +MODULE_AUTHOR("Thomas Bogendoerfer <tbogendoerfer@suse.de>");
> +MODULE_DESCRIPTION("SGI Octane LED driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:ip30-leds");

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
