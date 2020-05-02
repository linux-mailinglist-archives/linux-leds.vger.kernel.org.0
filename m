Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619641C2873
	for <lists+linux-leds@lfdr.de>; Sat,  2 May 2020 23:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgEBVvW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 2 May 2020 17:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728523AbgEBVvV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 2 May 2020 17:51:21 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27ABAC061A0C;
        Sat,  2 May 2020 14:51:21 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z6so4349703wml.2;
        Sat, 02 May 2020 14:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2S0jatiActd4iHZn8JK9XZYvzuI+44RuWLvChb/qjxM=;
        b=QRhtI39PIRErv3uRRK/QZghTneQ/R3M787Ho1ftb4/rQvUEFHuYJGKpusloHPz5iik
         VmvqtqSSTAD9fNpg+PHJLVbQr4ijtYCf1S7Y3omCMm7SM62aaWNtlHcY7WRjYqzPpp7D
         YWDKrg8VC/q36MP4w1le/wZNylS+eFPmTG/no9TqUqCjA+HbYsU3Or/l15a9HFDxMSfr
         40zBRBauFpdevZ8Vc0DlTVdExB77oZHh2mxsN9tFJYLdKcYdppsSY8T7RavKcOuIHv86
         q2sgc6jsgnKQkP53sm7v2O0cUdVNmjgug+hWDc8H5sSNikuwxwDc0OJyB5WeKJCw/vXi
         QPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2S0jatiActd4iHZn8JK9XZYvzuI+44RuWLvChb/qjxM=;
        b=gCBuTwjOY0Fz4qwzde9YeJ/DfxN68MutA7AONxmtkOb31UlV0sHsfJuFWE+7/3ebNM
         TXYAi8WIUfpvniR13yhsHPPKJcfd3RD5ckWul3rDOj9XPTHWM2HujP9quAn5/tuVQdRm
         0TqAWnv2oA9VFH1JTPOySc8k3txqs2ChUUBBXtfWjtZ+kcjobG9iDpBlvbNTlWQL93yM
         uPO2FN6hn8s1QWd/TU/fCgq2waLWiIU3HPAMVOBqgqb5mXMvvpn32HUb6K6n7g9pHyBR
         vR0kNFReegbAVhCv3YLNnymv2LvhZJjLgHy3SHxHIj9m3VqnPSXNsz7jVFoGViTxDg9/
         HFqQ==
X-Gm-Message-State: AGi0PubwYZIRJZJ/d6kZ2i4AB/l8adCe4hTWo2NciYEF048KNr737x+G
        EURBb1/IKoRNBvoHE5PnryE=
X-Google-Smtp-Source: APiQypLX5Op7AATFAMQ/aGNElOjyI3n/Tf2O7TCJD/k2g2BfRcJ6WcgUHili5JYS9USFhC3xSdNXUw==
X-Received: by 2002:a1c:5f56:: with SMTP id t83mr6050457wmb.61.1588456278499;
        Sat, 02 May 2020 14:51:18 -0700 (PDT)
Received: from [192.168.1.23] (acen178.neoplus.adsl.tpnet.pl. [83.9.189.178])
        by smtp.gmail.com with ESMTPSA id k17sm5993595wmi.10.2020.05.02.14.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 14:51:17 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v23 01/16] dt: bindings: Add multicolor class dt bindings
 documention
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20200429202816.26501-1-dmurphy@ti.com>
 <20200429202816.26501-2-dmurphy@ti.com>
Message-ID: <c38653c7-5c57-4396-147e-e58e52a84830@gmail.com>
Date:   Sat, 2 May 2020 23:51:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429202816.26501-2-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

Thanks for improving the bindings. Now we have one indentation
related issue, please look below at the example.

On 4/29/20 10:28 PM, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.
> 
> CC: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../bindings/leds/leds-class-multicolor.yaml  | 70 +++++++++++++++++++
>   drivers/leds/led-core.c                       |  1 +
>   include/dt-bindings/leds/common.h             |  3 +-
>   3 files changed, 73 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> new file mode 100644
> index 000000000000..e6169ed5ed12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-class-multicolor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common properties for the multicolor LED class.
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  Bindings for multi color LEDs show how to describe current outputs of
> +  either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
> +  etc.) or standalone LEDs, to achieve logically grouped multi-color LED
> +  modules. This is achieved by adding multi-led nodes layer to the
> +  monochrome LED bindings.
> +  The nodes and properties defined in this document are unique to the multicolor
> +  LED class.  Common LED nodes and properties are inherited from the common.txt
> +  within this documentation directory.
> +
> +properties:
> +  color:
> +    description: |
> +      For multicolor LED support this property should be defined as
> +      LED_COLOR_ID_MULTI and further definition can be found in
> +      include/linux/leds/common.h.
> +
> +required:
> +  - color
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;

It would look neater if we had an empty line here.

> +        led-controller@14 {

We should have one more level of indentation below

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "ti,lp5009";
> +        reg = <0x14>;
> +
> +        multi-led@1 {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          reg = <1>;
> +          color = <LED_COLOR_ID_MULTI>;
> +          function = LED_FUNCTION_CHARGING;
> +
> +          led@0 {
> +            reg = <0>;
> +            color = <LED_COLOR_ID_RED>;
> +          };
> +
> +          led@1 {
> +            reg = <1>;
> +            color = <LED_COLOR_ID_GREEN>;
> +          };
> +
> +          led@2 {
> +            reg = <2>;
> +            color = <LED_COLOR_ID_BLUE>;
> +          };
> +        };
> +      };
> +    };
> +
> +additionalProperties: false
> +...
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index f1f718dbe0f8..846248a0693d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -34,6 +34,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
>   	[LED_COLOR_ID_VIOLET] = "violet",
>   	[LED_COLOR_ID_YELLOW] = "yellow",
>   	[LED_COLOR_ID_IR] = "ir",
> +	[LED_COLOR_ID_MULTI] = "multicolor",
>   };
>   EXPORT_SYMBOL_GPL(led_colors);
>   
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 0ce7dfc00dcb..a463ce6a8794 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -30,7 +30,8 @@
>   #define LED_COLOR_ID_VIOLET	5
>   #define LED_COLOR_ID_YELLOW	6
>   #define LED_COLOR_ID_IR		7
> -#define LED_COLOR_ID_MAX	8
> +#define LED_COLOR_ID_MULTI	8
> +#define LED_COLOR_ID_MAX	9
>   
>   /* Standard LED functions */
>   /* Keyboard LEDs, usually it would be input4::capslock etc. */
> 

