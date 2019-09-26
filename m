Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2421BF239
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 13:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfIZLzb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 07:55:31 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54916 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfIZLzb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 07:55:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QBtIeS021284;
        Thu, 26 Sep 2019 06:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569498918;
        bh=NKFr6hD35gJTr3EyHv50PbXW9p7fYtL6VKuWvp+Wvv4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JHx+KGK9LpH3ziO+qu9fLQhYNsFynBYsNhja7nOsldF0S9VW/RJi3qFhRscRyrm0z
         KW+3OXDoI6B6AUmz2kbFiuQ42p+BBL7Zg20IJLXXTnHQdQphfMKv/tSpR8UGHoPcn/
         E6HDFwoq5LUuM1isYRZNGdatTVbTWjH/WHft+OMo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QBtId8040293;
        Thu, 26 Sep 2019 06:55:18 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 06:55:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 06:55:10 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QBtHBN001844;
        Thu, 26 Sep 2019 06:55:17 -0500
Subject: Re: [PATCH v9 09/15] dt: bindings: lp55xx: Update binding for
 Multicolor Framework
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-10-dmurphy@ti.com>
 <ef02eafd-d1d9-da3f-4f52-cd159c7960d9@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <073d1dc0-d181-59f2-6e0f-e5461e4a2b9e@ti.com>
Date:   Thu, 26 Sep 2019 07:00:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ef02eafd-d1d9-da3f-4f52-cd159c7960d9@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/25/19 4:34 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/25/19 7:46 PM, Dan Murphy wrote:
>> Update the DT binding to include the properties to use the
>> multicolor framework for the devices that use the LP55xx
>> framework.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> CC: Tony Lindgren <tony@atomide.com>
>> CC: "Benoît Cousson" <bcousson@baylibre.com>
>> CC: Linus Walleij <linus.walleij@linaro.org>
>> CC: Shawn Guo <shawnguo@kernel.org>
>> CC: Sascha Hauer <s.hauer@pengutronix.de>
>> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
>> CC: Fabio Estevam <festevam@gmail.com>
>> CC: NXP Linux Team <linux-imx@nxp.com>
>> ---
>>   .../devicetree/bindings/leds/leds-lp55xx.txt  | 99 +++++++++++++++++++
>>   1 file changed, 99 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> index bfe2805c5534..c120d2bde3bd 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> @@ -1,6 +1,8 @@
>>   Binding for TI/National Semiconductor LP55xx LED Drivers
>>   
>>   Required properties:
>> +- #address-cells: 1
>> +- #size-cells: 0
>>   - compatible: one of
>>   	national,lp5521
>>   	national,lp5523
>> @@ -14,6 +16,18 @@ Required properties:
>>   Each child has own specific current settings
>>   - led-cur: Current setting at each LED channel (mA x10, 0 if LED is not connected)
>>   - max-cur: Maximun current at each LED channel.
>> +- reg: Output channel for the LED.  This is zero based channel identifier and
>> +	the data sheet is a one based channel identifier.
>> +	reg value to output to LED output number
>> +	D1 = reg value is 0
>> +	D2 = reg value is 1
>> +	D3 = reg value is 2
>> +	D4 = reg value is 3
>> +	D5 = reg value is 4
>> +	D6 = reg value is 5
>> +	D7 = reg value is 6
>> +	D8 = reg value is 7
>> +	D9 = reg value is 8
>>   
>>   Optional properties:
>>   - enable-gpio: GPIO attached to the chip's enable pin
>> @@ -35,23 +49,28 @@ example 1) LP5521
>>   on channel 0.
>>   
>>   lp5521@32 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>>   	compatible = "national,lp5521";
>>   	reg = <0x32>;
>>   	label = "lp5521_pri";
>>   	clock-mode = /bits/ 8 <2>;
>>   
>>   	chan0 {
> s/chan0/chan@0/
>
> The same applies to the remaining occurrences in this file and to
> the other patches from the patch set as already pointed out.

Ack.  I have made the same change across all the DT patches in this series

Dan


>> +		reg = <0>;
>>   		led-cur = /bits/ 8 <0x2f>;
>>   		max-cur = /bits/ 8 <0x5f>;
>>   		linux,default-trigger = "heartbeat";
>>   	};
>>
