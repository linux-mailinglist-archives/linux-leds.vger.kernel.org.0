Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACA1C16AE0
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 21:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfEGTG3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 15:06:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50986 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbfEGTG2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 15:06:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47J6MGh072255;
        Tue, 7 May 2019 14:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557255983;
        bh=srEN0ZNosYbATD7A2PnHc4TOqFOGIfcuSoQ7/3qnK2o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CyEVn1Q5dAegrEglEiaGdLXYNU5HPVX3vdiW4wb+AQ9bp5K04ixjoyw1VcLnYajp2
         iAnETsi8dFoNOXlGcUDp6m592JCNCRTgsZpnRohyi1w2FfHiMVE6jYwkPxzrPpFEGZ
         20buIamfb+1lB2l/uwTu7+dT9/qbC4L94qJTZiwc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47J6Mup033982
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 14:06:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 14:06:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 14:06:22 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47J6MKq056128;
        Tue, 7 May 2019 14:06:22 -0500
Subject: Re: [PATCH v3 0/7] LMU Common code intro
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
 <bc5756ac-b383-dac3-4a45-c0ace03ce9ec@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <bf6768b6-2795-5904-15e1-75109a694fcd@ti.com>
Date:   Tue, 7 May 2019 14:06:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bc5756ac-b383-dac3-4a45-c0ace03ce9ec@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I have posted v4 with requested corrections plus I have an additional patchset that is based off of this patch set
for the LM36274.

I can post that as well and we can present everything for 5.3

Maybe even the base MC FW ;)

Dan

On 5/7/19 1:49 PM, Jacek Anaszewski wrote:
> Finally the patch set missed merge window for 5.2 due to
> other requested improvements.
> 
> Thanks,
> Jacek Anaszewski
> 
> On 5/1/19 11:45 AM, Jacek Anaszewski wrote:
>> Ekhm, I forgot to add the main recipient.
>>
>> Adding Lee.
>>
>> On 5/1/19 12:05 AM, Jacek Anaszewski wrote:
>>> Hi Lee,
>>>
>>> This patch set has dependency on the previous one for lm3532, which
>>> also touches ti-lmu.txt bindings, and for which I already created
>>> immutable branch. Now if I created another immutable branch for
>>> this patch set we would have to resolve conflicts between the two,
>>> as they would both be based on 5.1-rc1. Adds much overhead and
>>> is error prone. Therefore I propose to apply this patch set on
>>> top of my merge of LED tree with the immutable branch for lm3532.
>>>
>>> Please let me know if you see it differently. I'll wait for your
>>> response until Friday, and then proceed with the above as I think
>>> it should be harmless for MFD.
>>>
>>> Best regards,
>>> Jacek Anaszewski
>>>
>>> On 4/30/19 9:17 PM, Dan Murphy wrote:
>>>> Hello
>>>>
>>>> I have added the Reviewed-by for dt bindings as well as made the Kconfig change
>>>> pointed out for the common code flag
>>>>
>>>> Dan
>>>>
>>>> Dan Murphy (7):
>>>>    dt-bindings: mfd: LMU: Fix lm3632 dt binding example
>>>>    dt-bindings: mfd: LMU: Add the ramp up/down property
>>>>    dt-bindings: mfd: LMU: Add ti,brightness-resolution
>>>>    leds: TI LMU: Add common code for TI LMU devices
>>>>    dt-bindings: ti-lmu: Modify dt bindings for the LM3697
>>>>    mfd: ti-lmu: Remove support for LM3697
>>>>    leds: lm3697: Introduce the lm3697 driver
>>>>
>>>>   .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ++++
>>>>   .../devicetree/bindings/mfd/ti-lmu.txt        |  56 ++-
>>>>   drivers/leds/Kconfig                          |  15 +
>>>>   drivers/leds/Makefile                         |   2 +
>>>>   drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
>>>>   drivers/leds/ti-lmu-led-common.c              | 155 +++++++
>>>>   drivers/mfd/Kconfig                           |   2 +-
>>>>   drivers/mfd/ti-lmu.c                          |  17 -
>>>>   include/linux/mfd/ti-lmu-register.h           |  44 --
>>>>   include/linux/mfd/ti-lmu.h                    |   1 -
>>>>   include/linux/ti-lmu-led-common.h             |  47 +++
>>>>   11 files changed, 712 insertions(+), 95 deletions(-)
>>>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>>>   create mode 100644 drivers/leds/leds-lm3697.c
>>>>   create mode 100644 drivers/leds/ti-lmu-led-common.c
>>>>   create mode 100644 include/linux/ti-lmu-led-common.h
>>>>
>>>
>>>
>>
