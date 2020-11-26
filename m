Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D672C5BC7
	for <lists+linux-leds@lfdr.de>; Thu, 26 Nov 2020 19:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404997AbgKZSOT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 13:14:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404838AbgKZSOS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 13:14:18 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D25C0613D4;
        Thu, 26 Nov 2020 10:14:18 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id o9so4175670ejg.1;
        Thu, 26 Nov 2020 10:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OHU0uLzKqhNntOb28JbWE0OII+Zx2F3KXLp7TJVHtuo=;
        b=XkM536phVMS/RzN86F8NayUyKPl+kGO+uJ7r9Eg7eQ1KefDMEsAmQtgCDJI2DtKBvO
         Vvm8yNuRDT7V8jQI/aTEeUstjkJWe5zu7DDta3twqJYhu8eD5GA3WmEmF2Fnfx1k6SMP
         jZhrdO3PW2hOMU/QJ+ooP0o838zysu+SayEA3ub1LMA6AwvecumtVtgjf0TmtmSMQY8Y
         He7RID2qPisEQN3Ck9UJFMtn8Gb66WREYAdh0LhA0/YqOSrMqx3Blttwnc+Eo90/1C8X
         BLDvnhUeDVCoutu4u2ljnyR5z0t5t5QWyKloswMeDWSojcfCwoJuvrKVfE0rjax1e+pR
         pN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OHU0uLzKqhNntOb28JbWE0OII+Zx2F3KXLp7TJVHtuo=;
        b=N4aBVKhpqKSAp1RiFRG87PHMFyffEFSrcMeh50NTrgTNBoimTfw8hdRxcqz6BQGnwg
         N0lms3f+X9BAQCeRJO0tOThbDdH27boTGOEjLws4da1CWYfok5LIZDaJVLmSyJ+HPkKL
         /4tTXRjhoqz6VjeDVrm4JXHmPvOnsvNqAi3WI1SobVci9TV+pqqMiT/ohbXR3TdEvak0
         ZF1hCDE7OJl6/hrUh0pxr9UnkR/WkaseHhsgdxtNod+ik/QZI4XMBYgQBTfjDPTUjP+c
         r9WS1QK2AM3HDOpfEdX4oRVVmNHTuLrIAe0M6Y/0dgzlzTb4HQnfZ91Pw3Q8qOE3oeYJ
         NTLg==
X-Gm-Message-State: AOAM533R5a2NjbWNWsoEvckSBaIooboheDtrYzGmMTOl36c5PFqcJM/t
        dncQkvwvtEfdM/tiC8hH06s=
X-Google-Smtp-Source: ABdhPJx/D90d3j/kCctxkpSSPxh6BbcL3xpffD4VqilAJKpHEqYCXGYSuU5aDNZktUmtzDmN+2BtDw==
X-Received: by 2002:a17:906:5c43:: with SMTP id c3mr4051769ejr.390.1606414457299;
        Thu, 26 Nov 2020 10:14:17 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:385b:d58:7bd:b2fd? ([2a01:110f:b59:fd00:385b:d58:7bd:b2fd])
        by smtp.gmail.com with ESMTPSA id h9sm3540346ejk.118.2020.11.26.10.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 10:14:16 -0800 (PST)
Subject: Re: [PATCH v9 2/6] leds: flash: Fix multicolor registration no-ops by
 return 0
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606390654-6075-3-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a4670d78-18c9-37e5-d984-5aab1a5635f1@gmail.com>
Date:   Thu, 26 Nov 2020 19:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606390654-6075-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 11/26/20 12:37 PM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Fix multicolor registration no-ops by return 0
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/linux/led-class-multicolor.h | 42 +++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 27 deletions(-)
> 
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> index 5116f9a..210d57b 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -44,12 +44,6 @@ int led_classdev_multicolor_register_ext(struct device *parent,
>   					    struct led_classdev_mc *mcled_cdev,
>   					    struct led_init_data *init_data);
>   
> -static inline int led_classdev_multicolor_register(struct device *parent,
> -					    struct led_classdev_mc *mcled_cdev)
> -{
> -	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
> -}
> -
>   /**
>    * led_classdev_multicolor_unregister - unregisters an object of led_classdev
>    *					class with support for multicolor LEDs
> @@ -68,13 +62,6 @@ int devm_led_classdev_multicolor_register_ext(struct device *parent,
>   					  struct led_classdev_mc *mcled_cdev,
>   					  struct led_init_data *init_data);
>   
> -static inline int devm_led_classdev_multicolor_register(struct device *parent,
> -				     struct led_classdev_mc *mcled_cdev)
> -{
> -	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
> -							 NULL);
> -}
> -
>   void devm_led_classdev_multicolor_unregister(struct device *parent,
>   					    struct led_classdev_mc *mcled_cdev);
>   #else
> @@ -83,27 +70,33 @@ static inline int led_classdev_multicolor_register_ext(struct device *parent,
>   					    struct led_classdev_mc *mcled_cdev,
>   					    struct led_init_data *init_data)
>   {
> -	return -EINVAL;
> -}
> -
> -static inline int led_classdev_multicolor_register(struct device *parent,
> -					    struct led_classdev_mc *mcled_cdev)
> -{
> -	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
> +	return 0;
>   }
>   
>   static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev) {};
>   static inline int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   					       enum led_brightness brightness)
>   {
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   static inline int devm_led_classdev_multicolor_register_ext(struct device *parent,
>   					  struct led_classdev_mc *mcled_cdev,
>   					  struct led_init_data *init_data)
>   {
> -	return -EINVAL;
> +	return 0;
> +}
> +
> +static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev)
> +{};
> +
> +#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
> +
> +static inline int led_classdev_multicolor_register(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev)
> +{
> +	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
>   }
>   
>   static inline int devm_led_classdev_multicolor_register(struct device *parent,
> @@ -113,9 +106,4 @@ static inline int devm_led_classdev_multicolor_register(struct device *parent,
>   							 NULL);
>   }
>   
> -static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
> -					    struct led_classdev_mc *mcled_cdev)
> -{};
> -
> -#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
>   #endif	/* _LINUX_MULTICOLOR_LEDS_H_INCLUDED */
> 

Here the same comment as for the patch 1/6.

With that:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
