Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212EC26AF24
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 23:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgIOUh5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 16:37:57 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39786 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgIOUhj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 16:37:39 -0400
Received: by mail-io1-f66.google.com with SMTP id b6so5665456iof.6;
        Tue, 15 Sep 2020 13:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+/W4vuR4uai/c6pO6yPiY6jvboipJQaCmF2xqY/N7/Q=;
        b=fbKFoUynFmTc+snmiVNX5aM6CdrOEUmhRcFqgbRxjONfKBoT1ayrxO9v42LIdSNH+N
         HE2jNSda6e1IUT6Xk8iPmY0tmKPSr9q1xD3d0QESbv4HOAI7utSaMqB2ZRKlMJ+801qL
         dakRNEWIDi5ykoY6EglUkx8ITsU2f3NRCqXVEX33THug9Q0h2+/0GRMQzBCORXEfmz/C
         9HxKEmCajpIz1cGECIwXN+Q9sswmuL2hPvjILNutQ6EW0X4RvrH1PLk3mGdqlyde9DuU
         CZIBVCOK8rrRnixpNGuAvM2dkn6QE+Z3fZgBpJQF9xRTyJ+LlJ6WMDRiB8UZbzgizfZF
         r/6g==
X-Gm-Message-State: AOAM533ft2skHC7fnR0NF7Y6pCBEWdvSTp9OgmYbVseeZPlkeu94QOHJ
        ZvibJ2OHiDe2MHr04+kGHQ==
X-Google-Smtp-Source: ABdhPJz6SJS7WXlrZu4a7Q4b3j0nnvl9jKmUXC+BiWVrq+40lbcTgAcJPKU4QadkJ6sx7KwlyRYUJg==
X-Received: by 2002:a05:6602:2e81:: with SMTP id m1mr16713867iow.64.1600202258146;
        Tue, 15 Sep 2020 13:37:38 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o15sm9304141ilc.41.2020.09.15.13.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 13:37:37 -0700 (PDT)
Received: (nullmailer pid 2469053 invoked by uid 1000);
        Tue, 15 Sep 2020 20:37:35 -0000
Date:   Tue, 15 Sep 2020 14:37:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20200915203735.GB2453633@bogus>
References: <20200911154004.28354-1-post@lespocky.de>
 <20200911154004.28354-4-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911154004.28354-4-post@lespocky.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 11, 2020 at 05:40:04PM +0200, Alexander Dahl wrote:
> The example was adapted slightly to make use of the 'function' and
> 'color' properties.  License discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
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
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
>  2 files changed, 85 insertions(+), 50 deletions(-)
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
> index 000000000000..c74867492424
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> @@ -0,0 +1,85 @@
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
> +  "^pwm-led-([0-9a-f])$":

'^led-([0-9a-f])' would be my preference. A bit more on that below.

What about a single child case?

> +    type: object
> +
> +    $ref: common.yaml#
> +
> +    properties:
> +      pwms:
> +        description:
> +          "PWM property to point to the PWM device (phandle)/port (id)
> +          and to specify the period time to be used:
> +          <&phandle id period_ns>;"

No need to redefine a common property.

What is needed is how many pwms? I'd assume 1 only: 'maxItems: 1'

> +
> +      pwm-names:
> +        description:
> +          "Name to be used by the PWM subsystem for the PWM device For
> +          the pwms and pwm-names property please refer to:
> +          Documentation/devicetree/bindings/pwm/pwm.txt"

Same here.

> +
> +      max-brightness:
> +        description:
> +          Maximum brightness possible for the LED

Needs a type $ref.

> +
> +      active-low:
> +        description:
> +          For PWMs where the LED is wired to supply rather than ground.

type: boolean

> +
> +    required:
> +      - pwms
> +      - max-brightness

additionalProperties: false

That will cause errors if child node names were not consistent (no one 
checked, so they won't be). We could just allow anything, but I prefer 
to move things to be consistent yet try to capture any existing pattern.

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
> +
> +    pwm_leds {
> +        compatible = "pwm-leds";
> +
> +        pwm-led-1 {
> +            label = "omap4::keypad";
> +            pwms = <&twl_pwm 0 7812500>;
> +            max-brightness = <127>;
> +        };
> +
> +        pwm-led-2 {
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
