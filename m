Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955D759069D
	for <lists+linux-leds@lfdr.de>; Thu, 11 Aug 2022 21:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236055AbiHKSxT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Aug 2022 14:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbiHKSxS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 11 Aug 2022 14:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 793BA9E11B
        for <linux-leds@vger.kernel.org>; Thu, 11 Aug 2022 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660243996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mNTgv0AuEhvVSuPncwI27XTWtpfQfISyWdWm6Vl1wMc=;
        b=CrifalUqBkyW3Ik5+ck8jct6apDUj0lxcm3y83cl8liJ3ZGVeSllD7hDerxFCoIMlBviLc
        mzzEXaNFT5jQg+OxcfRjNRKx36CQ0AzT1ONsanFciXiVmvYqIT4zZsLCEPtw22irndEr0j
        pujr+w0xHYk6lOcT68Fr6B1B5YOT2EU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-_fSb3CfCPCCuuqofuVY6Eg-1; Thu, 11 Aug 2022 14:53:15 -0400
X-MC-Unique: _fSb3CfCPCCuuqofuVY6Eg-1
Received: by mail-ej1-f72.google.com with SMTP id qf23-20020a1709077f1700b007308a195618so5739834ejc.7
        for <linux-leds@vger.kernel.org>; Thu, 11 Aug 2022 11:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=mNTgv0AuEhvVSuPncwI27XTWtpfQfISyWdWm6Vl1wMc=;
        b=Xu3fPS0Q6baYXE05uO4YZq6tYfG3maSoarnpoVs2u5Yli2RkFeU0WQOSTs/x/a4P83
         MfU9tVrNFKXQcOpWQ1JraRBPs5RBArVLCE8ygUrEThBMK1FrxwQOvAP8bS+NScVSmUxI
         d1FUkOeUVYT11DtTmI0TUb2kUsIo86ZiwsRFkmi3/ISpoi0ICu7QfoEc0gptOQ7MHbaE
         x9KaJkYqK8IXG3KXbXfh9bjraJ07Ks6muaMiNrwVBhd7USbaLxDxZzbEfuFyFUYJvFl8
         G6tvT2BJYzp+rb7s1f/fqTcwNzpsIN6cKQp7/su8LhMksP5+gDULzGOxWs1eacvGBEZY
         Qx+Q==
X-Gm-Message-State: ACgBeo0iuBSJ8JVFmkUYqMkOau6+rg9Dxqu/ia5R5DfbnNhhEEplCGd/
        wfxBz6+LtZxPIqJyliWbR+1G1FPlwcg1sFfbTkNyzPHf/NxsFSEx8rmBVlQbEpYWGSb2ftQ1O8G
        YpS2Hc7lOvcvxuTiIuWH/vQ==
X-Received: by 2002:a17:907:1361:b0:732:fefd:a25c with SMTP id yo1-20020a170907136100b00732fefda25cmr268485ejb.669.1660243994504;
        Thu, 11 Aug 2022 11:53:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7zIuHWrgeUe2LwDJaqQZO56x+cUnpSgRZYkbLZ1QfdOCd0S4zbn7anXleqyoD8RYoiG4k3Yw==
X-Received: by 2002:a17:907:1361:b0:732:fefd:a25c with SMTP id yo1-20020a170907136100b00732fefda25cmr268471ejb.669.1660243994295;
        Thu, 11 Aug 2022 11:53:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id me25-20020a170906aed900b007317f017e64sm3759882ejb.134.2022.08.11.11.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 11:53:13 -0700 (PDT)
Message-ID: <c6511d80-1b8a-5913-66f3-62ec27f5807c@redhat.com>
Date:   Thu, 11 Aug 2022 20:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 4/4] platform/x86: simatic-ipc: enable watchdog for
 227G
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pavel Machek <pavel@ucw.cz>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        simon.guinot@sequanux.org
References: <20220811153908.31283-1-henning.schild@siemens.com>
 <20220811153908.31283-5-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220811153908.31283-5-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 8/11/22 17:39, Henning Schild wrote:
> Just load the watchdog module, after having identified that machine.
> That watchdog module does not have any autoloading support.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Patches which are added to review-hans now are intended for
the next rc1. This branch will get rebased to the next rc1 when
it is out and after the rebasing the contents of review-hans
will be pushed to the platform-drivers-x86/for-next branch.

Regards,

Hans


> ---
>  drivers/platform/x86/simatic-ipc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
> index 1825ef21a86d..8dd686d1c9f1 100644
> --- a/drivers/platform/x86/simatic-ipc.c
> +++ b/drivers/platform/x86/simatic-ipc.c
> @@ -96,6 +96,9 @@ static int register_platform_devices(u32 station_id)
>  			 ipc_wdt_platform_device->name);
>  	}
>  
> +	if (station_id == SIMATIC_IPC_IPC227G)
> +		request_module("w83627hf_wdt");
> +
>  	if (ledmode == SIMATIC_IPC_DEVICE_NONE &&
>  	    wdtmode == SIMATIC_IPC_DEVICE_NONE) {
>  		pr_warn("unsupported IPC detected, station id=%08x\n",

