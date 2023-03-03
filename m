Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0201A6A91D9
	for <lists+linux-leds@lfdr.de>; Fri,  3 Mar 2023 08:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjCCHnJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Mar 2023 02:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCCHnI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Mar 2023 02:43:08 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E56D511
        for <linux-leds@vger.kernel.org>; Thu,  2 Mar 2023 23:43:06 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id da10so6894272edb.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Mar 2023 23:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677829385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gViMsqJDHyWoh20pnFGzdswRPSKxSoq7HryhNEzggpc=;
        b=vZ3NbCk7mUrktEBkSKEbTbocizNyVcMHfPrXCcD6ppdHxZao4/WPrWvIA3LkAjKBKy
         ctxnZwyYO6MnyC1JC5RyF6+QmJLd/568ByT8+v2OEq/55oOLD6GeRrRukOF9Lfks1Ksr
         j/21b0QhNmfLJmomNx3nqy+Q5gTAee0SdVkzfNbgROVi7k0P6ABkB4fd+8ImzDr+0l7b
         kANzaLWhBDzt1hb6RBL2SW2jdBmXos/IHt5NWxNvcOOrOA5YalGK0msfHVaxeBihHIJ5
         GogmVjBmdmFdhjS6RNy6W5s75Rnlrn214dPsHIqfFZXaP3haqfepUCyKPDsWMWyh9/X7
         G/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677829385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gViMsqJDHyWoh20pnFGzdswRPSKxSoq7HryhNEzggpc=;
        b=a/WCZ8omlkgz5baVQowRGgaNbPlhVVFU9sLMkgtKD7YOkDV/EvULHX6kSsvU/r5wVz
         NBa1+lmGyvFESkHFws/kJ2adw+BHNvjfWf0j4sGlDh+iluB2DRksIkczpMf081FtEPXB
         xQYiUWMwa/XGBnvMIcVWXHCHgpVGB9fW8M6AHrrzP/jUqOHx5cYk/kMnpP8h9DZkENSr
         izafIMxSLjb3PoGjLiBEw2myeZy7YbhK+zkwZJdAHXzLbOqAQiIylDiuUmIa4egShitW
         LwC3mhVDjxiMVWVE82ivyEvTDBvhnnX0SpWIvRASgtuUiM1PJm7EmaREYHxdYBPXNZLK
         qIBw==
X-Gm-Message-State: AO0yUKXrpqaof/c5TlO/TJSQRhKoSL+9cn4HUTif4EWkLKo7bM39u5v2
        JPFiViu3z56LLOjqrE7EzPSprA==
X-Google-Smtp-Source: AK7set/dfgi/nJYCLFnP9cR+jO9Lt6iF4/ojLZYzUHf2Qy153CGHy0tyO8gvUFSWqBpv2osCqzuYWg==
X-Received: by 2002:a17:906:99c6:b0:8de:920d:a4bb with SMTP id s6-20020a17090699c600b008de920da4bbmr832246ejn.26.1677829384967;
        Thu, 02 Mar 2023 23:43:04 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906504200b008f767c69421sm654085ejk.44.2023.03.02.23.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:43:04 -0800 (PST)
Message-ID: <37b655cc-3808-5d8c-9d63-b0abe8d5e29a@linaro.org>
Date:   Fri, 3 Mar 2023 08:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add binding for aw200xx
Content-Language: en-US
To:     Martin Kurbanov <mmkurbanov@sberdevices.ru>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230228211046.109693-1-mmkurbanov@sberdevices.ru>
 <20230228211046.109693-2-mmkurbanov@sberdevices.ru>
 <8c3a16f6-f1fb-911b-b935-31ed8e227f8f@linaro.org>
 <6a4abcc5-5246-20ac-e25b-f88ee90c1331@sberdevices.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6a4abcc5-5246-20ac-e25b-f88ee90c1331@sberdevices.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 02/03/2023 17:02, Martin Kurbanov wrote:
> On 2023-03-02 10:48, Krzysztof Kozlowski wrote:
> 
>>> +  For more product information please see the link below:
>>> +  aw20036 - https://www.awinic.com/Public/Uploads/uploadfile/files/20200509/20200509151532_5eb65894d205a.pdf
>>> +  aw20054 - https://www.awinic.com/Public/Uploads/uploadfile/files/20200509/20200509151602_5eb658b2b77cb.pdf
>>> +  aw20072 - https://www.awinic.com/Public/Uploads/uploadfile/files/20200509/20200509151754_5eb659227a145.pdf
>>
>> Links do not work. Error 401
> 
> They are changed the links. I will correct in the next version.
> 
>>> +  awinic,display-rows:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      Leds matrix size
>>
>> Why do you need this property? Number of LEDs are known from the number
>> of children. Matrix size is fixed in compatible, isn't it?
> 
> Number of LEDs are known, but matrix size are programmable.
> Example for the aw20036, the matrix size can be 1x12, 2x12, 3x12.

Ah ok, makes sense.

Best regards,
Krzysztof

