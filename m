Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C172AEF21
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 12:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgKKLFw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Nov 2020 06:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgKKLFv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Nov 2020 06:05:51 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1EDC0613D1;
        Wed, 11 Nov 2020 03:05:51 -0800 (PST)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 16087634C24;
        Wed, 11 Nov 2020 13:04:11 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kcnvA-00045B-78; Wed, 11 Nov 2020 13:04:12 +0200
Date:   Wed, 11 Nov 2020 13:04:12 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] dt-bindings: leds: Add DT binding for Richtek
 RT8515
Message-ID: <20201111110412.GW6899@valkosipuli.retiisi.org.uk>
References: <20201111011417.2275501-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111011417.2275501-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

Thanks for the patch (and cc'ing me).

On Wed, Nov 11, 2020 at 02:14:16AM +0100, Linus Walleij wrote:
> Add a YAML devicetree binding for the Richtek RT8515
> dual channel flash/torch LED driver.
> 
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Add Sakari to CC
> - Resend
> ChangeLog v1->v2:
> - Explicitly inherit function, color and flash-max-timeout-us
>   from common.yaml
> - Add "led" node as required.
> ---
>  .../bindings/leds/richtek,rt8515.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> new file mode 100644
> index 000000000000..0d8bb635370c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/richtek,rt8515.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Richtek RT8515 1.5A dual channel LED driver
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The Richtek RT8515 is a dual channel (two mode) LED driver that
> +  supports driving a white LED in flash or torch mode.
> +
> +properties:
> +  compatible:
> +    const: richtek,rt8515
> +
> +  enf-gpios:
> +    maxItems: 1
> +    description: A connection to the 'ENF' (enable flash) pin.
> +
> +  ent-gpios:
> +    maxItems: 1
> +    description: A connection to the 'ENT' (enable torch) pin.
> +
> +  led:
> +    type: object
> +    $ref: common.yaml#
> +    properties:
> +      function: true
> +      color: true
> +      flash-max-timeout-us: true

Don't you also need flash-max-microamp and led-max-microamp? As the maximum
current for the LED may well be less than the driver can provide.

> +
> +required:
> +  - compatible
> +  - ent-gpios
> +  - enf-gpios
> +  - led
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    led-controller {
> +        compatible = "richtek,rt8515";
> +        enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
> +        ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
> +
> +        led {
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            flash-max-timeout-us = <250000>;
> +        };
> +    };
> -- 
> 2.26.2
> 

-- 
Kind regards,

Sakari Ailus
