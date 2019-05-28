Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3172BC83
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2019 02:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfE1Arm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 May 2019 20:47:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34496 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbfE1Arm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 May 2019 20:47:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S0lcS6058548;
        Mon, 27 May 2019 19:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559004458;
        bh=2gmAOoHDeD++Du38nkxhcnSPLpCrkGFuL8FipVC7j0w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ovKbcedlmAPESOFUVymVfva8u0NI/yktjCAWKyLRzXa24bttPmdh3rjpycQYtgfmW
         pY3Ncb4a7/0zterJ7GvRNU3de9PNoR1PsVr1U0p/gK/ox/PSTKqVy/sTLOXglRHBnO
         oXzV3V2QxHzaBM3pHMpC1qCXchKDvlLCApxROots=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S0lcI3080761
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 May 2019 19:47:38 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 19:47:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 19:47:37 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S0lcWb113887;
        Mon, 27 May 2019 19:47:38 -0500
Subject: Re: [PATCH v3 7/9] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
To:     Rob Herring <robh@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-8-dmurphy@ti.com> <20190524205022.GA9518@bogus>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <fd075387-8b54-ed48-f480-bd673df88ac3@ti.com>
Date:   Mon, 27 May 2019 19:47:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524205022.GA9518@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob

On 5/24/19 3:50 PM, Rob Herring wrote:
> On Thu, 23 May 2019 14:08:18 -0500, Dan Murphy wrote:
>> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024 and
>> LP5018 RGB LED device driver.  The LP5036/30/24/18 can control RGB LEDs
>> individually or as part of a control bank group.  These devices have the ability
>> to adjust the mixing control for the RGB LEDs to obtain different colors
>> independent of the overall brightness of the LED grouping.
>>
>> Datasheet:
>> http://www.ti.com/lit/ds/symlink/lp5024.pdf
>> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../devicetree/bindings/leds/leds-lp50xx.txt  | 142 ++++++++++++++++++
>>   1 file changed, 142 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

I usually provide the tags but in my cover letter I did indicate that 
these patchsets have changed pretty dramatically so I did not feel right 
about pulling in anyones tags.

Adding your reviewed by on a binding that changed did not seem right to me.

Dan

