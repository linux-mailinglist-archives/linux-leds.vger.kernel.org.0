Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726AC22B134
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 16:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgGWOXd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 10:23:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38082 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbgGWOXd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 10:23:33 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06NENNLd061770;
        Thu, 23 Jul 2020 09:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595514203;
        bh=7TibUZvmfbZRkiZMT2Ld/r7+PKFN+78BwQdLNPZ3HrU=;
        h=From:Subject:To:CC:References:Date:In-Reply-To;
        b=Ty+z/8PzGkAFUVAoTN9RW19SCmeWd1a428s1cnNeCDJKPnKjeVE0eGSXRx1cq/qXY
         XXCdozVxA9O2VEFyOLbGeS8vzDa0PPEp9FTTeFPGGJykKot2BsOdMyXUJF9thQhELq
         rEs7jAtszwoHHPp9ZzuYf/E4mTJz1zVcYAMBevKo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06NENNIV073361
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jul 2020 09:23:23 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 09:23:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 09:23:22 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NENMO7068286;
        Thu, 23 Jul 2020 09:23:22 -0500
From:   Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: add orange color
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>
CC:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <jacek.anaszewski@gmail.com>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <1a8a489b-95e0-58a6-5454-1c45a7ef156c@ti.com>
 <20200723154706.7aa41188@dellmb.labs.office.nic.cz>
Message-ID: <4b363b37-5649-fd98-1d43-99810cc86075@ti.com>
Date:   Thu, 23 Jul 2020 09:23:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723154706.7aa41188@dellmb.labs.office.nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 7/23/20 8:47 AM, Marek Behún wrote:
> On Thu, 23 Jul 2020 08:40:09 -0500
> Dan Murphy<dmurphy@ti.com>  wrote:
>
>> Marek
>>
>> On 7/23/20 7:57 AM, Marek Behún wrote:
>>> Many network devices have LEDs with green and orange color, instead
>>> of green and yellow.
>> Can't we use amber?
>>
>> Dan
>>
> :D
>
> Dan
> 1. amber is different from orange (according to wikipedia)
> 2. many technical people know the names of at most 12 different colors,
>     amber is not among them
> 3. i can't even find the translation of amber to slovak language :D
> 4. are you trolling me? :D

Yes I know that by definition amber is different from orange.  It might 
be better to add the other 6 colors too.

And I found the Slovak translation for amber "jantárový" here 
https://glosbe.com/en/sk/amber ;)

Trolling, no, just wanted to know why amber could not be used. Seemed 
like a relevant question to me.

Dan

