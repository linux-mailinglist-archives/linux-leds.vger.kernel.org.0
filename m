Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A30287E29
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 23:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgJHVmx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 17:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgJHVmx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 17:42:53 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642CBC0613D2;
        Thu,  8 Oct 2020 14:42:53 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lw21so10204459ejb.6;
        Thu, 08 Oct 2020 14:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hFDoG3fQdlhIOZ8IJAwTd18Qq8zG8h1BvVCyh4lmt3Y=;
        b=HTuKFemmRx2Ymd9m5//8leO6bwra40/yjCvfZ79hk5KjxmPRLcwJRL/ANFoOQz5AYK
         2Hm5+2CrTJC93AwEvpnHrMdTvdU3qdTM+9eiIrwhZL+P5mjTZJxPFtDY9YpBwwIYUc5x
         DlS545kIJiwNZSUyg71QejrfTFSCWc5K0ABMZ4uOsUHnU+HLSwKmUBdm+ZmE/s2Lssrx
         IwI0IcZWzuenqjXTvEOD7gtw4GbGSioHsCem5lvbc0SZ99LYmhveWe/J/CuOHRn5iVXp
         e+iLDkb9v9S1GtdZs2ciCRygh3NO1Jtwv8TqqjjNwdMMtdIu/DnagIpbnlS7jKhaETm3
         1wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hFDoG3fQdlhIOZ8IJAwTd18Qq8zG8h1BvVCyh4lmt3Y=;
        b=EifLybvtSFvoBZlYGuAFcu5lZWEmnjILYipTXQphLmglEqyFm5HeRpEHOqYIxmaBN1
         mLyIQ2VB/66QU5/+6bVBGAKV1TjJhedIJlp7K38QflPuWTh+5B1zdeHtiwDw6f5iolBa
         54d9+6crWo9vCgZ8AjinThfv+PE99qJq+Tkers0dTtGWjzFJlOlT6n7Wxlvla1SR4+KA
         f3yYacPnh/tvIaNUhkvi9G8OiqY8C/Iw0Z6ZKzPx9GkosW0F/uaRW5D1F2NiX0E8YkbD
         jEGwYqMhsrSptBLsMqueuIxWc3ssbZTpRVnfJOUkOBxoXzc7EJOCcCmGFnNE/G31iWLW
         zbEg==
X-Gm-Message-State: AOAM5319Ou07RjdAwEVYAcNzu9AhxhfsE8SOU/mNB8IiDjg1rfpSS5mh
        egYPtbntFc+JtR+rlJxNRm0=
X-Google-Smtp-Source: ABdhPJy9kQW67aVqErjy36BpoDQBTRVwkGVvV6XJITIyjaQrxfGboo8FwLf2Cc9zn2r3s/Utn25xEw==
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr11466584ejk.413.1602193371995;
        Thu, 08 Oct 2020 14:42:51 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a188:5df3:7e17:9e85? ([2a01:110f:b59:fd00:a188:5df3:7e17:9e85])
        by smtp.gmail.com with ESMTPSA id p25sm4935384edm.60.2020.10.08.14.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 14:42:51 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <2dcc2958-8942-642a-8ace-71d397857463@gmail.com>
Date:   Thu, 8 Oct 2020 23:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

Thanks for the update.

On 10/7/20 3:42 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 95 ++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..2fa636f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,95 @@
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
> +  "^led@[0-3]$":
> +    type: object
> +    $ref: common.yaml#
> +    description:
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        enum:
> +          - 0 # LED output INDICATOR1_RGB
> +          - 1 # LED output INDICATOR2
> +          - 2 # LED output FLED1
> +          - 3 # LED output FLED2
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
> +       color = <LED_COLOR_ID_RGB>;
> +       led-max-microamp = <24000>;
> +     };

This should be multi-led node. See [0] for a reference.

> +     led@1 {
> +       reg = <1>;
> +       function = LED_FUNCTION_INDICATOR;

Maybe add LED_FUNCTION_MOONLIGHT ?

> +       color = <LED_COLOR_ID_AMBER>;
> +       default-state = "off";
> +       led-max-microamp = <150000>;
> +     };
> +     led@2 {
> +       reg = <2>;
> +       function = LED_FUNCTION_FLASH;
> +       color = <LED_COLOR_ID_WHITE>;
> +       function-enumerator = <1>;
> +       default-state = "off";
> +       led-max-microamp = <200000>;
> +       flash-max-microamp = <500000>;
> +       flash-max-timeout-us = <1024000>;
> +     };
> +     led@3 {
> +       reg = <3>;
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
> 

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml

-- 
Best regards,
Jacek Anaszewski
