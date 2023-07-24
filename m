Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934D175EC67
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jul 2023 09:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjGXHXQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jul 2023 03:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjGXHXP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jul 2023 03:23:15 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A61137
        for <linux-leds@vger.kernel.org>; Mon, 24 Jul 2023 00:23:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so5915560e87.2
        for <linux-leds@vger.kernel.org>; Mon, 24 Jul 2023 00:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183392; x=1690788192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iy/GT69EmEf7HLTcBeb61pi/V8qLsmpFTLyrEgxiJLA=;
        b=NzUzdVsimqx7g51FcscwcKiCc3Mz5Y2gk16jCf1ilaOHCz+ZM7PL4iotsQfc+w6QcY
         kvMdPpDkeQPwjUw3dwzOumEY+LV7ftLHHasWdIAMDToD4J8WgqVNcK5620ZHjWOmRpcx
         UnBvKNhYHYk/DDyzTVHwntXkG61b1vTwl5+ZVB6Se2jIFLt+MfP4cnnm2fktXFIxuvnY
         azW0kCusM4leYHv9L4XmopYDqpanvdLcS8xXolOyQAz2kd2KibeY1JxiajW9h3617xA1
         DiiaffjTvt2gjFXAOBZIrE0u2alH6a3mQAsYwHs+JGtkI+ALw8KgnCQ0fu5fyf1mJzzw
         k5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183392; x=1690788192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iy/GT69EmEf7HLTcBeb61pi/V8qLsmpFTLyrEgxiJLA=;
        b=h75fAkt/qhDS8zwNJvrEK1MmpSOlv8cLgJgqgmnbANIXQ+8bikXCnNIXWMckfKh7An
         JR0t7Hvun+SPbEinAtWptHQQVt0L+kSJw9PMSBikjBnK04ijNoeME8s+fMWB3Qvc+blh
         YAvu9vszy8HC9LTEljFF1RjK/rMFqPVtLXT3nMWg7mWC74Zm6InAfmnjNvN2ZZsOriD4
         2W7tVSFHLQTzEWhjQ/QzvW+nF2hzF4XHKo+nfma8aV9GF3kU7k907WsW3J/NWnZmCsxl
         v92LoQfLckAmbAD6VDw1nPWJ8nQZdGUlz6NfCPjtS7sOmEzzeq2MoQHp+a4kjYNAfLR+
         oMMg==
X-Gm-Message-State: ABy/qLaQREcL7JovisOgwKV3koiZTlCqQ7cH9pOqXG9VVKvoEIbm5jzw
        LU1kxAU6ygYTbPcEpC8M425Ubg==
X-Google-Smtp-Source: APBJJlGQLyiSoIC6lNFV7XBZ9Ao16PbIMbE2mihWrJXae2AzcR2E348sVKUhIKcvWsU+F7j8eKRZvw==
X-Received: by 2002:a05:6512:3987:b0:4f8:56cd:da8c with SMTP id j7-20020a056512398700b004f856cdda8cmr5455515lfu.34.1690183392278;
        Mon, 24 Jul 2023 00:23:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u16-20020a170906951000b0099b4d86fbccsm6399525ejx.141.2023.07.24.00.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:23:11 -0700 (PDT)
Message-ID: <0f016242-2380-274e-c6a4-118a5872412e@linaro.org>
Date:   Mon, 24 Jul 2023 09:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add gpio-line-names to STMPE
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 24/07/2023 08:35, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> stmpe2403 supports up to 24 GPIOs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Add min/maxItems
> 
>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> index 22c0cae73425..4555f1644a4d 100644
> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> @@ -28,6 +28,10 @@ properties:
>  
>    gpio-controller: true
>  
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 24
> +

I am sure there is no variant with one GPIO.

Best regards,
Krzysztof

