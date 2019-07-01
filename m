Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACC55BFA4
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfGAPVd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:21:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50282 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfGAPVd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:21:33 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FLPgv080598;
        Mon, 1 Jul 2019 10:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561994485;
        bh=auzATPVyNKdOnTHoDAScy5Y6lvxrhGQU3UFJL70OEVY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=L/M6Ab2fDX4e9H3F84f3eLLiimlHMgKCY3PzYN1zgwNPWL7DSX+G/RkCOE5ayc/0f
         hCTOtBLBE91AzP8PJQFclbU4OaVFmPP030NXFx4SRHnXnNU5BQUbgAMAcdm+t+nJ4I
         RBNtJKDHyo3HF0BIGWgMNnxqvB0QfdZv7MGHakcY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FLPTr063483
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:21:25 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:21:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:21:25 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FLOJ7014304;
        Mon, 1 Jul 2019 10:21:24 -0500
Subject: Re: [PATCH 2/4] devicetree: Update led binding
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ti.com>,
        <devicetree@vger.kernel.org>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-3-jjhiblot@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <837afe49-18f3-722e-aa63-7d47d3a8bea0@ti.com>
Date:   Mon, 1 Jul 2019 10:20:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701151423.30768-3-jjhiblot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

JJ

On 7/1/19 10:14 AM, Jean-Jacques Hiblot wrote:
> Update the led binding to describe the possibility to add a "compatible"
> option to create a child-device, user of the LED.
>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Cc: devicetree@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/leds/common.txt | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 70876ac11367..2f7882528d97 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -11,6 +11,9 @@ have to be tightly coupled with the LED device binding. They are represented
>   by child nodes of the parent LED device binding.
>   
>   Optional properties for child nodes:
> +- compatible : driver name for a child-device. This child-device is the user
> +               of the LED. It is created when the LED is registered and
> +	       destroyed when the LED is unregistered.

Can you update the example to show usage?

Dan


>   - led-sources : List of device current outputs the LED is connected to. The
>   		outputs are identified by the numbers that must be defined
>   		in the LED device binding documentation.
