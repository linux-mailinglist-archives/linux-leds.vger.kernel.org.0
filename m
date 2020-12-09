Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469622D4B21
	for <lists+linux-leds@lfdr.de>; Wed,  9 Dec 2020 20:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbgLIT7i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Dec 2020 14:59:38 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33710 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729464AbgLIT7i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Dec 2020 14:59:38 -0500
Received: by mail-ot1-f68.google.com with SMTP id b18so2618858ots.0;
        Wed, 09 Dec 2020 11:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+pvzbHKq5P+CN5Drt0/pztOsI1TY4xEzgPuXa4sIK7Y=;
        b=owRw0KWslDkSOGupNtTLmDFEH2YcK7oBKc2H6inJ93GYYmY1a71abqyVhSgZ+P/dSV
         zT8M481pbEj/PqqVW3bwGZB5ieyoqtlJJO+BsRd7uoFMfyGfyKAqze3S/Fr1zQ8wRUv1
         cSX8dsecdRAMrejJoP+NSSYhWahUfjVpJY37F/tYkGbeNAhfuVx7lfzU5aJJTusKsrE4
         GXx/tY6oRID+T9AXzBvAJQSm9kWa+Y8qkjcmIhev/wQa4QN/Y98ODSlUyAWp1i4Wdxog
         yxsj73j0Kd6dMXmRXr4DMZto95dQi1UQmU4ROaCaOOkhbOxuKrDF/nXtejnudgp+Zi0S
         Q3Rg==
X-Gm-Message-State: AOAM533U0fDab+D4cjJfbMpvORu8lEB0KqPN29QVP01jkQhjCBgIYGbM
        yETp0CvlqllubJphAL0tWeQjEVilPw==
X-Google-Smtp-Source: ABdhPJxEVPLrdafqyzcpp1ev7QPjSU0+xop7tvZS/JozmphNa69mJdgiNkDOfyS6uPvlK984SZ17uw==
X-Received: by 2002:a9d:7304:: with SMTP id e4mr3236056otk.228.1607543936929;
        Wed, 09 Dec 2020 11:58:56 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i82sm506208oia.2.2020.12.09.11.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 11:58:56 -0800 (PST)
Received: (nullmailer pid 844417 invoked by uid 1000);
        Wed, 09 Dec 2020 19:58:54 -0000
Date:   Wed, 9 Dec 2020 13:58:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v11 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201209195854.GA838381@robh.at.kernel.org>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-5-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606906011-25633-5-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Dec 02, 2020 at 06:46:50PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 159 +++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..73c67b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,159 @@
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
> +  see Documentation/devicetree/bindings/mfd/mt6360.yaml
> +  Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> +  and 4-channel RGB LED support Register/Flash/Breath Mode
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
> +  "(^led@[0-5]$|led)":

"^(multi-)?led@[0-5]$":

> +    type: object
> +    $ref: common.yaml#
> +    description:
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        enum:
> +          - 0 # LED output ISINK1
> +          - 1 # LED output ISINK2
> +          - 2 # LED output ISINK3
> +          - 3 # LED output ISINKML
> +          - 4 # LED output FLASH1
> +          - 5 # LED output FLASH2
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +   #include <dt-bindings/leds/common.h>
> +   led-controller {
> +     compatible = "mediatek,mt6360-led";
> +     #address-cells = <1>;
> +     #size-cells = <0>;
> +
> +     multi-led@0 {
> +       reg = <0>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_RGB>;
> +       led-max-microamp = <24000>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       led@0 {
> +         reg = <0>;
> +         color = <LED_COLOR_ID_RED>;
> +       };
> +       led@1 {
> +         reg = <1>;
> +         color = <LED_COLOR_ID_GREEN>;
> +       };
> +       led@2 {
> +         reg = <2>;
> +         color = <LED_COLOR_ID_BLUE>;
> +       };
> +     };
> +     led@3 {
> +       reg = <3>;
> +       function = LED_FUNCTION_MOONLIGHT;
> +       color = <LED_COLOR_ID_WHITE>;
> +       led-max-microamp = <150000>;
> +     };
> +     led@4 {
> +       reg = <4>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <1>;
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +     led@5 {
> +       reg = <5>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <2>;
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +   };
> +
> +  - |
> +
> +   led-controller {
> +     compatible = "mediatek,mt6360-led";
> +     #address-cells = <1>;
> +     #size-cells = <0>;
> +
> +     led@0 {
> +       reg = <0>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_RED>;
> +       led-max-microamp = <24000>;
> +     };
> +     led@1 {
> +       reg = <1>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_GREEN>;
> +       led-max-microamp = <24000>;
> +     };
> +     led@2 {
> +       reg = <2>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_BLUE>;
> +       led-max-microamp = <24000>;
> +     };
> +     led@3 {
> +       reg = <3>;
> +       function = LED_FUNCTION_MOONLIGHT;
> +       color = <LED_COLOR_ID_WHITE>;
> +       led-max-microamp = <150000>;
> +     };
> +     led@4 {
> +       reg = <4>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <1>;
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +     led@5 {
> +       reg = <5>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <2>;
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +   };
> +...
> -- 
> 2.7.4
> 
