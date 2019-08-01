Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 601DB7E31B
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2019 21:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388407AbfHATMN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Aug 2019 15:12:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36476 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfHATMN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Aug 2019 15:12:13 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71JC3lg032175;
        Thu, 1 Aug 2019 14:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564686723;
        bh=n+W1i+7kfv4vYrkPoC4pIrwHXKJ0yL1bnKOV95y6GAQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lAk6aqqrZ82svaBSjBNq/wF03p1vPyjqwBIVaDlyOg8bashGxSGe0WhGJZqEBVJ2y
         e5yBKJIq5qh4lpjjmV7V6aUodHUxUyHI6IOHaF9xY+lOcCSIbw+pjU3AWk07kCBntx
         fgq0tTrOKmMHC11FLBOZaC+HzIVpl7TFJhAoAh3c=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71JC3Rt093267
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Aug 2019 14:12:03 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 14:12:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 14:12:02 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71JC1M0072703;
        Thu, 1 Aug 2019 14:12:01 -0500
Subject: Re: [PATCH 2/3] dt: lm3532: Add property for full scale current.
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <tony@atomide.com>, <sre@kernel.org>, <nekit1000@gmail.com>,
        <mpartap@gmx.net>, <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190801151421.21486-1-dmurphy@ti.com>
 <20190801151421.21486-2-dmurphy@ti.com>
 <2c486267-e0b4-25f3-0a3e-189447adf8b5@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <73134d05-7422-8f4e-01d1-63a80a5bb87e@ti.com>
Date:   Thu, 1 Aug 2019 14:12:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2c486267-e0b4-25f3-0a3e-189447adf8b5@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 8/1/19 1:53 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 8/1/19 5:14 PM, Dan Murphy wrote:
>> Add a property for each control bank to configure the
>> full scale current setting for the device.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   Documentation/devicetree/bindings/leds/leds-lm3532.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3532.txt b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
>> index c087f85ddddc..d3498dd24e8e 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-lm3532.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
>> @@ -62,6 +62,9 @@ Optional LED child properties:
>>   	- label : see Documentation/devicetree/bindings/leds/common.txt
>>   	- linux,default-trigger :
>>   	   see Documentation/devicetree/bindings/leds/common.txt
>> +	- ti,fs-current : Defines the full scale current value for each control
>> +			  bank.  The range is from 5000uA-29800uA in increments
>> +			  of 800uA.
> Wouldn't led-max-microamp fit here?

Ah thats what I was looking for.  I would rather use existing properties.

I will change that.

Dan


