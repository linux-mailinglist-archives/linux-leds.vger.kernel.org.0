Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648DA28DC22
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 10:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgJNIyg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 04:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgJNIyg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 04:54:36 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAE3C041E70;
        Tue, 13 Oct 2020 21:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=ql+dCyUK9kY2qN4wsOvbY1tfjExUIKy+/6GCJYebouI=; b=XieZQoWFkPQsPtrrth/jHm1uPm
        Vd2i2pzFfD9NE9Q7O2p96hlqonmiPuh1UV96Cr7/6WUElOOVtuuGeVOTLUn3B6kHgaoxW/JKXFgqQ
        3HTP53+JhzGbJfEkj+GSlvJ0rbGJV/5+KDhnpZa3NKxR6qzsHEj8lhEbbxs7qPf11cu0GPrvo/RVR
        k9FOG5abqhfFlbB4vFynpmbLdHHAT3NocxoVueKTz2rqyOnPPiLtr4ECZkRsLB5C28mOgSdBfEN1v
        uV+OoFNh3sqg/PJhnrv3a6DU1aPznRwKcxaJy9PQW/L0SNi9SqfsNjX4RwNkea2IwG93JeE7/KtZe
        442b969A==;
Received: from [2601:1c0:6280:3f0::507c]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSYV7-0005NO-8B; Wed, 14 Oct 2020 04:34:57 +0000
Subject: Re: disabling CONFIG_LED_CLASS
To:     Udo van den Heuvel <udovdh@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>
References: <2835d02a-380b-6a3a-0e4d-abf07aee18bc@xs4all.nl>
 <53e698c1-86e4-8b1f-afb0-b8471349e701@xs4all.nl>
 <43b79598-1592-683f-46df-9e5489110780@infradead.org>
 <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
 <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
Date:   Tue, 13 Oct 2020 21:34:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/13/20 9:29 PM, Udo van den Heuvel wrote:
> 
> 
> On 13-10-2020 18:03, Randy Dunlap wrote:
>> On 10/13/20 8:53 AM, Randy Dunlap wrote:
>>> [adding LED people + list]
>>>
>>> On 10/13/20 6:24 AM, Udo van den Heuvel wrote:
> (...)
>>>>> So how do I disable this stuff?
>>>>>
>>
>> I was able to disable LEDS_CLASS and NEW_LEDS after I disabled the following
>> config symbols:
>>
>>
>> --- xx64/config-def64	2020-10-13 08:53:56.050501724 -0700
>> +++ xx64/.config	2020-10-13 08:58:12.439205389 -0700
>> -CONFIG_MAC80211_LEDS=y
>> -CONFIG_RFKILL_LEDS=y
>> -# CONFIG_LED_TRIGGER_PHY is not set
>> -CONFIG_INPUT_LEDS=y
>> -# CONFIG_HID_LED is not set
>> -# CONFIG_USB_LED_TRIG is not set
>> -# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
>> -CONFIG_LEDS_TRIGGERS=y
>> -CONFIG_EEEPC_LAPTOP=y
>> +# CONFIG_EEEPC_LAPTOP is not set
>>
>> This last one was the biggest problem for me.
>> I started with x86_64 defconfig.
> 
> # grep LED .config
> # grep LEDS .config
> # grep EEPC .config
> # make oldconfig
> (...)
> *
> * LED Support
> *
> LED Support (NEW_LEDS) [Y/?] (NEW) y
>   LED Class Support (LEDS_CLASS) [M/y/?] (NEW) n
> 
> So we still are stuck.
> 
> Udo
> 

Please post your .config file.

-- 
~Randy

