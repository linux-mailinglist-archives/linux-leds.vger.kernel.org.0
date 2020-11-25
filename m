Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB642C476F
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 19:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733023AbgKYSQc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 13:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbgKYSQb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 13:16:31 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EFAC0613D4;
        Wed, 25 Nov 2020 10:16:31 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id s8so2831284wrw.10;
        Wed, 25 Nov 2020 10:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n4hwd00ocT6s6wXE4aWR7hZJHlhuuSKMzexv7VkV7Mw=;
        b=a9JuQV1OC/BQyeL00FMok9glgoVuNCD/+Elyq/nge76ARwshEepHQSKxr7kCBHnEbe
         MbhHgYK3tuF6bsTXWzEKNqX0n2TCW3r7paoRT/DOnj9snKjDsukcZIYO9qcf+z7/NI4Z
         fL2fF5iW2LLPI3sfTE+KRW8E0AxqgaBUMYZVPBfU5LEJLkRFHuk6rxtakxVNs5QkxF4G
         SGI+Km0FmdZNSH1Z2lPoPAkapzVEPz6GjkEqhbh0d97SaEmE1fBDFjuzuo+Yh5W7K8a1
         VgmKjac9tMJ8UWzDjf+CD/L2itp5DfxjT6VVun80JW1tiX9TB/Pmg6B0jqNdxZO0MT5C
         PKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n4hwd00ocT6s6wXE4aWR7hZJHlhuuSKMzexv7VkV7Mw=;
        b=InnU4MSauerLBs20dnzRQdInzHJPTpMWyJy1n2uSnYkE4xxsbHqDisoWSzeN/K1Fnl
         CxLLMnSavoHNyg82fOmc6eRx4yjKnXWOYv9qArRXB7nXcYQ0jdR3jyYxEtSzkmVtT5Wa
         xaRJL/Dl/V0178KcKcKWpTVTyWm6GVHgv5fDXGxh6GQU+y0abFDy1QZWAyoTxDgmLXce
         iVfQPJOraShcKbEzGKsKeAi375B6kCQ6/b9MaSqsouzvDaDht6vT4h3hAmH1hIrSH6tA
         hZ3Vfr3T8xmY0nEBBTKmQ+KidV8QswOctw/3sensyZ7kUiQ7cvlXXhFjHQgOVHucIeEP
         /zUQ==
X-Gm-Message-State: AOAM530xs9eHD26kqsBWYFjQnEmMM0qeyFJuAAGMWP7eIgbLiY6u2Vxp
        k0Qs4QAV0Z0gIF8kM+4Po0o=
X-Google-Smtp-Source: ABdhPJw8vmMWiSs7cDX0SbbFaXMxwan1mjJjv4qDg0Hsg/qazz8EKp0A2vyM0mumuAxawkEJuc70Sw==
X-Received: by 2002:a05:6000:151:: with SMTP id r17mr5726131wrx.157.1606328189902;
        Wed, 25 Nov 2020 10:16:29 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a410:510b:ab5:5694? ([2a01:110f:b59:fd00:a410:510b:ab5:5694])
        by smtp.gmail.com with ESMTPSA id b145sm6244969wmd.0.2020.11.25.10.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 10:16:29 -0800 (PST)
Subject: Re: [PATCH v8 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606301475-7030-4-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e16d7ef2-912e-8f2d-8368-603ba27833b3@gmail.com>
Date:   Wed, 25 Nov 2020 19:16:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606301475-7030-4-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 11/25/20 11:51 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add LED_FUNCTION_MOONLIGHT definitions
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/dt-bindings/leds/common.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 52b619d..843e65d 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -78,6 +78,7 @@
>   #define LED_FUNCTION_INDICATOR "indicator"
>   #define LED_FUNCTION_LAN "lan"
>   #define LED_FUNCTION_MAIL "mail"
> +#define LED_FUNCTION_MOONLIGHT "moonlight"
>   #define LED_FUNCTION_MTD "mtd"
>   #define LED_FUNCTION_PANIC "panic"
>   #define LED_FUNCTION_PROGRAMMING "programming"
> 

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
