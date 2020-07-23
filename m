Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBBB22B836
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 22:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgGWUzF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 16:55:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51962 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgGWUzE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 16:55:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06NKssYa094338;
        Thu, 23 Jul 2020 15:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595537694;
        bh=a08ZrlhXg1JMq4HYLTw9jqCMrn0ohoTX+er5X8D6D4I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CHhc68phBwfLqm0YNQjlXDzzC/WwcB68ph8ADpMb1FupoCvqEfgfnpra/J11s3gSA
         46s5/UNXMgNId0nvXlayRbDjyO2kiOP9P9EJgKJFaXii8B/V8fbUFQAIEGzbV3odnC
         32K68dkfnaly70eXKbpJPcLKmUB9A+eeWSZzgQ44=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06NKssRc034549
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jul 2020 15:54:54 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 15:54:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 15:54:54 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NKsr8U027944;
        Thu, 23 Jul 2020 15:54:53 -0500
Subject: Re: [PATCH] leds: add orange color
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd> <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
 <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
 <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
 <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
 <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <158418af-dd48-65e3-2349-14b1e9792501@ti.com>
Date:   Thu, 23 Jul 2020 15:54:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi

On 7/23/20 3:39 PM, Pavel Machek wrote:
> Hi!
>
>>>>>>> Many network devices have LEDs with green and orange color, instead of
>>>>>>> green and yellow.
>>>>>> Is it likely that we see device having both yellow and orange LEDs?
>>>>> Why should we?
>>>> This question actually refers to the below sentence...
>>>>
>>>>>> I'd simply lie and say those LEDs are yellow...
>>>> So, why do you think we should strive to limit the number
>>>> of color definitions?
>>> Because there's infinitely many colors :-). And programmers are bad at
>>> differentiating them. You can't really tell wavelength of light by
>>> looking at it.
>>>
>>> I mean.. yes, maybe we can add orange, pink, green-blue, violet,
>>> ... white at different temperatures ...
>>>
>>> It will be rather long list.
>> I think that we should allow setting the LED color name after
>> what manufacturer claims it is.
> Well, someone can try to compile list of common colors, and convince
> me that this list is good enough...
>
> ...but really, unless there's device where there are leds of
> yellow/orange color... it may be easier to keep the current list.

Marek indicated in his response to me that

2. many technical people know the names of at most 12 different colors,
    amber is not among them

So maybe he can put the list together.

Dan

