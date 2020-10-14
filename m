Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385E028DAC1
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 09:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgJNH7F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 03:59:05 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:53394 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727306AbgJNH7C (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 14 Oct 2020 03:59:02 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id DC266E15FA1BFE7BA172;
        Wed, 14 Oct 2020 15:58:55 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.134) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 14 Oct 2020
 15:58:54 +0800
Subject: Re: [PATCH] dt-bindings: leds: Update devicetree documents for ID_RGB
To:     Dan Murphy <dmurphy@ti.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20201013175034.25911-1-dmurphy@ti.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <afc6328e-1f34-8288-b0d2-20328eabf967@huawei.com>
Date:   Wed, 14 Oct 2020 15:58:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201013175034.25911-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.134]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2020/10/14 1:50, Dan Murphy wrote:
> Update the leds/common.yaml to indicate that the max color ID is 9.
> Reflect the same change in the leds-class-multicolor.yaml
> 
> Reported-by: Zhen Lei <thunder.leizhen@huawei.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml       | 2 +-
>  .../devicetree/bindings/leds/leds-class-multicolor.yaml  | 9 +++++----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index a2a541bca73c..0c9f912dfee6 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -43,7 +43,7 @@ properties:
>        LED_COLOR_ID available, add a new one.
>      $ref: /schemas/types.yaml#definitions/uint32
>      minimum: 0
> -    maximum: 8
> +    maximum: 9
>  
>    function-enumerator:
>      description:
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> index b55e1f1308a4..f8032e863ecb 100644
> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -16,7 +16,7 @@ description: |
>    modules. This is achieved by adding multi-led nodes layer to the
>    monochrome LED bindings.
>    The nodes and properties defined in this document are unique to the multicolor
> -  LED class.  Common LED nodes and properties are inherited from the common.txt
> +  LED class.  Common LED nodes and properties are inherited from the common.yaml
>    within this documentation directory.
>  
>  patternProperties:
> @@ -25,10 +25,11 @@ patternProperties:
>      description: Represents the LEDs that are to be grouped.
>      properties:
>        color:
> -        const: 8  # LED_COLOR_ID_MULTI
> +        const: 9  # LED_COLOR_ID_RGB
This means only LED_COLOR_ID_RGB is allowed.

>          description: |
> -          For multicolor LED support this property should be defined as
> -          LED_COLOR_ID_MULTI which can be found in include/linux/leds/common.h.
> +          For multicolor LED support this property should be defined as either
> +          LED_COLOR_ID_RGB or LED_COLOR_ID_MULTI which can be found in

If both LED_COLOR_ID_RGB and LED_COLOR_ID_MULTI are allowed, then we should use enum
list both of them.

> +          include/linux/leds/common.h.
>  
>      $ref: "common.yaml#"
>  
> 

