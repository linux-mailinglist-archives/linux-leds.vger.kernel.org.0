Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0704D6E6BAA
	for <lists+linux-leds@lfdr.de>; Tue, 18 Apr 2023 20:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbjDRSE4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Apr 2023 14:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbjDRSEz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Apr 2023 14:04:55 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E487146B9
        for <linux-leds@vger.kernel.org>; Tue, 18 Apr 2023 11:04:53 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a10so14703157ljr.5
        for <linux-leds@vger.kernel.org>; Tue, 18 Apr 2023 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681841092; x=1684433092;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UupMxP9WzLJoQMFxYNiEXmjDS6KwHCdcbs11XhuocCM=;
        b=QEv3HsdXSq1aMm31xFBlDIKBzVdxLthscQhZ9CobDDtc08EIuhsahK48R+xZDcACZf
         mCt9Wj3eOrdC8hRdTwxZv1Wdh/Go7qvMRKPVVUmjo1OPdvwHEwvWbbnr5EWWtuxJbNIm
         8FSxwL8+qiJvuJDVUfBUxqOZpZ5ShOvPRz/LR8yHHuYKxcLArq4aCIA4UEO9XpVodomJ
         4YX7VQkPjWyvYNg8MOX6UpC3sospr9fC7vIdJJP+hpXVFTjQlkQSH30TY4Tr9ahmqaQu
         BPUlwP5kHvi0omLNHyq1tVkp5FjSwNfGH3kg+gIb4bdkXl3luvv6+JxHGJF0rhjcknJo
         Tb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681841092; x=1684433092;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UupMxP9WzLJoQMFxYNiEXmjDS6KwHCdcbs11XhuocCM=;
        b=Hx6zRygysJp+LWRd20CnEhX4aDZyA6t+7LZ19gFXH7c+wEIC0J2byLH+QurOtXc12q
         j5alu6O7I1L6SZXYs1A7Sskzm/OedsaAcHFq8daROi1sFzZsS8ZrSK2yJciLViqQMBt7
         629PpGlThsdJMq2pFY5fbfm+Gz832n6ycDFPPanOh4lRPaHB3GIOuEiwQ+FMlZRadn+t
         tV/0z43AZT6feK0ffA9iMt1kDG6uZzPJytMlVWnyWcyd81xDnUPNhzyL1KvwpowqYVmD
         rbkrjmgbIXNpOcZNjWue0mMV54YUPjAl8TyRD0jkvQ+MfuyN2NdryflDYGbuGIb8EV6s
         WSng==
X-Gm-Message-State: AAQBX9eT+W7K3EQTet5lcFtwCGIbYvnHLb50ExDhumWP/636BBAI4zvk
        Tw7okWjQj+1Yjx/Dkoiq2i0=
X-Google-Smtp-Source: AKy350YhmQcDGd3pEdiz3Y93Pbqpy8TFMfdmC9/7IiBK2hqAdK1x7mYQ/Jcc8m8oxZ/vG8RUbg8tPA==
X-Received: by 2002:a2e:a16a:0:b0:2a8:bc34:c1d3 with SMTP id u10-20020a2ea16a000000b002a8bc34c1d3mr915614ljl.40.1681841091831;
        Tue, 18 Apr 2023 11:04:51 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id x1-20020a2e9c81000000b002a76e600228sm2645300lji.47.2023.04.18.11.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 11:04:51 -0700 (PDT)
Message-ID: <f1bc92a9-4ffa-dd9f-494a-033db0bd2a32@gmail.com>
Date:   Tue, 18 Apr 2023 20:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
Content-Language: en-US
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
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
 <3589aa0c-bea7-f637-8bb9-f597da217401@gmail.com>
In-Reply-To: <3589aa0c-bea7-f637-8bb9-f597da217401@gmail.com>
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

On 4/18/23 20:02, Jacek Anaszewski wrote:
> Hi Uwe,
> 
> On 4/18/23 00:27, Uwe Kleine-König wrote:
>> hello Jacek,
>>
>> On Mon, Apr 17, 2023 at 09:51:06PM +0200, Jacek Anaszewski wrote:
[...]
>>> int led_set_brightness_nopm_cansleep()
>>>      ret =__led_set_brightness();
>>>      if (ret == -ENOTSUPP)
>>>          ret = __led_set_brightness_blocking();
>>>
>>>      return ret;
>>
>> Did you just reinvent led_set_brightness_sync() and the only thing we
>> need is:
> 
> Actually you're right, but led_set_brightness_sync() needs to be
> supplemented with the call to __led_set_brightness_blocking().

I meant __led_set_brightness() of course.

-- 
Best regards,
Jacek Anaszewski
