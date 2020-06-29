Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7CAD20E6AF
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2020 00:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404404AbgF2Vtj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jun 2020 17:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgF2Vtf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jun 2020 17:49:35 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA82C061755
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2020 14:49:35 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id y10so18396715eje.1
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2020 14:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w1Klfpl4ITwbcYFBRqjw00qWLUfcYfSjju67tKGCLUw=;
        b=exs8w8eF3sb40i/QbsZ6PK2AyGcz75aYTskbX6G65/TLYgSJxC/j5c2CyLB2ooQVyN
         x7G3RiMYxeNLOZB3YDe+gb4Ame0Hn9/75+6gJA5oO8rx+yuRSguRjN6yDRR4bBzkXIdl
         91da4OslVsze5oxkzU6lv32Zn18X4+p6GgA3YWoxqJ6pqmxI/esRlSSPyanynA52WORX
         bCdlhGTdtaOX39wvvH/3Nm1HxO1smjOGvjBTEYJAayCKei1kP3BcLgTJ889SdE/1NbXH
         hpfYx5fPrhieAYE3sddqXugYPtmLPfIuyAeHKmrCOxqcOPT9s/TN3AxEqoOSiWJQk31g
         rJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w1Klfpl4ITwbcYFBRqjw00qWLUfcYfSjju67tKGCLUw=;
        b=Yj5xbyRYmqKdUq3s4wc51BcpT1xagofs/cwc6mxwBmkzrh1hRHXXUhDl4nQPFlYmEw
         /a7Nrhmv6zbSWVbvFA44BIIsBfK4FlggTaR86YOiDwdvEUqbFSFhBb+Py0sk+HbG1H05
         eHRkODoPx0ElNluwp0cSAPa5mhHg0xPWWJtepGLNMPca5aXg2EbYw57b7bWpNp4CeUaY
         EiUzOkvrqKXbSikRJjS5NMPfuT5JwiKsUQmYEb/4oOTMMfLBRhnl2yme5k0/7PgiEJk9
         xt/1SqaQnEe3xOL4lqOXpsJD8J/MDFiiGIhYGJQvk3niPgNfWRpQKUHC1vL1FEfMF1nC
         gUuA==
X-Gm-Message-State: AOAM530w86PwSnZtVB1j1rWf23MZLRappdsf6++JdupfKj1nZTjNdvIB
        nKIoKPkVCGcoXeUAaOCoadg=
X-Google-Smtp-Source: ABdhPJweGUq1YKF3rLNkfuJWFuaI2M1tY0Z4z0qYF4YkAsBsFLhhsdVtIZwsz9Q4/u9qkaaETyazSQ==
X-Received: by 2002:a17:906:7d86:: with SMTP id v6mr15379928ejo.542.1593467374360;
        Mon, 29 Jun 2020 14:49:34 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:5dd7:138d:96d0:690e? ([2a01:110f:b59:fd00:5dd7:138d:96d0:690e])
        by smtp.gmail.com with ESMTPSA id w8sm546441ejb.10.2020.06.29.14.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 14:49:33 -0700 (PDT)
Subject: Re: [PATCH] leds: s3c24xx: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20200627001015.427376-1-linus.walleij@linaro.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d0937cb8-69c8-8442-33b3-6f44bcb79f99@gmail.com>
Date:   Mon, 29 Jun 2020 23:49:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200627001015.427376-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

Thank you for the patch.

Besides what Krzysztof already pointed out, I have some
other nits below.

