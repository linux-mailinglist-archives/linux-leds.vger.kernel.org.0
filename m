Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AF51E34F7
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2020 03:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgE0BtF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 21:49:05 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35661 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgE0BtF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 21:49:05 -0400
Received: by mail-io1-f66.google.com with SMTP id s18so10297518ioe.2;
        Tue, 26 May 2020 18:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NpFq0R0aWjAOVLGwhQJ2XIanByWj7TpCd6S10cJEALk=;
        b=ehLhdobTilPxhRKmxjuoc82vpr/YACLkJRS9VQ6rineCgdisQmKDlKtCc8XIwwCo5L
         +5kXdJB5o8toyHqyDngXAF6NzPtcAAGCHtWf/bXIW6KVfNAy5gtGEN/OoK0SDk0shMGV
         bJ3OpRp3zdIcdUOzEyAudcJ4+0wIjHvaOLVyGLxJmFtKSZcoKcpr/r0F2vbT0Rw5JiEu
         2mandnBPZc5tdPcwUAGQLzvXeMrRsayxK9Ac9eZtBGqwKGdVWCkyK8MCUmz19ragAvHj
         8To4k12ii+TznF93il90DrMTlluk9E1UK7vBK16naLUN9afYU9QiEt6P8+yPFvggbSe2
         3psw==
X-Gm-Message-State: AOAM530ckeTaJlQtf7fF5+TvPuBWFTLH0mPZJznlPaLoFx/QjnHWEiz3
        RaQ/Ady1lFATlOtcmp8gWZV2Cbk=
X-Google-Smtp-Source: ABdhPJwnUd9gtPnPbiK2tnmPcj4pMtkePhPFVkdrcrLBI+LLU1Mcp7uTqwffmLKF1kyjD8RFzL2RBQ==
X-Received: by 2002:a6b:5c19:: with SMTP id z25mr2942857ioh.119.1590544143956;
        Tue, 26 May 2020 18:49:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h23sm633451ioj.39.2020.05.26.18.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 18:49:03 -0700 (PDT)
Received: (nullmailer pid 874370 invoked by uid 1000);
        Wed, 27 May 2020 01:49:02 -0000
Date:   Tue, 26 May 2020 19:49:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200527014902.GA859634@bogus>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526164652.2331-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 26, 2020 at 11:46:37AM -0500, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.
> 
> CC: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../bindings/leds/leds-class-multicolor.yaml  | 71 +++++++++++++++++++
>  drivers/leds/led-core.c                       |  1 +
>  include/dt-bindings/leds/common.h             |  3 +-
>  3 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> new file mode 100644
> index 000000000000..fa6ea8e5c46b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please.

GPL-2.0-only OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-class-multicolor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common properties for the multicolor LED class.
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  Bindings for multi color LEDs show how to describe current outputs of
> +  either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
> +  etc.) or standalone LEDs, to achieve logically grouped multi-color LED
> +  modules. This is achieved by adding multi-led nodes layer to the
> +  monochrome LED bindings.
> +  The nodes and properties defined in this document are unique to the multicolor
> +  LED class.  Common LED nodes and properties are inherited from the common.txt
> +  within this documentation directory.
> +
> +properties:
> +  color:
> +    description: |
> +      For multicolor LED support this property should be defined as
> +      LED_COLOR_ID_MULTI and further definition can be found in
> +      include/linux/leds/common.h.

This should have:

const: X  # LED_COLOR_ID_MULTI

It can't use the define, so you have to use the value.

> +
> +required:
> +  - color
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@14 {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          compatible = "ti,lp5009";
> +          reg = <0x14>;
> +
> +          multi-led@1 {

Define $nodename must be 'multi-led(@[0-9a-f]+)?'

> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +            color = <LED_COLOR_ID_MULTI>;
> +            function = LED_FUNCTION_CHARGING;
> +
> +            led@0 {

Then the schema should define child nodes named 'led'.

> +              reg = <0>;
> +              color = <LED_COLOR_ID_RED>;

I assume in this case 'reg' and 'color' need to be defined as required?

> +            };
> +
> +            led@1 {
> +              reg = <1>;
> +              color = <LED_COLOR_ID_GREEN>;
> +            };
> +
> +            led@2 {
> +              reg = <2>;
> +              color = <LED_COLOR_ID_BLUE>;
> +            };
> +          };
> +        };
> +    };
> +
> +additionalProperties: false
> +...
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c

This isn't a binding file. Belongs in another patch.

> index f1f718dbe0f8..846248a0693d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -34,6 +34,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
>  	[LED_COLOR_ID_VIOLET] = "violet",
>  	[LED_COLOR_ID_YELLOW] = "yellow",
>  	[LED_COLOR_ID_IR] = "ir",
> +	[LED_COLOR_ID_MULTI] = "multicolor",
>  };
>  EXPORT_SYMBOL_GPL(led_colors);
>  
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 0ce7dfc00dcb..a463ce6a8794 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -30,7 +30,8 @@
>  #define LED_COLOR_ID_VIOLET	5
>  #define LED_COLOR_ID_YELLOW	6
>  #define LED_COLOR_ID_IR		7
> -#define LED_COLOR_ID_MAX	8
> +#define LED_COLOR_ID_MULTI	8
> +#define LED_COLOR_ID_MAX	9
>  
>  /* Standard LED functions */
>  /* Keyboard LEDs, usually it would be input4::capslock etc. */
> -- 
> 2.25.1
> 
