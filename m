Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6BADD1DAA
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 02:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731553AbfJJAtk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 20:49:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41774 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731230AbfJJAtk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 20:49:40 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A0nb3J119893;
        Wed, 9 Oct 2019 19:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570668577;
        bh=bXA+tWGCPIN3ZK9prxHVq3q3UctX1VVbNkAauQN1QlE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZXwkh4YfUWIIRkL0XwHCuU2dFC+0WKHbLoT9m9+J641lep4CDaqJcw3ZMJZQofPbL
         ibZN8tQlF7vuiPZpkF7IQPRZEdokx0l6Q3npFoiXNsYdXwwN3y4q+VfNvqyOk8DThC
         rLuu9UHx97PXDa1yzk5jB0/MFYrgwK+exoZAJKdI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A0nbtU111924
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 19:49:37 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 19:49:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 19:49:36 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A0na8n030203;
        Wed, 9 Oct 2019 19:49:36 -0500
Subject: Re: [PATCH v11 01/16] dt: bindings: Add multicolor class dt bindings
 documention
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191008204800.19870-1-dmurphy@ti.com>
 <20191008204800.19870-2-dmurphy@ti.com>
 <487f2425-1570-c946-c4a6-3da60ad21f2c@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <fc2de5ad-5dd6-0ea0-5ec6-2dfdd7429c09@ti.com>
Date:   Wed, 9 Oct 2019 19:49:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <487f2425-1570-c946-c4a6-3da60ad21f2c@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/9/19 5:07 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/8/19 10:47 PM, Dan Murphy wrote:
>> Add DT bindings for the LEDs multicolor class framework.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../bindings/leds/leds-class-multicolor.txt   | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> new file mode 100644
>> index 000000000000..8619c9bf1811
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> @@ -0,0 +1,98 @@
>> +* Multicolor LED properties
>> +
>> +Bindings for multi color LEDs show how to describe current outputs of
>> +either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
>> +etc.) or standalone LEDs, to achieve logically grouped multi-color LED
>> +modules. This is achieved by adding multi-led nodes layer to the
>> +monochrome LED bindings.
>> +
>> +The nodes and properties defined in this document are unique to the multicolor
>> +LED class.  Common LED nodes and properties are inherited from the common.txt
>> +within this documentation directory.
>> +
>> +Required LED Child properties:
> s/Child/child/

Ack


>
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
> Status is not too fancy function for multi color LED ;-)
> I'd skip it entirely for this example if we don't have
> anything suitable at the moment for our disposal.

Not sure I understand.  Status is a good example as a RGB module can be 
used to present charging status

Unless I misinterpreted your comment.

Dan

