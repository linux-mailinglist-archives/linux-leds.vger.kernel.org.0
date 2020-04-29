Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268901BDCBE
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2020 14:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgD2M4O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Apr 2020 08:56:14 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57066 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgD2M4O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2020 08:56:14 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TCuAAm080212;
        Wed, 29 Apr 2020 07:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588164970;
        bh=AR3qTisxwY2ajPBIFrmPomkWxiBKguIAfuOxuTrvtfs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LtGQzHfQd9wumaUk1FMScn+QXAJJCDISkOWcnbvftt8e0P2XA7mytc9K2hAG1us/v
         Ab+MVQ6RDyCR4O5Pbczw7OEgbaQQ3hCTEHNuoMssKqWm3XaIQkx0QuRCnPfoLcSga/
         Hur2wh9yOvIsw46axvmU3hPxF6r3Ri38uJvhtKu0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TCuAGC037068
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 07:56:10 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 07:56:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 07:56:10 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TCuAKt078130;
        Wed, 29 Apr 2020 07:56:10 -0500
Subject: Re: [PATCH v21 04/16] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200428160338.2793-1-dmurphy@ti.com>
 <20200428160338.2793-5-dmurphy@ti.com>
 <d3020c80-90f7-e73a-5ff3-6c503b9fdea9@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <fdb628e6-69c3-60f3-5c98-77ab44ad6645@ti.com>
Date:   Wed, 29 Apr 2020 07:50:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d3020c80-90f7-e73a-5ff3-6c503b9fdea9@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/28/20 3:25 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thanks for the update. There is one remnant from the
> previous stages that you already scheduled for removal AFAIR.
>
> On 4/28/20 6:03 PM, Dan Murphy wrote:
>> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
>> The difference in these parts are the number of
>> LED outputs where the:
>>
>> LP5036 can control 36 LEDs
>> LP5030 can control 30 LEDs
>> LP5024 can control 24 LEDs
>> LP5018 can control 18 LEDs
>> LP5012 can control 12 LEDs
>> LP5009 can control 9 LEDs
>>
>> The device has the ability to group LED output into control banks
>> so that multiple LED banks can be controlled with the same mixing and
>> brightness.  Inversely the LEDs can also be controlled independently.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
> [...]
>> +
>> +        init_data.fwnode = child;
>> +        init_data.devicename = priv->client->name;
>
> Namely this line. We don't need devicename for new drivers like this.
>
Removed

Dan
