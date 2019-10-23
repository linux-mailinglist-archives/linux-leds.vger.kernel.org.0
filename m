Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3ACE19FC
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 14:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfJWMZo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 08:25:44 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46734 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfJWMZn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Oct 2019 08:25:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9NCPevr108427;
        Wed, 23 Oct 2019 07:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571833540;
        bh=snNVf3bc8UtAfUt7sWc/Ao17r0XA6k0DLqh6nrpj5WU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OjQIaDmgEPwwgfH0UshyjUySGXkavlhKcvCXh7pgBgWt3KK5FXIMjTi/cV+LIe2n9
         ZbWOxcCRIJ7Bu3lPHIiuBQfCW9lQ6OS3OrozM2ZcCy9AKvS1b7TXuqFxUJDOOAahK4
         WwcHnwymrnc0iR9ZKsTq1TmhLUXOlT2mSFHz8lRA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9NCPe0R023680
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Oct 2019 07:25:40 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 07:25:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 07:25:30 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9NCPe6t073320;
        Wed, 23 Oct 2019 07:25:40 -0500
Subject: Re: [PATCH v14 13/19] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-14-dmurphy@ti.com>
 <2da123af-8cbe-e143-73f2-ca741e0923d2@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3b0a4424-b742-0f19-94ca-1ed24aa8692d@ti.com>
Date:   Wed, 23 Oct 2019 07:25:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2da123af-8cbe-e143-73f2-ca741e0923d2@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/18/19 5:02 PM, Jacek Anaszewski wrote:
> Dan,
>
> I forgot to mention one thing below.
>
> On 10/18/19 2:25 PM, Dan Murphy wrote:
>> Add multicolor framework support for the lp55xx family.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
> [...]
>
>> -	led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
>>   
>>   	if (led->chan_nr >= max_channel) {
>>   		dev_err(dev, "Use channel numbers between 0 and %d\n",
>> @@ -170,18 +242,13 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>>   		return -EINVAL;
>>   	}
>>   
>> -	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
>> -	led->cdev.groups = lp55xx_led_groups;
>> -
>> -	if (pdata->led_config[chan].name) {
>> -		led->cdev.name = pdata->led_config[chan].name;
>> -	} else {
>> -		snprintf(name, sizeof(name), "%s:channel%d",
>> -			pdata->label ? : chip->cl->name, chan);
>> -		led->cdev.name = name;
>> -	}
>> +#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
>> +	if (pdata->led_config[chan].num_colors > 1)
>> +		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
>> +	else
>> +#endif
> This looks odd. I think that no-ops from previous version were OK.

Hmm.  I will add it back but there were issues compiling with modules.

But maybe if I use IS_ENABLED in the header that may solve the issue

Dan


