Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A592C116E8F
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 15:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfLIOHY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 09:07:24 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57950 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbfLIOHX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2019 09:07:23 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9E7HqM057803;
        Mon, 9 Dec 2019 08:07:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575900437;
        bh=+tskGKK1yFYHJAIymYb591qQH5CclE3ESOk4aPtUU2w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yk7doK7ptXepBvGkxDau7UnykLr8pqgrv7UJMxBTeqiSlfQfEG7SyPTzlAeskDE6w
         RLOwHNTZPpRDO116ZxETgG5ea5lJ3qkCMCvwIVZmIe0Sirr13O1rxYDxmTFcWR74aD
         3E9bWkkO9d1eGbt8DjHiGBH+Ml6QfEG155LVj2vY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9E7HD0060844
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Dec 2019 08:07:17 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 08:07:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 08:07:17 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9E7Gpe057512;
        Mon, 9 Dec 2019 08:07:16 -0600
Subject: Re: [PATCH v2] leds: bd2802: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, Kim Kyuwon <chammoru@gmail.com>
References: <20191209004242.18152-1-linus.walleij@linaro.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <657234de-bcd9-0482-7bc9-5f17a1126484@ti.com>
Date:   Mon, 9 Dec 2019 08:05:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209004242.18152-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Linus

On 12/8/19 6:42 PM, Linus Walleij wrote:
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
> ChangeLog v1->v2:
> - Ask simply for a GPIO descriptor named "reset", drop the
>    idiomatic naming from the code.
> ---
>   drivers/leds/leds-bd2802.c  | 27 ++++++++++++++++++---------
>   include/linux/leds-bd2802.h |  1 -
>   2 files changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
> index e7ec6bff2b5f..bd61a823d0ca 100644
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
> +	led->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(led->reset))
> +		return PTR_ERR(led->reset);

What about EPROBE_DEFER?

Is the reset line optional or required?  I see that this device does not 
have DT docs and the call infers it is required.

But can this be optional?

Dan

