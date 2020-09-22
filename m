Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11112745D9
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 17:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgIVP5w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 11:57:52 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:45368 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVP5w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 11:57:52 -0400
Received: by mail-il1-f195.google.com with SMTP id h2so17779140ilo.12;
        Tue, 22 Sep 2020 08:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XzdQt2fbGJ07/mVXnEKw0znAD4B8l/q6hSkfeIR8Pcg=;
        b=QBSHxd86eS1IAvGDzyyhhTVJTE9IuZtXorRQB2WAgmHv4ZUpjxy4i4iYeZPyE9PGKO
         3tYtJ8vhZcqzTbAasnAYcKoTm2BUnFZzHIHHzVtR24ywMKhrcEqBi8To1u2zSYtEeX/N
         z4SkicFNl8Qus51MN8Tebsww2nPn49m7/A5FW/jXxSGpvnEJ8GbRfaMpX1S1eyB7tnVL
         GZewanMO3v/ExZwnRcCRvWbQyga4aPZmAfulWvRU2hIEkx8DeX24Suyky57CF8bIc/IP
         P5wEsl9zb0JZrda1SZ9YMdCGeC8Tia8yBmq/NKE0Eyb65lesLi1X61lk2BUpYkmgWJnh
         FbCQ==
X-Gm-Message-State: AOAM530Ds/AnZPVOFoNvCBWdVFz7tkpOcRHifDujanWy+umoN66wYdhn
        5uib2fwmQ3zBzyu1qIzxSQ==
X-Google-Smtp-Source: ABdhPJzYIbZMV2yNi0fEB/MYpK+RsjCgduxlERu5RInrUMHlEmPWHDJ+/AEiLmQTmIxQkyIshIT3Eg==
X-Received: by 2002:a92:5f94:: with SMTP id i20mr5039260ill.106.1600790270562;
        Tue, 22 Sep 2020 08:57:50 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 9sm9147242ilj.83.2020.09.22.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 08:57:50 -0700 (PDT)
Received: (nullmailer pid 2757662 invoked by uid 1000);
        Tue, 22 Sep 2020 15:57:47 -0000
Date:   Tue, 22 Sep 2020 09:57:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20200922155747.GA2734659@bogus>
References: <20200919053145.7564-1-post@lespocky.de>
 <20200919053145.7564-4-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200919053145.7564-4-post@lespocky.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 19, 2020 at 07:31:45AM +0200, Alexander Dahl wrote:
> The example was adapted slightly to make use of the 'function' and
> 'color' properties.  License discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
>     
>     v3 -> v4:
>       * added Cc to original author of the binding
>     
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
>     
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
> 
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 82 +++++++++++++++++++
>  2 files changed, 82 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> deleted file mode 100644
> index 6c6583c35f2f..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -LED connected to PWM
> -
> -Required properties:
> -- compatible : should be "pwm-leds".
> -
> -Each LED is represented as a sub-node of the pwm-leds device.  Each
> -node's name represents the name of the corresponding LED.
> -
> -LED sub-node properties:
> -- pwms : PWM property to point to the PWM device (phandle)/port (id) and to
> -  specify the period time to be used: <&phandle id period_ns>;
> -- pwm-names : (optional) Name to be used by the PWM subsystem for the PWM device
> -  For the pwms and pwm-names property please refer to:
> -  Documentation/devicetree/bindings/pwm/pwm.txt
> -- max-brightness : Maximum brightness possible for the LED
> -- active-low : (optional) For PWMs where the LED is wired to supply
> -  rather than ground.
> -- label :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -- linux,default-trigger :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -
> -Example:
> -
> -twl_pwm: pwm {
> -	/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> -	compatible = "ti,twl6030-pwm";
> -	#pwm-cells = <2>;
> -};
> -
> -twl_pwmled: pwmled {
> -	/* provides one PWM (id 0 for Charing indicator LED) */
> -	compatible = "ti,twl6030-pwmled";
> -	#pwm-cells = <2>;
> -};
> -
> -pwmleds {
> -	compatible = "pwm-leds";
> -	kpad {
> -		label = "omap4::keypad";
> -		pwms = <&twl_pwm 0 7812500>;
> -		max-brightness = <127>;
> -	};
> -
> -	charging {
> -		label = "omap4:green:chrg";
> -		pwms = <&twl_pwmled 0 7812500>;
> -		max-brightness = <255>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> new file mode 100644
> index 000000000000..c9316811c7f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to PWM
> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>
> +
> +description:
> +  Each LED is represented as a sub-node of the pwm-leds device.  Each
> +  node's name represents the name of the corresponding LED.
> +
> +properties:
> +  compatible:
> +    const: pwm-leds
> +
> +patternProperties:
> +  "^led(-[0-9a-f]+)?$":
> +    type: object
> +
> +    $ref: common.yaml#
> +
> +    properties:
> +      pwms:
> +        maxItems: 1
> +
> +      pwm-names: true
> +
> +      max-brightness:
> +        description:
> +          Maximum brightness possible for the LED
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      active-low:
> +        description:
> +          For PWMs where the LED is wired to supply rather than ground.
> +        type: boolean
> +
> +    required:
> +      - pwms
> +      - max-brightness
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/leds/common.h>
> +
> +    twl_pwm: pwm {
> +        /* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> +        compatible = "ti,twl6030-pwm";
> +        #pwm-cells = <2>;
> +    };
> +
> +    twl_pwmled: pwmled {
> +        /* provides one PWM (id 0 for Charing indicator LED) */
> +        compatible = "ti,twl6030-pwmled";
> +        #pwm-cells = <2>;
> +    };

It would be best to just remove these 2 nodes. The provider is not 
really relevant here and these will likely have schema errors when 
there's a schema for them. For example, they should be child nodes of 
the TWL6030 device.

> +
> +    pwm_leds {

Use generic node names:

led-controller {

> +        compatible = "pwm-leds";
> +
> +        led-1 {
> +            label = "omap4::keypad";
> +            pwms = <&twl_pwm 0 7812500>;
> +            max-brightness = <127>;
> +        };
> +
> +        led-2 {
> +            color = <LED_COLOR_ID_GREEN>;
> +            function = LED_FUNCTION_CHARGING;
> +            pwms = <&twl_pwmled 0 7812500>;
> +            max-brightness = <255>;
> +        };
> +    };
> +
> +...
> -- 
> 2.20.1
> 
