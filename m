Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A39C16752A
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2019 20:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbfGLSjI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Jul 2019 14:39:08 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36850 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfGLSjI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Jul 2019 14:39:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6CIcwZq015255;
        Fri, 12 Jul 2019 13:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562956738;
        bh=qoKT170R6U+xejiy045waJJnY7mObDoDXmCpVbDWlxU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IvWP7LKWUo/msn1Nf+yf/zMbneTgvg+6CLwE1sCOQdGFJtWl5L7kgspohdLbyA/RF
         T2Ul1BJC3Z67GZax/DwW2PogmdN/9zAin0U5vFtfsnSypj4kHS9y6AVA6VdY8DMjlK
         nUscF5Nw3fGj6IItwkAW85rmT6dzmCEzXMN6+6lk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6CIcwFb052967
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Jul 2019 13:38:58 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Jul 2019 13:38:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Jul 2019 13:38:57 -0500
Received: from [128.247.59.136] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6CIcvj9030014;
        Fri, 12 Jul 2019 13:38:57 -0500
Subject: Re: [PATCH 2/2] dt-bindings: leds: document new "power-supply"
 property
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-3-jjhiblot@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <cd233d13-b4dd-1c4f-235e-d63cebab6f4f@ti.com>
Date:   Fri, 12 Jul 2019 13:38:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190708103547.23528-3-jjhiblot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

JJ

On 7/8/19 5:35 AM, Jean-Jacques Hiblot wrote:
> Most of the LEDs are powered by a voltage/current regulator. describing in
> the device-tree makes it possible for the LED core to enable/disable it
> when needed.

This should be patch 1.


> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   Documentation/devicetree/bindings/leds/common.txt | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 70876ac11367..e093a2b7eb90 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -61,6 +61,11 @@ Optional properties for child nodes:
>   - panic-indicator : This property specifies that the LED should be used,
>   		    if at all possible, as a panic indicator.
>   
> +- power-supply : A voltage/current regulator used to to power the LED. When a
> +		 LED is turned off, the LED core disable its regulator. The
> +		 same regulator can power many LED (or other) devices. It is
> +		 turned off only when all of its users disabled it.
> +
>   - trigger-sources : List of devices which should be used as a source triggering
>   		    this LED activity. Some LEDs can be related to a specific
>   		    device and should somehow indicate its state. E.g. USB 2.0


Do you have an example update?

Dan

