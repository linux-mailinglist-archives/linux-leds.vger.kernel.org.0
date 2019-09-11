Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1C6B04A1
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 21:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbfIKTsd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 15:48:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43770 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbfIKTsd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 15:48:33 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BJmLVg031853;
        Wed, 11 Sep 2019 14:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568231301;
        bh=nKoZLB6PEtcgZ07/0sfba0JHjiqQziRn0jjgpDBPRG0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=L7t+ayxfgCbmb2dCj1f5AiqViJuQZWN0hVHyCgkWI1KZZf6ru8OIFN5EpFWG/WVDo
         atpdOGdJNkefJRaIZJycxSrqxJRB7gkNjwm73tLIXCLQQLkv9YHFI7bkC6wSO+8qAm
         pAmetqU6flLxYgWH/Aox2gt/kju5/WFEm+wAWSq0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BJmLGK007592
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Sep 2019 14:48:21 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 14:48:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 14:48:20 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BJmKTO079163;
        Wed, 11 Sep 2019 14:48:20 -0500
Subject: Re: [PATCH v7 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
CC:     Rob Herring <robh@kernel.org>
References: <20190909071632.14392-1-oleg@kaa.org.ua>
 <20190909071632.14392-2-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0a24cdf0-4915-ff59-482d-d25def25d65f@ti.com>
Date:   Wed, 11 Sep 2019 14:48:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909071632.14392-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 9/9/19 2:16 AM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 54 +++++++++++++++++++
>   1 file changed, 54 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..c00e1b55db97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,54 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in
> +coffee vending machines produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +- reg :
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt

FYI this binding Documentation/devicetree/bindings/spi/spi-bus.txt 
points to spi-controller.yaml binding

so maybe update it to the correct binding.

> +- spi-max-frequency : (optional)
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
Your driver does not read spi-max-frequency, this is a property of the 
spi driver so I am not sure you

need to mention that here unless this property needs to be set 
specifically for this device.  If it does then it is not optional

for this device and it should be documented what the max freq is.

> +
> +Optional LED sub-node properties:
> +- function:
> +	see Documentation/devicetree/bindings/leds/common.txt

You point the user to the common file but you use hard coded function 
names in the example.

The leds/common.txt file points to the include/dt-bindings/leds/common.h 
file and the binding says

"If there is no matching LED_FUNCTION available, add a new one."

Now I know we don't want to add the pipe, screen or vend so you probably 
do not want to have the user

going to that header.

Not sure how to fix this but the documentation is misleading. Jacek?


> +- color:
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- label:
> +	see Documentation/devicetree/bindings/leds/common.txt (deprecated)

Not sure if someone asked for this here but since this is a new driver 
it should not even speak of the "label" property.

Dan

<snip>

