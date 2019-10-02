Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38480C87D9
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 14:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbfJBMEX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 08:04:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49702 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbfJBMER (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 08:04:17 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92C4AB1004749;
        Wed, 2 Oct 2019 07:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570017850;
        bh=XiH9vbzdQBfFacUASUU14I8o29awYdV73bV850eNXew=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NqJd04S/8UgjtxckxIFx7JrYPJ0v1CCSYaIHxeeMZiJUbpVgdCvEHjnzUZLZDpQf6
         SH0q+3WjsR9gePxuRuQfpW2WVc6oQKClIG5KMwfi2AgUF1iVSZw9liXpnpi5+ztyZ+
         9yJlQNIr3N2AKCMR/IZqxBaBDRf0N3eCCrbvZw+g=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92C4AOu075359;
        Wed, 2 Oct 2019 07:04:10 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:04:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:03:59 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92C49w9079713;
        Wed, 2 Oct 2019 07:04:09 -0500
Subject: Re: [PATCH 4/5] leds: flash: Add devm_* functions to the flash class
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191001180439.8312-1-dmurphy@ti.com>
 <20191001180439.8312-4-dmurphy@ti.com>
 <218b33ac-506b-2014-d37f-3da2da323388@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6e33734d-f1df-bfd9-ecc5-8f013bf86a78@ti.com>
Date:   Wed, 2 Oct 2019 07:04:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <218b33ac-506b-2014-d37f-3da2da323388@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/1/19 4:06 PM, Jacek Anaszewski wrote:
> Dan,
>
> Thank you for the patch. One funny omission caught my
> eye here and in led-class.c when making visual comparison.
> Please refer below.
>
> On 10/1/19 8:04 PM, Dan Murphy wrote:
>> Add the missing device managed API for registration and
>> unregistration for the LED flash class.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/led-class-flash.c  | 50 +++++++++++++++++++++++++++++++++
>>   include/linux/led-class-flash.h | 14 +++++++++
>>   2 files changed, 64 insertions(+)
>>
>> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
>> index 60c3de5c6b9f..c2b4fd02a1bc 100644
>> --- a/drivers/leds/led-class-flash.c
>> +++ b/drivers/leds/led-class-flash.c
>> @@ -327,6 +327,56 @@ void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev)
>>   }
>>   EXPORT_SYMBOL_GPL(led_classdev_flash_unregister);
>>   
>> +static void devm_led_classdev_flash_release(struct device *dev, void *res)
>> +{
>> +	led_classdev_flash_unregister(*(struct led_classdev_flash **)res);
>> +}
>> +
>> +int devm_led_classdev_flash_register_ext(struct device *parent,
>> +				     struct led_classdev_flash *fled_cdev,
>> +				     struct led_init_data *init_data)
>> +{
>> +	struct led_classdev_flash **dr;
>> +	int ret;
>> +
>> +	dr = devres_alloc(devm_led_classdev_flash_release, sizeof(*dr),
>> +			  GFP_KERNEL);
>> +	if (!dr)
>> +		return -ENOMEM;
>> +
>> +	ret = led_classdev_flash_register_ext(parent, fled_cdev, init_data);
>> +	if (ret) {
>> +		devres_free(dr);
>> +		return ret;
>> +	}
>> +
>> +	*dr = fled_cdev;
>> +	devres_add(parent, dr);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_flash_register_ext);
>> +
>> +static int devm_led_classdev_flash_match(struct device *dev,
>> +					      void *res, void *data)
>> +{
>> +	struct fled_cdev **p = res;
> We don't have struct fled_cdev. This name is used for variables
> of struct led_clssdev_flash type in drivers.
>
> We don't get even compiler warning here because this is cast
> from void pointer.
>
> Funny thing is that you seem to have followed similar flaw in
> devm_led_classdev_match() where struct led_cdev has been
> introduced.
>
> We need to fix both cases.

OK I will fix the leds-class in a separate patch in case it causes issues.

Dan

