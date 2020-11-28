Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A77E2C70FA
	for <lists+linux-leds@lfdr.de>; Sat, 28 Nov 2020 22:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgK1Vum (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Nov 2020 16:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732050AbgK1S53 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 28 Nov 2020 13:57:29 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A28C02A1B1;
        Sat, 28 Nov 2020 07:14:04 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id g14so8676071wrm.13;
        Sat, 28 Nov 2020 07:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vcBAq8l9akkx7hiqsbsodZQlENoGjUTUGwJDEMJ5H5w=;
        b=PUBeUmRMGX/Xbl+Ywb0x3hXxKJjlBdYKeJSfABQvEpkKvEZ/YkHwe6+ZSix190Qvne
         Kk7uETaXo12l9CzUui/7kE2hzBbInTumJmXn4zyYCCo6ZjdpoBEH1MkXdNiJjdUqsM/+
         tAu3jNzwnhbSKEIF+orqI8eBWQZX4RQhJAHfLZb1sJNqspByZ73zHgT7DRgYfrfKmRV2
         Gz0uZh0cltQoA6ESbEyixJ/rN/MHgag1QXFJ6xmy3GA2QpJVYyU07odWFaURpJeUv2aG
         WyDR7QPENB9cof90pqwiNa59DOKrhb1+4KnGLUye+hoyBFXNJHVwSPgTgNrHXoIarvdC
         5Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vcBAq8l9akkx7hiqsbsodZQlENoGjUTUGwJDEMJ5H5w=;
        b=RuBlZgh5825cetphVeSVWypg+82p3KxLYnfNEoDy8iiEvkVK13mE6I3kkUzsne4S0V
         fsU/QOPuS3VpSLkE9BHG+UMkwLUKzVGZdxAZM6QZrSVlhUqlkTAvqUqbDudQcREHicWA
         2OR6EyRzKF2Kaa1VnM7rL838U8/kISs4NHVQw/2atrZ5zGii6++qaknw6WmAwG7vS5sb
         /GCBbuBqziQOvzMTqgVTN2lTMmcB3HPILoFzoSOhDuZTppoh52wE+GlwbFS8vzbLIJ7y
         /mW6wPcJRjs6GvbdwMsLYVhbkZFkpdcuM1IkkqkPbMWwhJ2g27R9JxlbrK9Co+aEkE2O
         5jgw==
X-Gm-Message-State: AOAM532OBDXLZTyqP535KG31rhLP9yMmt8kxo58t9OSF5kcTFY+0Kz30
        fgB+KYyaNkj0RLNIDcliFaQ=
X-Google-Smtp-Source: ABdhPJw3WQq7/V2A0KHFajRCBx38ILUo9wCCsNh/EzXkokKCcgsZlrlARAHdzYhdLSpUMzF1aQnqgg==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr18139379wrp.201.1606576442892;
        Sat, 28 Nov 2020 07:14:02 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:7c3e:7544:88c3:e387? ([2a01:110f:b59:fd00:7c3e:7544:88c3:e387])
        by smtp.gmail.com with ESMTPSA id d17sm20079784wro.62.2020.11.28.07.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 07:14:02 -0800 (PST)
Subject: Re: [PATCH v10 5/6] dt-bindings: leds: Add bindings for MT6360 LED
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8a2f252a-7cbd-401f-75a3-f42bba93fdd7@gmail.com>
Date:   Sat, 28 Nov 2020 16:13:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 11/27/20 4:28 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++++++++++
>   1 file changed, 164 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..b2ffbc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,164 @@
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
> +  "^led@[0-6]$":
> +    type: object
> +    $ref: common.yaml#
> +    description:
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        enum:
> +          - 0 # LED output INDICATOR1_RED
> +          - 1 # LED output INDICATOR1_GREEN
> +          - 2 # LED output INDICATOR1_BLUE
> +          - 3 # LED output INDICATOR2_
These LED output descriptions look odd.
In the driver you have:

enum {
     MT6360_LED_ISNK1 = 0,
     MT6360_LED_ISNK2,
     MT6360_LED_ISNK3,
     MT6360_LED_ISNKML
     ...

I think the same names should be used for DT reg property documentation:

- 0 # LED output ISNK1
- 1 # LED output ISNK2
- 2 # LED output ISNK3
- 3 # LED output ISNKML

Here you're describing hardware, i.e. current sinks as they are
defined in the device documentation, and not the functions you're
assigning in DT to the connected LEDs.

> +          - 4 # LED output FLED1
> +          - 5 # LED output FLED2
> +          - 6 # LED output MULTICOLOR


This last enum is also disputable, since it is driver specific, and not
hardware specific. Actually you should rather check LED color id and
basing on that treat the LED as multicolor (for LED_COLOR_ID_RGB).
See drivers/leds/leds-lp55xx-common.c for a reference.

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
> +     led@3 {
> +       reg = <3>;
> +       function 

= LED_FUNCTION_MOONLIGHT;
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
> +     led@6 {
> +       reg = <6>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_RGB>;
> +       led-max-microamp = <24000>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       led@0 {
> +         reg = <0>;
> +         function = LED_FUNCTION_INDICATOR;

The function is unused in case of the multicolor subleds.
Please drop it from here.

> +         color = <LED_COLOR_ID_RED>;
> +       };
> +       led@1 {
> +         reg = <1>;
> +         function = LED_FUNCTION_INDICATOR;

Ditto.

> +         color = <LED_COLOR_ID_GREEN>;
> +       };
> +       led@2 {
> +         reg = <2>;
> +         function = LED_FUNCTION_INDICATOR;

Ditto.

> +         color = <LED_COLOR_ID_BLUE>;
> +       };
> +     };
> +   };
> +
> + - |
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
> 

-- 
Best regards,
Jacek Anaszewski
