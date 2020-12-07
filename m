Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1950E2D1984
	for <lists+linux-leds@lfdr.de>; Mon,  7 Dec 2020 20:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgLGTaH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Dec 2020 14:30:07 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43708 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgLGTaG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Dec 2020 14:30:06 -0500
Received: by mail-ot1-f66.google.com with SMTP id q25so1797835otn.10;
        Mon, 07 Dec 2020 11:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FrBHu7s1t25HBDC9PNVrTtnTxd0253xrVnhIVWxHajk=;
        b=S0p6+ekNUMz+mpRBX1nk27zh6VPGEW7EVETnCnKzSCdkx/gFiOTlhipBjctkW0yhOf
         lOWxQbd1ajenbfGprNKLZquf9IuyalM7wAxAQQjCGVfNkT4wTOA/y80cueYfaVpZJLRA
         48Bjp1UXcE0adqgMQX4vjPkd11IFJ9JoUEwbKZoITvnH/u1f3s5QPihjp8TmjXagq9hr
         ilJTSY8DJLWR879UVRp4Tp1z4XVx/ueg24N4O7zY1E4QTKkjefDxrMLxkl4lmt1CX6cl
         bQ64cRb2p5OOq3kevefun15TNalfrz6Q9e6cI8nFFrZnorzlUvvuUIQB5oMldBFGb3vZ
         o4vQ==
X-Gm-Message-State: AOAM532O0GLtmpKG+THXbzba0Z67QGz0BfHZT/t//7pWuRo32HCnzRTu
        ey7wOT2e0jdUj7z62GXB8iARa6LAsA==
X-Google-Smtp-Source: ABdhPJz0UGHnUDVrYPGqBn9ELbn4L14LJPjN/eHjP/WcHzIVcP6NmRdQEij/2Ee9aqIvFngOkiyT5A==
X-Received: by 2002:a9d:323:: with SMTP id 32mr14498523otv.309.1607369364739;
        Mon, 07 Dec 2020 11:29:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r7sm3113362oih.21.2020.12.07.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 11:29:23 -0800 (PST)
Received: (nullmailer pid 670126 invoked by uid 1000);
        Mon, 07 Dec 2020 19:29:22 -0000
Date:   Mon, 7 Dec 2020 13:29:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Cc:     linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
        malliamireddy009@gmail.com, yixin.zhu@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add bindings for Intel LGM SoC
Message-ID: <20201207192922.GA658255@robh.at.kernel.org>
References: <bce27bce2df36e04c5b9b688b1defd9c4fc9b191.1605526923.git.mallikarjunax.reddy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bce27bce2df36e04c5b9b688b1defd9c4fc9b191.1605526923.git.mallikarjunax.reddy@linux.intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Nov 16, 2020 at 07:42:51PM +0800, Amireddy Mallikarjuna reddy wrote:
> Add DT bindings YAML schema for SSO controller driver
> of Lightning Mountain (LGM) SoC.
> 
> Signed-off-by: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
> ---
> v1:
> - Initial version
> 
> v2:
> - Fix bot errors (wrong indentation).
> - Spell out LGM and SSO.
> - Remove vendor specific name for LED properites.
> - removed deprecating property "label"
> - Include 'reg', 'function' & 'color' properties.
> ---
>  .../devicetree/bindings/leds/leds-lgm.yaml         | 130 +++++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lgm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lgm.yaml b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
> new file mode 100644
> index 000000000000..d9c53ec30ad1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-lgm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel Lightning Mountain (LGM) SoC LED Serial Shift Output (SSO) Controller driver
> +
> +maintainers:
> +  - Yixin.zhu@intel.com
> +  - mallikarjunax.reddy@intel.com

Full names please.

> +
> +properties:
> +  compatible:
> +    const: intel,sso-led

Needs to be SoC specific.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    maxItems: 2

Drop, redundant.

> +    items:
> +      - const: sso
> +      - const: fpid
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  intel,sso-gpio-base:
> +    $ref: /schemas/types.yaml#definitions/uint32
> +    description:
> +      Identifies the first gpio handled.

gpio-reserved-ranges doesn't work for you?

> +
> +  ngpios:
> +    minimum: 0
> +    maximum: 32
> +    description:
> +      Number of GPIOs this controller provides.
> +
> +  intel,sso-update-rate:
> +    $ref: /schemas/types.yaml#definitions/uint32
> +    description:
> +      Blink frequency for SOUTs in Hz.

Needs a unit suffix and with that you can drop the $ref.

> +
> +  ssoled:

led-controller

> +    type: object
> +    description:
> +      This sub-node must contain a sub-node for each leds.

       additionalProperties: false

> +
> +    patternProperties:
> +      "^led@[0-23]$":
> +        type: object
> +
> +        properties:
> +          reg:
> +            description: Index of the LED.
> +            minimum: 0
> +            maximum: 2
> +
> +          sso-hw-trigger:

Needs vendor prefix.

> +            type: boolean
> +            description: This property indicates Hardware driven/control LED.
> +
> +          sso-hw-blink:

And here...

> +            type: boolean
> +            description: This property indicates Enable LED blink by Hardware.
> +
> +          sso-blink-rate:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: LED HW blink frequency.

Needs vendor prefix and unit suffix.

> +
> +          retain-state-suspended:
> +            type: boolean
> +            description: The suspend state of LED can be retained.
> +
> +          retain-state-shutdown:
> +            type: boolean
> +            description: Retain the state of the LED on shutdown.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/intel,lgm-clk.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    ssogpio: ssogpio@E0D40000 {

gpio@e0d40000

> +      compatible = "intel,sso-led";
> +      reg = <0xE0D40000 0x2E4>;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      ngpios = <32>;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_ledc>;
> +      clocks = <&cgu0 LGM_GCLK_LEDC0>, <&afeclk>;
> +      clock-names = "sso", "fpid";
> +      intel,sso-update-rate = <250000>;
> +
> +      ssoled {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led@0 {
> +          reg = <0>;
> +          function = "gphy";
> +          color = <LED_COLOR_ID_GREEN>;
> +          led-gpio = <&ssogpio 0 0>;
> +        };
> +
> +        led@23 {
> +          reg = <23>;
> +          function = LED_FUNCTION_POWER;
> +          color = <LED_COLOR_ID_GREEN>;
> +          led-gpio = <&ssogpio 23 0>;
> +        };
> +      };
> +    };
> -- 
> 2.11.0
> 
