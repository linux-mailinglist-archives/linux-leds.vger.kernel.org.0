Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA85229D3D
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 18:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgGVQkc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 12:40:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42748 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgGVQkb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 12:40:31 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06MGeJe7034005;
        Wed, 22 Jul 2020 11:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595436019;
        bh=a29bGufVvXPvtLlgK5gj/gkb3/Q+mlX4p6BFo+XBga8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SHGMwgcisV5ug8hmXyKqD4ZzQDV2i2xYz9GXz31IdyNYM0W9/M32qi3mfIu0Gyq0C
         +dp6pPD3uOLbUfBDCL8mIGh7vjaTQ+tVTjqkt098hOkOr1kYL/r4vKq8fIonhGWArU
         fbmTgcyGW98SOglddI5HISQ4yDjYh+9dUom5kXI0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06MGeJcd126568
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jul 2020 11:40:19 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 22
 Jul 2020 11:40:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 22 Jul 2020 11:40:09 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06MGe8q2107574;
        Wed, 22 Jul 2020 11:40:09 -0500
Subject: Re: [PATCH v31 06/12] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716182007.18389-1-dmurphy@ti.com>
 <20200716182007.18389-7-dmurphy@ti.com> <20200721211135.GE5966@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <a92226e0-4388-722b-7447-c9d3d3222e0f@ti.com>
Date:   Wed, 22 Jul 2020 11:40:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721211135.GE5966@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/21/20 4:11 PM, Pavel Machek wrote:
> Hi!
>
>> Add multicolor framework support for the lp55xx family.
>>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Applied 4,5,6 and 8,9.
>
>>   config LEDS_LP55XX_COMMON
>>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>> -	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>> +	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
>> +	depends on OF
>>   	select FW_LOADER
>>   	select FW_LOADER_USER_HELPER
> But I have to ask: what does this do to userland interface once
> LEDS_CLASS_MULTICOLOR is enabled?
If the DT is instrumented with MC FW properties there will be a change 
to the user land interface.  If the properties follow the LED properties 
then there should be no change to the userland interface.  See the DT 
and user interface examples below.  So the n900 should see no delta in 
the lighting since it has the LED properties and not the MC FW 
properties.  I hope this answers your question.
> Will users see some changes? Will they see some changes after dts
> parts are applied?

In my testing I did not see any delta in the user interface.  I tested 
with both MC FW and non-MC FW properties on the LP5523 evm.

So the legacy DT's should not be affected and should work as is. The DT 
patches were to make the DT's compliant with the updated bindings.

Only the u8500 defconfig patch needs to be added or the u8500_defconfig 
will break in compilation so we need that patch as well.

DTS changes not applied

With multicolor framework properties in the DT

ls
beaglebone:green:heartbeat  beaglebone:green:usr2 lp5523:channel1
beaglebone:green:mmc0       beaglebone:green:usr3 lp5523:channel5

         chan5 {
             color = <LED_COLOR_ID_WHITE>;
             chan-name = "lp5523:channel5";
             reg = <0x5>;
             led-cur = /bits/ 8 <50>;
             max-cur = /bits/ 8 <100>;
         };

         multi-led@0 {
             #address-cells = <1>;
             #size-cells = <0>;
             reg = <0>;
             color = <LED_COLOR_ID_MULTI>;
             function = LED_FUNCTION_STANDBY;
             linux,default-trigger = "heartbeat";

             led@0 {
                 led-cur = /bits/ 8 <50>;
                 max-cur = /bits/ 8 <100>;
                 reg = <0x0>;
                 color = <LED_COLOR_ID_GREEN>;
             };

             led@1 {
                 led-cur = /bits/ 8 <50>;
                 max-cur = /bits/ 8 <100>;
                 reg = <0x1>;
                 color = <LED_COLOR_ID_BLUE>;
             };

             led@6 {
                 led-cur = /bits/ 8 <50>;
                 max-cur = /bits/ 8 <100>;
                 reg = <0x6>;
                 color = <LED_COLOR_ID_RED>;
             };
         };


lp5523:channel5# ls

brightness      device          led_current     max_brightness 
max_current     power           subsystem       trigger uevent

ls lp5523\:channel1
brightness       device           max_brightness multi_index      
multi_intensity  power subsystem        trigger          uevent

Without MC FW DT properties

And as individual LEDs as the DTs are populated today.

ls
beaglebone:green:heartbeat  beaglebone:green:usr2 lp5523:channel0 
lp5523:channel5
beaglebone:green:mmc0       beaglebone:green:usr3 
lp5523:channel2             lp5523:channel6

         chan0 {
             color = <LED_COLOR_ID_GREEN>;
             chan-name = "lp5523:channel0";
             reg = <0x0>;
             led-cur = /bits/ 8 <50>;
             max-cur = /bits/ 8 <100>;
         };
         chan7 {
             color = <LED_COLOR_ID_RED>;
             chan-name = "lp5523:channel6";
             reg = <0x6>;
             led-cur = /bits/ 8 <50>;
             max-cur = /bits/ 8 <100>;
         };
         chan2 {
             color = <LED_COLOR_ID_BLUE>;
             chan-name = "lp5523:channel2";
             reg = <0x1>;
             led-cur = /bits/ 8 <50>;
             max-cur = /bits/ 8 <100>;
         };

         chan5 {
             color = <LED_COLOR_ID_WHITE>;
             chan-name = "lp5523:channel5";
             reg = <0x5>;
             led-cur = /bits/ 8 <50>;
             max-cur = /bits/ 8 <100>;
         };


Dan

