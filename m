Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDC3E38D89
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2019 16:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbfFGOlr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Jun 2019 10:41:47 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57724 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbfFGOlr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Jun 2019 10:41:47 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x57Efgq2040508;
        Fri, 7 Jun 2019 09:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559918502;
        bh=aMcBxYXIJJY0W7zrSKkObZ67Rxob0PfbT87SejzOKfU=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=gS79xXuU89PcGPzrtiIni2OMJhJ3qqKLcfwBu+5fuSHLcp4CkXj+dHBx5tv5zNwgJ
         ZVX5dJFoi1TanigF/c2oaQYtxW2sQp0pXGAHiGNzn9c62Bl6RyZsog6gBdh0pVoVhK
         CSTxIr1bEq0yeJcmrFyTev0j0puorLPw2+/aRb64=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x57Efgs9023632
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 Jun 2019 09:41:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 09:41:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 09:41:41 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x57EffJG113039;
        Fri, 7 Jun 2019 09:41:41 -0500
Subject: Re: [PATCH 1/2] dt-bindings: Add vendor prefix and docs for
 EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20190607114823.3735-1-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0df31c4a-2cd0-89fa-bd78-dc87de3c640b@ti.com>
Date:   Fri, 7 Jun 2019 09:41:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607114823.3735-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/7/19 6:48 AM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..f47ee91cb419
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,48 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in coffee vending machines
> +produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible: "crane,el15203000"
> +
> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +apply. In particular, "reg" and "spi-max-frequency" properties must be given.
> +

Can you please add this instead?

reg : see Documentation/devicetree/bindings/spi/spi-bus.txt

spi-max-frequency : see Documentation/devicetree/bindings/spi/spi-bus.txt


> +LED sub-node properties:
> +- label :
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt
> +

max-brightness?

That appears to be optional

N


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
