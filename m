Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD0816C194
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2020 14:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbgBYNCO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Feb 2020 08:02:14 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42012 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbgBYNCO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Feb 2020 08:02:14 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PD1pN4052659;
        Tue, 25 Feb 2020 07:01:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582635711;
        bh=oXx7cuB8ADrmQ3vOUgyN9ou7IhxwTR3y4ztgLQsmi6c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ByaN7ylnnHP1DrKCw/8xkcyNg8CLYK2IQXegD0Klr8ETbKC/0oU1LFFJX/9mGFS3J
         Q5rQVBPXdvAcP5/RWgJTkIm/J4D0StamwNuvv6JfSWV/5G0qrZSeXfUuO3pHk30T/8
         ZsbbhuU1ABVMArXDiDH//ZijNO9MIHEgTEpkFhZg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PD1pB2107735
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Feb 2020 07:01:51 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 07:01:50 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 07:01:50 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01PD1o78075900;
        Tue, 25 Feb 2020 07:01:50 -0600
Subject: Re: [PATCH 3/4] ARM: dts: axp813: Add charger LED
To:     Ondrej Jirman <megous@megous.com>, <linux-sunxi@googlegroups.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200223131435.681620-1-megous@megous.com>
 <20200223131435.681620-4-megous@megous.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3d7c078b-362d-6eab-0915-8079768a729e@ti.com>
Date:   Tue, 25 Feb 2020 06:56:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200223131435.681620-4-megous@megous.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Ondrej

On 2/23/20 7:14 AM, Ondrej Jirman wrote:
> PMIC supports charging status indication via a LED. Add support
> for it.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>   arch/arm/boot/dts/axp81x.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/axp81x.dtsi b/arch/arm/boot/dts/axp81x.dtsi
> index 1dfeeceabf4c3..00b092f94433d 100644
> --- a/arch/arm/boot/dts/axp81x.dtsi
> +++ b/arch/arm/boot/dts/axp81x.dtsi
> @@ -175,4 +175,9 @@ reg_drivevbus: drivevbus {
>   	usb_power_supply: usb-power-supply {
>   		compatible = "x-powers,axp813-usb-power-supply";
>   	};
> +
> +	charger_led: charger-led {
> +		compatible = "x-powers,axp813-charger-led";
> +		status = "disabled";

As I commented before you need to add function and color to this node 
and read it from the driver.  Or you can add them to the over ride for 
the specific use case.

Another question is is this LED only used for charging or can it be 
multi purpose?

Dan


> +	};
>   };
