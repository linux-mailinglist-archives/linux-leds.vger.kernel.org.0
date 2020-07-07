Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340ED21728E
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jul 2020 17:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgGGPgW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jul 2020 11:36:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54540 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgGGPgV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jul 2020 11:36:21 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067Fa0oT026459;
        Tue, 7 Jul 2020 10:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594136160;
        bh=d4DsmzHbKkNBcX32YjQ2+lr3RY6d1aC3mMFb52eDm+w=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=CTvNoaNifJPJM/EL3sOYzRi2Usf370h3LDS6sZDfNMDq9Gh5xhBcmB7h1j3WEiVLH
         laRqOJq16wutyTEZ26eHGrGQhMTDc76Fqw/g9Ci9CKZIBamNyzb8OX8JDveTvaQBzr
         aj78BHCiJUVbWqtFGjSkIOVjw3b20g1znk2ojxOg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067Fa0Fc019368
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jul 2020 10:36:00 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 10:36:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 10:36:00 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067Fa0sW089681;
        Tue, 7 Jul 2020 10:36:00 -0500
Subject: Re: [PATCH v29 00/16] Multicolor Framework v29
From:   Dan Murphy <dmurphy@ti.com>
To:     Pavel Machek <pavel@ucw.cz>, <marek.behun@nic.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200704124729.GA20088@amd> <e25dd902-da3f-37ca-c9bc-f4ab42019281@ti.com>
Message-ID: <a21e8389-ba60-c341-d7bd-a0b166084be6@ti.com>
Date:   Tue, 7 Jul 2020 10:36:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e25dd902-da3f-37ca-c9bc-f4ab42019281@ti.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/6/20 7:31 AM, Dan Murphy wrote:
> Pavel
>
> On 7/4/20 7:47 AM, Pavel Machek wrote:
>> Hi!
>>
>>> This is the multi color LED framework. This framework presents 
>>> clustered
>>> colored LEDs into an array and allows the user space to adjust the 
>>> brightness
>>> of the cluster using a single file write.  The individual colored LEDs
>>> intensities are controlled via a single file that is an array of LEDs
>>>
>>> Change to the LEDs Kconfig to fix dependencies on the LP55XX_COMMON.
>>> Added update to the u8500_defconfig
>> Marek, would you be willing to look over this series?
>>
>> Dan, can we please get it in the order
>>
>> 1) fixes first
>>
>> 2) changes needed for multicolor but not depending on dt acks
>>
>> 3) dt changes
>>
>> 4) rest?
>>
>> This is the order it should have been in the first place, and I'd like
>> to get fixes applied, and perhaps some of the preparation.
>
> This will depend on if there are comments.  If I have to push a v30 
> then I will reorder.
>
> If not then there would be no reason to re-order these.
>
FYI I just reordered these locally and the fixes patches applied cleanly 
to your for-next branch and the MC FW patches applied cleanly on top of 
those.

So you should be able to pull in the fixes with no dependency on the MC 
FW patches.  If you can apply the fixes cleanly then if there are 
conflicts with the MC FW patches then I will fix those as well.

Dan


> Dan
>
>
