Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BF46C51FD
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 18:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjCVRPH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 13:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbjCVRPC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 13:15:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6352007C
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LAnMd310MmA6pNpw5eHkqA00D/dkWZ4sGmY7r/HYNi8=;
        b=UfVdGYdWKGSp1ZkRfHJNiCZPBcDpCmasWkFCBuCmfD92DXbvUgCNSuFGcjGmmuNLg4zNYa
        ScMdmcK1EM7l5eupCLBEVunioFnoxQbXM5cpS9WnQvZdzPikqbAXRhxBRPTNlRiKNwmk7O
        jL3YE841TPOMxsEMNlJaKx2XabzpZcQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-qwVPxFnIMJqhzSAd4kxdpg-1; Wed, 22 Mar 2023 13:14:16 -0400
X-MC-Unique: qwVPxFnIMJqhzSAd4kxdpg-1
Received: by mail-ed1-f72.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so28437328edc.11
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAnMd310MmA6pNpw5eHkqA00D/dkWZ4sGmY7r/HYNi8=;
        b=uOim9jm6IZmGdsROSJtcb+n1FYGvKIeH4ZsC0DB3NWYGjF0HqClMaprdPkXCUBR+D6
         sPwFp8RpAbmI3XXYKZh1mHkfaXw0/6k24dJKQUlDLte3FivpCNAieYAzAQchEEt4AAsl
         9aU0LGINUaiRfudyeQBROFOeTxRbNQkzvbaqIx0qnZD4h1ybrsTK4OxgF64fmqy4at3Z
         RUtK6TneoSh4ZakY2DEpR2znH9+4VciB5I7oTh7jPGTOP09JDnzEZiRqifXp0cvIfv7C
         9ekiv3/iRneKROfB/sMrnQ1YVxLDY9x3gQIWfnwbyJP99wbZMTk0ODhF/Q5y6bNlBTNQ
         DRdw==
X-Gm-Message-State: AO0yUKU24Z4LyEM2tj3OTj/1NIjR2w+GOH9i5gqNti93rGpA/0N2ditB
        iXI4GELLsevjN2csLHytsFxut9tHsY4GrYKYFSqLz19jjwF04G7diaEGsLsO1YQ68TZZrVbtXRi
        F4dD1w7sbASkgH+hK3E22xyh+a6wiYQ==
X-Received: by 2002:a17:906:3e0f:b0:933:422b:5f5d with SMTP id k15-20020a1709063e0f00b00933422b5f5dmr8707540eji.18.1679505254352;
        Wed, 22 Mar 2023 10:14:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set+U7G/THYaSuIF3qhrxw9o/2Nmh3Q+qTmWOnN6Iuv6VKLPg91lY+B1kfUQxuMMfsxJEhezsvA==
X-Received: by 2002:a17:906:3e0f:b0:933:422b:5f5d with SMTP id k15-20020a1709063e0f00b00933422b5f5dmr8707516eji.18.1679505254094;
        Wed, 22 Mar 2023 10:14:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm7447206ejb.74.2023.03.22.10.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:14:13 -0700 (PDT)
Message-ID: <5841f661-15f8-12d1-ca92-1dce1a7296df@redhat.com>
Date:   Wed, 22 Mar 2023 18:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/8] platform/x86: int3472: Add platform data for LEDs
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-2-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-2-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Daniel,

Thank you for your work in this!

On 3/22/23 17:09, Daniel Scally wrote:
> Some of the LEDs that can be provided by the TPS68470 PMIC come with
> various configuration registers that must be set to appropriate values.
> Add a platform data struct so that those data can be defined and
> passed to the tps68470-led platform device.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c |  2 ++
>  drivers/platform/x86/intel/int3472/tps68470.h |  2 ++
>  include/linux/platform_data/tps68470.h        | 11 +++++++++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 82ef022f8916..53b0459f278a 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -194,6 +194,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>  		cells[2].name = "tps68470-led";
> +		cells[2].platform_data = (void *)board_data->tps68470_led_pdata;
> +		cells[2].pdata_size = sizeof(struct tps68470_led_platform_data);
>  		cells[3].name = "tps68470-gpio";
>  
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701593..ce50687db6fb 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -13,10 +13,12 @@
>  
>  struct gpiod_lookup_table;
>  struct tps68470_regulator_platform_data;
> +struct tps68470_led_platform_data;
>  
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	const struct tps68470_led_platform_data *tps68470_led_pdata;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };


> diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
> index e605a2cab07f..5d55ad5c17ed 100644
> --- a/include/linux/platform_data/tps68470.h
> +++ b/include/linux/platform_data/tps68470.h
> @@ -37,4 +37,15 @@ struct tps68470_clk_platform_data {
>  	struct tps68470_clk_consumer consumers[];
>  };
>  
> +struct tps68470_led_platform_data {
> +	u8 iledctl_ctrlb;
> +	u8 wledmaxf;
> +	u8 wledto;
> +	u8 wledc1;
> +	u8 wledc2;
> +	u8 wledctl_mode;
> +	bool wledctl_disled1;
> +	bool wledctl_disled2;
> +};
> +
>  #endif


It seems to me that these include/linux/platform_data/tps68470.h
changes should be squashed to:

[PATCH 2/8] platform/x86: int3472: Init LED registers using platform data

Which BTW has the wrong subsys prefix, it should be named:

[PATCH 2/8] leds: tps68470: Init LED registers using platform data

or even better:

[PATCH 2/8] leds: tps68470: Init WLED registers using platform data


And then squash the rest of this patch into:

[PATCH 3/8] platform/x86: int3472: Add TPS68470 LED Board Data

please and drop this now empty patch from the set.

Regards,

Hans

