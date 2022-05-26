Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B84534D56
	for <lists+linux-leds@lfdr.de>; Thu, 26 May 2022 12:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345544AbiEZKcT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 May 2022 06:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233811AbiEZKcR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 May 2022 06:32:17 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93EF2AC5E
        for <linux-leds@vger.kernel.org>; Thu, 26 May 2022 03:32:15 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gi33so2221966ejc.3
        for <linux-leds@vger.kernel.org>; Thu, 26 May 2022 03:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IhOoJiEVW1f9NZEh+LjhXs1p495IAP76V+trW0SBtRo=;
        b=fHJSBncXPQADirHt+O19VJemtFTXXzyJ9q03nrECjDpx0gclUcHS+ieBBLezoqaGC8
         fC9IFFI8ajtjcsHFcgywLvOMp38YGvBMAleD8t3/LJ+AzXKH8Ws0VP/al+A5cV+dvndp
         vbwzgeE6XPTvGSWaBMWaPbxOPw5U6SbRdTI6AzE9Ukhmj4/OFvziEXy8j39zUB7eEJhj
         FTN8mM+nJh+j543Nxch1kt4Eb2DiZFyFlU6AkDNnAYa7Thb88HRDsTB2Yf2h7GIIM3UL
         5G3W+O3JObh5EYYc+QDGbPhCcusMC6Vv+6UPGGM5+QCWxR3F7NvdX/5JM+LR+olH2syZ
         kYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IhOoJiEVW1f9NZEh+LjhXs1p495IAP76V+trW0SBtRo=;
        b=QQJ57wE18fgxcs9DgmoKE6+xcBbT4/XNxBEFDyGSsCFBoKSn3ug1aAnlbEa62mfAnU
         OLzyn2pijA7k035MlZre1+pMJGt3/kZsKSopdOwArl+jmTF6/HLSPmRB80Q6X6zkLDov
         LYfYFz0TNxoYDlqFjz9bDT5e+2njQWomvPkuEK2NLLzIb6hCuG7tGWP8l1/mVm/U5PQO
         XqbdB15/kjUvM+ZmJN9l8ojzsg2/w1bZSkPYK88e67YtQsi0JZeHBnkl4WEgBX/6mbVh
         wxJBBhO0sWfyUnNyyITK7o3E0L2DOw/f+bwla2zpfpF3H/hx2yKIN4XjAJl+UhciHZ/9
         eNqQ==
X-Gm-Message-State: AOAM533t1rycxoF3NOlZQw7UF8GcU3UYveo980ehv0JehiFNRtJvxEm7
        VqgOwGCcsvT6pT2erfRoUuRrlg==
X-Google-Smtp-Source: ABdhPJytcoRzpFy9P5lbgclcSPwMfqb4FHL8nr2e5PQ5uM1dp3kx1YyMinkEiWBL0zjylUDn4i5I3w==
X-Received: by 2002:a17:907:d21:b0:6fe:c340:616 with SMTP id gn33-20020a1709070d2100b006fec3400616mr22342567ejc.177.1653561134125;
        Thu, 26 May 2022 03:32:14 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i8-20020a50c3c8000000b0042617ba63basm610186edf.68.2022.05.26.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 03:32:13 -0700 (PDT)
Message-ID: <076d53d3-6062-686f-8e45-14c5f936bbf6@linaro.org>
Date:   Thu, 26 May 2022 12:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property
 for ocp level selection
Content-Language: en-US
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        jingoohan1@gmail.com, Pavel Machek <pavel@ucw.cz>, deller@gmx.de,
        cy_huang <cy_huang@richtek.com>, lucas_tsai@richtek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
 <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
 <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 26/05/2022 10:13, ChiYuan Huang wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年5月26日 週四 下午4:06寫道：
>>
>> On 26/05/2022 05:16, cy_huang wrote:
>>> From: ChiYuan Huang <cy_huang@richtek.com>
>>>
>>> Add the new property for ocp level selection.
>>>
>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>>> ---
>>>  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         | 8 ++++++++
>>>  include/dt-bindings/leds/rt4831-backlight.h                       | 5 +++++
>>>  2 files changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>> index e0ac686..c1c59de 100644
>>> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>> @@ -47,6 +47,14 @@ properties:
>>>      minimum: 0
>>>      maximum: 3
>>>
>>> +  richtek,bled-ocp-sel:
>>
>> Skip "sel" as it is a shortcut of selection. Name instead:
>> "richtek,backlight-ocp"
>>
> OK, if so, do I need to rename all properties from 'bled' to 'backlight' ?
> If  only this property is naming as 'backlight'. it may conflict with
> the others like as "richtek,bled-ovp-sel".

Ah, no, no need.

>>
>>> +    description: |
>>> +      Backlight OCP level selection, currently support 0.9A/1.2A/1.5A/1.8A
>>
>> Could you explain here what is OCP (unfold the acronym)?
> Yes. And the full name is 'over current protection'.

Thanks and this leads to second thing - you encode register value
instead of logical value. This must be a logical value in mA, so
"richtek,bled-ocp-microamp".

I see you already did some register-style for voltage. It's wrong but it
was done, so let it be. But let's don't make that a pattern...


>>
>>
>> Best regards,
>> Krzysztof


Best regards,
Krzysztof
