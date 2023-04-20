Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14F606E8FC7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 12:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbjDTKOj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 06:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbjDTKOI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 06:14:08 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586901FC4
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 03:12:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ec81245ae1so458262e87.0
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985529; x=1684577529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1gg5qH9FVKEIvZx9IgwaMQ/p/pcxPmbM2nNSvflA+Y=;
        b=oGF+NGmUcuKNfYKptKRvcA/mqBwJP3vVKuFesYiVXRdyTFgOoercusxcIZm6AB4RE8
         /wRmO/0CDcuj9QTn+vHkn6mrx/DuytmBsRSzskfwvb0UDt3Gf6H0c3kE9rOL763teqFl
         IeHCZIap55eiRWQFwdNU9nDGVj5cWc/nVmvjIM7tqxBkrRWdCoSm3HSMHPCo3tLuyUB+
         zNZLX5K8573+XXXjDBREn7WlXbSCjv2O153I2thYxjoJ1PFi5xTmzksQv0SF2vk28b0+
         u0gJwnTPdUCAKmZgt637xMuWdIqW6AgN2R4HzYxUXecvTMz9WyYgRVksLixG7kmkYWnJ
         RiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985529; x=1684577529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1gg5qH9FVKEIvZx9IgwaMQ/p/pcxPmbM2nNSvflA+Y=;
        b=iglCejIwSEegjQk79l1+/nkvSplXCOD2Q0mafIM8Oo1XqTkMrWdJwcGTnXJUcjdSMp
         dihdXYWZsu6iIJ1sFWY4YKNNKyPALSv/H1QDA9deqBwmV1fT/n0eIth9/4M05OolpVhl
         5qgKahygW6NlmR2nDmh0Ychs3Ie6JkUX93k1isZV7CXY2mUC5S6mCMNQA3TzBpvvtP5V
         Ytc7Y10ffd6UOKRytIXunmhF68mRIF1/C37Qvu2I6quoVtDhfct/P9W0RC97BKMV25O1
         6T5WBj0w1nUuQieMXywYEg0lG7jIYHmVe+k5fz0DnJfSAQX/R5LsZTpL65crGYnzu0+O
         Um8A==
X-Gm-Message-State: AAQBX9enEnjJEl7520UyJLNGAy7am8X9UOoWEHCBlj4i+8742rKDIB9C
        HAJu6ltLpVafA25KI4slVAFwUw==
X-Google-Smtp-Source: AKy350ZLeDAg/Z65XdnFNNxyJxECDLyd0G1w1LAFz9U3aeC7C/mcAJ4Bbx0in4YxGwlg5oYVk58TSQ==
X-Received: by 2002:a05:6512:204:b0:4ed:befc:9b4e with SMTP id a4-20020a056512020400b004edbefc9b4emr363243lfo.3.1681985529604;
        Thu, 20 Apr 2023 03:12:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f21-20020ac251b5000000b004cb45148027sm166060lfk.203.2023.04.20.03.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:12:09 -0700 (PDT)
Message-ID: <d757326e-9dd1-36ea-9340-2a95c3cce70c@linaro.org>
Date:   Thu, 20 Apr 2023 13:12:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/8] pinctrl: qcom: spmi-gpio: Add PMI632 support
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230414-pmi632-v2-0-98bafa909c36@z3ntu.xyz>
 <20230414-pmi632-v2-2-98bafa909c36@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230414-pmi632-v2-2-98bafa909c36@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 18/04/2023 19:43, Luca Weiss wrote:
> Add support for the 8 GPIOs found on PMI632.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

