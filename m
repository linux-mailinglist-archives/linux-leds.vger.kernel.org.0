Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8957536AC
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 11:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234803AbjGNJe3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 05:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235513AbjGNJeQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 05:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE2D3AA9
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689327134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5WIPITGie8aWJf1Y5BacRJ/+Iugz2cGX7LUF4Tt9Ync=;
        b=GQ7VeMNkdT2Ufpsg67vBtabJ6nFEE6cTGQEZXu4bGWv/sGBucjaSFCwgS/0daPWCfnLK6C
        ja/xjlVHLGgZqTb4fOJYnTEcUl4xB0AErdyvNhBttb7RikiGlv/dyTCAW2uJ7QhkDxBg6R
        4/e/Q/GRmq5hf2QbXSpwY8r9NnpO5oE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-Yb_ozML6MimiZbCrROr_UA-1; Fri, 14 Jul 2023 05:32:12 -0400
X-MC-Unique: Yb_ozML6MimiZbCrROr_UA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9928b4f1612so96014066b.3
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 02:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689327132; x=1691919132;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WIPITGie8aWJf1Y5BacRJ/+Iugz2cGX7LUF4Tt9Ync=;
        b=P48qYSVD5N+VwGMP2/s/oCGN0NwkrzoXq7zqWgaaqZwGwvQuItFo+kdBeizE4iNShx
         U0PhgO4Nhfn0hqbi9nLA24mBjKXUJbwFG/+w9bxGznLa+FTMPdnQ+guED8k6Gsms3bni
         uUuTr9LWUiZ1xsZRSG9p/ix2li1Vx4tGLuKSZRu5ltdFv2K+JFNfmItHUdEvwsd/ip3e
         X0sAH9kC30RX4DGXsu7vpw70N1DLTITLeWnDo78FOmJxFpdPbXvfr6YJYDlYlQI8UreM
         46PdB5aw21T9cCNnyYmHtfmGnlcpjfd53QsCBMhtS1CmQqgLGf7Kj2Q/oT8ghtJYlbF8
         4CGA==
X-Gm-Message-State: ABy/qLa4q485XeaKHL8a4OOJJq0wNXlu3pspkbHnvamwL6yoDullSDC0
        cDWgReSxq7KcmKggiqFemREmmsYzXNgSXrF1BqmJIOfm9MTqqXrhJ5lXtt2M1KVj/X49xvqjIJU
        qGZStWDbKbllSbOhWz8SkUw==
X-Received: by 2002:a17:906:c205:b0:986:d833:3cf9 with SMTP id d5-20020a170906c20500b00986d8333cf9mr3142450ejz.39.1689327131887;
        Fri, 14 Jul 2023 02:32:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFmEDt/4c1NMUesEW9NfelUBJRI8PSNiNz8H3xzkFWj2xhgl6JGOGwsNAlRdaXJubE4jvMj0Q==
X-Received: by 2002:a17:906:c205:b0:986:d833:3cf9 with SMTP id d5-20020a170906c20500b00986d8333cf9mr3142439ejz.39.1689327131611;
        Fri, 14 Jul 2023 02:32:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cd26-20020a170906b35a00b009929c39d5c4sm5150717ejb.36.2023.07.14.02.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 02:32:11 -0700 (PDT)
Message-ID: <9c0332e3-31af-3e02-1582-cf870af39987@redhat.com>
Date:   Fri, 14 Jul 2023 11:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] platform/x86: simatic-ipc: drop PCI runtime depends
 and header
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mark Gross <markgross@kernel.org>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20230706161040.21152-1-henning.schild@siemens.com>
 <20230706161040.21152-2-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230706161040.21152-2-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 7/6/23 18:10, Henning Schild wrote:
> We do not use PCI any longer since
> commit 446f0cf9e08b ("platform/x86: simatic-ipc: drop custom P2SB bar code")'
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Thank you. I've merged this into the new platform-drivers-x86-simatic-ipc
branch where I'm collecting all the pending platform/x86: simatic-ipc
work.

Regards,

Hans


> ---
>  drivers/platform/x86/Kconfig       | 1 -
>  drivers/platform/x86/simatic-ipc.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 49c2c4cd8d00..d9ba3cb9ac50 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1076,7 +1076,6 @@ config INTEL_SCU_IPC_UTIL
>  
>  config SIEMENS_SIMATIC_IPC
>  	tristate "Siemens Simatic IPC Class driver"
> -	depends on PCI
>  	help
>  	  This Simatic IPC class driver is the central of several drivers. It
>  	  is mainly used for system identification, after which drivers in other
> diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
> index c773995b230d..2523f6dc9db9 100644
> --- a/drivers/platform/x86/simatic-ipc.c
> +++ b/drivers/platform/x86/simatic-ipc.c
> @@ -15,7 +15,6 @@
>  #include <linux/dmi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/pci.h>
>  #include <linux/platform_data/x86/simatic-ipc.h>
>  #include <linux/platform_device.h>
>  

