Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16311B916D
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2020 18:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgDZQHg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 Apr 2020 12:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725778AbgDZQHg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 26 Apr 2020 12:07:36 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1B8C061A0F;
        Sun, 26 Apr 2020 09:07:35 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r26so17545056wmh.0;
        Sun, 26 Apr 2020 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z46jKueF8apft1rykN4CZSqYJRnUDAIwCvJSBs+4w9c=;
        b=UNfbk6ksCqtl9x14pfIyUFu/6dyc/ftwvOJWHJIsk2qjkH8ez3UpillV6ZFS97/8D6
         iL6ZJ5DrG+yPA0omZF2dmRkev8o914YHTqGWCbW9HXBQ5ujKnJy04jfgw98a3VQa16dZ
         BWYvSs36x2De6nWOE2bKEq81zZBcoN1q27RsdRU65B2bLMA2o0N+jqP7A1tDMuTLg5Y8
         d2On1PG8/rhe8+Ltda0EH/BlEAFjS1yp02Esv/yBdep3N2KckvZwz/FqwAE89DlLQDo/
         hR5GuYQu8OzsePq0fui9yBmC0vIDdmzTm1L7JmQH3kNtQcrH7c1h5gKYu8jw+RiIel9M
         LPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z46jKueF8apft1rykN4CZSqYJRnUDAIwCvJSBs+4w9c=;
        b=dw72+xcj63qWznIKiJIMH2jFvvR7umG1murRyTWzfX6wM0xeqFstyAWjYuX2fik5my
         p9700O+JZJ5Ao6bR1xgio2Y3jGYzfWw+geHMLGZZvWvEepPAtZyXcxFZIgGQziXtRAFI
         CDlUsznDHZibqtXaMTmlsmfQeren/mwpjBSGtS5X1sUHsmUwSN0AaE7LlVy6KstUyLNy
         WNrQCSPRBNlEeXYEehJ6J6GWijbOa+JHqXmceHNPdwVUI6FhGf7r9GqBjUnurzvlT9Ac
         rmJzujUCJw0ebj4JYyFDnhhukIPeCfOlk+QClB1UNRUlpzQA9Nm50GYsoP+ldP9C9/cm
         v6FA==
X-Gm-Message-State: AGi0Pua5+AVaKjQsoQINhPz4Gd1C7gqT85bMY/vPymgUPhsuOJEWr7Vv
        YVnwgiSsWDNaofKB3nzO3fw7D49A
X-Google-Smtp-Source: APiQypKAd+JPL+aRE/uAR++T3XOU/Xa9B6yjPMdB0ygN9EAAwu5YVAC0xw1lV4b7/ytIdjIMXwb7oQ==
X-Received: by 2002:a05:600c:4401:: with SMTP id u1mr21113074wmn.31.1587917254426;
        Sun, 26 Apr 2020 09:07:34 -0700 (PDT)
Received: from [192.168.1.23] (afcl109.neoplus.adsl.tpnet.pl. [95.49.63.109])
        by smtp.gmail.com with ESMTPSA id p190sm11870398wmp.38.2020.04.26.09.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 09:07:33 -0700 (PDT)
Subject: Re: [PATCH v20 12/17] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-13-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <24aa265c-46ca-1643-7781-9ddbf734405b@gmail.com>
Date:   Sun, 26 Apr 2020 18:07:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423155524.13971-13-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

One nit below.

On 4/23/20 5:55 PM, Dan Murphy wrote:
> Add multicolor framework support for the lp55xx family.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/Kconfig                      |   1 +
>   drivers/leds/leds-lp5521.c                |  14 +-
>   drivers/leds/leds-lp5523.c                |  14 +-
>   drivers/leds/leds-lp5562.c                |  13 +-
>   drivers/leds/leds-lp55xx-common.c         | 178 +++++++++++++++++++---
>   drivers/leds/leds-lp55xx-common.h         |  11 +-
>   drivers/leds/leds-lp8501.c                |  14 +-
>   include/linux/platform_data/leds-lp55xx.h |   8 +
>   8 files changed, 207 insertions(+), 46 deletions(-)
> 
[...]
> diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
> index b9b1041e8143..a9d7ba3f2fd1 100644
> --- a/drivers/leds/leds-lp55xx-common.h
> +++ b/drivers/leds/leds-lp55xx-common.h
> @@ -12,6 +12,8 @@
>   #ifndef _LEDS_LP55XX_COMMON_H
>   #define _LEDS_LP55XX_COMMON_H
>   
> +#include <linux/led-class-multicolor.h>
> +
>   enum lp55xx_engine_index {
>   	LP55XX_ENGINE_INVALID,
>   	LP55XX_ENGINE_1,
> @@ -109,6 +111,9 @@ struct lp55xx_device_config {
>   	/* access brightness register */
>   	int (*brightness_fn)(struct lp55xx_led *led);
>   
> +	/* perform brightness value to multiple LEDs */
> +	int (*multicolor_brightness_fn)(struct lp55xx_led *led);

Isn't some word missing here? IMO it should be rephrased.
Maybe "write multi color brightness to hw" ?

>   	/* current setting function */
>   	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
>   
[...]
-- 
Best regards,
Jacek Anaszewski
