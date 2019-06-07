Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDA6397B3
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2019 23:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729676AbfFGV0q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Jun 2019 17:26:46 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47618 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbfFGV0q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Jun 2019 17:26:46 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x57LQgpR009525;
        Fri, 7 Jun 2019 16:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559942802;
        bh=nHPsm2nmCWWAIBSZDOcvYScUIPyjPWV+nTtHwcEmS4g=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=k4qqkONAPDmTx1F2cruzmpdOlFZ3jlocX0ucw2raWcXEa0VsQtOfA018ACGutiMxW
         u8p4Y/6DutT1PuDNeDvVpwTxFao/m4V14X/w1q0NTMD6woDE0LWEljNJcrPsxftbDb
         uZ9U2cN0flb+dr2TuFjIgcevxhI51WsSzBO1T3/8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x57LQgQu101864
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 Jun 2019 16:26:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 16:26:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 16:26:42 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x57LQfCE091727;
        Fri, 7 Jun 2019 16:26:41 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <361ecc6a-b0b6-1bc9-a52b-e3531340deeb@ti.com>
Date:   Fri, 7 Jun 2019 16:26:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/7/19 4:17 PM, Oleh Kravchenko wrote:
> Dan,
>
> On 08.06.19 00:04, Dan Murphy wrote:
>> Oleh
>> But this is not really max_brightness now this is a feature and now
>> does not make sense in this context
>>>> You may need to use something different for this property or expose
>>>> a file in the driver.
>>>>
>>>>
>>> Protocol for this board define 0x32 as brightness level.
>>> This behaviur needed to keep backward compatibity.
>>>
>>>
>> Backwards compatibility to what?
> With old/new boards.

This does not make sense.

How would a device tree entry or a file that controls the blinking have 
to deal with the hardware?

If it allows feature setting then you should create a bool in the device 
tree.

el15203000-blink;

If the board supports the feature you set this and create a file to 
dis/enable the feature.

If the board does not support it then no file is created.

max_brightness for this device appears to be 1.

Dan


>> This is a new driver there should be no DT that has this compatible or
>> definition.
>>
>> I will let Rob ack or nack this node.
>>
>> Dan
>>
>
