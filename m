Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C751823A9
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2020 22:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbgCKVJc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Mar 2020 17:09:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36201 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgCKVJb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Mar 2020 17:09:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id s5so4584014wrg.3;
        Wed, 11 Mar 2020 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fTZjX2Qt5zZtRrUwaM8FUjsTVZowWsIsSOV5vP0emPA=;
        b=E+YG/4LLCyCh59X0PxhDL9iWdZo7MYwgAQ4BHHRIDt6or7pLlw+/E90ipyeZA7BRrz
         pi9hNr1M16kUi5NgtUeOCI08hyxtcXneSjC88/tyRxSfxoGDBih5HDtz19ayl1xyFeW2
         uIezeeaxFS9Cfr1ySzRIK7bmfK77Q0B1wJeImpg8qMQg9WHmLpXfOMOCqmm6Iy3zL8B1
         BCMVqE12mntEmfHrFM0+4W/+zKMazMrmx5oFnv9tTRkkWGgeyWFvETfanWpi63As6+C+
         OGn1k+uYoBlQgGmp6UiXo1l2CiTZkPx5l7klspgvF5b6PUjPeXJcDQJwXxt9PDJXksbE
         7ySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fTZjX2Qt5zZtRrUwaM8FUjsTVZowWsIsSOV5vP0emPA=;
        b=hzSKcSV62nW7BIf+ryTrzNYG7+voMpJXr5irI+bXghDiMPaEr/RBmIJq6sIdvZ6BEN
         v0oVAdvgfNNBtiOKR6nR7k1gSaflzEZ3figtyyV5n9o7Bp0eWc1MaPXTgFs226U6fkBY
         Txo3/swEgbG57xlk17U2/lIgXHm+zoK+/k3b60FxgWV8UseVrRw8jBcNdNMYo8tQcSf8
         VGnrYkl5HS0td0nr5+pWtEyViQ1KyYdH3ea5kK7kPGWbFGhr7kcYrAjyJw9Y2Wkvwsai
         K5q4shHTHPx1NNJq0ZWbg8hhSw2Gj/xa3yUefrcFwv3NftIQ0y4pO/JkJ1l/+2m7rKWi
         Sk7A==
X-Gm-Message-State: ANhLgQ2oZtT5zf9u8XcxXqk1j77J5lJtNR8LfJvRy6SNlPepxsS5xq9k
        COfnDYgSV1+jt3csDpyQ9c8=
X-Google-Smtp-Source: ADFU+vvw0GtahpTcBmWGtm1vTFhtcwFVWFchlv8G73LA38QjalVH0P0gU8ngsN6NVN/G4Ag3z8L+RQ==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr6690807wrq.251.1583960966505;
        Wed, 11 Mar 2020 14:09:26 -0700 (PDT)
Received: from [192.168.1.23] (afcs84.neoplus.adsl.tpnet.pl. [95.49.70.84])
        by smtp.gmail.com with ESMTPSA id v8sm69746920wrw.2.2020.03.11.14.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 14:09:25 -0700 (PDT)
Subject: Re: [PATCH 3/3] leds: add sgm3140 driver
To:     Dan Murphy <dmurphy@ti.com>, Luca Weiss <luca@z3ntu.xyz>,
        linux-leds@vger.kernel.org
Cc:     Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20200309203558.305725-1-luca@z3ntu.xyz>
 <20200309203558.305725-4-luca@z3ntu.xyz>
 <22341236-8298-dc97-217b-46071a362207@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b3019ea0-a02f-9056-b8cd-8743a146570a@gmail.com>
Date:   Wed, 11 Mar 2020 22:09:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <22341236-8298-dc97-217b-46071a362207@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 3/11/20 2:02 PM, Dan Murphy wrote:
> Luca
> 
> On 3/9/20 3:35 PM, Luca Weiss wrote:
>> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
>>
>> This device is controlled by two GPIO pins, one for enabling and the
>> second one for switching between torch and flash mode.
> 
> How does one enable torch and one enable flash?
> 
> Is the flash-gpio control this or does the enable-gpio enable the flash?
> 
> The DT binding did not indicate what the GPIOs are really going to control.
> 
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
>> Changes since RFC:
>> - address review comments from Jacek Anaszewski:
>>    - implement strobe_get op
>>    - implement timeout_set op
>>    - init v4l2_sd_cfg variable
>>    - remove init_data.devicename assignemnt
>>    - use devm_ version of led_classdev_flash_register_ext
>>    - release child_node in case of success
>>
>>   drivers/leds/Kconfig        |   9 ++
>>   drivers/leds/Makefile       |   1 +
>>   drivers/leds/leds-sgm3140.c | 260 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 270 insertions(+)
>>   create mode 100644 drivers/leds/leds-sgm3140.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 4b68520ac251..9206fc66799d 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -836,6 +836,15 @@ config LEDS_LM36274
>>         Say Y to enable the LM36274 LED driver for TI LMU devices.
>>         This supports the LED device LM36274.
>>   +config LEDS_SGM3140
>> +    tristate "LED support for the SGM3140"
>> +    depends on LEDS_CLASS_FLASH
>> +    depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> 
> What is the purpose of this?  Enable if V4L2_FLASH_LED_CLASS is enabled
> or if it is not enabled?
> 
> Seems to be a do nothing dependency in the Kconfig

See the patch: 58d1809b9d61 ("leds: fix aat1290 build errors")

and Documentation/kbuild/kconfig-language.rst,
chapter "Menu dependencies".

According to that ('!' <expr>)  boils down to (2-/expr/),
where

"An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
respectively for calculations)".

In a result:
- in case V4L2_FLASH_LED_CLASS=n it evaluates to 2,
- in case V4L2_FLASH_LED_CLASS=m it evaluates to 1,
- in case V4L2_FLASH_LED_CLASS=y it evaluates to 0

And (<expr> '||' <expr>) returns the result of max(/expr/, /expr/).

It allows to restrict LEDS_SGM3140 to m if CONFIG_V4L2_FLASH_LED_CLASS=m
(we will have max(1,1) then)
and ignore the dependency if CONFIG_V4L2_FLASH_LED_CLASS=n
(max(0,2)).

-- 
Best regards,
Jacek Anaszewski
