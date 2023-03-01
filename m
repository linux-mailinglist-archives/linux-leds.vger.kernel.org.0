Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732D16A728D
	for <lists+linux-leds@lfdr.de>; Wed,  1 Mar 2023 19:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCASFD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Mar 2023 13:05:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjCASFC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Mar 2023 13:05:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E2D7D9A
        for <linux-leds@vger.kernel.org>; Wed,  1 Mar 2023 10:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677693857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uA8mWRzcawb/iOY8VKGaSF2wpTCNVoY22nH9W3NUYis=;
        b=S21d3udZIpgdFKBgAQ6Q1gnxMmfBJgDSMYg2YoErmAtz9e7Mjaak+PHIq4UjN73bkl8frj
        1leoyFnqNRT3WUTjJHFv24shiM7SyAZ30SkGL55bbxziwyEYMhcpYztEicCKZLvokc/nKT
        jCVWo7APXK2N64qunG66GYOVMUn/8bM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-P1ydcDAIPO2s_IQK7CkH3Q-1; Wed, 01 Mar 2023 13:04:04 -0500
X-MC-Unique: P1ydcDAIPO2s_IQK7CkH3Q-1
Received: by mail-ed1-f69.google.com with SMTP id da15-20020a056402176f00b004ace822b750so20478930edb.20
        for <linux-leds@vger.kernel.org>; Wed, 01 Mar 2023 10:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uA8mWRzcawb/iOY8VKGaSF2wpTCNVoY22nH9W3NUYis=;
        b=LhBkybHeLZFhMvJV5d6Cl9UW5uP4N7gwUy9/3sPCIVMC6F2kLk3iwGL8ccbAPWSS2q
         sB3fy4mgCuSNpw7N3NgAM1xccZs48+VT7FDie4op+mJUwuazS4VdK4QeLNZi7ILMzM7n
         y3UgQ77btl1gBI6fYsuolYHayRlBAlXeaY63gFvsLeBBLzZGB8AHeBncabR2fQXmTpOF
         BHtns7LDA8/flPLveCHL8DpsXgXPli9ed+UGa+oYyAt4GfnRupa3CA/aqfzKGzVv16cf
         SskTsGs5t8Okl1UFuG7MindvadD/DfrQbrt8MMtlKTRDHpGKvJMiccAvrRTDO7779hE4
         hbKA==
X-Gm-Message-State: AO0yUKVNSbGEnZrWEadQ3EeiCl+7j1bCiTxzNFcVucgp6KzcqqhdL74S
        R7ktrklGfJ/oxlUn14NXmGfrY8cjyBZAI4mENjwi4D82a85qBvSC6KWKIWtkNgYCL7FK9RMn6JP
        TzjSUyfJTQ53cQ8wArfsz0w==
X-Received: by 2002:aa7:dd48:0:b0:4ac:c7b3:8c27 with SMTP id o8-20020aa7dd48000000b004acc7b38c27mr8167254edw.28.1677693843454;
        Wed, 01 Mar 2023 10:04:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+PtM7Aa8tqwMX79Nfl7KklBegm+cAn5HXFitwmc2FnblzIp711z1qVJwfpjLWXQCD/ZuAkhg==
X-Received: by 2002:aa7:dd48:0:b0:4ac:c7b3:8c27 with SMTP id o8-20020aa7dd48000000b004acc7b38c27mr8167223edw.28.1677693843132;
        Wed, 01 Mar 2023 10:04:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fy21-20020a170906b7d500b008cda6560404sm6039385ejb.193.2023.03.01.10.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 10:04:02 -0800 (PST)
Message-ID: <a6281345-95e1-3e8d-b6fb-146c1852373f@redhat.com>
Date:   Wed, 1 Mar 2023 19:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] leds: simatic-ipc-leds-gpio: introduce more
 Kconfig switches
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230301170215.23382-1-henning.schild@siemens.com>
 <20230301170215.23382-4-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230301170215.23382-4-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/1/23 18:02, Henning Schild wrote:
> To describe the dependency chain better and allow for potential
> fine-grained config tuning, introduce Kconfig switch for the individual
> GPIO based drivers.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  drivers/leds/simple/Kconfig  | 31 ++++++++++++++++++++++++++++---
>  drivers/leds/simple/Makefile |  7 +++----
>  2 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/leds/simple/Kconfig b/drivers/leds/simple/Kconfig
> index fd2b8225d926..44fa0f93cb3b 100644
> --- a/drivers/leds/simple/Kconfig
> +++ b/drivers/leds/simple/Kconfig
> @@ -1,11 +1,36 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config LEDS_SIEMENS_SIMATIC_IPC
>  	tristate "LED driver for Siemens Simatic IPCs"
> -	depends on LEDS_GPIO

Since it is simatic-ipc-leds-gpio-core.c which actually registers
the LEDs GPIO platform device, this one should stay IMHO.


>  	depends on SIEMENS_SIMATIC_IPC
>  	help
>  	  This option enables support for the LEDs of several Industrial PCs
>  	  from Siemens.
>  
> -	  To compile this driver as a module, choose M here: the modules
> -	  will be called simatic-ipc-leds and simatic-ipc-leds-gpio.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-leds.
> +
> +config LEDS_SIEMENS_SIMATIC_IPC_APOLLOLAKE
> +	tristate "LED driver for Siemens Simatic IPCs based on Intel Apollo Lake GPIO"
> +	depends on LEDS_GPIO

And then it can be dropped here.

> +	depends on PINCTRL_BROXTON

> +	depends on SIEMENS_SIMATIC_IPC

This should be "depends on LEDS_SIEMENS_SIMATIC_IPC" since it
actually uses symbol from that module.

> +	default LEDS_SIEMENS_SIMATIC_IPC
> +	help
> +	  This option enables support for the LEDs of several Industrial PCs
> +	  from Siemens based on Apollo Lake GPIO i.e. IPC127E.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-leds-gpio-apollolake.
> +
> +config LEDS_SIEMENS_SIMATIC_IPC_F7188X
> +	tristate "LED driver for Siemens Simatic IPCs based on Nuvoton GPIO"
> +	depends on LEDS_GPIO

Idem.

> +	depends on GPIO_F7188X
> +	depends on SIEMENS_SIMATIC_IPC

Idem.

> +	default LEDS_SIEMENS_SIMATIC_IPC
> +	help
> +	  This option enables support for the LEDs of several Industrial PCs
> +	  from Siemens based on Nuvoton GPIO i.e. IPC227G.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-leds-gpio-f7188x.
> diff --git a/drivers/leds/simple/Makefile b/drivers/leds/simple/Makefile
> index ed9057f7b6da..e3e840cea275 100644
> --- a/drivers/leds/simple/Makefile
> +++ b/drivers/leds/simple/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds.o
> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)  += simatic-ipc-leds-gpio-core.o
> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds-gpio-apollolake.o
> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds-gpio-f7188x.o
> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)			+= simatic-ipc-leds.o
> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC_APOLLOLAKE)	+= simatic-ipc-leds-gpio-core.o simatic-ipc-leds-gpio-apollolake.o
> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC_F7188X)		+= simatic-ipc-leds-gpio-core.o simatic-ipc-leds-gpio-f7188x.o

Regards,

Hans

