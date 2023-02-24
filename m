Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289266A1D6A
	for <lists+linux-leds@lfdr.de>; Fri, 24 Feb 2023 15:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjBXO3x (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Feb 2023 09:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjBXO3x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Feb 2023 09:29:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C445E84A;
        Fri, 24 Feb 2023 06:29:51 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B23633F;
        Fri, 24 Feb 2023 15:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677248989;
        bh=KHesiuIeicidiNCvlgoCpOZ0mvq0D8tKK9E3aADVfyM=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=JE9XBHAo/PRNHvanNRWfeFkJaD3uu4EHhC1q8Qhey5cY0tJ2ta29p1QV+uzkQiakJ
         UJ1xjpghhxndGeXzLdUfm7Gb7y9q7qrW+GItO+2zC3qrBtvjaY3k+Lip7Gga/gcIu7
         ICQ5rIuD+NSghDCtZ5K2z31kVJAPIc5QrUQRBsOk=
Message-ID: <e094f558-166b-c936-0621-f50af47dab71@ideasonboard.com>
Date:   Fri, 24 Feb 2023 14:29:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH 2/3] include: mfd: tps68470: Add masks for LEDA and
 LEDB
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230213124520.1635257-1-hpa@redhat.com>
 <20230213124520.1635257-3-hpa@redhat.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230213124520.1635257-3-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kate - thanks for the set

On 13/02/2023 12:45, Kate Hsuan wrote:
> Add flags for both LEDA(TPS68470_ILEDCTL_ENA), LEDB
> (TPS68470_ILEDCTL_ENB), and current control mask for LEDB
> (TPS68470_ILEDCTL_CTRLB)
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   include/linux/mfd/tps68470.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
> index 7807fa329db0..2d2abb25b944 100644
> --- a/include/linux/mfd/tps68470.h
> +++ b/include/linux/mfd/tps68470.h
> @@ -34,6 +34,7 @@
>   #define TPS68470_REG_SGPO		0x22
>   #define TPS68470_REG_GPDI		0x26
>   #define TPS68470_REG_GPDO		0x27
> +#define TPS68470_REG_ILEDCTL		0x28
>   #define TPS68470_REG_VCMVAL		0x3C
>   #define TPS68470_REG_VAUX1VAL		0x3D
>   #define TPS68470_REG_VAUX2VAL		0x3E
> @@ -94,4 +95,8 @@
>   #define TPS68470_GPIO_MODE_OUT_CMOS	2
>   #define TPS68470_GPIO_MODE_OUT_ODRAIN	3
>   
> +#define TPS68470_ILEDCTL_ENA		BIT(2)
> +#define TPS68470_ILEDCTL_ENB		BIT(6)
> +#define TPS68470_ILEDCTL_CTRLB		GENMASK(5, 4)
> +
>   #endif /* __LINUX_MFD_TPS68470_H */

