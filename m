Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C28287E55
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 23:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgJHVv2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 17:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgJHVv2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 17:51:28 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F87C0613D2;
        Thu,  8 Oct 2020 14:51:27 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g4so7388894edk.0;
        Thu, 08 Oct 2020 14:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=937MMq6nZ+u8EQvLMqKOO+SU66NmCNZt9Udn4Wz7dCc=;
        b=n/gPcsXufTW9uavvXSx1jBullekgIigmYKZUjVebfsHHlMg0MMcqmwOuUAhdXrbhsH
         Q+xA/LFeqFO69CeIG5CsFX7ukwdCauDbX5t/Md7PIEejYLAUCLnxXfE6TKUj6GepjDWX
         rBtTRsO0rB+gpaDIzPkZ3Ms64MIs79E8UdTgqAbynOmXjEPFsKp7tplsj3zCymveJzSf
         vmuoDQV7W6PJFuWFh8Ai6e08CtaEmhKLU/bGpzfJjkY4vkHTLadlwldu4gDUGurq7nLk
         RJBgsubC/SxdqkMZYzxPcLbaMCfO53Er+U9obVTYRbfVYTu64MEq2OTyXyN8/N0Z17sW
         /g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=937MMq6nZ+u8EQvLMqKOO+SU66NmCNZt9Udn4Wz7dCc=;
        b=TiCdBKWHQAqKMkMoxEo5or1LndgqAE9UR9V5kaTkpDBUkC2R7JnhmJkiAmy7cWHdps
         7UrESaW5tktqUXRGZB8gschXqv5NA3URcvmij+Cfd8EWXWnruWTQC0iZyluf+d4sw/SP
         Uf6IFWCDBmt8SNs54HL56Ms7KKcklScZzp0vsXb/G3rqpF97NpobfK3Iop+XupzZJyxc
         mUAZtdX6wlP0X/nkadIs906iDEKtcOOjw+pA+y7VLTBPTMs2TNqFCYtV4TCvSYhklUvO
         kczIzUKo05Kkii4JLKTohIvBw4ME5+FpBX9i0CsiO1zOCtax8ZsCWbNxaUyCo6qX4fN+
         16uw==
X-Gm-Message-State: AOAM530ry64j26UeowGyVyLsawKPlC00tgxWMJAh1dFXEp/xe5VNrFEK
        TfObynR8R/LSCqFCZME0u80=
X-Google-Smtp-Source: ABdhPJzig8i/zEh6Ruxm9Ga8WfdfIsoFnQi4KGyIp/SyDrK5QDZr3bgIYhDIgw2Eu7O2N9XIDMbGqA==
X-Received: by 2002:aa7:d689:: with SMTP id d9mr11655949edr.128.1602193886641;
        Thu, 08 Oct 2020 14:51:26 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a188:5df3:7e17:9e85? ([2a01:110f:b59:fd00:a188:5df3:7e17:9e85])
        by smtp.gmail.com with ESMTPSA id m2sm5041400ejo.4.2020.10.08.14.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 14:51:25 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
Date:   Thu, 8 Oct 2020 23:51:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 10/7/20 3:42 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/leds/Kconfig       |  12 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6360.c | 783 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 796 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6360.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..c7192dd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,18 @@ config LEDS_MT6323
>   	  This option enables support for on-chip LED drivers found on
>   	  Mediatek MT6323 PMIC.
>   
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS_FLASH && OF
> +	depends on LEDS_CLASS_MULTICOLOR

Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
below instead:

depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR

Unless you want to prevent enabling the driver without RGB LED,
but that does not seem to be reasonable at first glance.

> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Independent current sources supply for each flash LED support torch
> +	  and strobe mode.
> +

-- 
Best regards,
Jacek Anaszewski
