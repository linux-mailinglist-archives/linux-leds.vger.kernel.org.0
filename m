Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2582C476A
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 19:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732725AbgKYSQU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 13:16:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730735AbgKYSQU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 13:16:20 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08947C0613D4;
        Wed, 25 Nov 2020 10:16:20 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id s8so2830795wrw.10;
        Wed, 25 Nov 2020 10:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LoqWHN9+Qg4UFSxhhJfMuuZN/qPZlzzFucYRh+TRFe0=;
        b=P86nohJJq3cr+OQJ2wjf2hc+oL30Dp66VhxX/CkprRV5QW1SyyqsOc6Dl9eaxFAuEq
         7W98DRZEmAV/E6C+pFokXtWjsTce9xfD7pYnPPUClXy62xy0UDjJXPR+X0iTKsTbrOYu
         4cxglb7q+zceSThPqzJ3dXCyFgSjh+7BQL/7MiaEgpnZMf/y9jIEtvd/23x91j4BuHvi
         Gj6ORPStfK8knLRHpOiILumknIxm0AgwNfNwadDAXw3sLS1I0wRsxSemJ0h5dr+6T/tb
         6rnQB03VqcFi1zeidhUmw77Sw0y8jQLixuV3uvdBHPz0vEdHoQwIE3r0mC5fiUkbbrcd
         H2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LoqWHN9+Qg4UFSxhhJfMuuZN/qPZlzzFucYRh+TRFe0=;
        b=LbNt+u65thN5LcPC6NuzLtPuXeLd0KWJPLGDl4c2SJT+nJ5zmy4sO7tMzGcrAH2Eqx
         e8BHvNCaMx4iYlDOvGxvo1ykHOvkFkDvqCCnE8ha9+84IpC0AvjuuZmSza61A0WzvfbO
         8nPjwLpT/Bjpw1nfMluq/s6TrYXvAsic8NB1hA7HBTUbRgwL86hD4QnRfTibWkvfvizu
         FWwj0+avuOTUC37YL8v4bl17m8RZTnDqz4clYBET6Kpf19QBXIj++8jrMEoR3u3o9mUQ
         cxLiJ7L5sAY34w+pnG88+b0K9rGPHnw74grIUqW9nc0SPw3xPwRuzGZq2u+XTyE9pkzd
         8+sg==
X-Gm-Message-State: AOAM530VWbT/k6025xVjXULTmoXM+z5MGk0hTtOSup53BfP9pfb7jItB
        /uFQga7RU9ElhYb4cWkwhYI=
X-Google-Smtp-Source: ABdhPJyy9eaAoEXWVeIF8FDIaouES9oluGB2/979Jkt9NYDm9G+W1nWY6CnzkbxpX2Ksau4qAmAPow==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr5625395wrr.122.1606328178813;
        Wed, 25 Nov 2020 10:16:18 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a410:510b:ab5:5694? ([2a01:110f:b59:fd00:a410:510b:ab5:5694])
        by smtp.gmail.com with ESMTPSA id w1sm5158538wmi.24.2020.11.25.10.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 10:16:18 -0800 (PST)
Subject: Re: [PATCH v8 6/6] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606301475-7030-7-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <995b4c25-33f4-fb1e-39ab-3435c57488d3@gmail.com>
Date:   Wed, 25 Nov 2020 19:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606301475-7030-7-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

Thank you for the update.

On 11/25/20 11:51 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/leds/Kconfig       |  13 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6360.c | 811 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 825 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6360.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..4f533bc 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,19 @@ config LEDS_MT6323
>   	  This option enables support for on-chip LED drivers found on
>   	  Mediatek MT6323 PMIC.
>   
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS && OF
> +	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> +	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Independent current sources supply for each flash LED support torch
> +	  and strobe mode.

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
