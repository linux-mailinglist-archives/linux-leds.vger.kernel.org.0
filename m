Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB5B3C6012
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jul 2021 18:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhGLQHa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Jul 2021 12:07:30 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:33627 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhGLQHa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Jul 2021 12:07:30 -0400
Received: by mail-io1-f51.google.com with SMTP id z11so1582068iow.0;
        Mon, 12 Jul 2021 09:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t7zLlkpjqidi7PE+jjVFSaEwNjSZq4b1sP5J9W4oGrw=;
        b=kwGLpAkrzYN6kQjbIywssQ+V1kZQPdOgryo4G9b0PR5EP3TlKDBdcAhhp84LHaf+es
         oh5LU0+mr7BFF4ahooU3uugab2PlpMFfd6H8zlwKaYnadyBKxz1Iqh2WZR1dNhoq14Ph
         teLFLCrzzAEG6OczpBrnAD3lzp1nOFTvm2STgmhGYEqZOhesCFsHJFgtE5+4/NJixAoC
         AyalG8Idj+3C0shTGRZOFTB+1awNJ73MV1amSCasPNn6fReV5SundnIwcEFAbtmwleoE
         husT7fhccLpO/XQTR7Ieu5LsvSFHmrD/RN413nKlokPKFVcShmCzlxNeyvkynxJp5cIS
         SVVA==
X-Gm-Message-State: AOAM530z+5Jhq2L/9RLToxNbWvW6klBKdFm7TR8uqPmII41nQdeMJW0X
        JyX2GkwEch7O5x0B2guZ3g==
X-Google-Smtp-Source: ABdhPJzOLYeTmZxL5V7NzmoyZPyyvU5QgZDr4OPjKFj9sUcqyCj09ZQNxbo71clkNp7eJvo9fYYvmQ==
X-Received: by 2002:a05:6638:3594:: with SMTP id v20mr44293107jal.25.1626105878851;
        Mon, 12 Jul 2021 09:04:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t15sm6942731iln.36.2021.07.12.09.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 09:04:37 -0700 (PDT)
Received: (nullmailer pid 2022797 invoked by uid 1000);
        Mon, 12 Jul 2021 16:04:35 -0000
Date:   Mon, 12 Jul 2021 10:04:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Pavo Banicevic <pavo.banicevic@sartura.hr>
Cc:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, corbet@lwn.net,
        lee.jones@linaro.org, pavel@ucw.cz, linux@roeck-us.net,
        jdelvare@suse.com, goran.medic@sartura.hr, luka.perkov@sartura.hr,
        luka.kovacic@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: Re: [PATCH v8 1/7] dt-bindings: Add IEI vendor prefix and IEI
 WT61P803 PUZZLE driver bindings
Message-ID: <20210712160435.GA1994579@robh.at.kernel.org>
References: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
 <20210705134939.28691-2-pavo.banicevic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705134939.28691-2-pavo.banicevic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 05, 2021 at 03:49:33PM +0200, Pavo Banicevic wrote:
> From: Luka Kovacic <luka.kovacic@sartura.hr>
> 
> Add the IEI WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> drivers. A new vendor prefix is also added accordingly for
> IEI Integration Corp.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 53 ++++++++++++
>  .../leds/iei,wt61p803-puzzle-leds.yaml        | 44 ++++++++++
>  .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  4 files changed, 181 insertions(+)
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
> index 000000000000..dc3e39aafd3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> @@ -0,0 +1,44 @@
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

Don't need quotes.

> +    type: object
> +    $ref: common.yaml
> +    description: |
> +      Properties for a single LED.
> +    properties:
> +      reg:
> +        description:
> +          Index of the LED. Only one LED is supported at the moment.
> +        const: 0

If there can only be 1 LED, just make an 'led' node and drop reg.

> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> new file mode 100644
> index 000000000000..2452631505cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> @@ -0,0 +1,82 @@
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
> +
> +  hwmon:
> +    $ref: ../hwmon/iei,wt61p803-puzzle-hwmon.yaml

/schemas/hwmon/...

> +
> +  leds:
> +    $ref: ../leds/iei,wt61p803-puzzle-leds.yaml

/schemas/leds/...

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
> index b868cefc7c55..e02b6d6eb568 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -509,6 +509,8 @@ patternProperties:
>      description: IC Plus Corp.
>    "^idt,.*":
>      description: Integrated Device Technologies, Inc.
> +  "^iei,.*":
> +    description: IEI Integration Corp.
>    "^ifi,.*":
>      description: Ingenieurburo Fur Ic-Technologie (I/F/I)
>    "^ilitek,.*":
> -- 
> 2.31.1
> 
> 
