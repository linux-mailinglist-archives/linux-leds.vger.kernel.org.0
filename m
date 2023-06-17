Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBD87342B9
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jun 2023 19:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346392AbjFQRmf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 17 Jun 2023 13:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236761AbjFQRme (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Jun 2023 13:42:34 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAF4EA
        for <linux-leds@vger.kernel.org>; Sat, 17 Jun 2023 10:42:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9829a5ae978so296638566b.2
        for <linux-leds@vger.kernel.org>; Sat, 17 Jun 2023 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687023752; x=1689615752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wWvAWGQ6I3uVKkcwPxaCb9XbFnbEdfsJNuIbFzDQyw=;
        b=aRdxjDw/1uvXnJ//jlaQwyS/TqDcl1/7LzBQg/R1EXypY+rnCSK/aDPHd6Q+4ARnv4
         +NGnyV7dsW8AqrGmOwr/rR/VMnnoMMuDleT1XolFanwT3Kgg/pD9yP/t1KZl2GV3AH2j
         AZ7OuposYBI5ZkMMLmh/SKduk8jAxGkr6PFfpHHDhqjOcr/g2KkxXV+a6lk/CygopQ3j
         x/+8JctmHVdvEvaDP4TZBDZi5y2qR8yQMAKQwdTO1UPbtICOJVQ4Tmk/vjKUUT3+kWPG
         9Bb4KFGsv84LnW8l0rr4tltcD4pVuRDZD9jAHZhRxHlAgdpSDg/6P5R8vxdC0LmUzS/2
         rMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687023752; x=1689615752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wWvAWGQ6I3uVKkcwPxaCb9XbFnbEdfsJNuIbFzDQyw=;
        b=YyhmF2W45/XLBUs8CKIdJkL/c/NmHRkzMDLOMADUW8bgdnGOpkQWcMUUn/HBbaghWv
         S5T75f6Wc19ORsA2gO8CJsWvSmLWvNUgMequozHmHlMXPQF15BwKVaMicicm9C0+ez1J
         6Vgewn1RM8qZO8TjJK5ZIYML/Y4aGTJ5npSh35Sa+HKHBdwBLAU3+y4h1SzJnDe9v8YE
         34pwgJZifxkGVtb6M+COajs90vpKNm+G2Yc180sKbef90NwSCwBsA4zYu/yaGe8+pCJ/
         qoCxWk0F5K6lV/XS8LoLC/xTTJRR+0t+H1BaREa/WgjSWblfqKqvXOu4E+JoAIU99WB/
         UlOg==
X-Gm-Message-State: AC+VfDzQNhYykPScyYavekWFrtU6Ra6phDSkO62c7odDGlgtksOjFe3L
        WdqTrLt0uko0Qslowu6McrfCZw==
X-Google-Smtp-Source: ACHHUZ5PyeAyyYwAOEyIOLQVoZ7ixv/ktFKK7Bl05nXnE2sYt17DPKOVjyphVc5AwypZukVfvRQ7mg==
X-Received: by 2002:a17:907:a41e:b0:978:8ecd:fa75 with SMTP id sg30-20020a170907a41e00b009788ecdfa75mr5415289ejc.9.1687023751850;
        Sat, 17 Jun 2023 10:42:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m22-20020a056402051600b0051a4efed295sm51678edv.7.2023.06.17.10.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 10:42:31 -0700 (PDT)
Message-ID: <c29b2b0c-2b0c-f79c-9de5-58a67edd5c87@linaro.org>
Date:   Sat, 17 Jun 2023 19:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] dt-bindings: backlight: lm3630a: add entries to
 control boost frequency
Content-Language: en-US
To:     =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Maximilian Weigand <mweigand2017@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Maximilian Weigand <mweigand@mweigand.net>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
 <20230602-lm3630a_boost_frequency-v1-2-076472036d1a@mweigand.net>
 <17576d81-a342-0b77-367a-eb9f2b97b734@linaro.org> <7491264.lOV4Wx5bFT@diego>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7491264.lOV4Wx5bFT@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 17/06/2023 18:34, Heiko Stübner wrote:
> Am Samstag, 17. Juni 2023, 12:12:17 CEST schrieb Krzysztof Kozlowski:
>> On 14/06/2023 21:08, Maximilian Weigand wrote:
>>> From: Maximilian Weigand <mweigand@mweigand.net>
>>>
>>> Add 'ti,boost_use_1mhz' to switch between 500 kHz and 1 MHz boost
>>> converter switching frequency, and add 'ti,boost_frequency_shift' to
>>> activate a frequency shift to 560 kHz or 1.12 MHz, respectively.
>>>
>>> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
>>> ---
>>>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>> index 3c9b4054ed9a..ef7ea0ad2d25 100644
>>> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>> @@ -33,6 +33,18 @@ properties:
>>>      description: GPIO to use to enable/disable the backlight (HWEN pin).
>>>      maxItems: 1
>>>  
>>> +  ti,boost_use_1mhz:
>>
>> No underscores in property names.
>>
>>> +    description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
>>> +      If present, change the boost converter switching frequency from the
>>> +      default 500 kHz to 1 MHz. Refer to data sheet for hardware requirements.
>>> +    type: boolean
>>> +
>>> +  ti,boost_frequency_shift:
>>> +    description: |
>>> +      If present, change boost converter switching frequency from 500 kHz to
>>> +      560 kHz or from 1 Mhz to 1.12 Mhz, respectively.
>>
>> So just make it a property choosing the frequency, not bools, with
>> proper unit suffix.
> 
> i.e.
> ti,boost-frequency-hz = <x>;
> with x being 500000, 560000, 1000000, 1120000
> 
> with the driver failing when the frequency is not achievable
> with the two knobs of 1mhz and shift.

Yeah, with a default value (500000, I guess).

Best regards,
Krzysztof

