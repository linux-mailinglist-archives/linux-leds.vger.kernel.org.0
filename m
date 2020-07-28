Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1792230B94
	for <lists+linux-leds@lfdr.de>; Tue, 28 Jul 2020 15:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730080AbgG1Njq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Jul 2020 09:39:46 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46824 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbgG1Njq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jul 2020 09:39:46 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06SDdV4h088972;
        Tue, 28 Jul 2020 08:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595943571;
        bh=dPv4YxIrwFuV3NudXMrtoCbaLmUQB+hhpnVi9I+m27g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=DgR3SBvj1LP8atxh++0E+OE2NN4HRh9HizQIQ1C4WKvcmMjhRe9Unc33ehKw3jZMC
         7LELVTFf2bFjD1ZEwt6J3noouEKTErAmVHFtJAvfLFCtO7hfxnKUy93p/hi8jqnUxS
         n/RM45oGVtfVIDRk+6qOAxsOZTprq9tat9UBZpl4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06SDdVit100388;
        Tue, 28 Jul 2020 08:39:31 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Jul 2020 08:39:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Jul 2020 08:39:31 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06SDdTx9116558;
        Tue, 28 Jul 2020 08:39:30 -0500
Subject: Re: [PATCH v32 1/6] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-2-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <285e2038-6a90-e59a-d414-19cc0f8789e6@ti.com>
Date:   Tue, 28 Jul 2020 08:39:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722153146.8767-2-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/22/20 10:31 AM, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
> LP5018, LP5012 and LP5009 RGB LED device driver.  The LP5036/30/24/18/12/9
> can control RGB LEDs individually or as part of a control bank group.
> These devices have the ability to adjust the mixing control for the RGB
> LEDs to obtain different colors independent of the overall brightness of
> the LED grouping.

Were you going to pull this in as a user of the Multicolor framework?

Dan


>
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5012.pdf
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../devicetree/bindings/leds/leds-lp50xx.yaml | 130 ++++++++++++++++++
>   1 file changed, 130 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> new file mode 100644
> index 000000000000..b2dd1672f12a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-lp50xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for LP50XX RGB LED from Texas Instruments.
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB LEDs into
> +  a LED group or control them individually.
> +
> +  The difference in these RGB LED drivers is the number of supported RGB
> +  modules.
> +
> +  For more product information please see the link below:
> +  https://www.ti.com/lit/ds/symlink/lp5012.pdf
> +  https://www.ti.com/lit/ds/symlink/lp5024.pdf
> +  https://www.ti.com/lit/ds/symlink/lp5036.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lp5009
> +      - ti,lp5012
> +      - ti,lp5018
> +      - ti,lp5024
> +      - ti,lp5030
> +      - ti,lp5036
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      I2C slave address
> +      lp5009/12 - 0x14, 0x15, 0x16, 0x17
> +      lp5018/24 - 0x28, 0x29, 0x2a, 0x2b
> +      lp5030/36 - 0x30, 0x31, 0x32, 0x33
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO pin to enable/disable the device.
> +
> +  vled-supply:
> +    description: LED supply.
> +
> +patternProperties:
> +  '^multi-led@[0-9a-f]$':
> +    type: object
> +    allOf:
> +      - $ref: leds-class-multicolor.yaml#
> +    properties:
> +      reg:
> +        minItems: 1
> +        maxItems: 12
> +        description:
> +          This property denotes the LED module number(s) that is used on the
> +          for the child node.  The LED modules can either be used stand alone
> +          or grouped into a module bank.
> +
> +    patternProperties:
> +      "(^led-[0-9a-f]$|led)":
> +        type: object
> +        $ref: common.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +   #include <dt-bindings/gpio/gpio.h>
> +   #include <dt-bindings/leds/common.h>
> +
> +   i2c {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       led-controller@14 {
> +           compatible = "ti,lp5009";
> +           reg = <0x14>;
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +           enable-gpios = <&gpio1 16>;
> +
> +           multi-led@1 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x1>;
> +               color = <LED_COLOR_ID_MULTI>;
> +               function = LED_FUNCTION_CHARGING;
> +
> +               led-0 {
> +                   color = <LED_COLOR_ID_RED>;
> +               };
> +
> +               led-1 {
> +                   color = <LED_COLOR_ID_GREEN>;
> +               };
> +
> +               led-2 {
> +                   color = <LED_COLOR_ID_BLUE>;
> +               };
> +          };
> +
> +          multi-led@2 {
> +            #address-cells = <1>;
> +            #size-cells = <2>;
> +            reg = <0x2 0x3 0x5>;
> +            color = <LED_COLOR_ID_MULTI>;
> +            function = LED_FUNCTION_STANDBY;
> +
> +            led-6 {
> +              color = <LED_COLOR_ID_RED>;
> +            };
> +
> +            led-7 {
> +              color = <LED_COLOR_ID_GREEN>;
> +            };
> +
> +            led-8 {
> +              color = <LED_COLOR_ID_BLUE>;
> +            };
> +         };
> +       };
> +    };
> +
> +...
