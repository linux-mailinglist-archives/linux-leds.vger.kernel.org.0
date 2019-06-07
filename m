Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4221B3968F
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2019 22:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbfFGUOM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Jun 2019 16:14:12 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38890 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729353AbfFGUOM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Jun 2019 16:14:12 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x57KE9jC046632;
        Fri, 7 Jun 2019 15:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559938449;
        bh=g7+aeGA2r9yVXb2YEmakVu1tDnIejQAlfgI3jaZiAjM=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=eutaGVSQ6Qos5+YdVfv876+GoRJYmGPxz39/pDUkn2CjMrvLYBfPOa+3zEsPxWhpb
         y5zmys0XTl1WiCIj/qi9F53CvkuP+zO4TjBmpZ6XvMFrnfOjLxvVmpkeui7uDn9Hgf
         Hu57tD5+egUjJyK6ecPtQ2mPa+8OutUNezBBKu1k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x57KE9ZH001423
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 Jun 2019 15:14:09 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 15:14:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 15:14:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x57KE8bV050562;
        Fri, 7 Jun 2019 15:14:08 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20190607184022.13793-1-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
Date:   Fri, 7 Jun 2019 15:14:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607184022.13793-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/7/19 1:40 PM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 53 +++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..457fd8d7226f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,53 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in coffee vending machines
> +produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +- reg :
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
> +- spi-max-frequency : (optional)
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +LED sub-node properties:
> +- label :
> +	see Documentation/devicetree/bindings/leds/common.txt

Add this

Optional LED sub-node properties:

And remove (optional) from the below.

> +- linux,default-trigger : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- max-brightness : (optional)
> +	Specify here 2 if LED has special effect. Effects by LED type:

s/Specify here 2/Specify 2

But this is not really max_brightness now this is a feature and now does 
not make sense in this context

You may need to use something different for this property or expose a 
file in the driver.


> +	- Pipe has leaking
> +	- Screen Frame has blinking
> +
> +Example
> +-------
> +
> +led-controller@0 {
> +	compatible = "crane,el15203000";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* water pipe */
> +	pipe@50 {
> +		reg = <0x50>;
> +		label = "red:pipe";
> +		max-brightness = <2>;
> +	};
> +
> +	/* screen frame */
> +	screen@53 {
> +		reg = <0x53>;
> +		label = "red:screen";
> +		max-brightness = <2>;
> +	};
> +
> +	/* vending area */
> +	vend@56 {
> +		reg = <0x56>;
> +		label = "red:vend";
> +	};
> +};
