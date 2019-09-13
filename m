Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E8FB2197
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 16:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388863AbfIMOGq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Sep 2019 10:06:46 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59566 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388084AbfIMOGq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 Sep 2019 10:06:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DE6Q4g085351;
        Fri, 13 Sep 2019 09:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568383586;
        bh=rF+4FIKlVSHlEEHXf6QhcIJo8Cxci4JVbaPWe8BeTLU=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Fau/Eh2RkxT2FjWYINFwq5ybCkEMljIcv/34t118YnCLwX7NW6QTXF//tC0XsvuEr
         ql/gd1dKIh53WiL5srBH0sxo3Qs8zcVuJMZqTC6/VIniqVf/Vtcwz5ixYYq2M1tRyu
         v+sIGtV0rhH7HozaZPTqdhqoMy2Py9vWLbZS3o5w=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DE6QNb056725
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Sep 2019 09:06:26 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 09:06:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 09:06:25 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DE6PlR112383;
        Fri, 13 Sep 2019 09:06:25 -0500
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To:     Andreas Kemnade <andreas@kemnade.info>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-fbdev@vger.kernel.org>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b6d9fa2c-c23b-7310-e192-cff6185a72b1@ti.com>
Date:   Fri, 13 Sep 2019 09:06:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Andreas

On 9/12/19 4:32 PM, Andreas Kemnade wrote:
> add enable-gpios to describe HWEN pin
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Dan Murphy <dmurphy@ti.com>


> ---
> changes in v2: added example
> changes in v3: added Acked-by
> changes in v4: moved enable-gpios to the right position
>    in the example
>   .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> index dc129d9a329e..c8470628fe02 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> @@ -29,6 +29,10 @@ properties:
>     '#size-cells':
>       const: 0
>   
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> @@ -96,6 +100,7 @@ examples:
>           led-controller@38 {
>                   compatible = "ti,lm3630a";
>                   reg = <0x38>;
> +                enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
>   
>                   #address-cells = <1>;
>                   #size-cells = <0>;
