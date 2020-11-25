Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B352C4767
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 19:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbgKYSQJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 13:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbgKYSQJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 13:16:09 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CE5C0613D4;
        Wed, 25 Nov 2020 10:16:09 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a65so3018525wme.1;
        Wed, 25 Nov 2020 10:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mb92urLVYSY+Uus96fOTjrBSsMQ8BjraUW9LyjqFTKM=;
        b=Airjt+mq6yinBpTpkaAmqB+3+WEfthrezYEJdl2u54Vl75bg/xv9jVbllYf6I7OOQP
         cIUY5JKHYkLS+uifQqZ+btoP9EXv1583HVdtYzC7g+Ze7At39yobgqNlYlMBz2eWcYGg
         ze3ZRQkk1W38sla7dbI2bs8/4pkONI62375f2bMZYdvZSSKzBCuNf1tpDOXLaPYAypeh
         vlWdjFvQrY/xkAFNsHR+Rabc5wKhaLillsVwCsPfMQzAfR14x7Pw6PJ+WQoNlnFZ+KVV
         RQPV+6iVEVoBi5KTCqCX9+qXFmGWoE/rlKBUxRSXiGFpIDxLONoVsi1T0NzUxZp7JgIp
         pnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mb92urLVYSY+Uus96fOTjrBSsMQ8BjraUW9LyjqFTKM=;
        b=JkyZOeJ1rByLkIU/M6PQqbTudE12ycKP79Bxs60PQWxYUBY80FwBG1ijYIc1x9ux4b
         bFrpQoyqrGs2/u7J9/dvHwHrBiADA0cI6StPoRFOFuKzelGZb2WbkTpZGJDCovG1WIqI
         /wSMQeITNcc9Xw9zcRfZKRcZp03wQPkds3vAn4tEIYIrKbo4gJ1a4Gcqw9Kas2tzxc1K
         Dy9/V02iYTxG1fkKyNMwzi0XlMtF09/Tje5/OK1utlIHVSE9l3oEFw0BP06Rswy4IJXr
         zMIQNgPgWmP5qCH0Ptaa81ec+1FFI2IYAk3XqcQzLMtt72NxfDK5m4mpv3op+3ZHcPFM
         eugw==
X-Gm-Message-State: AOAM531cpjFlOVQKJkDXYSweCQiIP3dpmlRH4jesKQgi7QL1ZY3LU8en
        KvXChERDx6uHy4M5JmfJfwo=
X-Google-Smtp-Source: ABdhPJyyG7VwLy9LuuPXSKLesJ2fb/BOioRR0i7p7g2pgb5kzYyNWEh9R8nWxx792TCUV3CFnGdmEQ==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr5426446wmc.156.1606328167869;
        Wed, 25 Nov 2020 10:16:07 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a410:510b:ab5:5694? ([2a01:110f:b59:fd00:a410:510b:ab5:5694])
        by smtp.gmail.com with ESMTPSA id t20sm5875506wmi.3.2020.11.25.10.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 10:16:07 -0800 (PST)
Subject: Re: [PATCH v8 2/6] leds: flash: Fix multicolor registration no-ops by
 return 0
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606301475-7030-3-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8ef9eee8-4f7b-6849-9151-210738e8fff6@gmail.com>
Date:   Wed, 25 Nov 2020 19:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606301475-7030-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

Thank you for the fix.

Would you mind fixing in the same patch also a duplication of
led_classdev_multicolor_register() and
devm_led_classdev_multicolor_register(), by moving them
outside of #ifdef block ?

They look identical for both CONFIG_LEDS_CLASS_MULTICOLOR states.

On 11/25/20 11:51 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Fix multicolor registration no-ops by return 0
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/linux/led-class-multicolor.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> index 5116f9a..dbf3832 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -83,7 +83,7 @@ static inline int led_classdev_multicolor_register_ext(struct device *parent,
>   					    struct led_classdev_mc *mcled_cdev,
>   					    struct led_init_data *init_data)
>   {
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   static inline int led_classdev_multicolor_register(struct device *parent,
> @@ -96,14 +96,14 @@ static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mc
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
>   }
>   
>   static inline int devm_led_classdev_multicolor_register(struct device *parent,
> 

-- 
Best regards,
Jacek Anaszewski
