Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827E26A620B
	for <lists+linux-leds@lfdr.de>; Tue, 28 Feb 2023 23:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjB1WBi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Feb 2023 17:01:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjB1WBh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2023 17:01:37 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DF9CC31
        for <linux-leds@vger.kernel.org>; Tue, 28 Feb 2023 14:01:34 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id CEBD885BAE;
        Tue, 28 Feb 2023 23:01:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677621693;
        bh=W1Sj0xKNKEEUVmRbGu3eaR3GqpESbXwjJhA2Fd/le+s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DRz6iHP14kcsL9apYWhTLvJ9bimwPig528I5bKrATqUysey8PuCzB0xkQw2gS775k
         majlW7k96uEjyqu6Hsgh4uQxg4vz4vvchR0Ts1ypTSaS8gLz2f7KmK/Sm2xaWQPAcw
         ed2V3uHhMAf5y84CJU78gU8UBCMtUWRDiAPqfTsIHZWx05su77rMhv1ufbafXSLkii
         W0zJy9Lu8QQ4va1t7lJaNftjktWMIIdaZ/LDHdV0DNlcPJe7Dhc5K6Fjue69tqmDva
         Hp6TxVkj0tNGJNCzJu50ofTy/3CNaLqDO7VZK9NgokMG0gn7lVTLnptX+NAYuonHth
         cCE5gxtqV0x9g==
Message-ID: <325f5dab-0812-fadb-abe1-0d86888c198a@denx.de>
Date:   Tue, 28 Feb 2023 23:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] leds: gpio: Configure per-LED pin control
Content-Language: en-US
To:     linux-leds@vger.kernel.org, pavel Machek <pavel@denx.de>
Cc:     Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20221107003133.377704-1-marex@denx.de>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221107003133.377704-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/7/22 01:31, Marek Vasut wrote:
> Each gpio-leds DT node DT subnode can have a pinctrl property assigned
> to it, parse the DT subnode pinctrl properties and configure each pin
> accordingly.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> To: linux-leds@vger.kernel.org
> ---
>   drivers/leds/leds-gpio.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 092eb59a7d325..01ca88876f008 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -13,6 +13,7 @@
>   #include <linux/leds.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
>   #include <linux/property.h>
>   #include <linux/slab.h>
> @@ -77,6 +78,7 @@ static int create_gpio_led(const struct gpio_led *template,
>   	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
>   {
>   	struct led_init_data init_data = {};
> +	struct pinctrl *pinctrl;
>   	int ret, state;
>   
>   	led_dat->cdev.default_trigger = template->default_trigger;
> @@ -119,6 +121,22 @@ static int create_gpio_led(const struct gpio_led *template,
>   						     &init_data);
>   	}
>   
> +	if (ret)
> +		return ret;
> +
> +	pinctrl = devm_pinctrl_get_select_default(led_dat->cdev.dev);
> +	if (IS_ERR(pinctrl)) {
> +		ret = PTR_ERR(pinctrl);
> +		if (ret != -ENODEV) {
> +			dev_warn(led_dat->cdev.dev,
> +				 "Failed to select %pOF pinctrl: %d\n",
> +				 to_of_node(fwnode), ret);
> +		} else {
> +			/* pinctrl-%d not present, not an error */
> +			ret = 0;
> +		}
> +	}
> +
>   	return ret;
>   }
>   

Any news on this patch ?
