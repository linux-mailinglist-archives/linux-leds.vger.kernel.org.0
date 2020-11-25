Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8808C2C475C
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 19:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732391AbgKYSPj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 13:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbgKYSPj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 13:15:39 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E8DC0613D4;
        Wed, 25 Nov 2020 10:15:38 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id l1so2815369wrb.9;
        Wed, 25 Nov 2020 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cxDV/cJpIfcx9YO7YSoPmjZvWF3a1aMv7vyPqRw+nys=;
        b=Z1ITS4HEGGlN44kxO/mL0CCOmvDCCv4Vhdb3eLCCji8LCUdYLutVT5azV2xAhboLT3
         /78QMKmJtgZk7NiPxo9MPnufc3Fztepx9rnU8kxVMu5REmrL5750IDNyXDpkubW+yDcw
         xS1Fmo7qvONYFsoY8cTUdTs6PtBlOzAOMFUmGf86cULQweiLCRd2canys0jeLXsYCOE2
         B8+QF1Rn2W0J52u5dUrE8bfCh4bssT886l5v0IrBQbhi94KYGr2hZ/J14TF9ZINCp5jB
         nPV6wbepj5J4EzsnoQip8UAxRxNDUdQRTeOyLzRAhrooshahRLtwlX7tzy7bUMoR/7HD
         dq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cxDV/cJpIfcx9YO7YSoPmjZvWF3a1aMv7vyPqRw+nys=;
        b=Byb0GH254xwq8oVQdYAy8bFMl38t79fcvmwpxtn6X1xi23VIDsLnlbi7AfiBagK9Xg
         LobE6hUvrJCGJD+WX5nOYWFKauRXZ8iAC+9D4lv5Ihj+ba6y/I+QXJTNOUJj0U59dHvN
         gYaDZJzxHzr8iZRGfSiMhA4FMOyhMEPC9HdEpkOj41XCaUyeA0W6DVXU9/e11kBip0MT
         qm7CGU6gJccojOCOXPHrGviFP3W9v1SFfc/giDMN+x7nImDoZD1rzCk94z8B0hI1FIlV
         YRDgT9fLijRDhEXqtdvu6q2Q7GO1hI1njBzbGvV+8ClfATPNXXvXN3weIyFEccpyyr7P
         aZzA==
X-Gm-Message-State: AOAM5324u98k3LU+tC4s80qZ4PQxCbA5S1ZzFb+hKMZA6UsEiNOIpgK8
        shUlyJLG8bYmpaYsb7mftRQ=
X-Google-Smtp-Source: ABdhPJwH143DPR/m8Ye15E/IMHSzxYoFs35JplLGyBmM4CvNLf+S+vQZyZHTh8os+pO9uvboH1qnlw==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr5416545wrj.328.1606328137508;
        Wed, 25 Nov 2020 10:15:37 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a410:510b:ab5:5694? ([2a01:110f:b59:fd00:a410:510b:ab5:5694])
        by smtp.gmail.com with ESMTPSA id c9sm5412252wrp.73.2020.11.25.10.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 10:15:36 -0800 (PST)
Subject: Re: [PATCH v8 1/6] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606301475-7030-2-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <da86a941-2752-fd25-a74f-e22b3e82357e@gmail.com>
Date:   Wed, 25 Nov 2020 19:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606301475-7030-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 11/25/20 11:51 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/linux/led-class-flash.h | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
> index 21a3358..5f36eae 100644
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
> @@ -127,6 +128,41 @@ static inline int devm_led_classdev_flash_register(struct device *parent,
>   void devm_led_classdev_flash_unregister(struct device *parent,
>   					struct led_classdev_flash *fled_cdev);
>   
> +#else
> +
> +static inline int led_classdev_flash_register_ext(struct device *parent,
> +				    struct led_classdev_flash *fled_cdev,
> +				    struct led_init_data *init_data)
> +{
> +	return 0;
> +}
> +
> +static inline int led_classdev_flash_register(struct device *parent,
> +					   struct led_classdev_flash *fled_cdev)
> +{
> +	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}

This function can be placed after #ifdef block - now it is in two copies
in this file.

> +
> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	return 0;
> +}
> +
> +static inline int devm_led_classdev_flash_register(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev)
> +{
> +	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}

Ditto.

> +static inline void devm_led_classdev_flash_unregister(struct device *parent,
> +					struct led_classdev_flash *fled_cdev)
> +{};
> +
> +#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
> +
>   /**
>    * led_set_flash_strobe - setup flash strobe
>    * @fled_cdev: the flash LED to set strobe on
> 

-- 
Best regards,
Jacek Anaszewski
