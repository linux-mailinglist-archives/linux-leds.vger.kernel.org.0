Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9673277B43F
	for <lists+linux-leds@lfdr.de>; Mon, 14 Aug 2023 10:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjHNIfT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Aug 2023 04:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbjHNIe7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Aug 2023 04:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C4F9C
        for <linux-leds@vger.kernel.org>; Mon, 14 Aug 2023 01:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692002049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RgXFFW+V5FTk3EF/2a/DSCETIneRMJrqKo+yjAx/Zs8=;
        b=cu/DgPjCI3UcR5wg8B0eriqp/aD0otvPfVFiXvWtQwGnrFrnGi+tO9jZ7zfrYRNs0LNZgZ
        cGrmEMyrFqHI0Kr8By3RDYwvS8ypSRwrhk3m8c9bLg3x1ze0kAAYL4b1J1ygMyoNDWismd
        qsL4IStxF6HUxdURUq4xm28og6OBe7I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-tFnaMiluMAW5JCgj_7rLjA-1; Mon, 14 Aug 2023 04:34:08 -0400
X-MC-Unique: tFnaMiluMAW5JCgj_7rLjA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99c0bd2ca23so245857866b.2
        for <linux-leds@vger.kernel.org>; Mon, 14 Aug 2023 01:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692002047; x=1692606847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgXFFW+V5FTk3EF/2a/DSCETIneRMJrqKo+yjAx/Zs8=;
        b=NGszjFsLQVfrkKnSsZFfWtXWpBT2fVWGlHoejqa7fGpT173LRyF4Yilzhq2a7mBcXN
         /ButcXFcyFwRrqcZGA78d2sTl/PbahhlndB1hfdH7MmdNrNPW4az9nLBKaa4mfsDPrsX
         Yva9wu6DS/RaWvTY5yV3dmOFIY62ZJ7GqrIhfoa+40bpajVG3Km8tbFUKeLKxOqqtRry
         qr6EjcMk4S7ph8408IQItrfL/+/5pgw9Bb6VICzQECsCNG4hEgIvclr0bC2NjEgJ2PNT
         /BzQse8vSv3L8NEhbfboFo6hf/zHi/HUQDo60oFnDSK0jEU75jgNRV9CQ7cdIYgKmSVL
         ljAQ==
X-Gm-Message-State: AOJu0YwvrtqCerSLzVLRt9IJ8ligsgGw4c78BoQrn7XCcZdLz/d8DSuj
        YsD7+mrhWeOhV7bkvcriO/8HvsERbebe+YzxKP1BcvzqELcLcRqxhIbQNggc+vEPeFM5Tg9P8um
        H01e7aN2upqHJUZ+t7iyjhA==
X-Received: by 2002:a17:907:7608:b0:99c:180a:ea61 with SMTP id jx8-20020a170907760800b0099c180aea61mr6625105ejc.32.1692002047132;
        Mon, 14 Aug 2023 01:34:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfL8E6nRn9oKZz3TvrEP1iFjy7/Sw0a6a81AvTaKtEKUsy7RECnJhv7Kt6XCM66ig2D9GMbw==
X-Received: by 2002:a17:907:7608:b0:99c:180a:ea61 with SMTP id jx8-20020a170907760800b0099c180aea61mr6625092ejc.32.1692002046875;
        Mon, 14 Aug 2023 01:34:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gf17-20020a170906e21100b00992e14af9c3sm5470076ejb.143.2023.08.14.01.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:34:06 -0700 (PDT)
Message-ID: <cf05f66b-c74e-79b8-f2ec-a41a2c7c5ead@redhat.com>
Date:   Mon, 14 Aug 2023 10:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] MAINTAINERS: Add entries for Siemens IPC modules
Content-Language: en-US, nl
To:     Gerd Haeussler <haeussler.gerd@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Xing Tong Wu <xingtong.wu@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>
References: <20230814073114.2885-1-haeussler.gerd@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230814073114.2885-1-haeussler.gerd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 8/14/23 09:31, Gerd Haeussler wrote:
> From: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> 
> There are different IPC driver modules in the kernel that are actively
> maintained by Siemens but not yet listed in the MAINTAINERS file.
> Add the missing entries.
> 
> Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>

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
>  MAINTAINERS | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f966f05fb0d..6ca5564a4f8c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19402,6 +19402,32 @@ F:	drivers/media/mmc/siano/
>  F:	drivers/media/usb/siano/
>  F:	drivers/media/usb/siano/
>  
> +SIEMENS IPC LED DRIVERS
> +M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> +M:	Xing Tong Wu <xingtong.wu@siemens.com>
> +M:	Tobias Schaffner <tobias.schaffner@siemens.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +F:	drivers/leds/simple/
> +
> +SIEMENS IPC PLATFORM DRIVERS
> +M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> +M:	Xing Tong Wu <xingtong.wu@siemens.com>
> +M:	Tobias Schaffner <tobias.schaffner@siemens.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/siemens/
> +F:	include/linux/platform_data/x86/simatic-ipc-base.h
> +F:	include/linux/platform_data/x86/simatic-ipc.h
> +
> +SIEMENS IPC WATCHDOG DRIVERS
> +M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> +M:	Xing Tong Wu <xingtong.wu@siemens.com>
> +M:	Tobias Schaffner <tobias.schaffner@siemens.com>
> +L:	linux-watchdog@vger.kernel.org
> +S:	Maintained
> +F:	drivers/watchdog/simatic-ipc-wdt.c
> +
>  SIFIVE DRIVERS
>  M:	Palmer Dabbelt <palmer@dabbelt.com>
>  M:	Paul Walmsley <paul.walmsley@sifive.com>

