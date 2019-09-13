Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8982AB2139
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 15:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388660AbfIMNkP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Sep 2019 09:40:15 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39692 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388387AbfIMNkP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 Sep 2019 09:40:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDe31N093564;
        Fri, 13 Sep 2019 08:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568382003;
        bh=ldc8bRuJW6suj9VyoKG032Ggvs3Aq8qox4KKZIWG/ig=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=awpl12YtduZNMzg7qa2vMVB8+3UKEZgH6s4pRgu+k8FTJN9Annguob4Z/Ava8AF4V
         Mdmzks+nvvZjfBTLS+QZAO35qDzp1gNMtg0MuJv+63aKFNiVG+Kg/crShUGcijyigT
         RECbL76HwVjPQ8NH0lL2kMnMbkk/bHenicNueKww=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDe3ia053313
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Sep 2019 08:40:03 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 08:40:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 08:40:02 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DDe2dj011627;
        Fri, 13 Sep 2019 08:40:02 -0500
Subject: Re: [PATCH v8 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
References: <20190912221115.23595-1-oleg@kaa.org.ua>
 <20190912221115.23595-2-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7af9f38e-bf5e-97fc-fd49-87fd8b8c98a6@ti.com>
Date:   Fri, 13 Sep 2019 08:40:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912221115.23595-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 9/12/19 5:11 PM, Oleh Kravchenko wrote:
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
> index 000000000000..d74b492d28b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,53 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in
> +coffee vending machines produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +
> +Property rules described in
> +Documentation/devicetree/bindings/spi/spi-controller.yaml is apply.

Not sure what this statement means


> +In particular, "reg" and "spi-max-frequency" properties must be given.
> +50KHz is very well tested value for spi-max-frequency.
> +
> +Optional LED sub-node properties:
> +- function:
> +	see Documentation/devicetree/bindings/leds/common.txt

This was not fixed per v7 comments

Where is the "reg" property definition for the LED child node?

What is the 0x50,0x53 and 0x56 mean? Are there any other values?

Dan

<snip>

