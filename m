Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFBB72A0638
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 14:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgJ3NIJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Oct 2020 09:08:09 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60676 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgJ3NIJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Oct 2020 09:08:09 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09UD83PG080643;
        Fri, 30 Oct 2020 08:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604063283;
        bh=9+CYzSOFDYNTGUiNg6UZ2lIvLADoLJc3gxHDtO4B+D4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eyoRz811gpUxEQg4m4Rg1EklP3IQUrDbP+i3NSmLJh1pLn9BsCQOsdiXyJaVofbkY
         8EICU1ltDnNmOoYrvTbeuIqXd6wxG8sTZxMbFG82001FrM4Br1GI1R34is+gfO2Hlg
         odvkcvylsCdVfjUPt08MzsoFilJLsqy0CgM68AUU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09UD82dl047974
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Oct 2020 08:08:03 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 08:08:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 08:08:01 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09UD812C104901;
        Fri, 30 Oct 2020 08:08:01 -0500
Subject: Re: [PATCH leds 4/5] dt-bindings: leds: leds-class-multicolor: use
 LED_COLOR_ID_RGB for now
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, <devicetree@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20201030023906.24259-1-kabel@kernel.org>
 <20201030023906.24259-4-kabel@kernel.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b22f8d21-7625-dcff-616c-0c68008b5ab2@ti.com>
Date:   Fri, 30 Oct 2020 08:08:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030023906.24259-4-kabel@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 10/29/20 9:39 PM, Marek Behún wrote:
> Commit 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
> disallows LED_COLOR_ID_MULTI for now, and instead LED_COLOR_ID_RGB
> should be used. Fix this is leds-class-multicolor binding.
>
> After we have some usecases for non-RGB multicolor LEDs, this can be
> changed.
>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
> Cc: devicetree@vger.kernel.org
> Cc: robh+dt@kernel.org
> ---
>   .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml     | 4 ++--
>   .../devicetree/bindings/leds/leds-class-multicolor.yaml       | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> index fe7fa25877fd..2015db9b7618 100644
> --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> @@ -73,14 +73,14 @@ examples:
>                    * LEDs.
>                    */
>                   reg = <0>;
> -                color = <LED_COLOR_ID_MULTI>;
> +                color = <LED_COLOR_ID_RGB>;
>                   function = LED_FUNCTION_POWER;
>                   linux,default-trigger = "heartbeat";
>               };
>   
>               multi-led@a {
>                   reg = <0xa>;
> -                color = <LED_COLOR_ID_MULTI>;
> +                color = <LED_COLOR_ID_RGB>;
>                   function = LED_FUNCTION_INDICATOR;
>                   function-enumerator = <1>;
>               };
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> index b1a53f054b89..9faa3609a6bb 100644
> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml

Why are you resubmitting the multicolor.yaml?

https://lore.kernel.org/patchwork/patch/1320863/

This is waiting on DT review.

Dan

