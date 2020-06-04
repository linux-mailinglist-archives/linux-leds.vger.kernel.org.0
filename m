Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0376E1EEE10
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2020 00:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgFDW7n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 18:59:43 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34602 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbgFDW7l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 18:59:41 -0400
Received: by mail-io1-f68.google.com with SMTP id m81so8271157ioa.1;
        Thu, 04 Jun 2020 15:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8uhmMDfRFKU/nBl31EsFuSRXyVismi/8+HPrlybWyQk=;
        b=nxg0KN+nnJaCr/jrPAtkbxDrMBe5SbyMZMMzwaUktvReGm2BXBq+jFHnKuv1Pg6GM2
         tOXIPxcm30EJNi5HqvskXQ4hrX2DWtdzt6eW4RJV7A6SKsQfdjp4nErHHq6LkMMP4RMg
         y21X8EC7cl7Mn1EPuvp3yp46IH2KArR/9AAXGcu1XvEm67vigDJX4ubyrPiZiGHgee7E
         o1iXo8wklMSPK71RF6Bg1sTOINZgBPS4gHrybs8v+JTt/GqhQPswsKA2JidT7WOJ7/dq
         hut2wS6S4dOFS4TmNqyIveeKSliiP9pv9Kypv3zrHav4M7CxUKC0jUdeznfkSld3eIxn
         n4lA==
X-Gm-Message-State: AOAM530o/5lERZd1ygF4dREMC+4bp96+65bw/O+YxHe5d3CFOoQEiqlR
        ewiXrf1iuDKnZwmQv5YndQ==
X-Google-Smtp-Source: ABdhPJy3FRCmhs5wpZu5M6xi9I5On7T/sWS+PTp9rSvKw2YGDhhjzyd/3BPor/LTC/K+iEwpm5QpLw==
X-Received: by 2002:a05:6602:114:: with SMTP id s20mr6033098iot.11.1591311580245;
        Thu, 04 Jun 2020 15:59:40 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z4sm479124iot.24.2020.06.04.15.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 15:59:39 -0700 (PDT)
Received: (nullmailer pid 6101 invoked by uid 1000);
        Thu, 04 Jun 2020 22:59:38 -0000
Date:   Thu, 4 Jun 2020 16:59:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v26 04/15] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
Message-ID: <20200604225938.GA4175214@bogus>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-5-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604120504.32425-5-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 04, 2020 at 07:04:53AM -0500, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
> LP5018, LP5012 and LP5009 RGB LED device driver.  The LP5036/30/24/18/12/9
> can control RGB LEDs individually or as part of a control bank group.
> These devices have the ability to adjust the mixing control for the RGB
> LEDs to obtain different colors independent of the overall brightness of
> the LED grouping.
> 
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5012.pdf
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
> 
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.yaml | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> new file mode 100644
> index 000000000000..02fcdc13262f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-lp50xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for LP50XX RGB LED from Texas Instruments.
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB LEDs into
> +  a LED group or control them individually.
> +
> +  The difference in these RGB LED drivers is the number of supported RGB
> +  modules.
> +
> +  For more product information please see the link below:
> +  http://www.ti.com/lit/ds/symlink/lp5012.pdf
> +  http://www.ti.com/lit/ds/symlink/lp5024.pdf
> +  http://www.ti.com/lit/ds/symlink/lp5036.pdf
> +
> +properties:
> +  #allOf:
> +    #- $ref: "common.yaml#"
> +    #- $ref: "leds-class-multicolor.yaml#"

These describe properties in the 'multi-led' nodes, so the $ref goes 
there. And you only need the 2nd one because it already references the 
1st one (or it should once you fix patch 1).

> +
> +  compatible:
> +    enum:
> +      - ti,lp5009
> +      - ti,lp5012
> +      - ti,lp5018
> +      - ti,lp5024
> +      - ti,lp5030
> +      - ti,lp5036
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      I2C slave address
> +      lp5009/12 - 0x14, 0x15, 0x16, 0x17
> +      lp5018/24 - 0x28, 0x29, 0x2a, 0x2b
> +      lp5030/36 - 0x30, 0x31, 0x32, 0x33
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO pin to enable/disable the device.
> +
> +  vled-supply:
> +    description: LED supply.
> +
> +  child-node:

I guess you didn't understand what I said on this. What you need is:

patternProperties:
  '^multi-led@[0-9]$':
    type: object
    $ref: leds-class-multicolor.yaml#
    properties:
      ...

    patternProperties:
      '^led@[0-9]$':
        type: object
        $ref: common.yaml#

Adjust '[0-9]' based on how many possible child addresses there can be. 
It's hex if more than 10.

> +    properties:
> +      ti,led-bank:
> +        description:
> +          This property denotes the LED module numbers that will be controlled as
> +          a single RGB cluster.  Each LED module number will be controlled by a
> +          single LED class instance.
> +          There can only be one instance of the ti,led-bank
> +          property for each device node.  This is a required node if the LED
> +          modules are to be banked.
> +        $ref: /schemas/types.yaml#definitions/uint32-array
> +
> +required:
> +  - compatible
> +  - reg

additionalProperties: false

> +
> +examples:
> +  - |
> +   #include <dt-bindings/gpio/gpio.h>
> +   #include <dt-bindings/leds/common.h>
> +
> +   i2c {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       led-controller@14 {
> +           compatible = "ti,lp5009";
> +           reg = <0x14>;
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +           enable-gpios = <&gpio1 16>;
> +
> +           multi-led@1 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <1>;
> +               color = <LED_COLOR_ID_MULTI>;
> +               function = LED_FUNCTION_CHARGING;
> +
> +               led@0 {
> +                   reg = <0>;
> +                   color = <LED_COLOR_ID_RED>;
> +               };
> +
> +               led@1 {
> +                   reg = <1>;
> +                   color = <LED_COLOR_ID_GREEN>;
> +               };
> +
> +               led@2 {
> +                   reg = <2>;
> +                   color = <LED_COLOR_ID_BLUE>;
> +               };
> +          };
> +
> +          multi-led@2 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <2>;
> +            color = <LED_COLOR_ID_MULTI>;
> +            function = LED_FUNCTION_STANDBY;
> +            ti,led-bank = <2 3 5>;

I still don't understand why 'reg = <2 3 5>;' with the 1st entry being 
the control bank. Is '2' in reg not the same thing as '2' here?

> +
> +            led@6 {
> +              reg = <0x6>;
> +              color = <LED_COLOR_ID_RED>;
> +              led-sources = <6 9 15>;
> +            };
> +
> +            led@7 {
> +              reg = <0x7>;
> +              color = <LED_COLOR_ID_GREEN>;
> +              led-sources = <7 10 16>;
> +            };
> +
> +            led@8 {
> +              reg = <0x8>;
> +              color = <LED_COLOR_ID_BLUE>;
> +              led-sources = <8 11 17>;
> +            };
> +         };
> +       };
> +    };
> -- 
> 2.26.2
> 
