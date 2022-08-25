Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E415A1101
	for <lists+linux-leds@lfdr.de>; Thu, 25 Aug 2022 14:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241441AbiHYMtE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Aug 2022 08:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241386AbiHYMtE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Aug 2022 08:49:04 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B99AE200
        for <linux-leds@vger.kernel.org>; Thu, 25 Aug 2022 05:49:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id s1so25276214lfp.6
        for <linux-leds@vger.kernel.org>; Thu, 25 Aug 2022 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UJPLpT2XcBKMANzNpVXlkK/AnxD3KVjPku+NRJRnKeE=;
        b=k+G/oX+tvXRqJzetOeviAPzbgrL5egIXfBvmKIq5DAMokEGsJbf7+FjfewZPAKLxtG
         9A0ZwzR5cxdj1yVttE4Kjl5Zo+Kq9whxkrYyo0uPvZQbvcH5tqTauCnW8hVNXVto6QNY
         oVvf9FVo+kSjS48LgQeaAlUre1eAe5TWgkZ2kWwZ6Eon03gXCSNth9suEYho74Q2lUBs
         xHIHrjn8IazmmRIwdr+Sf9fzW5EmmBjEPM5gtHm0ndTYDJqX8oD5lE/Z7V2IVC75lvx9
         GvNyJC0ZNLt5CwCUpquEm9bVouh1W/dMU1xQgqrF+Y0nO8O0W+ZLCODsv9u59pMuoySu
         mVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UJPLpT2XcBKMANzNpVXlkK/AnxD3KVjPku+NRJRnKeE=;
        b=p10l6EfEfjR0GRgF4K8d2Su/izrKZhwH7HdwO40PLPk/jyETXihg2cQqxABjn26i/N
         7EUV4/TYmRalxBO53nt+ER54S7hc/rKKLN3T0AqH3RThu0eoKs7wMGp6c0ylf2jmvu0o
         /2NOg9y4qw3BjHvwCnJUKi8ZKuK6kDQ+szmN34iBAOwjo1Lt1vL4SFawK47tV2sxka7G
         /foX1SBmu7Lmnurq59YOCDdC1agBQrj3rlyHsRIky/tfOqG2tlN6UOIWxHph76paczN+
         OtW8J7UcsWs0cfh7LwpbjGFg/l3/ldLA8hjSE29BKApb2vZ7AKzSnx4ksHrBYcQK2OxK
         QArA==
X-Gm-Message-State: ACgBeo3RWVQ8BefvYRH712ana67lvcAYOf8s6x4hz0UHOhBSxyWAi6Ur
        GauoSaGlASTAqjMe2i5frln4FQ==
X-Google-Smtp-Source: AA6agR6AgoXqICDhxJTbQc5viluo1tBN0fKOt4yUAyXgLOl/1YmAvzY3+oRl8yr7gVtpdjtYOrQmuw==
X-Received: by 2002:a05:6512:6d6:b0:492:b3df:a71 with SMTP id u22-20020a05651206d600b00492b3df0a71mr1250703lff.117.1661431741037;
        Thu, 25 Aug 2022 05:49:01 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id y12-20020ac24e6c000000b00492cdba2903sm486980lfs.97.2022.08.25.05.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 05:49:00 -0700 (PDT)
Message-ID: <5db5da26-3689-928b-433e-72c690014b64@linaro.org>
Date:   Thu, 25 Aug 2022 15:48:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND] dt-bindings: leds: qcom-wled: fix number of
 addresses
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 20/07/2022 19:37, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
> also fixes dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)


The resent was a month ago. I assume this won't go via LEDs tree, so I
will resend (again) without Rob's review, so it could go via Rob's tree.

Best regards,
Krzysztof
