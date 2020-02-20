Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0DE5165B8B
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 11:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgBTKaz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 05:30:55 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45579 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgBTKaz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 05:30:55 -0500
Received: by mail-oi1-f194.google.com with SMTP id v19so27016872oic.12;
        Thu, 20 Feb 2020 02:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LaRxy7mSTm2TUALpIGXjpz65a6FCoe/jI7xl5xTwPto=;
        b=dg8r1ikTI1ZZyBUFISRbgw9825x7ZU7/j2y4g68FQho6dczEffo/LCNoC7KhGwksCu
         a61e62SvqJ5bhNrQbJV1G2RAsNuXFRolPI3ccoITbf6O4SekxA5808H0PS+ULgNKDZS7
         SjERN3VZN4N2o8aGIhGIYkuMiN+IbM0ksvQgROyVVqumGaPONWIWkIlQJ0n3OWXka7L7
         Bo9IUXdu4i7SrraqxBHSo70UFByIDrn2LOSAIegPqkH+UA3V3oOCLfOSCLe38J+q3ZIk
         TbhtTPXZ7Mak14oUwuO/34Pe4MwTRIDYlIxXH6c92Ne2qArIOzyIhOsq88FLjzJBCWJa
         QZvw==
X-Gm-Message-State: APjAAAWdkJdsb+0OrOLkm7X2j7M3QORAoobg1x6Nbia5BouJ8B4wW6PE
        LLjgM0mqJeuAVyH6uWSCjTbJ34AZ6onqOJ/xutkG64HQ
X-Google-Smtp-Source: APXvYqzyg5SeUJapHnGnohk1i8hiYxXjg3x2KCPKIyEqlh7N9USv+WlDEtilOjkYsCFxXxjfurKt3yb828JFZbfyqQw=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr1496275oia.102.1582194654310;
 Thu, 20 Feb 2020 02:30:54 -0800 (PST)
MIME-Version: 1.0
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com> <1582018657-5720-3-git-send-email-nbelin@baylibre.com>
In-Reply-To: <1582018657-5720-3-git-send-email-nbelin@baylibre.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Feb 2020 11:30:43 +0100
Message-ID: <CAMuHMdWPgUKOHyspV3bL_4YKsxgXvEgQqdOzoo-8s8gi_g3rVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: leds: Shiji Lighting APA102C LED driver
To:     Nicolas Belin <nbelin@baylibre.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nicolas,

CC devicetree, Lukas

On Tue, Feb 18, 2020 at 10:39 AM Nicolas Belin <nbelin@baylibre.com> wrote:
> Document Shiji Lighting APA102C LED driver device tree bindings.
>
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> ---
>  .../devicetree/bindings/leds/leds-apa102c.yaml     | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-apa102c.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-apa102c.yaml b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
> new file mode 100644
> index 000000000000..24bc2fc19fcb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
> @@ -0,0 +1,91 @@
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
> +  Each LED is represented as a sub-node of the leds-apa102c device.  Each LED
> +  is a three color RGB LED with 32 levels brightness adjustment that can be
> +  cascaded so that multiple LEDs can be set with a single command.
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
> +required:
> +  - compatible
> +  - reg
> +  - spi-max-frequency
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +patternProperties:
> +  "^led@[0-9]+$":
> +    type: object
> +    description: |
> +      Properties for an array of connected LEDs.
> +
> +    properties:
> +      reg:
> +        description: |
> +          This property corresponds to the led index. It has to be between 0
> +          and the number of managed leds minus 1
> +        maxItems: 1
> +
> +      label:
> +        description: |
> +          This property corresponds to the name of the led. If not set,
> +          the led index will be used to create the led name instead
> +        maxItems: 1
> +
> +      linux,default-trigger: true
> +
> +    required:
> +      - reg
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@0 {
> +            compatible = "shiji,apa102c";
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            spi-max-frequency = <1000000>;
> +            led@0 {
> +                reg = <0>;
> +                label = "led1";
> +            };
> +
> +            led@1 {
> +                reg = <1>;
> +                label = "led2";
> +            };
> +
> +            led@2 {
> +                reg = <2>;
> +                label = "led3";
> +            };
> +        };
> +    };

Perhaps this should use "#daisy-chained-devices" instead of listing all LEDs
explicitly?
Or would that cause problems w.r.t. LED labeling?

Documentation/devicetree/bindings/common-properties.txt

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
