Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972FA219126
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2020 22:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgGHUJD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Jul 2020 16:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgGHUJD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Jul 2020 16:09:03 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5E9C08C5C1
        for <linux-leds@vger.kernel.org>; Wed,  8 Jul 2020 13:09:03 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id dm19so6904edb.13
        for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2020 13:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cenGPbYIjmtEgnozaYwej+gZJg8hnKDbfp6YGC77jdE=;
        b=Y2zSgYZRoaa07ub1bUZvJoiIkdm0GvNUjaCIX1bn+IoO6ZUKSyM7kCVCpGKy7CHSyd
         zwuQw1f1WjLG8oWzMawG5KkiysD6OLxhgn+8MrzXhUD9G0k6gj8UHXPIB6LwtGx2P412
         Z5YVpG1ArCJ0dGLPb/mCDwtYq9sGWV6qozWGtFFUoF0b4HemNYlqt6cesI4JLcgIudZ6
         sfSIdBH70c5xDUMZ42uac6ln83x/tkoZvsANzynrreWs2gcMo0RPFFGxe/JBK4swrNKw
         iBGS7aqEzU+5GARubmf8/ShIgOM0AzsdoVlRN49QWwtVD7m/OnUR5U9td0R7h1zHtEpZ
         W4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cenGPbYIjmtEgnozaYwej+gZJg8hnKDbfp6YGC77jdE=;
        b=QyDMGVLch0/SvWCan4tTx8N1vrh9oxWPx7yEx+GL7pwGQ4Tjm4M9mZoAkldNvGXFsW
         7xI0QxssgLUws+wsxeZRmXEfjY7ygKeTmpdJroPdID7xZyJ1sNY8BHMIxeM5SFoLRRRP
         mJW7F3KLkUeMvZHtwrtyT+/aKBSQI/9Ixhea/EvyNFJ9vpPNkxrpe3PEuAzLJDKqNmFB
         v3hMOgdFT5WNPbEYeEa3j60eRR5C09t8wo5NxqBtuHV6t0nKE8Hm3AMzBwhdsVHgYbGK
         7W22KAFjHCbro46uyFYBtZdURlR8IqaCNinYZOCqb3ViR2+sjGQI50aHXJYpjn1CXcd5
         PE/Q==
X-Gm-Message-State: AOAM530W3xdUyWiLMVAxVYUW4jxLXLy+KSTI5hAyJbcsQU5zXdM5sJO0
        7FybAQd6PBhbQAQaW685tVI=
X-Google-Smtp-Source: ABdhPJx9dmwCGQo5Lc8xsyuISVXPHwdy8q0HrvomtbRG2/AN93zBBQZqcsHije23PTcBjeJ4GC6VtA==
X-Received: by 2002:aa7:d7d0:: with SMTP id e16mr69143280eds.10.1594238941848;
        Wed, 08 Jul 2020 13:09:01 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a021:30ff:e95f:2fd3? ([2a01:110f:b59:fd00:a021:30ff:e95f:2fd3])
        by smtp.gmail.com with ESMTPSA id m13sm341480ejc.1.2020.07.08.13.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 13:09:01 -0700 (PDT)
Subject: Re: [PATCH v2] leds: s3c24xx: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20200708071149.770334-1-linus.walleij@linaro.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <70bc78d5-c4b1-cc4e-9f5b-04acefff0b7a@gmail.com>
Date:   Wed, 8 Jul 2020 22:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708071149.770334-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

Thanks for addressing the remarks.

On 7/8/20 9:11 AM, Linus Walleij wrote:
> This converts the s3c24xx LED driver to use GPIO descriptors
> and also modify all board files to account for these changes
> by registering the appropriate GPIO tables for each board.
> 
> The driver was using a custom flag to indicate open drain
> (tristate) but this can be handled by standard descriptor
> machine tables.
> 
> The driver was setting non-pull-up for the pin using the custom
> S3C24xx GPIO API, but this is a custom pin control system used
> by the S3C24xx and no generic GPIO function, so this has simply
> been pushed back into the respective board files.
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix two GPIO lookups in the smdk-common.c
> - Rename the lookup table for the backlight LED in the
>    Mini2440 to feature the name "backlight"
> - Simplify the logical operation in s3c24xx_led_set() to
>    use boolean clamping with !!value.
> ---
>   arch/arm/mach-s3c24xx/common-smdk.c        | 67 +++++++++++++++-------
>   arch/arm/mach-s3c24xx/mach-mini2440.c      | 63 +++++++++++++++++---
>   arch/arm/mach-s3c24xx/mach-n30.c           | 54 +++++++++++++++--
>   arch/arm/mach-s3c24xx/mach-qt2410.c        | 12 +++-
>   arch/arm/mach-s3c24xx/mach-vr1000.c        | 38 +++++++++++-
>   drivers/leds/leds-s3c24xx.c                | 36 +++---------
>   include/linux/platform_data/leds-s3c24xx.h |  6 --
>   7 files changed, 199 insertions(+), 77 deletions(-)


Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
