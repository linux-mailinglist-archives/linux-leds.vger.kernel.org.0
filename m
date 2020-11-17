Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A262B7184
	for <lists+linux-leds@lfdr.de>; Tue, 17 Nov 2020 23:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgKQWY5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Nov 2020 17:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgKQWY5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Nov 2020 17:24:57 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35ABC0613CF;
        Tue, 17 Nov 2020 14:24:56 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so25078632wrb.9;
        Tue, 17 Nov 2020 14:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jz4UGtWh3ZHBh8W98Tqf226bIN+2YbRc8x8fZYb0d70=;
        b=o0tSjorAL76DbugKWcC6wceu7jFVMz89WrsrdNOGSZolnwQ3+pWuLrU+JIG8FdNhVA
         ogrZxK3fH5IYFAh7WqX60cBhRJEpfVkP/G1sZdyS5gSnXhi9R7g7d41rLriZETZSzL8R
         toCH8wVQGr+YHFvEJFpfxlsrrfjNkbj9aOaLRsMcItvrIUK68yTjKwf6R01FecLT/Jss
         OT6sroq1tnudp6u8jHZwLW/yrYzjx1PYTEB0hFLN6OWoDRrNP+b81F/GrqUROvr1WRo/
         n01a+C1kKFK6KYgyUax7q9ZFt5x3CZRn+TBLE+M7OqxivVLqZTwtw4BBIRzWQeStfzCF
         Hp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jz4UGtWh3ZHBh8W98Tqf226bIN+2YbRc8x8fZYb0d70=;
        b=bQ7wKj8VU4GCxIXYiBC9vDku3CELfIJm2OwfN11jvSbcEiHJhPQP9OFMep7hcNRhQz
         rdYwYQbNdgmAnJlr/VsOdZGrGJcUs0LE+3VastT2LP5B4ksWiszHab3FCPQawHxCc2k7
         37x/ZrWpr45gTcfLIJ8OHCqX+j2hFzzggigcbOSC7MTlL5YRsfgu4MCCMWM3PBw6Z3rD
         V1hWSBa3fBgxZtKEEoWOVXzpIAh5v0R4wDkRHlB/+oT7CzFL3pcm+Nx+MIIURBmfvuSL
         qenT/0gQcYO2Bb0W8JPo67bFqNcqnAtIaghUyJeUqR8OVws50IfeNw6a3M+x19QdarWi
         DHEg==
X-Gm-Message-State: AOAM532bt+3CItfDEpZJG/wC+/3C2y/EfD+GIwyFW0nuqSfXXas0cDyF
        Jag9gpWzBgVYIE00FliT+wk=
X-Google-Smtp-Source: ABdhPJwfTZMv22pQCg7Rp7oZi+MBL/EPup9kE1+AoFStntZXWLqcGSvQhvslk1N5LoREmUlCTY/Z6w==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr1646515wrt.312.1605651895550;
        Tue, 17 Nov 2020 14:24:55 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:3cf0:d5c8:abb1:7fc9? ([2a01:110f:b59:fd00:3cf0:d5c8:abb1:7fc9])
        by smtp.gmail.com with ESMTPSA id v67sm233076wma.17.2020.11.17.14.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 14:24:54 -0800 (PST)
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605610537-18085-2-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <ff327630-d919-c26c-30ca-066ad8e826bb@gmail.com>
Date:   Tue, 17 Nov 2020 23:24:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1605610537-18085-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

Thank you for the patch.

On 11/17/20 11:55 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 114 +++++++++++++++++++++
>   1 file changed, 114 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..871db4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,114 @@
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

What actually is the Register mode?

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
> +          - 3 # LED output INDICATOR2_ML
> +          - 4 # LED output FLED1
> +          - 5 # LED output FLED2
> +          - 6 # LED output MULTICOLOR
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
> +       led-max-microamp = <24000>;
> +     };
> +     led@3 {
> +       reg = <3>;
> +       function = LED_FUNCTION_INDICATOR;
> +       color = <LED_COLOR_ID_AMBER>;

You should really have here LED_COLOR_ID_MOONLIGHT if this is
a moonlight LED. You'll need to add it to dt-bindings/leds/common.h.

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
> +       color = <LED_COLOR_ID_MULTI>;
> +       led-max-microamp = <24000>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       led@1 {
> +         reg = <1>;
> +         function = LED_FUNCTION_INDICATOR;
> +         color = <LED_COLOR_ID_GREEN>;
> +       };
> +       led@2 {
> +         reg = <2>;
> +         function = LED_FUNCTION_INDICATOR;
> +         color = <LED_COLOR_ID_BLUE>;
> +       };
> +     };

It is of little avail to have multicolor LED with only two LEDs.
I propose not to allow such setup - i.e. you should have either
one multicolor LED comprising three sub-LEDs (regs: 0, 1, 2),
and with main color property set to LED_COLOR_ID_RGB, or three separate
LEDs.

Effectively, you should have two separate DT examples here to make it
clear: one for the case with three LED class devices and one with
LED multicolor class device.

> +   };
> +...
> 

-- 
Best regards,
Jacek Anaszewski
