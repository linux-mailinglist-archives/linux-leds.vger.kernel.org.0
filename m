Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5980322C88F
	for <lists+linux-leds@lfdr.de>; Fri, 24 Jul 2020 16:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGXO4T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Jul 2020 10:56:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45074 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgGXO4T (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Jul 2020 10:56:19 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06OEu7B5115527;
        Fri, 24 Jul 2020 09:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595602567;
        bh=5Pzb7U2pXLOrUJ5dm8wIUf7gemE//1Sp54yu3bDjXQI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MFsDHo3xQE09b/89hE81FIT88bO1+AeQ2rffD8F9NgmeqfugfoHOnKdJSx6V+/S0O
         ag0UHr7+4S2Yv0Qt64BsaW0HYTx1Sd6yqhLMAuOtWOKQ9DiDEjSMIBwvMeqMJHy6zs
         dox5I8yuCLN3bHDh7jMOq0hT7BWcyNtmeEn5YFKk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06OEu7C7018779
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jul 2020 09:56:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Jul 2020 09:56:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Jul 2020 09:56:07 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06OEu6jB111702;
        Fri, 24 Jul 2020 09:56:06 -0500
Subject: Re: [PATCH v7 2/3] leds: initial support for Turris Omnia LEDs
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>
References: <20200723125320.3572-1-marek.behun@nic.cz>
 <20200723125320.3572-3-marek.behun@nic.cz>
 <20200724105825.wyorw3jr2kaa3ucr@duo.ucw.cz>
 <20200724140829.74167055@dellmb.labs.office.nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <05728170-2cbd-5f5d-e245-c80e24896c0d@ti.com>
Date:   Fri, 24 Jul 2020 09:56:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724140829.74167055@dellmb.labs.office.nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 7/24/20 7:08 AM, Marek Behún wrote:
> On Fri, 24 Jul 2020 12:58:25 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>
>> Hi!
>>
>>> This adds basic support for LEDs on the front side of CZ.NIC's
>>> Turris Omnia router.
>>>
>>> There are 12 RGB LEDs. The controller supports HW triggering mode
>>> for the LEDs, but this driver does not support it yet, and sets all
>>> the LEDs defined in device-tree into SW mode upon probe.
>>>
>>> This driver uses the multicolor LED framework.
>>>
>>> Signed-off-by: Marek Behún <marek.behun@nic.cz>
>>> Reviewed-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/Kconfig             |  11 ++
>>>   drivers/leds/Makefile            |   1 +
>>>   drivers/leds/leds-turris-omnia.c | 295
>>> +++++++++++++++++++++++++++++++ 3 files changed, 307 insertions(+)
>>>   create mode 100644 drivers/leds/leds-turris-omnia.c
>> Whoever told you to use defines here was evil:
> I think it was that way when it was first proposed, sometime last year,
> but Dan complained about magic numbers, so I changed it to macros :D

Ah yes I did make a comment about magic numbers but did not explicitly 
ask for macros, enum would have sufficed and

I was more concerned about the buffer length being consistent in the 
file since it was hard coded twice in two different functions.

So I am only partially evil.

Dan


