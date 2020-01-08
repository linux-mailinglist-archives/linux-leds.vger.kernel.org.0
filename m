Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A78134B30
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2020 20:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgAHTCq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Jan 2020 14:02:46 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40593 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbgAHTCp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Jan 2020 14:02:45 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so34837wmi.5;
        Wed, 08 Jan 2020 11:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SbVwETeyPDdT+xEquxM1M21Z8QzehODmBi5sujbtsDo=;
        b=cmwxe9G6oxZEkXUO15qhpakk+YGviEIbr9tD7+IZfAzvGR6IBudjmZe+6XlYgXnOiq
         l+/33eAdf6yqMr93QWrnSZs3Z9DROjmwhLfda3rfOuuu6TwkBbxjmOdQxfSwrnGLMvTp
         UrUcNA75r8Af2S+PI3LYqK+bQLzK4OZpsG/ZEVSq7Z7yUka439ILQZnoGIR8KRaD7F3T
         PXrBO83u5Dq5g4Ndy/K1HIWhRHEz/5o5uORuToEW4hRSahcIiT6s2fvpoc1+qFkFn+/w
         gB6pV1hKuAF/Rs4mglw4nSxOZtZFXtR8noBxb8HxzT+BG6dsCG54bdDnLbBVdEeryUu7
         jscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SbVwETeyPDdT+xEquxM1M21Z8QzehODmBi5sujbtsDo=;
        b=ZZpKuEZ+PgaWI+GjfBrszlGIiWnBdCjgqEUUOSgMEEXQCQvOMtxOOZfe+oXY6gzZVL
         ZLFOuUhf9q4nF3i7N8wMSu1FF4SyGycG47ndTt/q/a4CRATqzcbgWeUZjpGBc5SqD3Hu
         XHH1594kgsg0T1AeOB6E5KKW9vrD5EMh48viZJespNQvXLHnrctipLdGtMpx1tCs08bg
         4qY0ME/oF7GRGXwt25kXxgoEupc8GvCpTLcn87iQcZaPWG6NOGeNnR6AvS3dk7F4NKex
         u8pM+2T2C5DhOaRYxPj5/KlHx38+z84rlSmIdAax+TSGXH96D+uzbCm5ZgIpMnMx0tUJ
         PFJQ==
X-Gm-Message-State: APjAAAXXMI79y86kwNb+xpZq5f4eXhPAbDT4NxXwtNkpK2C3g8RUVXeY
        JFcNtxHOXbinuB7Q7rMNYt8=
X-Google-Smtp-Source: APXvYqxkEkRgipqAxdxlYKbDUcsZaTH8xgDv2vDsjgLNpnArhmoXGldgpMqw2Q13umMnfZ767iG8fw==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr49833wmc.119.1578510161220;
        Wed, 08 Jan 2020 11:02:41 -0800 (PST)
Received: from [192.168.1.19] (bfq48.neoplus.adsl.tpnet.pl. [83.28.54.48])
        by smtp.gmail.com with ESMTPSA id o7sm55784wmh.11.2020.01.08.11.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 11:02:40 -0800 (PST)
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Convert common LED binding to
 schema
To:     Rob Herring <robh@kernel.org>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
References: <20200108001738.8209-1-robh@kernel.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bec9ab4a-da09-6ef1-7334-d19f11ab2523@gmail.com>
Date:   Wed, 8 Jan 2020 20:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200108001738.8209-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 1/8/20 1:17 AM, Rob Herring wrote:
> Convert the common LEDs properties bindings to a schema. As trigger source
> providers are different nodes, we need to split trigger source properties
> to a separate file.
> 
> Bindings for LED controllers can reference the common schema for the LED
> child nodes:
> 
> patternProperties:
>   "^led@[0-4]":
>     type: object
>     allOf:
>       - $ref: common.yaml#
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-leds@vger.kernel.org
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Jacek, Please take this via led tree

Currently Pavel maintains LED tree. Pavel?

