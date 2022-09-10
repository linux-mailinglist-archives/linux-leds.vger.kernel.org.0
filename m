Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E505B462E
	for <lists+linux-leds@lfdr.de>; Sat, 10 Sep 2022 14:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIJMSP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Sep 2022 08:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIJMSO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Sep 2022 08:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB45D564F1
        for <linux-leds@vger.kernel.org>; Sat, 10 Sep 2022 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662812290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/FRsG/dVUcBq+AAvCuweXj5HBJV8wUmwtqqS0ZZG34=;
        b=Srcwq7rkhdhTwiR+XnMZhq/gIZb6qEr6R/E6niRrpyr/ab8CBCiTVthkGvp5FgetDDvnk8
        Q/dbq25ngNMoibJfDc0fUZuF1K/rZD/NEUeMtxyO2VY/FEnToR+o9+8eV/7huc7EZ3Xmlo
        X5Hd5Va6S1t+iLxUrEQ6H3qJJmQ+MMU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-ys7c3adkOciRf81XifRpOw-1; Sat, 10 Sep 2022 08:18:09 -0400
X-MC-Unique: ys7c3adkOciRf81XifRpOw-1
Received: by mail-ed1-f72.google.com with SMTP id y12-20020a056402358c00b00448898f1c33so2956756edc.7
        for <linux-leds@vger.kernel.org>; Sat, 10 Sep 2022 05:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=i/FRsG/dVUcBq+AAvCuweXj5HBJV8wUmwtqqS0ZZG34=;
        b=YR1yrGIb7DLR9BLWCYpJKZFFcl+guHlehLcVMve4JY+znO8PBkF05eHah4yc+oC1t+
         5pnNSY+NH8vINQJsW1A8VCM3wO13MT/2yvDJwwAjov93kfSXx0rOPmu1SsIZtwO+t6gl
         HrcXypZXpRTp2/qi80J9pafV69tHltL72c1C2IlG/m0xAgSfvBxzAqcB9kLZO4ThPbgk
         zsARwn0JR4S9v/3vqUKhU1elkPii3MMVBHZ8wdb+0VWZri+FpYpCsYcVpJkJwgRJW8WP
         QkRYcNngx26Vbsw9OfsLJj5XcFocP1DsaQ7ynMGnjvo+GypBb9g3985t+KILGy1fxe2T
         ncVQ==
X-Gm-Message-State: ACgBeo1Li72VsN83hSfc1RlrrRejTG3NSTk7x8IB25ARCg2AStEytec0
        CUNlP6ceB7beX2tQ6EdETCohMesldNFjpZchfavUrq3r0WIqBsATxskdaGVdzMIv7DU30BMlzFS
        7f/6WzcjGNlIyZgu6j/wQkQ==
X-Received: by 2002:a17:907:7625:b0:779:e6f7:a669 with SMTP id jy5-20020a170907762500b00779e6f7a669mr4987102ejc.472.1662812288491;
        Sat, 10 Sep 2022 05:18:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Bk2s8xyq2yOpGzT95zQqoFlBekTedY+iINGUaiPKyiDZH5kXo6Xhm77IOMGQQGS9VBgzAeA==
X-Received: by 2002:a17:907:7625:b0:779:e6f7:a669 with SMTP id jy5-20020a170907762500b00779e6f7a669mr4987099ejc.472.1662812288320;
        Sat, 10 Sep 2022 05:18:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906310900b00779cde476e4sm1665800ejx.62.2022.09.10.05.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 05:18:07 -0700 (PDT)
Message-ID: <25825749-1c7b-eb81-cfce-2d4c589c10c1@redhat.com>
Date:   Sat, 10 Sep 2022 14:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] leds: simatic-ipc-leds-gpio: Make
 simatic_ipc_led_gpio_table static
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>,
        Henning Schild <henning.schild@siemens.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20220910085836.84962-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220910085836.84962-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi all,

On 9/10/22 10:58, Hans de Goede wrote:
> simatic_ipc_led_gpio_table is only used inside simatic-ipc-leds-gpio.c,
> make it static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note since this is a fix to a patch which I merged through the pdx86
> tree I plan to merge this today through the pdx86 tree as well.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/leds/simple/simatic-ipc-leds-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio.c b/drivers/leds/simple/simatic-ipc-leds-gpio.c
> index 0d73dcbeec2d..b9eeb8702df0 100644
> --- a/drivers/leds/simple/simatic-ipc-leds-gpio.c
> +++ b/drivers/leds/simple/simatic-ipc-leds-gpio.c
> @@ -15,7 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/x86/simatic-ipc-base.h>
>  
> -struct gpiod_lookup_table *simatic_ipc_led_gpio_table;
> +static struct gpiod_lookup_table *simatic_ipc_led_gpio_table;
>  
>  static struct gpiod_lookup_table simatic_ipc_led_gpio_table_127e = {
>  	.dev_id = "leds-gpio",

