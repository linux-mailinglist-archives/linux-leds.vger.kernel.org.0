Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9C029D777
	for <lists+linux-leds@lfdr.de>; Wed, 28 Oct 2020 23:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732560AbgJ1WVt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Oct 2020 18:21:49 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42937 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732554AbgJ1WVs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Oct 2020 18:21:48 -0400
Received: by mail-oi1-f195.google.com with SMTP id c72so1202441oig.9;
        Wed, 28 Oct 2020 15:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3FPqNiWpyJWR2RO8qqRZUJxOLByr4FPKW4y6gjhX+88=;
        b=bZpF8NA5lHfqIkwUQcJ3ZFdi/mg5jp8LthyT18/5qQz5q3N9laW4KWOigiEA5bN1LG
         uG6hmqkvCAI+qmpXnY/ruU6IN30h1+vrKLB/PZESSzva7k9w0qj1fST6wizovusMSacA
         ywViFfABWzdjg5vnalmptZeY9ApJfqolW93ivhvzzGTLHy85b5ydoIQko/bWdpMVxXCP
         H0E2hjTSy3WvP2kTKLXIJVcrep9dRTPzjNdFSpVoCATa04HnEuaGql9CtRGqlK1P/8t2
         s6BrO1/GzgGUwfS4SzvW+pxK9rnMwAkkyh8Ypf4s20262/wCbiezypYU6PWzNVR0qm/+
         x/yQ==
X-Gm-Message-State: AOAM533eRSbMTnDvNgmTb43bRJ/q3ryjTkX5i9T2w0kb07Lifoa3JcBR
        rmvEA0DYbwEGTdRNOr3vE8mab0IVyg==
X-Google-Smtp-Source: ABdhPJwqFp0VwO3RQlI96HN4SQKFMpm9/BrVeRqyHckoyjaF8uBGYDltrDek/jATlUmUqqIHH8LVmw==
X-Received: by 2002:aca:f543:: with SMTP id t64mr5600081oih.91.1603898135968;
        Wed, 28 Oct 2020 08:15:35 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w189sm2751603oif.5.2020.10.28.08.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 08:15:35 -0700 (PDT)
Received: (nullmailer pid 4039976 invoked by uid 1000);
        Wed, 28 Oct 2020 15:15:34 -0000
Date:   Wed, 28 Oct 2020 10:15:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        jdelvare@suse.com, linux@roeck-us.net, marek.behun@nic.cz,
        luka.perkov@sartura.hr, andy.shevchenko@gmail.com,
        robert.marko@sartura.hr
Subject: Re: [PATCH v7 1/6] dt-bindings: Add IEI vendor prefix and IEI
 WT61P803 PUZZLE driver bindings
Message-ID: <20201028151534.GA4034363@bogus>
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-2-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201025005916.64747-2-luka.kovacic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Oct 25, 2020 at 02:59:11AM +0200, Luka Kovacic wrote:
> Add the IEI WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> drivers. A new vendor prefix is also added accordingly for
> IEI Integration Corp.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 53 ++++++++++++
>  .../leds/iei,wt61p803-puzzle-leds.yaml        | 45 ++++++++++
>  .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 83 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  4 files changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> new file mode 100644
> index 000000000000..c24a24e90495
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/iei,wt61p803-puzzle-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IEI WT61P803 PUZZLE MCU HWMON module from IEI Integration Corp.
> +
> +maintainers:
> +  - Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +description: |
> +  This module is a part of the IEI WT61P803 PUZZLE MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
> +
> +  The HWMON module is a sub-node of the MCU node in the Device Tree.
> +
> +properties:
> +  compatible:
> +    const: iei,wt61p803-puzzle-hwmon
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^fan-group@[0-1]$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 1
> +        description:
> +          Fan group ID
> +
> +      cooling-levels:
> +        minItems: 1
> +        maxItems: 255
> +        description:
> +          Cooling levels for the fans (PWM value mapping)
> +    description: |
> +      Properties for each fan group.
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> new file mode 100644
> index 000000000000..bbf264c13189
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/iei,wt61p803-puzzle-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IEI WT61P803 PUZZLE MCU LED module from IEI Integration Corp.
> +
> +maintainers:
> +  - Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +description: |
> +  This module is a part of the IEI WT61P803 PUZZLE MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
> +
> +  The LED module is a sub-node of the MCU node in the Device Tree.
> +
> +properties:
> +  compatible:
> +    const: iei,wt61p803-puzzle-leds
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  "led@0":
> +    type: object
> +    $ref: common.yaml
> +    description: |
> +      Properties for a single LED.
> +    properties:
> +      reg:
> +        description:
> +          Index of the LED. Only one LED is supported at the moment.
> +        minimum: 0
> +        maximum: 0

'const: 0' instead.

> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> new file mode 100644
> index 000000000000..64264c664c48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/iei,wt61p803-puzzle.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IEI WT61P803 PUZZLE MCU from IEI Integration Corp.
> +
> +maintainers:
> +  - Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +description: |
> +  IEI WT61P803 PUZZLE MCU is embedded in some IEI Puzzle series boards.
> +  It's used for controlling system power states, fans, LEDs and temperature
> +  sensors.
> +
> +  For Device Tree bindings of other sub-modules (HWMON, LEDs) refer to the
> +  binding documents under the respective subsystem directories.
> +
> +properties:
> +  compatible:
> +    const: iei,wt61p803-puzzle
> +
> +  current-speed:
> +    description:
> +      Serial bus speed in bps
> +    maxItems: 1
> +
> +  enable-beep: true

Needs a vendor prefix, description, and type.

> +
> +  hwmon:
> +    $ref: ../hwmon/iei,wt61p803-puzzle-hwmon.yaml
> +
> +  leds:
> +    $ref: ../leds/iei,wt61p803-puzzle-leds.yaml
> +
> +required:
> +  - compatible
> +  - current-speed
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    serial {
> +        status = "okay";

Don't show status in examples.

> +        mcu {
> +            compatible = "iei,wt61p803-puzzle";
> +            current-speed = <115200>;
> +            enable-beep;
> +
> +            leds {
> +                compatible = "iei,wt61p803-puzzle-leds";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                led@0 {
> +                    reg = <0>;
> +                    function = LED_FUNCTION_POWER;
> +                    color = <LED_COLOR_ID_BLUE>;
> +                };
> +            };
> +
> +            hwmon {
> +                compatible = "iei,wt61p803-puzzle-hwmon";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                fan-group@0 {
> +                    #cooling-cells = <2>;
> +                    reg = <0x00>;
> +                    cooling-levels = <64 102 170 230 250>;
> +                };
> +
> +                fan-group@1 {
> +                    #cooling-cells = <2>;
> +                    reg = <0x01>;
> +                    cooling-levels = <64 102 170 230 250>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 63996ab03521..5f2595f0b2ad 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -467,6 +467,8 @@ patternProperties:
>      description: IC Plus Corp.
>    "^idt,.*":
>      description: Integrated Device Technologies, Inc.
> +  "^iei,.*":
> +    description: IEI Integration Corp.
>    "^ifi,.*":
>      description: Ingenieurburo Fur Ic-Technologie (I/F/I)
>    "^ilitek,.*":
> -- 
> 2.26.2
> 
