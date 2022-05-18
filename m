Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF44652C36A
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 21:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241845AbiERT3l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 15:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241829AbiERT3k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 15:29:40 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550B656FB7
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 12:29:38 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id k8so2252038qki.8
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 12:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VJGR3jFervlhdAZ0LsMougxZEVXTB1j+TJESr5Kc9To=;
        b=ZafCCLT/IqbzcKSdpYoQBUSXJdUoSbdBDyOHvXwvV+4r10KKUJ0aF58EEb7+srK/3o
         Dqzf7y6G1wHBaSCce5blcXSWVpQqcw90QSLRtXmrBnfllMSVyNyD2ANxYhX13pIR7y3z
         KQzf1GLelfP+opWEAZFeRE/av8qxcUgw54PB5NPjeUp182pLUM8s3A+/yG+0lVALvQp+
         3CNE5TE9xhkie305p+CzEVd+zTDtbAfAt5Nyb0QBGnkD2TuEQlrJPFttpfo/z5+C8+C+
         qfc8dDlP5aPb0W4F8+Pad8qvjAFf32F8fYUjgKSawovof96HGYNPVPvQSHJu+0sBTL2G
         vk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VJGR3jFervlhdAZ0LsMougxZEVXTB1j+TJESr5Kc9To=;
        b=jxRY5VUImfXNT4mQNQOJGMqZUydXCTU+DqM31dnqqZcTfyTTN7OdhgnAeqleuN5Igg
         V00qMtiJwOulewfN2RFCeUy6DwrX/SgB9ncSDps50DEv/hnBqHp4lAdBETF3qbTPmEw/
         ijMSVVrvPJe3XY3Z69VtCaSBfgAp6x/KcHr7wWVWlUYNok3cv2oQoLbQz2DatgcNurcH
         CYc59eANFlTH1nHxXgRqYZPOTQR5gHRrblZJHynUVuHpvK4RtWJiqa0RTbIh8EVgs5pl
         AzGP2V7s5kaL84K7Lvp45BJ7/0FBvyMnjYFE2jByOsRkukOPjflqF6I6eLC/R1mrgACg
         PIPA==
X-Gm-Message-State: AOAM530w2Pc9LWQAcbTnVF0UQNYKW1ppuOyXM2R02IM5RxuIf91B1VB7
        tyBF1bnRlPkKhowPPLQM0Nk=
X-Google-Smtp-Source: ABdhPJzBYwwgxjCtNXARrmNe/DZIFs2JZRWCY/LxlstnJHPrHRjO/RRJbWo0p1VUysqBVqg2c+2I5Q==
X-Received: by 2002:a05:620a:24cd:b0:6a0:414c:a648 with SMTP id m13-20020a05620a24cd00b006a0414ca648mr749082qkn.465.1652902177384;
        Wed, 18 May 2022 12:29:37 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id c15-20020ac85a8f000000b002f39b99f697sm38769qtc.49.2022.05.18.12.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 12:29:37 -0700 (PDT)
Message-ID: <76883915-8c7f-a14d-1a34-f41ed7899d62@gmail.com>
Date:   Wed, 18 May 2022 21:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] led: multicolor: Don't set brightness when blinking
Content-Language: en-US
To:     Sven Schwermer <sven@svenschwermer.de>, linux-leds@vger.kernel.org
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        schuchmann@schleissheimer.de, pavel@ucw.cz
References: <4f672091-07da-8815-a00f-659f5a478b0e@gmail.com>
 <20220518082216.160413-1-sven@svenschwermer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20220518082216.160413-1-sven@svenschwermer.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sven,

On 5/18/22 10:22, Sven Schwermer wrote:
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
> Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> ---
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

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
