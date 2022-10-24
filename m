Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 129DC609E15
	for <lists+linux-leds@lfdr.de>; Mon, 24 Oct 2022 11:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiJXJeU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Oct 2022 05:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiJXJeT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Oct 2022 05:34:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9DB5BCB3
        for <linux-leds@vger.kernel.org>; Mon, 24 Oct 2022 02:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666604058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NYiZhVus/a6yFTpNh/BXjTb7tVXNxU/01uNCth7CTZI=;
        b=MWxoYI1ncV+XVCLGHKZicQr3N/qy0uACybfNqMF/lUJieoAT9XQVpZ2GhQc4cslLPocvwv
        aQyhcYaLUHtrX7lM4SbedudB6ljaEY4n0Plhan5oKQMqi9pi2it9htU8yQKpUjMyrGh0D5
        tXkrW+DmYFNXAxEens+ZJyVPtQnFZuY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-5iiN7DbpON2GFIHLk49b2w-1; Mon, 24 Oct 2022 05:34:13 -0400
X-MC-Unique: 5iiN7DbpON2GFIHLk49b2w-1
Received: by mail-ed1-f72.google.com with SMTP id i17-20020a05640242d100b0044f18a5379aso9140017edc.21
        for <linux-leds@vger.kernel.org>; Mon, 24 Oct 2022 02:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYiZhVus/a6yFTpNh/BXjTb7tVXNxU/01uNCth7CTZI=;
        b=d2I0e0haXORPJaSDi/exLmGctGtI/dOQXZM8D6Ey1atylIdiahoAnmcOtERqARc3oy
         dsgON6ex0GayYqxr6i4GudQu5j0E86UyEtzyuZNUhodMLI78KOkK75Fa93ka/ut4sLH0
         DL3FGB/sU8tnmAIygGZZ3+uFPNRbRwKDn7ZBgbRtZGAlJWWi4Nob1dqP330LVFMHv0oy
         iabacngGvxlSn5XXVApCHQ/f+naDv9JGq3ZwqzCD1T7Qh8BIne4eu2Pga86xBHbxXfl8
         kt69WzW+kH4f/J5McUrM6Saq0mGpqG4qW2e8JbN61b3TAqCyB27XrOZmvnySMvG8rkZB
         OKEQ==
X-Gm-Message-State: ACrzQf3+vwKdXINnj2Aeqw0jj8i8ZJ+4LYwptBW82ZaNvDCJ5UExzGZ6
        Z7VW163VdJ6UqwgboN6MYVJ2EXUwjpNmxFmHEkn64Y/pQo8n5EOd5VPXvVuuL1n0KLJQ3pi2OCg
        eJQtjtqokMNaCsitB9UUW9Q==
X-Received: by 2002:a05:6402:27c6:b0:461:e426:dc8b with SMTP id c6-20020a05640227c600b00461e426dc8bmr1443188ede.403.1666604051518;
        Mon, 24 Oct 2022 02:34:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rZ54JzfS+4+30nlurPHA94oY42PLZUnu1Y3UGrNBBHaFn9/MGyKCgcI0JYZS19bexj5Nizw==
X-Received: by 2002:a05:6402:27c6:b0:461:e426:dc8b with SMTP id c6-20020a05640227c600b00461e426dc8bmr1443180ede.403.1666604051358;
        Mon, 24 Oct 2022 02:34:11 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b29-20020a170906729d00b00782ee6b34f2sm15257318ejl.183.2022.10.24.02.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 02:34:10 -0700 (PDT)
Message-ID: <28cea90f-d53b-0e28-9546-c36462cf0ceb@redhat.com>
Date:   Mon, 24 Oct 2022 11:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] leds: simatic-ipc-leds-gpio: fix incorrect LED to GPIO
 mapping
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024092027.4529-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221024092027.4529-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Henning,

On 10/24/22 11:20, Henning Schild wrote:
> For apollolake the mapping between LEDs and GPIO pins was off because of
> a refactoring when we introduced a new device model.
> In addition to the reordering the indices in the lookup table need to be
> updated as well.
> 
> Fixes: a97126265dfe ("leds: simatic-ipc-leds-gpio: add new model 227G")
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Thanks, since I've merged the original changes and since I'm preparing
a fixes pull-req for 6.1-rc3 anyways let me pick this one up and
get it on its way to Linus:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/leds/simple/simatic-ipc-leds-gpio.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio.c b/drivers/leds/simple/simatic-ipc-leds-gpio.c
> index b9eeb8702df0..07f0d79d604d 100644
> --- a/drivers/leds/simple/simatic-ipc-leds-gpio.c
> +++ b/drivers/leds/simple/simatic-ipc-leds-gpio.c
> @@ -20,12 +20,12 @@ static struct gpiod_lookup_table *simatic_ipc_led_gpio_table;
>  static struct gpiod_lookup_table simatic_ipc_led_gpio_table_127e = {
>  	.dev_id = "leds-gpio",
>  	.table = {
> -		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 52, NULL, 1, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 53, NULL, 2, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 57, NULL, 3, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 58, NULL, 4, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 60, NULL, 5, GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 51, NULL, 0, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 52, NULL, 0, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 53, NULL, 1, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 57, NULL, 2, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 58, NULL, 3, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 60, NULL, 4, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 51, NULL, 5, GPIO_ACTIVE_LOW),
>  		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 56, NULL, 6, GPIO_ACTIVE_LOW),
>  		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 59, NULL, 7, GPIO_ACTIVE_HIGH),
>  	},

