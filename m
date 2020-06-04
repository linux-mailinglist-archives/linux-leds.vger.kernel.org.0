Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A65F1EE892
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 18:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgFDQ2N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 12:28:13 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51464 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729587AbgFDQ2N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 12:28:13 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 054GS89Q024981;
        Thu, 4 Jun 2020 11:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591288088;
        bh=DbIrDosprZ370hynC/ymJXxIAmAhJt0icaNJ5m1eOQA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dY6XwrVtZSv+9Lsb308s6ra0dpmeHoiygHRlNpcF4bGk8PQhTFrhaEUjkERoztxMh
         JDSqDS2AIJ4aU3zJfFoG/lopTh9DA+xQ7cI/lyBFl6ZptGQO6VPYnxM1tghxK6Gyq6
         WLhHV4UmbuWDJCs8kNPZ45ORMFnTxgbUg1Qw5GhU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 054GS84Z057086
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Jun 2020 11:28:08 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 4 Jun
 2020 11:28:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 4 Jun 2020 11:28:07 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 054GS7rp108958;
        Thu, 4 Jun 2020 11:28:07 -0500
Subject: Re: [PATCH v25 03/16] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-4-dmurphy@ti.com> <20200527135848.GB5011@amd>
 <d22658c2-07e2-74e6-dc2b-4b64fd9789dd@ti.com>
 <20200531190625.GA30537@duo.ucw.cz>
 <c03ce8da-0895-2e1f-0a4c-2b3d9fae8d4d@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <06bb7ff7-0a41-f29f-ba2f-9cb041b5cdc7@ti.com>
Date:   Thu, 4 Jun 2020 11:28:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c03ce8da-0895-2e1f-0a4c-2b3d9fae8d4d@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 6/1/20 4:34 AM, Jacek Anaszewski wrote:
> Hi Pavel and Dan,
>
> On 5/31/20 9:06 PM, Pavel Machek wrote:
>> Hi!
>>
>>>>> +          There can only be one instance of the ti,led-bank
>>>>> +          property for each device node.  This is a required node 
>>>>> is the LED
>>>>> +          modules are to be backed.
>>>> I don't understand the second sentence. Pretty sure it is not valid
>>>> english.
>>>
>>>
>>> If I make these changes is this still viable for 5.8 or would you 
>>> then go
>>> into 5.9?
>>
>> It really depends if we get -rc8 or not, and if you'll need to do any
>> changes to C code or not...
>
> I think that we need to simmer such a big extension of the LED
> subsystem for a whole cycle in linux-next, especially taking into
> account addition of new sysfs interface, that is bit quirky.
>
> Effectively 5.8 seems to not have been viable since few weeks.
>
After thinking about this for a while I would actually think to have 
this in 5.9.

Either 5.7 or 5.8 will be the 2020 LTS and such a new interface would be 
best suited for intermediate stable releases that get EOL'd faster.

This way we don't have to back port bug fixes for 2 years.

Dan

