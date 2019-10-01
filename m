Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B80F3C4223
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 22:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfJAU5d (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 16:57:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37447 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfJAU5d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 16:57:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id i1so17150141wro.4;
        Tue, 01 Oct 2019 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6K0BgybaIwdQcRegZiT245oB9aM0Btf5iTUMsVK0Xqg=;
        b=JMZ6RjUdaf6u9zW1D2AwU0gC37RfgxB4o7A3IXiPXzUoU0a+L/tizOV6cR78ZDPy8+
         mfI3X3Z0AKwqhR8f0KkBQHcnQpbA4R0TuP/VfKCuZdUCnWsMQLk/m5sxHDaEKC+vUI0+
         8XSVMnxUT7P6Qxs5VbAAysXwU64YF0CE2Qu5MwcXGNmyRsVKDyKPxGCoawz8AAOnoBx0
         J7FL5DJlKa/rQBJD1G86Kan55MLQHbXWTdFVS5taGL/pxRh8riV7m2ASl2FN3DOZczCo
         /7iwhvrJW4omuKHNJCpZfRVH2DpF3eIYEStty5neNzUwH4ohstM2aWo8FALwIFrOTkBt
         padQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6K0BgybaIwdQcRegZiT245oB9aM0Btf5iTUMsVK0Xqg=;
        b=UwKXz3WGzomjNDbFUoF28W5v6mySc2dSxBSORjgDugVaOGeHpKO64zdU1LdDuN72D0
         P5we2GQfaIvLXD/Gnx9J/MxoT/or8IK+cbPKKKkA7mLwljGFRgis+UWCbFD+Y/DZ4Rvt
         q4M2/4dwPEJNPsiGpt+5wx4mfy80dXRCDM1BLnKbX4C2PzEbap+cXuCRJlb9dynSeQZb
         ef6TRdkvRGWrKA1OypdMUQgzvULFSokbRk/5fYjC83PfIET60Yvwzd4CvsGoH3+mHT+U
         8CyytU0l8tKYjerdLkuXlsICGNB7AFvFE3gEUB4IpopOskkhHbX6FknmiJK7hBEuEeDA
         GdLA==
X-Gm-Message-State: APjAAAXVaL8carmhtxCENA5r/IM5yAvCSRkxI5EK5yVz7dOWsHYHvDXY
        qcUEqRzRLYb1a9ZMk0IMZaQyw6I+
X-Google-Smtp-Source: APXvYqz5OcjjV5XcxwShlkP2vt0zoWVtPClNLiy9p0bVlrM2djdsLPaA7nDxc/g7ezBITGhnjow1+w==
X-Received: by 2002:adf:e94f:: with SMTP id m15mr19311958wrn.225.1569963450131;
        Tue, 01 Oct 2019 13:57:30 -0700 (PDT)
Received: from [192.168.1.19] (bgt101.neoplus.adsl.tpnet.pl. [83.28.83.101])
        by smtp.gmail.com with ESMTPSA id t6sm7032484wmf.8.2019.10.01.13.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 13:57:29 -0700 (PDT)
Subject: Re: [PATCH 3/5] leds: flash: Remove extern from the header file
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191001180439.8312-1-dmurphy@ti.com>
 <20191001180439.8312-3-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a6601fe9-0723-baec-d610-aafe7731c80d@gmail.com>
Date:   Tue, 1 Oct 2019 22:57:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001180439.8312-3-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

Thank you for the patch.

Could we have similar patch for leds.h when we are at it,
if you wouldn't mind?

-- 
Best regards,
Jacek Anaszewski

On 10/1/19 8:04 PM, Dan Murphy wrote:
> extern is implied and is not needed in the header file.
> Remove the extern keyword and re-align the code.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  include/linux/led-class-flash.h | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
> index 7ff287a9e2a2..1bd83159fa4c 100644
> --- a/include/linux/led-class-flash.h
> +++ b/include/linux/led-class-flash.h
> @@ -94,12 +94,12 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
>   *
>   * Returns: 0 on success or negative error value on failure
>   */
> -extern int led_classdev_flash_register_ext(struct device *parent,
> -					struct led_classdev_flash *fled_cdev,
> -					struct led_init_data *init_data);
> +int led_classdev_flash_register_ext(struct device *parent,
> +				    struct led_classdev_flash *fled_cdev,
> +				    struct led_init_data *init_data);
>  
>  static inline int led_classdev_flash_register(struct device *parent,
> -					struct led_classdev_flash *fled_cdev)
> +					   struct led_classdev_flash *fled_cdev)
>  {
>  	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
>  }
> @@ -111,7 +111,7 @@ static inline int led_classdev_flash_register(struct device *parent,
>   *
>   * Unregister a previously registered via led_classdev_flash_register object
>   */
> -extern void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev);
> +void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev);
>  
>  /**
>   * led_set_flash_strobe - setup flash strobe
> @@ -159,8 +159,8 @@ static inline int led_get_flash_strobe(struct led_classdev_flash *fled_cdev,
>   *
>   * Returns: 0 on success or negative error value on failure
>   */
> -extern int led_set_flash_brightness(struct led_classdev_flash *fled_cdev,
> -					u32 brightness);
> +int led_set_flash_brightness(struct led_classdev_flash *fled_cdev,
> +			     u32 brightness);
>  
>  /**
>   * led_update_flash_brightness - update flash LED brightness
> @@ -171,7 +171,7 @@ extern int led_set_flash_brightness(struct led_classdev_flash *fled_cdev,
>   *
>   * Returns: 0 on success or negative error value on failure
>   */
> -extern int led_update_flash_brightness(struct led_classdev_flash *fled_cdev);
> +int led_update_flash_brightness(struct led_classdev_flash *fled_cdev);
>  
>  /**
>   * led_set_flash_timeout - set flash LED timeout
> @@ -182,8 +182,7 @@ extern int led_update_flash_brightness(struct led_classdev_flash *fled_cdev);
>   *
>   * Returns: 0 on success or negative error value on failure
>   */
> -extern int led_set_flash_timeout(struct led_classdev_flash *fled_cdev,
> -					u32 timeout);
> +int led_set_flash_timeout(struct led_classdev_flash *fled_cdev, u32 timeout);
>  
>  /**
>   * led_get_flash_fault - get the flash LED fault
> @@ -194,7 +193,6 @@ extern int led_set_flash_timeout(struct led_classdev_flash *fled_cdev,
>   *
>   * Returns: 0 on success or negative error value on failure
>   */
> -extern int led_get_flash_fault(struct led_classdev_flash *fled_cdev,
> -					u32 *fault);
> +int led_get_flash_fault(struct led_classdev_flash *fled_cdev, u32 *fault);
>  
>  #endif	/* __LINUX_FLASH_LEDS_H_INCLUDED */
> 
