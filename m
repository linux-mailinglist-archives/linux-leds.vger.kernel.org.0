Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D72472DA4A
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jun 2023 08:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233700AbjFMG73 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Jun 2023 02:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240275AbjFMG71 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jun 2023 02:59:27 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585261734
        for <linux-leds@vger.kernel.org>; Mon, 12 Jun 2023 23:59:20 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977d4a1cf0eso738726966b.1
        for <linux-leds@vger.kernel.org>; Mon, 12 Jun 2023 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686639559; x=1689231559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUom7HJpVJoM9u75rT8LlJsMQ4Qj71rU7ZteFE9/Wg4=;
        b=m4XzXJjCD1NIVb9noSZsYX0RV1+q1j2eA+ujnldMADVT4a/YPUejB686DxU0MrB12a
         6xlADstB9BqKJjw0Ycf0q+rp1TmOJhWnx3O4KwWpG3np2APHC4Gt0N4FKF0EhylROSn3
         PMUs6RxF0qdZpBNlUkkVl1veBkafWg4GYikDVMSNSpd3fUiZMBlb6GjZp29gndbi/Cny
         r6dHIZa1orIXnVbh3imeut7O6l7U6P1ii42k+7if+UtlUxfVMv55lPJ1DsXuL6yFLINw
         A035ibIFPeSNNxXySyxGwzgnZkFCMgvUSjF0i8LZgES5bRQ5Wg5NB7dNI2HNCvI0EO5r
         1IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686639559; x=1689231559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUom7HJpVJoM9u75rT8LlJsMQ4Qj71rU7ZteFE9/Wg4=;
        b=fT8HQ6SeJWNXpw1dkPWIs1Uij+aDV7W/Ppg8gkuGaA9nnsajmHo67zHQjscYEfacS4
         Za3wctD7CDuC3uscSYWGoGEu0QIeRhHFrWL0jd1awS/sNPqOwPG6M6Q/4+H2IOPJglpZ
         /kEnYWxOz8qs7ypBBuSU+cooNFkW9HSyonxCclgHleDNKzhvoTI+smq/udKNCejPiIg8
         QWi57buF9QS1k5D9Is5cGZpbtlYKyTWD0F7nppLOKJXRjKaeAAU/KDLYXoALdEiJqMS9
         UPApseGntS22OvqHq/eQt5NawV50thg/U4bJhl+TtXbuY6UcZWaf4b3p3o5AXpLLEWnf
         Cfpg==
X-Gm-Message-State: AC+VfDxczoH81RKaHRfh2YA6yL3XC/eQd4Y5zG3BnAVhheyDQVP5mvQm
        UB13wJQyh1NUN59hDcp2szt4Hg==
X-Google-Smtp-Source: ACHHUZ6/EQX5Qczk2I0uyYwLKFD4UijnTnxAYgIgn0fDlI00ItETyXmRKPL/ABG4AclC+GxCfRQMow==
X-Received: by 2002:a17:906:fe0a:b0:977:d048:ff9c with SMTP id wy10-20020a170906fe0a00b00977d048ff9cmr9967874ejb.31.1686639558860;
        Mon, 12 Jun 2023 23:59:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l14-20020a170906a40e00b0097382ed45cbsm6151099ejz.108.2023.06.12.23.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 23:59:18 -0700 (PDT)
Message-ID: <d8a09620-9891-8072-8602-403128ba8d30@linaro.org>
Date:   Tue, 13 Jun 2023 08:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/8] dt-bindings: leds: leds-mt6323: Support WLED
 output
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, pavel@ucw.cz
Cc:     lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
 <20230601110813.2373764-4-angelogioacchino.delregno@collabora.com>
 <75d78713-fc8f-24a9-a422-2b4d57c5d488@linaro.org>
 <88f37d33-6545-d307-17a9-896e86d0ed50@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <88f37d33-6545-d307-17a9-896e86d0ed50@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 09/06/2023 09:51, AngeloGioacchino Del Regno wrote:
> Il 02/06/23 10:32, Krzysztof Kozlowski ha scritto:
>> On 01/06/2023 13:08, AngeloGioacchino Del Regno wrote:
>>> Some PMICs have a separated WLED string output: add a property
>>> `mediatek,is-wled` to indicate which LED string is a WLED.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   Documentation/devicetree/bindings/leds/leds-mt6323.txt | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
>>> index 052dccb8f2ce..904b2222a5fe 100644
>>> --- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
>>> +++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
>>> @@ -30,6 +30,7 @@ Optional properties for the LED child node:
>>>   - label : See Documentation/devicetree/bindings/leds/common.txt
>>>   - linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
>>>   - default-state: See Documentation/devicetree/bindings/leds/common.txt
>>> +- mediatek,is-wled: LED string is connected to WLED output
>>
>> Why would it matter to what the output is connected to?
> 
> When this property is present, the MT6323 LEDs are managed through different
> hardware registers which are specific to WLEDs: if we have no indication of
> whether this is a WLED or a LED, we would program the wrong registers.
> 

OK, so it is rather the choice of output in the device? What is "LED
string" in this context?


Best regards,
Krzysztof

