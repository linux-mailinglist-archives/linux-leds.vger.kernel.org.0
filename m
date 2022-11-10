Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603C06243F9
	for <lists+linux-leds@lfdr.de>; Thu, 10 Nov 2022 15:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbiKJOOn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Nov 2022 09:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbiKJOOX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Nov 2022 09:14:23 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4D578301
        for <linux-leds@vger.kernel.org>; Thu, 10 Nov 2022 06:14:05 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id r12so3521911lfp.1
        for <linux-leds@vger.kernel.org>; Thu, 10 Nov 2022 06:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Bnc98wbgCB157XtXlJ5NroBNxycOACeQVxm/1SPVs4=;
        b=Rc8RZYG1UdjHBqHXSpcw7c7Fl3OJIs+mgExR8ZEe+5iDezQTN7XCfKOzGLV02/GFzS
         f/trH0orM0q51kSUF73Jh+5teXTHMGgop3zKei6pVMxbmjbWjTYs9lq2vQs2RnjphnQ3
         LgSP8Bc4k/E3y8YRK+/mnx8OBi+H+tM54YOVRgKfdccfzllR8qzxjpbYGQH0mCZgOhUe
         UhMDSyIlPoNcKmkFND1CIVA6MF+tt9bS735B5d2iMMgsDtOchwiUlt5TpwtcsjOobjzs
         HDfDXm+QzsaftiReSvZqrCYSwatcVOQ01Beaep3NFZlgzJJJpUKFonaZqqpxfM3s9B+V
         yfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Bnc98wbgCB157XtXlJ5NroBNxycOACeQVxm/1SPVs4=;
        b=JoQzQL2Lb0id2JvOQvkEJfh/T6XajGVfzPVlw09l2lRW7xUpYg+2hnB2yTDyW7+F0H
         OsgGLZbeV7ej/qZYexzF0C3v5M9PdyZPKuEYgdqI4vitxUIV8s68xbkgauylWvYsVgdv
         fiI8gshLuQLGhof7qSDBOagd0DaFXZbCHP40SOgHC41p5xBCThWY1HHfHXNRNadYvBZm
         Tuk20lk0ShcEfGS/DSaKXFs+zip3k5pAz1EFjpUyvIqDDb4UDpGtFLzhwqS3/Psed7Ws
         m9kyQ7XSSmdZ7vCZXXYnJgePFJgK1KkKYMvk2YQ53t6VfaNWxRgEnvLTb95L9csoDa44
         yPng==
X-Gm-Message-State: ACrzQf34SW5PlJ8iSBsOS++Vt54fORDZZytlWxynjo6wNDBiNzl2T36P
        d9245WAz/EMAq+wZWQY2pgdgdg==
X-Google-Smtp-Source: AMsMyM4Zc2mDjlY+RRgIUEdLQhsv+UxcTsSgJuQjuIQHS1FrmkKKXs/oNCb5HFgDi7jqXQw2KQ4odg==
X-Received: by 2002:a05:6512:32b7:b0:4aa:8d5a:2f53 with SMTP id q23-20020a05651232b700b004aa8d5a2f53mr21028085lfe.362.1668089643827;
        Thu, 10 Nov 2022 06:14:03 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id r26-20020ac25c1a000000b00499aefcf68esm2746842lfp.292.2022.11.10.06.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 06:14:02 -0800 (PST)
Message-ID: <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
Date:   Thu, 10 Nov 2022 15:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Cc:     Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org> <Y2wwUOJ0KZdt1tZ6@mail.local>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2wwUOJ0KZdt1tZ6@mail.local>
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

On 09/11/2022 23:57, Alexandre Belloni wrote:
> On 09/11/2022 16:29:16-0600, Rob Herring wrote:
>> On Tue, Nov 08, 2022 at 07:43:37PM +0100, Alexandre Mergnat wrote:
>>> - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
>>> - Add mediatek,mt6357-rtc compatible.
>>> - Add maintainer
>>> - Remove the .txt binding file
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
>>>  .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
>>>  .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
>>>  3 files changed, 41 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
>>> index 0088442efca1..79aaf21af8e9 100644
>>> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
>>> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
>>> @@ -33,7 +33,7 @@ Optional subnodes:
>>>  		- compatible: "mediatek,mt6331-rtc"
>>>  		- compatible: "mediatek,mt6358-rtc"
>>>  		- compatible: "mediatek,mt6397-rtc"
>>> -	For details, see ../rtc/rtc-mt6397.txt
>>> +	For details, see ../rtc/mediatek,mt6397-rtc.yaml
>>>  - regulators
>>>  	Required properties:
>>>  		- compatible: "mediatek,mt6323-regulator"
>>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
>>> new file mode 100644
>>> index 000000000000..bb48c0150f95
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
>>> @@ -0,0 +1,40 @@
>>> + # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT6397/MT6366/MT6358/MT6357/MT6323 RTC
>>> +
>>> +maintainers:
>>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>>> +
>>> +description: |
>>> +  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
>>> +  as a type of multi-function device (MFD). The RTC can be configured and set up
>>> +  with PMIC wrapper bus which is a common resource shared with the other
>>> +  functions found on the same PMIC.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt6323-rtc
>>> +      - mediatek,mt6357-rtc
>>> +      - mediatek,mt6358-rtc
>>> +      - mediatek,mt6366-rtc
>>> +      - mediatek,mt6397-rtc
>>
>> As this is only a compatible string, just fold this into the MFD schema 
>> doc.
> 
> Actually, it probably also supports the start-year property

What about rest of rtc.yaml schema?

Best regards,
Krzysztof

