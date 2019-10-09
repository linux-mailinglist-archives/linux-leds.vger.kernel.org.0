Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04980D18E7
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 21:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbfJIT0b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 15:26:31 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41960 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731254AbfJIT0b (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 15:26:31 -0400
Received: by mail-oi1-f196.google.com with SMTP id w65so2760752oiw.8;
        Wed, 09 Oct 2019 12:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E+1Cf+QVyq8bhGJdgpmwKD8ewKz92Myu7dCI2HheZcs=;
        b=OEvacDBD1nNTxzNXydm1Fi/JV52WJKzGU5Lk2an5FP4A6V65B/rQDrrQfU1QGRCQ0S
         Zrs0Jgbh0qEaujYFk8He/cvzhz3gg7tG4KgA8UcNbYihwcIz5jbD8yHf5bQPPpyEz/2I
         sZhdpflWkZGUBiCBkGjpHXoc8O3Ev9CghEAWVKhJ9uIIle7Zy1j5Hv1yo9WWdL6jUF8V
         6qoEGX8nNPZt7j1wkFD+5TW6D0qVBlqeTDKABi1msx1C7VrPVhpsKsmm+PTJ41/hX0FW
         ioIZIj8++W3GX9EVE3RKWmPmC9WNF4/m2BBdcPD9gH50uCiY/bYDOZDC67/CProCkQQr
         Ij7Q==
X-Gm-Message-State: APjAAAU740lGtAvsv8SOXnNeze78ee3GyLWQmXR8a4sDx0w1GpiMmprC
        urK6ESwFkhW/hcktHE1blg==
X-Google-Smtp-Source: APXvYqxhf2oe+tg+UPt4mEDyJD79ww7yyIO3EkWvJYkdvSRE+pnt3LOVSbpBMfctWccSlLhsJ7SMZQ==
X-Received: by 2002:aca:d402:: with SMTP id l2mr4027557oig.127.1570649190033;
        Wed, 09 Oct 2019 12:26:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 11sm991096otg.62.2019.10.09.12.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 12:26:29 -0700 (PDT)
Date:   Wed, 9 Oct 2019 14:26:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, sre@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 4/6] dts-bindings: leds: Document the naming
 requirement for LED properties
Message-ID: <20191009192628.GA24087@bogus>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009085127.22843-5-jjhiblot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 09, 2019 at 10:51:25AM +0200, Jean-Jacques Hiblot wrote:
> LED properties must be named "leds" in the same way that PWM, clocks or
> PHY properties are names respectively "pwms", "clocks" and "phys".
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  .../devicetree/bindings/leds/common.txt       | 20 ++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 9fa6f9795d50..31b8c1f68d27 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -10,6 +10,9 @@ can influence the way of the LED device initialization, the LED components
>  have to be tightly coupled with the LED device binding. They are represented
>  by child nodes of the parent LED device binding.
>  
> +LED properties should be named "leds". The exact meaning of each leds
> +property must be documented in the device tree binding for each device.
> +

This is worded oddly. The property is 'leds' and it is always a list of 
phandles to LED device nodes. It is present in an LED consumer device.

>  
>  Optional properties for child nodes:
>  - led-sources : List of device current outputs the LED is connected to. The
> @@ -165,9 +168,20 @@ led-controller@30 {
>  		function-enumerator = <2>;
>          };
>  
> -        led@3 {
> +        bkl_led0: led@3 {
>  		reg = <3>;
> -		function = LED_FUNCTION_INDICATOR;
> -		function-enumerator = <3>;
> +		function = LED_FUNCTION_BACKLIGHT;
> +		function-enumerator = <1>;
>          };
> +
> +        bkl_led1: led@4 {
> +		reg = <4>;
> +		function = LED_FUNCTION_BACKLIGHT;
> +		function-enumerator = <2>;
> +        };
> +};
> +
> +
> +backlight@40 {

Either needs 'reg' or the unit-address dropped.

> +	leds = <&bkl_led0> , <&bkl_led1>;

drop the space            ^

>  };
> -- 
> 2.17.1
> 
