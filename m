Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE79D1906
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 21:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbfJITf0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 15:35:26 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45036 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfJITf0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 15:35:26 -0400
Received: by mail-oi1-f195.google.com with SMTP id w6so2767062oie.11;
        Wed, 09 Oct 2019 12:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LSaKQcX6q921SbZIAAps9qq+mryxNGBOoC/GFHk9XOM=;
        b=jjpmgEFA482bbiM55Lk7uDDaKSE5M+dFsq097j641cfCdfncpRuxK11pVilrNkReQk
         MxQtoEZzxDKSBjr7I3TYS3qHSvttKxogrr/p9P+SQXEP9+8NZ1e4L70e227h9VAkM6Ab
         E+0YlXgu6wwIE2g1eoKVJ/sIZYMPlqmvx/CICwTV/f10xc1MNCTceXdEuxlckiS46NUj
         vF0X6O2+KlL8475oxJ14hKaP2zx34jwsQEgK9bARYE8TkykFeX+TLBejaO3OCukBXkBm
         n08UontBAXSW2+nTDWUIFhhyFllP6tgRtx/0esYWZF4OWQwLXZwFTKJLF/UcXeHdHA3v
         928w==
X-Gm-Message-State: APjAAAUstWkta6GGo5D5x6j0O37JsTW2NJ72/qfzP5FoYH8IMdnclM27
        guXa1qjFtLnN+z2msS9Iww==
X-Google-Smtp-Source: APXvYqwo7etVQip/ebQ+dQtduCEo+8iK/+LAxhfIkrh6SvJ3EJNFQLHCD0Q63XCl50BGs0IjfJTqYw==
X-Received: by 2002:aca:f545:: with SMTP id t66mr3872832oih.124.1570649724939;
        Wed, 09 Oct 2019 12:35:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v24sm890114ote.23.2019.10.09.12.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 12:35:24 -0700 (PDT)
Date:   Wed, 9 Oct 2019 14:35:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, sre@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 5/6] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20191009193523.GA7094@bogus>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-6-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009085127.22843-6-jjhiblot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 09, 2019 at 10:51:26AM +0200, Jean-Jacques Hiblot wrote:
> Add DT binding for led-backlight.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> 
> ---
> 
> .../leds/backlight/led-backlight.yaml         | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> new file mode 100644
> index 000000000000..47ae3d6b4f31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/led-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED-based Backlight Device Tree Bindings
> +
> +maintainers:
> +  - Jean-Jacques Hiblot <jjhiblot@ti.com>
> +
> +description: |
> +  This binding is used to describe a basic backlight device made of LEDs.
> +  It can also be used to describe a backlight device controlled by the
> +  output of a LED driver.
> +
> +properties:
> +  compatible:
> +    const: led-backlight
> +
> +  leds:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: List of LEDs constitutive of the backlight.
> +
> +  default-brightness:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Default brightness level on boot.

It's not clear that this is an index when 'brightness-levels' is present 
and absolute level when not. I wonder if we've been consistent on that?

> +    minimum: 0

Implied by being a uint32.

> +
> +  brightness-levels:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Array of distinct brightness levels. The levels must be in
> +      the range accepted by the underlying LED devices. This is used to
> +      translate a backlight brightness level into a LED brightness level. If
> +      it is not provided, the identity mapping is used.
> +
> +required:
> +  - compatible
> +  - backlight-leds

leds?


Add 'additionalProperties: false' here.

> +
> +examples:
> +  - |
> +    backlight {

Please also define $nodename is 'backlight'.

> +      compatible = "led-backlight";
> +      backlight-leds = <&led1>;

leds?

> +      brightness-levels = <0 4 8 16 32 64 128 255>;
> +      default-brightness = <6>; /*6th level => brightness of the LEDs is 128*/
> +    };
> +  - |
> +    backlight {
> +      compatible = "led-backlight";
> +      backlight-leds = <&led1>, <&led2>;
> +      default-brightness = <255>;
> +    };
> +...
> -- 
> 2.17.1
> 
