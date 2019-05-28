Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3261D2CE5E
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2019 20:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbfE1STS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 May 2019 14:19:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48044 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727811AbfE1STS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 May 2019 14:19:18 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SIJDN0049819;
        Tue, 28 May 2019 13:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559067553;
        bh=FHBxN25oKeInyBYHIzdz2Mbx2pen9sGOw8A9sYUQEPA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wyn34Lvv7tRksgPniyeCYM+lRAS6+HPlciStbaJeE2fr7kY1DAYG8FB8csBn/+8Y5
         QEHRg9bhze1xLHslEfD38Nmp/ZFc7jqFPlW1ICByn7SUJUzncmFos3YhZNp13Hoppk
         QuwjX1JyFQB+hsfeUVPClUkwcFr7VcUaxW4bZ69k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SIJDus038031
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 13:19:13 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 13:19:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 13:19:12 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SIJCbT074115;
        Tue, 28 May 2019 13:19:12 -0500
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
 <f01ac400-efda-80a8-4d63-1e2add5e054a@gmail.com>
 <185abdd6-100c-0a71-2da9-8f556d8ea701@ti.com>
 <333167d0-4615-2fbe-e933-cbca623998ef@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e54d9d29-5daa-fd3a-a5a9-ebd2450882ee@ti.com>
Date:   Tue, 28 May 2019 13:19:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <333167d0-4615-2fbe-e933-cbca623998ef@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/28/19 12:44 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 5/28/19 7:32 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 5/27/19 3:00 PM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> Thank you for the update.
>>>
>>> One thing is missing here - we need to document how legacy brightness
>>> levels map to the sub-LED color levels, i.e. what you do in
>>> multicolor_set_brightness().
>>
>>
>> Ok so i will need to document the algorithm that is used to determine 
>> the color LED brightness.
>
> Right, and please send just an update of that single patch.
>

So you are asking for v4 with only this patch updated.


Dan

