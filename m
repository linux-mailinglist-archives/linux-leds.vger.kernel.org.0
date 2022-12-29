Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E170658DAD
	for <lists+linux-leds@lfdr.de>; Thu, 29 Dec 2022 14:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbiL2NyI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Dec 2022 08:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233567AbiL2NyG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Dec 2022 08:54:06 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44478FF2;
        Thu, 29 Dec 2022 05:54:05 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g13so27567233lfv.7;
        Thu, 29 Dec 2022 05:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjkjGKe8u8IpWP+AbXojTCdZ7iq2d+K0aTmY6czVowk=;
        b=G4HSC/CuxORF0xPq+iSvrSL5MyC546gHLK5ZUsbxUXqw73Es8Yv+CQJuXMvnmR3KWb
         cbePojdSlKfV9wMp9g5PY8O2WKADlSjyL6Oiy24LZdw7bhVrEEdHRgLGuUm53OEF4HeP
         7hVUQC5BLazYGF1FoxxH3u+rlPlsn0RLNL7myH3PFTykMLQ7oBDNzcjF2PJF2A2RK+WL
         yalj0mus2eMSN+dmj6I14XZb00v+3c3487zGd+V58BtQH5YGZuitVYlyRwlSKUukemLU
         eC9bNBF3GHT0uCIaSzXY3QERKvsfda5tiwJ2cmgXClOK5Us2i0c/Bo4ZLxR/pKV2wMfZ
         oZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjkjGKe8u8IpWP+AbXojTCdZ7iq2d+K0aTmY6czVowk=;
        b=Ep16kPjpvxWwdQx9awMwXmHQFveZaGqs7BzjbwnY5ORYkbF8Z0fVSMk71XNoSw+Uql
         MizYyDJ22Q1Kfr+ZzluPS6qDzIti8LsJqfLdtyl5JuxHkKQ78Cgf60Y9I7i28bUYDXvx
         MgTUt5EUDRrR95iLbzpMGzuyx83vZPMU4xbVmWprH2AoH0aXJ3VeFXGWv34Fv2ieKRGV
         S7mAfhaPAOh2X35rpz3XoWxeg2hzw01nod8da2KayAXCPHO5gkOoOEMMYXEJBx/sKJBt
         DbzJ8xmBppFVfqYZsCJT3IQhOJfVfe/1ZvfpC6sAJSDvRNMq3XVfGzcdekfGKrFELwLu
         WTMQ==
X-Gm-Message-State: AFqh2krgJIMBYhlLJe/ErH7PeW5bG6+EBZZR1JYkBc5QUyV5WkR0GSLl
        u4FqYTcmQmHFyYWeMG00FEk=
X-Google-Smtp-Source: AMrXdXsRw8FU8I086wZOUInewaCxOmuvvFrxiOxo7tZy/Z19WZ2zhO49SAfR0K2k53Ith8otQR/Maw==
X-Received: by 2002:a05:6512:b23:b0:4cb:d3:3b99 with SMTP id w35-20020a0565120b2300b004cb00d33b99mr5088582lfu.36.1672322043419;
        Thu, 29 Dec 2022 05:54:03 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id m9-20020a194349000000b004b4ec76016esm3052788lfj.113.2022.12.29.05.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 05:54:02 -0800 (PST)
Message-ID: <4e559c96-a803-6c3e-6f91-e9c41f16720f@gmail.com>
Date:   Thu, 29 Dec 2022 14:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: leds: Convert PCA9532 to dtschema
Content-Language: en-US
To:     Wadim Egorov <w.egorov@phytec.de>, upstream@lists.phytec.de,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        lee@kernel.org, pavel@ucw.cz
References: <20221228140449.938513-1-w.egorov@phytec.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20221228140449.938513-1-w.egorov@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Wadim,

On 12/28/22 15:04, Wadim Egorov wrote:
> Convert the PCA9532 LED dimmer to dtschema.
> While at it, also update and the the example to match
> recommended node names and the link to the product datasheet.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>   .../devicetree/bindings/leds/leds-pca9532.txt | 49 -----------
>   .../bindings/leds/leds-pca9532.yaml           | 86 +++++++++++++++++++
>   2 files changed, 86 insertions(+), 49 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.yaml
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
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-pca9532.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP - pca9532 PWM LED Driver
> +
> +maintainers:
> +  - Jacek Anaszewski <jacek.anaszewski@gmail.com>

Please remove myself, since I am not longer an LED subsystem maintainer.

> +  - Pavel Machek <pavel@ucw.cz>
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
> +
> +patternProperties:
> +  "^led-[0-9a-z]+$":
> +    type: object
> +    $ref: common.yaml#
> +    properties:
> +      type:
> +        description: |
> +          Output configuration, see dt-bindings/leds/leds-pca9532.h
> +          Default is 0, PCA9532_TYPE_NONE.
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
> +                reg = <0x62>;
> +
> +                led-1 {
> +                        label = "user1";

You should leave label unchanged, since this patch claims that it only
converts the file format. And anyway, the driver does not use
led_classdev_register_ext(), so it won't parse 'color' property
automatically.

> +                        type = <PCA9532_TYPE_LED>;
> +                        color = <LED_COLOR_ID_RED>;
> +                };
> +
> +                led-2 {
> +                        label = "user2";
> +                        type = <PCA9532_TYPE_LED>;
> +                        color = <LED_COLOR_ID_GREEN>;
> +                };
> +
> +                led-3 {
> +                        label = "user3";
> +                        type = <PCA9532_TYPE_LED>;
> +                        color = <LED_COLOR_ID_BLUE>;
> +                };
> +
> +                led-4 {
> +                        label = "user4";
> +                        type = <PCA9532_TYPE_LED>;
> +                        color = <LED_COLOR_ID_RED>;
> +                };
> +        };
> +    };
> +
> +...

-- 
Best regards,
Jacek Anaszewski
