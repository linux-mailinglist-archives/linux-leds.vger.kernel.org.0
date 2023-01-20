Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18DA7675237
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jan 2023 11:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjATKTD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Jan 2023 05:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjATKTD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2023 05:19:03 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238717DF95
        for <linux-leds@vger.kernel.org>; Fri, 20 Jan 2023 02:19:01 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id e3so4376022wru.13
        for <linux-leds@vger.kernel.org>; Fri, 20 Jan 2023 02:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8BcJzXSs607af8t7kqUBgjRke129BH5lCDD+YUTH7w=;
        b=LpfSiNltaoV7bWfi3yQR6wIwTKqlLH7Cjtwa/XneNU61Ua5EWCgWLAmqQW4ko0k8hT
         7nuNnorRsj8t9/48i19w6P2TUdPkm4CyGE2Yz2+MfpMRt0T7BdOQ55DOkkwsEVlOCXzE
         hS5JDPHJU3BA2gZU16GZAw37kzK3q/u9bQQ0UtRPyu/TLBIhpD6usPD828f08UdUSxXS
         YySKUR3JB5bmEdzRIKnZps+lJwVscq4/xFDjvBmGNpVL0ybJO9d2/TfrNZYppcH6tnfS
         GxiR3AYWsyaulrms7NLKr3R/Ms8Bs/W4errDUbskI+8/qTbdpiSCp4oZIPL+CCIB5nEp
         T9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8BcJzXSs607af8t7kqUBgjRke129BH5lCDD+YUTH7w=;
        b=h0thdsI7PJS25ZO57J240tnAsplvrOt4izHWmsozKtAdnJoQ8jL7LnLJ7WLmESZbQA
         6B/GYLEUlXE4fH0ZD/nX467b8jRYYJ3PQXy4I/QcGZkEIDPYcbh3L0MrghXTy4PFmUnP
         xwN6Dq7UTpz8Qd2L+yc8ULW+eLN4uclmEpg3b28zg6KQ+hsHawPZBYNT+2QxWyJd/lBI
         52FLlbyT4pRmh/DBr5U8wtCsA0DYFVKZnn0vRtZgFYCtxThipSONEjpc4J6Bb2TmYHHT
         Krd1opbAmmosOkWCs+wUnx+X6OOqBDoBB1YQl4dULJned+YtvAKKdUt2lXwGzRVt4uca
         vjWw==
X-Gm-Message-State: AFqh2kqw9Pg2OYw9pky5oWO2idGMHdt+B743ilDQJ8WROHZITnMI4AD/
        iBMG2b5ZW8ftxBf/Sh+iciBw9w==
X-Google-Smtp-Source: AMrXdXuKdhKIqJEou6IJmM5yvUMjMnUD67NRnsbGkBHfaQP6Ex2vg3VDK1+5I1ULAcU+W6HSfx0aeA==
X-Received: by 2002:adf:f0cd:0:b0:2bd:d783:377 with SMTP id x13-20020adff0cd000000b002bdd7830377mr12934188wro.22.1674209939686;
        Fri, 20 Jan 2023 02:18:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r9-20020adff709000000b00291f1a5ced6sm14862170wrp.53.2023.01.20.02.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:18:59 -0800 (PST)
Message-ID: <a9c47e2f-aacb-4c8f-3a0b-67274ef15376@linaro.org>
Date:   Fri, 20 Jan 2023 11:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Helge Deller <deller@gmx.de>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-fbdev@vger.kernel.org
References: <20230120094728.19967-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120094728.19967-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 20/01/2023 10:47, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Remove "items" between "compatible" and "const: kinetic,ktz8866".
>   - Change "additionalProperties" to "unevaluatedProperties".
> 
> Changes in v3:
>   - Add Krzysztof's R-b.
> 
> Changes in v4:
>   - Drop Krzysztof's R-b.
>   - Add some new properties.
> 
> Changes in v5:
>   - Add missing enum under property description.
>   - Rename uncorrect properties.
> 
> Changes in v6:
>   - Correct wrong property suffix and description.
> 
> Changes in v7:
>   - Add vddpos and vddeg supply.
>   - Use enable-gpios instead of defining enable pin.
> 
>  .../leds/backlight/kinetic,ktz8866.yaml       | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> new file mode 100644
> index 000000000000..b1d0ade0dfb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktz8866.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kinetic Technologies KTZ8866 backlight
> +
> +maintainers:
> +  - Jianhua Lu <lujianhua000@gmail.com>
> +
> +description: |
> +  The Kinetic Technologies KTZ8866 is a high efficiency 6-channels-current-sinks
> +  led backlight with dual lcd bias power.
> +  https://www.kinet-ic.com/ktz8866/
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: kinetic,ktz8866
> +
> +  vddpos-supply:
> +    description: positive boost supply regulator.
> +
> +  vddneg-supply:
> +    description: negative boost supply regulator.
> +
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
> +  current-num-sinks:
> +    description: number of the LED current sinks' channels.
> +    enum: [1, 2, 3, 4, 5, 6]
> +
> +  current-ramping-time-ms:
> +    description: LED current ramping time in milliseconds.
> +    enum: [2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]

kinetic,current-ramp-delay-ms

> +
> +  led-ramping-time-ms:

kinetic,led-enable-ramp-delay-ms

So both are similar to existing regulator properties.

Best regards,
Krzysztof

