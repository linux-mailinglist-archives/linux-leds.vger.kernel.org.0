Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F002E6C511D
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjCVQrh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjCVQrg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:47:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9814558F
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679503596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fKP+KJWuRVxpXlqQ8lrz564gEo7MLIhPINqSGMloROo=;
        b=ew/eWDthx3N/4W9/fB2BbAl9wmrm76FOHLRZxcgq84ztIf3FQvt4Z+iUgeOUY/YZ5D7dFK
        1jd19SpWdlH7djgi3rK9aB422CWmUJldboC0syLHV5wxzGbOmdpvXOaDaQYsCxiSE35cGL
        Wu26X+ZKooZ0HeBXno3r//P4Ll4yMm4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-blC2cVVpPaSIIlmkGkvZJA-1; Wed, 22 Mar 2023 12:46:35 -0400
X-MC-Unique: blC2cVVpPaSIIlmkGkvZJA-1
Received: by mail-ed1-f71.google.com with SMTP id es16-20020a056402381000b004fa3e04c882so27850722edb.10
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 09:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKP+KJWuRVxpXlqQ8lrz564gEo7MLIhPINqSGMloROo=;
        b=nN0v7pNsZjf2Q2K9dDTlkqI1xXwifc1jLfkMeigMTS+QUsVokJw+ovkhBbUjExXlb5
         WC75MyFta626tBjljX+SFxJ9O0MSNbXx1x2T6T5+65PARvr5RPOMQCulISjKUgTxmbIf
         VInl/WTGOPZstSmvXD7mrnPqo7JmLWef71uwBrjFuSh63tLs2fSywDOMPU64fcHQbVG2
         PIPQTDG5JqWdEQw4HLwOvt6PAgYBMbAqwsR9Catl70l/Z8pGQYIVQJCAKkLpxM4yKbY0
         /ANwz8tlS1jln5EcmAA99bskaB9zeUxUoDeV4SXM2Q21dNVYVZj59nTJ5PZnXaqHtYd0
         2BGg==
X-Gm-Message-State: AO0yUKXCzksd8PvS/j0Q7Alx8MLyRVG5khFLxcyty/vdnHwRBy6klmyb
        O8VEM2p5SJfctxINdJFUcTwi6be7UMts4s5gbWB0DvqNHCwgp1AKLZLOgts9LmdegpGMXISqBZY
        CGYYHMgJMg8j1a5EQlaP6AA==
X-Received: by 2002:a05:6402:205b:b0:501:d43e:d1e6 with SMTP id bc27-20020a056402205b00b00501d43ed1e6mr7651111edb.4.1679503594404;
        Wed, 22 Mar 2023 09:46:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set+6hdOTc0Zqa88o3iuUmk3NrASH9XQjNTkHWFkTIbetF0RwQ6I9QNkO9KvCcyfVgaf3ZeDZBQ==
X-Received: by 2002:a05:6402:205b:b0:501:d43e:d1e6 with SMTP id bc27-20020a056402205b00b00501d43ed1e6mr7651097edb.4.1679503594174;
        Wed, 22 Mar 2023 09:46:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k19-20020a508ad3000000b00501c0eaf10csm5108271edk.40.2023.03.22.09.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 09:46:33 -0700 (PDT)
Message-ID: <0f2e7cbb-9b49-e400-83f3-983d49b455f7@redhat.com>
Date:   Wed, 22 Mar 2023 17:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/3] platform: x86: int3472: Add MFD cell for tps68470
 LED
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-2-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230321153718.1355511-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/21/23 16:37, Kate Hsuan wrote:
> Add MFD cell for tps68470-led.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 5b8d1a9620a5..82ef022f8916 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -17,7 +17,7 @@
>  #define DESIGNED_FOR_CHROMEOS		1
>  #define DESIGNED_FOR_WINDOWS		2
>  
> -#define TPS68470_WIN_MFD_CELL_COUNT	3
> +#define TPS68470_WIN_MFD_CELL_COUNT	4
>  
>  static const struct mfd_cell tps68470_cros[] = {
>  	{ .name = "tps68470-gpio" },
> @@ -193,7 +193,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].name = "tps68470-regulator";
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> -		cells[2].name = "tps68470-gpio";
> +		cells[2].name = "tps68470-led";
> +		cells[3].name = "tps68470-gpio";
>  
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);

