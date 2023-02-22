Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725C269F915
	for <lists+linux-leds@lfdr.de>; Wed, 22 Feb 2023 17:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjBVQfG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Feb 2023 11:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbjBVQfA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Feb 2023 11:35:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF45367EF
        for <linux-leds@vger.kernel.org>; Wed, 22 Feb 2023 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677083656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q8esxfJVTT75yFXIXwSeTLZl15U5SPnHoZLa97NCnZE=;
        b=VG8Xp5bq/5NsgjWhXyyNmjbMVsCr5n3tDlyVvaRxlhEbgTJLb3LhOWgvCl4hk3odTBt9Xf
        e1t5VmA8YexavPKJcI1pc8rwpEZuGPLznCz2844T2Jsej2ZLM/WSN3PIlJMGpPr8bNUv2J
        ieY5QHwnNz690Pu9VDxmaWznmnSmFVM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-X6_XD0J0PP2xQCJoKKFyJA-1; Wed, 22 Feb 2023 11:34:02 -0500
X-MC-Unique: X6_XD0J0PP2xQCJoKKFyJA-1
Received: by mail-ed1-f69.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so11238843edc.9
        for <linux-leds@vger.kernel.org>; Wed, 22 Feb 2023 08:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q8esxfJVTT75yFXIXwSeTLZl15U5SPnHoZLa97NCnZE=;
        b=lDlsQfppyoyqxQjvEXLHt2KSdwo/bPq1+jbKA+sYzbazVxxUwyvSomT/MjRamiu1F+
         yvAba1GOcUP0ozsQ1RvTUjGACv5tuhnnUfUpzazjiCS2c+YUdib1DbV34UiskCuyF9VV
         2CNIWFiWGUVRv+qIjo4GDfkVRGHcJ0mrJMfK7qoL7+dSwzIx+dT4tTduGgZNzcI8gzJA
         RlHkKyBRWYsO7vqhxzgmzYqwF4w5gekpYIRHroCA1LG/O2Afwez5uiZ7NVXMrXZTjAd8
         TMYGgi87vijoTboeq+H81WcoI7uHi233ImgDXRibwlHEaVMZkL7BVOZuC+DDSBq/GF50
         i0ew==
X-Gm-Message-State: AO0yUKWlDeITQV3dRG89G1riNhkfBTSb93fwI2rriVLT/r5eoyttj8Xv
        20HlllE1NIPPcGtVrqkrMt6FOM6Kbx7dcDORRbzQMNqIOHGx1QhGJC6l84dlOHJzo3FJmJZS700
        hHvi8p9OTwTbThL3CCHLJtg==
X-Received: by 2002:a17:906:261b:b0:8aa:c105:f0bf with SMTP id h27-20020a170906261b00b008aac105f0bfmr17895412ejc.17.1677083641735;
        Wed, 22 Feb 2023 08:34:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8Lsm6/R+Yo2xM+J57hhLzO45cFnz7ctQpLIoyPFTlAQ5hAIVHME6/77ief6JsuGXUNWzjVAQ==
X-Received: by 2002:a17:906:261b:b0:8aa:c105:f0bf with SMTP id h27-20020a170906261b00b008aac105f0bfmr17895387ejc.17.1677083641475;
        Wed, 22 Feb 2023 08:34:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709064b0e00b008c979c74732sm5054746eju.156.2023.02.22.08.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:34:00 -0800 (PST)
Message-ID: <cee654ea-0961-bf5d-2bcc-87e9b980b3d8@redhat.com>
Date:   Wed, 22 Feb 2023 17:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH 2/3] include: mfd: tps68470: Add masks for LEDA and
 LEDB
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230213124520.1635257-1-hpa@redhat.com>
 <20230213124520.1635257-3-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230213124520.1635257-3-hpa@redhat.com>
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

On 2/13/23 13:45, Kate Hsuan wrote:
> Add flags for both LEDA(TPS68470_ILEDCTL_ENA), LEDB
> (TPS68470_ILEDCTL_ENB), and current control mask for LEDB
> (TPS68470_ILEDCTL_CTRLB)
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  include/linux/mfd/tps68470.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
> index 7807fa329db0..2d2abb25b944 100644
> --- a/include/linux/mfd/tps68470.h
> +++ b/include/linux/mfd/tps68470.h
> @@ -34,6 +34,7 @@
>  #define TPS68470_REG_SGPO		0x22
>  #define TPS68470_REG_GPDI		0x26
>  #define TPS68470_REG_GPDO		0x27
> +#define TPS68470_REG_ILEDCTL		0x28
>  #define TPS68470_REG_VCMVAL		0x3C
>  #define TPS68470_REG_VAUX1VAL		0x3D
>  #define TPS68470_REG_VAUX2VAL		0x3E
> @@ -94,4 +95,8 @@
>  #define TPS68470_GPIO_MODE_OUT_CMOS	2
>  #define TPS68470_GPIO_MODE_OUT_ODRAIN	3
>  
> +#define TPS68470_ILEDCTL_ENA		BIT(2)
> +#define TPS68470_ILEDCTL_ENB		BIT(6)
> +#define TPS68470_ILEDCTL_CTRLB		GENMASK(5, 4)
> +
>  #endif /* __LINUX_MFD_TPS68470_H */

