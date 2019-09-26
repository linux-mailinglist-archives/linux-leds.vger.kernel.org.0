Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D27F1BF22F
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 13:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbfIZLyu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 07:54:50 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59158 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfIZLyt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 07:54:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QBskN6031458;
        Thu, 26 Sep 2019 06:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569498886;
        bh=OsydVYUN2O2b6eBJcTCqsA7EMTGefZ2X59lOa1oxBd8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JWVFWKOABEOJQZA+hDoDKtW2eBlL9PK+SrzKs/HORaeZDem+IoHz/tZKBYVwnNvlh
         K3Bt/sDaSSOHMq6X1pNOEDgyxsgAM9QTkmBZFNAmO5TNOzIbL2uLbc1NBxEwXIK7+o
         CYExTM9kHQ8m3O3Kmr6njtXe3vtlZQx3/45XKGzE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QBskWa075305
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 26 Sep 2019 06:54:46 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 06:54:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 06:54:46 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QBsj2m104424;
        Thu, 26 Sep 2019 06:54:45 -0500
Subject: Re: [PATCH v9 08/15] dt: bindings: lp55xx: Be consistent in the
 document with LED
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-9-dmurphy@ti.com>
 <e4916f0c-c8e7-924f-e944-4c5388dc0ef8@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <609da7f3-9c6d-ec29-7c5f-38fa9fe01982@ti.com>
Date:   Thu, 26 Sep 2019 07:00:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e4916f0c-c8e7-924f-e944-4c5388dc0ef8@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/25/19 4:31 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/25/19 7:46 PM, Dan Murphy wrote:
>> Update the document to be consistent in case when using LED.
> s/LED/"LED"/.

ACK


>
>> This should be capital throughout the document.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   Documentation/devicetree/bindings/leds/leds-lp55xx.txt | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> index 1b66a413fb9d..bfe2805c5534 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> @@ -1,4 +1,4 @@
>> -Binding for TI/National Semiconductor LP55xx Led Drivers
>> +Binding for TI/National Semiconductor LP55xx LED Drivers
>>   
>>   Required properties:
>>   - compatible: one of
>> @@ -12,8 +12,8 @@ Required properties:
>>   - clock-mode: Input clock mode, (0: automode, 1: internal, 2: external)
>>   
>>   Each child has own specific current settings
>> -- led-cur: Current setting at each led channel (mA x10, 0 if led is not connected)
>> -- max-cur: Maximun current at each led channel.
>> +- led-cur: Current setting at each LED channel (mA x10, 0 if LED is not connected)
>> +- max-cur: Maximun current at each LED channel.
>>   
>>   Optional properties:
>>   - enable-gpio: GPIO attached to the chip's enable pin
>>
