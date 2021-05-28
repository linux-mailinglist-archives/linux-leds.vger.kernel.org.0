Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7478139481F
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 23:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhE1VIz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 17:08:55 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:53102 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhE1VIy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 17:08:54 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id EBAD91A205FE;
        Sat, 29 May 2021 00:02:00 +0300 (EEST)
Subject: Re: [PATCH v1 06/28] leds: el15203000: Introduce to_el15203000_led()
 helper
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-7-andy.shevchenko@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <e01c875b-7317-cd00-23c5-d9736f7533ec@kaa.org.ua>
Date:   Sat, 29 May 2021 00:01:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510095045.3299382-7-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

10.05.21 12:50, Andy Shevchenko пише:
> Introduce a helper to replace open coded container_of() calls.
> At the same time move ldev member to be first in the struct el15203000_led,
> that makes container_of() effectivelly a no-op.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/leds/leds-el15203000.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
> index fcb90d7cd42f..e81a93d57210 100644
> --- a/drivers/leds/leds-el15203000.c
> +++ b/drivers/leds/leds-el15203000.c
> @@ -69,8 +69,8 @@ enum el15203000_command {
>  };
>  
>  struct el15203000_led {
> -	struct el15203000	*priv;
>  	struct led_classdev	ldev;
> +	struct el15203000	*priv;
>  	u32			reg;
>  };
>  
> @@ -83,6 +83,8 @@ struct el15203000 {
>  	struct el15203000_led	leds[];
>  };
>  
> +#define to_el15203000_led(d)	container_of(d, struct el15203000_led, ldev)
> +
>  static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
>  {
>  	int		ret;
> @@ -124,9 +126,7 @@ static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
>  static int el15203000_set_blocking(struct led_classdev *ldev,
>  				   enum led_brightness brightness)
>  {
> -	struct el15203000_led *led = container_of(ldev,
> -						  struct el15203000_led,
> -						  ldev);
> +	struct el15203000_led *led = to_el15203000_led(ldev);
>  
>  	return el15203000_cmd(led, brightness == LED_OFF ? EL_OFF : EL_ON);
>  }
> @@ -135,9 +135,7 @@ static int el15203000_pattern_set_S(struct led_classdev *ldev,
>  				    struct led_pattern *pattern,
>  				    u32 len, int repeat)
>  {
> -	struct el15203000_led *led = container_of(ldev,
> -						  struct el15203000_led,
> -						  ldev);
> +	struct el15203000_led *led = to_el15203000_led(ldev);
>  
>  	if (repeat > 0 || len != 2 ||
>  	    pattern[0].delta_t != 4000 || pattern[0].brightness != 0 ||
> @@ -188,10 +186,8 @@ static int el15203000_pattern_set_P(struct led_classdev *ldev,
>  				    struct led_pattern *pattern,
>  				    u32 len, int repeat)
>  {
> +	struct el15203000_led	*led = to_el15203000_led(ldev);
>  	u8			cmd;
> -	struct el15203000_led	*led = container_of(ldev,
> -						    struct el15203000_led,
> -						    ldev);
>  
>  	if (repeat > 0)
>  		return -EINVAL;
> @@ -228,9 +224,7 @@ static int el15203000_pattern_set_P(struct led_classdev *ldev,
>  
>  static int el15203000_pattern_clear(struct led_classdev *ldev)
>  {
> -	struct el15203000_led	*led = container_of(ldev,
> -						    struct el15203000_led,
> -						    ldev);
> +	struct el15203000_led *led = to_el15203000_led(ldev);
>  
>  	return el15203000_cmd(led, EL_OFF);
>  }
> 

Reviewed-by: Oleh Kravchenko <oleg@kaa.org.ua>
