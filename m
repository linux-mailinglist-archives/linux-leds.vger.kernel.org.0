Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5614CC4198
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 22:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfJAUKw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 16:10:52 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53788 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfJAUKw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 16:10:52 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91KAl3Y082677;
        Tue, 1 Oct 2019 15:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569960647;
        bh=tHzgtqZw4ISfWYUY+AFYJlJ8yHApfyopEUBN88b1i8A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dLk1H9ObPJKTBFbDNXDIYw1gkquyYpjOCy/eJRQyP/0uddh5fLH1oSrmLNVqeJ6HZ
         8toT+6ortm6MXidFp+ZK26SICQJxROwixmprA7rhmZKdsMhTv2tFcPmOIquHMwKr2R
         xgX9lzgt4pNOXBuOUrVz5dLeAhRoHjgyN3p/hBIE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91KAldO050408
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 15:10:47 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 15:10:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 15:10:36 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91KAk4J048809;
        Tue, 1 Oct 2019 15:10:46 -0500
Subject: Re: [PATCH 5/5] leds: lm3601x: Convert class registration to device
 managed
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191001180439.8312-1-dmurphy@ti.com>
 <20191001180439.8312-5-dmurphy@ti.com>
 <66354452-f6f9-416d-0955-63914cb32746@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b7d7ef26-a163-4ad2-492e-057fc55dc234@ti.com>
Date:   Tue, 1 Oct 2019 15:11:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <66354452-f6f9-416d-0955-63914cb32746@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/1/19 2:39 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On 10/1/19 8:04 PM, Dan Murphy wrote:
>> Convert LED flash class registration to device managed class
>> registration API.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/leds-lm3601x.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/leds-lm3601x.c
>> index b02972f1a341..a68e4f97739c 100644
>> --- a/drivers/leds/leds-lm3601x.c
>> +++ b/drivers/leds/leds-lm3601x.c
>> @@ -350,8 +350,7 @@ static int lm3601x_register_leds(struct lm3601x_led *led,
>>   	init_data.devicename = led->client->name;
>>   	init_data.default_label = (led->led_mode == LM3601X_LED_TORCH) ?
>>   					"torch" : "infrared";
>> -
>> -	return led_classdev_flash_register_ext(&led->client->dev,
>> +	return devm_led_classdev_flash_register_ext(&led->client->dev,
>>   						&led->fled_cdev, &init_data);
> You need to remove led_classdev_flash_unregister(&led->fled_cdev) from
> lm3601x_remove() to complete this improvement.
>
Ack.