> v2:
> - Fix typo in function
> 
>  .../devicetree/bindings/leds/common.txt       | 174 +------------
>  .../devicetree/bindings/leds/common.yaml      | 228 ++++++++++++++++++
>  .../bindings/leds/trigger-source.yaml         |  24 ++
>  3 files changed, 253 insertions(+), 173 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/common.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/trigger-source.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 9fa6f9795d50..26d770ef3601 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -1,173 +1 @@
> -* Common leds properties.
> -
> -LED and flash LED devices provide the same basic functionality as current
> -regulators, but extended with LED and flash LED specific features like
> -blinking patterns, flash timeout, flash faults and external flash strobe mode.
> -
> -Many LED devices expose more than one current output that can be connected
> -to one or more discrete LED component. Since the arrangement of connections
> -can influence the way of the LED device initialization, the LED components
> -have to be tightly coupled with the LED device binding. They are represented
> -by child nodes of the parent LED device binding.
> -
> -
> -Optional properties for child nodes:
> -- led-sources : List of device current outputs the LED is connected to. The
> -		outputs are identified by the numbers that must be defined
> -		in the LED device binding documentation.
> -
> -- function: LED functon. Use one of the LED_FUNCTION_* prefixed definitions
> -	    from the header include/dt-bindings/leds/common.h.
> -	    If there is no matching LED_FUNCTION available, add a new one.
> -
> -- color : Color of the LED. Use one of the LED_COLOR_ID_* prefixed definitions
> -	  from the header include/dt-bindings/leds/common.h.
> -	  If there is no matching LED_COLOR_ID available, add a new one.
> -
> -- function-enumerator: Integer to be used when more than one instance
> -                       of the same function is needed, differing only with
> -		       an ordinal number.
> -
> -- label : The label for this LED. If omitted, the label is taken from the node
> -	  name (excluding the unit address). It has to uniquely identify
> -	  a device, i.e. no other LED class device can be assigned the same
> -	  label. This property is deprecated - use 'function' and 'color'
> -	  properties instead. function-enumerator has no effect when this
> -	  property is present.
> -
> -- default-state : The initial state of the LED. Valid values are "on", "off",
> -  and "keep". If the LED is already on or off and the default-state property is
> -  set the to same value, then no glitch should be produced where the LED
> -  momentarily turns off (or on). The "keep" setting will keep the LED at
> -  whatever its current state is, without producing a glitch.  The default is
> -  off if this property is not present.
> -
> -- linux,default-trigger :  This parameter, if present, is a
> -    string defining the trigger assigned to the LED.  Current triggers are:
> -     "backlight" - LED will act as a back-light, controlled by the framebuffer
> -		   system
> -     "default-on" - LED will turn on (but for leds-gpio see "default-state"
> -		    property in Documentation/devicetree/bindings/leds/leds-gpio.txt)
> -     "heartbeat" - LED "double" flashes at a load average based rate
> -     "disk-activity" - LED indicates disk activity
> -     "ide-disk" - LED indicates IDE disk activity (deprecated),
> -                  in new implementations use "disk-activity"
> -     "timer" - LED flashes at a fixed, configurable rate
> -     "pattern" - LED alters the brightness for the specified duration with one
> -                 software timer (requires "led-pattern" property)
> -
> -- led-pattern : Array of integers with default pattern for certain triggers.
> -                Each trigger may parse this property differently:
> -                - one-shot : two numbers specifying delay on and delay off (in ms),
> -                - timer : two numbers specifying delay on and delay off (in ms),
> -                - pattern : the pattern is given by a series of tuples, of
> -                  brightness and duration (in ms).  The exact format is
> -                  described in:
> -                  Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
> -
> -
> -- led-max-microamp : Maximum LED supply current in microamperes. This property
> -                     can be made mandatory for the board configurations
> -                     introducing a risk of hardware damage in case an excessive
> -                     current is set.
> -                     For flash LED controllers with configurable current this
> -                     property is mandatory for the LEDs in the non-flash modes
> -                     (e.g. torch or indicator).
> -
> -- panic-indicator : This property specifies that the LED should be used,
> -		    if at all possible, as a panic indicator.
> -
> -- trigger-sources : List of devices which should be used as a source triggering
> -		    this LED activity. Some LEDs can be related to a specific
> -		    device and should somehow indicate its state. E.g. USB 2.0
> -		    LED may react to device(s) in a USB 2.0 port(s).
> -		    Another common example is switch or router with multiple
> -		    Ethernet ports each of them having its own LED assigned
> -		    (assuming they are not hardwired). In such cases this
> -		    property should contain phandle(s) of related source
> -		    device(s).
> -		    In many cases LED can be related to more than one device
> -		    (e.g. one USB LED vs. multiple USB ports). Each source
> -		    should be represented by a node in the device tree and be
> -		    referenced by a phandle and a set of phandle arguments. A
> -		    length of arguments should be specified by the
> -		    #trigger-source-cells property in the source node.
> -
> -Required properties for flash LED child nodes:
> -- flash-max-microamp : Maximum flash LED supply current in microamperes.
> -- flash-max-timeout-us : Maximum timeout in microseconds after which the flash
> -                         LED is turned off.
> -
> -For controllers that have no configurable current the flash-max-microamp
> -property can be omitted.
> -For controllers that have no configurable timeout the flash-max-timeout-us
> -property can be omitted.
> -
> -* Trigger source providers
> -
> -Each trigger source should be represented by a device tree node. It may be e.g.
> -a USB port or an Ethernet device.
> -
> -Required properties for trigger source:
> -- #trigger-source-cells : Number of cells in a source trigger. Typically 0 for
> -			  nodes of simple trigger sources (e.g. a specific USB
> -			  port).
> -
> -* Examples
> -
> -#include <dt-bindings/leds/common.h>
> -
> -led-controller@0 {
> -	compatible = "gpio-leds";
> -
> -	led0 {
> -		function = LED_FUNCTION_STATUS;
> -		linux,default-trigger = "heartbeat";
> -		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
> -	};
> -
> -	led1 {
> -		function = LED_FUNCTION_USB;
> -		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> -		trigger-sources = <&ohci_port1>, <&ehci_port1>;
> -	};
> -};
> -
> -led-controller@0 {
> -	compatible = "maxim,max77693-led";
> -
> -	led {
> -		function = LED_FUNCTION_FLASH;
> -		color = <LED_COLOR_ID_WHITE>;
> -		led-sources = <0>, <1>;
> -		led-max-microamp = <50000>;
> -		flash-max-microamp = <320000>;
> -		flash-max-timeout-us = <500000>;
> -	};
> -};
> -
> -led-controller@30 {
> -        compatible = "panasonic,an30259a";
> -        reg = <0x30>;
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -
> -        led@1 {
> -		reg = <1>;
> -		linux,default-trigger = "heartbeat";
> -		function = LED_FUNCTION_INDICATOR;
> -		function-enumerator = <1>;
> -        };
> -
> -        led@2 {
> -		reg = <2>;
> -		function = LED_FUNCTION_INDICATOR;
> -		function-enumerator = <2>;
> -        };
> -
> -        led@3 {
> -		reg = <3>;
> -		function = LED_FUNCTION_INDICATOR;
> -		function-enumerator = <3>;
> -        };
> -};
> +This file has moved to ./common.yaml.
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> new file mode 100644
> index 000000000000..d97d099b87e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -0,0 +1,228 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common leds properties
> +
> +maintainers:
> +  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
> +  - Pavel Machek <pavel@ucw.cz>
> +
> +description:
> +  LED and flash LED devices provide the same basic functionality as current
> +  regulators, but extended with LED and flash LED specific features like
> +  blinking patterns, flash timeout, flash faults and external flash strobe mode.
> +
> +  Many LED devices expose more than one current output that can be connected
> +  to one or more discrete LED component. Since the arrangement of connections
> +  can influence the way of the LED device initialization, the LED components
> +  have to be tightly coupled with the LED device binding. They are represented
> +  by child nodes of the parent LED device binding.
> +
> +properties:
> +  led-sources:
> +    description:
> +      List of device current outputs the LED is connected to. The outputs are
> +      identified by the numbers that must be defined in the LED device binding
> +      documentation.
> +    $ref: /schemas/types.yaml#definitions/uint32-array
> +
> +  function:
> +    description:
> +      LED function. Use one of the LED_FUNCTION_* prefixed definitions
> +      from the header include/dt-bindings/leds/common.h. If there is no
> +      matching LED_FUNCTION available, add a new one.
> +    $ref: /schemas/types.yaml#definitions/string
> +
> +  color:
> +    description:
> +      Color of the LED. Use one of the LED_COLOR_ID_* prefixed definitions from
> +      the header include/dt-bindings/leds/common.h. If there is no matching
> +      LED_COLOR_ID available, add a new one.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/uint32
> +    minimum: 0
> +    maximum: 8
> +
> +  function-enumerator:
> +    description:
> +      Integer to be used when more than one instance of the same function is
> +      needed, differing only with an ordinal number.
> +    $ref: /schemas/types.yaml#definitions/uint32
> +
> +  label:
> +    description:
> +      The label for this LED. If omitted, the label is taken from the node name
> +      (excluding the unit address). It has to uniquely identify a device, i.e.
> +      no other LED class device can be assigned the same label. This property is
> +      deprecated - use 'function' and 'color' properties instead.
> +      function-enumerator has no effect when this property is present.
> +
> +  default-state:
> +    description:
> +      The initial state of the LED. If the LED is already on or off and the
> +      default-state property is set the to same value, then no glitch should be
> +      produced where the LED momentarily turns off (or on). The "keep" setting
> +      will keep the LED at whatever its current state is, without producing a
> +      glitch.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/string
> +    enum:
> +      - on
> +      - off
> +      - keep
> +    default: off
> +
> +  linux,default-trigger:
> +    description:
> +      This parameter, if present, is a string defining the trigger assigned to
> +      the LED.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/string
> +    enum:
> +        # LED will act as a back-light, controlled by the framebuffer system
> +      - backlight
> +        # LED will turn on (but for leds-gpio see "default-state" property in
> +        # Documentation/devicetree/bindings/leds/leds-gpio.txt)
> +      - default-on
> +        # LED "double" flashes at a load average based rate
> +      - heartbeat
> +        # LED indicates disk activity
> +      - disk-activity
> +        # LED indicates IDE disk activity (deprecated), in new implementations
> +        # use "disk-activity"
> +      - ide-disk
> +        # LED flashes at a fixed, configurable rate
> +      - timer
> +        # LED alters the brightness for the specified duration with one software
> +        # timer (requires "led-pattern" property)
> +      - pattern
> +
> +  led-pattern:
> +    description: |
> +      Array of integers with default pattern for certain triggers.
> +
> +      Each trigger may parse this property differently:
> +        - one-shot : two numbers specifying delay on and delay off (in ms),
> +        - timer : two numbers specifying delay on and delay off (in ms),
> +        - pattern : the pattern is given by a series of tuples, of
> +          brightness and duration (in ms).  The exact format is
> +          described in:
> +          Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/uint32-matrix
> +    items:
> +      minItems: 2
> +      maxItems: 2
> +
> +  led-max-microamp:
> +    description:
> +      Maximum LED supply current in microamperes. This property can be made
> +      mandatory for the board configurations introducing a risk of hardware
> +      damage in case an excessive current is set.
> +      For flash LED controllers with configurable current this property is
> +      mandatory for the LEDs in the non-flash modes (e.g. torch or indicator).
> +
> +  panic-indicator:
> +    description:
> +      This property specifies that the LED should be used, if at all possible,
> +      as a panic indicator.
> +    type: boolean
> +
> +  trigger-sources:
> +    description: |
> +      List of devices which should be used as a source triggering this LED
> +      activity. Some LEDs can be related to a specific device and should somehow
> +      indicate its state. E.g. USB 2.0 LED may react to device(s) in a USB 2.0
> +      port(s).
> +      Another common example is switch or router with multiple Ethernet ports
> +      each of them having its own LED assigned (assuming they are not
> +      hardwired). In such cases this property should contain phandle(s) of
> +      related source device(s).
> +      In many cases LED can be related to more than one device (e.g. one USB LED
> +      vs. multiple USB ports). Each source should be represented by a node in
> +      the device tree and be referenced by a phandle and a set of phandle
> +      arguments. A length of arguments should be specified by the
> +      #trigger-source-cells property in the source node.
> +    $ref: /schemas/types.yaml#definitions/phandle-array
> +
> +  # Required properties for flash LED child nodes:
> +  flash-max-microamp:
> +    description:
> +      Maximum flash LED supply current in microamperes. Required for flash LED
> +      nodes with configurable current.
> +
> +  flash-max-timeout-us:
> +    description:
> +      Maximum timeout in microseconds after which the flash LED is turned off.
> +      Required for flash LED nodes with configurable timeout.
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    led-controller {
> +        compatible = "gpio-leds";
> +
> +        led0 {
> +            function = LED_FUNCTION_STATUS;
> +            linux,default-trigger = "heartbeat";
> +            gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
> +        };
> +
> +        led1 {
> +            function = LED_FUNCTION_USB;
> +            gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +            trigger-sources = <&ohci_port1>, <&ehci_port1>;
> +        };
> +    };
> +
> +    led-controller@0 {
> +        compatible = "maxim,max77693-led";
> +        reg = <0 0x100>;
> +
> +        led {
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            led-sources = <0>, <1>;
> +            led-max-microamp = <50000>;
> +            flash-max-microamp = <320000>;
> +            flash-max-timeout-us = <500000>;
> +        };
> +    };
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@30 {
> +            compatible = "panasonic,an30259a";
> +            reg = <0x30>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            led@1 {
> +                reg = <1>;
> +                linux,default-trigger = "heartbeat";
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <1>;
> +            };
> +
> +            led@2 {
> +                reg = <2>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <2>;
> +            };
> +
> +            led@3 {
> +                reg = <3>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <3>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/leds/trigger-source.yaml b/Documentation/devicetree/bindings/leds/trigger-source.yaml
> new file mode 100644
> index 000000000000..0618003e40bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/trigger-source.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/trigger-source.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Trigger source providers
> +
> +maintainers:
> +  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
> +  - Pavel Machek <pavel@ucw.cz>
> +
> +description:
> +  Each trigger source provider should be represented by a device tree node. It
> +  may be e.g. a USB port or an Ethernet device.
> +
> +properties:
> +  '#trigger-source-cells':
> +    description:
> +      Number of cells in a source trigger. Typically 0 for nodes of simple
> +      trigger sources (e.g. a specific USB port).
> +    enum: [ 0, 1 ]
> +
> +...
> 

-- 
Best regards,
Jacek Anaszewski
