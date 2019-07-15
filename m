Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D4169B04
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 20:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbfGOSxJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 14:53:09 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34114 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729513AbfGOSxJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 14:53:09 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FIr0mh012362;
        Mon, 15 Jul 2019 13:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563216780;
        bh=maWJWUl3/uh4gzm/FxDXx4PW89IhYMuhbL/zvUUoXWA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MtPb6GlBSpe/QC6shP6MUsTHoj6yXZcQR8AF9vYp/Dhf4oN9RO0dHNKnHfGYLyLhd
         Grqo55U7QHukjPhAZa8GjuuRsMAhatqeBfUa1r3mK99MR/xnd7QJhw5S14Bibx0gOe
         kllcKbmwoEiXmp1QsipejvErZ9/QQQAQXsRZa7UQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FIr0TA077200
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jul 2019 13:53:00 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 15
 Jul 2019 13:53:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 15 Jul 2019 13:53:00 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FIqxE1072403;
        Mon, 15 Jul 2019 13:52:59 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: document the "power-supply"
 property
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-2-jjhiblot@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f0dcce32-2bc0-5106-9bd7-27df699bbf06@ti.com>
Date:   Mon, 15 Jul 2019 13:52:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190715155657.22976-2-jjhiblot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

JJ

On 7/15/19 10:56 AM, Jean-Jacques Hiblot wrote:
> Most of the LEDs are powered by a voltage/current regulator. Describing it
> in the device-tree makes it possible for the LED core to enable/disable it
> when needed.
>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   Documentation/devicetree/bindings/leds/common.txt | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 70876ac11367..539e124b1457 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -61,6 +61,11 @@ Optional properties for child nodes:
>   - panic-indicator : This property specifies that the LED should be used,
>   		    if at all possible, as a panic indicator.
>   
> +- power-supply : A voltage/current regulator used to to power the LED. When a
Is the phandle to a voltage/current regulator used to to power the LED
> +		 LED is turned off, the LED core disable its regulator. The
The regulator is only disabled if it is the only consumer and/or the 
number of users = 0.
> +		 same regulator can power many LED (or other) devices. It is
> +		 turned off only when all of its users disabled it.
> +
>   - trigger-sources : List of devices which should be used as a source triggering
>   		    this LED activity. Some LEDs can be related to a specific
>   		    device and should somehow indicate its state. E.g. USB 2.0
> @@ -106,6 +111,7 @@ gpio-leds {
>   		label = "Status";
>   		linux,default-trigger = "heartbeat";
>   		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&led_regulator>;
>   	};
>   
>   	usb {


Reviewed-by: Dan Murphy <dmurphy@ti.com>

