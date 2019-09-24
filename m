Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4187FBD409
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2019 23:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbfIXVI5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Sep 2019 17:08:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43801 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfIXVI5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Sep 2019 17:08:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id q17so3641595wrx.10;
        Tue, 24 Sep 2019 14:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XVmJVxXzYqb+G0BLob2gcH/cvcMPCD/+7W0Jky/+H44=;
        b=bXbtworhmZjQOufav+2U6CVsEvLFwdktw9JbMtx01Byqa8XiV3j+AK6uT3QbSeRoq5
         uEr8h1NvmHOsr+/X6JhdZ1c/wb8VFvJgWcAtzc6ijqLrbcTaNGN8/zqYg23x3XG+0qhE
         e80t0ddfZiJAzLAdaEWl5hsfkVxx8dR3VCydlIu2kT9tkMnfPoW0PmSVpoeLvPR6Ipxo
         JtioIcS3r2+bD9B7S2G4JyXdSvcVFPjT8Lzn6RG/kxRBQKD/1CNdIY6C8qun97ZHT/TJ
         a+5lHl4uQVH12YJZ4KpVzhxCwS7ixcQ+jlbO3leyqNCXqJd7Ui/6NNJvE5CMOZr4QR2o
         PcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XVmJVxXzYqb+G0BLob2gcH/cvcMPCD/+7W0Jky/+H44=;
        b=SOCLgN3XP51hE6dQeuxXWxxQqsU45Ige1JkjcO2sRHmBrrA1noSJDWAyWGsXzOI1lf
         rzX6L8egqrzCs71Vb8M9noeVe5hfUC8J3QlWjZsSN426IJ5H9KFuiFOozQAmY/ys/Fqa
         +DpC8RF2lDyXnkF6iBTNQD+1fxOXdr76fT9m+OH+1ZDp/IPj3U6D/SqwKbnEVQlLm7NR
         WuaVxfoQKp6VUfW/LaQTIUVmjP+dAw0lpwz06KD7l6yQWyhNJWZbDIhIC//bswzXhepk
         FSNUhgweNIEO8B5wzGSZTQNxOdEP6M60MWuAzG8SyQo5oKTsgRz55qjQVUr962deLbms
         /2zg==
X-Gm-Message-State: APjAAAUbvF/s/FJ9I1cbPkeNSECPxvjGyAnQx9eIVkRUFvv578ItwIdY
        SamJWhivV+SgfRignzMCGU4=
X-Google-Smtp-Source: APXvYqyJX0eEZG4Q/p2p1INSvTHeBK6yRVdeZpgZY+f/x8BrHYC57+ariD4r8adpV/4bLJvVwWwoTQ==
X-Received: by 2002:adf:e78d:: with SMTP id n13mr5010294wrm.355.1569359333921;
        Tue, 24 Sep 2019 14:08:53 -0700 (PDT)
Received: from [192.168.1.19] (bfw157.neoplus.adsl.tpnet.pl. [83.28.60.157])
        by smtp.gmail.com with ESMTPSA id g1sm1692516wrv.68.2019.09.24.14.08.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 14:08:53 -0700 (PDT)
Subject: Re: [PATCH v7 2/5] leds: Add of_led_get() and led_put()
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-3-jjhiblot@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <700942d3-8e67-8520-d42a-605addcc2e06@gmail.com>
Date:   Tue, 24 Sep 2019 23:08:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918145730.22805-3-jjhiblot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jean,

Thank you for the patch.

I have one nit below.

On 9/18/19 4:57 PM, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This patch adds basic support for a kernel driver to get a LED device.
> This will be used by the led-backlight driver.
> 
> Only OF version is implemented for now, and the behavior is similar to
> PWM's of_pwm_get() and pwm_put().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/led-class.c | 50 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h     |  4 ++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index c2167b66b61f..2b8f20f94128 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -19,6 +19,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/timer.h>
>  #include <uapi/linux/uleds.h>
> +#include <linux/of.h>
>  #include "leds.h"
>  
>  static struct class *leds_class;
> @@ -214,6 +215,55 @@ static int led_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
>  
> +static int led_match_led_of_node(struct device *led_dev, const void *data)
> +{
> +	return led_dev->of_node == data;
> +}
> +
> +/**
> + * of_led_get() - request a LED device via the LED framework
> + * @np: device node to get the LED device from
> + * @index: the index of the LED
> + *
> + * Returns the LED device parsed from the phandle specified in the "leds"
> + * property of a device tree node or a negative error-code on failure.
> + */
> +struct led_classdev *of_led_get(struct device_node *np, int index)
> +{
> +	struct device *led_dev;
> +	struct led_classdev *led_cdev;
> +	struct device_node *led_node;
> +
> +	led_node = of_parse_phandle(np, "leds", index);
> +	if (!led_node)
> +		return ERR_PTR(-ENOENT);
> +
> +	led_dev = class_find_device(leds_class, NULL, led_node,
> +		led_match_led_of_node);

Now we have class_find_device_by_of_node().

> +	of_node_put(led_node);
> +
> +	if (!led_dev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	led_cdev = dev_get_drvdata(led_dev);
> +
> +	if (!try_module_get(led_cdev->dev->parent->driver->owner))
> +		return ERR_PTR(-ENODEV);
> +
> +	return led_cdev;
> +}
> +EXPORT_SYMBOL_GPL(of_led_get);
> +
> +/**
> + * led_put() - release a LED device
> + * @led_cdev: LED device
> + */
> +void led_put(struct led_classdev *led_cdev)
> +{
> +	module_put(led_cdev->dev->parent->driver->owner);
> +}
> +EXPORT_SYMBOL_GPL(led_put);
> +
>  static int led_classdev_next_name(const char *init_name, char *name,
>  				  size_t len)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index b8df71193329..6f7371bc7757 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -20,6 +20,7 @@
>  
>  struct device;
>  struct led_pattern;
> +struct device_node;
>  /*
>   * LED Core
>   */
> @@ -196,6 +197,9 @@ extern void devm_led_classdev_unregister(struct device *parent,
>  extern void led_classdev_suspend(struct led_classdev *led_cdev);
>  extern void led_classdev_resume(struct led_classdev *led_cdev);
>  
> +extern struct led_classdev *of_led_get(struct device_node *np, int index);
> +extern void led_put(struct led_classdev *led_cdev);
> +
>  /**
>   * led_blink_set - set blinking with software fallback
>   * @led_cdev: the LED to start blinking
> 

-- 
Best regards,
Jacek Anaszewski
