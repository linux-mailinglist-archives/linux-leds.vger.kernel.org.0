Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01AD1EEE29
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2020 01:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgFDXMu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 19:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgFDXMt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 19:12:49 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A44C08C5C0;
        Thu,  4 Jun 2020 16:04:59 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id d7so8290448ioq.5;
        Thu, 04 Jun 2020 16:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XZ6QwmQKh/x8sp9WHw70YKItII5inqqXGpYPEjPSWcE=;
        b=qYZ1/EzU36LKJRRzYEyl3T1U9tQkndzUi2JLpNV17V41z/xgVfHL6NSab7KSliiwNt
         dMhojKSYkwZz5JjGGKL2E5+2wX30Yx7BcaznpZUM6GAz0AThId1dJ+M0NfBT/K4F3G49
         XmjNxPuduhHWzyK93WAc+lIIWGJ5RN47KPN+2l9opXpH2d/ak11X6nnEmriBSysU8Slt
         AAnOPIRcfa317e5+AkZCFegh4cVUk3Vy/pP+/fzkwFShqKlkTeQiF1QnatIKCdQAVhAk
         pfL+cKHDp2tCxHRxepAlULToZm6nZwO0B2Q8YkoKFMvBqMuqRykhZ+RR0r7MZ6hTVE7x
         WBQQ==
X-Gm-Message-State: AOAM532xKSd5w98tqMA2g1tXuZeA5i2BPeJltDx/II7voiZN2MA7+M9q
        idRN6jv6LVUDFKZ2v/AQdg==
X-Google-Smtp-Source: ABdhPJxUoeU61sbAtJFVkqzNpF5WanwnOrnBSSYaL+EUXqUzkfHIO4ekZDeh2QyoY0KLg8uu72/v9Q==
X-Received: by 2002:a05:6602:2437:: with SMTP id g23mr6092019iob.5.1591311898399;
        Thu, 04 Jun 2020 16:04:58 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v20sm2162770ilc.1.2020.06.04.16.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 16:04:57 -0700 (PDT)
Received: (nullmailer pid 13118 invoked by uid 1000);
        Thu, 04 Jun 2020 23:04:56 -0000
