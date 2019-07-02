Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 682805CD15
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jul 2019 11:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfGBJ6x (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Jul 2019 05:58:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39887 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfGBJ6x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Jul 2019 05:58:53 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so265360wma.4
        for <linux-leds@vger.kernel.org>; Tue, 02 Jul 2019 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QRPK0qOkX5Q+M8nvo0n2KeWKFtd7tJOQgBeJJuKeUes=;
        b=EfsmAl9xsk75PZQw1eUJrpmqGtNjtNVcKtdZ3k0Y5L5V8C0VwhUTn6oLj7Z/kwj7xA
         vebq/nBTJvTA3LEqmGJqGE4/JbzssjqYL5LEGjotpbgHycm6BAcppyawnkXy9PlrRg3L
         m1yg8jPukP5KaUGgNhlmW2IACKW10DFYGZDvLG2OAuBzYnmd0hc5m3Now6tquOQG5H3I
         Zc13t3OA3JOiOIDSGmQFaiGawELStthwhCUQZCpAS8Jx3RYX8uenqVmDEERYoVNDehFe
         VEg/hOOQzY0MtOtH+Wx+lVUIQFYeJA5Hrncc+tNoLHvy1COFp6pAoyse9mfU6KYMBU3i
         ZVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QRPK0qOkX5Q+M8nvo0n2KeWKFtd7tJOQgBeJJuKeUes=;
        b=Fhoe0MmZpT9ddhLzLY5Fseibm3C8GYsGkRW3s2MwJrdSS3O35mKYSFAWCA+2CY19hC
         DEfkPjorGJkIxrIBSnAtwB16O2hN+Bts9zj+IJAylNqmvj74izkzSVBO/aUxI3iGWwzL
         rzunGa3bhUlGvp9Gy/V/qBDnbXVzNg5h43X4Rs+ffr0hYU2sjaiSH/UYhhXRy/dNiN8N
         QvErb8+3C1QUV8b3BNSWGX+QTinePIDiPTNrAZDBh+eVremGbw4VMFEP1I/S/rDqURF3
         IAbYPk0sJ4ucPM9ZNnChpLFVH0KM+ylE50lSwPaBi1iurnXEwV3Knb3Wd9sunHPQ5ka7
         e8ig==
X-Gm-Message-State: APjAAAVJA8260Xm/xTGCm9vTXK2MfvDyrq7ajk08bccyNbsaDeCB0CVZ
        rBLpfz/LljuhTmS89yLLV8sNrA==
X-Google-Smtp-Source: APXvYqxfrHc8PV4pwgQMDK4hyRg+o6rg2wqmTnwa6gQYNet/g493PWh1vk4Ow79EN1QphwjQ8Ag8Gw==
X-Received: by 2002:a1c:6154:: with SMTP id v81mr2812406wmb.92.1562061531646;
        Tue, 02 Jul 2019 02:58:51 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id y1sm1969442wma.32.2019.07.02.02.58.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 02:58:51 -0700 (PDT)
Date:   Tue, 2 Jul 2019 10:58:49 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, jingoohan1@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] devicetree: Add led-backlight binding
Message-ID: <20190702095849.fxlmiqcioihsi3zk@holly.lan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701151423.30768-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 01, 2019 at 05:14:23PM +0200, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> Add DT binding for led-backlight.

I think the patchset is in the wrong order; the DT bindings
documentation should appear *before* the binding is
implemented (amoung other things this prevent transient checkpatch
warnings as the patchset is applied).


> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../video/backlight/led-backlight.txt         | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight/led-backlight.txt
> 
> diff --git a/Documentation/devicetree/bindings/video/backlight/led-backlight.txt b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..216cd52d624a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
> @@ -0,0 +1,39 @@
> +led-backlight bindings
> +
> +The node of the backlight driver IS the node of the LED.
> +
> +Required properties:
> +  - compatible: "led-backlight"
> +  - brightness-levels: Array of distinct LED brightness levels. These
> +      are in the range from 0 to 255, passed to the LED class driver.
> +  - default-brightness-level: the default brightness level (index into the
> +      array defined by the "brightness-levels" property)

I think brightness-levels and default-brightness-level could be
optional properties since a default 1:1 mapping seems reasonable given
how constrained the LED brightness values are.


Daniel.


> +
> +Optional properties:
> +  - power-supply: regulator for supply voltage
> +  - enable-gpios: contains a single GPIO specifier for the GPIO which enables
> +                  and disables the backlight (see GPIO binding[0])
> +
> +[0]: Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Example:
> +
> +led_ctrl {
> +	red_led@1 {
> +	        label = "red";
> +		reg = <1>;
> +	}
> +
> +	backlight_led@2 {
> +		function = LED_FUNCTION_BACKLIGHT;
> +		reg = <2>;
> +
> +		compatible = "led-backlight";
> +
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +
> +		power-supply = <&vdd_bl_reg>;
> +		enable-gpios = <&gpio 58 0>;
> +	};
> +};
> -- 
> 2.17.1
> 
