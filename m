Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6040D6387EA
	for <lists+linux-leds@lfdr.de>; Fri, 25 Nov 2022 11:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiKYKxF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Nov 2022 05:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKYKxE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Nov 2022 05:53:04 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFD024092
        for <linux-leds@vger.kernel.org>; Fri, 25 Nov 2022 02:53:02 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id bn5so4760507ljb.2
        for <linux-leds@vger.kernel.org>; Fri, 25 Nov 2022 02:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEwN7JkS6WniPfPWMk+RXfLAAAIl4/B53Bw+MxhtrFU=;
        b=ap+tN7oxIXF/Iww4hxFJQDkFJfGi7gJNOBrkUmOylGjD2pwZf3NHfoZdLtLUpA90l/
         Yp2lKYVzOvboZa8khcQTaJkKAsQLyFRQh8iIsiwV6TLJLqVOSC2d7+7VhI87dsF8laG1
         dCHfPghzJyboccKcm6/U+EINMI3tLE1PkpTfxF3RrzgO3Yick1IeeTwrqrxJ8RvT+0om
         tLeVVLTsSrxn5ArVF3PaZ97dy8V3m+5ZTc0jVn4N5p/ZCiHENXVf4zYkqaukR0BNHVSk
         FD+VpuQZxTtOW6IFz0vVg596oLdJKFJtUHteQAE52mJ6yOMynzHFETbr9XMkcoLVOi0P
         zlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEwN7JkS6WniPfPWMk+RXfLAAAIl4/B53Bw+MxhtrFU=;
        b=Mtz5dEBWXxWpEBWdfOm/X9FBpDauZ4Gv8UbZVzpClNWB2Lnb33Qt4NnX6h5jBHW9zR
         TyDIHym9OGu6eLbgL8ku+9+/I9NoN4O1CFRvGJboIldJnggpjK8d5/KzsQ1kJi4Bi+cT
         MUPovNV6ViUoqhJlFh0aD32w0DguNnbVCvhzCiSVaUSJiwixQHste32mJ41rwEzAF0YG
         WTCaPsrxtsmn/dDA3L4OGX4XyPBz+zMFYnkVWgukjhrrCrW1K9/k0nwhFTFZcYqFI0mE
         ZFMkyM7ZsH2gf92CZQ0nqLJtwRTLsAhXFfKbkd97x9vluj9kv+/SJFco93cpMkeH6M+S
         gFVg==
X-Gm-Message-State: ANoB5pl3qtomC6FsHLD72d1yXuuUj1n8iVk00vxjozZl3g9I0b0DLPo5
        b9hp+Mrs2BmOy/mSdVLks6kfdg==
X-Google-Smtp-Source: AA0mqf5Bz+xeqdp/OA/M1NSAuuwKDRC4vex7spZ08NxEseEh0JyiH+uBgt1NvJoyt6uGvEDNMYadNA==
X-Received: by 2002:a2e:7306:0:b0:279:9104:d60c with SMTP id o6-20020a2e7306000000b002799104d60cmr569976ljc.163.1669373580672;
        Fri, 25 Nov 2022 02:53:00 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b004a2cd6d5ad6sm488631lfr.19.2022.11.25.02.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 02:53:00 -0800 (PST)
Message-ID: <93f128ce-5229-5163-841a-66d3cd54130a@linaro.org>
Date:   Fri, 25 Nov 2022 11:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] leds: MAINTAINERS: include dt-bindings headers
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Olliver Schinagl <oliver@schinagl.nl>
References: <20220830083625.281462-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830083625.281462-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 30/08/2022 10:36, Krzysztof Kozlowski wrote:
> Include the Devicetree binding headers in LED SUBSYSTEM entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Anyone is going to pick it up?

Best regards,
Krzysztof

