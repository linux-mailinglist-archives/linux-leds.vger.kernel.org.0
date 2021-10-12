Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E92429AD4
	for <lists+linux-leds@lfdr.de>; Tue, 12 Oct 2021 03:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhJLBRD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Oct 2021 21:17:03 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:37697 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhJLBRC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Oct 2021 21:17:02 -0400
Received: by mail-oi1-f176.google.com with SMTP id o83so19524032oif.4;
        Mon, 11 Oct 2021 18:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8guroVPH6/gNfHo5cZ8DZfxGp6mmHxatL0hXvlIRlAw=;
        b=l/csLqnZeJySMYywrWfGYjMDrzzCsWyXisr0Ry4DR91Texsg0kB7qEEwh+Qgg2yHzK
         5T5wSQEj42CmcG1blDgCzDpPOgRKHNIYzfagmR58Ko+WHFu9IfUw2lxE//1aIGuf45P5
         otqTkp0AZKj8nQzHazrl7kzNXVlDrElk52BzIdawPACkALYMtyLChW573f2WDrJgyd9D
         xL9ChZEYVUOW80gMUy70n7oQG9o5544pG8X5zayPEgMYVYwBbk6MWJP/fSz9/yKyi7RY
         zLrUzjeaARtHP5ErSNyhmttkljqCVtVPK3Y7indkTNh5aWkwvDDZf9ui8AuwouHisQIp
         AN2w==
X-Gm-Message-State: AOAM532VBIUyTYhW1gcMxGmR0huroeP0jZNguBHt3qmIg3zHiaP4vT73
        j6xCo2d5NAVBqhmAlfNOmTLRkTMDcQ==
X-Google-Smtp-Source: ABdhPJw8PjwiP0yFElsjrewyt2KeHNI9F0RpvFeFGvILZARkJje5Oautd2DPfd9OSd2Ci46Za3zjXQ==
X-Received: by 2002:aca:b609:: with SMTP id g9mr1703544oif.154.1634001301381;
        Mon, 11 Oct 2021 18:15:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 21sm2071589oix.1.2021.10.11.18.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:15:00 -0700 (PDT)
Received: (nullmailer pid 1526504 invoked by uid 1000);
        Tue, 12 Oct 2021 01:14:59 -0000
Date:   Mon, 11 Oct 2021 20:14:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED
 controller
Message-ID: <YWThkxDK72N5TC3a@robh.at.kernel.org>
References: <20211004022601.10653-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004022601.10653-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Oct 03, 2021 at 09:26:00PM -0500, Samuel Holland wrote:
> The Allwinner R329 and D1 SoCs contain an LED controller designed to
> drive a series of RGB LED pixels. It supports PIO and DMA transfers, and
> has configurable timing and pixel format.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes from v1:
>  - Fixed typo leading to duplicate t1h-ns property
>  - Removed "items" layer in definition of dmas/dma-names
>  - Replaced uint32 type reference with maxItems in timing properties
> 
>  .../leds/allwinner,sun50i-r329-ledc.yaml      | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
> new file mode 100644
> index 000000000000..d70cb2393a2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/allwinner,sun50i-r329-ledc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner R329 LED Controller Bindings
> +
> +maintainers:
> +  - Samuel Holland <samuel@sholland.org>
> +
> +description:
> +  The LED controller found in Allwinner sunxi SoCs uses a one-wire serial
> +  interface to drive up to 1024 RGB LEDs.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun50i-r329-ledc
> +      - items:
> +          - enum:
> +              - allwinner,sun20i-d1-ledc
> +          - const: allwinner,sun50i-r329-ledc
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Module clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +    description: TX DMA channel
> +
> +  dma-names:
> +    const: tx
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vled-supply:
> +    description: Regulator supplying power to external LEDs
> +
> +  format:
> +    description: Pixel format (subpixel transmission order), default is "grb"
> +    enum:
> +      - "bgr"
> +      - "brg"
> +      - "gbr"
> +      - "grb"
> +      - "rbg"
> +      - "rgb"

Don't need quotes.

> +
> +  t0h-ns:
> +    maxItems: 1
> +    description: Length of high pulse when transmitting a "0" bit
> +
> +  t0l-ns:
> +    maxItems: 1
> +    description: Length of low pulse when transmitting a "0" bit
> +
> +  t1h-ns:
> +    maxItems: 1
> +    description: Length of high pulse when transmitting a "1" bit
> +
> +  t1l-ns:
> +    maxItems: 1
> +    description: Length of low pulse when transmitting a "1" bit
> +
> +  treset-ns:

All these need a vendor prefix.

> +    maxItems: 1
> +    description: Minimum delay between transmission frames
> +
> +patternProperties:
> +  "^multi-led@[0-9a-f]+$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 1023
> +        description: Index of the LED in the series (must be contiguous)
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    ledc: led-controller@2008000 {
> +      compatible = "allwinner,sun20i-d1-ledc",
> +                   "allwinner,sun50i-r329-ledc";
> +      reg = <0x2008000 0x400>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      clocks = <&ccu 12>, <&ccu 34>;
> +      clock-names = "bus", "mod";
> +      resets = <&ccu 12>;
> +      dmas = <&dma 42>;
> +      dma-names = "tx";
> +      interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      multi-led@0 {
> +        reg = <0x0>;
> +        color = <LED_COLOR_ID_RGB>;
> +        function = LED_FUNCTION_INDICATOR;
> +      };
> +    };
> +
> +...
> -- 
> 2.32.0
> 
> 
