Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C83E1AAF
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 14:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390018AbfJWMfc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 08:35:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55154 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389888AbfJWMfc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Oct 2019 08:35:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9NCZOCf042095;
        Wed, 23 Oct 2019 07:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571834124;
        bh=J7vtenKEXuXVl0lBap8CU6gDxo4xRoiS6Zd5T9c5dKg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SFyMEXu20tZIWaqh9ZFMFCk6M9eL4V0NRo7Uw/hCdXSUdVjorjdJqwwfshKplTE0f
         Or9hPOZLJfuxNUXYKW6OgMTETbPciRm5uHLMo+y8Xxu1Yedhb0XTUUGUvPN+CjBqpl
         4cCHKmi4zhZK5rIGX9ZErgbyfe2WTGyshfCTUUss=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9NCZNL9010837
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Oct 2019 07:35:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 07:35:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 07:35:13 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9NCZMVS045311;
        Wed, 23 Oct 2019 07:35:23 -0500
Subject: Re: [PATCH 2/2] leds: meter: add leds-meter binding
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
References: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com>
 <1571756812-19005-3-git-send-email-akinobu.mita@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0f58e263-7e56-b4f7-51c1-a37e107a1afe@ti.com>
Date:   Wed, 23 Oct 2019 07:34:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571756812-19005-3-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Akinobu

On 10/22/19 10:06 AM, Akinobu Mita wrote:
> Add DT binding for leds-meter.

$subject should be

  dt-bindings: leds: Add leds-meter binding

And this patch should be first in the series

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
>   .../devicetree/bindings/leds/leds-meter.yaml       | 42 ++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-meter.yaml b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> new file mode 100644
> index 0000000..d5dfa261
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0
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
> +  compatible:
> +    const: meter-leds
> +
> +  leds:

This seems a bit generic for the property name

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    description: List of phandles to LED node that are members of a level meter.
> +
> +  brightness-weights:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    description: Each integer represents a contribution ratio within a level
> +      meter.

This description is a bit vague I would not be sure what I would set 
this to.

Dan

> +
> +required:
> + - compatible
> + - leds
> +
> +examples:
> +  - |
> +    leds {
> +        compatible = "meter-leds";
> +        leds = <&led0>, <&led1>, <&led2>, <&led3>;
> +        brightness-weights = <3 1 1 1>;
> +    };
> +
> +...
