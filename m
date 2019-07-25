Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD2274C85
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2019 13:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391597AbfGYLI7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Jul 2019 07:08:59 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36236 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387743AbfGYLI7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Jul 2019 07:08:59 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PB8ovM082737;
        Thu, 25 Jul 2019 06:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564052930;
        bh=9o0RysdNYfw8C09lF0wXItPPcW+TfvKUFRMr3YMSz7s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JvuiPO3As1zruEg1vCars8Mdss5EUrzLx6/Fmg6v4JvkM/5KRP3AQuozBVKxg52b7
         ZoLiIMMYNfhOpzHsAS8bgSnHk61uSpn9MPt7RLg37lxvgKH1z+PesHCATHALaZs5ey
         8eq9PrRiLvyoiLDehkwcmdO6zL0MYfu/EKn55Tug=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PB8oEf129082
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jul 2019 06:08:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 06:08:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 06:08:49 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PB8lVT097949;
        Thu, 25 Jul 2019 06:08:48 -0500
Subject: Re: [PATCH 2/2] dt-bindings: leds: document new "power-supply"
 property
To:     Rob Herring <robh@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>,
        <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-3-jjhiblot@ti.com> <20190724164757.GA3723@bogus>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <753b2c8d-e8fc-ec6e-f372-a84d4452fd33@ti.com>
Date:   Thu, 25 Jul 2019 13:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190724164757.GA3723@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Rob,

On 24/07/2019 18:47, Rob Herring wrote:
> On Mon, Jul 08, 2019 at 12:35:47PM +0200, Jean-Jacques Hiblot wrote:
>> Most of the LEDs are powered by a voltage/current regulator. describing in
>> the device-tree makes it possible for the LED core to enable/disable it
>> when needed.
>>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   Documentation/devicetree/bindings/leds/common.txt | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>> index 70876ac11367..e093a2b7eb90 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -61,6 +61,11 @@ Optional properties for child nodes:
>>   - panic-indicator : This property specifies that the LED should be used,
>>   		    if at all possible, as a panic indicator.
>>   
>> +- power-supply : A voltage/current regulator used to to power the LED. When a
>> +		 LED is turned off, the LED core disable its regulator. The
>> +		 same regulator can power many LED (or other) devices. It is
>> +		 turned off only when all of its users disabled it.
> Not sure this should be common. It wouldn't apply to cases where we have
> an LED controller parent nor gpio and pwm LEDs and those are most cases.

It does make sense for GPIO and PWM bindings if the anode of LED is tied 
to a regulated voltage and the cathod to the control line.

The same is true for a certain class of true LED controller that do not 
deliver power but act like current sinks.

JJ

>
> Perhaps what makes sense here is an regulator-led binding.
>
>> +
>>   - trigger-sources : List of devices which should be used as a source triggering
>>   		    this LED activity. Some LEDs can be related to a specific
>>   		    device and should somehow indicate its state. E.g. USB 2.0
>> -- 
>> 2.17.1
>>
