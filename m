Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD40B03E6
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 20:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbfIKStG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 14:49:06 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41896 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730069AbfIKStF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 14:49:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BImcY7051732;
        Wed, 11 Sep 2019 13:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568227718;
        bh=1xSERSqIkAtP/bLDu3RUnmyzW6/XzR17kn4wt0JSzQE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LdwUSNv6ZbXANbfxNoJYEDv5rETOOMt04lMlvG8RYbaxYrQHBgvNg3m/RdnpG5lq2
         Yjj10rCiVfbF39DafaKdYQ1v6fluk0Bw4dMFmGqNwMCLhe7HBe0KyxPFnkmi3pGYvI
         6TMFbQLtFu+VsK3BApMVojHliBROeOnBpSjZJAI4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BImbgv068137
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Sep 2019 13:48:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 13:48:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 13:48:37 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BImaxV119829;
        Wed, 11 Sep 2019 13:48:36 -0500
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>
CC:     <lee.jones@linaro.org>, <jingoohan1@gmail.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-fbdev@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-3-andreas@kemnade.info>
 <20190911102533.not4ta3xwgm6bhjo@holly.lan>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
Date:   Wed, 11 Sep 2019 13:48:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911102533.not4ta3xwgm6bhjo@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 9/11/19 5:25 AM, Daniel Thompson wrote:
> On Tue, Sep 10, 2019 at 11:29:09PM +0200, Andreas Kemnade wrote:
>> For now just enable it in the probe function to allow i2c
>> access. Disabling also means resetting the register values
>> to default and according to the datasheet does not give
>> power savings
>>
>> Tested on Kobo Clara HD.
>>
>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>> ---
>> changes in v2:
>> - simplification
>> - correct gpio direction initialisation
>>
>>   drivers/video/backlight/lm3630a_bl.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
>> index 8f84f3684f04..9d0639d4202d 100644
>> --- a/drivers/video/backlight/lm3630a_bl.c
>> +++ b/drivers/video/backlight/lm3630a_bl.c
>> @@ -12,6 +12,8 @@
>>   #include <linux/uaccess.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/regmap.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio.h>
> Nitpicking... but I don't think linux/gpio.h is used anymore.
>
>
>>   #include <linux/pwm.h>
>>   #include <linux/platform_data/lm3630a_bl.h>
>>   
>> @@ -48,6 +50,7 @@ struct lm3630a_chip {
>>   	struct lm3630a_platform_data *pdata;
>>   	struct backlight_device *bleda;
>>   	struct backlight_device *bledb;
>> +	struct gpio_desc *enable_gpio;
>>   	struct regmap *regmap;
>>   	struct pwm_device *pwmd;
>>   };
>> @@ -535,6 +538,13 @@ static int lm3630a_probe(struct i2c_client *client,
>>   	}
>>   	pchip->pdata = pdata;
>>   
>> +	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
>> +						GPIOD_OUT_HIGH);
>> +	if (IS_ERR(pchip->enable_gpio)) {
>> +		rval = PTR_ERR(pchip->enable_gpio);
>> +		return rval;

the enable gpio is optional so if it fails you log the error and move on

Also on driver removal did you want to set the GPIO to low to disable 
the device to save power?

Dan


>> +	}
>> +
>>   	/* chip initialize */
>>   	rval = lm3630a_chip_init(pchip);
>>   	if (rval < 0) {
>> -- 
>> 2.20.1
>>
