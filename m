Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4969264457
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2019 11:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfGJJ0W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jul 2019 05:26:22 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33278 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfGJJ0W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jul 2019 05:26:22 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6A9QGjg055921;
        Wed, 10 Jul 2019 04:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562750776;
        bh=ZvmY/XWFNUdc+S/ieVtnXAaglk7WibX4sxJZnd5qsUo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=usyAtY1WsfSioj5vs361bb43UQQiJNlhcknsVvT5FwVmgC3E2GdVNxnmmcz9vQmBb
         9svFJVX393zPupBxfQkV2hXAyv0gU5vi+hBVYpnkn+PY7np259jN/AoInrMdz68Zqw
         gBBuFpAz3nRRkUIlZHIlkkopFOVnaNRlJs4nSZ9A=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6A9QGUJ095450
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 10 Jul 2019 04:26:16 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 10
 Jul 2019 04:26:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 10 Jul 2019 04:26:16 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6A9QE58002375;
        Wed, 10 Jul 2019 04:26:15 -0500
Subject: Re: devicetree bindings for a generic led-based backlight driver
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <robh@kernel.org>, "Valkeinen, Tomi" <tomi.valkeinen@ti.com>
References: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
 <400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com>
 <283a3b7c-c3ed-719e-14e3-fc73e08af880@ti.com>
 <e7c5a500-4107-8895-d0fc-377c71cd3b34@gmail.com> <20190706151941.GB9856@amd>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <616bb9bb-4518-3d25-cafe-afccd23d1070@ti.com>
Date:   Wed, 10 Jul 2019 11:26:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190706151941.GB9856@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel

On 06/07/2019 17:19, Pavel Machek wrote:
> Hi!
>
>>>>> A few years ago (2015), Tomi Valkeinen posted a series implementing a
>>>>> backlight driver on top of a LED device.
>>>>>
>>>>> https://patchwork.kernel.org/patch/7293991/
>>>>> https://patchwork.kernel.org/patch/7294001/
>>>>> https://patchwork.kernel.org/patch/7293981/
>>>>>
>>>>> The discussion stopped  because he lacked the time to work on it.
>>>>>
>>>>> I will be taking over the task and, before heading in the wrong
>>>>> direction, wanted a confirmation that the binding Tomi last proposed in
>>>>> hist last email was indeed the preferred option.
>>>>>
>>>>> It will probably require some modifications in the LED core to create
>>>>> the right kind of led-device (normal, flash or backlight) based on the
>>>>> compatible option.
>>>> I recall that discussion. I gave my ack for the LED changes but
>>>> now we have more LED people that might want to look into that.
>>> Regarding the LED bindings as discussed by Tom and Rob in
>>> https://patchwork.kernel.org/patch/7293991/, what do you think of using
>>> a 'compatible' string to make a LED device also a backlight or a flash LED ?
>> After going through the referenced discussion and refreshing my memory
>> it looks to me the most reasonable way to go for backlight case.
>>
>> Nevertheless I'd not tamper at LED flash support - if it's not broken,
>> don't fix it.
>>
>> Best regards,
>> Jacek Anaszewski
>>
>>> Here is the example from Tomi at the end of the discussion:
>>>
>>> /* tlc59108 is an i2c device */
>>> tlc59116@40 {
>>> 	#address-cells = <1>;
>>> 	#size-cells = <0>;
>>> 	compatible = "ti,tlc59108";
>>> 	reg = <0x40>;
>>>
>>> 	wan@0 {
>>> 		label = "wrt1900ac:amber:wan";
>>> 		reg = <0x0>;
>>> 	};
>>>
>>> 	bl@2 {
>>> 		label = "backlight";
>>> 		reg = <0x2>;
>>>
>>> 		compatible = "led-backlight";
>>> 		brightness-levels = <0 243 245 247 248 249 251 252 255>;
>>> 		default-brightness-level = <8>;
>>>
>>> 		enable-gpios = <&pcf_lcd 13 GPIO_ACTIVE_LOW>;
> So... this needs some kind of reference to display it belongs to,
> right?

This is the reverse. The display uses a reference the backlight.

JJ

>
> 									Pavel
>