On 6/27/20 2:10 AM, Linus Walleij wrote:
> This converts the s3c24xx LED driver to use GPIO descriptors
> and also modify all board files to account for these changes
> by registering the appropriate GPIO tables for each board.
> 
> The driver was using a custom flag to indicate open drain
> (tristate) but this can be handled by standard descriptor
> machine tables.
> 
> The driver was setting non-pull-up for the pin using the custom
> S3C24xx GPIO API, but this is a custom pin control system used
> by the S3C24xx and no generic GPIO function, so this has simply
> been pushed back into the respective board files.
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   arch/arm/mach-s3c24xx/common-smdk.c        | 67 +++++++++++++++-------
>   arch/arm/mach-s3c24xx/mach-mini2440.c      | 63 +++++++++++++++++---
>   arch/arm/mach-s3c24xx/mach-n30.c           | 54 +++++++++++++++--
>   arch/arm/mach-s3c24xx/mach-qt2410.c        | 12 +++-
>   arch/arm/mach-s3c24xx/mach-vr1000.c        | 38 +++++++++++-
>   drivers/leds/leds-s3c24xx.c                | 37 +++---------
>   include/linux/platform_data/leds-s3c24xx.h |  6 --
>   7 files changed, 200 insertions(+), 77 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
> index 58e30cad386c..10fc804c4ec5 100644
> --- a/arch/arm/mach-s3c24xx/common-smdk.c
> +++ b/arch/arm/mach-s3c24xx/common-smdk.c
> @@ -14,6 +14,7 @@
>   #include <linux/timer.h>
>   #include <linux/init.h>
>   #include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
>   #include <linux/device.h>
>   #include <linux/platform_device.h>
>   
> @@ -44,29 +45,53 @@
>   
>   /* LED devices */
>   
> +static struct gpiod_lookup_table smdk_led4_gpio_table = {
> +	.dev_id = "s3c24xx_led.0",
> +	.table = {
> +		GPIO_LOOKUP("GPF", 4, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table smdk_led5_gpio_table = {
> +	.dev_id = "s3c24xx_led.1",
> +	.table = {
> +		GPIO_LOOKUP("GPF", 6, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table smdk_led6_gpio_table = {
> +	.dev_id = "s3c24xx_led.2",
> +	.table = {
> +		GPIO_LOOKUP("GPF", 5, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table smdk_led7_gpio_table = {
> +	.dev_id = "s3c24xx_led.3",
> +	.table = {
> +		GPIO_LOOKUP("GPF", 7, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
>   static struct s3c24xx_led_platdata smdk_pdata_led4 = {
> -	.gpio		= S3C2410_GPF(4),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.name		= "led4",
>   	.def_trigger	= "timer",
>   };
>   
>   static struct s3c24xx_led_platdata smdk_pdata_led5 = {
> -	.gpio		= S3C2410_GPF(5),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.name		= "led5",
>   	.def_trigger	= "nand-disk",
>   };
>   
>   static struct s3c24xx_led_platdata smdk_pdata_led6 = {
> -	.gpio		= S3C2410_GPF(6),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.name		= "led6",
>   };
>   
>   static struct s3c24xx_led_platdata smdk_pdata_led7 = {
> -	.gpio		= S3C2410_GPF(7),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.name		= "led7",
>   };
>   
> @@ -179,27 +204,25 @@ static struct platform_device __initdata *smdk_devs[] = {
>   	&smdk_led7,
>   };
>   
> -static const struct gpio smdk_led_gpios[] = {
> -	{ S3C2410_GPF(4), GPIOF_OUT_INIT_HIGH, NULL },
> -	{ S3C2410_GPF(5), GPIOF_OUT_INIT_HIGH, NULL },
> -	{ S3C2410_GPF(6), GPIOF_OUT_INIT_HIGH, NULL },
> -	{ S3C2410_GPF(7), GPIOF_OUT_INIT_HIGH, NULL },
> -};
> -
>   void __init smdk_machine_init(void)
>   {
> -	/* Configure the LEDs (even if we have no LED support)*/
> -
> -	int ret = gpio_request_array(smdk_led_gpios,
> -				     ARRAY_SIZE(smdk_led_gpios));
> -	if (!WARN_ON(ret < 0))
> -		gpio_free_array(smdk_led_gpios, ARRAY_SIZE(smdk_led_gpios));
> -
>   	if (machine_is_smdk2443())
>   		smdk_nand_info.twrph0 = 50;
>   
>   	s3c_nand_set_platdata(&smdk_nand_info);
>   
> +	/* Disable pull-up on the LED lines */
> +	s3c_gpio_setpull(S3C2410_GPF(4), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPF(5), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPF(6), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPF(7), S3C_GPIO_PULL_NONE);
> +
> +	/* Add lookups for the lines */
> +	gpiod_add_lookup_table(&smdk_led4_gpio_table);
> +	gpiod_add_lookup_table(&smdk_led5_gpio_table);
> +	gpiod_add_lookup_table(&smdk_led6_gpio_table);
> +	gpiod_add_lookup_table(&smdk_led7_gpio_table);
> +
>   	platform_add_devices(smdk_devs, ARRAY_SIZE(smdk_devs));
>   
>   	s3c_pm_init();
> diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
> index 9035f868fb34..11add63b79c2 100644
> --- a/arch/arm/mach-s3c24xx/mach-mini2440.c
> +++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
> @@ -402,37 +402,68 @@ static struct platform_device mini2440_button_device = {
>   
>   /* LEDS */
>   
> +static struct gpiod_lookup_table mini2440_led1_gpio_table = {
> +	.dev_id = "s3c24xx_led.1",
> +	.table = {
> +		GPIO_LOOKUP("GPB", 5, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table mini2440_led2_gpio_table = {
> +	.dev_id = "s3c24xx_led.2",
> +	.table = {
> +		GPIO_LOOKUP("GPB", 6, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table mini2440_led3_gpio_table = {
> +	.dev_id = "s3c24xx_led.3",
> +	.table = {
> +		GPIO_LOOKUP("GPB", 7, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table mini2440_led4_gpio_table = {
> +	.dev_id = "s3c24xx_led.4",
> +	.table = {
> +		GPIO_LOOKUP("GPB", 8, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table mini2440_led5_gpio_table = {

Why not backlight for consistency with pdata?

s/led5/led_backlight/

> +	.dev_id = "s3c24xx_led.5",

s/led.5/led_backlight/

> +	.table = {
> +		GPIO_LOOKUP("GPG", 4, NULL, GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
>   static struct s3c24xx_led_platdata mini2440_led1_pdata = {
>   	.name		= "led1",
> -	.gpio		= S3C2410_GPB(5),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.def_trigger	= "heartbeat",
>   };
>   
>   static struct s3c24xx_led_platdata mini2440_led2_pdata = {
>   	.name		= "led2",
> -	.gpio		= S3C2410_GPB(6),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.def_trigger	= "nand-disk",
>   };
>   
>   static struct s3c24xx_led_platdata mini2440_led3_pdata = {
>   	.name		= "led3",
> -	.gpio		= S3C2410_GPB(7),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.def_trigger	= "mmc0",
>   };
>   
>   static struct s3c24xx_led_platdata mini2440_led4_pdata = {
>   	.name		= "led4",
> -	.gpio		= S3C2410_GPB(8),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.def_trigger	= "",
>   };
>   
>   static struct s3c24xx_led_platdata mini2440_led_backlight_pdata = {
>   	.name		= "backlight",
> -	.gpio		= S3C2410_GPG(4),
>   	.def_trigger	= "backlight",
>   };
>   
> @@ -714,6 +745,20 @@ static void __init mini2440_init(void)
>   	i2c_register_board_info(0, mini2440_i2c_devs,
>   				ARRAY_SIZE(mini2440_i2c_devs));
>   
> +	/* Disable pull-up on the LED lines */
> +	s3c_gpio_setpull(S3C2410_GPB(5), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPB(6), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPB(7), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPB(8), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPG(4), S3C_GPIO_PULL_NONE);
> +
> +	/* Add lookups for the lines */
> +	gpiod_add_lookup_table(&mini2440_led1_gpio_table);
> +	gpiod_add_lookup_table(&mini2440_led2_gpio_table);
> +	gpiod_add_lookup_table(&mini2440_led3_gpio_table);
> +	gpiod_add_lookup_table(&mini2440_led4_gpio_table);
> +	gpiod_add_lookup_table(&mini2440_led5_gpio_table);
> +
>   	platform_add_devices(mini2440_devices, ARRAY_SIZE(mini2440_devices));
>   
>   	if (features.count)	/* the optional features */
> diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
> index d856f23939af..58a64f6d5fd0 100644
> --- a/arch/arm/mach-s3c24xx/mach-n30.c
> +++ b/arch/arm/mach-s3c24xx/mach-n30.c
> @@ -45,6 +45,7 @@
>   
>   #include <plat/cpu.h>
>   #include <plat/devs.h>
> +#include <plat/gpio-cfg.h>
>   #include <linux/platform_data/mmc-s3cmci.h>
>   #include <linux/platform_data/usb-s3c2410_udc.h>
>   #include <plat/samsung-time.h>
> @@ -246,17 +247,33 @@ static struct platform_device n35_button_device = {
>   };
>   
>   /* This is the bluetooth LED on the device. */
> +
> +static struct gpiod_lookup_table n30_blue_led_gpio_table = {
> +	.dev_id = "s3c24xx_led.1",
> +	.table = {
> +		GPIO_LOOKUP("GPG", 6, NULL, GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
>   static struct s3c24xx_led_platdata n30_blue_led_pdata = {
>   	.name		= "blue_led",
> -	.gpio		= S3C2410_GPG(6),
>   	.def_trigger	= "",
>   };
>   
>   /* This is the blue LED on the device. Originally used to indicate GPS activity
>    * by flashing. */
> +
> +static struct gpiod_lookup_table n35_blue_led_gpio_table = {
> +	.dev_id = "s3c24xx_led.1",
> +	.table = {
> +		GPIO_LOOKUP("GPD", 8, NULL, GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
>   static struct s3c24xx_led_platdata n35_blue_led_pdata = {
>   	.name		= "blue_led",
> -	.gpio		= S3C2410_GPD(8),
>   	.def_trigger	= "",
>   };
>   
> @@ -264,17 +281,30 @@ static struct s3c24xx_led_platdata n35_blue_led_pdata = {
>    * red, blinking green or solid green when the battery is low,
>    * charging or full respectively.  By driving GPD9 low, it's possible
>    * to force the LED to blink red, so call that warning LED.  */
> +
> +static struct gpiod_lookup_table n30_warning_led_gpio_table = {
> +	.dev_id = "s3c24xx_led.2",
> +	.table = {
> +		GPIO_LOOKUP("GPD", 9, NULL, GPIO_ACTIVE_LOW),
> +		{ },
> +	},
> +};
> +
>   static struct s3c24xx_led_platdata n30_warning_led_pdata = {
>   	.name		= "warning_led",
> -	.flags          = S3C24XX_LEDF_ACTLOW,
> -	.gpio		= S3C2410_GPD(9),
>   	.def_trigger	= "",
>   };
>   
> +static struct gpiod_lookup_table n35_warning_led_gpio_table = {
> +	.dev_id = "s3c24xx_led.2",
> +	.table = {
> +		GPIO_LOOKUP("GPD", 9, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
>   static struct s3c24xx_led_platdata n35_warning_led_pdata = {
>   	.name		= "warning_led",
> -	.flags          = S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
> -	.gpio		= S3C2410_GPD(9),
>   	.def_trigger	= "",
>   };
>   
> @@ -577,6 +607,12 @@ static void __init n30_init(void)
>   				      S3C2410_MISCCR_USBSUSPND0 |
>   				      S3C2410_MISCCR_USBSUSPND1, 0x0);
>   
> +		/* Disable pull-up and add GPIO tables */
> +		s3c_gpio_setpull(S3C2410_GPG(6), S3C_GPIO_PULL_NONE);
> +		s3c_gpio_setpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
> +		gpiod_add_lookup_table(&n30_blue_led_gpio_table);
> +		gpiod_add_lookup_table(&n30_warning_led_gpio_table);
> +
>   		platform_add_devices(n30_devices, ARRAY_SIZE(n30_devices));
>   	}
>   
> @@ -594,6 +630,12 @@ static void __init n30_init(void)
>   				      S3C2410_MISCCR_USBSUSPND1,
>   				      S3C2410_MISCCR_USBSUSPND0);
>   
> +		/* Disable pull-up and add GPIO tables */
> +		s3c_gpio_setpull(S3C2410_GPD(8), S3C_GPIO_PULL_NONE);
> +		s3c_gpio_setpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
> +		gpiod_add_lookup_table(&n35_blue_led_gpio_table);
> +		gpiod_add_lookup_table(&n35_warning_led_gpio_table);
> +
>   		platform_add_devices(n35_devices, ARRAY_SIZE(n35_devices));
>   	}
>   }
> diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
> index 5d48e5b6e738..ff9e3197309b 100644
> --- a/arch/arm/mach-s3c24xx/mach-qt2410.c
> +++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
> @@ -177,9 +177,15 @@ static struct platform_device qt2410_cs89x0 = {
>   
>   /* LED */
>   
> +static struct gpiod_lookup_table qt2410_led_gpio_table = {
> +	.dev_id = "s3c24xx_led.0",
> +	.table = {
> +		GPIO_LOOKUP("GPB", 0, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> +		{ },
> +	},
> +};
> +
>   static struct s3c24xx_led_platdata qt2410_pdata_led = {
> -	.gpio		= S3C2410_GPB(0),
> -	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
>   	.name		= "led",
>   	.def_trigger	= "timer",
>   };
> @@ -338,6 +344,8 @@ static void __init qt2410_machine_init(void)
>   	s3c_i2c0_set_platdata(NULL);
>   
>   	gpiod_add_lookup_table(&qt2410_spi_gpiod_table);
> +	s3c_gpio_setpull(S3C2410_GPB(0), S3C_GPIO_PULL_NONE);
> +	gpiod_add_lookup_table(&qt2410_led_gpio_table);
>   	platform_add_devices(qt2410_devices, ARRAY_SIZE(qt2410_devices));
>   	s3c_pm_init();
>   }
> diff --git a/arch/arm/mach-s3c24xx/mach-vr1000.c b/arch/arm/mach-s3c24xx/mach-vr1000.c
> index 853e74f9b8b5..6a3fb2becc7c 100644
> --- a/arch/arm/mach-s3c24xx/mach-vr1000.c
> +++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
> @@ -13,6 +13,7 @@
>   #include <linux/timer.h>
>   #include <linux/init.h>
>   #include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
>   #include <linux/dm9000.h>
>   #include <linux/i2c.h>
>   
> @@ -40,6 +41,7 @@
>   
>   #include <plat/cpu.h>
>   #include <plat/devs.h>
> +#include <plat/gpio-cfg.h>
>   #include <plat/samsung-time.h>
>   
>   #include "bast.h"
> @@ -223,21 +225,42 @@ static struct platform_device vr1000_dm9k1 = {
>   
>   /* LEDS */
>   
> +static struct gpiod_lookup_table vr1000_led1_gpio_table = {
> +	.dev_id = "s3c24xx_led.1",
> +	.table = {
> +		GPIO_LOOKUP("GPB", 0, NULL, GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table vr1000_led2_gpio_table = {
> +	.dev_id = "s3c24xx_led.2",
> +	.table = {
> +		GPIO_LOOKUP("GPB", 1, NULL, GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table vr1000_led3_gpio_table = {
> +	.dev_id = "s3c24xx_led.3",
> +	.table = {
> +		GPIO_LOOKUP("GPB", 2, NULL, GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
>   static struct s3c24xx_led_platdata vr1000_led1_pdata = {
>   	.name		= "led1",
> -	.gpio		= S3C2410_GPB(0),
>   	.def_trigger	= "",
>   };
>   
>   static struct s3c24xx_led_platdata vr1000_led2_pdata = {
>   	.name		= "led2",
> -	.gpio		= S3C2410_GPB(1),
>   	.def_trigger	= "",
>   };
>   
>   static struct s3c24xx_led_platdata vr1000_led3_pdata = {
>   	.name		= "led3",
> -	.gpio		= S3C2410_GPB(2),
>   	.def_trigger	= "",
>   };
>   
> @@ -317,6 +340,15 @@ static void __init vr1000_init_time(void)
>   static void __init vr1000_init(void)
>   {
>   	s3c_i2c0_set_platdata(NULL);
> +
> +	/* Disable pull-up on LED lines and register GPIO lookups */
> +	s3c_gpio_setpull(S3C2410_GPB(0), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPB(1), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPB(2), S3C_GPIO_PULL_NONE);
> +	gpiod_add_lookup_table(&vr1000_led1_gpio_table);
> +	gpiod_add_lookup_table(&vr1000_led2_gpio_table);
> +	gpiod_add_lookup_table(&vr1000_led3_gpio_table);
> +
>   	platform_add_devices(vr1000_devices, ARRAY_SIZE(vr1000_devices));
>   
>   	i2c_register_board_info(0, vr1000_i2c_devs,
> diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
> index f8b8d6e313ee..3734173596bf 100644
> --- a/drivers/leds/leds-s3c24xx.c
> +++ b/drivers/leds/leds-s3c24xx.c
> @@ -11,19 +11,19 @@
>   #include <linux/kernel.h>
>   #include <linux/platform_device.h>
>   #include <linux/leds.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/slab.h>
>   #include <linux/module.h>
>   #include <linux/platform_data/leds-s3c24xx.h>
>   
>   #include <mach/regs-gpio.h>
> -#include <plat/gpio-cfg.h>
>   
>   /* our context */
>   
>   struct s3c24xx_gpio_led {
>   	struct led_classdev		 cdev;
>   	struct s3c24xx_led_platdata	*pdata;
> +	struct gpio_desc		*gpiod;
>   };
>   
>   static inline struct s3c24xx_gpio_led *to_gpio(struct led_classdev *led_cdev)
> @@ -35,20 +35,9 @@ static void s3c24xx_led_set(struct led_classdev *led_cdev,
>   			    enum led_brightness value)
>   {
>   	struct s3c24xx_gpio_led *led = to_gpio(led_cdev);
> -	struct s3c24xx_led_platdata *pd = led->pdata;
> -	int state = (value ? 1 : 0) ^ (pd->flags & S3C24XX_LEDF_ACTLOW);
> +	int state = (value ? 1 : 0);

I'd drop this in favour on passing "!!value" directly to gpiod_set_value().

>   
> -	/* there will be a short delay between setting the output and
> -	 * going from output to input when using tristate. */
> -
> -	gpio_set_value(pd->gpio, state);
> -
> -	if (pd->flags & S3C24XX_LEDF_TRISTATE) {
> -		if (value)
> -			gpio_direction_output(pd->gpio, state);
> -		else
> -			gpio_direction_input(pd->gpio);
> -	}
> +	gpiod_set_value(led->gpiod, state);

Like this:

gpiod_set_value(led->gpiod, !!value);

>   }
>   
>   static int s3c24xx_led_probe(struct platform_device *dev)
> @@ -69,22 +58,12 @@ static int s3c24xx_led_probe(struct platform_device *dev)
>   
>   	led->pdata = pdata;
>   
> -	ret = devm_gpio_request(&dev->dev, pdata->gpio, "S3C24XX_LED");
> -	if (ret < 0)
> -		return ret;
> -
> -	/* no point in having a pull-up if we are always driving */
> -
> -	s3c_gpio_setpull(pdata->gpio, S3C_GPIO_PULL_NONE);
> -
> -	if (pdata->flags & S3C24XX_LEDF_TRISTATE)
> -		gpio_direction_input(pdata->gpio);
> -	else
> -		gpio_direction_output(pdata->gpio,
> -			pdata->flags & S3C24XX_LEDF_ACTLOW ? 1 : 0);
> +	/* Default to off */
> +	led->gpiod = devm_gpiod_get(&dev->dev, NULL, GPIOD_OUT_LOW);
> +	if (IS_ERR(led->gpiod))
> +		return PTR_ERR(led->gpiod);
>   
>   	/* register our new led device */
> -
>   	ret = devm_led_classdev_register(&dev->dev, &led->cdev);
>   	if (ret < 0)
>   		dev_err(&dev->dev, "led_classdev_register failed\n");
> diff --git a/include/linux/platform_data/leds-s3c24xx.h b/include/linux/platform_data/leds-s3c24xx.h
> index 5bbae85811e2..64f8d14876e0 100644
> --- a/include/linux/platform_data/leds-s3c24xx.h
> +++ b/include/linux/platform_data/leds-s3c24xx.h
> @@ -10,13 +10,7 @@
>   #ifndef __LEDS_S3C24XX_H
>   #define __LEDS_S3C24XX_H
>   
> -#define S3C24XX_LEDF_ACTLOW	(1<<0)		/* LED is on when GPIO low */
> -#define S3C24XX_LEDF_TRISTATE	(1<<1)		/* tristate to turn off */
> -
>   struct s3c24xx_led_platdata {
> -	unsigned int		 gpio;
> -	unsigned int		 flags;
> -
>   	char			*name;
>   	char			*def_trigger;
>   };
> 

-- 
Best regards,
Jacek Anaszewski
