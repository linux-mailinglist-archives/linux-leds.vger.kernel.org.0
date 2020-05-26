Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6CC1E2180
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2020 14:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgEZMAi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 08:00:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35296 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727948AbgEZMAi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 08:00:38 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QC0WbH103538;
        Tue, 26 May 2020 07:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590494432;
        bh=BpXxWfmdYvNF+ijQSVSGnbQkH6FsWQci/xJaoWIPLEo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=s9uWFzKuFCOqoA2jMl9OYh63UvK85B1AGXBdIpgj4jGy0Jzp41M6zm8ycNoaoMXDs
         lwJKjGTY40/m99+juW0WOVyJ4Dqy1R8HLlLvJQgXQpKEv5axOwr7Cq1+OkJigXXJJw
         0JFuwUUpAvTyKrPzMwp04Ec96fptMjo6Cru6QgUk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QC0Wr3108109;
        Tue, 26 May 2020 07:00:32 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 07:00:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 07:00:31 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QC0VcX123548;
        Tue, 26 May 2020 07:00:31 -0500
Subject: Re: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings
 documention
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20200504211344.13221-1-dmurphy@ti.com>
 <20200504211344.13221-2-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c6dfde9b-e1a7-1959-1413-16ebff803536@ti.com>
Date:   Tue, 26 May 2020 07:00:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504211344.13221-2-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob

On 5/4/20 4:13 PM, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.
>
> CC: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../bindings/leds/leds-class-multicolor.yaml  | 71 +++++++++++++++++++
>   drivers/leds/led-core.c                       |  1 +
>   include/dt-bindings/leds/common.h             |  3 +-
>   3 files changed, 74 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> new file mode 100644
> index 000000000000..fa6ea8e5c46b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0
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
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +            color = <LED_COLOR_ID_MULTI>;
> +            function = LED_FUNCTION_CHARGING;
> +
> +            led@0 {
> +              reg = <0>;
> +              color = <LED_COLOR_ID_RED>;
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
> index f1f718dbe0f8..846248a0693d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -34,6 +34,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
>   	[LED_COLOR_ID_VIOLET] = "violet",
>   	[LED_COLOR_ID_YELLOW] = "yellow",
>   	[LED_COLOR_ID_IR] = "ir",
> +	[LED_COLOR_ID_MULTI] = "multicolor",
>   };
>   EXPORT_SYMBOL_GPL(led_colors);
>   
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 0ce7dfc00dcb..a463ce6a8794 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -30,7 +30,8 @@
>   #define LED_COLOR_ID_VIOLET	5
>   #define LED_COLOR_ID_YELLOW	6
>   #define LED_COLOR_ID_IR		7
> -#define LED_COLOR_ID_MAX	8
> +#define LED_COLOR_ID_MULTI	8
> +#define LED_COLOR_ID_MAX	9
>   
>   /* Standard LED functions */
>   /* Keyboard LEDs, usually it would be input4::capslock etc. */


Can you re-review this series for dt-bindings?

https://lore.kernel.org/patchwork/project/lkml/list/?series=441958

I know you may reviewed them before and may have acked them but they 
have changed enough that I did not feel right about keeping your ack.

Dan


