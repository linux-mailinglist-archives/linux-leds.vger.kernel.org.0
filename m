Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E622A1CFC
	for <lists+linux-leds@lfdr.de>; Sun,  1 Nov 2020 10:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgKAJpT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Nov 2020 04:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgKAJpQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Nov 2020 04:45:16 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13982C061A48
        for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2020 01:45:16 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id k21so11943568ioa.9
        for <linux-leds@vger.kernel.org>; Sun, 01 Nov 2020 01:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CT1iia8GuDUfamUVCy7ssmgKgChHFGwKBrm0tLv+r5Q=;
        b=1M6PgKxp0xPikUCo/jsKZbQb7QECX5qZ3UFB+GUt748KQ0sANbynwPCYeNuJNIj9gm
         nwPoXFN34aZ/tC5/9yGzrt0LNnOOt4VZ9wYBwH7hMNPUIzCXEVUcNSPkw1EehfncL7BX
         5XF2nyoGXQTU3RW7B+CajcsEDYVa9fYaFmckuvyxqeQtrbrAgwCTuAV8Vm1m6MOngXG9
         7ROQOhie2L6BTp3+/6H28NPqG8n8701qUFrM+tjcNnMYkhlD429uP4Ian/Cg6nM81rGt
         iDbvlG98TCAvbdRbe1RqthGORQufuxzVchaPE+yx7nM/BecnFWVMmx07TGeI2AxJmTE4
         HLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CT1iia8GuDUfamUVCy7ssmgKgChHFGwKBrm0tLv+r5Q=;
        b=lcX11KNz54pcdJUFECo7KjlXcJzFngcXc3Q1tSwkd9fOiXCvtxgTs8dg1U+DM9gIXY
         EPOmvAobEFnghUL7r76BEGLmVuZUd0q4TCBpjXo6+igkKmkUVOUstj536eqA49z6DTGr
         cjsg9rxccWGREx2+Ao37EM0qAmZU5GQGoqiERvMh4bopG01gH9R9u59rKLkXEl94yEuf
         U7zXmTuu9Z2tD/TmcgbL+iGMPX0Id/f47T/BeDKC3zP9Gf1X4Vz/GHf+bEn8eq5uOp6i
         K8OTPMdSaZ7g0ZHLjDA0A6HHnVF98mHNLY1TB3oNW+fTb5cpu7Lfoq2pOZofKvEPSFfC
         jcdg==
X-Gm-Message-State: AOAM5310HikGvFJhV/he1Y0uMM15YymYgP0+yeHpuyX28uOvFQni8eX+
        xhkxR3BYv5kwi4ebUT6+xrhq2KYbR2i6RjCkJQNanQ==
X-Google-Smtp-Source: ABdhPJy+Rxr8QWojYYarCNBGzjeGEHvmCE5rFqydbJQ91xAUtToreXxJeiiXFsQxsRVpXCsWiPavU1DfqGrOI6bCz6A=
X-Received: by 2002:a02:c64f:: with SMTP id k15mr2912474jan.75.1604223915254;
 Sun, 01 Nov 2020 01:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-2-luka.kovacic@sartura.hr> <20201028151534.GA4034363@bogus>
In-Reply-To: <20201028151534.GA4034363@bogus>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sun, 1 Nov 2020 10:45:04 +0100
Message-ID: <CADZsf3brnSqaxoP4+YA8bHeQMq+DvWQaxYufEn3jCzNCSC0QSQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: Add IEI vendor prefix and IEI
 WT61P803 PUZZLE driver bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Rob,

