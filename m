Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F830AD763
	for <lists+linux-leds@lfdr.de>; Mon,  9 Sep 2019 12:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbfIIK5e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Sep 2019 06:57:34 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55005 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729374AbfIIK5e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Sep 2019 06:57:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id p7so1704093wmp.4
        for <linux-leds@vger.kernel.org>; Mon, 09 Sep 2019 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RlXHN5Ix30FP88bBs/TiJIVQtqEqdtYjO/ksq2NpWCg=;
        b=pgan3/KEQnhn7ZcaynKzZHra/KGSzMg74XSUwMiPg68U30ANdU3IbUc2+NTbH5uHuV
         2f+BqabSS2vknJtIwazP57ZLuTWgbQg9OU9yur/ody+/dRsLSgpGkBcPuueJaAWrDWL5
         p39Vc5SC2gbKjUVK5a+Z3NpB52GGp1LJ9XlZiKyj/E55rVt/qAGE9dteFfT7uV/ZwUpA
         hOGxj/qvf4pFkh/P++GQ30oH8rEmREpPutfQRAWmuHUBvpZuhfBuxlp1MPsjKhPjNKr7
         5la4M5cNiLZ7+wGs6M1BalVnhrEywn9IvP0Wo13j3hmD7LUy0N+lBIZZ0lpMkS7xWHTz
         69vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RlXHN5Ix30FP88bBs/TiJIVQtqEqdtYjO/ksq2NpWCg=;
        b=Rqo+MjuDDfHgOrNcChQMvrPlevaGxvKV4AdIJzdKqJG98h20Bd9zrLT70rt01cFZQC
         wy5JXEABy16ajrb5XfMuizaI9aD5TEtlKBp8QO6og37hNfl7vCsA0lmWBJdJESzT0epN
         V3++Tp+Kd8JvshBKYnSPBAWAdNgwbbpKpPenrNq01KC9emHYelH7HGlD8Gah24DYPj64
         Kta96gM6HPWlf5Gi1/jwWYxvoflTabpF2lYw80og1Yfltvc74DC1nM9tHeNj9pQqFmJA
         A9TMmmAaJe92tdbERwIcBvVyBAIZYDYo9Y3S1+HdzhFScjY/3pFmUcEVInNQwSWTOfTb
         i6YA==
X-Gm-Message-State: APjAAAVopJijNrwkv+U14bys30HXxhUu+YA+YnanXWe1tCZeJT9BV+II
        gpx9N4mRe6H9xEobSuJqmh/HwA==
X-Google-Smtp-Source: APXvYqyWb29kdhIDW8uaIKHqPrGrRW0QDeYEfi/ticz66TJeFeLmc7gPIPjGFV3JDIWoJ302JjquKQ==
X-Received: by 2002:a1c:cb83:: with SMTP id b125mr19176609wmg.43.1568026651947;
        Mon, 09 Sep 2019 03:57:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id s12sm4418832wrn.90.2019.09.09.03.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 03:57:30 -0700 (PDT)
Date:   Mon, 9 Sep 2019 11:57:29 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190909105729.w5552rtop7rhghy2@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190908203704.30147-2-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 08, 2019 at 10:37:03PM +0200, Andreas Kemnade wrote:
> For now just enable it in the probe function to allow i2c
> access and disable it on remove. Disabling also means resetting
> the register values to default.
> 
> Tested on Kobo Clara HD.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index b04b35d007a2..3b45a1733198 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -12,6 +12,8 @@
>  #include <linux/uaccess.h>
>  #include <linux/interrupt.h>
>  #include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio.h>
>  #include <linux/pwm.h>
>  #include <linux/platform_data/lm3630a_bl.h>
>  
> @@ -48,6 +50,7 @@ struct lm3630a_chip {
>  	struct lm3630a_platform_data *pdata;
>  	struct backlight_device *bleda;
>  	struct backlight_device *bledb;
> +	struct gpio_desc *enable_gpio;
>  	struct regmap *regmap;
>  	struct pwm_device *pwmd;
>  };
> @@ -506,6 +509,14 @@ static int lm3630a_probe(struct i2c_client *client,
>  		return -ENOMEM;
>  	pchip->dev = &client->dev;
>  
> +	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> +						GPIOD_ASIS);

Initializing GPIOD_ASIS doesn't look right to me.

If you initialize ASIS then the driver must configure the pin as an
output... far easier just to set GPIOD_OUT_HIGH during the get.

Note also that the call to this function should also be moved *below*
the calls parse the DT.


> +	if (IS_ERR(pchip->enable_gpio)) {
> +		rval = PTR_ERR(pchip->enable_gpio);
> +		return rval;
> +	}
> +
> +
>  	pchip->regmap = devm_regmap_init_i2c(client, &lm3630a_regmap);
>  	if (IS_ERR(pchip->regmap)) {
>  		rval = PTR_ERR(pchip->regmap);
> @@ -535,6 +546,10 @@ static int lm3630a_probe(struct i2c_client *client,
>  	}
>  	pchip->pdata = pdata;
>  
> +	if (pchip->enable_gpio) {
> +		gpiod_set_value_cansleep(pchip->enable_gpio, 1);

Not needed, use GPIOD_OUT_HIGH instead.


> +		usleep_range(1000, 2000);

Not needed, this sleep is already part of lm3630a_chip_init().


> +	}
>  	/* chip initialize */
>  	rval = lm3630a_chip_init(pchip);
>  	if (rval < 0) {
> @@ -586,6 +601,9 @@ static int lm3630a_remove(struct i2c_client *client)
>  	if (rval < 0)
>  		dev_err(pchip->dev, "i2c failed to access register\n");
>  
> +	if (pchip->enable_gpio)
> +		gpiod_set_value_cansleep(pchip->enable_gpio, 0);
> +

Is this needed?

This is a remove path, not a power management path, and we have no idea
what the original status of the pin was anyway?


>  	if (pchip->irq) {
>  		free_irq(pchip->irq, pchip);
>  		flush_workqueue(pchip->irqthread);
> -- 
> 2.20.1
> 
