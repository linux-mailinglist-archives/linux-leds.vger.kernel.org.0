Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC82566FA6
	for <lists+linux-leds@lfdr.de>; Tue,  5 Jul 2022 15:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbiGENnz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Jul 2022 09:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbiGENn2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Jul 2022 09:43:28 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD32201BC
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 06:07:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t25so20441943lfg.7
        for <linux-leds@vger.kernel.org>; Tue, 05 Jul 2022 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zbkJQitCCB4JIY77EtUWLU2dvmK4r/1hyyXKadOjVuk=;
        b=Y5fC7OWZuDKf24I0MV+8pbvacfRq5CpAm7myf5QLNeQ+ruoEM4xzzTMzeWHqAU4rDl
         meIsa1R/5ZXa6+KXMiGEznU0U6Cx1zVGVsplX31icjx1gfbVm7VPKwsvg++vCIQCfgLh
         nnJWoZ0vsZWqDkWMLyR3ynZ15eJsd51irIIwFC+OcgSkVmrK2xYypXRlXe+xBXy1ATyj
         d+HleFZ95SL53prO/dlNuzAKmSzabgXGJmbOb3nwtULUNmsvREbe3gJ+gBwOg4ieICBw
         G4uLvh4pSWuLay39UzOaB+OvYTJm6QMjxK+wYM30JTtzG7pugXDtnIHQ3QuR/Cd7V9VI
         uoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zbkJQitCCB4JIY77EtUWLU2dvmK4r/1hyyXKadOjVuk=;
        b=oSRGvfCMP0GxsgdA7V7sPyt51JtMw6wwvwTYpozrLhgbGa4vhlucjFzxYsnfhiZKZP
         uxLvjaEDfvjbJ/IDkoaY8pLGRGpE4t0qcJ9gutKVynP2+HsXOSYARkJ2aBcGOA5QGsQJ
         Su9nubq/E8pLd+t0KGGyoGmh7f6aj+3mkBL+060t450Mmz3XWrYT0Qaav2nd5npGRle7
         dxtBCF1XlIa3WmTzRpo4bn9eQuChndzGCXdmXnVibsZYgwZMj3PUpnf4IvMYzsoFvHFg
         V7fO+vhXz3enIb4tY/G/7myXNU1QbspxpchXJHHzm2jPnu04ebbLPXkWwljOkKiv3Enx
         SEcQ==
X-Gm-Message-State: AJIora8y4ombv4Si4tj0QWmd1Nj/ZA9T2p8u8i0eEQBOmp4vMUVhIyDA
        Bd3QPTrDY5KSoGoFFNpS1zhLZbfXzF6oFQ==
X-Google-Smtp-Source: AGRyM1unrH7/KXqgrUw0VN4FOA+NEao2KQ6Mp/vj2A5DmtcTSTdiZPVwcD0NO8/kYjMYNCgLInjTKA==
X-Received: by 2002:a05:6512:2346:b0:484:4837:eba9 with SMTP id p6-20020a056512234600b004844837eba9mr1186235lfu.37.1657026452443;
        Tue, 05 Jul 2022 06:07:32 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id dt7-20020a0565122a8700b0047f674838a5sm5680112lfb.231.2022.07.05.06.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 06:07:31 -0700 (PDT)
Message-ID: <3897aace-bce5-cad4-d92f-40cef4d0e207@linaro.org>
Date:   Tue, 5 Jul 2022 15:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add cznic,turris1x-leds.yaml
 binding
Content-Language: en-US
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220705000448.14337-1-pali@kernel.org>
 <42d837dd-fbd1-6294-2fa0-8a07ae0f8d44@linaro.org>
 <20220705114238.xwgexavgozqskwbw@pali>
 <90fd55cb-13f4-eac2-2b1a-85ae628ecc89@linaro.org>
 <20220705121541.t7jjcjp4hkqprsdo@pali>
 <3358f88c-5c58-ae0d-2c26-7ba9a954b491@linaro.org>
 <20220705130550.uu6ix7tdtswn7vaf@pali>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705130550.uu6ix7tdtswn7vaf@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/07/2022 15:05, Pali Rohár wrote:
> 
> This was the first thing which I did when I read email. No usable
> result. So the next thing was that I started git grep on the linux tree.
> Again no result. So at the end I come to the conclusion that you forgot
> to copy+paste whole quote or something like that.
> 
> Now I started searching a bit more and found it in following documentation:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> Original link to the quote would be useful (but now I have it).

Good point, thanks for the link. I forgot that devicetree spec is also
available as webpage.

Best regards,
Krzysztof
