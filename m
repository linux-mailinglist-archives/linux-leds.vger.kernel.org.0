Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719A275365F
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 11:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjGNJ0n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 05:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235551AbjGNJ0j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 05:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2502D66
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689326746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vDaEBbTaDpFH7NoW1SbIcf7d5Ua0WtZqmfHsROXmwco=;
        b=Ylis3wRB+9l13SR5y8w2EdrCcHrV22jyPKYGshLDISvsvekjD5mfSROy1C6r48vIIHFbhR
        4By2frZBj8gIMnKHSmH2a1Gx6WU/8nsPE7RThuUYDfBsOQmyZChZ+4h77flYHEVjbflNoJ
        zRrtBSqjiX+NAfe/vM5N1zpI9MhyJTE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-JZeu3bk3P-KovdVlc3qLfA-1; Fri, 14 Jul 2023 05:25:45 -0400
X-MC-Unique: JZeu3bk3P-KovdVlc3qLfA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b703d64832so15170781fa.2
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 02:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689326744; x=1691918744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDaEBbTaDpFH7NoW1SbIcf7d5Ua0WtZqmfHsROXmwco=;
        b=jN6n8lVZ9klengMH6f5fPkkKNWR0L35AXGYy5pkYhtpFkkNW/L6b11IUsxPjzMrPQp
         72esFjWjZWQM+0986T8X03Xf2zl+N50iitkjGehwaLEFJAAuC6q8533mf4q3xzdm3IaE
         6OYY8cGfv3y4uTV9L5/Y03oTdI7arL6OBt4hBvhFeK9MMkwzjrg5D01X/e+uGYa8aHLC
         6qSWA7qWCAHC7YA4tNFFAPWY6exl7ZuQ2+0uv7Cx5TDQtt4InxyUq+reOTjKLWMsJEiH
         PJQR/1w5ALaV2ZUnAsMirqCH1Y84YiTYKIQfHcPEKGbv0qgr308BWwvWndjy+2T6TVb9
         AseA==
X-Gm-Message-State: ABy/qLYcGHgv5vTrnG36Ny7j5+XtKdloG3HuSCoe1596UrMV+oCof7G4
        u1PozziRMSsW71Y7w89x0v5cAR3dEZdLix42LE/R5JHZ0Enn9XagEngv6S7jO5ioFRSR7pOMNHL
        kagGE/1aWmoMwLRct05pasg==
X-Received: by 2002:a19:675e:0:b0:4fb:8b2a:5e07 with SMTP id e30-20020a19675e000000b004fb8b2a5e07mr3196200lfj.36.1689326743961;
        Fri, 14 Jul 2023 02:25:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH9BuqrYZh1ghoC2qEWMnSOqrSgZvKUhUHXtJfcPNUGK3nEHfmQNXD4lP9kVlFXEumJpc2xew==
X-Received: by 2002:a19:675e:0:b0:4fb:8b2a:5e07 with SMTP id e30-20020a19675e000000b004fb8b2a5e07mr3196186lfj.36.1689326743611;
        Fri, 14 Jul 2023 02:25:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h13-20020a50ed8d000000b0051a1ef536c9sm5439545edr.64.2023.07.14.02.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 02:25:43 -0700 (PDT)
Message-ID: <40d9263d-85be-4838-be5e-b1150c21be7b@redhat.com>
Date:   Fri, 14 Jul 2023 11:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] platform/x86: simatic-ipc: add another model
 BX-21A
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Tobias Schaffner <tobias.schaffner@siemens.com>,
        "xingtong . wu" <xingtong.wu@siemens.com>
References: <20230713115639.16419-1-henning.schild@siemens.com>
 <20230713115639.16419-2-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230713115639.16419-2-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 7/13/23 13:56, Henning Schild wrote:
> This adds support for the Siemens Simatic IPC model BX-21A. Actual
> drivers for that model will be sent in separate patches.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Thank you. I've merged this into a new platform-drivers-x86-simatic-ipc
branch where I'm collecting all the pending platform/x86: simatic-ipc
work.

