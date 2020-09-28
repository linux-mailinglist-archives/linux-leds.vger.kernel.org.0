Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC1727B4B3
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 20:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgI1So0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Sep 2020 14:44:26 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:41256 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1So0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Sep 2020 14:44:26 -0400
Received: by mail-oo1-f68.google.com with SMTP id t3so585888ook.8;
        Mon, 28 Sep 2020 11:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mMpSORkuwjhOa8TOokOcUYzY59laiixLdPiUVCdrAeg=;
        b=InQEHHl/gI0WQ316S0PTr4UnvWxXgphJCUx91NZYcBBbsWeKsTOxoClY6Br7Wdwg1s
         0WhsJona5XcjsF6HUXTCT1Eo78sKutfhHwQs1u0+7h3sPywbiO+KrbiSIIedTeardSlS
         4TWmjE9dWAhi/LA7hg+CE0au/uCol3VRTGv3fWyF2dxS2FD7LHbGzB3aZJKAwBd8U2PE
         yjIhxjZuZdrBiqx6a3/TEATkrgZvyUKZhdgazRkyHUl/SnDOfu+BSXkAIDJFNMzIsoUM
         s/gLislM+yH+kUz610upP/kcTk4NMe8Bg2GOoFa/qhfaUxsVcHGUSBhdnPx8z7CNqFVv
         npsA==
X-Gm-Message-State: AOAM530Zdvcv6a+ek5WxQ+x80IszRvwLct/uNAQa+tekyOxPSm5Zwjz2
        ONWaDTYdG9Y5nWoA3/jtWg==
X-Google-Smtp-Source: ABdhPJyPdFTuxXAFsELHG08LsFRQXGxrjXoPbeF7DUDjO4hDT1H917CJR631LnpqUTwioqQMk3+PVQ==
X-Received: by 2002:a4a:a50a:: with SMTP id v10mr1807675ook.4.1601318664841;
        Mon, 28 Sep 2020 11:44:24 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y23sm2261445ooj.34.2020.09.28.11.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 11:44:24 -0700 (PDT)
Received: (nullmailer pid 3059480 invoked by uid 1000);
        Mon, 28 Sep 2020 18:44:23 -0000
Date:   Mon, 28 Sep 2020 13:44:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20200928184423.GA3041988@bogus>
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 23, 2020 at 08:50:51PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..a356a1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6360 PMIC from MediaTek Integrated.

Where's the PMIC schema? This file needs to be referenced from it and 
that means it all needs to be one series.

> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6360 MFD device.
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
> +  "^led@[0-5]$":
> +    type: object
> +    $ref: common.yaml#
> +    description:
> +      Properties for a single LED.
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
