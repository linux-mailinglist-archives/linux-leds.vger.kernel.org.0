Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF8D1152E9
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 19:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfEFRkn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 13:40:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41598 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfEFRkm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 13:40:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x46HeUqH053320;
        Mon, 6 May 2019 12:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557164430;
        bh=ZCOeWk2+oOUkpocPHyHgeoqkoSrsW6qEAAMPyc8IjJQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uUay38zGkl2mQIbvUL+OghqFyWzCDS6PCQ3eHQiA2k/y8grWM4tjCEozoemzP1ocs
         QeNqxvAxRUuzCTOolYtONBvGtQKFymhfsKzY7+n9Mv4h7om5RM+wgDAeoG7qCjiKtB
         /Eqt9LnA0YrHWAxDv+ks06+b12mdsfTpM2EBzhvQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x46HeUKA117109
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 May 2019 12:40:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 6 May
 2019 12:40:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 6 May 2019 12:40:29 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x46HeTA5088320;
        Mon, 6 May 2019 12:40:29 -0500
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Christian Mauderer <oss@c-mauderer.de>, Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
 <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
 <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com> <20190506151500.GA6221@amd>
 <3de252f0-de98-bec2-b233-8be1d38a4671@c-mauderer.de>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <8b55ddf2-379b-9012-9d91-e31ab4f6a68a@ti.com>
Date:   Mon, 6 May 2019 12:40:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3de252f0-de98-bec2-b233-8be1d38a4671@c-mauderer.de>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Christian

On 5/6/19 10:29 AM, Christian Mauderer wrote:
> On 06/05/2019 17:15, Pavel Machek wrote:
>> Hi!
>>
>>>> Of course it would have been possible to make it a lot more universal by
>>>> for example adding a prefix, a bit mask or other word lengths. But that
>>>> would have added a lot of complexity without any actual application.
>>>>
>>>
>>> I have to disagree here.  If this is supposed to be a universal SPI byte driver that
>>> needs special handling then it is either needs to be created in a universal way or needs to be made
>>> target specific.
>>>
>>
>> Let him be. The driver is good.
>>
>> If some hardware needs more flexibility, we add it.
>>
>> No need to have 1000 releases of everything.
>>
>> 									Pavel
>>
> 
> Hello Pavel,
> 
> thanks for the support.
> 
> It's a pure hobby project so I have the time to add useful features or
> to improve the description to make it clear what the drivers intention
> is. So if we find a more useful set of features it's a good idea to
> discuss it.
> 
> By the way: Although I haven't written a Linux driver yet it's not my
> first open source project. So I know that there can be a lot of
> different opinions and sometimes a lot of revisions. So no big risk of
> scaring me away.
> 

Hopefully the feedback from all is helping you with developing kernel drivers :).

One request though is can you slow down a bit in the versions?
I had 3 versions in my inbox before I had a chance to review v1.

I have been asked the same thing by someone and now I try to give at least 24-48 hours so others over seas
can get a chance to review prior to posting a new version.

Dan

> Best regards
> 
> Christian
> 