Date:   Thu, 4 Jun 2020 17:04:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v26 06/15] dt-bindings: leds: Convert leds-lp55xx to yaml
Message-ID: <20200604230456.GA6520@bogus>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-7-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604120504.32425-7-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 04, 2020 at 07:04:55AM -0500, Dan Murphy wrote:
> Convert the leds-lp55xx.txt to yaml binding.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lp55xx.txt  | 228 ------------------
>  .../devicetree/bindings/leds/leds-lp55xx.yaml | 220 +++++++++++++++++
>  2 files changed, 220 insertions(+), 228 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
> deleted file mode 100644
> index 1b66a413fb9d..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
> +++ /dev/null
> @@ -1,228 +0,0 @@
> -Binding for TI/National Semiconductor LP55xx Led Drivers
> -
> -Required properties:
> -- compatible: one of
> -	national,lp5521
> -	national,lp5523
> -	ti,lp55231
> -	ti,lp5562
> -	ti,lp8501
> -
> -- reg: I2C slave address
> -- clock-mode: Input clock mode, (0: automode, 1: internal, 2: external)
> -
> -Each child has own specific current settings
> -- led-cur: Current setting at each led channel (mA x10, 0 if led is not connected)
> -- max-cur: Maximun current at each led channel.
> -
> -Optional properties:
> -- enable-gpio: GPIO attached to the chip's enable pin
> -- label: Used for naming LEDs
> -- pwr-sel: LP8501 specific property. Power selection for output channels.
> -         0: D1~9 are connected to VDD
> -         1: D1~6 with VDD, D7~9 with VOUT
> -         2: D1~6 with VOUT, D7~9 with VDD
> -         3: D1~9 are connected to VOUT
> -
> -Alternatively, each child can have a specific channel name and trigger:
> -- chan-name (optional): name of channel
> -- linux,default-trigger (optional): see
> -  Documentation/devicetree/bindings/leds/common.txt
> -
> -example 1) LP5521
> -3 LED channels, external clock used. Channel names are 'lp5521_pri:channel0',
> -'lp5521_pri:channel1' and 'lp5521_pri:channel2', with a heartbeat trigger
> -on channel 0.
> -
> -lp5521@32 {
> -	compatible = "national,lp5521";
> -	reg = <0x32>;
> -	label = "lp5521_pri";
> -	clock-mode = /bits/ 8 <2>;
> -
> -	chan0 {
> -		led-cur = /bits/ 8 <0x2f>;
> -		max-cur = /bits/ 8 <0x5f>;
> -		linux,default-trigger = "heartbeat";
> -	};
> -
> -	chan1 {
> -		led-cur = /bits/ 8 <0x2f>;
> -		max-cur = /bits/ 8 <0x5f>;
> -	};
> -
> -	chan2 {
> -		led-cur = /bits/ 8 <0x2f>;
> -		max-cur = /bits/ 8 <0x5f>;
> -	};
> -};
> -
> -example 2) LP5523
> -9 LED channels with specific name. Internal clock used.
> -The I2C slave address is configurable with ASEL1 and ASEL0 pins.
> -Available addresses are 32/33/34/35h.
> -
> -ASEL1    ASEL0    Address
> --------------------------
> - GND      GND       32h
> - GND      VEN       33h
> - VEN      GND       34h
> - VEN      VEN       35h
> -
> -lp5523@32 {
> -	compatible = "national,lp5523";
> -	reg = <0x32>;
> -	clock-mode = /bits/ 8 <1>;
> -
> -	chan0 {
> -		chan-name = "d1";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan1 {
> -		chan-name = "d2";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan2 {
> -		chan-name = "d3";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan3 {
> -		chan-name = "d4";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan4 {
> -		chan-name = "d5";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan5 {
> -		chan-name = "d6";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan6 {
> -		chan-name = "d7";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan7 {
> -		chan-name = "d8";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan8 {
> -		chan-name = "d9";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -};
> -
> -example 3) LP5562
> -4 channels are defined.
> -
> -lp5562@30 {
> -	compatible = "ti,lp5562";
> -	reg = <0x30>;
> -	clock-mode = /bits/8 <2>;
> -
> -	chan0 {
> -		chan-name = "R";
> -		led-cur = /bits/ 8 <0x20>;
> -		max-cur = /bits/ 8 <0x60>;
> -	};
> -
> -	chan1 {
> -		chan-name = "G";
> -		led-cur = /bits/ 8 <0x20>;
> -		max-cur = /bits/ 8 <0x60>;
> -	};
> -
> -	chan2 {
> -		chan-name = "B";
> -		led-cur = /bits/ 8 <0x20>;
> -		max-cur = /bits/ 8 <0x60>;
> -	};
> -
> -	chan3 {
> -		chan-name = "W";
> -		led-cur = /bits/ 8 <0x20>;
> -		max-cur = /bits/ 8 <0x60>;
> -	};
> -};
> -
> -example 4) LP8501
> -9 channels are defined. The 'pwr-sel' is LP8501 specific property.
> -Others are same as LP5523.
> -
> -lp8501@32 {
> -	compatible = "ti,lp8501";
> -	reg = <0x32>;
> -	clock-mode = /bits/ 8 <2>;
> -	pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
> -
> -	chan0 {
> -		chan-name = "d1";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan1 {
> -		chan-name = "d2";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan2 {
> -		chan-name = "d3";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan3 {
> -		chan-name = "d4";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan4 {
> -		chan-name = "d5";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan5 {
> -		chan-name = "d6";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan6 {
> -		chan-name = "d7";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan7 {
> -		chan-name = "d8";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -
> -	chan8 {
> -		chan-name = "d9";
> -		led-cur = /bits/ 8 <0x14>;
> -		max-cur = /bits/ 8 <0x20>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> new file mode 100644
> index 000000000000..9d6ded5fbc14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> @@ -0,0 +1,220 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-lp55xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI/National Semiconductor LP55xx and LP8501 LED Drivers
> +
> +maintainers:
> +  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
> +  - Pavel Machek <pavel@ucw.cz>
> +
> +description: |
> +  Bindings for the TI/National Semiconductor LP55xx and LP8501 multi channel
> +  LED Drivers.
> +
> +  For more product information please see the link below:
> +    https://www.ti.com/lit/gpn/lp5521
> +    https://www.ti.com/lit/gpn/lp5523
> +    https://www.ti.com/lit/gpn/lp55231
> +    https://www.ti.com/lit/gpn/lp5562
> +    https://www.ti.com/lit/gpn/lp8501
> +
> +properties:
> +  #allOf:
> +    #- $ref: "common.yaml#"
> +    #- $ref: "leds-class-multicolor.yaml#"
> +
> +  compatible:
> +    enum:
> +      - national,lp5521
> +      - national,lp5523
> +      - ti,lp55231
> +      - ti,lp5562
> +      - ti,lp8501
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C slave address
> +
> +  clock-mode:
> +    $ref: /schemas/types.yaml#definitions/uint8
> +    maxItems: 1

'maxItems' is for an array. This is a scalar, so drop.

> +    description: |
> +      Input clock mode
> +      0 - automode
> +      1 - internal
> +      2 - external

enum: 
  - 0  # automode
  - 1
  - 2


> +
> +  enable-gpio:
> +    maxItems: 1
> +    description: |
> +      GPIO attached to the chip's enable pin
> +
> +  pwr-sel:
> +    $ref: /schemas/types.yaml#definitions/uint8
> +    maxItems: 1
> +    description: |
> +      LP8501 specific property. Power selection for output channels.
> +         0 - D1~9 are connected to VDD
> +         1 - D1~6 with VDD, D7~9 with VOUT
> +         2 - D1~6 with VOUT, D7~9 with VDD
> +         3 - D1~9 are connected to VOUT

Similarly here, make this a schema.

> +
> +  child-node:

This needs to be a pattern matching the child nodes' names.

> +    type: object
> +    properties:
> +      led-cur:
> +        $ref: /schemas/types.yaml#definitions/uint8
> +        maxItems: 1

Not an array.

> +        description: |
> +          Current setting at each LED channel (mA x10, 0 if LED is not connected)

0-255 are valid values?

> +
> +      max-cur:
> +        $ref: /schemas/types.yaml#definitions/uint8
> +        maxItems: 1
> +        description: Maximun current at each LED channel.
> +
> +      reg:
> +        maxItems: 1
> +        description: |
> +          Output channel for the LED.  This is zero based channel identifier and
> +          the data sheet is a one based channel identifier.
> +          reg value to output to LED output number
> +          D1 = reg value is 0
> +          D2 = reg value is 1
> +          D3 = reg value is 2
> +          D4 = reg value is 3
> +          D5 = reg value is 4
> +          D6 = reg value is 5
> +          D7 = reg value is 6
> +          D8 = reg value is 7
> +          D9 = reg value is 8
> +
> +      chan-name:
> +        $ref: /schemas/types.yaml#definitions/string
> +        description: name of channel
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +   #include <dt-bindings/leds/common.h>
> +
> +   i2c {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       led-controller@32 {
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +           compatible = "ti,lp8501";
> +           reg = <0x32>;
> +           clock-mode = /bits/ 8 <2>;
> +           pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
> +
> +           led@0 {
> +               reg = <0>;
> +               chan-name = "d1";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +
> +           led@1 {
> +               reg = <1>;
> +               chan-name = "d2";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +
> +           led@2 {
> +               reg = <2>;
> +               chan-name = "d3";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +
> +           led@3 {
> +               reg = <3>;
> +               chan-name = "d4";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +
> +           led@4 {
> +               reg = <4>;
> +               chan-name = "d5";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +
> +           led@5 {
> +               reg = <5>;
> +               chan-name = "d6";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +
> +           led@6 {
> +               reg = <6>;
> +               chan-name = "d7";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +
> +           led@7 {
> +               reg = <7>;
> +               chan-name = "d8";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +
> +           led@8 {
> +               reg = <8>;
> +               chan-name = "d9";
> +               led-cur = /bits/ 8 <0x14>;
> +               max-cur = /bits/ 8 <0x20>;
> +           };
> +        };
> +
> +       led-controller@33 {
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +           compatible = "national,lp5523";
> +           reg = <0x33>;
> +           clock-mode = /bits/ 8 <0>;
> +
> +           multi-led@2 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x2>;
> +               color = <LED_COLOR_ID_MULTI>;
> +               function = LED_FUNCTION_STANDBY;
> +               linux,default-trigger = "heartbeat";
> +
> +               led@0 {
> +                   led-cur = /bits/ 8 <50>;
> +                   max-cur = /bits/ 8 <100>;
> +                   reg = <0x0>;
> +                   color = <LED_COLOR_ID_GREEN>;
> +               };
> +
> +               led@1 {
> +                   led-cur = /bits/ 8 <50>;
> +                   max-cur = /bits/ 8 <100>;
> +                   reg = <0x1>;
> +                   color = <LED_COLOR_ID_BLUE>;
> +               };
> +
> +               led@6 {
> +                   led-cur = /bits/ 8 <50>;
> +                   max-cur = /bits/ 8 <100>;
> +                   reg = <0x6>;
> +                   color = <LED_COLOR_ID_RED>;
> +               };
> +            };
> +        };
> +    };
> -- 
> 2.26.2
> 
