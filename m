Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E960034714E
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 06:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233232AbhCXF6m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 01:58:42 -0400
Received: from mail.thorsis.com ([92.198.35.195]:60596 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhCXF6b (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 24 Mar 2021 01:58:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 0E49629BE;
        Wed, 24 Mar 2021 06:58:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LEeRw9X82kpI; Wed, 24 Mar 2021 06:58:29 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 3C5623362; Wed, 24 Mar 2021 06:58:28 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
Date:   Wed, 24 Mar 2021 06:58:21 +0100 (CET)
From:   Alexander Dahl <ada@thorsis.com>
To:     Hermes Zhang <chenhui.zhang@axis.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Hermes Zhang <chenhuiz@axis.com>
Cc:     kernel@axis.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <558944059.12080.1616565502073@seven.thorsis.com>
In-Reply-To: <20210324024844.15796-1-chenhui.zhang@axis.com>
References: <20210324024844.15796-1-chenhui.zhang@axis.com>
Subject: Re: [PATCH v3] dt-binding: leds: Document leds-multi-gpio bindings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Hermes,

> Hermes Zhang <chenhui.zhang@axis.com> hat am 24.03.2021 03:48 geschrieben:
> 
>  
> From: Hermes Zhang <chenhuiz@axis.com>
> 
> Document the device tree bindings of the multiple GPIOs LED driver
> Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml.
> 
> Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
> ---
> 
> Notes:
>     Add maxItems

What about the other part of the series? I think you should send both patches together with an introduction message on both. If you only change one patch for a new version spin of the series, just send the other one unchanged.

(It makes no sense to merge the binding as long as the driver is not merged, otherwise you would end up with a binding without driver. So keeping them together should help reviewers and maintainers.)

Greets
Alex

> 
>  .../bindings/leds/leds-multi-gpio.yaml        | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> new file mode 100644
> index 000000000000..6f2b47487b90
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
> +    maxItems: 16 # Should be enough
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
