Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4CE1C47D5
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 22:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgEDUSu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 16:18:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40136 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgEDUSu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 16:18:50 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044KIgmW083879;
        Mon, 4 May 2020 15:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588623522;
        bh=JnWkruTmjRltQXNw/MW7et/CtD+t7y6OhtwkTr2Y12Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tMLFnS6/NAIvKH7XpRbL5kfwid6AFGJECgguRiHuX7y5ZIgk7J78Htof7qvqtb0U9
         q5IW2X9124maTLwf+b2LP5EGNw1y0D7bM5E53LYmKABG3H+KNUs90yu2X7wXLByzPN
         UuXu27n/fA2MHOGQB6JcFj1qnBXMQ2Rmd738kmGw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 044KIgHi086570
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 May 2020 15:18:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 15:18:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 15:18:42 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044KIf6Z114527;
        Mon, 4 May 2020 15:18:41 -0500
Subject: Re: [PATCH 2/3] dt-bindings: leds: Add binding for aw2013
To:     <nikitos.tr@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
References: <20200504162934.4693-1-nikitos.tr@gmail.com>
 <20200504162934.4693-2-nikitos.tr@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7866a778-f38a-5d65-09d6-783f3a6c555d@ti.com>
Date:   Mon, 4 May 2020 15:09:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504162934.4693-2-nikitos.tr@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 5/4/20 11:29 AM, nikitos.tr@gmail.com wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
>
> Add YAML devicetree binding for AWINIC AW2013 3-channel led driver
>
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
> ---
>   .../devicetree/bindings/leds/leds-aw2013.yaml | 91 +++++++++++++++++++
>   1 file changed, 91 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-aw2013.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> new file mode 100644
> index 000000000000..f118721df1e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AWINIC AW2013 3-channel LED Driver
> +
> +maintainers:
> +  - Nikita Travkin <nikitos.tr@gmail.com>
> +
> +description: |
> +  The AW2013 is a 3-channel LED driver with I2C interface. It can control
> +  LED brightness with PWM output.
> +
> +properties:
> +  compatible:
> +    const: awinic,aw2013
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: Regulator providing power to the "VCC" pin.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-2]$":
> +    type: object
> +    allOf:
> +      - $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        description: Index of the LED.
> +        minimum: 0
> +        maximum: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@45 {
> +            compatible = "awinic,aw2013";
> +            reg = <0x45>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            vcc-supply = <&pm8916_l17>;
> +
> +            led@0 {
> +                reg = <0>;
> +                led-max-microamp = <5000>;
> +                function = LED_FUNCTION_INDICATOR;
> +                color = <LED_COLOR_ID_RED>;
> +            };
> +
> +            led@1 {
> +                reg = <1>;
> +                led-max-microamp = <5000>;
> +                function = LED_FUNCTION_INDICATOR;
> +                color = <LED_COLOR_ID_GREEN>;
> +            };
> +
> +            led@2 {
> +                reg = <2>;
> +                led-max-microamp = <5000>;
> +                function = LED_FUNCTION_INDICATOR;
> +                color = <LED_COLOR_ID_BLUE>;
> +            };
> +        };
> +    };
> +...

Would this be a good candidate for the multicolor framework?

Dan


