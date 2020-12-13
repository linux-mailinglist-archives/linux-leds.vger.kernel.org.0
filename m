Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14DD2D8B0D
	for <lists+linux-leds@lfdr.de>; Sun, 13 Dec 2020 04:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgLMDEK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 12 Dec 2020 22:04:10 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9433 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgLMDEK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Dec 2020 22:04:10 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ctq8L1HLrzhp8w;
        Sun, 13 Dec 2020 11:02:58 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Sun, 13 Dec 2020
 11:03:23 +0800
Subject: Re: [PATCH v2] dt-bindings: leds: Document commonly used LED triggers
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20201210082449.30586-1-manivannan.sadhasivam@linaro.org>
 <ba1d261c-3ce9-1511-2677-29274f5ee170@huawei.com>
Message-ID: <d0f81c59-384e-482d-ff1d-6bea55792589@huawei.com>
Date:   Sun, 13 Dec 2020 11:03:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ba1d261c-3ce9-1511-2677-29274f5ee170@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2020/12/13 10:39, Leizhen (ThunderTown) wrote:
> 
> 
> On 2020/12/10 16:24, Manivannan Sadhasivam wrote:
>> This commit documents the LED triggers used commonly in the SoCs. Not
>> all triggers are documented as some of them are very application specific.
>> Most of the triggers documented here are currently used in devicetrees
>> of many SoCs.
>>
>> While at it, let's also sort the triggers in ascending order.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
>>
>> Changes in v2:
>>
>> * Added more triggers, fixed the regex
>> * Sorted triggers in ascending order
>>
>>  .../devicetree/bindings/leds/common.yaml      | 78 ++++++++++++++-----
>>  1 file changed, 60 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
>> index f1211e7045f1..3c2e2208c1da 100644
>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
>> @@ -79,24 +79,66 @@ properties:
>>        the LED.
>>      $ref: /schemas/types.yaml#definitions/string
>>  
>> -    enum:
>> -        # LED will act as a back-light, controlled by the framebuffer system
>> -      - backlight
>> -        # LED will turn on (but for leds-gpio see "default-state" property in
>> -        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
>> -      - default-on
>> -        # LED "double" flashes at a load average based rate
>> -      - heartbeat
>> -        # LED indicates disk activity
>> -      - disk-activity
>> -        # LED indicates IDE disk activity (deprecated), in new implementations
>> -        # use "disk-activity"
>> -      - ide-disk
>> -        # LED flashes at a fixed, configurable rate
>> -      - timer
>> -        # LED alters the brightness for the specified duration with one software
>> -        # timer (requires "led-pattern" property)
>> -      - pattern
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +                # LED indicates mic mute state
>> +              - audio-micmute
>> +                # LED indicates audio mute state
>> +              - audio-mute
>> +                # LED will act as a back-light, controlled by the framebuffer system
>> +              - backlight
>> +                # LED indicates bluetooth power state
>> +              - bluetooth-power
>> +                # LED indicates activity of all CPUs
>> +              - cpu
>> +                # LED will turn on (but for leds-gpio see "default-state" property in
>> +                # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
>> +              - default-on
>> +                # LED indicates disk activity
>> +              - disk-activity
>> +                # LED indicates disk read activity
>> +              - disk-read
>> +                # LED indicates disk write activity
>> +              - disk-write
>> +                # LED indicates camera flash state
>> +              - flash
>> +                # LED "double" flashes at a load average based rate
>> +              - heartbeat
>> +                # LED indicates IDE disk activity (deprecated), in new implementations
>> +                # use "disk-activity"
>> +              - ide-disk
>> +                # LED indicates MTD memory activity
>> +              - mtd
>> +                # LED indicates NAND memory activity (deprecated),
>> +                # in new implementations use "mtd"
>> +              - nand-disk
>> +                # No trigger assigned to the LED. This is the default mode
>> +                # if trigger is absent
>> +              - none
>> +                # LED alters the brightness for the specified duration with one software
>> +                # timer (requires "led-pattern" property)
>> +              - pattern
>> +                # LED flashes at a fixed, configurable rate
>> +              - timer
>> +                # LED indicates camera torch state
>> +              - torch
>> +                # LED indicates USB gadget activity
>> +              - usb-gadget
>> +                # LED indicates USB host activity
>> +              - usb-host
>> +      - items:
>> +            # LED indicates activity of [N]th CPU
>> +          - pattern: "^cpu[0-9]{1,2}$"
>> +      - items:
>> +            # LED indicates power status of [N]th Bluetooth HCI device
>> +          - pattern: "^hci[0-9]{1,2}-power$"
>> +      - items:
>> +            # LED indicates [N]th MMC storage activity
>> +          - pattern: "^mmc[0-9]{1,2}$"
>> +      - items:
>> +            # LED indicates [N]th WLAN Tx activity
>> +          - pattern: "^phy[0-9]{1,2}tx$"
> 
> Only the last three are not listed:
> phy0rx
> ir-power-click
> ir-user-click

I don't know if you're familiar with these two triggers. You can also
consider leaving it to the owner of the corresponding module to update.
Because I just found out there are a lot of unlisted triggers on arm32.

> 
> And the first one is easily supported by:
> -            # LED indicates [N]th WLAN Tx activity
> -          - pattern: "^phy[0-9]{1,2}tx$"
> +            # LED indicates [N]th WLAN Tx/Rx activity
> +          - pattern: "^phy[0-9]{1,2}(tx|rx)$"
> 
> Tested-by: Zhen Lei <thunder.leizhen@huawei.com>
> 
>>  
>>    led-pattern:
>>      description: |
>>

