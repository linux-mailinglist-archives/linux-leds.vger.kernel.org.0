Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569E92B9DAE
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 23:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgKSW3l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 17:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgKSW3k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 17:29:40 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC50C0613CF;
        Thu, 19 Nov 2020 14:29:40 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id a16so10193478ejj.5;
        Thu, 19 Nov 2020 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YE+NfLWS5nN0QpwMQoDKHvzm/h0QK+Pd5fMfxxvArlQ=;
        b=sJZ8PspcKQvHwdsuWkKA6BzPZ9GjaqKhwq99gFjNplm0+Qv1GtbjlG7kTfD9RPhgPN
         kWatUjM6i4M1JHZ1CVojXI+gG51faLdWhKHQ6iLZilY6OfKY3/WsekzgVWpPU+5i22lQ
         SvBwm24uppGA92+X5EB9YW/23or4D2XlSQjCA6HFuQJpk9Tf/OheMz/SAlo7JxjdWh95
         9pGTr4z+zIM/EEoAjnSVHDFdNL6wIacksV96CIQ/Q3tVODUXRDIUnKtie+1rtgSt0AXF
         LZbUWNPUaBO8bqwxuv8eDfZm2k5+fVsA8kfjfahqUudEHKQdT9X5B0lTJ/f/Ypowlbmx
         NLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YE+NfLWS5nN0QpwMQoDKHvzm/h0QK+Pd5fMfxxvArlQ=;
        b=U5wU+vemz1zrtQjvSk/hgnUNrvLotsYZyrogiSR66c1nYaHpBck9fpwrkAFH1SQJf0
         iQUWflzdbBNpo2Spg1qgGVPynwgjQ5NAoUoelULcVMUwYscMDJCkMCQuK0dsVXgEJHpX
         10enmHmL0SHvVeBJn4SbPRs1lIAYrofdzn6PHM+ziMCAxud5adb7db2zS9yOkPHP2h9s
         rY7vVwIf4ZohK0vW3UMqyqLtNhR5DOLZg71xLqg09nByUW/9Cs4fGXXYWnLKsF75SPI2
         8uUVkEzn42IXvstmGDb8q3SEvjk0TEgepk+UoPLRcAFRMSEK8+KJmKHwjAIc9N7FTU8M
         DC4w==
X-Gm-Message-State: AOAM533K41hQxtdu2PH5htPiqA6Wp7E80WL7Rby00pPQv6M03mCvvA/Q
        OMxTJZcW5J7sgSFMRS9zqco=
X-Google-Smtp-Source: ABdhPJw2rQ1fkucfU+GA3P4pJqvB9mWFBRySbizNIECPrFVzfhykidWs/IvGPgG7CDECBB9djxnpqg==
X-Received: by 2002:a17:906:c1c3:: with SMTP id bw3mr28934986ejb.126.1605824979191;
        Thu, 19 Nov 2020 14:29:39 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:5807:584b:19c8:e7be? ([2a01:110f:b59:fd00:5807:584b:19c8:e7be])
        by smtp.gmail.com with ESMTPSA id rn2sm400989ejb.94.2020.11.19.14.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 14:29:38 -0800 (PST)
Subject: Re: [PATCH v7 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
Date:   Thu, 19 Nov 2020 23:29:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 11/18/20 11:47 AM, Gene Chen wrote:
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
> index 21a3358..4f56c28 100644
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
> +	return -EINVAL;

s/-EINVAL/0/

The goal here is to assure that client will not fail when using no-op.

> +}
> +
> +static inline int led_classdev_flash_register(struct device *parent,
> +					   struct led_classdev_flash *fled_cdev)
> +{
> +	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}

This function should be placed after #ifdef block because its
shape is the same for both cases.

> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	return -EINVAL;

/-EINVAL/0/

Please do the same fix in all no-ops in the led-class-multicolor.h,
as we've discussed.

> +}
> +
> +static inline int devm_led_classdev_flash_register(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev)
> +{
> +	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}


This function should also be placed after #ifdef block.
Please make the same optimizations in the led-class-multicolor.h as you
are at it.

> +
> +void devm_led_classdev_flash_unregister(struct device *parent,

s/void/static inline void/

That's the reason why you got warning from buildbot.

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
