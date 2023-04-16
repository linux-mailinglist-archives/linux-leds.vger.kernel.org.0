Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23EF6E39D8
	for <lists+linux-leds@lfdr.de>; Sun, 16 Apr 2023 17:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjDPPgj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 Apr 2023 11:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjDPPge (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Apr 2023 11:36:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D572710
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 08:36:26 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id j11so11566191ljq.10
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681659384; x=1684251384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exzyDX3Aqm5aKJmGRGP1alLZJPLLcu1orBvRRSfqd7w=;
        b=Ww/NPP4n1ybW61GTwoTaTXl+H5nh123vl577SQXfk0A+88LQ2C1p30Fz+z/FA178Ez
         gbbYnmG4lVKKyzgu2UZrKfDAwt3/skS2qGElP4rfMqNb9s8rGfqn1prV4slPafcqrPlM
         IYaBO7ZM+FkF0olaJZcmNlI/2ekADBEKIXHbgsJAgm32QIUAb3HgeiUikA4RPAatgVr4
         WibuVA4I/kQc1ytOcUKWjotS7FCrwwPHURtz8Xi/R6N9dJV+fMwfITdwfvAbrze/W0kn
         kgQINub4jCWQyxUgiDt2AEk9MUzzzblLYhWM0scvWg1kfuQySdohi9wmAgEYRztJJjm5
         zt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681659384; x=1684251384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exzyDX3Aqm5aKJmGRGP1alLZJPLLcu1orBvRRSfqd7w=;
        b=EZBkPuiARLKzmcnGpIagGXz25a5A6TsO9CoCUX369MORd2BnUeXJ2Z0aMKavgvkO/5
         ykcqExWDHIUwR3qoX3thkjP8PrqgGO0WMcHOwOWNos0T/TMYTLUwgmfyxIU0y2lL01fu
         LVtVn4Tjud7HYiCwb6p1aNm7bO42aarTnsPQ3KDfYtVGJXcxUXCkvPOPPfJBr/2UhNLV
         +V5OumoSyJ14gLoEhjzwd5w45wM0/XnjAXEPtxJpiGHhQFBtEyGw7279tD01U6oST3JX
         ZxuQpE2H8ZJ4OJ5qT1vCckQJlVAxIeHnxNM2OXeL967V8qlJrzg8pFfWpsEKNRPVE1pd
         7zsg==
X-Gm-Message-State: AAQBX9dhuwwqBKX6nrEykCvT/5KQHiW06NZzRU/U4zT8Kn/FEGwBBgFD
        Wpfhdx3q5/pAqSiiEOstgplOmrx1nxo=
X-Google-Smtp-Source: AKy350YrHGHKmw+t21LcJNXdcGuEq4EU3/pUq/8h0nXtnu/kIwJR29QJCMKZz2YaHv8Ncf8p2Fg2qQ==
X-Received: by 2002:a2e:9082:0:b0:2a2:2cb1:63fa with SMTP id l2-20020a2e9082000000b002a22cb163famr3274067ljg.17.1681659384578;
        Sun, 16 Apr 2023 08:36:24 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id v7-20020a2e9f47000000b0029d45b15338sm1865938ljk.42.2023.04.16.08.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 08:36:23 -0700 (PDT)
Message-ID: <cb397ce1-3b1e-124a-6b7e-3c9c20ab9271@gmail.com>
Date:   Sun, 16 Apr 2023 17:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>
Cc:     Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
References: <20230412215855.593541-1-hdegoede@redhat.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20230412215855.593541-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Hans,

Generally the series looks good to me, but it would be good
to get some Tested-by(s).

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

On 4/12/23 23:58, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch series to fix an oops about sleeping in led_trigger_blink()
> + one other small bugfix.
> 
> Patches 1-3 should arguably have a:
> 
> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
> 
> tag, but Fixes tags tend to lead to patches getting automatically added
> to the stable series and I would prefer to see this series get some
> significant testing time in mainline first, so I have chosen to omit
> the tag.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (4):
>    leds: Change led_trigger_blink[_oneshot]() delay parameters to
>      pass-by-value
>    leds: Fix set_brightness_delayed() race
>    leds: Fix oops about sleeping in led_trigger_blink()
>    leds: Clear LED_INIT_DEFAULT_TRIGGER when clearing current trigger
> 
>   drivers/leds/led-core.c                  | 81 ++++++++++++++++++++----
>   drivers/leds/led-triggers.c              | 17 ++---
>   drivers/leds/trigger/ledtrig-disk.c      |  9 +--
>   drivers/leds/trigger/ledtrig-mtd.c       |  8 +--
>   drivers/net/arcnet/arcnet.c              |  8 +--
>   drivers/power/supply/power_supply_leds.c |  5 +-
>   drivers/usb/common/led.c                 |  4 +-
>   include/linux/leds.h                     | 43 ++++++++++---
>   net/mac80211/led.c                       |  2 +-
>   net/mac80211/led.h                       |  8 +--
>   net/netfilter/xt_LED.c                   |  3 +-
>   11 files changed, 125 insertions(+), 63 deletions(-)
> 

-- 
Best regards,
Jacek Anaszewski
