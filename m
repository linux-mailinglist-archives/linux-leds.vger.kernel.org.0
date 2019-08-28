Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA25A0647
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2019 17:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfH1P2L (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Aug 2019 11:28:11 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53750 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfH1P2L (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Aug 2019 11:28:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7SFS1He009861;
        Wed, 28 Aug 2019 10:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567006082;
        bh=uWf4xw0Csl6sothe8w8KpW37on/sM8Kd9UswtPm39m4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=URl23LOlJSBkM/t3SANIA3dY32oM8gKAjVl9tgbPhafuNed40j8WA5mmJZ2FiHlQl
         p5P5Yv2xl45uy/qdyVQFf9z6xkCGLue4nrjMwwHjuMsDuent1kBJlAo1hzMHJwZORJ
         xFLDncrSLxzMOTUIoBlA+o+AChlTx2+6949CqUOA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7SFS1Ow042133
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 10:28:01 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 10:28:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 10:28:01 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7SFS1aB107270;
        Wed, 28 Aug 2019 10:28:01 -0500
Subject: Re: [PATCH v3 1/5] leds: lm3532: Fix brightness control for i2c mode
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Tony Lindgren <tony@atomide.com>
CC:     <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190820195307.27590-1-dmurphy@ti.com>
 <20190826215822.GY52127@atomide.com> <20190826221413.GA19124@amd>
 <20190826224437.GZ52127@atomide.com> <20190827121818.GB19927@amd>
 <0eab6f72-ddb7-3da7-e90e-888374531f86@ti.com>
 <69925382-d8f4-4916-f121-0184a4219354@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <84511f1e-5a04-5348-a2b4-1dc2b534a1cb@ti.com>
Date:   Wed, 28 Aug 2019 10:28:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <69925382-d8f4-4916-f121-0184a4219354@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 8/27/19 4:14 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 8/27/19 2:44 PM, Dan Murphy wrote:
>> Tony
>>
>> On 8/27/19 7:18 AM, Pavel Machek wrote:
>>> On Mon 2019-08-26 15:44:37, Tony Lindgren wrote:
>>>> * Pavel Machek <pavel@ucw.cz> [190826 22:14]:
>>>>> On Mon 2019-08-26 14:58:22, Tony Lindgren wrote:
>>>>>> Hi,
>>>>>>
>>>>>> * Dan Murphy <dmurphy@ti.com> [190820 19:53]:
>>>>>>> Fix the brightness control for I2C mode.  Instead of
>>>>>>> changing the full scale current register update the ALS target
>>>>>>> register for the appropriate banks.
>>>>>>>
>>>>>>> In addition clean up some code errors and random misspellings found
>>>>>>> during coding.
>>>>>>>
>>>>>>> Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack
>>>>>>>
>>>>>>> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
>>>>>>> Reported-by: Pavel Machek <pavel@ucw.cz>
>>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>>> ---
>>>>>>>
>>>>>>> v3 - Removed register define updates -
>>>>>>> https://lore.kernel.org/patchwork/patch/1114542/
>>>>>> Looks like starting with this patch in Linux next the LCD on droid4
>>>>>> is so dim it's unreadable even with brightness set to 255. Setting
>>>>>> brightness to 0 does blank it completely though.
>>>>>>
>>>>>> Did something maybe break with the various patch revisions or are
>>>>>> we now missing some dts patch?
>>>>> Maybe missing dts patch. We should provide maximum current the LED can
>>>>> handle...
>>>> Or i2c control is somehow broken and only als control now works?
>> With only setting CONFIG_LEDS_LM3532=m to the next branch I get full
>> brightness with 255.
>>
>> I also see half brightness at 128 with the ramp down working.
>>
>> I am not able to reproduce this issue on my device.
>>
>>> Well, max current led is obviously missing. Plus code does not check
>>> the return from reading led-max-microamp.
>> led-max-microamp is optional so there is no need to check the return.
> It's also ugly to not check it when you have it assigned.
> We'll soon receive complaints from static checkers about pointless
> assignment.
>
> I'd distinguish between cases when parsing failed,
> and when property has not been provided.
>
> if (fwnode_property_present(child, "led-max-microamp")) {
> 	if (fwnode_property_read_u32(child, "led-max-microamp",
> 				&led->full_scale_current);
> 		dev_err(&priv->client->dev,
>                           "Failed to parse led-max-microamp property\n")

I am OK with doing this but I think the else case logging is extra.

Again the property is optional and if the user decides not to populate 
it then there should not

be a log of that it is missing.

Dan

> } else {
> 	dev_info(&priv->client->dev,
> 		 led-max-microamp property is missing\n")
> }
>
>> full_scale_current should be 0 if not populated and in the init only if
>> this variable is set does
>>
>> the code program the register otherwise it is default of 20.2 mA.
