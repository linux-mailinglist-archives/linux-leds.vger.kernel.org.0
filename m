Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E57B748DAC
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jul 2023 21:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbjGETXL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jul 2023 15:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbjGETWw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jul 2023 15:22:52 -0400
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1F04C29;
        Wed,  5 Jul 2023 12:19:22 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b7484cbc5dso643774a34.1;
        Wed, 05 Jul 2023 12:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688584695; x=1691176695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5n38ADxwrdZJEVpxLLs8CXTIjJM3ijjJ9VYiSoAJf0=;
        b=evNhYEvx4pD/2aZ+BEzqyS0Ox3tMpBfh90zc/ZwtnP3uvvYW3IkcuLD6FbOOmkf+aw
         6SC2EvxCoKYx+rdfEhUsAv3ZLrqmBJKl+m9M6KLn/imDE7VJT0O77tnWQfmqVriuNYCS
         muG/ES2znCFoPyIRxRvlFme/w43698M1TEerkfgNnYr+Qp3i2YxR//3GvO0PCE4tIPxl
         wICYPvjMkpdlcGpW/DmYijjTgp9OhFtTOOKMS6tO+n48a+IOk4pAAG1pZEOQ1KHyS3mV
         aXYMBEylT3b5Jcl1eZ+tDbsYZN1tD0GWHSc9Lcf0GlSHxAW2unW7u45BXBshMygCrZ2F
         uWFQ==
X-Gm-Message-State: ABy/qLbis7+cGBarWTx6vaEWDzJh4vpuvIO6hbge+U2cOaZrPzKnbcRL
        sft0q6iOJn8pwGPJzqyBQnrzq470Qg==
X-Google-Smtp-Source: APBJJlGv/bS1HjmafpLlugDV7jO2G1ZAT7DNts90JYTD5UQveMYDmBl69PFDRhGvSN1PINpVcOHhog==
X-Received: by 2002:a6b:c8d8:0:b0:780:c92c:38ed with SMTP id y207-20020a6bc8d8000000b00780c92c38edmr1957568iof.0.1688584125835;
        Wed, 05 Jul 2023 12:08:45 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y24-20020a02c018000000b0042b4b1246cbsm1970193jai.148.2023.07.05.12.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:08:45 -0700 (PDT)
Received: (nullmailer pid 1625393 invoked by uid 1000);
        Wed, 05 Jul 2023 19:08:42 -0000
Date:   Wed, 5 Jul 2023 13:08:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-leds@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: pca995x: Add binding document
 for PCA995X chips
Message-ID: <20230705190842.GA1616946-robh@kernel.org>
References: <20230705000407.153005-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705000407.153005-1-marex@denx.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 05, 2023 at 02:04:06AM +0200, Marek Vasut wrote:
> The PCA995x chips are I2C controlled LED drivers. Each chip has
> up to 16 outputs, each one with an individual 8-bit resolution
> PWM for brightness control. Add binding document.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
> V2: Fix the led@[0-9]+ match
> ---
>  .../devicetree/bindings/leds/nxp,pca995x.yaml | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
> new file mode 100644
> index 0000000000000..562199d3ad820
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/nxp,pca995x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PCA995x LED controllers
> +
> +maintainers:
> +  - Isai Gaspar <isaiezequiel.gaspar@nxp.com>
> +  - Marek Vasut <marex@denx.de>
> +
> +description:
> +  The NXP PCA9952/PCA9955B are programmable LED controllers connected via I2C
> +  that can drive 16 separate lines. Each of them can be individually switched
> +  on and off, and brightness can be controlled via individual PWM.
> +
> +  Datasheets are available at
> +  https://www.nxp.com/docs/en/data-sheet/PCA9952_PCA9955.pdf
> +  https://www.nxp.com/docs/en/data-sheet/PCA9955B.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pca9952
> +      - nxp,pca9955b
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
> +patternProperties:
> +  "^led@[0-9]+$":

Unit-addresses are hex.

> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 15
> +
> +    required:
> +      - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@1 {
> +            compatible = "nxp,pca9955b";
> +            reg = <0x01>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            led@0 {
> +                reg = <0x0>;
> +                color = <LED_COLOR_ID_RED>;
> +                function = LED_FUNCTION_POWER;
> +            };
> +
> +            led@2 {
> +                reg = <0x2>;
> +                color = <LED_COLOR_ID_WHITE>;
> +                function = LED_FUNCTION_STATUS;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.40.1
> 
