Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E08517C6EE
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2020 21:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCFUUD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Mar 2020 15:20:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46063 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCFUUD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Mar 2020 15:20:03 -0500
Received: by mail-wr1-f65.google.com with SMTP id v2so3784671wrp.12;
        Fri, 06 Mar 2020 12:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IvZXtBYuYfL5t1aNPDppcKBBNfK4Fz06ZV48gGm2pFM=;
        b=BfkOhEO3y601fiqnGYsB5T6qylgMtDsqVfBuZQZz9UtLXopM5q29ODPVN9g862oIG6
         e3IKrqUKLEOFlvpTgh+gaIewFFW0ZRC8XG9T8W4sps01+ZVLLD9IEVcnKsjkJCq5hD1L
         Gst1RLwpPUVAsNIHhkFenwyWZJ4YEuvnbij8vIf+UTcIQx0+IoLgiZxZpFAi5ptwhPxq
         7yu6p4fK5VOr+ff9PlXronAcJAkNoDaP4AhDwaHBgOy0xeBQpATcTpdFQKPrTmrzTvAO
         3Qx7JbNfK2dDGsLtp51Fv5JSv/0nB7KUBPHHAoNGUlR8SeRCMjbd81h/a9yOP32C9a1t
         BFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IvZXtBYuYfL5t1aNPDppcKBBNfK4Fz06ZV48gGm2pFM=;
        b=CbOJMVDFaLPl4Ul+/pPeUoQUdMkM8jQARxXW0JzIurMnX7QCsqI1z7hC3CCt5Xaix3
         FsrkK/qDDMHLdfFABDewhN2dNbnjbdp3FNnMRztGIcrFu4ffcQaMSRnHdefsl/YwRbbC
         GbVKw82lVACgqRFwrYqJsCi++eTiReYo+1fcnatwMddwqj7xXZgF2CvMAynzgBO4ww7D
         SDbKkxCrVD6Cl+3Nid3I3qILZI/PNGRGKcGh+gcZhvAnEk1B9wM808cJXxHPhY+GKbSJ
         BzN92v0YkB5Kd1sxP1bBIkUVgEmtJCFGKCRCdOfQuaSLnamAetfPl40K8e/oG3pxSZjj
         f0HQ==
X-Gm-Message-State: ANhLgQ01SbsIqEHkpTuqdF1J4H6HMLu7Z11xTlmo+rpuY7haGaWe2zBI
        5f12pJXHK2VsEyOlXyotuxE=
X-Google-Smtp-Source: ADFU+vtXw7bBuS7za7XC4cmHUxQNbDZ0t5bsJSZqt0PVbQIOhFrr6Aiof183vQBVo1wQOlpeH6YWqA==
X-Received: by 2002:adf:f588:: with SMTP id f8mr5871864wro.188.1583526000379;
        Fri, 06 Mar 2020 12:20:00 -0800 (PST)
Received: from [192.168.1.23] (affp20.neoplus.adsl.tpnet.pl. [95.49.145.20])
        by smtp.gmail.com with ESMTPSA id i10sm44252875wrn.53.2020.03.06.12.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 12:19:59 -0800 (PST)
Subject: Re: [PATCH v3 2/3] dt-bindings: leds: Shiji Lighting APA102C LED
To:     Nicolas Belin <nbelin@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io
References: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
 <1583502010-16210-3-git-send-email-nbelin@baylibre.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <70129275-087a-fd85-c771-5d72e591d190@gmail.com>
Date:   Fri, 6 Mar 2020 21:19:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583502010-16210-3-git-send-email-nbelin@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nicolas,

On 3/6/20 2:40 PM, Nicolas Belin wrote:
> Document Shiji Lighting APA102C LED driver device tree bindings.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> ---
>  .../devicetree/bindings/leds/leds-apa102c.yaml     | 97 ++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-apa102c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-apa102c.yaml b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
> new file mode 100644
> index 000000000000..21457fc3762d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-apa102c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for Shiji Lighting - APA102C
> +
> +maintainers:
> +  - Nicolas Belin <nbelin@baylibre.com>
> +
> +description:
> +  Each RGB LED is represented as a rgb-led sub-node of the leds-apa102c
> +  device.  Each LED is a three color rgb LED with an additional 32 levels
> +  brightness adjustment. They can be cascaded so that multiple LEDs can be set
> +  with a single command.
> +
> +properties:
> +  compatible:
> +    const: shiji,apa102c
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 1000000
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^rgb-led@[0-9]+$":
> +    type: object
> +    description: |
> +      Array of connected RGB LEDs.
> +
> +    properties:
> +      reg:
> +        description: |
> +          This property corresponds to the led index. It has to be between 0
> +          and the number of managed leds minus 1
> +        maxItems: 1
> +
> +      label:

As mentioned before - don't use label and use function
and color properties instead.

> +        description: |
> +          This property corresponds to the name of the RGB led.
> +        maxItems: 1
> +
> +      linux,default-trigger: true
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - label
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-max-frequency
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        led-controller@0 {
> +            compatible = "shiji,apa102c";
> +            reg = <0>;
> +            spi-max-frequency = <1000000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            rgb-led@0 {

s/rgb-led/led/

> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +                label = "rgb_led1";

Instead of label please use function and color properties.

E.g.

color = LED_COLOR_ID_RED;
function = LED_FUNCTION_STATUS;

If the function of your interest is not available in
include/dt-bindings/leds/common.h then you can propose one.

Please refer to Documentation/devicetree/bindings/leds/common.txt.


> +            };
> +            rgb-led@1 {

s/rgb-led/led/

> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +                label = "rgb_led2";
> +            };

You have to apply DT scheme from LED common bindings and have
separate child node for each color of RGB LED.

> +        };
> +    };
> 

-- 
Best regards,
Jacek Anaszewski
