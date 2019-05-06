Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7614C15319
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 19:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfEFRxY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 13:53:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43054 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfEFRxY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 13:53:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x46HrJMZ056191;
        Mon, 6 May 2019 12:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557165199;
        bh=CaNopjjkKRCvRZjxlcGvzB6zVq2/clvaGGd6ocsNFa4=;
        h=From:Subject:To:CC:References:Date:In-Reply-To;
        b=ReHS99coaRenvoGCmrDPgktftCx5kM5fNoN/Q+7uc9yEfRRpi0FYAlFqwZuE2kAqe
         kiisYUCq0mOuhB9CE5es6TInrQtgYg9XWsHU4K0rHKOKg6Not+YdaKNnBgTiJebMRn
         J6yRcwTK+nlirlWE875XnjDmeiMAujaSYAlrPGb0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x46HrJjU007670
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 May 2019 12:53:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 6 May
 2019 12:53:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 6 May 2019 12:53:19 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x46HrJsb031096;
        Mon, 6 May 2019 12:53:19 -0500
From:   Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: LMU: Add the ramp up/down
 property
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-3-dmurphy@ti.com> <20190430220140.GB20410@amd>
Message-ID: <7712d911-7ef3-e273-2cdc-89c5b56369cb@ti.com>
Date:   Mon, 6 May 2019 12:53:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430220140.GB20410@amd>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/30/19 5:01 PM, Pavel Machek wrote:
> On Tue 2019-04-30 14:17:25, Dan Murphy wrote:
>> Document the ramp-up and ramp-down property in the binding.
>> Removing the "sec" from the property definition as seconds is
>> implied.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058759/
>>
>> v2 - Fixed commit message as this was not just a modification but adding documentation
>> https://lore.kernel.org/patchwork/patch/1054504/
>>
>>  .../devicetree/bindings/mfd/ti-lmu.txt        | 20 ++++++++++++-------
>>  1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>> index 86ca786d54fc..adae96c79d39 100644
>> --- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>> +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>> @@ -25,6 +25,12 @@ Required properties:
>>  
>>  Optional property:
> 
> "properties".
> 

Ack

>>    - enable-gpios: A GPIO specifier for hardware enable pin.
>> +  - ramp-up-ms: Current ramping from one brightness level to
>> +		the a higher brightness level.
>> +		Range from 2048 us - 117.44 s
>> +  - ramp-down-ms: Current ramping from one brightness level to
>> +		  the a lower brightness level.
>> +		  Range from 2048 us - 117.44 s
> 
> Can you use ramp-up/down-us for consistency?

Sure I can change it to ramp-up/down-us.
I just converted it ramp-up/down-msec to ramp-ramp-up/down-ms.

Probably makes more sense anyway with the range actually given is in us.

Dan

> 								Pavel
> 
