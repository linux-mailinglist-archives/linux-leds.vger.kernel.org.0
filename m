Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB6CA46586
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2019 19:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfFNRS3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jun 2019 13:18:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52054 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfFNRS3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jun 2019 13:18:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EHIM4R037139;
        Fri, 14 Jun 2019 12:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560532702;
        bh=YAV8kjvzmhIpBEXNbXi91uV4TOTMlxj3RoDfsxqvjxc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=S0xtbz3Pjsku+utgwQC8CujKspUPPAbgZ2n5yNl/cxxhwnpbE52D3j2ZUR1QptsqD
         E+ID6s8BNntwCCLhbE8DiSpTu8keWtZRMIiOV3SXBlMYkxSiD2dz3CZTBroSnqF1CG
         yHK1KiYG0JKg8XtHg4SRVdDlTBQivHhRvkN/3jYs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EHIMwL064473
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 Jun 2019 12:18:22 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 14
 Jun 2019 12:18:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 14 Jun 2019 12:18:22 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EHILSv019322;
        Fri, 14 Jun 2019 12:18:21 -0500
Subject: Re: [PATCH v3 2/9] dt: bindings: Add multicolor class dt bindings
 documention
To:     Rob Herring <robh@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-3-dmurphy@ti.com> <20190614170011.GA3277@bogus>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c234361e-f5f7-f8d7-18c6-9cc8ef74ac99@ti.com>
Date:   Fri, 14 Jun 2019 12:18:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614170011.GA3277@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob

Thanks for the review

On 6/14/19 12:00 PM, Rob Herring wrote:
> On Thu, May 23, 2019 at 02:08:13PM -0500, Dan Murphy wrote:
>> Add DT bindings for the LEDs multicolor class framework.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../bindings/leds/leds-class-multicolor.txt   | 97 +++++++++++++++++++
>>   1 file changed, 97 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> new file mode 100644
>> index 000000000000..e2a2ce3279cb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> @@ -0,0 +1,97 @@
>> +* Multicolor LED properties
>> +
>> +Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
>> +can be grouped together and also provide a modeling mechanism so that the
>> +cluster LEDs can vary in hue and intensity to produce a wide range of colors.
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
>> +	multi-led@4 {
> Typically we sort by address order.

These are not addresses these end up being the "module" number that the 
LEDs below are associated to.


>
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
>> +	/* Only support RGB no model defined */
> I don't understand this comment.

Artifact can be removed


>
>> +	multi-led@1 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <1>;
>> +		color = <LED_COLOR_ID_MULTI>;
>> +		function = LED_FUNCTION_;
> ??

I meant to change that but missed it in the example.

Dan


>
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
>> +};
>> -- 
>> 2.21.0.5.gaeb582a983
>>
