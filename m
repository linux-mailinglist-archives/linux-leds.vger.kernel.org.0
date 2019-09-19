Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5130AB78E1
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 14:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390119AbfISMGk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 08:06:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44434 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390109AbfISMGk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Sep 2019 08:06:40 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JC6Vri122162;
        Thu, 19 Sep 2019 07:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568894791;
        bh=Fgg9PI8CGT84V1hXEN2LopExOj2bwZ2mgwiMPsavBVo=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=YvDWraA1R2DKN7uD6O6SIkk4E2Yfd3wN4+rdKIsR6E3Xs4wZlPUZPWf2+/TMiOwO9
         SU2WpJaW2BpT7NKFXg+R9B4W+B7eqY3LurZTBxi1G9URx2gpCZ2PNsmm+I+doowIrb
         VahF0IhK7APR0/vMOGSaB+jLL8msKF/iGyVoKt2c=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JC6VL4010579;
        Thu, 19 Sep 2019 07:06:31 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 07:06:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 07:06:26 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JC6UOC052573;
        Thu, 19 Sep 2019 07:06:30 -0500
Subject: Re: [PATCH v10 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
References: <20190919083518.21569-1-oleg@kaa.org.ua>
 <20190919083518.21569-2-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <bc46d0ac-8519-66ac-5dd7-be169337fdf6@ti.com>
Date:   Thu, 19 Sep 2019 07:09:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919083518.21569-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 9/19/19 3:35 AM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 71 +++++++++++++++++++
>   1 file changed, 71 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..0091cd6d055c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,71 @@
> +Crane Merchandising System - EL15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in
> +coffee vending machines produced by Crane Merchandising Systems.
> +The board manages 3 LEDs and supports predefined blinking patterns
> +for specific leds.
> +
> +Vending area LED encoded with symbol 'V' (hex code 0x56).
> +Doesn't have any hardware blinking pattern.
> +
> +Screen light tube LED which surrounds vending machine screen and
> +encoded with symbol 'S' (hex code 0x53). Supports blinking breathing pattern.
> +
> +Water Pipe LED encoded with symbol 'P' (hex code 0x50) and
> +actually consists from 5 LEDs that exposed by protocol like one LED.
> +Supports next patterns:
> +- cascade pattern
> +- inversed cascade pattern
> +- bounce pattern
> +- inversed bounce pattern
> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +- #address-cells : must be 1
> +- #size-cells : must be 0
> +
> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +apply. In particular, "reg" and "spi-max-frequency" properties must be given.
> +
> +Optional LED sub-node properties:
> +- function:
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- color:
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- label:
> +	see Documentation/devicetree/bindings/leds/common.txt (deprecated)

You missed this in my v7 comments you should remove the label property.

https://www.spinics.net/lists/linux-leds/msg13288.html

Dan


