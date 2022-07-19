Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24AF157945B
	for <lists+linux-leds@lfdr.de>; Tue, 19 Jul 2022 09:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbiGSHhd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Jul 2022 03:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236951AbiGSHhT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jul 2022 03:37:19 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39B821A
        for <linux-leds@vger.kernel.org>; Tue, 19 Jul 2022 00:37:17 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id w17so16400555ljh.6
        for <linux-leds@vger.kernel.org>; Tue, 19 Jul 2022 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=sJAYcdq03xe4By+++wmNYQtev4NH25m5XbVJlCxAKhY=;
        b=labb7V8yIQ9oV7IYhGTw8rQhbjNRT9jYln1Gz/yZG+mhPM+7PKdXWaSARdYAjMnMC/
         mQZL6+Hwe4UROoQTPEt/kIObZ2/C6ILHHYgfuXhc/lj4LodPLPn/oXMAczT62l8cLco2
         EyXxN8bX0NLFmizy40pTS28MPnIt1kxMK8YMiVr2Yl6iUq7qFJNspBS33Zu/9MQoTADc
         ASiPG4VKhXzdLIaInZFOL/UMBfh9DgXLWzOvUPh3DzneqeK14up54AlovNUdJbfXwMVN
         hmcZJxA7MSeKN/JAKz6aL2240KtF966HkPODHqbuz/cnSLemyiAsXmI9HV3LAOvztSnb
         tSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=sJAYcdq03xe4By+++wmNYQtev4NH25m5XbVJlCxAKhY=;
        b=ywrmw99J9zRAlg9DhmUxxav1wkX8Sta/4GiO0u0ePEOloiBPQmAxyRZmedisdKBJ0R
         2AhdJ0TgdbSsSry6Jis2b3wpH+v5039QvWLjcDXHqXWV/2occDt8kaQx9GtokuFmnyUh
         kZ8VHGW6FuE51ds6wrBqqUzA/xBlvjFSIbDqT5PMGlZuIuznuH4bsxaRBd5JudbfgYH/
         QdiHDYl4si4l0wP32WMfuDlKXQerNQOS/BaUnSG3jHrKpjwkzOkfvS8yfN1S/nnsmy1I
         rPmcIoR7tiifnJ86EoMwi/WjQzuEFLa+NxBEWczvBKU8GRzHhj8Xw3/oE7xySbbmFXL+
         xmFA==
X-Gm-Message-State: AJIora90SqP/OxAtNGkPA/ha/Zzp6L0PRCaFwjkWBMB5tQhY/ebsRNxu
        2bY1t2jSLc/NjgzbPHUEynvcRg==
X-Google-Smtp-Source: AGRyM1v+0WSuLLwqDbWDsEVRBHm53ZOz6nBAce2Td+pPMTiITsO05hXpEzHcrSov4UHqKDgVeX7NMw==
X-Received: by 2002:a2e:8785:0:b0:25d:473b:b60f with SMTP id n5-20020a2e8785000000b0025d473bb60fmr14467176lji.354.1658216236295;
        Tue, 19 Jul 2022 00:37:16 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id e22-20020a195016000000b00489de206812sm3030580lfb.151.2022.07.19.00.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 00:37:15 -0700 (PDT)
Message-ID: <d67e3a36-ccc7-2fb5-35da-315212370776@linaro.org>
Date:   Tue, 19 Jul 2022 09:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: lp50xx: correct reg/unit
 addresses in example
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-leds@vger.kernel.org,
        Kyle Swenson <kyle.swenson@est.tech>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
References: <20220607075247.58048-1-krzysztof.kozlowski@linaro.org>
 <1e71759b-32a1-3f35-6c08-b9ea4611e361@linaro.org>
In-Reply-To: <1e71759b-32a1-3f35-6c08-b9ea4611e361@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 20/06/2022 18:04, Krzysztof Kozlowski wrote:
> On 07/06/2022 09:52, Krzysztof Kozlowski wrote:
>> The multi-led node defined address/size cells, so it is intended to have
>> children with unit addresses.
>>
>> The second multi-led's reg property defined three LED indexes within one
>> reg item, which is not correct - these are three separate items.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> ---
> 
> Pavel, Jacek,
> 
> Any comments on these two patches?

Pavel,

Although previously this was "just" correcting the example, now it is
actually a needed fix because of changes which came later:
https://lore.kernel.org/all/CAL_JsqKHviWcynOu5AYJxtJ5xbQU6cU+r6tHy=ao+Wt4mE1aVQ@mail.gmail.com/

Can you apply it?

Best regards,
Krzysztof
