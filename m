Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91F846E2700
	for <lists+linux-leds@lfdr.de>; Fri, 14 Apr 2023 17:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjDNP3i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Apr 2023 11:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjDNP3h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Apr 2023 11:29:37 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A53BA
        for <linux-leds@vger.kernel.org>; Fri, 14 Apr 2023 08:29:02 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94a34e3526fso437058366b.3
        for <linux-leds@vger.kernel.org>; Fri, 14 Apr 2023 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681486130; x=1684078130;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZGT5vtU51APdhbZD/8UCnp+ZTC2bf1+D6IrVgyj5No=;
        b=Az+VxrkcBE2ufoSHmAqM8oBEgnPxtSyGDpilyfGOlPeTNQm2Y/QaVxCkIxWerLkJ4O
         35QpPOPV+HR2Tc7dSXVOTen2PoLLDG5BsIzSMjo6GQt8IiXibxqkys6syl+H7zOOrl4f
         8K3MTwh7G6MtfcbSVd769WpBlhejiCBS56n+4zXDxD9OuyAHejQzJLbRozVlGR062S0I
         y6fuYZRpm0rXDCdBKBloIgZrgP9aLqYQ4BXFpSLsFLVu4pawtgOSX1MLsOMXarEeTVXN
         SRbaHxwkUPBCwhOrHJt8aT+zwU5Ct6GZlr44qcJIpxWch09w2hqFasx2bGqJobuZeu7i
         OueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681486130; x=1684078130;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZGT5vtU51APdhbZD/8UCnp+ZTC2bf1+D6IrVgyj5No=;
        b=gXYUb0no2FelkbFs2NWSE1gklJzLv1YpnEhnYwncaMqoqW5gDQ9nmwLky9U7tmpoC7
         MzRFv739NMJOh+IIJ1WOkCkDIJZde0+80+Zuj6i529GDs1TZN6JA8Tr00sWGKlZBMmPY
         t5ezo2wlzSPuInoMyRHoyS5JfmHArTuI7EuX5W4aVtDAMynk/i12subQX8cmoVVo+CaL
         AdN2PPSGaCXfIxxfYFhkpma82f9j2ZZSMiJcuV73qRrWw5yaJdCuxWDOGJjLo5JjOP0G
         qH6VW04q5InlZeH56rB1qgOsG0uJyeM5zVkxEn7LLsRHUkuoHbg3KDiSje5//UGpRSZg
         2vkg==
X-Gm-Message-State: AAQBX9clZsVZMgZDcWlyZBfjPBmluoxbjtr10XOh9lAqOhVk2hfgFVuO
        /v8O2d6cWnyOE7pgl6eQ7OCyNGcKliXUeAsjohM=
X-Google-Smtp-Source: AKy350ZcDU6HqVlpR4GBsbt8S/c8LEw2kk920uDdg2GpzPDD5VNoo1PLhCySW0/kNU/JMSTwjO2kNg==
X-Received: by 2002:aa7:c1cc:0:b0:501:d43e:d1e5 with SMTP id d12-20020aa7c1cc000000b00501d43ed1e5mr6303214edp.2.1681486130357;
        Fri, 14 Apr 2023 08:28:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:39b7:81a0:bd41:17b1? ([2a02:810d:15c0:828:39b7:81a0:bd41:17b1])
        by smtp.gmail.com with ESMTPSA id o24-20020aa7c7d8000000b005067d089aafsm1252111eds.11.2023.04.14.08.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:28:49 -0700 (PDT)
Message-ID: <f9da7499-3fb3-1ce6-db0b-d87febee2052@linaro.org>
Date:   Fri, 14 Apr 2023 17:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add ROHM BD2606MVV LED driver
Content-Language: en-US
To:     Andreas Kemnade <andreas@kemnade.info>, pavel@ucw.cz,
        lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matti Vaittinen <mazziesaccount@gmail.com>
References: <20230414055341.335456-1-andreas@kemnade.info>
 <20230414055341.335456-2-andreas@kemnade.info>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414055341.335456-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 14/04/2023 07:53, Andreas Kemnade wrote:
> Document ROHM BD2606MVV LED driver devicetree bindings.

Subject: no improvements and no comments from your side. Why?

> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
>  .../bindings/leds/rohm,bd2606mvv.yaml         | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml b/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
> new file mode 100644
> index 0000000000000..14700a2e5feaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/rohm,bd2606mvv.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD2606MVV LED controller
> +
> +maintainers:
> +  - Andreas Kemnade <andreas@kemnade.info>
> +
> +description:
> +  The BD2606 MVV is a programmable LED controller connected via I2C that can
> +  drive 6 separate lines. Each of them can be individually switched on and off,
> +  but the brightness setting is shared between pairs of them.
> +
> +  Datasheet is available at
> +  https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/led_driver/bd2606mvv_1-e.pdf
> +
> +properties:
> +  compatible:
> +    const: rohm,bd2606mvv
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1

Drop maxItems. It cannot be different.

> +    description: GPIO pin to enable/disable the device.
> +
Best regards,
Krzysztof

