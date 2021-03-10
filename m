Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E633348BE
	for <lists+linux-leds@lfdr.de>; Wed, 10 Mar 2021 21:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhCJURz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Mar 2021 15:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhCJUR2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Mar 2021 15:17:28 -0500
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132DAC061574;
        Wed, 10 Mar 2021 12:17:28 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Dwjzm5MBFzQjmn;
        Wed, 10 Mar 2021 21:17:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
        t=1615407442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pc2KSGdjhoUm+KWisxb/fuVEslksJpAE3Ymh75BH0Cw=;
        b=z1EREBP0vZqNDvFLzdtr6RdAF1QKXCR1Eev4uIKVV4Nu1Uv2HgvieeYYZt5W2ZeUgKpIc8
        QOQ6t/CcufhP6+dcJeQT5KBtrjrn0utrxWtHrmYRT3ZAwpiO8B36voAagadx/8BE6VAnKr
        JQUdBfTJ1b1MrvjywfZaIgGZeB4OJerMYrSjkAPiKaPzQNdzGsktETy7JNLBbf+FDO0+NR
        Bb8cPR0xxP2EhdevYDlYM5QmAKfpghnsSLLvzVhdbEOtaLmzlBF+pmHDJ2DNWjOI/sWOMM
        EECuyRqn5UZ/aUYDSgtdykz67N77keP9tmaWmSNgbQRGSpnWhR28Z234DuVhzw==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id apVk64UXcm7b; Wed, 10 Mar 2021 21:17:17 +0100 (CET)
To:     Arnd Bergmann <arnd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        qwu@maxlinear.com
Cc:     Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>
References: <20210308153052.2353885-1-arnd@kernel.org>
 <20210309180851.GA4669@duo.ucw.cz> <20210309193910.GA7507@amd>
 <YEgeoPqCCgTUEsSc@angband.pl> <20210310072831.GA29779@amd>
 <CAK8P3a2+o8N77A_OkP+QD7ntA+M4U26k15Hh1rNN16-afcTp9g@mail.gmail.com>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: MaxLinear, please maintain your drivers was Re: [PATCH] leds:
 lgm: fix gpiolib dependency
Message-ID: <9a74ce79-b7cf-dec1-a64c-d928b5712645@hauke-m.de>
Date:   Wed, 10 Mar 2021 21:17:15 +0100
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2+o8N77A_OkP+QD7ntA+M4U26k15Hh1rNN16-afcTp9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -8.43 / 15.00 / 15.00
X-Rspamd-Queue-Id: 0024C17E3
X-Rspamd-UID: e6c179
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 3/10/21 5:57 PM, Arnd Bergmann wrote:
> On Wed, Mar 10, 2021 at 8:30 AM Pavel Machek <pavel@ucw.cz> wrote:
>>
>> Hi!
>>
>>>>> I'd like people from Intel to contact me. There's more to fix there,
>>>>> and AFAICT original author went away.
>>>>
>>>> The following message to <mallikarjunax.reddy@linux.intel.com> was
>>>> undeliverable.
>>>
>>>> <mallikarjunax.reddy@linux.intel.com>: Recipient
>>>> +address rejected: User unknown in virtual mailbox table'
>>>
>>>> commit c3987cd2bca34ddfec69027acedb2fae5ffcf7a0
>>>> Author: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
>>>
>>> I asked around, and got told Mallikarjuna has been "sold" to MaxLinear,
>>> together with the rest of the Connected Home Division.  So he most likely
>>> still works on this stuff, just under a different banner.
>>>
>>>> If someone knows how to contact the author, that would be welcome.
>>>
>>> Alas, no idea about his MaxLinear address.
>>
>> Thanks for the effort. Anyway, I suspect I'll just do this:
> 
> Maybe Hauke or John  (added both to cc) know who at MaxLinear is
> responsible for maintaining the Lightning Mountain drivers now.
> 
>         Arnd

Hi Qiming,

It looks like there are some problems and potential fixes for the led 
driver Mallikarjuna added to the Linux kernel for LGM some time ago.

Could you please take care of this request from Pavel and Arnd.


Hauke


> 
>> diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
>> index 6dedc58c47b3..79493f21d365 100644
>> --- a/drivers/leds/blink/Kconfig
>> +++ b/drivers/leds/blink/Kconfig
>> @@ -1,14 +1,6 @@
>> -menuconfig LEDS_BLINK
>> -       bool "LED Blink support"
>> -       depends on LEDS_CLASS
>> -       help
>> -         This option enables blink support for the leds class.
>> -         If unsure, say Y.
>> -
>> -if LEDS_BLINK
>> -
>>   config LEDS_BLINK_LGM
>>          tristate "LED support for Intel LGM SoC series"
>> +       depends on BROKEN
>>          depends on GPIOLIB
>>          depends on LEDS_CLASS
>>          depends on MFD_SYSCON
>> @@ -17,5 +9,3 @@ config LEDS_BLINK_LGM
>>            Parallel to serial conversion, which is also called SSO controller,
>>            can drive external shift register for LED outputs.
>>            This enables LED support for Serial Shift Output controller(SSO).
>> -
>> -endif # LEDS_BLINK
>>
>>
>> --
>> http://www.livejournal.com/~pavelmachek

