Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3345B7AC7
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 15:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390517AbfISNqg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 09:46:36 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37000 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390323AbfISNqg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Sep 2019 09:46:36 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JDkRnV100805;
        Thu, 19 Sep 2019 08:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568900787;
        bh=vGbwM4NbY+he7iaH6paryMD4bbgV3tLQKkI1ZMsbxNk=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=CH8I4cVYQ5OiiVKH+B2TRZQTQy8GJL5/ITI9ukdXjj1SLvISkpR3EXiuZB62Edpfn
         8d0RdvkrWVshPbP+UHXwPm6rprXvgmwsb+xG8xTGJ48PqmWD6MSzbCOEtEA3pIR964
         ZJNbOUfjuD5K62bJtSlTAT+lyEc1AP6wVXFwbhQc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JDkRKN003387
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 08:46:27 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 08:46:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 08:46:26 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JDkQ8T115113;
        Thu, 19 Sep 2019 08:46:26 -0500
Subject: Re: [PATCH v11 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
References: <20190919125313.24081-1-oleg@kaa.org.ua>
 <20190919125313.24081-2-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <76f24ad8-a375-45f8-a1e1-f9e90bcbc95d@ti.com>
Date:   Thu, 19 Sep 2019 08:49:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919125313.24081-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 9/19/19 7:53 AM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 69 +++++++++++++++++++
>   1 file changed, 69 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..1bcd341967f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,69 @@
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
> +
> +Example
> +-------
> +
> +#include <dt-bindings/leds/common.h>
> +
> +led-controller@0 {
> +	compatible = "crane,el15203000";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* water pipe */
> +	led@50 {
> +		reg = <0x50>;
> +		function = "pipe";
> +		color = <LED_COLOR_ID_RED>;
> +	};
> +
> +	/* screen frame */
> +	led@53 {
> +		reg = <0x53>;
> +		function = "screen";
> +		color = <LED_COLOR_ID_RED>;
> +	};
> +
> +	/* vending area */
> +	led@56 {
> +		reg = <0x56>;
> +		function = "vend";
> +		color = <LED_COLOR_ID_RED>;
> +	};
> +};
