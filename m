Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACAF371FC21
	for <lists+linux-leds@lfdr.de>; Fri,  2 Jun 2023 10:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbjFBIdA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 2 Jun 2023 04:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbjFBIc5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Jun 2023 04:32:57 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71445196
        for <linux-leds@vger.kernel.org>; Fri,  2 Jun 2023 01:32:55 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96f53c06babso245208466b.3
        for <linux-leds@vger.kernel.org>; Fri, 02 Jun 2023 01:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685694774; x=1688286774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6o32+EXqkQOwwvwWTyyFIWUzWvHCRd3bW8dtLzYc0M=;
        b=SF+7px9QcZH1m1Vj1b2GfXALro+NdRTuZIllFGdKVav7TEBvES/2uDpWKVI9xCZWZj
         Iv4bT38X4VR2ZAahaID8tl7YnfQCN+dfYwrgfbmTjOg1U7rD7NSOfjpjrWHShz7TJyZY
         YcTLPTBP6SIuO7QCpCu72aRFZO6EQUipoA2O/r+AmyTKNT45OebGXlQrEew7g4fHcWMF
         OVrAocSDqDleCKKAaH70gdYegshPK3bxyqFB5qSxqTmvtlaZcG4jmIc5e0rMFKGEzSJA
         Tysc9o6h3haQDhWXsvkxQhM8zCT2RaiSSLJOfFY3rkol/FC7XZY12Jh9hC8Fk6fX5yEm
         ajHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685694774; x=1688286774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6o32+EXqkQOwwvwWTyyFIWUzWvHCRd3bW8dtLzYc0M=;
        b=e/oo66NC5g1suoi4UAuztK1hm+YWzBdedUc1msemVMhg3GilFKDFPgiParXlU6BUsz
         JlxlToeqfMLbSJb55wzgXIg9mWkRzXqkYZ/18tm4rwdDATGz7hBXi+Vdcdu3Mz3J5PEF
         Vj/Bf6Wzbntk282s5sYXfPJH7aTBWfktDh0G21WyK4DsQjkQe5gE1MEXEnjb1v2jKjR4
         k+vuG/PsZnHf+g7IHI76oZCarOCKgYNaCjwr2fh1NFN6wyPUwyhanWR693SeZipV7+0J
         ZcFVtr7Ux3K1jqO8U9a9bqhnPz3N7/ZwJ+9LF7cFtbaT66VBJUstE3y1ABdGaysbkdnN
         NsZw==
X-Gm-Message-State: AC+VfDxhJeuEDvVjh9Jb1WrmGvxP7q3QCxqbsNc5ILlmxj22dnfygPbg
        QTZJ29l6m1dtRpeDCwYHHzxDeg==
X-Google-Smtp-Source: ACHHUZ5bbkg1zhdbdLCCj6ww+0OpxboaT0r5ApjCE5h604Y3MUUFQIlVUcvBkPvczEmb5mkg4VqJdw==
X-Received: by 2002:a17:907:a42a:b0:96f:912d:7922 with SMTP id sg42-20020a170907a42a00b0096f912d7922mr9551134ejc.53.1685694773958;
        Fri, 02 Jun 2023 01:32:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090668da00b00947ed087a2csm461979ejr.154.2023.06.02.01.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 01:32:53 -0700 (PDT)
Message-ID: <75d78713-fc8f-24a9-a422-2b4d57c5d488@linaro.org>
Date:   Fri, 2 Jun 2023 10:32:51 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601110813.2373764-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 01/06/2023 13:08, AngeloGioacchino Del Regno wrote:
> Some PMICs have a separated WLED string output: add a property
> `mediatek,is-wled` to indicate which LED string is a WLED.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6323.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> index 052dccb8f2ce..904b2222a5fe 100644
> --- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> @@ -30,6 +30,7 @@ Optional properties for the LED child node:
>  - label : See Documentation/devicetree/bindings/leds/common.txt
>  - linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
>  - default-state: See Documentation/devicetree/bindings/leds/common.txt
> +- mediatek,is-wled: LED string is connected to WLED output

Why would it matter to what the output is connected to?

Best regards,
Krzysztof

