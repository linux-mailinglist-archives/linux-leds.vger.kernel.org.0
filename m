Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0BB6E5132
	for <lists+linux-leds@lfdr.de>; Mon, 17 Apr 2023 21:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjDQTv3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Apr 2023 15:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjDQTvV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 15:51:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38BC4682
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 12:51:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so1643072e87.0
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681761068; x=1684353068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiswqM+Moye3DG686s+yVZfQh/Gq9glMtr6puoT02rs=;
        b=VOTbrgqwVeP1NjXtVc++skCRf7xNIGffO/M8bMQpui80rxThX5XJAUj7db85XUdIUv
         Duiv1UpTr1PP+ofCGBtzfqZIChXs02X78RSny0Aq2YmwNwQvUa2+2n1tXC+lxJQeALHJ
         PA8hhp6ROcGwpLA5tsnHKul3HRqLXpYva2u4icovc4lMZt3EyL9+eFtzYbovj1TGE20d
         sml+NjG/5Yjxeqi/LnhY3lLqsokeXBrqj7plQYRfxMwipPRaeBT1EgHJDQu9of43WicK
         nmV9nXoY3Hoq0ZwWlMueRc2tIyniRIk3HM0Vsw5TFE2UNVXhR0SHm3EMztNiQy8ykDzU
         hwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681761068; x=1684353068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiswqM+Moye3DG686s+yVZfQh/Gq9glMtr6puoT02rs=;
        b=G7XecMIiFKvEGkOiciMWsTusR3OsQdi7QoNyDjSTYGeTxy8n+YvPpuuGp+a9Nmk6+N
         zBHUQnEg1gPRBOBJG8NVxJbE5XJrgtOjNqYckG+50KMJlXUwNJ5zlKky34kWNAnHLB29
         xiEpGb0TTer4lD/Y3CjsYrCP+ocHCavvKvFpY9KggW4U4EhERORJ8MHEhYVNITb7y4Em
         oKxwTTXLJWnzdqbxx3gc9hFkSlu5QnFUEPeJ4b5ZN1DrqC+WS9dNpm3EWwE/gHDTct2t
         o9b1rpaZgecKtcQFiXBmoEL/akmhPu5D78eyRYLko98c1hDYMm4CkkVNb9IVVb1pPiLq
         7PBg==
X-Gm-Message-State: AAQBX9fqUtswj/gI43KWWc5ehDA2RjAi+1lK3j29g2W309gOdINIdCZj
        88n/tqHYNwEWgug8E1PhjT1MhlIf2TI=
X-Google-Smtp-Source: AKy350b8R9AD98ptvtzjq5QW36TVp8aU2dJkDDny9P/2bYF0YAAVXP5rVHs77h+F5sXwMMN8xSBedg==
X-Received: by 2002:a19:f519:0:b0:4ed:ca3b:40f0 with SMTP id j25-20020a19f519000000b004edca3b40f0mr377347lfb.9.1681761067999;
        Mon, 17 Apr 2023 12:51:07 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id o10-20020a05651238aa00b004cb43c9bf9asm2140094lft.208.2023.04.17.12.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 12:51:07 -0700 (PDT)
Message-ID: <5af7920c-d38e-c6e7-3671-53bc5ba7ef8c@gmail.com>
Date:   Mon, 17 Apr 2023 21:51:06 +0200
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
Content-Language: en-US
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20230417191756.ex6b4u4lausfatqm@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/17/23 21:17, Uwe Kleine-König wrote:
> On Mon, Apr 17, 2023 at 08:33:31PM +0200, Jacek Anaszewski wrote:
>> Hi Uwe,
>>
>> On 4/17/23 14:44, Uwe Kleine-König wrote:
>>> Hello,
>>>
>>> On Mon, Apr 17, 2023 at 02:28:52PM +0200, Pavel Machek wrote:
>>>>> After commit ba8a86e4dadb ("leds: trigger/tty: Use
>>>>> led_set_brightness_sync() from workqueue") this is the second try to
>>>>> pick the right function to set the LED brightness from a trigger.
>>>>>
>>>>> led_set_brightness_sync() has the problem that it doesn't work for LEDs
>>>>> without a .brightness_set_blocking() callback. This is (among others)
>>>>> the case for LEDs connected to non-sleeping GPIOs.
>>>>>
>>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>>
>>>> I don't think this is right.
>>>>
>>>> _nosleep calls _nopm, which assmues it can't sleep, and schedules
>>>> another workqueue to set the LED.
>>>
>>> Then which is the right variant?
>>> led_set_brightness() and led_set_brightness_nosleep() set via a workqueue
>>> (which is bad) and led_set_brightness_sync() doesn't work for some LEDs
>>> (notably LEDs on non-sleeping GPIOs).
>>
>> Can you remind me the context of this patch, why using workqueue is
>> bad here?
> 
> The workqueue is only needed if you have a slow LED and want to set the
> brightness in atomic context. However if you are allowed to sleep that
> is just needless overhead.

OK, now I get it. So new functions will be needed, something like
below (skipped args, need more thinking about corner cases, e.g.
interactions with led_classdev_suspend()):

int led_set_brightness_cansleep()
     led_cdev->brightness = min(value, led_cdev->max_brightness);

     if (led_cdev->flags & LED_SUSPENDED)
         return 0;

     return led_set_brightness_nopm_cansleep();


int led_set_brightness_nopm_cansleep()
     ret =__led_set_brightness();
     if (ret == -ENOTSUPP)
         ret = __led_set_brightness_blocking();

     return ret;

As a quick fix I would apply led_set_brightness_nosleep() nonetheless.
Does it have any observed downsides?

-- 
Best regards,
Jacek Anaszewski
