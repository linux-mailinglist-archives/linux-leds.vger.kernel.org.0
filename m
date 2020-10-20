Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1156293F99
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 17:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408709AbgJTPaT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 11:30:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35873 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbgJTPaT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 11:30:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id 32so2092558otm.3;
        Tue, 20 Oct 2020 08:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OwH982ml02PB39h27WKHfvcBlSDlxjx0YfyUyxqPQdQ=;
        b=qKMukdr6FLW0PHUA2KbA//r3FMPhMBSO9YcbXInjQHzwMrzhpSfDj095jqANgXZm0t
         DfBjtJ+0ojaY6eI/tEoirauYh1TJ2f+D0A8pAQZG29hhfeILnfyhFWZo0mZT4iyuj/Xe
         zTb6FobmqzOmVklnf4mIYT2yL4od0U6oKG8bsWWlNL237CNZU88PRlRy6XSdSI5Csrqd
         RGaIvV4Jc7cqxKolqc7hWdnYG2I0tN452hsvFrnkpzgVFBR2/a2FBt9cSnRhQh8ACGLK
         EczTe+ZZTpeFCJde/VPROIg4zSh91OYFV+mwmsft1aLWD3RDYJSNrfz/IsZqtRyngK8U
         xITA==
X-Gm-Message-State: AOAM533v1TBjPB/ULEv/LPJfEVpQI6nPydJlD8Y4JjigD9zK8O0kWrNL
        UVxojfsDvHQmo/ED09og1w==
X-Google-Smtp-Source: ABdhPJzd664UX8xPntib+NhSio45LJ1JnqXAueqBmlqFbhnTAvh50wB5sFT7zq9cIPSwVWMcZSlJOA==
X-Received: by 2002:a9d:2a88:: with SMTP id e8mr2035204otb.122.1603207817732;
        Tue, 20 Oct 2020 08:30:17 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b6sm519426otl.37.2020.10.20.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 08:30:16 -0700 (PDT)
Received: (nullmailer pid 874932 invoked by uid 1000);
        Tue, 20 Oct 2020 15:30:16 -0000
Date:   Tue, 20 Oct 2020 10:30:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        jdelvare@suse.com, linux@roeck-us.net, marek.behun@nic.cz,
        luka.perkov@sartura.hr, andy.shevchenko@gmail.com,
        robert.marko@sartura.hr
Subject: Re: [PATCH v6 1/6] dt-bindings: Add iEi vendor prefix and iEi
 WT61P803 PUZZLE driver bindings
Message-ID: <20201020153016.GC866676@bogus>
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
 <20201019221859.56680-2-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019221859.56680-2-luka.kovacic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 20, 2020 at 12:18:54AM +0200, Luka Kovacic wrote:
> Add the iEi WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> drivers. A new vendor prefix is also added accordingly for
> IEI Integration Corp.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 41 ++++++++++
>  .../leds/iei,wt61p803-puzzle-leds.yaml        | 45 ++++++++++
>  .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  4 files changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> new file mode 100644
> index 000000000000..37f0030df237
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/iei,wt61p803-puzzle-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: iEi WT61P803 PUZZLE MCU HWMON module from IEI Integration Corp.
> +
> +maintainers:
> +  - Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +description: |
> +  This module is a part of the iEi WT61P803 PUZZLE MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
> +
> +  The HWMON module is a sub-node of the MCU node in the Device Tree.
> +
> +properties:
> +  compatible:
> +    const: iei,wt61p803-puzzle-hwmon
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

Blank line between properties.

> +      cooling-levels:
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

additionalProperties: false

> diff --git a/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> new file mode 100644
> index 000000000000..0d353e5803bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/iei,wt61p803-puzzle-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: iEi WT61P803 PUZZLE MCU LED module from IEI Integration Corp.
> +
> +maintainers:
> +  - Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +description: |
> +  This module is a part of the iEi WT61P803 PUZZLE MFD device. For more details
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
> +patternProperties:
> +  "^led@0$":

Fixed string, not a pattern. Do you plan to add more? Define the schema 
to what the h/w supports, not current driver support.

> +    type: object
> +    $ref: common.yaml
> +    description: |
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description:
> +          Index of the LED. Only one LED is supported at the moment.
> +        minimum: 0
> +        maximum: 0
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"

additionalProperties: false

> diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> new file mode 100644
> index 000000000000..79a232d75093
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/iei,wt61p803-puzzle.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: iEi WT61P803 PUZZLE MCU from IEI Integration Corp.
> +
> +maintainers:
> +  - Luka Kovacic <luka.kovacic@sartura.hr>
> +
> +description: |
> +  iEi WT61P803 PUZZLE MCU is embedded in some iEi Puzzle series boards.
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
> +
> +  iei-wt61p803-hwmon:

Just 'hwmon'

> +    $ref: ../hwmon/iei,wt61p803-puzzle-hwmon.yaml
> +
> +  leds:
> +    $ref: ../leds/iei,wt61p803-puzzle-leds.yaml
> +
> +required:
> +  - compatible
> +  - current-speed

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    serial {
> +        status = "okay";
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
> +            iei-wt61p803-puzzle-hwmon {
> +                compatible = "iei,wt61p803-puzzle-hwmon";
> +
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
