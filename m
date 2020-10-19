Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315812929B2
	for <lists+linux-leds@lfdr.de>; Mon, 19 Oct 2020 16:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgJSOq3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 10:46:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:37982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729544AbgJSOq3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 19 Oct 2020 10:46:29 -0400
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7EC8922363;
        Mon, 19 Oct 2020 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603118788;
        bh=sxNaubuw0OZbW//Pxm72DxQgEeL3MpSJajy+J0BcGeU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IlaIHgyjUfkrn6CoxU1sQz/8HIV91QC6DS+IIIbMXmcDoGPrRG9tE2gCyu0RiVmub
         ipIbCKws/HD9iO1ZwKe22p8pO1DAxdq8M2SW2HQ/iCD0/TFjKyqL7089bG2mTvcHx/
         FxduBistdEo+xLa3nr8Y+o6XGHeZahTMflFvfCBw=
Received: by mail-oi1-f174.google.com with SMTP id q136so160783oic.8;
        Mon, 19 Oct 2020 07:46:28 -0700 (PDT)
X-Gm-Message-State: AOAM531LxdCTTFMKz4BN34H9B/2GG3ahEvRA0xeCRHm9fUGyk27qPoh9
        tEI4IoLdpMMx7tyM1IsVc94IRFZfkMkDe4mPSA==
X-Google-Smtp-Source: ABdhPJy/bZ5mp3HXxfrjbdO45/5KPmXIlsBvCmjdKKhG8cmzKBt8D2qQPaPwbrHEQPknJkjzT9rpNNis2gy1Tnutdas=
X-Received: by 2002:aca:4c52:: with SMTP id z79mr63855oia.147.1603118787576;
 Mon, 19 Oct 2020 07:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201017211035.257110-1-luka.kovacic@sartura.hr> <20201017211035.257110-2-luka.kovacic@sartura.hr>
In-Reply-To: <20201017211035.257110-2-luka.kovacic@sartura.hr>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 19 Oct 2020 09:46:16 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_DisDsaVQQkOJzPXHs4s8dK6oeVTJ6dM-1JUc1yTBdw@mail.gmail.com>
Message-ID: <CAL_Jsq+_DisDsaVQQkOJzPXHs4s8dK6oeVTJ6dM-1JUc1yTBdw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: Add iEi vendor prefix and iEi
 WT61P803 PUZZLE driver bindings
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Oct 17, 2020 at 4:10 PM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> Add the iEi WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> drivers. A new vendor prefix is also added accordingly for
> IEI Integration Corp.

Please resend with the DT list CCed if you want this reviewed and so
that automated checks run.

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
> +    $ref: ../hwmon/iei,wt61p803-puzzle-hwmon.yaml
> +
> +  leds:
> +    $ref: ../leds/iei,wt61p803-puzzle-leds.yaml
> +
> +required:
> +  - compatible
> +  - current-speed
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
