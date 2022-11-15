Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C666295F6
	for <lists+linux-leds@lfdr.de>; Tue, 15 Nov 2022 11:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbiKOKes (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Nov 2022 05:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiKOKeq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Nov 2022 05:34:46 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40C2DA6
        for <linux-leds@vger.kernel.org>; Tue, 15 Nov 2022 02:34:44 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so9950293wmb.0
        for <linux-leds@vger.kernel.org>; Tue, 15 Nov 2022 02:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51eyqY8UTV5ywIgQsiHkYmYRRcSexiaefC0ZpHFo2a8=;
        b=XQhNYO7eEMH/ML6Ek2vWNsT1W4wWTdKTdS4A7rD21XxH+U4UZWYtW4zGE1rAekXTsw
         jArznlvIdrcFLoYBqFSrc3k9jBKKmtpNPd5VJEerOotNauut47I59zs4LUO9Nofqarru
         wIbFoP49X4eTJXGdpiwGbzfISJ9J7ng49wYdO7S+wXybs1xV/MA4HkUAM68Hb5Gp1fa5
         UpMXIwaCuDUi5ZaMFSHDt9uxnEGFv2udkfScPawgxYuEqM0Ch3+qDBZt8Hxzr5n6Xsar
         1zUbdldqRdKY/QyxoxCUmSlPQSQnIbn/M2lWiuobH/nmms3sAcKDQn5aO0lG0prGddnp
         faLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51eyqY8UTV5ywIgQsiHkYmYRRcSexiaefC0ZpHFo2a8=;
        b=iRHDOqhi9mvL8tD3pyOWs6DA8F3ZTq0Ue+vrdIESKfAJT1YH6rItC+xSfxXuRs/xuD
         9xsHvTNDVQUFGDs8VOpWUYle1iqYb5g76XiZ0nDtZFm6jfZs9mstl/st3CKECgKxUIov
         W4WJ7kIQ3qbmOGlEoqDM+j54VGYH3JQa4JQ7ZJNvOEPnC5U5PT6TC6S/e9oYAcqnqIro
         NZ1Tk7vLprt7XaiOLzxoPG7FCuE0aCssakJf8NpeG08bvQQdHjA51cl1rabkp0ssToNB
         Xpj+4z+cU0/dsAm2/WMGjV5Sy2VvERrSLujm45fZbVl4st0E+e/T7bFD4NFVyPoN7ktZ
         +K2w==
X-Gm-Message-State: ANoB5pkzkIPoD2P6PPGlPM5DqgKcTC51Z/R9SRqXG2jk+W2N1xHhU/Wa
        nYyNODEgZjz4xtFxByniYGFtkQ==
X-Google-Smtp-Source: AA0mqf5wOpmiqEs0k+MjZLqrmjy48gJaqw7MB07dSClzfm9gxF2kTyHEIeCaGZHkqdxGGrgmZhgQDQ==
X-Received: by 2002:a1c:720f:0:b0:3cf:6f77:375 with SMTP id n15-20020a1c720f000000b003cf6f770375mr92914wmc.102.1668508483147;
        Tue, 15 Nov 2022 02:34:43 -0800 (PST)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003c6b9749505sm23742112wmq.30.2022.11.15.02.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 02:34:42 -0800 (PST)
Message-ID: <ba0901a0-56c5-4e60-49b3-356899921934@baylibre.com>
Date:   Tue, 15 Nov 2022 11:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To:     krzysztof.kozlowski@linaro.org
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        amergnat@baylibre.com, angelogioacchino.delregno@collabora.com,
        broonie@kernel.org, chen.zhong@mediatek.com,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        fabien.parent@linaro.org, fparent@baylibre.com,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rtc@vger.kernel.org, matthias.bgg@gmail.com,
        mkorpershoek@baylibre.com, pavel@ucw.cz, robh@kernel.org,
        sean.wang@mediatek.com
References: <09495553-e563-e12b-056e-bed95531ab6b@linaro.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <09495553-e563-e12b-056e-bed95531ab6b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi, thanks for your help

>>>> I checked and it doesn't support it but this needs to be fixed.  >>>> >>>>> What about rest of rtc.yaml schema? >>>>> >>>> >>>> 
wakeup-source would make sense but the driver doesn't support it yet. 
 >>> >>> The question is about hardware - does hardware support waking 
up the >>> system via interrupt? This is usually a domain of PMICs which 
still are >>> powered on when system sleeps. >>> >> >> I'd say that it 
is possible that a PMIC is able to wake up the system >> with or without 
having an interrupt wired to the SoC so wakeup-source >> makes sense. We 
don't need it if it is interrupt only. >
>Then I propose to reference the rtc.yaml.

I think I understand my error.
Actually, the RTC (HW) support the "start-year" feature, then I suggest
to fix the binding like that:

allOf:
   - $ref: "rtc.yaml#"

properties:
   compatible:
     enum:
       - mediatek,mt6323-rtc
       - mediatek,mt6357-rtc
       - mediatek,mt6358-rtc
       - mediatek,mt6366-rtc
       - mediatek,mt6397-rtc

   start-year: true

additionalProperties: false

required:
   - compatible

examples:
   - |
     pmic {
         rtc {
             compatible = "mediatek,mt6397-rtc";
         };
     };

