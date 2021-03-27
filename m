Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD1A34B8CB
	for <lists+linux-leds@lfdr.de>; Sat, 27 Mar 2021 19:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhC0SMq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 27 Mar 2021 14:12:46 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:38843 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhC0SMa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 27 Mar 2021 14:12:30 -0400
Received: by mail-oi1-f179.google.com with SMTP id f9so9110667oiw.5;
        Sat, 27 Mar 2021 11:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YP5kPNXH4Z7KNhy2Y+OP7mxy+I7a4xpYnW3jiDBxHPk=;
        b=QFyvfP3YyV7/PETFjGR5fG/dJtbqOrTcaKci/5MWFJyyctnqRsIOOU43LSB91e2+ar
         z0jCswkQZd4xksxRFc3TbiesUeDuK4f9RwUH72iF8qsB4qH0aq+fqzCzFL/3DdBddmMX
         Cjmd5ttknzlJQlIdFTDSRucjpcFDu+xD5CgbOPlbyLbdPd8hQSq5off17xWCpHFFWvsx
         7sHy523vrju/+4GARu/ifXMJQWjXaatRawq935VXAEKJBKeUu7p9w31nmV8+QEBptjvC
         CBPqgLcq5LpL2s9jqmVRUU69QaWEoLlxIfu20JYYztW0ZPXkBRPBK2KAd5GykIsdQsXG
         kUdA==
X-Gm-Message-State: AOAM5311wRkwtCT7cHmQSBj+2qWm6a6Cl7fGjUZ+YbpKEiMkhQBWhub7
        L5NTEB25JI7s93naugwKOg==
X-Google-Smtp-Source: ABdhPJx2CveBohR8AvcUvqsjAl1zx4Sij6ixL+jotWz2+OtxE1bi6KAmEwuIeGTb5bB0JhwDJcT3Og==
X-Received: by 2002:aca:f0b:: with SMTP id 11mr13947987oip.8.1616868749681;
        Sat, 27 Mar 2021 11:12:29 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.41])
        by smtp.gmail.com with ESMTPSA id h24sm2970188otg.20.2021.03.27.11.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 11:12:28 -0700 (PDT)
Received: (nullmailer pid 339486 invoked by uid 1000);
        Sat, 27 Mar 2021 18:12:22 -0000
Date:   Sat, 27 Mar 2021 12:12:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chenhuiz@axis.com, lkml@axis.com, kernel@axis.com
Subject: Re: [PATCH v2 1/2] dt-binding: leds: Document leds-multi-gpio
 bindings
Message-ID: <20210327181222.GA327657@robh.at.kernel.org>
References: <20210326052801.17666-1-chenhui.zhang@axis.com>
 <20210326052801.17666-2-chenhui.zhang@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326052801.17666-2-chenhui.zhang@axis.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Mar 26, 2021 at 01:28:00PM +0800, Hermes Zhang wrote:
> From: Hermes Zhang <chenhuiz@axis.com>
> 
> This binding represents LED devices which are controller with
> multiple GPIO lines in order to achieve more than two brightness
> states.
> 
> Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
> ---
>  .../bindings/leds/leds-multi-gpio.yaml        | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> new file mode 100644
> index 000000000000..1549f21e8d6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-multi-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Multiple GPIOs LED driver
> +
> +maintainers:
> +  - Hermes Zhang <chenhuiz@axis.com>
> +
> +description:
> +  This will support some LED made of multiple GPIOs and the brightness of the
> +  LED could map to different states of the GPIOs.
> +
> +properties:
> +  compatible:
> +    const: multi-gpio-led
> +
> +  led-gpios:
> +    description: Array of one or more GPIOs pins used to control the LED.
> +    minItems: 1
> +    maxItems: 8  # Should be enough
> +
> +  led-states:
> +    description: |
> +      The array list the supported states here which will map to brightness
> +      from 0 to maximum. Each item in the array will present all the GPIOs
> +      value by bit.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 1
> +    maxItems: 256 # Should be enough

Isn't this the same as the standard 'brightness-levels' from backlight 
binding? The index is the level and the value is the h/w specific 
setting.

> +
> +required:
> +  - compatible
> +  - led-gpios
> +  - led-states
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpios-led {
> +      compatible = "multi-gpio-led";
> +
> +      led-gpios = <&gpio0 23 0x1>,
> +                  <&gpio0 24 0x1>;
> +      led-states = /bits/ 8 <0x00 0x01 0x02 0x03>;
> +    };
> +...
> -- 
> 2.20.1
> 
