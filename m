Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C87BD412
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2019 23:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbfIXVKI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Sep 2019 17:10:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46816 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbfIXVKI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Sep 2019 17:10:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id o18so3637450wrv.13;
        Tue, 24 Sep 2019 14:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nwaRtEcx4RlUGhCzFIfFa52z36UoikBl3mWSSzdWQN4=;
        b=s+mGhTT+Cr8rpVeVQo0/RPfX08iEG0NxK10YMuEiWPy3x7pSWIip7uzLxzLF7vW9J0
         XEztTPL+EotTEsqT2KjXYwm5O61YDw2vklKz+UhATBDwU+23VjimokD6Isb76iOG1iYF
         SEM98FCTw8SjaZPkrtk7gdndJ0EkaP7CFdOaZ8reZNkJoVe8tJ8guNYAAaRPaViNA327
         pEUbwJgJoVNY1v//8ad2m0WLfp3D/s/lz+a+yXEOkUNXh4i6YSU7ikDYk1dyXkXkd+ka
         QNm7ljg8H7HvFcH048XoFjCd0Z+Pl1x4npX1ApTjFnBATMQfGfBJCjhVRM87Upob2o6T
         2NLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nwaRtEcx4RlUGhCzFIfFa52z36UoikBl3mWSSzdWQN4=;
        b=DUxB2P+TEJmoNnlotSp42IwzwHy53eSJuBW0DMaMo0YHXCipSr98ZB/6iA1VRCuBzV
         o7STCMJCPr6vMGo75SaUmJWJk/ijHqqICgXtg0ElAxxZm5i/1zK5aFn8UgdU/we6umhB
         Izo8xzLcQxuF2shHUrS/Lx6reeWKLFclPdUD6LKyVtxDAQdNW2l2izzbIN19IANtV2t1
         lZBIjbpjCG5W2p+531wR6Yt3Am+G3ZRxPSdzRNO/LIyKBG4aOTwBeO58VUQgVa4gbfvp
         zI8jtEeipbptbYEWz1Hapo9NmL2Mpr+Qgquxs4bv8Ilo5/0b+P1mR6bfXccNCNtYbktS
         3D2w==
X-Gm-Message-State: APjAAAV+b0gKvPo7Wcgse3RVgPhocKCgsuTP7hu+kQHBnGVFnw7UDaK1
        4OgX323NcNH8LByT+tjqS735cVUd
X-Google-Smtp-Source: APXvYqyFpo7CEuhf16Pc62JvftaRUH07p/7YqCbIUO12gKJ/mVopvGJkkMVxCP7uEBQqsyIMIJ3Wpw==
X-Received: by 2002:adf:fac3:: with SMTP id a3mr4405178wrs.24.1569359405293;
        Tue, 24 Sep 2019 14:10:05 -0700 (PDT)
Received: from [192.168.1.19] (bfw157.neoplus.adsl.tpnet.pl. [83.28.60.157])
        by smtp.gmail.com with ESMTPSA id v64sm1531182wmf.12.2019.09.24.14.10.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 14:10:04 -0700 (PDT)
Subject: Re: [PATCH v7 3/5] leds: Add managed API to get a LED from a device
 driver
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-4-jjhiblot@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5b252fe0-8b9b-1f12-9915-4970f766d5d9@gmail.com>
Date:   Tue, 24 Sep 2019 23:10:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918145730.22805-4-jjhiblot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jean,

On 9/18/19 4:57 PM, Jean-Jacques Hiblot wrote:
> If the LED is acquired by a consumer device with devm_led_get(), it is
> automatically released when the device is detached.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/led-class.c | 51 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h     |  2 ++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 2b8f20f94128..e11177d77b4c 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -264,6 +264,57 @@ void led_put(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_put);
>  
> +static void devm_led_release(struct device *dev, void *res)
> +{
> +	struct led_classdev **p = res;
> +
> +	led_put(*p);
> +}
> +
> +/**
> + * devm_led_get - Resource-managed request of a LED device
> + * @dev:	LED consumer
> + * @idx:	index of the LED to obtain in the consumer
> + *
> + * The device node of the device is parse to find the request LED device.
> + * The LED device returned from this function is automatically released
> + * on driver detach.
> + *
> + * NOTE: At the moment, it supports only device-tree based LED lookup
> + *
> + * @return a pointer to a LED device or ERR_PTR(errno) on failure.
> + */
> +struct led_classdev *__must_check devm_led_get(struct device *dev,
> +					       int index)

s/devm_led_get/devm_of_led_get/

> +{
> +	struct led_classdev *led;
> +	struct led_classdev **dr;
> +
> +	if (!dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Not using device tree? */
> +	if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)
> +		return ERR_PTR(-ENOTSUPP);
> +
> +	led = of_led_get(dev->of_node, index);
> +	if (IS_ERR(led))
> +		return led;
> +
> +	dr = devres_alloc(devm_led_release, sizeof(struct led_classdev *),
> +			  GFP_KERNEL);
> +	if (!dr) {
> +		led_put(led);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	*dr = led;
> +	devres_add(dev, dr);
> +
> +	return led;
> +}
> +EXPORT_SYMBOL_GPL(devm_led_get);
> +
>  static int led_classdev_next_name(const char *init_name, char *name,
>  				  size_t len)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 6f7371bc7757..88bf2ceaabe6 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -199,6 +199,8 @@ extern void led_classdev_resume(struct led_classdev *led_cdev);
>  
>  extern struct led_classdev *of_led_get(struct device_node *np, int index);
>  extern void led_put(struct led_classdev *led_cdev);
> +struct led_classdev *__must_check devm_led_get(struct device *dev,
> +					       int index);
>  
>  /**
>   * led_blink_set - set blinking with software fallback
> 

-- 
Best regards,
Jacek Anaszewski
