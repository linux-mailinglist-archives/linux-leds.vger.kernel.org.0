Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF946DEC42
	for <lists+linux-leds@lfdr.de>; Wed, 12 Apr 2023 09:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjDLHJe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Apr 2023 03:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjDLHJd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Apr 2023 03:09:33 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16D530CB
        for <linux-leds@vger.kernel.org>; Wed, 12 Apr 2023 00:09:31 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ud9so26130400ejc.7
        for <linux-leds@vger.kernel.org>; Wed, 12 Apr 2023 00:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681283370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n54EsJ6yBbWy+99Uq8T7kmBnGcEminZ4uU6Ei5e8CDw=;
        b=Yqf1EPBTOZ6E/e8B3wH7y8kilH7wOx/YDPzcMYgkDkHg6XoH6we0FCCVeFIlJP6viL
         xV0hggGkUu6ia9qBwd3YlRAGWezDlq/6taWf7xWR0RAPM/gj+fMp+/D1v+iG3RzeJn+C
         cfnmuoDsobXw79fJEt2XgEhuteFqy9q4fLjdxDb28KR3L4uPInfgWZryIwboK1sIdTNc
         UnSkvmVWQ9iqB1Gv3fHMrz4wD0eyEHdCnIxE4g0NxDvRgKUYo7UBE12iz9Wh9TEXoATo
         QJAdMcJZiCy6QT1zK6y/MnV2x7h+U4uxkFcXpDczCQgmkauI6M9eVR68er3mv+qrEndG
         SJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681283370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n54EsJ6yBbWy+99Uq8T7kmBnGcEminZ4uU6Ei5e8CDw=;
        b=L/a0vwIioZItSBiK1e0OVfaMsPrjZ7Kp7gogMawFH2WuyhPn2GoS3266CbENp/rGmr
         y0m6IVNRT8KqO9ChEX21cMXnmHdXgHlTBKUlfXSI7gOZPF2V966foy/DZlYzxoxwYR+P
         VpEmBFZ+xPOTfmBBn9N3EvCYdApVw/+IWrmeAVxsG+/SVMbECkwwtPmJRC96ZhQrRmUS
         ls6lr8Tt/+0IOZaD495ay3ba6LTGU5uQY1NjblIXmhvIhjg6ItW8XUOxYTi3ZjBvj+UP
         fr+JElwiWvy91xLcEciWoTuuoHpbF+FDQlVDWvxZwCdGZxUp3qvJUkE7a+6+1BVUa5k+
         waUw==
X-Gm-Message-State: AAQBX9dlzlsC7qbgNlEoxOsNncUNS6HAYeax2k3jDA1f2PcSQaAqOwy+
        cfBfmC+ugUmFvODac/6Fi+MjcQ==
X-Google-Smtp-Source: AKy350Z75v3DcpypUUDdq/iWgi36nW75fEQMK+FCrPEJatNrxQGr1LgsdyYrMIRldRFqYcXRwkfjqw==
X-Received: by 2002:a17:906:4a0d:b0:94a:70f0:6321 with SMTP id w13-20020a1709064a0d00b0094a70f06321mr8674129eju.61.1681283370186;
        Wed, 12 Apr 2023 00:09:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id xd4-20020a170907078400b0094a941ad8f0sm2667038ejb.193.2023.04.12.00.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 00:09:29 -0700 (PDT)
Message-ID: <b4cfe598-f67c-23b4-8469-a5c487ae4e66@linaro.org>
Date:   Wed, 12 Apr 2023 09:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: ROHM BD2606MVV LED driver
Content-Language: en-US
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     pavel@ucw.cz, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matti Vaittinen <mazziesaccount@gmail.com>
References: <20230407050803.170773-1-andreas@kemnade.info>
 <20230407050803.170773-2-andreas@kemnade.info>
 <a16a8071-3c67-0f40-d7da-3459f7dc584d@linaro.org>
 <20230411213044.4bf6dc89@aktux>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411213044.4bf6dc89@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/04/2023 21:30, Andreas Kemnade wrote:
> On Mon, 10 Apr 2023 17:34:00 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> [...]
>>> +        led-controller@66 {
>>> +            compatible = "rohm,bd2606mvv";
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            reg = <0x66>;  
>>
>> reg is always second property in DTS.
>>
>>> +
>>> +            led@0 {
>>> +                color = <LED_COLOR_ID_RED>;
>>> +                function = LED_FUNCTION_POWER;
>>> +                reg = <0x0>;  
>>
>> Ditto
>>
> hmm, reg also second if no compatible first? I see it usually first in
> such cases.

Right, then reg is first.

Best regards,
Krzysztof

