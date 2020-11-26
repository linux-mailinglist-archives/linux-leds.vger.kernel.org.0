Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF002C5BC4
	for <lists+linux-leds@lfdr.de>; Thu, 26 Nov 2020 19:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404982AbgKZSML (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 13:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404714AbgKZSMK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 13:12:10 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED24C0613D4;
        Thu, 26 Nov 2020 10:12:10 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id mc24so4131635ejb.6;
        Thu, 26 Nov 2020 10:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wsJA7uvFveswa9oa5q3BcYpK4K/UQQ/hYMCGdNw27k8=;
        b=lslK+q38pDdMlxGUEhEznkii9b8maWWgwbU5TwxISoune0MT9dCOdR02fWKFWJewx6
         q1yusoV/9yMn8cJRB6poWERcHt8hbtrJfY7a8h2ypDp7wi9ywuZQmRASXhiCZTJ8eT6D
         xPJGXqcFB+jwRgv5fn1hbge4+tpARnReECQuN6qg0SVgh55jIudx2w11JwD0b6r2x4UU
         N5LxH2sYl6qwUrwYAY6hWt6tB4DkDUuTshDzTmJP6ntuCX4kT3yf53JjAKU7tqC1qe12
         7COZxJie9bwANr3D1O49YBCQqIFXACaW9/QJ37eQUmUE5rRayBhtwMNf5CBbwi11qpuX
         i9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wsJA7uvFveswa9oa5q3BcYpK4K/UQQ/hYMCGdNw27k8=;
        b=hQsXDYm4lxmi7XxUtsaOyYvEuUN451CgoN04sjCl1rfDXVfNuTnaQYGM1+yLAnpsIB
         OoqVBdQNS49oR0H+OmfNun2gnAqTdJ9GoyinS8hXJjFmPzA2AvcLvvrA//liMil74AWW
         UyA700qNnM0tInd4sX/LdsLY3RVgrAXTNnboA2Y6jwfrACQHooqrHvBV0Eez7emeqaUK
         7Sg0GBPC9FMoyKs/wkMD3JAuJPCVMoxO6addOtyUvepfzC1OwR0kmQ4A8PmYRUJGFrdW
         wx7Hh7eTazQKnQJ+NUWPCEFWWhuf5qJrtLYTYJoJ392IH8fGyfK9QaEvWf+RDy0uo3Jz
         A54g==
X-Gm-Message-State: AOAM530nGDDr8Q8TCG4TEgnUlM50SOAmg2S+meQbIZ10bFcv/KPNz5io
        9M2NOqXhLPW6xZxtIA6LFGA=
X-Google-Smtp-Source: ABdhPJxhQJAv2dJNegQkCi94M7mKoKOAd4Um4aSooo7QneCsYcM5iHfBsQB1N5l/Q5REF/8SJ+/NuA==
X-Received: by 2002:a17:906:8c7:: with SMTP id o7mr3970705eje.413.1606414329295;
        Thu, 26 Nov 2020 10:12:09 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:385b:d58:7bd:b2fd? ([2a01:110f:b59:fd00:385b:d58:7bd:b2fd])
        by smtp.gmail.com with ESMTPSA id k2sm3475826ejp.6.2020.11.26.10.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 10:12:08 -0800 (PST)
Subject: Re: [PATCH v9 1/6] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606390654-6075-2-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <2cfb1dce-8789-8c31-1c5a-873abe896418@gmail.com>
Date:   Thu, 26 Nov 2020 19:12:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606390654-6075-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

Thank you for addressing my remarks.

On 11/26/20 12:37 PM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/linux/led-class-flash.h | 42 ++++++++++++++++++++++++++++++++---------
>   1 file changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
> index 21a3358..612b4ca 100644
> --- a/include/linux/led-class-flash.h
> +++ b/include/linux/led-class-flash.h
> @@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
>   	return container_of(lcdev, struct led_classdev_flash, led_cdev);
>   }
>   
> +#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
>   /**
>    * led_classdev_flash_register_ext - register a new object of LED class with
>    *				     init data and with support for flash LEDs
> @@ -98,12 +99,6 @@ int led_classdev_flash_register_ext(struct device *parent,
>   				    struct led_classdev_flash *fled_cdev,
>   				    struct led_init_data *init_data);
>   
> -static inline int led_classdev_flash_register(struct device *parent,
> -					   struct led_classdev_flash *fled_cdev)
> -{
> -	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> -}
> -
>   /**
>    * led_classdev_flash_unregister - unregisters an object of led_classdev class
>    *				   with support for flash LEDs
> @@ -118,15 +113,44 @@ int devm_led_classdev_flash_register_ext(struct device *parent,
>   				     struct led_init_data *init_data);
>   
>   
> +void devm_led_classdev_flash_unregister(struct device *parent,
> +					struct led_classdev_flash *fled_cdev);
> +
> +#else
> +
> +static inline int led_classdev_flash_register_ext(struct device *parent,
> +				    struct led_classdev_flash *fled_cdev,
> +				    struct led_init_data *init_data)
> +{
> +	return 0;
> +}
> +
> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	return 0;
> +}
> +
> +static inline void devm_led_classdev_flash_unregister(struct device *parent,
> +					struct led_classdev_flash *fled_cdev)
> +{};
> +
> +#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
> +
> +static inline int led_classdev_flash_register(struct device *parent,
> +					   struct led_classdev_flash *fled_cdev)
> +{
> +	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}
> +
>   static inline int devm_led_classdev_flash_register(struct device *parent,
>   				     struct led_classdev_flash *fled_cdev)
>   {
>   	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
>   }
>   
> -void devm_led_classdev_flash_unregister(struct device *parent,
> -					struct led_classdev_flash *fled_cdev);
> -
>   /**
>    * led_set_flash_strobe - setup flash strobe
>    * @fled_cdev: the flash LED to set strobe on
> 

It would be good if patch description mentioned also moving the
functions outside of #ifdef block.

With that:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
