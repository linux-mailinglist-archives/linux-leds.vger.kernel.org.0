Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4555CE2A
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jul 2019 13:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGBLMQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Jul 2019 07:12:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55336 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfGBLMQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Jul 2019 07:12:16 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62BC2JS031649;
        Tue, 2 Jul 2019 06:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562065922;
        bh=+qyv7XjsTOTtMSTv+FRGxorhXPdAQbJcT2AcWylw+us=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KruCJmk6gwyvYxozPk/DrvwPNdrPFVBJUrxJvlr5ydC5nzONpEzDIh1dFUS0Zhvg6
         RaGzAypyplCy7u3VbGSE0ErOegEMJeg87pH1H0BryahZxqxZbaUA0PEM1feNfRTfiJ
         GfVck1+oeXvIFlA/V7m2jnH1QYBf7dXvBp5TsFZk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62BC2Y0014936
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 2 Jul 2019 06:12:02 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 06:12:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 06:12:01 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62BBxcv094660;
        Tue, 2 Jul 2019 06:11:59 -0500
Subject: Re: [PATCH 4/4] devicetree: Add led-backlight binding
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <jingoohan1@gmail.com>, <dmurphy@ti.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ti.com>,
        <devicetree@vger.kernel.org>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-5-jjhiblot@ti.com>
 <20190702095849.fxlmiqcioihsi3zk@holly.lan>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <0a2c7f84-ea1f-cab2-c812-b5cefed1f517@ti.com>
Date:   Tue, 2 Jul 2019 13:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702095849.fxlmiqcioihsi3zk@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Daniel,

On 02/07/2019 11:58, Daniel Thompson wrote:
> On Mon, Jul 01, 2019 at 05:14:23PM +0200, Jean-Jacques Hiblot wrote:
>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> Add DT binding for led-backlight.
> I think the patchset is in the wrong order; the DT bindings
> documentation should appear *before* the binding is
> implemented (amoung other things this prevent transient checkpatch
> warnings as the patchset is applied).
>
ok
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> Cc: devicetree@vger.kernel.org
>> ---
>>   .../video/backlight/led-backlight.txt         | 39 +++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/video/backlight/led-backlight.txt
>>
>> diff --git a/Documentation/devicetree/bindings/video/backlight/led-backlight.txt b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
>> new file mode 100644
>> index 000000000000..216cd52d624a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/video/backlight/led-backlight.txt
>> @@ -0,0 +1,39 @@
>> +led-backlight bindings
>> +
>> +The node of the backlight driver IS the node of the LED.
>> +
>> +Required properties:
>> +  - compatible: "led-backlight"
>> +  - brightness-levels: Array of distinct LED brightness levels. These
>> +      are in the range from 0 to 255, passed to the LED class driver.
>> +  - default-brightness-level: the default brightness level (index into the
>> +      array defined by the "brightness-levels" property)
> I think brightness-levels and default-brightness-level could be
> optional properties since a default 1:1 mapping seems reasonable given
> how constrained the LED brightness values are.

That is probably a good idea. Expect it in v2

Thanks,

JJ

>
>
> Daniel.
>
>
>> +
>> +Optional properties:
>> +  - power-supply: regulator for supply voltage
>> +  - enable-gpios: contains a single GPIO specifier for the GPIO which enables
>> +                  and disables the backlight (see GPIO binding[0])
>> +
>> +[0]: Documentation/devicetree/bindings/gpio/gpio.txt
>> +
>> +Example:
>> +
>> +led_ctrl {
>> +	red_led@1 {
>> +	        label = "red";
>> +		reg = <1>;
>> +	}
>> +
>> +	backlight_led@2 {
>> +		function = LED_FUNCTION_BACKLIGHT;
>> +		reg = <2>;
>> +
>> +		compatible = "led-backlight";
>> +
>> +		brightness-levels = <0 4 8 16 32 64 128 255>;
>> +		default-brightness-level = <6>;
>> +
>> +		power-supply = <&vdd_bl_reg>;
>> +		enable-gpios = <&gpio 58 0>;
>> +	};
>> +};
>> -- 
>> 2.17.1
>>
