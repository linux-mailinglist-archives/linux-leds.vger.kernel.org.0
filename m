Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB5B5BB713
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 16:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439867AbfIWOsW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 10:48:22 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52914 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438125AbfIWOsW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 10:48:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NEmJTh109617;
        Mon, 23 Sep 2019 09:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569250099;
        bh=iYcOjzqEGTVwGueUEYMswpOnqInUTE5+rgtEFIIh820=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FrsD/hcHDuSL5k3NL+Kyw1sgySGVlrZVIMkDSwEMjpNg2ikzO7ChCQBMRorxVJQFf
         bgWoeWX+lD3gKx3+TqbTl5uHkAEHdBg+d4VTThe3eRb8qxLESJ3gF8/bbDOYoPuRGf
         eGGwknIpD7gqigRirVno6eCw0jZBArilfWh09drE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NEmJPq079759
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 09:48:19 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 09:48:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 09:48:12 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NEmIPL018557;
        Mon, 23 Sep 2019 09:48:18 -0500
Subject: Re: [PATCH v8 3/9] dt: bindings: Add multicolor class dt bindings
 documention
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-4-dmurphy@ti.com>
 <1326aba6-1f40-f2ee-747f-3b16c008a9e1@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2e1b97f5-fbaf-cc60-c9d3-7235426bef78@ti.com>
Date:   Mon, 23 Sep 2019 09:52:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1326aba6-1f40-f2ee-747f-3b16c008a9e1@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/21/19 7:57 AM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/20/19 7:41 PM, Dan Murphy wrote:
>> Add DT bindings for the LEDs multicolor class framework.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../bindings/leds/leds-class-multicolor.txt   | 95 +++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> new file mode 100644
>> index 000000000000..215d3c90f351
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> @@ -0,0 +1,95 @@
>> +* Multicolor LED properties
>> +
>> +Monochrome LEDs can grouped into LED clusters.  These clusters can provide a
>> +visible output that have a wide range of colors and intensities.
> Here is the same issue as I spotted in a review for the patch 2/9
> from this set:
>
> "
> I'd say it won't be the most frequent use case. We can expect rather
> compound RGB, RGBA[UV] etc. LED elements being connected to iouts of
> multi color LED controllers like LP50xx.
> "
>
> How about:
>
> Bindings for multi color LEDs show how to describe current outputs of
> either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
> etc.) or standalone LEDs, to achieve logically grouped multi-color LED
> modules. This is achieved by adding multi-led nodes layer to the
> monochrome LED bindings.

Ack

Dan

>> +
>> +The nodes and properties defined in this document are unique to the multicolor
>> +LED class.  Common LED nodes and properties are inherited from the common.txt
>> +within this documentation directory.
>> +
>> +Required LED Child properties:
>> +	- color : For multicolor LED support this property should be defined as
>> +		  LED_COLOR_ID_MULTI and further definition can be found in
>> +		  include/linux/leds/common.h.
>> +
>> +led-controller@30 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	compatible = "ti,lp5024";
>> +	reg = <0x29>;
>> +
>> +	multi-led@1 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <1>;
>> +		color = <LED_COLOR_ID_MULTI>;
>> +		function = LED_FUNCTION_STATUS;
>> +
>> +
>> +		led@3 {
>> +			reg = <3>;
>> +			color = <LED_COLOR_ID_RED>;
>> +		};
>> +
>> +		led@4 {
>> +			reg = <4>;
>> +			color = <LED_COLOR_ID_GREEN>;
>> +		};
>> +
>> +		led@5 {
>> +			reg = <5>;
>> +			color = <LED_COLOR_ID_BLUE>;
>> +		};
>> +	};
>> +
>> +	multi-led@2 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		color = <LED_COLOR_ID_MULTI>;
>> +		function = LED_FUNCTION_ACTIVITY;
>> +		reg = <2>;
>> +		ti,led-bank = <2 3 5>;
>> +
>> +		led@6 {
>> +			reg = <0x6>;
>> +			color = <LED_COLOR_ID_RED>;
>> +			led-sources = <6 9 15>;
>> +		};
>> +
>> +		led@7 {
>> +			reg = <0x7>;
>> +			color = <LED_COLOR_ID_GREEN>;
>> +			led-sources = <7 10 16>;
>> +		};
>> +
>> +		led@8 {
>> +			reg = <0x8>;
>> +			color = <LED_COLOR_ID_BLUE>;
>> +			led-sources = <8 11 17>;
>> +		};
>> +	};
>> +
>> +	multi-led@4 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <4>;
>> +		color = <LED_COLOR_ID_MULTI>;
>> +		function = LED_FUNCTION_ACTIVITY;
>> +
>> +		led@12 {
>> +			reg = <12>;
>> +			color = <LED_COLOR_ID_RED>;
>> +		};
>> +
>> +		led@13 {
>> +			reg = <13>;
>> +			color = <LED_COLOR_ID_GREEN>;
>> +		};
>> +
>> +		led@14 {
>> +			reg = <14>;
>> +			color = <LED_COLOR_ID_BLUE>;
>> +		};
>> +	};
>> +
>> +};
>>
