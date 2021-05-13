Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDFD37F13C
	for <lists+linux-leds@lfdr.de>; Thu, 13 May 2021 04:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhEMCVs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 May 2021 22:21:48 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:35346 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhEMCVs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 May 2021 22:21:48 -0400
Received: by mail-ot1-f42.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so12292748otg.2;
        Wed, 12 May 2021 19:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Y42oGdrMd3tYCXJqJNfiv2RuuGSmqgHgvmQbIwOftY=;
        b=isGY589LeHHHObSwpUkjwegCKsD/tTy7ExA4CNTtIVvoV3g2qS/MBJa0sAAlZ2k9CH
         J2kUEm+b1c7LQL1DRcz9EKL9Ly7/ryDHju4zeX8qOGhOFqo4Uf11pGJWOWo4LsMH2FGS
         WU/RtzbLjC3k8OgNe0eK87u+eyxsptqY22Jl6TiANYpDPKuQQByCvtXhcCITfTNNEAXG
         eXH7b+dscPAm+dd4IzWFk8ibReREiuWiPOuFpvT4UgGAuKTrvtLcC9xw8bchVpNOnjgg
         RhZDGszcntuXhY4rCxSxC8oBymtQxDki+RhYH8aKxM35DZPviV+x87dCfppKKuaZtlZK
         FGdA==
X-Gm-Message-State: AOAM532WfCOE8a6+C946mSPVs3zHptASbWqiS0nlI7iJyZtfANRajmj/
        RkAy0JrWuys9kxo3XOHApA==
X-Google-Smtp-Source: ABdhPJwVBpVOfEr7q0rdcf0ZPngrOnuRD90z52CKo7EbRrNLG0S+2I7V5oyhKUn9yx+KkP2UJtDLzQ==
X-Received: by 2002:a9d:1922:: with SMTP id j34mr11022853ota.250.1620872437860;
        Wed, 12 May 2021 19:20:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y205sm373425oie.58.2021.05.12.19.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 19:20:37 -0700 (PDT)
Received: (nullmailer pid 895629 invoked by uid 1000);
        Thu, 13 May 2021 02:20:36 -0000
Date:   Wed, 12 May 2021 21:20:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Doug Zobel <dougdev334@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt: bindings: lp55xx: Add predefined LED pattern
Message-ID: <20210513022036.GA890569@robh.at.kernel.org>
References: <20210511204834.2675271-1-dougdev334@gmail.com>
 <20210511204834.2675271-3-dougdev334@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511204834.2675271-3-dougdev334@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 11, 2021 at 03:48:34PM -0500, Doug Zobel wrote:
> Add a new device tree object for LP5562 predfined led patterns.

If you are going to define something generic looking, put it in a 
generic binding.

I don't know that this belongs in DT though. Won't a user want to create 
their own patterns? That means there should be a sysfs interface (which 
we either already have or has been attempted IIRC).

> 
> Signed-off-by: Doug Zobel <dougdev334@gmail.com>
> ---
>  .../devicetree/bindings/leds/leds-lp55xx.yaml | 103 +++++++++++++++++-
>  1 file changed, 102 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> index f552cd143d5b..2524a84fe688 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> @@ -100,6 +100,31 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/string
>          description: name of channel
>  
> +  "(^pattern@[0-9a-f]$|pattern)":
> +    type: object
> +    $ref: common.yaml#
> +    description: |
> +      LP5562 sepcific object.  LED pattern program saved to and run on LP5562.
> +    properties:
> +      pat-name:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: Name of pattern program
> +
> +      pat-r:
> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +        description: |
> +          Program data for red channel.  See LP5562 datasheet for program format specification.
> +
> +      pat-g:
> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +        description: |
> +          Program data for green channel.  See LP5562 datasheet for program format specification.
> +
> +      pat-b:
> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +        description: |
> +          Program data for blue channel.  See LP5562 datasheet for program format specification.
> +
>  required:
>    - compatible
>    - reg
> @@ -223,6 +248,82 @@ examples:
>                 };
>              };
>          };
> -    };
>  
> +        led-controller@30 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "ti,lp5562";
> +            reg = <0x30>;
> +
> +            led@0 {
> +                reg = <0>;
> +                chan-name = "red";
> +                color = <LED_COLOR_ID_RED>;
> +            };
> +
> +            led@1 {
> +                reg = <1>;
> +                chan-name = "green";
> +                color = <LED_COLOR_ID_GREEN>;
> +            };
> +
> +            led@2 {
> +                reg = <2>;
> +                chan-name = "blue";
> +                color = <LED_COLOR_ID_BLUE>;
> +            };
> +
> +            pattern@1 {
> +                /* Pulsing blue pattern
> +                 *   Blue:
> +                 *     027F: Ramp up 50%
> +                 *     027F: Ramp up 50%
> +                 *     4600: Wait 100ms
> +                 *     02FF: Ramp down 50%
> +                 *     02FF: Ramp down 50%
> +                 *     4600: Wait 100ms
> +                 *     0000: Goto start
> +                 */
> +                pat-name = "Pulsing Blue";
> +                pat-b = [02 7f 02 7f 46 00 02 ff 02 ff 46 00 00 00];
> +            };
> +
> +            pattern@2 {
> +                /*
> +                 * HSV rainbow
> +                 *   Red:
> +                 *     40FF: Set PWM 255
> +                 *     41FF: Ramp down 50%
> +                 *     41FF: Ramp down 50%
> +                 *     41FF: Wait 1/2 ramp time
> +                 *     41FF: Wait 1/2 ramp time
> +                 *     417F: Ramp up 50%
> +                 *     417F: Ramp up 50%
> +                 *     0000: Goto start
> +                 *   Green:
> +                 *     4000: Set PWM 0
> +                 *     417F: Ramp up 50%
> +                 *     417F: Ramp up 50%
> +                 *     41FF: Ramp down 50%
> +                 *     41FF: Ramp down 50%
> +                 *     41FF: Wait 1/2 ramp time
> +                 *     41FF: Wait 1/2 ramp time
> +                 *     0000: Goto start
> +                 *   Blue:
> +                 *     4000: Set PWM 0
> +                 *     41FF: Wait 1/2 ramp time
> +                 *     41FF: Wait 1/2 ramp time
> +                 *     417F: Ramp up 50%
> +                 *     417F: Ramp up 50%
> +                 *     41FF: Ramp down 50%
> +                 *     41FF: Ramp down 50%
> +                 *     0000: Goto start
> +                 */
> +                pat-name = "HSV Rainbow";
> +                pat-r = [40 ff 41 FF 41 FF 41 FF 41 FF 41 7F 41 7F 00 00];
> +                pat-g = [40 00 41 7F 41 7F 41 FF 41 FF 41 FF 41 FF 00 00];
> +                pat-b = [40 00 41 FF 41 FF 41 7F 41 7F 41 FF 41 FF 00 00];
> +            };
> +        };
> +    };
>  ...
> -- 
> 2.20.1
> 
