Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E38019DCBF
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2020 19:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404410AbgDCR2E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Apr 2020 13:28:04 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33536 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404371AbgDCR2E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Apr 2020 13:28:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 033HRdOg115404;
        Fri, 3 Apr 2020 12:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585934859;
        bh=Jt4eGbPiA6nLbaLqUDwk0/ki7Wj5fZ7t7wGKoVBH6+4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=WhFf4JSVjpyFG+5vUU8wZmmxcHBm33SxlF5cEknvg9VAorbjlw0lZAybFLp67W7xL
         UnAMa9Oa8OYTmWXsS2SK1RnkJCuBW8zD0dTKCJZcOvcXx5TNHGijNdnEJwJyivWXPW
         PUHQP6RBaO7GD0wTprQvSeX8I1WfgdIMHcB2WHCc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 033HRdWE056151;
        Fri, 3 Apr 2020 12:27:39 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Apr
 2020 12:27:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Apr 2020 12:27:39 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 033HRcc0044904;
        Fri, 3 Apr 2020 12:27:38 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add binding for sgm3140
To:     Luca Weiss <luca@z3ntu.xyz>, <linux-leds@vger.kernel.org>
CC:     Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
References: <20200330194757.2645388-1-luca@z3ntu.xyz>
 <20200330194757.2645388-2-luca@z3ntu.xyz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6c43ac0d-2510-568c-bb5e-955709a9016f@ti.com>
Date:   Fri, 3 Apr 2020 12:21:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330194757.2645388-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Luca

On 3/30/20 2:47 PM, Luca Weiss wrote:
> Add YAML devicetree binding for SGMICRO SGM3140 charge pump used for
> camera flash LEDs.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes since v1:
> - Add vin-supply
> - Add led subnode (common.yaml)
>
>   .../bindings/leds/leds-sgm3140.yaml           | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
> new file mode 100644
> index 000000000000..24ca178e5d0a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-sgm3140.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SGMICRO SGM3140 500mA Buck/Boost Charge Pump LED Driver
> +
> +maintainers:
> +  - Luca Weiss <luca@z3ntu.xyz>
> +
> +description: |
> +  The SGM3140 is a current-regulated charge pump which can regulate two current
> +  levels for Flash and Torch modes.
> +
> +  The data sheet can be found at:
> +    http://www.sg-micro.com/uploads/soft/20190626/1561535688.pdf
> +
> +properties:
> +  compatible:
> +    const: sgmicro,sgm3140
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: A connection to the 'EN' pin.
> +
> +  flash-gpios:
> +    maxItems: 1
> +    description: A connection to the 'FLASH' pin.
> +
> +  vin-supply:
> +    description: Regulator providing power to the 'VIN' pin.
> +
> +  led:
> +    allOf:
> +      - $ref: common.yaml#
> +
> +required:
> +  - compatible
> +  - flash-gpios
> +  - enable-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    sgm3140 {
> +        compatible = "sgmicro,sgm3140";
> +        flash-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
> +        enable-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* PC3 */
> +        vin-supply = <&reg_dcdc1>;
> +
> +        sgm3140_flash: led {
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            flash-max-timeout-us = <250000>;
> +        };
> +    };


Reviewed-by: Dan Murphy <dmurphy@ti.com>