On Wed, Oct 28, 2020 at 4:15 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Oct 25, 2020 at 02:59:11AM +0200, Luka Kovacic wrote:
> > Add the IEI WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> > drivers. A new vendor prefix is also added accordingly for
> > IEI Integration Corp.
> >
> > Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > Cc: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 53 ++++++++++++
> >  .../leds/iei,wt61p803-puzzle-leds.yaml        | 45 ++++++++++
> >  .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 83 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  4 files changed, 183 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> >  create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> > new file mode 100644
> > index 000000000000..c24a24e90495
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/iei,wt61p803-puzzle-hwmon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: IEI WT61P803 PUZZLE MCU HWMON module from IEI Integration Corp.
> > +
> > +maintainers:
> > +  - Luka Kovacic <luka.kovacic@sartura.hr>
> > +
> > +description: |
> > +  This module is a part of the IEI WT61P803 PUZZLE MFD device. For more details
> > +  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
> > +
> > +  The HWMON module is a sub-node of the MCU node in the Device Tree.
> > +
> > +properties:
> > +  compatible:
> > +    const: iei,wt61p803-puzzle-hwmon
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^fan-group@[0-1]$":
> > +    type: object
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 1
> > +        description:
> > +          Fan group ID
> > +
> > +      cooling-levels:
> > +        minItems: 1
> > +        maxItems: 255
> > +        description:
> > +          Cooling levels for the fans (PWM value mapping)
> > +    description: |
> > +      Properties for each fan group.
> > +    required:
> > +      - reg
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > diff --git a/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> > new file mode 100644
> > index 000000000000..bbf264c13189
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/iei,wt61p803-puzzle-leds.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: IEI WT61P803 PUZZLE MCU LED module from IEI Integration Corp.
> > +
> > +maintainers:
> > +  - Luka Kovacic <luka.kovacic@sartura.hr>
> > +
> > +description: |
> > +  This module is a part of the IEI WT61P803 PUZZLE MFD device. For more details
> > +  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
> > +
> > +  The LED module is a sub-node of the MCU node in the Device Tree.
> > +
> > +properties:
> > +  compatible:
> > +    const: iei,wt61p803-puzzle-leds
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  "led@0":
> > +    type: object
> > +    $ref: common.yaml
> > +    description: |
> > +      Properties for a single LED.
> > +    properties:
> > +      reg:
> > +        description:
> > +          Index of the LED. Only one LED is supported at the moment.
> > +        minimum: 0
> > +        maximum: 0
>
> 'const: 0' instead.
>
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> > new file mode 100644
> > index 000000000000..64264c664c48
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/iei,wt61p803-puzzle.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: IEI WT61P803 PUZZLE MCU from IEI Integration Corp.
> > +
> > +maintainers:
> > +  - Luka Kovacic <luka.kovacic@sartura.hr>
> > +
> > +description: |
> > +  IEI WT61P803 PUZZLE MCU is embedded in some IEI Puzzle series boards.
> > +  It's used for controlling system power states, fans, LEDs and temperature
> > +  sensors.
> > +
> > +  For Device Tree bindings of other sub-modules (HWMON, LEDs) refer to the
> > +  binding documents under the respective subsystem directories.
> > +
> > +properties:
> > +  compatible:
> > +    const: iei,wt61p803-puzzle
> > +
> > +  current-speed:
> > +    description:
> > +      Serial bus speed in bps
> > +    maxItems: 1
> > +
> > +  enable-beep: true
>
> Needs a vendor prefix, description, and type.
>
> > +
> > +  hwmon:
> > +    $ref: ../hwmon/iei,wt61p803-puzzle-hwmon.yaml
> > +
> > +  leds:
> > +    $ref: ../leds/iei,wt61p803-puzzle-leds.yaml
> > +
> > +required:
> > +  - compatible
> > +  - current-speed
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +    serial {
> > +        status = "okay";
>
> Don't show status in examples.
>
> > +        mcu {
> > +            compatible = "iei,wt61p803-puzzle";
> > +            current-speed = <115200>;
> > +            enable-beep;
> > +
> > +            leds {
> > +                compatible = "iei,wt61p803-puzzle-leds";
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                led@0 {
> > +                    reg = <0>;
> > +                    function = LED_FUNCTION_POWER;
> > +                    color = <LED_COLOR_ID_BLUE>;
> > +                };
> > +            };
> > +
> > +            hwmon {
> > +                compatible = "iei,wt61p803-puzzle-hwmon";
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                fan-group@0 {
> > +                    #cooling-cells = <2>;
> > +                    reg = <0x00>;
> > +                    cooling-levels = <64 102 170 230 250>;
> > +                };
> > +
> > +                fan-group@1 {
> > +                    #cooling-cells = <2>;
> > +                    reg = <0x01>;
> > +                    cooling-levels = <64 102 170 230 250>;
> > +                };
> > +            };
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 63996ab03521..5f2595f0b2ad 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -467,6 +467,8 @@ patternProperties:
> >      description: IC Plus Corp.
> >    "^idt,.*":
> >      description: Integrated Device Technologies, Inc.
> > +  "^iei,.*":
> > +    description: IEI Integration Corp.
> >    "^ifi,.*":
> >      description: Ingenieurburo Fur Ic-Technologie (I/F/I)
> >    "^ilitek,.*":
> > --
> > 2.26.2
> >

I'll fix these in a new patchset.

Kind regards,
Luka
