Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 619A4DD03C
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 22:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403797AbfJRU2W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 16:28:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53280 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404558AbfJRU2L (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 16:28:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IKS3IM085329;
        Fri, 18 Oct 2019 15:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571430483;
        bh=a+GAE0sVEXOhLy6brVlHTcwN/KDv0zWpSHSOu4P36c8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YkN24xcmOMIn0U7VQzsxJBYzWI0nHZRNSIlCd3PeJdqcVkqxl/Vq7GXzK0Cx0PIrG
         wkHWok4zRTKOwXMROQyN+5u03K3V1Wj26OVXs3gNgIwU0oR2a2XewH75iB8hsmLqRW
         J5eZvK7/x5vr2uV1v6JtVPyOcSBusdta861oOtN8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IKS36B024931
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 15:28:03 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 15:28:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 15:27:55 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IKS3wP067488;
        Fri, 18 Oct 2019 15:28:03 -0500
Subject: Re: [PATCH v14 12/19] leds: lp55xx: Convert LED class registration to
 devm_*
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-13-dmurphy@ti.com>
 <855cd70e-69d5-c5fe-3eb1-d0faee9327c6@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b7d84fe5-8a19-2635-c696-06d539cff3d3@ti.com>
Date:   Fri, 18 Oct 2019 15:27:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <855cd70e-69d5-c5fe-3eb1-d0faee9327c6@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/18/19 1:02 PM, Jacek Anaszewski wrote:
> Dan,
>
> Thank you for the patch.
>
> On 10/18/19 2:25 PM, Dan Murphy wrote:
>> Convert the LED class registration calls to the LED devm_*
>> registration calls.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/leds-lp5521.c        |  9 +++------
>>   drivers/leds/leds-lp5523.c        |  9 +++------
>>   drivers/leds/leds-lp55xx-common.c | 15 +--------------
>>   drivers/leds/leds-lp55xx-common.h |  2 --
>>   drivers/leds/leds-lp8501.c        |  9 +++------
>>   5 files changed, 10 insertions(+), 34 deletions(-)
> What about drivers/leds/leds-lp5562.c?
>
Ack I will make that change too.

Dn