I'll tag + send a pull-request for Lee later today so that Lee
can merge the (immutable) tag and then apply 2/2 of this series
on top.

Regards,

Hans





> ---
>  drivers/platform/x86/simatic-ipc.c                 | 3 +++
>  include/linux/platform_data/x86/simatic-ipc-base.h | 3 ++-
>  include/linux/platform_data/x86/simatic-ipc.h      | 3 ++-
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
> index c773995b230d..4402cd354104 100644
> --- a/drivers/platform/x86/simatic-ipc.c
> +++ b/drivers/platform/x86/simatic-ipc.c
> @@ -48,6 +48,7 @@ static struct {
>  	{SIMATIC_IPC_IPC477E, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_427E},
>  	{SIMATIC_IPC_IPCBX_39A, SIMATIC_IPC_DEVICE_227G, SIMATIC_IPC_DEVICE_227G},
>  	{SIMATIC_IPC_IPCPX_39A, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_227G},
> +	{SIMATIC_IPC_IPCBX_21A, SIMATIC_IPC_DEVICE_BX_21A, SIMATIC_IPC_DEVICE_NONE},
>  };
>  
>  static int register_platform_devices(u32 station_id)
> @@ -72,6 +73,8 @@ static int register_platform_devices(u32 station_id)
>  			pdevname = KBUILD_MODNAME "_leds_gpio_apollolake";
>  		if (ledmode == SIMATIC_IPC_DEVICE_227G)
>  			pdevname = KBUILD_MODNAME "_leds_gpio_f7188x";
> +		if (ledmode == SIMATIC_IPC_DEVICE_BX_21A)
> +			pdevname = KBUILD_MODNAME "_leds_gpio_elkhartlake";
>  		platform_data.devmode = ledmode;
>  		ipc_led_platform_device =
>  			platform_device_register_data(NULL,
> diff --git a/include/linux/platform_data/x86/simatic-ipc-base.h b/include/linux/platform_data/x86/simatic-ipc-base.h
> index 57d6a10dfc9e..68c455f5edad 100644
> --- a/include/linux/platform_data/x86/simatic-ipc-base.h
> +++ b/include/linux/platform_data/x86/simatic-ipc-base.h
> @@ -2,7 +2,7 @@
>  /*
>   * Siemens SIMATIC IPC drivers
>   *
> - * Copyright (c) Siemens AG, 2018-2021
> + * Copyright (c) Siemens AG, 2018-2023
>   *
>   * Authors:
>   *  Henning Schild <henning.schild@siemens.com>
> @@ -20,6 +20,7 @@
>  #define SIMATIC_IPC_DEVICE_127E 3
>  #define SIMATIC_IPC_DEVICE_227E 4
>  #define SIMATIC_IPC_DEVICE_227G 5
> +#define SIMATIC_IPC_DEVICE_BX_21A 6
>  
>  struct simatic_ipc_platform {
>  	u8	devmode;
> diff --git a/include/linux/platform_data/x86/simatic-ipc.h b/include/linux/platform_data/x86/simatic-ipc.h
> index a48bb5240977..1a8e4c1099e3 100644
> --- a/include/linux/platform_data/x86/simatic-ipc.h
> +++ b/include/linux/platform_data/x86/simatic-ipc.h
> @@ -2,7 +2,7 @@
>  /*
>   * Siemens SIMATIC IPC drivers
>   *
> - * Copyright (c) Siemens AG, 2018-2021
> + * Copyright (c) Siemens AG, 2018-2023
>   *
>   * Authors:
>   *  Henning Schild <henning.schild@siemens.com>
> @@ -34,6 +34,7 @@ enum simatic_ipc_station_ids {
>  	SIMATIC_IPC_IPC227G = 0x00000F01,
>  	SIMATIC_IPC_IPCBX_39A = 0x00001001,
>  	SIMATIC_IPC_IPCPX_39A = 0x00001002,
> +	SIMATIC_IPC_IPCBX_21A = 0x00001101,
>  };
>  
>  static inline u32 simatic_ipc_get_station_id(u8 *data, int max_len)

