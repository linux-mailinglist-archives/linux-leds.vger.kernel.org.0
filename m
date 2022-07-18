Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 078B8578C68
	for <lists+linux-leds@lfdr.de>; Mon, 18 Jul 2022 23:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236244AbiGRVF7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Jul 2022 17:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbiGRVF5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jul 2022 17:05:57 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B26313A0
        for <linux-leds@vger.kernel.org>; Mon, 18 Jul 2022 14:05:56 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id b2so10166971plx.7
        for <linux-leds@vger.kernel.org>; Mon, 18 Jul 2022 14:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tejSmNJ8tu3mfi3c3x2mnRbBUB+Mt1F/BieKNs2TvDI=;
        b=kvsFWUi5QVF9B6vzu7BqfIgA76hLUz+zfy05wTP1ymRs1tWPsDXPBay39e+W3ZInbw
         yLn1USBTdc8Qy3bn1f2BGKZvWsbXLRwavGCvpPYJXjnp3G8Eu0gXfZkktymqVMwqGWxv
         VOz9hCY0jO2KOY+QGHIwNuqNQH+ArBitalk+obzkGidtH916Ig9JF11T143BNIjHezU6
         bQYoLP54cyYATTyQimY4sNvfGtsPFPuO/aeIlqDSWdygVT5EGFTTqL/aqB93jX3dnNvz
         vAe9d9K2b+YMqmXOe1SwGBdCQFTewagGoxfyXc1ZY5jZ5izHxM48WDV0A97b26woP0WB
         t3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tejSmNJ8tu3mfi3c3x2mnRbBUB+Mt1F/BieKNs2TvDI=;
        b=y/ug9zYi5ngmhQGauaaqKi0hvZiWG2LCYDnbLIyxOwzJLmKqt2KSFV1ZbQ0WIdjtKw
         9u55R9ylVSTNlwKSuBK2znr8coaSB585DT+KJPHOoaWn34hk4GAydMBgcSeatTbBMPag
         irvLxYdr8dP9oTIWZ4QoZ1e0QznQttqpoNSysrAPOw6iOLvTdRU16npiP+0ICWu9Rh1C
         Jjiu2MISZIEgXpUWopnm3aqCrVyR/ns3uCjo/MVsnJh56okJzkGtnNFRghTbFz6Ij3aq
         Yn2CEks1giG+igCRMGwadxAEvWcMsi+BbPy6300KAC5nF8I89Q6YPUYI2LZN/l+5CoGd
         ZUCw==
X-Gm-Message-State: AJIora8dIDYL8wJSIJBei7UpWxCjbmI15QD6mox6t5BY+w2g/nI5K1b/
        ceTtdiqTSHc5FPSYCyToLkm/pA==
X-Google-Smtp-Source: AGRyM1tidyuJCOv8Uj1BQeFWMBbMfOUWZX4rihIsipS5RQyymofgyi9C9s3ST1Lt141G6PI29UmMTQ==
X-Received: by 2002:a17:903:22d0:b0:16b:f798:1cff with SMTP id y16-20020a17090322d000b0016bf7981cffmr29238976plg.23.1658178355875;
        Mon, 18 Jul 2022 14:05:55 -0700 (PDT)
Received: from ?IPV6:2401:4900:1f3b:709e:6fec:df37:6562:5a80? ([2401:4900:1f3b:709e:6fec:df37:6562:5a80])
        by smtp.gmail.com with ESMTPSA id c17-20020aa79531000000b0051bbe085f16sm9692272pfp.104.2022.07.18.14.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 14:05:55 -0700 (PDT)
Message-ID: <056cc963-4cf4-8588-f75c-e4530aeb6220@linaro.org>
Date:   Tue, 19 Jul 2022 02:35:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: qcom-lpg: Add compatible for
 PM660L LPG block
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220511190718.764445-1-marijn.suijten@somainline.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <20220511190718.764445-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 5/12/22 12:37 AM, Marijn Suijten wrote:
> Document the availability of an LPG configuration for the PM660L PMIC in
> the Qualcomm Light Pulse Generator driver.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> index 409a4c7298e1..cd02811583ec 100644
> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> @@ -17,6 +17,7 @@ description: >
>   properties:
>     compatible:
>       enum:
> +      - qcom,pm660l-lpg
>         - qcom,pm8150b-lpg
>         - qcom,pm8150l-lpg
>         - qcom,pm8350c-pwm


This patch seems to have slipped through the cracks, as running a

'make dtbs_check' currently on linux-next tip causes the following issue:

arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb:0:0: 
/soc/spmi@800f000/pmic@3/lpg@b100:
   failed to match any schema with compatible: ['qcom,pm660l-lpg']

If it helps:

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>


Thanks.

