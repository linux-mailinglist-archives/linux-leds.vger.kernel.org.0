Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F247573CA3F
	for <lists+linux-leds@lfdr.de>; Sat, 24 Jun 2023 11:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbjFXJiX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Jun 2023 05:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbjFXJiW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Jun 2023 05:38:22 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF0A1BE4
        for <linux-leds@vger.kernel.org>; Sat, 24 Jun 2023 02:38:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51bde6a8c20so1589640a12.0
        for <linux-leds@vger.kernel.org>; Sat, 24 Jun 2023 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687599499; x=1690191499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXBFCivXYU4jqrNenN0qqCdwRcocFvfR8QjuhlC/BNA=;
        b=R68zl3EL0G2cCxmLykHsoLVBaFLnVsVmuPYJGvZiSFCkHgoVSkrCVf+n9i4Q0yOWDg
         +s3so7MPt6yCrcnH39+6/mDLpjDbQlfumyCDRYM5HqCSpU9oTSBp+QQf2zvVy7sT5rAD
         2ykkyJqbMz5FGn0oRZxWJqtn5SDEWmV05NL2H7P+GTJcYpMBAe2nmTcWDWq0phXF2Vy1
         V35CVaORp5+zHfJsaY6+dDEXzyY8zC53AGNPotbheHGgrCeaEZc/QW00F8XsLkmTsR8o
         D8y22pr6oO09jUpK6NSkr1fXkD/x7wTyaXTr+xcvIe5OsPJ8dmTwsBZ1tW8HKDYaQt/u
         cq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687599499; x=1690191499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXBFCivXYU4jqrNenN0qqCdwRcocFvfR8QjuhlC/BNA=;
        b=Xn26qAnjTThAha7TW94iw//N/ftPYlejSFcj4nKUqY0fICkx8qpbLnB+/CvB4fT3Jh
         1+0U7AtghHOjrpwRvgpHafDD7cD43acXqanBIV3tLuPaAPagYgM1T3g6+58ACvhY+FNs
         x4aMugzQvTiLhzfoMORlYnIH4JpiIPG/yr7WkJys58bktJDDSEqnDl96ypqLLzfjbRFR
         nWDRFwmIXOOQCJ9yR/VgTxY5hHKwrbxl0H+cqah68hSGeeHI2JQkc6F45jlqwBGVm3l6
         jtFtmqlu2r9+w46/3CIAI0gsY+eCqJxRUjUweD93MbrNFN0UyOvImaMV2wqL+bd3VFKd
         7zfw==
X-Gm-Message-State: AC+VfDx8ZbJIgPozF+QWz3o8oAtkPO3MOYBsr1t6ZRpBSh9KRFOJDof4
        Ci7NdlwENJxREjU9OTNySLYUOQ==
X-Google-Smtp-Source: ACHHUZ7PVLABuL30C6bX/NntvPW8rghUXjMj6NCmfnVnVEa70oQE8lUdlRmnW05GgXT5nQ/s5wXJbw==
X-Received: by 2002:aa7:c14a:0:b0:51b:deaf:a489 with SMTP id r10-20020aa7c14a000000b0051bdeafa489mr5936677edp.12.1687599499110;
        Sat, 24 Jun 2023 02:38:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v9-20020aa7cd49000000b005187a42b44fsm474958edw.58.2023.06.24.02.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:38:18 -0700 (PDT)
Message-ID: <e61aa4a6-ca7d-3e33-1971-92b97f8d876e@linaro.org>
Date:   Sat, 24 Jun 2023 11:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/7] dt-bindings: soc: qcom: Add qcom-pbs bindings
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>, pavel@ucw.cz,
        lee@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, u.kleine-koenig@pengutronix.de,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
References: <20230621185949.2068-1-quic_amelende@quicinc.com>
 <20230621185949.2068-2-quic_amelende@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230621185949.2068-2-quic_amelende@quicinc.com>
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

On 21/06/2023 20:59, Anjelique Melendez wrote:
> Add binding for the Qualcomm Programmable Boot Sequencer device.
> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---
>  .../bindings/soc/qcom/qcom-pbs.yaml           | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-pbs.yaml

Except missing testing... few more comments:


> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-pbs.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-pbs.yaml
> new file mode 100644
> index 000000000000..0a89c334f95c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-pbs.yaml

Filename matching compatibles, so qcom,pbs

> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom-pbs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. PBS

Qualcomm PBS foo bar a bit more than just one word.

E.g. expand PBS acronym

> +
> +maintainers:
> +  - Anjelique Melendez <quic_amelende@quicinc.com>
> +
> +description: |
> +  Qualcomm PBS (programmable boot sequencer) supports triggering sequences
> +  for clients upon request.

I don't understand what's this. What is "triggering sequences"? What
sequences?

> +
> +properties:
> +  compatible:
> +    const: qcom,pbs

Missing SoC specific comaptibles.


> +
> +  reg:
> +    description: |
> +      Base address of the PBS peripheral.

Drop description, it's obvious.

> +    maxItems: 1
> +

Binding looks very incomplete...

> +required:
> + - compatible
> + - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      qcom,pbs@7400 {

That's not a proper node name. Do you see anywhere such node? Please, do
not work on downstream code, but on mainline.

> +        compatible = "qcom,pbs";
> +        reg = <0x7400>;
> +      };
> +    };

Best regards,
Krzysztof

