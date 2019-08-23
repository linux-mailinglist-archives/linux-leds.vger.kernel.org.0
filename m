Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44F399B624
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2019 20:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405228AbfHWSO4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Aug 2019 14:14:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37011 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404393AbfHWSOz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Aug 2019 14:14:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id z11so9438981wrt.4
        for <linux-leds@vger.kernel.org>; Fri, 23 Aug 2019 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rc9mLcG4WIM4egRCzU0e9WO2FYpILp5YqLnUq4Uv4Gk=;
        b=ox1OnbBtCG3zw2Fk8i2ch26Jig90hSOXwQREcXKsaKBFdjZFAjXc3afUjPodRotL9B
         OahnXEoWePS/5YrdpE8Eobj5vViSDKqEvGDc+yMNxu78vRvb6z+q3KyAc0rvGaUwgx3u
         Y2IOAh633t9mX2g+AJnY4VB5fSExAjwRCwj3QjB+NAJgAjEHQYOuTUO67oM0Q5TX9SB5
         JEUIH1AhbE0bRvlZIJYr5GY2U8aDi4lcjAN8WAFtw4EyoGhhaJAGoyPB/2TfZgHRbpyv
         3IlKj/O6SMb4BFaeBq69S5KwjKU8mV9qb9lXTnZrryUlWGHnwpoKfj3X3LobfixHvmQF
         RDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rc9mLcG4WIM4egRCzU0e9WO2FYpILp5YqLnUq4Uv4Gk=;
        b=bSpFEvdJtfv3DXQE3uHkOsS/FBoWd6gUBc45Vnm5blSo9+v3uY+rN7mNIVEyrx0qoQ
         5IwUwHG3mxc4o5PpYtNYMRrr6tAKxz+b6UeLhQCmgwrtF0BTaHdBTI7VoMNFjNn8XaZN
         PbQ0llZjGKUeoUDZIdZScVoMoMeUaYiyJyxVD14dcbhZxD4xLivDavdJ86mgwD6mQDje
         LNY2636QOziw+IA4hHV631O0NcGDN6LbMREbccydqO5vvwpu/50yR3mjBx+4MLCO2j44
         LSpcKLUMCvGvZZ/1J+hb0i3a5ASV+RnnW07ya93OnUanXYGV6jcXuV3atJq3lUJiQ745
         iGpQ==
X-Gm-Message-State: APjAAAUPXt9tfMtp43CTXxCeMwRl6S4MthoXEGqxEutKxZfJJdzRMkXu
        ETlewj6ZmVyIvnBNiXCYK9KgGKng
X-Google-Smtp-Source: APXvYqzHK0K0nAVQbZqBaiTzzxNSLGx4iUwPMKOm2fG9vV/0fc9maxuhukyIFvLZB9gPgE3swjKd+w==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr6935017wrv.49.1566584092645;
        Fri, 23 Aug 2019 11:14:52 -0700 (PDT)
Received: from [192.168.1.19] (dkm198.neoplus.adsl.tpnet.pl. [83.24.16.198])
        by smtp.gmail.com with ESMTPSA id r11sm3221758wrt.84.2019.08.23.11.14.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 11:14:51 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] leds: Switch to use fwnode instead of be stuck
 with OF one
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
References: <20190822151928.51274-1-andriy.shevchenko@linux.intel.com>
 <20190822151928.51274-2-andriy.shevchenko@linux.intel.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <08858604-8a89-870f-9234-21c7fdd1d165@gmail.com>
Date:   Fri, 23 Aug 2019 20:14:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822151928.51274-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andy,

Thank you for the patch. I have one issue below.

On 8/22/19 5:19 PM, Andy Shevchenko wrote:
> There is no need to be stuck with OF node when we may use agnostic
> firmware node instead.
> 
> It allows users to get property if needed independently of provider.
> 
> Note, some OF parts are left because %pfw [1] is in progress.
> 
> [1]: https://lore.kernel.org/patchwork/cover/1054863/
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/led-class.c | 4 ++--
>  drivers/leds/led-core.c  | 9 +++------
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index d231240c2047..052c7571e188 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -14,7 +14,7 @@
>  #include <linux/leds.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/timer.h>
> @@ -277,7 +277,7 @@ int led_classdev_register_ext(struct device *parent,
>  		return PTR_ERR(led_cdev->dev);
>  	}
>  	if (init_data && init_data->fwnode)
> -		led_cdev->dev->of_node = to_of_node(init_data->fwnode);
> +		led_cdev->dev->fwnode = init_data->fwnode;
>  
>  	if (ret)
>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index f0c1c403f678..f1f718dbe0f8 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -324,14 +324,11 @@ EXPORT_SYMBOL_GPL(led_update_brightness);
>  
>  u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int *size)
>  {
> -	struct device_node *np = dev_of_node(led_cdev->dev);
> +	struct fwnode_handle *fwnode = led_cdev->dev->fwnode;
>  	u32 *pattern;
>  	int count;
>  
> -	if (!np)
> -		return NULL;

Why aren't you checking fwnode for being not NULL?
It is not guaranteed to be always initialized.

> -
> -	count = of_property_count_u32_elems(np, "led-pattern");
> +	count = fwnode_property_count_u32(fwnode, "led-pattern");
>  	if (count < 0)
>  		return NULL;
>  
> @@ -339,7 +336,7 @@ u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int *size)
>  	if (!pattern)
>  		return NULL;
>  
> -	if (of_property_read_u32_array(np, "led-pattern", pattern, count)) {
> +	if (fwnode_property_read_u32_array(fwnode, "led-pattern", pattern, count)) {
>  		kfree(pattern);
>  		return NULL;
>  	}
> 

-- 
Best regards,
Jacek Anaszewski
