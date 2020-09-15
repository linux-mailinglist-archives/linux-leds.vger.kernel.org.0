Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4092026A9A7
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 18:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbgIOQWn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 12:22:43 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41200 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgIOQWa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 12:22:30 -0400
Received: by mail-qt1-f194.google.com with SMTP id t20so3605595qtr.8
        for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2020 09:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2fs7SMwS/+kOOtqsTbeeObOSneugEnlEWVTIUPzi7/M=;
        b=rqKTzam8mJ2nBAS4eDX5iS2tKu8yl5bNl/v5BBqIU4A3Y79yyPaELCj1qb2yQSyetm
         A8mqo3GFHoxrbcWZBaOYH6ktYfSwpbw4lJAsiACruqUlUAzlKFKA40VFMhjqLDNigeEd
         5jWWb4T2i69XX7ojUewmte+yUzmaZ6JveBQULPEWk2eFAml4yJPHlWFJ5bMf1KjQxXt6
         Kv4Y+RergF8wtfCWCLsLUnoQqVezKEabktchTc06MkU9Tn8HBrXQXytHcfJS61VbWql/
         RnRKOlBIWs3wqqR1lfA20SHzrLEdjbNuIn/Fovp20NLt5thuohxFLJ9pTpSlOb9o8hSZ
         L65w==
X-Gm-Message-State: AOAM532maZkiM4iagEEViJzGkPea/0go1/7lOiLo1cbeZMz/S5MabgPt
        A4U5GPwhm2LR8CJB7dTJAk6JuLykfjkp+fI=
X-Google-Smtp-Source: ABdhPJzMu3VnLfAfdGcQC3WYkoaqFWuwnuHMMcFql1ck4IO2LlmOdlqYTm35tPLkkqNHvjD2Mqi7mw==
X-Received: by 2002:a02:ac5:: with SMTP id 188mr19022733jaw.79.1600185065853;
        Tue, 15 Sep 2020 08:51:05 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a23sm7600985ioc.54.2020.09.15.08.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 08:51:04 -0700 (PDT)
Received: (nullmailer pid 2013916 invoked by uid 1000);
        Tue, 15 Sep 2020 15:51:01 -0000
Date:   Tue, 15 Sep 2020 09:51:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v3 2/2] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20200915155101.GA2003197@bogus>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599474459-20853-3-git-send-email-gene.chen.richtek@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 07, 2020 at 06:27:39PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..72914c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6360 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6360 MFD device.
> +  The LED controller is represented as a sub-node of the PMIC node on
> +  the device tree.
> +  This device has six current sinks.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6360-led
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-5]$":
> +    type: object
> +    description: |

Don't need '|' if no line breaks/formatting to maintain.

> +      Properties for a single LED.

This needs to reference leds/common.yaml.

> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        enum:
> +          - 0 # LED output INDICATOR1
> +          - 1 # LED output INDICATOR2
> +          - 2 # LED output INDICATOR3
> +          - 3 # LED output INDICATOR4
> +          - 4 # LED output FLED1
> +          - 5 # LED output FLED2

       unevaluatedProperties: false

> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> + - |
> +   #include <dt-bindings/leds/common.h>
> +   led-controller {
> +     compatible = "mediatek,mt6360-led";
> +     #address-cells = <1>;
> +     #size-cells = <0>;
> +
> +     led@0 {
> +       reg = <0>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_RED>;
> +       default-state = "off";
> +     };
> +     led@1 {
> +       reg = <1>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_GREEN>;
> +       default-state = "off";
> +     };
> +     led@2 {
> +       reg = <2>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_BLUE>;
> +       default-state = "off";
> +     };
> +     led@3 {
> +       reg = <3>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_AMBER>;
> +       default-state = "off";
> +     };
> +     led@4 {
> +       reg = <4>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <1>;
> +       default-state = "off";
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +     led@5 {
> +       reg = <5>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <2>;
> +       default-state = "off";
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +   };
> +...
> -- 
> 2.7.4
> 
