Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62DDD71FDD4
	for <lists+linux-leds@lfdr.de>; Fri,  2 Jun 2023 11:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbjFBJ2o (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 2 Jun 2023 05:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbjFBJ2Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Jun 2023 05:28:16 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3166B1BD0
        for <linux-leds@vger.kernel.org>; Fri,  2 Jun 2023 02:26:14 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso2575083a12.0
        for <linux-leds@vger.kernel.org>; Fri, 02 Jun 2023 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685697972; x=1688289972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5mONN4wL/Liqce4VaaIxlv40SSoKGs7lYJ0PeAaNVU=;
        b=YArpIdjhBau4bUHncRhdtnLrifllglfO2cL4Y2QdyOAAb/ShSvsnO47/l5v0J7eqTR
         C4MHZhLJkLj0XoIiySwbWvER/8TCvSpzYm0mPI0o4ot0Qxlx4eg5ZCuQN2hQ86bmkWGY
         dVYCffeP5ojLv1NwIv62nYSegwQemmZCZHhlO1IzmB20ERZCdXdNZ0FNzcNM6VhKq7R5
         gnDZYGBJ47qswZR7Hu5UWtOqusuyll0RL2cT+njLETFKD+7FFlW6rqc1qBepy/qUisRC
         h0t3XsFQ47fpCI9Hvcex92O45cez+naHuCMUfbr00t1OQTVtr4MyQ9NCJD0+L2nj/vye
         dQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685697972; x=1688289972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5mONN4wL/Liqce4VaaIxlv40SSoKGs7lYJ0PeAaNVU=;
        b=VBrOSDXYJb8tTct3ex4QQvwVsxTfj4k6wxIydjcwakTgoL9efVQ94KiNO/TjXxCW8f
         DQ/hjwUbUZcRa+HCGZEzc5QjdUI0nnpc937H8Jeo05VSbuXasuxEIG8fSiHRHX1cI9kC
         KePkbsDpu+Ivh0vIUQ7U06eUyAZAwEkmr94WwUd/abR7ubMumH8SIVybclpp8dnfEQoD
         df+aMVjY4xiA+2n3/i9wyOeWIdO+MQCE4cnfGXyCypIuJkCgOyGK3W4m/eASl1pH5yHh
         pUmasfpNnEQLiJ5+pr04kq9AMgFLByuCP3WWRJ0CXydjqQEmTjug3MGY+v1WLMERIfu+
         AWcQ==
X-Gm-Message-State: AC+VfDxwyUp3kGjo9N3nAp9mNDSNGZYUN73qn9tpmLdGPOgvDmj7UzB0
        5KMLbUmpKsoCGKSawo6WDVgg7g==
X-Google-Smtp-Source: ACHHUZ7kLXNcFuvemWZ7GVhVmmdkvpqq44En4YBUYu4k69KzyVyYRAdzmK7csLF19ZEPgvY4RM+wMQ==
X-Received: by 2002:aa7:da42:0:b0:510:e80f:fa4e with SMTP id w2-20020aa7da42000000b00510e80ffa4emr1752627eds.1.1685697972632;
        Fri, 02 Jun 2023 02:26:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id y17-20020a50e611000000b005149e90115bsm459518edm.83.2023.06.02.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 02:26:12 -0700 (PDT)
Message-ID: <88f91fc2-3b10-872d-4ade-486b25e94129@linaro.org>
Date:   Fri, 2 Jun 2023 11:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/2] dt-bindings: leds: Document Awinic AW2026 bindings
Content-Language: en-US
To:     Vladimir Barinov <v.barinov@yadro.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux@yadro.com
References: <20230525101341.2036563-1-v.barinov@yadro.com>
 <20230525101428.2037061-1-v.barinov@yadro.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230525101428.2037061-1-v.barinov@yadro.com>
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

On 25/05/2023 12:14, Vladimir Barinov wrote:
> Add Awinic AW2026 binding documentation
> 
> Signed-off-by: Vladimir Barinov <v.barinov@yadro.com>
> ---
> Changes in version 2:
> - fixed typos in patch header 2016 -> 2026
> - fixed typo in example section that break dt_binding_check
> 
>  .../bindings/leds/awinic,aw2026.yaml          | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/awinic,aw2026.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/awinic,aw2026.yaml b/Documentation/devicetree/bindings/leds/awinic,aw2026.yaml
> new file mode 100664
> index 000000000000..abacf746677b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/awinic,aw2026.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/awinic,aw2026.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW2026 3-channel LED Driver
> +
> +maintainers:
> +  - Vladimir Barinov <v.barinov@yadro.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The AW2026 is a 3-channel LED driver with I2C interface. It can control
> +  LED brightness with PWM output. It supports hardware blinking and
> +  hardware patterns.
> +
> +properties:
> +  compatible:
> +    const: awinic,aw2026
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
> +  awinic,led-max-microamp:

microamp is per sub-LED, not per entire device. This is already
expressed by common bindings. Drop entire property and use common one in
children.



> +    description:
> +      Maximum current at LED output
> +    enum:
> +      [3000, 6375, 12750, 25500]
> +
> +  vcc-supply:
> +    description: Regulator providing power to the "VBAT" pin.
> +
> +patternProperties:
> +  "^led@[0-2]$":
> +    type: object
> +    $ref: common.yaml#

unevaluatedProperties: false

Just open existing bindings and do not code it differently...

> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        minimum: 0
> +        maximum: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c0 {

i2c

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@64 {
> +            compatible = "awinic,aw2026";
> +            reg = <0x64>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            awinic,led-max-microamp = <6375>;
> +            vcc-supply = <&vcc_3v3_s0>;
> +
> +            led@0 {
> +                    reg = <0>;

Wrong indenration.
Use 4 spaces for example indentation.

> +                    function = LED_FUNCTION_INDICATOR;
> +                    color = <LED_COLOR_ID_RED>;
> +            };

Best regards,
Krzysztof

