Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E826F6E6BA3
	for <lists+linux-leds@lfdr.de>; Tue, 18 Apr 2023 20:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjDRSCX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Apr 2023 14:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbjDRSCW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Apr 2023 14:02:22 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5A7E7B
        for <linux-leds@vger.kernel.org>; Tue, 18 Apr 2023 11:02:20 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a8ba693f69so20897261fa.0
        for <linux-leds@vger.kernel.org>; Tue, 18 Apr 2023 11:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681840938; x=1684432938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=npn7Sq8OLMyP3fAd9LhJmOx5oy0kbOXWyx1pGbeyKtc=;
        b=HIB5yfETeiJIItqQ85+Q8VkAJXK4kR5SQlV2YP4ME6rlvG9EJTKKedo0hAAMBKnj1O
         B1ch7I67OJ73+L/Yb2mMwq2bAqseIMG3TqOGWUZRQguDDqqo2gkLHgBuLNDo1VF6bKYJ
         +DFveI/WcdxWGPUK253v/hdejOuzZNaLTVIcXX1RMMozBeLDx1faSWqD+JSjrs0cmuac
         p30eFnb7swFHNF+PIYMkN9S4dt/abIV+gx9aYxOfO2TistX9rRREuOLvFcRNUlI2K4Zc
         e8cOe/h/F41wp4qlHHUkNbZmxzvXHGsGiNx44krRHqlspHtAnGcw1eE/cHUoRaKU1dKK
         KMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681840938; x=1684432938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npn7Sq8OLMyP3fAd9LhJmOx5oy0kbOXWyx1pGbeyKtc=;
        b=cKqic7r4/mKEeLhefEmx0kJPLmgCv3UdSosWoI6EA/jt4ZkyllqhGxi9zyAAMYanZE
         NyMb7pDSoOabkhKpNhKXmZLgqVHrPYyByUXP8t1f4oL7U4hPv9keY1tlIbnY06Yr1WIt
         F1v8WhqtMeOJiYpL/+8sidfv2rXAk0LBzF4BFXJWG07EXkEBmxEEiqaxAsFDHv1Oxhii
         bznErx/LDxqKmO53lrXsnN9qWeolNMogc6vE6op3AJ1oRqnJ3Soz5tX8kbPX1+JVh0Og
         XRkKl4q6GcmjE/ANnpPuH1rSUtAhp9IySIOhJ2/aEBSCI5MrARwCocv8uq3xI+313T60
         i73g==
X-Gm-Message-State: AAQBX9eEO3/+BYiWpW6wrFqWEgYWKQlNkMkt5J5YMMdqpTDULa8bfAzz
        PTRJD+KnIESNVqMzyDiI4dHjv/Rc/7w=
X-Google-Smtp-Source: AKy350bPrih+oKrVYu0DUOlN3YFAeflEGylIH+2GCjfdEqDjk08BQZK9o1dS6yzAFtDzbzprB3+ziQ==
X-Received: by 2002:a19:5518:0:b0:4ec:8362:1880 with SMTP id n24-20020a195518000000b004ec83621880mr3559182lfe.48.1681840938170;
        Tue, 18 Apr 2023 11:02:18 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id u9-20020ac25189000000b004ec89319b03sm2442759lfi.211.2023.04.18.11.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 11:02:17 -0700 (PDT)
Message-ID: <3589aa0c-bea7-f637-8bb9-f597da217401@gmail.com>
Date:   Tue, 18 Apr 2023 20:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>
References: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
 <ZD07hLV1gs+gw26s@duo.ucw.cz>
 <20230417124403.j64c2lftgyqo2a67@pengutronix.de>
 <90efe25c-fea5-cdd0-8bd3-16b9e53e8b56@gmail.com>
 <20230417191756.ex6b4u4lausfatqm@pengutronix.de>
 <5af7920c-d38e-c6e7-3671-53bc5ba7ef8c@gmail.com>
 <20230417222720.i6p6kovzoejysbqt@pengutronix.de>
Content-Language: en-US
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20230417222720.i6p6kovzoejysbqt@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Uwe,

On 4/18/23 00:27, Uwe Kleine-König wrote:
> hello Jacek,
> 
> On Mon, Apr 17, 2023 at 09:51:06PM +0200, Jacek Anaszewski wrote:
>> On 4/17/23 21:17, Uwe Kleine-König wrote:
>>> On Mon, Apr 17, 2023 at 08:33:31PM +0200, Jacek Anaszewski wrote:
>>>> On 4/17/23 14:44, Uwe Kleine-König wrote:
>>>>> On Mon, Apr 17, 2023 at 02:28:52PM +0200, Pavel Machek wrote:
>>>>>>> After commit ba8a86e4dadb ("leds: trigger/tty: Use
>>>>>>> led_set_brightness_sync() from workqueue") this is the second try to
>>>>>>> pick the right function to set the LED brightness from a trigger.
>>>>>>>
>>>>>>> led_set_brightness_sync() has the problem that it doesn't work for LEDs
>>>>>>> without a .brightness_set_blocking() callback. This is (among others)
>>>>>>> the case for LEDs connected to non-sleeping GPIOs.
>>>>>>>
>>>>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>>>>
>>>>>> I don't think this is right.
>>>>>>
>>>>>> _nosleep calls _nopm, which assmues it can't sleep, and schedules
>>>>>> another workqueue to set the LED.
>>>>>
>>>>> Then which is the right variant?
>>>>> led_set_brightness() and led_set_brightness_nosleep() set via a workqueue
>>>>> (which is bad) and led_set_brightness_sync() doesn't work for some LEDs
>>>>> (notably LEDs on non-sleeping GPIOs).
>>>>
>>>> Can you remind me the context of this patch, why using workqueue is
>>>> bad here?
>>>
>>> The workqueue is only needed if you have a slow LED and want to set the
>>> brightness in atomic context. However if you are allowed to sleep that
>>> is just needless overhead.
>>
>> OK, now I get it. So new functions will be needed, something like
>> below (skipped args, need more thinking about corner cases, e.g.
>> interactions with led_classdev_suspend()):
>>
>> int led_set_brightness_cansleep()
>>      led_cdev->brightness = min(value, led_cdev->max_brightness);
>>
>>      if (led_cdev->flags & LED_SUSPENDED)
>>          return 0;
>>
>>      return led_set_brightness_nopm_cansleep();
>>
>>
>> int led_set_brightness_nopm_cansleep()
>>      ret =__led_set_brightness();
>>      if (ret == -ENOTSUPP)
>>          ret = __led_set_brightness_blocking();
>>
>>      return ret;
> 
> Did you just reinvent led_set_brightness_sync() and the only thing we
> need is:

Actually you're right, but led_set_brightness_sync() needs to be
supplemented with the call to __led_set_brightness_blocking().

> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index ce4e79939731..4f718609032b 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -83,8 +83,7 @@ static int create_gpio_led(const struct gpio_led *template,
>   	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
>   	if (!led_dat->can_sleep)
>   		led_dat->cdev.brightness_set = gpio_led_set;
> -	else
> -		led_dat->cdev.brightness_set_blocking = gpio_led_set_blocking;
> +	led_dat->cdev.brightness_set_blocking = gpio_led_set_blocking;
>   	led_dat->blinking = 0;
>   	if (blink_set) {
>   		led_dat->platform_gpio_blink_set = blink_set;
> 
> ?
> 
>> As a quick fix I would apply led_set_brightness_nosleep() nonetheless.
>> Does it have any observed downsides?
> 
> Best regards
> Uwe
> 

-- 
Best regards,
Jacek Anaszewski
