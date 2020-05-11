Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F37D1CE4B2
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2020 21:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgEKTn6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 May 2020 15:43:58 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46244 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgEKTn6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 May 2020 15:43:58 -0400
Received: by mail-oi1-f193.google.com with SMTP id c124so15952124oib.13;
        Mon, 11 May 2020 12:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iMz0W2EMpeB90U+JkODUeNWGmTF1lcaEfrSEzlJrKEE=;
        b=OoDa8bXt01wIWtgBQCGjYBp9CBz7S/PpCbtbTH8AASz0eH047F8TgjM90rHC15jA1t
         XfMJKE3Ojqw0cUEMOIsCaKLfgEBJyvFZv36RiiPOo0IYByHGbdbu9PiJbmavi9j6u1u9
         nM3/SB0RVISaSNSxPd3QGlEiR3WKmk94ftAAcuqKKMwXWwdd20xe2glcjIFnd3qQV8fS
         ESI07hAo42/PPwhJbt+O/RDWzw6vGF4kWr7baElIOVFTv5LFj8AKMUoKV3ip0seRnXXH
         yifj0m7VF3aFPYWRFkecnQRanfsDsCWi8L3cu+GDPdyyzD+FoLehsmt7/pC1vA2PP0hM
         BAgQ==
X-Gm-Message-State: AGi0PuYGCxrCNMAqAmJ+gFIiENve5GcTaMv5x1N9jn3hXGVf7dJsW62x
        KQU6hrcX/LHx+WeOvTEAE6LciCk=
X-Google-Smtp-Source: APiQypKAd9AOvs5jO4W0FbO633ynlzZryjn9opCL1TP8ro0jDfP1gSkql9L3yfzGMqZgr4GmXDNc3A==
X-Received: by 2002:aca:75c3:: with SMTP id q186mr19828152oic.41.1589226236707;
        Mon, 11 May 2020 12:43:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m16sm3011429oou.44.2020.05.11.12.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:43:55 -0700 (PDT)
Received: (nullmailer pid 4451 invoked by uid 1000);
        Mon, 11 May 2020 19:43:54 -0000
Date:   Mon, 11 May 2020 14:43:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200511194354.GA15606@bogus>
References: <20200423065100.2652-1-marek.behun@nic.cz>
 <20200423065100.2652-2-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200423065100.2652-2-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Apr 23, 2020 at 08:50:59AM +0200, Marek Behún wrote:
> Add device-tree bindings documentation for Turris Omnia RGB LEDs.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../leds/cznic,turris-omnia-leds.yaml         | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> new file mode 100644
> index 000000000000..f3d13fa65df2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/cznic,turris-omnia-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CZ.NIC's Turris Omnia LEDs driver
> +
> +maintainers:
> +  - Marek Behún <marek.behun@nic.cz>
> +
> +description:
> +  This module adds support for the RGB LEDs found on the fron panel of the
> +  Turris Omnia router. There are 12 RGB LEDs, they are controlled by device's
> +  microcontroller with which the system communicates via I2C. Each LED is
> +  described as a subnode of this I2C device.
> +
> +properties:
> +  compatible:
> +    const: cznic,turris-omnia-leds
> +
> +  reg:
> +    description: I2C slave address of the microcontroller.
> +    maxItems: 1
> +
> +patternProperties:
> +  "^led[0-9][0-9]?$":

'led-' is preferred. And numbering is usually hex.

What's the numbering here based on? Might be better to use 'reg' (and a 
unit-address) rather than led-sources. led-sources was for cases where 
the control interface (defined by reg) could have differing regulators 
connected to the LEDs.

> +    type: object
> +    allOf:
> +      - $ref: /schemas/leds/common.yaml#
> +    description:
> +      This node can either represent one channel of a RGB LED or a whole RGB
> +      LED.
> +
> +    properties:
> +      led-sources:
> +        description:
> +          List of device current outputs the LED connects to. If one number is
> +          given, the device described by this node will control one channel of a
> +          RGB LED. If three numbers are given (one for each channel of a RGB
> +          LED), the device described by this node will control one RGB LED. In
> +          this case the numbers must increase by one and the first must be a
> +          multiple of 3.
> +        allOf:
> +          - $ref: /schemas/leds/common.yaml#/properties/led-sources

No need for this. It is already done with the previous $ref.

> +          - oneOf:
> +              - items:
> +                  minimum: 0
> +                  maximum: 35
> +                minItems: 1
> +                maxItems: 1
> +              - items:
> +                  enum: [ [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ], [ 9, 10, 11 ],
> +                          [ 12, 13, 14 ], [ 15, 16, 17 ], [ 18, 19, 20 ],
> +                          [ 21, 22, 23 ], [ 24, 25, 26 ], [ 27, 28, 29 ],
> +                          [ 30, 31, 32 ], [ 33, 34, 35] ]
> +
> +      color:
> +        description:
> +          Should be one of LED_COLOR_ID_*. Allowed values are red, green or blue
> +          if there is one item in led-sources, otherwise white.
> +        allOf:
> +          - $ref: /schemas/leds/common.yaml#/properties/color

Can be dropped.

> +          - enum: [ 0, 1, 2, 3 ]
> +
> +    required:
> +      - led-sources
> +      - color
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@2b {
> +            compatible = "cznic,turris-omnia-leds";
> +            reg = <0x2b>;
> +
> +            led0 {
> +                led-sources = <33 34 35>;
> +                color = <LED_COLOR_ID_WHITE>;
> +                function = LED_FUNCTION_POWER;
> +                linux,default-trigger = "heartbeat";
> +            };
> +
> +            led1 {
> +                led-sources = <3>;
> +                color = <LED_COLOR_ID_RED>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <1>;
> +            };
> +
> +            led2 {
> +                led-sources = <4>;
> +                color = <LED_COLOR_ID_GREEN>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <1>;
> +            };
> +
> +            led3 {
> +                led-sources = <5>;
> +                color = <LED_COLOR_ID_BLUE>;
> +                function = LED_FUNCTION_INDICATOR;
> +                function-enumerator = <1>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.24.1
> 
