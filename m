Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A96FDC904A
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 19:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfJBR4Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 13:56:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41208 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJBR4X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 13:56:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92HuHNn033885;
        Wed, 2 Oct 2019 12:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570038977;
        bh=WWqddxMTH1VbvnJRV1r6UtNPgtyQrYro1vwSuxEhtvw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CbXROert5YQ7Gi+dUMSJa4GxrfgszIXN4Vty4/JL3VzCUa3Fm+qBBET9wYkFxIXVR
         vifqiCbGMuNbKEtXpYfKa4t/qiSwc6kWt6KAiTIK6WnU5f+DiyfBT+IyQLOOkpUxT9
         GRXKkC5IlHaRccmWK1oHjj6P1tboZzaCuoQ+WzRg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92HuHYV006863;
        Wed, 2 Oct 2019 12:56:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 12:56:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 12:56:06 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92HuG8B023172;
        Wed, 2 Oct 2019 12:56:16 -0500
Subject: Re: [PATCH -next 2/2] leds: add /sys/class/leds/<led>/current-trigger
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
 <1570029181-11102-3-git-send-email-akinobu.mita@gmail.com>
 <ec4d9d2c-6f8d-97a6-41d7-832a3fc1ca72@ti.com>
 <589ba4d7-31f5-c789-d5ca-c13650cf5b03@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <79102915-5510-40e7-b4be-073e1c85bda6@ti.com>
Date:   Wed, 2 Oct 2019 12:57:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <589ba4d7-31f5-c789-d5ca-c13650cf5b03@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/2/19 12:46 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/2/19 5:47 PM, Dan Murphy wrote:
>> Akinobu
>>
>> On 10/2/19 10:13 AM, Akinobu Mita wrote:
>>> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
>>> However, this violates the "one value per file" rule of sysfs.
>>>
>>> This provides /sys/class/leds/<led>/current-trigger which is almost
>>> identical to /sys/class/leds/<led>/trigger.  The only difference is that
>>> 'current-trigger' only shows the current trigger name.
>>>
>>> This new file follows the "one value per file" rule of sysfs.
>>> We can find all available LED triggers by listing the
>>> /sys/devices/virtual/led-trigger/ directory.
>>>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>>> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> Cc: Pavel Machek <pavel@ucw.cz>
>>> Cc: Dan Murphy <dmurphy@ti.com>
>>> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
>>> ---
>>>    Documentation/ABI/testing/sysfs-class-led | 13 +++++++++++
>>>    drivers/leds/led-class.c                  | 10 ++++++++
>>>    drivers/leds/led-triggers.c               | 38
>>> +++++++++++++++++++++++++++----
>>>    drivers/leds/leds.h                       |  5 ++++
>>>    4 files changed, 62 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led
>>> b/Documentation/ABI/testing/sysfs-class-led
>>> index 5f67f7a..fdfed3f 100644
>>> --- a/Documentation/ABI/testing/sysfs-class-led
>>> +++ b/Documentation/ABI/testing/sysfs-class-led
>>> @@ -61,3 +61,16 @@ Description:
>>>            gpio and backlight triggers. In case of the backlight trigger,
>>>            it is useful when driving a LED which is intended to indicate
>>>            a device in a standby like state.
>>> +
>>> +What:        /sys/class/leds/<led>/current-trigger
>>> +Date:        September 2019
>>> +KernelVersion:    5.5
>>> +Contact:    linux-leds@vger.kernel.org
>>> +Description:
>>> +        Set the trigger for this LED. A trigger is a kernel based source
>>> +        of LED events.
>>> +        Writing the trigger name to this file will change the current
>>> +        trigger. Trigger specific parameters can appear in
>>> +        /sys/class/leds/<led> once a given trigger is selected. For
>>> +        their documentation see sysfs-class-led-trigger-*.
>>> +        Reading this file will return the current LED trigger name.
>> Why do we need this new file can't we just update the current trigger
>> file implementation?
> We can't change existing ABI. It doesn't matter if it is documented
> or not - it's in place for very long time and you can't guarantee there
> are no users relying on triggers file show format.

So if it has been in place for a very long time why do we need another 
ABI that does sorta the same thing?

This seems to be a bit confusing and extra.

Maybe this ABI should be RO where a user can read the current-trigger as 
a single value per file but writing the trigger still

is done through the old ABI.

Dan


>
>> I don't see any documentation that states that the read of the trigger
>> file will print a list of known triggers.
>>
>> And writing to the trigger file still works so I would think the _show
>> just needs to be fixed.
>>
>> Besides this patch does not fix the issue in the commit message that the
>> trigger file still violates the one value per file rule.
>>
>> Dan
>>
>>
