Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5C8E87B3
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 13:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbfJ2MGt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Oct 2019 08:06:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57694 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfJ2MGt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Oct 2019 08:06:49 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TC6eYu020583;
        Tue, 29 Oct 2019 07:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572350800;
        bh=Fw11anpRUupPfhHjF+s4H1gOWFTddrb7DScu6ObM2GA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=McBukDJKQCzF1yD3lBPMZ6pVFL2Eh6D/EoPThHqMs/i3C7haAYASVqNcYDWe6cExx
         qfi45WtstVl4qNVPBhJ3yTze/4OsjNwOrVH6ZpGZmJ5HM+eCkbvBeRf0Z8/zrJ2Klx
         2nKBLklDLz915L83xuyvyFE6om0XuCvYZkFucxIU=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TC6eSL059159
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Oct 2019 07:06:40 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 29
 Oct 2019 07:06:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 29 Oct 2019 07:06:28 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TC6eFg090144;
        Tue, 29 Oct 2019 07:06:40 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add leds-meter binding
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
References: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
 <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <20078e40-7e58-a6b7-5b23-7c4201057506@ti.com>
Date:   Tue, 29 Oct 2019 07:05:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Akinobu

On 10/27/19 9:09 AM, Akinobu Mita wrote:
> Add DT binding for generic LED level meter which consists of multiple LED
> devices by different drivers.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Bjorn Andersson <bjorn@kryo.se>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>   .../devicetree/bindings/leds/leds-meter.yaml       | 67 ++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-meter.yaml b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> new file mode 100644
> index 0000000..b5fcd98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-meter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic LED level meter
> +
> +maintainers:
> +  - Akinobu Mita <akinobu.mita@gmail.com>
> +
> +description:
> +  Generic LED level meter consists of multiple LED devices by different drivers.
> +
> +properties:
> +  $nodename:
> +    pattern: "^meter-leds(@.*)?"
> +
> +  compatible:
> +    const: meter-leds
> +
> +  leds:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: List of phandles to LED node that are members of a level meter.
> +
> +  brightness-weights:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      By default, the brightness of the LED level meter is proportional to the
> +      number of actual LEDs that are turned on.  We can optionally specify
> +      the contribution ratio for each LED within a level meter by this
> +      property.  The example below shows how to setup an exponential
> +      relationship between the number of LEDs turned on and the brightness of
> +      meter-leds.
> +
> +required:
> + - compatible
> + - leds
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Example 1: LED level meter with four LEDs
> +    meter-leds {
> +        compatible = "meter-leds";
> +        leds = <&led0>, <&led1>, <&led2>, <&led3>;
> +    };
> +
> +    // Example 2: Exponential relationship between the number of LEDs turned on
> +    // and the brightness of meter-leds
> +    //
> +    // When the maximum brightness is 255
> +    // - No LEDs are turned on if brightness == 0
> +    // - led0 is turned on if 0 < brightness <= 32
> +    // - led0 and led1 are turned on if 32 < brightness <= 64
> +    // - led0, led1, and led2 are turned on if 64 < brightness <= 128
> +    // - All LEDs are turned on if 128 < brightness <= 255
> +    meter-leds {
> +        compatible = "meter-leds";
> +        leds = <&led0>, <&led1>, <&led2>, <&led3>;
> +        brightness-weights = <32 32 64 127>;
> +    };
> +
> +...

Fails binding check

Documentation/devicetree/bindings/leds/leds-meter.example.dts:32.20-36.11: 
ERROR (duplicate_node_names): /example-0/meter-leds: Duplicate node name
ERROR: Input tree has errors, aborting (use -f to force output)
scripts/Makefile.lib:314: recipe for target 
'Documentation/devicetree/bindings/leds/leds-meter.example.dt.yaml' failed
make[1]: *** 
[Documentation/devicetree/bindings/leds/leds-meter.example.dt.yaml] Error 2
Makefile:1284: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

