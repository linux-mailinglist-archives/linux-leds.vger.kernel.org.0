Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27C35BBD3C
	for <lists+linux-leds@lfdr.de>; Sun, 18 Sep 2022 11:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiIRJ6c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 18 Sep 2022 05:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiIRJ6L (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 18 Sep 2022 05:58:11 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D8F2A407
        for <linux-leds@vger.kernel.org>; Sun, 18 Sep 2022 02:56:01 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u18so42297900lfo.8
        for <linux-leds@vger.kernel.org>; Sun, 18 Sep 2022 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yUemC1MXPL/JaIYDmlst3JLErWijJgIj3ok6l2ll1PU=;
        b=UZSdW8AZrZp6PBEjJjex53RP39Z2oiGownHfjQzCDL7fk7BReKrN3r+HMO2yuScvxH
         XbSsXkzA4aKSFDx+W7W8ZQjUP0ka/7zXAQAiONCaOKbJE4aBu8BzOZP7UZ+B6YKRQjMr
         Oo/FX3FU9A1XTKpwwq3tAVqdShSVzeYCQFW2z8FffBs01Y8lu3IHRHSiAeVurTugDx9Y
         Oj0dGl3cUBe3QD6dXLTBta1kqWS8gIb9yJc+sllwoGr1ghdWsGe1I470Gb7a6OJ5EkG7
         OYVCUhojlGkqTGkBsc2ImBSiJDTGWeJ9QnpYhN/5OJ8giqkte4LlimEhthcxPcHjPixc
         yj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yUemC1MXPL/JaIYDmlst3JLErWijJgIj3ok6l2ll1PU=;
        b=HcOmKsON1ATMVM1dk5I8j9L9w315i8v88HlgSFxiNc5C32hEbe437rMWJx+mEP3B6h
         KuFpj+9uycHz8vPnVOcP65oJ9p5yzG7DpvGI5Z9B4D77YwqjfarKdI62a3r9poP42Ivw
         unogHJcDCMuK9IyunQ9mgCCf8ifgQ30sKmsF161P8/solTYpq13j7wTmGVzNuX/9q20j
         qZ4seevZ0tCw7JbMOANmmZTnY4ULPN/U4mLtPek0mBL6IGa1yS6oVKk4u9oCHJICXTIA
         2NpqbF/ZLGp4GCN26gjkltDxGxYAc7PlYxUCmDH9BeAugqEl21GoFb7WQFkP5eoDLevm
         8K+A==
X-Gm-Message-State: ACrzQf3DVgtZL2B8OkWsNGT51KHS9f3IsnKHa+H/jzPZY2qa0Su8KBgo
        zHx5Guhrf7igqAFYow0WSOIVuA==
X-Google-Smtp-Source: AMsMyM7/EmyPdwCkxqsT81Z6iMAYE9zZw+b1gy8ishOWnnVcX90rMlLf0CUDpbGWHokoKce94U4E7A==
X-Received: by 2002:a05:6512:3047:b0:497:ab72:97f1 with SMTP id b7-20020a056512304700b00497ab7297f1mr3971683lfb.624.1663494960057;
        Sun, 18 Sep 2022 02:56:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id dt6-20020a0565122a8600b004976809d6a7sm4578812lfb.283.2022.09.18.02.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:55:59 -0700 (PDT)
Message-ID: <de3ea9cc-e8e3-71ea-707b-c9bce7166d0f@linaro.org>
Date:   Sun, 18 Sep 2022 10:55:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/7] dt-bindings: leds: leds-mt6323: Document mt6332
 compatible
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, sean.wang@mediatek.com
Cc:     pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
 <20220915091214.59673-7-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915091214.59673-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 15/09/2022 10:12, AngeloGioacchino Del Regno wrote:
> Add support for MT6332 LEDs/WLEDs with compatible "mediatek,mt6332-led".
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
