Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97B244538F
	for <lists+linux-leds@lfdr.de>; Thu,  4 Nov 2021 14:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhKDNMD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Nov 2021 09:12:03 -0400
Received: from phobos.denx.de ([85.214.62.61]:41500 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231210AbhKDNMA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Nov 2021 09:12:00 -0400
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hws@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6DBBE836A7;
        Thu,  4 Nov 2021 14:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1636031361;
        bh=YVW1gzpF3RR5awNQMuSHVPGPJkaahpVca7CxadlYKWA=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=JN1vVd1NZ/EnoLwaY9WjZadN/d28IlHyM4Y0/pVceKSRtBVNFH4E7nEfSbY1tAHay
         aSfLytelWChXaTukm6C1vUgS0Uy12WoValUqMi0sTUnAh/XHaBjcJzXQBNvfyLLdPb
         IGavmmxnGH6XF7TkfsD+YIaeY63owD0g5h7Pff4pv1kMne2jnWaY5zf7R7jrecUGIT
         SVfYg64czmh/QB+E9aoIUNuJ58JSH+vVkgYGLihq/1ZuFHHGtb9m7nZtf1igN/zYI5
         7v7Zp6P432VkM9xT/qLDHOZzud7rwG3cop2VhmHo1JnMR3ExEPWfsR1BtQWix+Pm/h
         zm39nZITQUSTA==
Message-ID: <f03bf00b8d0e8f640379016f3bf6ba5a8b1af456.camel@denx.de>
Subject: Re: [PATCH] leds: gpio: Always provide
 cdev->brightness_set_blocking()
From:   Harald Seiler <hws@denx.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <j.anaszewski@samsung.com>
Date:   Thu, 04 Nov 2021 14:09:21 +0100
In-Reply-To: <20210922172133.2257467-1-hws@denx.de>
References: <20210922172133.2257467-1-hws@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Wed, 2021-09-22 at 19:21 +0200, Harald Seiler wrote:
> Even if the GPIO driver will never sleep, setting
> cdev->brightness_set_blocking() makes sense so
> led_set_brightness_sync() can be used with such LEDs.
> 
> Internally, both gpio_led_set_blocking() and gpio_led_set() call
> the same implementation anyway.
> 
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Harald Seiler <hws@denx.de>
> ---

Any chance you can pick this up?  This fix is needed to use gpio leds
with, for example, the tty trigger.

-- 
Harald

>  drivers/leds/leds-gpio.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index b5d5e22d2d1e..bbe582e47607 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -79,11 +79,12 @@ static int create_gpio_led(const struct gpio_led *template,
>  	int ret, state;
>  
>  	led_dat->cdev.default_trigger = template->default_trigger;
> +	led_dat->cdev.brightness_set_blocking = gpio_led_set_blocking;
> +
>  	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
>  	if (!led_dat->can_sleep)
>  		led_dat->cdev.brightness_set = gpio_led_set;
> -	else
> -		led_dat->cdev.brightness_set_blocking = gpio_led_set_blocking;
> +
>  	led_dat->blinking = 0;
>  	if (blink_set) {
>  		led_dat->platform_gpio_blink_set = blink_set;

