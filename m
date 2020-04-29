Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577BA1BDCBB
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2020 14:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgD2Mzw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Apr 2020 08:55:52 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43668 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgD2Mzw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2020 08:55:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TCtltE074490;
        Wed, 29 Apr 2020 07:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588164947;
        bh=+/D/YE4iaDfh77kDeL/eqDeYukrWzpHHleyItETnDQw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CVK5NnCMdxn5RUvsbPrUj5m+I1T/a6YCsm5BNlXl+3d4BMvHXcL3KKJhzHplgUlt7
         SxF7x9Mov6hSfdbntYJr6iNaTHI/i2rfbQGwv870y9BNgeYor5DIi3PGtUkC/TTfAL
         YgwUC6Ng57+1MnoffzFKg/1kevE1Y7kgdCg7gYrA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TCtlIB104920
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 07:55:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 07:55:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 07:55:47 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TCtkFf077209;
        Wed, 29 Apr 2020 07:55:47 -0500
Subject: Re: [PATCH v21 11/16] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200428160338.2793-1-dmurphy@ti.com>
 <20200428160338.2793-12-dmurphy@ti.com>
 <5225c7bf-1e0d-5465-132e-54a3071cf518@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <9738553f-06a9-a57b-0c99-172b80dcb4f6@ti.com>
Date:   Wed, 29 Apr 2020 07:49:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5225c7bf-1e0d-5465-132e-54a3071cf518@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/28/20 3:59 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 4/28/20 6:03 PM, Dan Murphy wrote:
>> Add multicolor framework support for the lp55xx family.
>>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                      |   1 +
>>   drivers/leds/leds-lp5521.c                |  14 +-
>>   drivers/leds/leds-lp5523.c                |  14 +-
>>   drivers/leds/leds-lp5562.c                |  13 +-
>>   drivers/leds/leds-lp55xx-common.c         | 178 +++++++++++++++++++---
>>   drivers/leds/leds-lp55xx-common.h         |  14 +-
>>   drivers/leds/leds-lp8501.c                |  14 +-
>>   include/linux/platform_data/leds-lp55xx.h |   8 +
>>   8 files changed, 209 insertions(+), 47 deletions(-)
>>
>
> For patches 10/16 - 16/16:
>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>
Ack and added

Dan

