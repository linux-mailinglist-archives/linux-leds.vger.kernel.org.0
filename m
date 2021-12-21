Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C73B47C7A1
	for <lists+linux-leds@lfdr.de>; Tue, 21 Dec 2021 20:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbhLUTlX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Dec 2021 14:41:23 -0500
Received: from mail-qk1-f181.google.com ([209.85.222.181]:45663 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhLUTlX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Dec 2021 14:41:23 -0500
Received: by mail-qk1-f181.google.com with SMTP id e16so67704qkl.12;
        Tue, 21 Dec 2021 11:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=duofUTwu8b95rKJDUSHd36lYQ0sEGfkma/8SKA1oW+M=;
        b=Tiy4rU8xv9m4QM1Z/o29GqdtvKjgF4S9D+06iuAb2ff9Fg9iJK+V0tzZ4LgUKZnS0U
         terlwKr2dYyIKO3Sj4Gyhm6cUbs70xi1stgQoEfO9HBLGxrqJSMw2TnWYMxV3yUO/J4+
         kqluiBVSMThNPihKYQs1CAO5ciRr5qyOyInOCxCiZzFO8vW48WrOe5apbbwyS7h4T30N
         7+q9zZ5nsTfhSs1/2qt+y8gro5Kmiy71mOU8tzyiL9WnbzEaESHoEWqfF2KRmDKuA2OH
         AecdDRJCr8Sxnp1tSP2lF+Tyu9LGhP21+KHPHAZEeIs8SmMmQ2DsfJKictua+APR24LD
         sKbQ==
X-Gm-Message-State: AOAM530cZAmucjvJwIBYdW3g2vjN8/nbHmHd9w4fp8zHCj6zQ1F91PSt
        5maeZdLaffQTYoD0eHrtyA==
X-Google-Smtp-Source: ABdhPJygck2OJtc3MJwpyyWyfI+a4szU9dS+/mNaclv4h+SPf0xt1F56WYCs0EhL/9m4+weGFiOAtw==
X-Received: by 2002:a05:620a:128e:: with SMTP id w14mr3255431qki.472.1640115682484;
        Tue, 21 Dec 2021 11:41:22 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id e7sm18334608qtx.72.2021.12.21.11.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:41:21 -0800 (PST)
Received: (nullmailer pid 1625724 invoked by uid 1000);
        Tue, 21 Dec 2021 19:41:19 -0000
Date:   Tue, 21 Dec 2021 15:41:19 -0400
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Milo Kim <milo.kim@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: lp855x: Convert to json-schema
Message-ID: <YcIt34BGh/F/Fown@robh.at.kernel.org>
References: <20211217170715.2893923-1-thierry.reding@gmail.com>
 <20211217170715.2893923-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217170715.2893923-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Dec 17, 2021 at 06:07:15PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Texas Instruments LP855x backlight device tree bindings from
> the free-form text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/leds/backlight/lp855x.txt        |  72 ---------
>  .../bindings/leds/backlight/ti,lp8550.yaml    | 151 ++++++++++++++++++
>  2 files changed, 151 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lp855x.txt b/Documentation/devicetree/bindings/leds/backlight/lp855x.txt
> deleted file mode 100644
> index 88f56641fc28..000000000000
> --- a/Documentation/devicetree/bindings/leds/backlight/lp855x.txt
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -lp855x bindings
> -
> -Required properties:
> -  - compatible: "ti,lp8550", "ti,lp8551", "ti,lp8552", "ti,lp8553",
> -                "ti,lp8555", "ti,lp8556", "ti,lp8557"
> -  - reg: I2C slave address (u8)
> -  - dev-ctrl: Value of DEVICE CONTROL register (u8). It depends on the device.
> -
> -Optional properties:
> -  - bl-name: Backlight device name (string)
> -  - init-brt: Initial value of backlight brightness (u8)
> -  - pwm-period: PWM period value. Set only PWM input mode used (u32)
> -  - rom-addr: Register address of ROM area to be updated (u8)
> -  - rom-val: Register value to be updated (u8)
> -  - power-supply: Regulator which controls the 3V rail
> -  - enable-supply: Regulator which controls the EN/VDDIO input
> -
> -Example:
> -
> -	/* LP8555 */
> -	backlight@2c {
> -		compatible = "ti,lp8555";
> -		reg = <0x2c>;
> -
> -		dev-ctrl = /bits/ 8 <0x00>;
> -		pwm-period = <10000>;
> -
> -		/* 4V OV, 4 output LED0 string enabled */
> -		rom_14h {
> -			rom-addr = /bits/ 8 <0x14>;
> -			rom-val = /bits/ 8 <0xcf>;
> -		};
> -
> -		/* Heavy smoothing, 24ms ramp time step */
> -		rom_15h {
> -			rom-addr = /bits/ 8 <0x15>;
> -			rom-val = /bits/ 8 <0xc7>;
> -		};
> -
> -		/* 4 output LED1 string enabled */
> -		rom_19h {
> -			rom-addr = /bits/ 8 <0x19>;
> -			rom-val = /bits/ 8 <0x0f>;
> -		};
> -	};
> -
> -	/* LP8556 */
> -	backlight@2c {
> -		compatible = "ti,lp8556";
> -		reg = <0x2c>;
> -
> -		bl-name = "lcd-bl";
> -		dev-ctrl = /bits/ 8 <0x85>;
> -		init-brt = /bits/ 8 <0x10>;
> -	};
> -
> -	/* LP8557 */
> -	backlight@2c {
> -		compatible = "ti,lp8557";
> -		reg = <0x2c>;
> -		enable-supply = <&backlight_vddio>;
> -		power-supply = <&backlight_vdd>;
> -
> -		dev-ctrl = /bits/ 8 <0x41>;
> -		init-brt = /bits/ 8 <0x0a>;
> -
> -		/* 4V OV, 4 output LED string enabled */
> -		rom_14h {
> -			rom-addr = /bits/ 8 <0x14>;
> -			rom-val = /bits/ 8 <0xcf>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml
> new file mode 100644
> index 000000000000..412779a5462b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/ti,lp8550.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments LP855x family devicetree bindings
> +
> +maintainers:
> +  - Milo Kim <milo.kim@ti.com>
> +  - Rob Herring <robh+dt@kernel.org>

I don't know anything about this h/w.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lp8550
> +      - ti,lp8551
> +      - ti,lp8552
> +      - ti,lp8553
> +      - ti,lp8555
> +      - ti,lp8556
> +      - ti,lp8557
> +
> +  reg:
> +    maxItems: 1
> +
> +  dev-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: Value of DEVICE CONTROL register. It depends on the device.
> +
> +  bl-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Backlight device name
> +
> +  init-brt:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: Initial value of backlight brightness
> +
> +  pwm-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: PWM period value. Set only PWM input mode used
> +
> +  pwm-names:
> +    maxItems: 1
> +
> +  pwms:
> +    maxItems: 1
> +
> +  power-supply:
> +    description: Regulator which controls the 3V rail
> +
> +  enable-supply:
> +    description: Regulator which controls the EN/VDDIO input
> +
> +patternProperties:
> +  '^rom_[0-9a-f]{2}h$':
> +    type: object
> +    properties:
> +      rom-addr:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        description: Register address of ROM area to be updated
> +
> +      rom-val:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        description: Register value to be updated
> +
> +    additionalProperties: false
> +
> +    required:
> +      - rom-addr
> +      - rom-val
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - dev-ctrl
> +
> +examples:
> +  # LP8555
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      backlight@2c {
> +        compatible = "ti,lp8555";
> +        reg = <0x2c>;
> +
> +        dev-ctrl = /bits/ 8 <0x00>;
> +        pwm-period = <10000>;
> +
> +        /* 4V OV, 4 output LED0 string enabled */
> +        rom_14h {
> +          rom-addr = /bits/ 8 <0x14>;
> +          rom-val = /bits/ 8 <0xcf>;
> +        };
> +
> +        /* Heavy smoothing, 24ms ramp time step */
> +        rom_15h {
> +          rom-addr = /bits/ 8 <0x15>;
> +          rom-val = /bits/ 8 <0xc7>;
> +        };
> +
> +        /* 4 output LED1 string enabled */
> +        rom_19h {
> +          rom-addr = /bits/ 8 <0x19>;
> +          rom-val = /bits/ 8 <0x0f>;
> +        };
> +      };
> +    };
> +
> +  # LP8556
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      backlight@2c {
> +        compatible = "ti,lp8556";
> +        reg = <0x2c>;
> +
> +        bl-name = "lcd-bl";
> +        dev-ctrl = /bits/ 8 <0x85>;
> +        init-brt = /bits/ 8 <0x10>;
> +      };
> +    };
> +
> +  # LP8557
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      backlight@2c {
> +        compatible = "ti,lp8557";
> +        reg = <0x2c>;
> +        enable-supply = <&backlight_vddio>;
> +        power-supply = <&backlight_vdd>;
> +
> +        dev-ctrl = /bits/ 8 <0x41>;
> +        init-brt = /bits/ 8 <0x0a>;
> +
> +        /* 4V OV, 4 output LED string enabled */
> +        rom_14h {
> +          rom-addr = /bits/ 8 <0x14>;
> +          rom-val = /bits/ 8 <0xcf>;
> +        };
> +      };
> +    };
> -- 
> 2.34.1
> 
> 
