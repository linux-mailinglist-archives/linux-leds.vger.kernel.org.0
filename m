Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1804E53234A
	for <lists+linux-leds@lfdr.de>; Tue, 24 May 2022 08:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbiEXGgY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 May 2022 02:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbiEXGgR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 May 2022 02:36:17 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FE43EB87
        for <linux-leds@vger.kernel.org>; Mon, 23 May 2022 23:36:14 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v8so27242411lfd.8
        for <linux-leds@vger.kernel.org>; Mon, 23 May 2022 23:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=naO7MfUZImeoXwi1QHGtkiW2IkE7ZgBBCUBLVbjErGs=;
        b=tdjIKMzaQGMRuZHzjqWMkQra9s66xVHja7tX0VNqSU+hLS1xiKmO98GEsEHeZz20Q4
         QOovmZrew5aKqPKVV4p1RZ9PIl9t9fopan9WMpWk6KICBShIF1tpQt1OUuts2E2HdXKz
         PM1erRGq8wUDW1cwHx20Zohwi9i2Wt4lrqjBEp1hwNx88XexxzM4c64fUqssIJaT6+OJ
         DB1TJURiECE8uVjIk7F8qGvTEKr9zBlKfkoU01fmgJ9e4iQ3lrgcuPT9VaLsVtPa719n
         XxoDN6f+N/vWHsivFgCB9d/OVB7gDy98z28Ypnqz90lefgNwdygLE+qkIKao+lwTdUO5
         OnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=naO7MfUZImeoXwi1QHGtkiW2IkE7ZgBBCUBLVbjErGs=;
        b=CkrxO61N1JnxsA1eunh92dNmaXg/tthksWBXvKK3tLok1HS+kMk0TE1lsqZkrQrJPG
         mGfHxQyn2VTOYIbb8NKJpC1johG2Tx+uDqOfGLWFm8AddX0fHzywzHl60l5byFDj2/dq
         YYz5tdMGvSqabp1WOL4ttfwFNz5GA2UfWvxv4bAIICy/4PVLkBCmtqrEggy6VjWoAYTr
         7CLkhH+lTT2jbQ5utkdrGIbxAk1vNKb7Ql4unYgFJ5YIYFAPiW+6cvsi0X6BqffnCMwT
         b4zL0lUXDmqPzLS4nUMjE1Rmfi4wJDEcmAnIq5UsHysLPPnR6MgJuaBPtESeeoF8uIdr
         JwaQ==
X-Gm-Message-State: AOAM533GF7Yr+3d5T9gygbpjUOk0jz9CMAq30DJBPl8xsv7k6JsixokD
        RHsoJA36R6/h/uWZZHi0qmXknQ==
X-Google-Smtp-Source: ABdhPJznnkdfT2gEMM9zUFDFG/znJx0xsTuJYEjWAjhGfeGvsJeGRt1A3uUGSXqiLqwuYnVjGudssA==
X-Received: by 2002:a05:6512:1585:b0:448:3936:a5a0 with SMTP id bp5-20020a056512158500b004483936a5a0mr18327566lfb.108.1653374172109;
        Mon, 23 May 2022 23:36:12 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c3-20020a056512074300b0047255d2115asm2356464lfs.137.2022.05.23.23.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 23:36:11 -0700 (PDT)
Message-ID: <0d48b3fa-d6db-68d8-93a0-79902a119735@linaro.org>
Date:   Tue, 24 May 2022 08:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: leds: lp50xx: correct reg/unit addresses
 in example
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>
References: <20220518082215.14358-1-krzysztof.kozlowski@linaro.org>
 <20220523213528.GA2227380-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220523213528.GA2227380-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 23/05/2022 23:35, Rob Herring wrote:
> On Wed, May 18, 2022 at 10:22:14AM +0200, Krzysztof Kozlowski wrote:
>> The multi-led node defined address/size cells, so it intended to have
>> children with unit addresses.
>>
>> The second multi-led's reg property defined three LED indexes within one
>> reg item, which is not correct - these are three separate items.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Kyle Swenson <kyle.swenson@est.tech>
>> ---
>>  .../devicetree/bindings/leds/leds-lp50xx.yaml | 22 ++++++++++++-------
>>  1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>> index f12fe5b53f30..dc1ac905bb91 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>> @@ -99,35 +99,41 @@ examples:
>>                 color = <LED_COLOR_ID_RGB>;
>>                 function = LED_FUNCTION_CHARGING;
>>  
>> -               led-0 {
>> +               led@0 {
>> +                   reg = <0x0>;
>>                     color = <LED_COLOR_ID_RED>;
>>                 };
>>  
>> -               led-1 {
>> +               led@1 {
>> +                   reg = <0x1>;
>>                     color = <LED_COLOR_ID_GREEN>;
>>                 };
>>  
>> -               led-2 {
>> +               led@2 {
>> +                   reg = <0x2>;
>>                     color = <LED_COLOR_ID_BLUE>;
>>                 };
>>            };
>>  
>>            multi-led@2 {
>>              #address-cells = <1>;
>> -            #size-cells = <2>;
>> -            reg = <0x2 0x3 0x5>;
>> +            #size-cells = <0>;
>> +            reg = <0x3>, <0x4>, <0x5>;
> 
> The unit-address is 2, but the reg value is 3?

Right, the multi-led should be also @3 to match the reg and first led in
children.

Thanks.


Best regards,
Krzysztof
