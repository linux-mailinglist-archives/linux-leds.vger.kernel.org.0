Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 853A06E39B1
	for <lists+linux-leds@lfdr.de>; Sun, 16 Apr 2023 17:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjDPPNm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 Apr 2023 11:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDPPNj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Apr 2023 11:13:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756D649EC
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 08:13:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ec9e8c9475so903719e87.1
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681658009; x=1684250009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxYqJMWjgZvRah3ybuy2kPJKQV4j3+JRmahh4G7p9BY=;
        b=hbg9Lw5AMjYjZwf322FpXVzMz28WEcVck1bH3LwFeId8bf+1zEKMjDPOIEBW61Sqvf
         FVW8szHWLEBitIJhgvz2MbdtNnLMzBt4E+fIPBzCzrEM6BNorwCQUXWChkDK3QkbOhW6
         sc2vZZfZbCUDSYPHy7m6hHZhzv19//0aniR9mvDxQ2nqfCUXqis8k6h9/pnTGIcerPON
         w3pLxhWPqA46ac+iG0fLLf5CRSHCQ4jKYs9Que48dN4U1DDUICfzJOJHmt/jXxF6glOK
         k78tGWNBeS7qqqfu3mHFAx4m+IAjNLrcwXQUbuA5r+vPmFwvW88EhkGaC1ILHVxkLbru
         2C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681658009; x=1684250009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxYqJMWjgZvRah3ybuy2kPJKQV4j3+JRmahh4G7p9BY=;
        b=c6RtsteUPtOk2+0RrgVUdIFB0T+KApe8haL6puv7wSzpmQA+CAL/ZFnuTIf3t4VdxT
         AvrF6Fr6E9hKG76Yp0mhjMAoEES4f/1pig3UmDoMK0pS12EPLzWwHVbiAEVAmYcDd6JS
         Cvjy5Ul/tkRBrwC/h2H345+ulLMF1WheazudpTS8U2lSA36DuwUR72IwhiXMcSqFPCk/
         GXhxDA2HM9PP6wyuFzWAKL4KrigzKF7XBK9ERaOqFnyBtM65YXqIGytKtNQeVvokQxI6
         8J2jzPL15SamVzed7DLNUq8Bo2wUatn6q0cZyx8ngZH/QV4HWDhWjRzgJ/1bnKmbYcD5
         RwOw==
X-Gm-Message-State: AAQBX9dn978qEuS3alWXQu5SKUIEzL78sBI0riDJ3c8EuuTOzjjAR6S6
        W1Okp9GL4aIEaPXkYOpjXV0=
X-Google-Smtp-Source: AKy350ZoH6tOpQ9kPEqUi+YRqvr+eTX8iBXCEKEHym3vL+m9/j/K1rhXbxT4URCQpOalrI94OutCZg==
X-Received: by 2002:ac2:59ca:0:b0:4eb:3615:4c45 with SMTP id x10-20020ac259ca000000b004eb36154c45mr1219414lfn.10.1681658008754;
        Sun, 16 Apr 2023 08:13:28 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25ec7000000b004db3e2d3efesm1739680lfq.204.2023.04.16.08.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 08:13:28 -0700 (PDT)
Message-ID: <de10d1f3-d8f7-65a8-1eb9-81c06307b8d7@gmail.com>
Date:   Sun, 16 Apr 2023 17:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>
References: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Uwe,

On 4/14/23 18:48, Uwe Kleine-König wrote:
> After commit ba8a86e4dadb ("leds: trigger/tty: Use
> led_set_brightness_sync() from workqueue") this is the second try to
> pick the right function to set the LED brightness from a trigger.
> 
> led_set_brightness_sync() has the problem that it doesn't work for LEDs
> without a .brightness_set_blocking() callback. This is (among others)
> the case for LEDs connected to non-sleeping GPIOs.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> after a few (non-public and public) reports that the tty trigger doesn't
> work and Jacek pointed out in
> https://lore.kernel.org/all/ad4a1069-72c6-a431-336f-ed78a57a1ba0@gmail.com/#t
> that led_set_brightness_nosleep() is the right function, here comes a
> patch to actually implement that.
> 
> Does this justify a Fixes line? In that case that would be:
> 
> 	Fixes: ba8a86e4dadb ("leds: trigger/tty: Use led_set_brightness_sync() from workqueue")
> 
> (As ba8a86e4dadb declares to be a fix for fd4a641ac88f ("leds: trigger:
> implement a tty trigger") I think a further reference to fd4a641ac88f
> isn't necesary.)
> 
> Best regards
> Uwe
> 
>   drivers/leds/trigger/ledtrig-tty.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> index f62db7e520b5..c8bbdeac93b9 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -1,11 +1,11 @@
>   // SPDX-License-Identifier: GPL-2.0
>   
>   #include <linux/delay.h>
> -#include <linux/leds.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
>   #include <linux/tty.h>
>   #include <uapi/linux/serial.h>
> +#include "../leds.h"
>   
>   struct ledtrig_tty_data {
>   	struct led_classdev *led_cdev;
> @@ -122,12 +122,12 @@ static void ledtrig_tty_work(struct work_struct *work)
>   
>   	if (icount.rx != trigger_data->rx ||
>   	    icount.tx != trigger_data->tx) {
> -		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
> +		led_set_brightness_nosleep(trigger_data->led_cdev, LED_ON);
>   
>   		trigger_data->rx = icount.rx;
>   		trigger_data->tx = icount.tx;
>   	} else {
> -		led_set_brightness_sync(trigger_data->led_cdev, LED_OFF);
> +		led_set_brightness_nosleep(trigger_data->led_cdev, LED_OFF);
>   	}
>   
>   out:
> 
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
