Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07A6E112019
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2019 00:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfLCXMh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Dec 2019 18:12:37 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33194 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbfLCXMg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Dec 2019 18:12:36 -0500
Received: by mail-ot1-f66.google.com with SMTP id d17so4639345otc.0;
        Tue, 03 Dec 2019 15:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oDMPLgsxr46HrAbwjG546rWXXeRB/PKKtf3plvWYvp4=;
        b=F7lv5vdXadV2UN9LhAT8fdP5kKq2s/DbtB1FpmiU0Qqm/beWhHc/X3UZfj0RUKuFL7
         T7Fmd8J9jZ5hvUERi1cjDmgEDQrU65QvYE3Jk0nw5ckbHGgc2Q04opr+RlZ2X1Wmgdlz
         3Y2v5cxDh+G/m5Q3RbtvCYzw8i6PGQ4P0myh1otrfvMZZfJ4ybruRPRjunohJ0Kl/yZk
         8mMjr0oNwZwB+qQVhaFRl9PkFrVqZEv+MfrlBKjTer+1j5EUoVNed8O35jhrby9QzYrs
         3ZyLT2Hs1XIazZa41STX0OVl+ODXmGyXksz6u9l3sRkUCH6NZOJJbaQTBcJJYqjpMvJY
         KwnA==
X-Gm-Message-State: APjAAAXjVaXpTWKIhSuJwdH8QGEejez6HeWTGcS8m3CDKUbG5oCb1gzO
        vPD/Q5GSjVqWt0WJhcF5UmcaSHs=
X-Google-Smtp-Source: APXvYqwpX018yWiQXsgwOgSjNyL0jWFUAAOPgzIxPfuGjJQiYIPLQJHICmzBiFzpvvv/tsztaDDLOQ==
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr310885otn.38.1575414754937;
        Tue, 03 Dec 2019 15:12:34 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h24sm1088851otn.29.2019.12.03.15.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 15:12:34 -0800 (PST)
Date:   Tue, 3 Dec 2019 17:12:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Convert common LED binding to
 schema
Message-ID: <20191203231233.GA24738@bogus>
References: <20191119194623.23854-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119194623.23854-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Nov 19, 2019 at 01:46:22PM -0600, Rob Herring wrote:
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
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
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
> index 000000000000..16f0983277c8
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
> +      LED functon. Use one of the LED_FUNCTION_* prefixed definitions from the

I noticed there's a typo in function that I copied over.

Rob
