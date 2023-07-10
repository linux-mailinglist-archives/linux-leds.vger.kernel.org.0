Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1F574D123
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jul 2023 11:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjGJJNV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jul 2023 05:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjGJJNU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jul 2023 05:13:20 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A328E
        for <linux-leds@vger.kernel.org>; Mon, 10 Jul 2023 02:13:19 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51d885b0256so5915196a12.2
        for <linux-leds@vger.kernel.org>; Mon, 10 Jul 2023 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688980398; x=1691572398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CG1I6tcp3hVAXZrFqTlwpFKD5HNiYVapIGC9q/FI7qk=;
        b=u3Z3N8bKi+D63EKsc5W2QQidjSz0pu73XtESpXnMSXp/uKHWmi9eNVtGJYt/T6+1jp
         2///OgqFP9FCzo916Sfegm5qrgZz/dzHxVFwszHymrxqBBYirTFsSJgOi9mRvCbpspqD
         kVYNKWR8050Bh6M6j0gdJiUnUp7c9uCWdBXdwVzCzHWg0gJ69SMmQldr/ZFiCFNtJ6Gk
         UhAiCfNipl/2h/6ZyGXA5hj+X1pCjv/uXDSVK6kSX+sBLuT6yfsj+CoY5pdGt8VkgFdO
         a+HsSDJ41/3+lA8yh+9Y8sBq88SoEZRfYc6GQCxFO3rwKyY6134fAIshqdDGxHQp6Das
         X41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688980398; x=1691572398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CG1I6tcp3hVAXZrFqTlwpFKD5HNiYVapIGC9q/FI7qk=;
        b=an4Ds7wv+frezBPZpWDYL3A4BVC3wPLABhlz7jJkhjugfQZCs03faNsYUKIrifmUyu
         9BgShRCLQYXgb0UrU/0Os9Qo3C36kJuif52DiEByPZhOhh+cdC0ze/sMTFw+iSz0Zol4
         4hxxuM60ADZ6lQEaagsum88kbRq7p5CPRjWHhI1LQQAHW71vOXhV8B/hOimRqstPRAKi
         trKY7OkWnOpHAytdg8MRMH07vJq3sOE8Pgs+szP+uZoSLQsrFUWuqlA7z4rKHJ93N8cb
         oAqlPMWK7S8MluDF7/SMrxFBB0a2KyeuSePEScl2Z12eZOu4Z7lulK3fYC5p7K/pJvei
         TN+g==
X-Gm-Message-State: ABy/qLabMlf1nqspkXXbANiwbleQnxkd5LUS6VTZ5Cq1KhPfwFeJEoin
        35RLpmFcCZJGamt4qWoq3Grx0Q==
X-Google-Smtp-Source: APBJJlFtjV+8ozh7/IexRCUGsvDLOnCizQ1Skj3GZ2L8qt9llerxbz6Q2n/F1po1q747/GJr+fONwg==
X-Received: by 2002:a50:eac5:0:b0:51e:fbe:dc81 with SMTP id u5-20020a50eac5000000b0051e0fbedc81mr11272122edp.3.1688980397756;
        Mon, 10 Jul 2023 02:13:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q25-20020a056402041900b0051de3c6c5e5sm5548648edv.94.2023.07.10.02.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 02:13:16 -0700 (PDT)
Message-ID: <361a4706-6a64-9322-3210-d9cd45827a2a@linaro.org>
Date:   Mon, 10 Jul 2023 11:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] dt-bindings: leds: Convert Panasonic AN30259A to DT
 schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Simon Shields <simon@lineageos.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Iskren Chernev <me@iskren.info>,
        Daniele Debernardi <drebrez@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230707210653.868907-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230707210653.868907-1-robh@kernel.org>
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

On 07/07/2023 23:06, Rob Herring wrote:
> Convert the Panasonic AN30259A 3-channel LED controller binding to DT
> schema format.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../bindings/leds/leds-an30259a.txt           | 55 ------------
>  .../bindings/leds/panasonic,an30259a.yaml     | 84 +++++++++++++++++++

...

> diff --git a/Documentation/devicetree/bindings/leds/panasonic,an30259a.yaml b/Documentation/devicetree/bindings/leds/panasonic,an30259a.yaml
> new file mode 100644
> index 000000000000..f55f8c232bc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/panasonic,an30259a.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/panasonic,an30259a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Panasonic AN30259A 3-channel LED controller
> +
> +maintainers:
> +  - Simon Shields <simon@lineageos.org>

Device is used in qcom-msm8974pro-samsung-klte.dts, so maybe its main
authors would maintain this binding?

Iskren Chernev <me@iskren.info>
Daniele Debernardi <drebrez@gmail.com>


Best regards,
Krzysztof

