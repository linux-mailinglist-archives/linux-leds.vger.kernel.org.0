Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD0C10234
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 00:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfD3WHe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 18:07:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42136 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfD3WHe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 18:07:34 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UM7Ta5067873;
        Tue, 30 Apr 2019 17:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556662049;
        bh=mwbS/adT545mom+gOLUqux+4lUqX0AcC/k+8N/4142k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YYYJMqJpXzh+HcRr2G4U7J46/+Uw1Joo1VViTA53a3jdQL6vVmxUcGXjQlgbdDRuP
         iDyMLDDvdPVddzbWbI8+wGUGrCfPHRHKeMaj6zIMdxosg+MmYOt3AneqiJrM/gWLI3
         EOdK87DRDcbygPOGxIKyXun/6Rhn27ziL+kg66J0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UM7TBu072741
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 17:07:29 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 17:07:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 17:07:29 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UM7SOr028915;
        Tue, 30 Apr 2019 17:07:28 -0500
Subject: Re: [PATCH v3 5/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-6-dmurphy@ti.com> <20190430220527.GC20410@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <34f72f44-9385-a42a-4e44-94ae6a04fe98@ti.com>
Date:   Tue, 30 Apr 2019 17:07:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430220527.GC20410@amd>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 4/30/19 5:05 PM, Pavel Machek wrote:
> On Tue 2019-04-30 14:17:28, Dan Murphy wrote:
>> The LM3697 is a single function LED driver. The single function LED
>> driver needs to reside in the LED directory as a dedicated LED driver
>> and not as a MFD device.  The device does have common brightness and ramp
>> features and those can be accomodated by a TI LMU framework.
>>
>> The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicated
>> LED dt binding needs to be added.  The new LM3697 LED dt binding will then
>> reside in the Documentation/devicetree/bindings/leds directory and follow the
>> current LED and general bindings guidelines.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058762/
>>
>> v2 - Made changes to reference ti,brightness-resolution to the ti-lmu.txt -
>> https://lore.kernel.org/patchwork/patch/1054501/
>>
>>  .../devicetree/bindings/leds/leds-lm3697.txt  | 73 +++++++++++++++++++
>>  .../devicetree/bindings/mfd/ti-lmu.txt        | 27 +------
>>  2 files changed, 74 insertions(+), 26 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>> new file mode 100644
>> index 000000000000..02378f33c9ab
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>> @@ -0,0 +1,73 @@
>> +* Texas Instruments - LM3697 Highly Efficient White LED Driver
>> +
>> +The LM3697 11-bit LED driver provides high-
>> +performance backlight dimming for 1, 2, or 3 series
>> +LED strings while delivering up to 90% efficiency.
>> +
>> +This device is suitable for display and keypad Lighting
> 
> "lightning."

Heh.  Don't think you meant lightning but I get what you are saying

s/Lighting/lighting

Dan

> 									Pavel
> 
