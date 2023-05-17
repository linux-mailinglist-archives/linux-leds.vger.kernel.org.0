Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 677F07071DB
	for <lists+linux-leds@lfdr.de>; Wed, 17 May 2023 21:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjEQTTJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 May 2023 15:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjEQTTI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 May 2023 15:19:08 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F5A46BD
        for <linux-leds@vger.kernel.org>; Wed, 17 May 2023 12:19:06 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ac79d4858dso11742891fa.2
        for <linux-leds@vger.kernel.org>; Wed, 17 May 2023 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684351145; x=1686943145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ih5DlZFK0mk8q52UPHf2uO23Ixivj6XKrt6mWlpxJJM=;
        b=wQj5WnVXEyxEuvJyYzdXcQ9KgIu5p+W06h5lLQbUb8c1vCO0xaQe7KF6O0uuWLSO8g
         WWH8RLcJRjzw/j6FvjzZHiEv8PZ/2wBdXKNkybA1pFu+OMFUo5skNMfdyh1xNj/0tEkn
         1I8SCNWA738PjWsT9NAWN6/ox5oo34mLYQ4CA3KnADU6BDI4k33QKzR/etl9XLrOqRlR
         tSdRB5B+ajDx/dulZ+YIQc4oe9N0/F1u4y+44Da8XjQzQ8YMSrRVBYug32Lt/+avrqXM
         gW8cV69omRP8oAqu8gNQcZQmHJjydnaJqCFGXfjk/gaxMfI+9mr2O31SVKsBGxf+u9qu
         Oghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684351145; x=1686943145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih5DlZFK0mk8q52UPHf2uO23Ixivj6XKrt6mWlpxJJM=;
        b=LkhMnQFdBGDB/S+86Dyv3nP94Qb0zx/MCyfFNwkfSMn2sCwzV4gBkAA5PjB8dVomld
         to18v7kDZtiYFG4DjdjbN/r3mR+arrUjn9Akhg5+aJ/bGemtCzyQCdfMhFkMmtpYdiCG
         oQrR78DRtRtbVcPziXM2KidMggm8v8AuVmugdFSN1oKhUzcs91DGElY6f4yM3O4p2Vxs
         n/r97JhmaHK5PneGkrzV2bU1GqO7mNFXxkrhNSyi1rELP31P8ie6dhATuyaPg3zylOAl
         JsZMG6PAXdiUhUCfpU2KBmgIRPF7Jc9LJU90URQ0k38lSlF2vvGh1zQnqF8QXkLPWWQT
         5gsQ==
X-Gm-Message-State: AC+VfDxrpPcuzPlsJ7A0FEz5tI7v9hQcYWTqFDgPU4amPU75A/qs4z5t
        U9BThoIVBKIhBep1Efpfe7yAa8JUCRwuz7icuLk=
X-Google-Smtp-Source: ACHHUZ6VEAH0IbqXDUui7Xr7fXNha7EfIwXK2r35JiX2FEIHWITYKUz1mrU7v8MnUGAoO9UEfcmFYw==
X-Received: by 2002:a2e:9b97:0:b0:2a7:853e:a43 with SMTP id z23-20020a2e9b97000000b002a7853e0a43mr8976235lji.40.1684351144800;
        Wed, 17 May 2023 12:19:04 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e780d000000b002a8ae16ac8csm3964954ljc.18.2023.05.17.12.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:19:04 -0700 (PDT)
Message-ID: <4c11be9a-796f-79f1-2828-d3367f978785@linaro.org>
Date:   Wed, 17 May 2023 21:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led: add PM8550
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        "Signed-off-by : Abel Vesa" <abel.vesa@linaro.org>
References: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 16.05.2023 17:02, Krzysztof Kozlowski wrote:
> Document compatible for PM8550 Torch and Flash LED controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
> index ffacf703d9f9..074ef7e63c49 100644
> --- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
> +++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,pm8150c-flash-led
>            - qcom,pm8150l-flash-led
>            - qcom,pm8350c-flash-led
> +          - qcom,pm8550-flash-led
>        - const: qcom,spmi-flash-led
>  
>    reg:
