Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CEB6577A4
	for <lists+linux-leds@lfdr.de>; Wed, 28 Dec 2022 15:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbiL1OUg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Dec 2022 09:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiL1OUf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Dec 2022 09:20:35 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E157E11160
        for <linux-leds@vger.kernel.org>; Wed, 28 Dec 2022 06:20:33 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g13so23786379lfv.7
        for <linux-leds@vger.kernel.org>; Wed, 28 Dec 2022 06:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7g0U6AzT13sM32CzZKQ2fudwHI5+hdYkA7+dU/Gihxs=;
        b=FZxS5d8LVAf5pPIA19NnVOZQavqXR0AHPshyCJs0xr2EE2c0sFQV32GoPNi7DQW/q6
         6DjnNaYFQv8n20lKHFXtgravS4LyLdg2kxRmGlwaE+tlhwblfZFkoZnj23WY7jtfCGOD
         3whZLdKh6lBX2wUb9OIsTOcGFXSTz/IpafcR9PptJBVgRwefBn8UijBZwow+xv1F2Nkc
         ezOG2QsL3H5z9KJAT7l8jHEi7N9FJjJLVxeuUgx/YrbjAxkKxvRIRpjb4K3qVzMBfkHA
         RP+dR3t9lFk2zeH9fLprk+zvxfXMf2UOZIBHKODdEVzJW9lglsHOuh7Bajx7SeOzU9jx
         CHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7g0U6AzT13sM32CzZKQ2fudwHI5+hdYkA7+dU/Gihxs=;
        b=XPabTHaxNwkjTPRD9uurL65hmEfbGyDR5xsRYbrZPZJDLy+E5x3Oyh1J+WF+k/wL+z
         LOzd03W0G/pZDCZ1w225pgSYB+MUNwnKsYowcug99Da7iTK89bK+IZJf5vFy+DYUl79q
         j2KFaeZS529hF3s5LlUOPBV9oTF+PhqKv9K7MsKQ6Pd6UvVAROJSgAiHcLifwTnJG7T9
         azSz4FUy1G93DgpaILj9cLfXqe+YTgooTOqgRthKBCtyahbp1KWcft0xe/c5A+YwuI28
         fNDKQkIm+9Wo/KcVq/97cySqkklPh6FgleymcGCi9evc6lxECv88+57JcUwAHzNN5mLM
         PZ5g==
X-Gm-Message-State: AFqh2kpvFqyhKp6sLisJgDW1z7HsgeI2f/ZMUi+QyyZeZKBG4HrN+fqk
        +ytKTnyN+C4DF8W3+s8VfkDe1A==
X-Google-Smtp-Source: AMrXdXtwiRE4b0TXz5ivTvCe/94uHHuU7Tw3tQOCrnoyeYPB93IJzUgI7xxxj76gOd2AbyI9uderOw==
X-Received: by 2002:a05:6512:ba8:b0:4ca:98ec:7d9a with SMTP id b40-20020a0565120ba800b004ca98ec7d9amr8266936lfv.15.1672237232271;
        Wed, 28 Dec 2022 06:20:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k7-20020a05651239c700b004b5766f48d8sm2668708lfu.19.2022.12.28.06.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 06:20:31 -0800 (PST)
Message-ID: <35a387b5-93bc-a878-33e6-dedbfff914cf@linaro.org>
Date:   Wed, 28 Dec 2022 15:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: leds: Convert PCA9532 to dtschema
Content-Language: en-US
To:     Wadim Egorov <w.egorov@phytec.de>, upstream@lists.phytec.de,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, lee@kernel.org, pavel@ucw.cz
References: <20221228140449.938513-1-w.egorov@phytec.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228140449.938513-1-w.egorov@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 28/12/2022 15:04, Wadim Egorov wrote:
> Convert the PCA9532 LED dimmer to dtschema.
> While at it, also update and the the example to match
> recommended node names and the link to the product datasheet.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  .../devicetree/bindings/leds/leds-pca9532.txt | 49 -----------
>  .../bindings/leds/leds-pca9532.yaml           | 86 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> deleted file mode 100644
> index f769c52e3643..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -*NXP - pca9532 PWM LED Driver
> -
> -The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
> -The PWM support 256 steps.
> -
> -Required properties:
> -	- compatible:
> -		"nxp,pca9530"
> -		"nxp,pca9531"
> -		"nxp,pca9532"
> -		"nxp,pca9533"
> -	- reg -  I2C slave address
> -
> -Each led is represented as a sub-node of the nxp,pca9530.
> -
> -Optional sub-node properties:
> -	- label: see Documentation/devicetree/bindings/leds/common.txt
> -	- type: Output configuration, see dt-bindings/leds/leds-pca9532.h (default NONE)
> -	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
> -	- default-state: see Documentation/devicetree/bindings/leds/common.txt
> -	  This property is only valid for sub-nodes of type <PCA9532_TYPE_LED>.
> -
> -Example:
> -  #include <dt-bindings/leds/leds-pca9532.h>
> -
> -  leds: pca9530@60 {
> -    compatible = "nxp,pca9530";
> -    reg = <0x60>;
> -
> -    red-power {
> -      label = "pca:red:power";
> -      type = <PCA9532_TYPE_LED>;
> -    };
> -    green-power {
> -      label = "pca:green:power";
> -      type = <PCA9532_TYPE_LED>;
> -    };
> -    kernel-booting {
> -      type = <PCA9532_TYPE_LED>;
> -      default-state = "on";
> -    };
> -    sys-stat {
> -      type = <PCA9532_TYPE_LED>;
> -      default-state = "keep"; // don't touch, was set by U-Boot
> -    };
> -  };
> -
> -For more product information please see the link below:
> -http://nxp.com/documents/data_sheet/PCA9532.pdf
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.yaml b/Documentation/devicetree/bindings/leds/leds-pca9532.yaml
> new file mode 100644
> index 000000000000..e3741b5046b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.yaml

Filename matching compatibles, so nxp,pca9530.yaml or nxp,pca953x.yaml

> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-pca9532.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP - pca9532 PWM LED Driver

Is "Driver" for Linux Driver? If yes, then drop.

Also drop dash after company name and make model uppercase.

> +
> +maintainers:
> +  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
> +  - Pavel Machek <pavel@ucw.cz>

Same as your other patch - not subsystem maintainers but device maintainers.

> +
> +description: |
> +  The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
> +  The PWM support 256 steps.
> +
> +  For more product information please see the link below:
> +    https://www.nxp.com/docs/en/data-sheet/PCA9532.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pca9530
> +      - nxp,pca9531
> +      - nxp,pca9532
> +      - nxp,pca9533
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C slave address

Drop description

> +
> +patternProperties:
> +  "^led-[0-9a-z]+$":
> +    type: object
> +    $ref: common.yaml#

unevaluatedProperties: false on this level

> +    properties:
> +      type:
> +        description: |
> +          Output configuration, see dt-bindings/leds/leds-pca9532.h

Full path

> +          Default is 0, PCA9532_TYPE_NONE.

Instead:
default: 0

Don't repeat constraints in free form text.

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 4
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/leds-pca9532.h>
> +
> +    i2c {
> +        led-controller@62 {
> +                compatible = "nxp,pca9533";

Messed indentation. Use 4 spaces for example indentation.

> +                reg = <0x62>;

Best regards,
Krzysztof

