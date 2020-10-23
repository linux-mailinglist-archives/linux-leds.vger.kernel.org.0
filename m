Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE59297922
	for <lists+linux-leds@lfdr.de>; Fri, 23 Oct 2020 23:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756984AbgJWVy4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Oct 2020 17:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756979AbgJWVyz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Oct 2020 17:54:55 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E733C0613D2
        for <linux-leds@vger.kernel.org>; Fri, 23 Oct 2020 14:54:55 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id n6so3648493ioc.12
        for <linux-leds@vger.kernel.org>; Fri, 23 Oct 2020 14:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=56bfN3uJs3f7SgK7i6vxzLuv9/DdNtFNz9LeALJjPvM=;
        b=f+joyHDNj+in9AUfcjbD8RcG0XdjyrU90iri/e7bpDvKniQkUlkRH5jp8dt3ofPP/j
         XmUjzI55kpuCqqBi4CzuK91SlSih0BZAt4NDZnZWNJ2l53vjiq+X2X34ENGo+GTeYH/t
         xQPhIwl/pW/sspG49MGrdrCMl3tV9KRghvgzTOxJh7od1iSwGZbK5ROzuq+cgWEyGa1n
         RisWjhTa9bW4OpC780eUc+V+PW+v/jcnQ7M+7BoikemPgMKuaGNsjCz00CBPeys6dFZr
         Tv9Tkd4fHV9F7OTt5crxsdGMOd7yzsDSInBQI2vQFdsYL5DmfxuFirzFmICtSgY775Ll
         btCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=56bfN3uJs3f7SgK7i6vxzLuv9/DdNtFNz9LeALJjPvM=;
        b=ZOLy+KHugRQOhNkm3aunlvutVeVSvXTgkkIpXVbANQZeU6vBcCOoRC1m6aQlKMlumh
         UnNkNwTW6chsfE71wf+9HnUVjwWm6Z0zv+Gags1PAP71YMY4CzZd6SrK9HNbQFwEGz5E
         HZu3GEHiTmsmjRzh3aE+NYd+j6LsV8MBLk9wXBzazCD5Nf2ne3k5CJVtMM7WLmc9Qabr
         dyRciDHerOeaIzEmKfLeO0AVmTmQGov3gEw2La5nZnm5wcYUJcoAI4icKON6k6QKyW8v
         4k00KG964kfWT6l53AcKS3JUjbSP7gtT7umZUUfX1JlGoUt7tAcEMJmDtvSNo+7oDpJ0
         CwHw==
X-Gm-Message-State: AOAM531H/92Jl2J0D5XY2iejWFgIqMCsHBKwiUMlv1eYxTyZhWKhNV2H
        4ASeiUBODAC0p9yIDso6k//APywzdTZSas359nhjWw==
X-Google-Smtp-Source: ABdhPJySx07Ku4+36MeK6pUWuxqhnmjoUh0str1rf1jS2fCSAXTBAChblFDcoDoQX52tIbE4yFg+HSy4NCRnmxJk5js=
X-Received: by 2002:a5d:9813:: with SMTP id a19mr3450738iol.194.1603490094450;
 Fri, 23 Oct 2020 14:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
 <20201019221859.56680-2-luka.kovacic@sartura.hr> <20201020153016.GC866676@bogus>
In-Reply-To: <20201020153016.GC866676@bogus>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Fri, 23 Oct 2020 23:54:43 +0200
Message-ID: <CADZsf3ZwgOxP4ZVasdohjw_ky8L-Oqha_wjONtz6AeRSGH6NzA@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: Add iEi vendor prefix and iEi
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

On Tue, Oct 20, 2020 at 5:30 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 20, 2020 at 12:18:54AM +0200, Luka Kovacic wrote:
> > Add the iEi WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> > drivers. A new vendor prefix is also added accordingly for
> > IEI Integration Corp.
> >
> > Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > Cc: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 41 ++++++++++
> >  .../leds/iei,wt61p803-puzzle-leds.yaml        | 45 ++++++++++
> >  .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  4 files changed, 170 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> >  create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> > new file mode 100644
> > index 000000000000..37f0030df237
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/iei,wt61p803-puzzle-hwmon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: iEi WT61P803 PUZZLE MCU HWMON module from IEI Integration Corp.
> > +
> > +maintainers:
> > +  - Luka Kovacic <luka.kovacic@sartura.hr>
> > +
> > +description: |
> > +  This module is a part of the iEi WT61P803 PUZZLE MFD device. For more details
> > +  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
> > +
> > +  The HWMON module is a sub-node of the MCU node in the Device Tree.
> > +
> > +properties:
> > +  compatible:
> > +    const: iei,wt61p803-puzzle-hwmon
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
>
> Blank line between properties.
>
> > +      cooling-levels:
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
>
> additionalProperties: false
>
> > diff --git a/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> > new file mode 100644
> > index 000000000000..0d353e5803bf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/iei,wt61p803-puzzle-leds.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: iEi WT61P803 PUZZLE MCU LED module from IEI Integration Corp.
> > +
> > +maintainers:
> > +  - Luka Kovacic <luka.kovacic@sartura.hr>
> > +
> > +description: |
> > +  This module is a part of the iEi WT61P803 PUZZLE MFD device. For more details
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
> > +patternProperties:
> > +  "^led@0$":
>
> Fixed string, not a pattern. Do you plan to add more? Define the schema
> to what the h/w supports, not current driver support.

The microcontroller software itself currently supports many different GPIOs
which could in the future, in different board implementations be repurposed as
LEDs.

Do I keep the pattern in this case?

>
> > +    type: object
> > +    $ref: common.yaml
> > +    description: |
> > +      Properties for a single LED.
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          Index of the LED. Only one LED is supported at the moment.
> > +        minimum: 0
> > +        maximum: 0
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
>
> additionalProperties: false
>
> > diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> > new file mode 100644
> > index 000000000000..79a232d75093
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/iei,wt61p803-puzzle.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: iEi WT61P803 PUZZLE MCU from IEI Integration Corp.
> > +
> > +maintainers:
> > +  - Luka Kovacic <luka.kovacic@sartura.hr>
> > +
> > +description: |
> > +  iEi WT61P803 PUZZLE MCU is embedded in some iEi Puzzle series boards.
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
> > +
> > +  iei-wt61p803-hwmon:
>
> Just 'hwmon'
>
> > +    $ref: ../hwmon/iei,wt61p803-puzzle-hwmon.yaml
> > +
> > +  leds:
> > +    $ref: ../leds/iei,wt61p803-puzzle-leds.yaml
> > +
> > +required:
> > +  - compatible
> > +  - current-speed
>
> additionalProperties: false
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +    serial {
> > +        status = "okay";
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
> > +            iei-wt61p803-puzzle-hwmon {
> > +                compatible = "iei,wt61p803-puzzle-hwmon";
> > +
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

I will resolve the mentioned issues in the next patchset.

Kind regards,
Luka
