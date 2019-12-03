Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D4810FDED
	for <lists+linux-leds@lfdr.de>; Tue,  3 Dec 2019 13:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfLCMn0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Dec 2019 07:43:26 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46266 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfLCMn0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Dec 2019 07:43:26 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB3ChKxn125816;
        Tue, 3 Dec 2019 06:43:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575377000;
        bh=GqyRsbfIe63TFgQuMrzxYM0Gawga04NMW3RL02gMLwo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LEe4DKk9Fc7womAq4H0ufAJQ8o2wqvLAKCU+fQma8EoABRiosAlh9IZwsaE0K5jaw
         ruLLrZOXqnrssqEgcXHNW7AGXrNa/w4WZ/E4kHI7NYQSjt4oggQHHaIMDY9/Wi8kLo
         JanR1qMUK+B8c1uToGx6q+xVKUuYF+MNey2prpdA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB3ChK6O064582;
        Tue, 3 Dec 2019 06:43:20 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 3 Dec
 2019 06:43:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 3 Dec 2019 06:43:20 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB3ChJs1060286;
        Tue, 3 Dec 2019 06:43:20 -0600
Subject: Re: [PATCH] leds: bd2802: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, Kim Kyuwon <chammoru@gmail.com>
References: <20191203095908.52926-1-linus.walleij@linaro.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <01c5b357-549b-060a-4bc7-724b8f7479ed@ti.com>
Date:   Tue, 3 Dec 2019 06:41:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191203095908.52926-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Linus

On 12/3/19 3:59 AM, Linus Walleij wrote:
> The Rohm BD2802 have no in-kernel users so we can drop the
> GPIO number from the platform data and require users to
> provide the GPIO line using machine descriptors.
>
> As the descriptors come with inherent polarity inversion
> semantics, we invert the calls to set the GPIO line such
> that 0 means "unasserted" and 1 means "asserted".
>
> Put a note in the driver that machine descriptor tables
> will need to specify that the line is active low.
>
> Cc: Kim Kyuwon <chammoru@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/leds/leds-bd2802.c  | 27 ++++++++++++++++++---------
>   include/linux/leds-bd2802.h |  1 -
>   2 files changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
> index e7ec6bff2b5f..d551f7434897 100644
> --- a/drivers/leds/leds-bd2802.c
> +++ b/drivers/leds/leds-bd2802.c
> @@ -10,7 +10,7 @@
>   
>   #include <linux/module.h>
>   #include <linux/i2c.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/delay.h>
>   #include <linux/leds.h>
>   #include <linux/leds-bd2802.h>
> @@ -67,6 +67,7 @@ struct led_state {
>   struct bd2802_led {
>   	struct bd2802_led_platform_data	*pdata;
>   	struct i2c_client		*client;
> +	struct gpio_desc		*reset;
>   	struct rw_semaphore		rwsem;
>   
>   	struct led_state		led[2];
> @@ -200,7 +201,7 @@ static void bd2802_update_state(struct bd2802_led *led, enum led_ids id,
>   		return;
>   
>   	if (bd2802_is_all_off(led) && !led->adf_on) {
> -		gpio_set_value(led->pdata->reset_gpio, 0);
> +		gpiod_set_value(led->reset, 1);
>   		return;
>   	}
>   
> @@ -226,7 +227,7 @@ static void bd2802_configure(struct bd2802_led *led)
>   
>   static void bd2802_reset_cancel(struct bd2802_led *led)
>   {
> -	gpio_set_value(led->pdata->reset_gpio, 1);
> +	gpiod_set_value(led->reset, 0);
>   	udelay(100);
>   	bd2802_configure(led);
>   }
> @@ -420,7 +421,7 @@ static void bd2802_disable_adv_conf(struct bd2802_led *led)
>   						bd2802_addr_attributes[i]);
>   
>   	if (bd2802_is_all_off(led))
> -		gpio_set_value(led->pdata->reset_gpio, 0);
> +		gpiod_set_value(led->reset, 1);
>   
>   	led->adf_on = 0;
>   }
> @@ -670,8 +671,16 @@ static int bd2802_probe(struct i2c_client *client,
>   	pdata = led->pdata = dev_get_platdata(&client->dev);
>   	i2c_set_clientdata(client, led);
>   
> -	/* Configure RESET GPIO (L: RESET, H: RESET cancel) */
> -	gpio_request_one(pdata->reset_gpio, GPIOF_OUT_INIT_HIGH, "RGB_RESETB");
> +	/*
> +	 * Configure RESET GPIO (L: RESET, H: RESET cancel)
> +	 *
> +	 * We request the reset GPIO as OUT_LOW which means de-asserted,
> +	 * board files specifying this GPIO line in a machine descriptor
> +	 * table should take care to specify GPIO_ACTIVE_LOW for this line.
> +	 */
> +	led->reset = devm_gpiod_get(&client->dev, "rgb-resetb", GPIOD_OUT_LOW);

We usually use "reset" for the property of the reset-gpios.

Unless there are other reset lines for this chip or you are keeping the 
name for compatibiilty

Dan


