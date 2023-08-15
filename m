Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1BC877D49C
	for <lists+linux-leds@lfdr.de>; Tue, 15 Aug 2023 22:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239430AbjHOUto (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Aug 2023 16:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239706AbjHOUtS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2023 16:49:18 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DF62109
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2023 13:48:54 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bb8a12e819so17078971fa.1
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2023 13:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692132525; x=1692737325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNzhnTa2Xplp/Tkji9CmBI7UUP7vxyc/BEYibHP6fMQ=;
        b=PyeX+K+DUqD3zxaX3LzsmbOW32TZq8m/j8TgebRTpBooXKozdDZ3GH1nz0HYBh4t1B
         iXSKR8qQG2+2nWMW6Rp3JnS4qYmng6E1+dF4VmVyQ4jl/TACzZr9NvW69Cj6FbNdhESy
         V6D52QeKJ5eGo7cHfCjXGRaE0eXeCgR6MYLGk1NOtVc/JRFSE3AS9IJVQWMu9NndqvI0
         I8DoNoj//KTS5VqhEmT3nu3fwSfCDd0fNUNy8V7p7aVXfx4f+Qsk2hYDjQ2zgaPnapKJ
         fzlx/oUh+N1NfMZ4CQjXS54Rn2INuAPbQ6N26jXskypDErEPKMMYczc9MwaR5F8z+LMe
         3GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692132525; x=1692737325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNzhnTa2Xplp/Tkji9CmBI7UUP7vxyc/BEYibHP6fMQ=;
        b=Epv5UDwPBFL6lxriE8LBBN1ousYMSTxb8rCOEDa8poJKFEFECPBny+1A39YCDfB/p/
         sPWtweSoxN0ArYXjfUf7A5Ur7VOgnc5a+5Qn/vfkKeH3hWsrOMq7PqOSsskxaqg8vEl6
         +65kTnl2o/RCeVYL6e464SaPvkcqGt5UBl5xVuMI2S4SlUlph/sVQbmpnYtvYELNzspg
         3/FtoYOj7uIGjvFkwAAVniZW/b1SF4KoXvIvDzAIyCXjF+4FcbIQU9Ll1SIW0opGJEz/
         9JRsLoki9V9dlB+phywjT8OMHGKEJNnglED/z2DQ9x6oz8LE6DbmtN7HFnjw4tb8rKeu
         UWFA==
X-Gm-Message-State: AOJu0Yxzj817FWFuzqdXKt+5NqapHtcjFDMBkkLkid+CO+iboFWcLXmh
        Vjx0KJsDTYVMg3jAMmG7ycuJzd0q6+25TdOo2MQ=
X-Google-Smtp-Source: AGHT+IF0wXBsnPoEuKcnguUYJu/0ii7qC8GDdNixBFOmOnFlT/R385o4ZmzsQLucS1IJNlav7GC30Q==
X-Received: by 2002:aa7:d8c4:0:b0:523:35ce:bf50 with SMTP id k4-20020aa7d8c4000000b0052335cebf50mr11399349eds.23.1692132037464;
        Tue, 15 Aug 2023 13:40:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w4-20020a056402128400b005232c051605sm7184074edv.19.2023.08.15.13.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 13:40:37 -0700 (PDT)
Message-ID: <97e58b59-7b02-bfb7-9904-abfcff6f1005@linaro.org>
Date:   Tue, 15 Aug 2023 22:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/7] dt-bindings: leds: leds-qcom-lpg: Add support for
 LPG PPG
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>, pavel@ucw.cz,
        lee@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org
Cc:     luca.weiss@fairphone.com, konrad.dybcio@linaro.org,
        u.kleine-koenig@pengutronix.de, quic_subbaram@quicinc.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
References: <20230814235918.10396-1-quic_amelende@quicinc.com>
 <20230814235918.10396-3-quic_amelende@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814235918.10396-3-quic_amelende@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 15/08/2023 01:59, Anjelique Melendez wrote:
> Update leds-qcom-lpg binding to support LPG PPG.
> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

