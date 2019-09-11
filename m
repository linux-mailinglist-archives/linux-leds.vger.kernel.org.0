Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830DAAFA4C
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 12:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfIKKZi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 06:25:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39462 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbfIKKZh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 06:25:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id q12so2851619wmj.4
        for <linux-leds@vger.kernel.org>; Wed, 11 Sep 2019 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cVytbu5aDeImYPKa8pGIMJDrGZ6PUWapgttWO1YNSWo=;
        b=WbGo5Hmz09242kK2X2Ks5uKjFCYXNT2i6lWaWWpoIN+qvvLyXoNLqTsd/1nDidIfV2
         DQVN4B+puM2xskQIoKsxbaSQMlx9AiUrOLwVDieIgFbBoCitWqznFjicK88E/v9xXS3K
         BN25w/Fa6IfYNrZLdGgUIYPdCBhRgedhJ/2rGI2IPa0QIANFJ5kDHIWvhJOGlaWJb2aV
         w6whG54hVEfGCDgCh4JWZz3XIQN8XzZiMzmPQohhgPvGydLLkQGve+NqCWI7yeFo9olm
         CelxyfcqCEsPYLNMEvfPEQA+NH12WAoyHPk8tORRcyaFb0AOnBbf6TX6tapfMVeOj2to
         danw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cVytbu5aDeImYPKa8pGIMJDrGZ6PUWapgttWO1YNSWo=;
        b=O+QDgTJT2Us991irbo955IhzO3AbwmCZYmSFjUbvxLFBvmywHWHvfKjBCHfnYcli5b
         NIzOzWmBK8QaI2Msf1R/XU7gtC5owluXpC8zld7gGwALE1RQMbncTUHYdJU0Pp03eaN0
         +Do5GQMEc86mz58xz1OP15WWs8r9iA6auoaDZ5Ppi0DC1GKo+Z97G2hqsvPRnH0ZnTT0
         7ZkRqD9Ngsy60cvnwA6kOZuvqXmDxxNsdyHU3fZzU+piuF4J8rE7r+1MX+7+wlGHNv4Q
         mysxB1cu42LnvNdSm7QcZKuCRNuoBhOZG+bn8XmVaayFxQtSLtLAmhI0lOJzPt4+7FX2
         G8PQ==
X-Gm-Message-State: APjAAAX1C/WfoUcj3G8UH6tO7Km7FkahSFva4KgdFSkKS/oc1RMNyLh5
        09Zws3paugzqYLI1YEzZFBv6NQ==
X-Google-Smtp-Source: APXvYqzVMF0R+kyeDNgLI4QVwcAzQuyJbImC6/3qU7I+I0w6fwpvAl/Ay1oUpkLuzSS/Uus7LaWquA==
X-Received: by 2002:a1c:f607:: with SMTP id w7mr3358169wmc.84.1568197535579;
        Wed, 11 Sep 2019 03:25:35 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id e20sm2583505wme.3.2019.09.11.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 03:25:34 -0700 (PDT)
Date:   Wed, 11 Sep 2019 11:25:33 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Message-ID: <20190911102533.not4ta3xwgm6bhjo@holly.lan>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910212909.18095-3-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 10, 2019 at 11:29:09PM +0200, Andreas Kemnade wrote:
> For now just enable it in the probe function to allow i2c
> access. Disabling also means resetting the register values
> to default and according to the datasheet does not give
> power savings
> 
> Tested on Kobo Clara HD.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> changes in v2:
> - simplification
> - correct gpio direction initialisation
> 
>  drivers/video/backlight/lm3630a_bl.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index 8f84f3684f04..9d0639d4202d 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -12,6 +12,8 @@
>  #include <linux/uaccess.h>
>  #include <linux/interrupt.h>
>  #include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio.h>

Nitpicking... but I don't think linux/gpio.h is used anymore.


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
> @@ -535,6 +538,13 @@ static int lm3630a_probe(struct i2c_client *client,
>  	}
>  	pchip->pdata = pdata;
>  
> +	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(pchip->enable_gpio)) {
> +		rval = PTR_ERR(pchip->enable_gpio);
> +		return rval;
> +	}
> +
>  	/* chip initialize */
>  	rval = lm3630a_chip_init(pchip);
>  	if (rval < 0) {
> -- 
> 2.20.1
> 
