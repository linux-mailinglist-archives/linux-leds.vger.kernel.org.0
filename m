Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DFB6C526D
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 18:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjCVRZ5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 13:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCVRZ4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 13:25:56 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E351B569
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:25:54 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r11so76002452edd.5
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679505952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZVN8kTsmG1MUKyM3LGC2q7iQqGNNstHIUGJ7IH0tlw=;
        b=fc0UBOIjYT1axmHLltndePOXFDaAZp4/XTn0U6o+DLRcyVh6JrmVN8l3ACCiM2XvvZ
         Qx5qkpcqAOoEeAuUO/DchiqpTArhoTLsv+gk2XmrBfdCNuHOPjJDSl0W6KpRfrUjncOi
         siqYn+yZeLIz/CERhTsu8S0+2GU51AvB1Hsq8l2ZWIlwxVq2sVfP1qzzDKUvZzceS2gX
         D4IHNgCena8FYidILSTBpsDcIHm4AF0zoiGcgjPyKkgSYIcFSB832s8TBkMgj/iS5hJ9
         Qk/g6eGL58ISYpOnwzrJAOy5DqjuijFb0jqEailL4Fx0DfRTjVRWuLhb3ZAAERL8lViQ
         7Msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZVN8kTsmG1MUKyM3LGC2q7iQqGNNstHIUGJ7IH0tlw=;
        b=QSXTyLBEuel4Cxp8lu1RPjZ3sCrZVOnA+0Z0/843oJg6jXRdC1PFbzo4t+kLojRUVe
         ytaldhV39FPGeQOg9gauzBzMD+2pbWUSOAH8Ee2dQuJL8WN2OeMpDzybkMhVyYMX5ZY4
         tMGUNiWWLjABKDhzu8fxMU9IcETuUhx77FRgSYEyFuZOdLgwphpubFziVvw61DN5bfN5
         wILCP/50MgG3zNP+WuDMLZBneZ9NUyS25+H1EJGQ0nhpfiSJDovjGBFsBAVv557DXp+z
         IlaOxTX/9RT4KFlYyV2/DzXVgODrCyBRJNd7TZLuWXjPhsHZm8y56/eFQr1/O3VIv72q
         BtUA==
X-Gm-Message-State: AO0yUKV/CDYYbbNIiilyumccAx5G+ZAD1nBQwaYd5VWwrcmzpVPQBc/8
        xdTyvV6/FcTbRCzQfChXouXzysndIFU=
X-Google-Smtp-Source: AK7set9tIW/ASVcZnXKVcJGLL3RLkBtqzqKezTPb1d/C2dkTNBc6T4cUmLC1SUvXHzF/+yJO1gc79w==
X-Received: by 2002:a17:906:2a93:b0:932:5b67:6dee with SMTP id l19-20020a1709062a9300b009325b676deemr2897630eje.27.1679505952543;
        Wed, 22 Mar 2023 10:25:52 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id m14-20020a1709061ece00b008b980c3e013sm7630062ejj.179.2023.03.22.10.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:25:52 -0700 (PDT)
Message-ID: <e22ec795-8e14-7bd2-0c52-b2f53524e821@gmail.com>
Date:   Wed, 22 Mar 2023 18:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v2] led: multicolor: Fix intensity setting while SW
 blinking
To:     linux-leds@vger.kernel.org, Lee Jones <lee.jones@kernel.org>
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        schuchmann@schleissheimer.de, pavel@ucw.cz
References: <20220627133110.271455-1-sven@svenschwermer.de>
Content-Language: en-US
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20220627133110.271455-1-sven@svenschwermer.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

I've recently recalled this patch that was ready to apply.
Would you mind to take a look?

On 6/27/22 15:31, Sven Schwermer wrote:
> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> 
> When writing to the multi_intensity file, don't unconditionally call
> led_set_brightness. By only doing this if blinking is inactive we
> prevent blinking from stopping if the blinking is in its off phase while
> the file is written.
> 
> Instead, if blinking is active, the changed intensity values are applied
> upon the next blink. This is consistent with changing the brightness on
> monochrome LEDs with active blinking.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> ---
> 
> Notes:
>      V1->V2: Change title, add tags
> 
>   drivers/leds/led-class-multicolor.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> index e317408583df..5b1479b5d32c 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device *dev,
>   	for (i = 0; i < mcled_cdev->num_colors; i++)
>   		mcled_cdev->subled_info[i].intensity = intensity_value[i];
>   
> -	led_set_brightness(led_cdev, led_cdev->brightness);
> +	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
> +		led_set_brightness(led_cdev, led_cdev->brightness);
>   	ret = size;
>   err_out:
>   	mutex_unlock(&led_cdev->led_access);
> 
> base-commit: 210e04ff768142b96452030c4c2627512b30ad95

-- 
Best regards,
Jacek Anaszewski
