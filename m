Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4148F10059
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfD3TeL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:34:11 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37562 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfD3TeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:34:11 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UJY3Q3078109;
        Tue, 30 Apr 2019 14:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556652844;
        bh=MSsEh+EPJg7tDFm/S9r2DoTAe8wqark3f9ovJPXeQrQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=y2Y1hGGDcwrkPEaoY1LhR0fd51MCtMFzteQzd1wVO5v9OReMcgG7u2URjZ/wxajZ3
         hWCZkCAbSah+CtisP9u+GA5PEAByX0LMeD6hFBsdfOQ6brOf5CSWPQxLzVDVFWXknC
         c7TmOjrFQqWsw5+SYHwcAa8023Q3QJyndB9TP8Vc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UJY3F1107063
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 14:34:03 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 14:34:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 14:34:03 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UJY2ut092224;
        Tue, 30 Apr 2019 14:34:02 -0500
Subject: Re: [PATCH v3 4/7] leds: TI LMU: Add common code for TI LMU devices
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-5-dmurphy@ti.com>
 <7d161cbc-d6bd-83aa-3790-6c45fdf9521f@infradead.org>
 <a953b7e9-ce80-641a-4d0e-f0b96828a732@ti.com>
 <98b7f0fd-6f94-b8a1-a367-77d8cae2a97e@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <39f7a9ad-5fe3-067b-14e0-d90d6fbb940d@ti.com>
Date:   Tue, 30 Apr 2019 14:34:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <98b7f0fd-6f94-b8a1-a367-77d8cae2a97e@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/30/19 2:32 PM, Jacek Anaszewski wrote:
> On 4/30/19 9:30 PM, Dan Murphy wrote:
>> Randy
>>
>> On 4/30/19 2:23 PM, Randy Dunlap wrote:
>>> On 4/30/19 12:17 PM, Dan Murphy wrote:
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index da00b9ed5a5c..3ae24eaf4cde 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -776,6 +776,14 @@ config LEDS_NIC78BX
>>>>         To compile this driver as a module, choose M here: the module
>>>>         will be called leds-nic78bx.
>>>>   +config LEDS_TI_LMU_COMMON
>>>> +    tristate "LED driver for TI LMU"
>>>
>>> what does LMU mean?
>>
>> Lighting management unit it is defined in the DT documentation
>>
>>>
>>>> +    depends on REGMAP
>>>> +    help
>>>> +          Say Y to enable the LED driver for TI LMU devices.
>>>> +          This supports common features between the TI LM3532, LM3631, LM3632,
>>>> +      LM3633, LM3695 and LM3697.
>>>
>>> Fix help indentation above to use tab + 2 spaces consistently.
>>>
>>
>> UGH I wish I had this comment 2 weeks ago.
>> But I can fix it
> 
> I will amend this while merging, no need to resend.
> 

Thank you.  I will wait to rebase/repost the LM36274 patchset until after the this series is merged.

Honestly the only change to the LM36274 patchset is adding Rob's RB to the dt patches and rebasing the Kconfig.

Dan
