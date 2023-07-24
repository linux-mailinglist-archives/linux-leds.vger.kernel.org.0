Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F90A75EC6B
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jul 2023 09:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjGXHYG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jul 2023 03:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjGXHYF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jul 2023 03:24:05 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4EDE1
        for <linux-leds@vger.kernel.org>; Mon, 24 Jul 2023 00:24:04 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so5665566a12.3
        for <linux-leds@vger.kernel.org>; Mon, 24 Jul 2023 00:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183442; x=1690788242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBrXA3GfQqUqZF4hKq4KKQZVGsJT8J4SBU3nb0zPdIc=;
        b=vTksFXABghnZiSOnD0bW1YzvyKrWF7RWN8q75TD+vcEq1QW/hkPGoDaXm6PZ9CO9XS
         Gsk4NDvqLU/KRqKZ7AEiS2nq4k6510nvPjX09tbPSQ6yZUxdgMY456q4bXkn+tv8VcNz
         uU3iKbiIrRmJNDsL9vBHFPyfbZSCq0s6Q7kJv0XqOTa6GRsSWaI/Y0PkR5+BHtJIom8C
         ztVynBlHVoNU9hPpQm4cmB3s5xkxY1oACHXUlXcGoNX2JQRjoisleVqMm9AIolhN+2x6
         Td3k1Qs5n4oetbi7G/MAl54+qCWmoecqJGXOuocMLaLMRp48bSgLCDunV5NMzFP9CgVw
         BFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183442; x=1690788242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBrXA3GfQqUqZF4hKq4KKQZVGsJT8J4SBU3nb0zPdIc=;
        b=b+kE3m1RGDXFqVHDduZcUg3SXc2wK3Tzffp+WXTXURllQlb10/4tT+vUHTnnALNaWV
         xSFACaD4DNpv0IgT2+Loc/gLFZc+szJIWBVkZVbDP4Ns4Fi4TWpgAyg88Fnk2aKITvy2
         sAg5gMPPzQYDoMQg0z3XXWp6Ys3sm4ApS1CXWc0h/Nm6oKsA61LvJAWE7Pay2DzNkG72
         Qv6VFtdZHRQJmAEutjiqbSz1XJFSLXPV8CJ+dHE9zCTamEKaf7zqJCATFGig2L6Oyvvq
         FezonjBY457su/nfvpyafByoZdlV586sCG5RXf3noh3tSXWfcpLE7gPA9rbEYzG3jTX6
         ddZw==
X-Gm-Message-State: ABy/qLZo7ifarVJ582/wt//QSoLE+FsW4VepnR8keTz5mvd8V+1nx7+a
        1TLr374rN6+dQo8VjlMw4AKV/A==
X-Google-Smtp-Source: APBJJlGjYdU3iGP0Fguc6/73vVCUUIk+kJlhFXlg86MiGvd9WTlERBp8eHJaZ3yfX4z4ulPCBh/L1Q==
X-Received: by 2002:a17:906:749a:b0:99b:4e52:da47 with SMTP id e26-20020a170906749a00b0099b4e52da47mr7387743ejl.33.1690183442711;
        Mon, 24 Jul 2023 00:24:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v12-20020a17090606cc00b0099290e2c15esm6314315ejb.75.2023.07.24.00.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:24:02 -0700 (PDT)
Message-ID: <97565358-d11e-459c-8bf7-adfb3aa079ed@linaro.org>
Date:   Mon, 24 Jul 2023 09:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] dt-bindings: leds: Add gpio-line-names to PCA9532
 GPIO
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 24/07/2023 08:35, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> pca9532 supports up to 16 GPIOs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Add min/maxItems
> 
>  Documentation/devicetree/bindings/leds/nxp,pca953x.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> index edf6f55df685..9610bca57dd5 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> @@ -29,6 +29,10 @@ properties:
>  
>    gpio-controller: true
>  
> +  gpio-line-names:
> +    minItems: 1

GPIO expander which adds only one GPIO? That would be weird. Are sure?
Which model supports 1 GPIO?

Best regards,
Krzysztof

