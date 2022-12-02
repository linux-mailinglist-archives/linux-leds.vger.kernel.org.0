Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2CE64022C
	for <lists+linux-leds@lfdr.de>; Fri,  2 Dec 2022 09:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbiLBIcc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 2 Dec 2022 03:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbiLBIbv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Dec 2022 03:31:51 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC1CBF676
        for <linux-leds@vger.kernel.org>; Fri,  2 Dec 2022 00:30:17 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id b9so4626966ljr.5
        for <linux-leds@vger.kernel.org>; Fri, 02 Dec 2022 00:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bX3SdWvaxKued4M30HGNxvRkO4By+y4jHKuMGW8hVYU=;
        b=ShLBkLrR0jiroVNmRw4y6EJXmK3CASY0J2JOO0Qy11kIoGN4tB7qhP9aePhDjnMV/Z
         eG+nOn9Bl6v8G5Evn1A1Co0kf1ENPs3U2KwT8ZsV/qyTv68cNLrhVonqxaWVT6mWsuJf
         ldHhnXb1IIrXE3/lW2q1Snwnwb57ZU+yOouCdHQf8MnMdE68ePLo94m8Z1XNnnbjnNhY
         P7Z4t9mP6uniQN9w3PPcg3OzVU5qc+pKGo4SFaEUuynVBf31F86+ki+G/D3tzGgF+LmZ
         klLfgggPWMquR0fR0C3Gsdj4fmLbme7nZ0VSaP8M4n6SmIoysq4WQ5VWuInH7NirtqRD
         HLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bX3SdWvaxKued4M30HGNxvRkO4By+y4jHKuMGW8hVYU=;
        b=iQdUT3TNcmrJOJA5kUuaLmnLejIWx7yPYzlT11QbY+L6oqXPtJWWNSpBKF9HgnjVIz
         24UgF36AvAQq0wyYR/NlKw6/IEYPvuC4sntJ7xU1y3NjxlGDuEJsswDs2Y3QMchjKKp6
         YpL+kyVrjEIUFcjwOijgnJWEtALe8kgmqbPVKsW+kQmsSlbj7l4ncaRAihlMNnINCiIz
         1rnQfWJid41QDlXYVKD2zQw0MNJNsm7WWikrYeeQt/x9f9QOroAIgj2bEX2TvtUA7CLI
         rCJz2Qb83p2NQq5QaztJlJB5BPO8c2iwz/mTUhTQVHwGaDFf9re+gDMW9tnZdS4NmC8q
         tfbQ==
X-Gm-Message-State: ANoB5pm01tPbooQhhBkOh3FhmkwAQG5sblPzpSgGgsNTplx5Y8TKdrBL
        7aL3wOluANCGiiO7JQZCSqjpYQ==
X-Google-Smtp-Source: AA0mqf5Xl9WoPz9NyKCsqmY4kN4ywr5r4WG6w1I98ycwWATN80fw73Rglz4G2wMaJ609I3Nk+di/mw==
X-Received: by 2002:a2e:9682:0:b0:279:c862:9d89 with SMTP id q2-20020a2e9682000000b00279c8629d89mr3042836lji.28.1669969816086;
        Fri, 02 Dec 2022 00:30:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a22-20020a05651c031600b0026fc8855c20sm559098ljp.19.2022.12.02.00.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:30:14 -0800 (PST)
Message-ID: <dd25f550-aee1-82af-a58d-eedb4b73a546@linaro.org>
Date:   Fri, 2 Dec 2022 09:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/5] dt-bindings: leds: pm8058: convert from txt to YAML
 format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
References: <20221201202144.448694-1-dmitry.baryshkov@linaro.org>
 <20221201202144.448694-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201202144.448694-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 01/12/2022 21:21, Dmitry Baryshkov wrote:
> Convert the bindings for the leds subdevice of Qualcomm PM8058 PMIC
> from text to YAML format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/leds/leds-pm8058.txt  | 67 ---------------
>  .../devicetree/bindings/leds/leds-pm8058.yaml | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.yaml
> 

This is already done:

https://lore.kernel.org/all/20221201131505.42292-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

