Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEB1BB781
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 17:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfIWPHI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 11:07:08 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57808 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfIWPHI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 11:07:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NF73fh089611;
        Mon, 23 Sep 2019 10:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569251223;
        bh=1dIFHJa5GMgHtqK1tr5O5RDeOMNxuXY7Y8ZccX6G4bg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cZCk4z/y0dO+RmJ7PV1Qj2cEHHFy8oexfcEDpUh3GDzvytWV4n8Jdyr51sSS4Hxx1
         dpi9rxmEY3LJGkcaNbYEuWHcNGVlhQr1vRmf9K325lsA5YGz7v0/al9uI17P/q/FlR
         Oz8yjWIsNztf2gCnPd/0jlxKtzn5atAe2/BcLyBM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NF732w077633;
        Mon, 23 Sep 2019 10:07:03 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 10:06:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 10:06:57 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NF733b047566;
        Mon, 23 Sep 2019 10:07:03 -0500
Subject: Re: [PATCH v8 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-7-dmurphy@ti.com>
 <135685e7-e3cc-da4d-3349-9affba5b89cc@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f371559c-f9f6-d799-d741-afa28c5b89bc@ti.com>
Date:   Mon, 23 Sep 2019 10:11:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <135685e7-e3cc-da4d-3349-9affba5b89cc@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/21/19 1:08 PM, Jacek Anaszewski wrote:
> Dan,
>
> One more remark below.
>
> On 9/20/19 7:41 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The framework allows for dynamically setting individual LEDs
>> or setting brightness levels of LEDs and updating them virtually
>> simultaneously.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                 |  10 +
>>   drivers/leds/Makefile                |   1 +
>>   drivers/leds/led-class-multicolor.c  | 316 +++++++++++++++++++++++++++
>>   include/linux/led-class-multicolor.h |  76 +++++++
>>   4 files changed, 403 insertions(+)
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 6e7703fd03d0..cfb1ebb6517f 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
> [...]
>> +static int led_multicolor_init_color_dir(struct led_classdev_mc_data *data,
>> +					 struct led_classdev_mc *mcled_cdev)
>> +{
>> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>> +	u32 color_id;
>> +	int ret;
>> +	int i, j = 0;
>> +
>> +	data->mcled_cdev = mcled_cdev;
>> +
>> +	ret = sysfs_create_group(&led_cdev->dev->kobj, &led_color_group);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < LED_COLOR_ID_MAX; i++) {
>> +		color_id = (mcled_cdev->available_colors & (1 << i));
> Please use bitops for accessing available_colors.
>
>> +		if (color_id) {
> Here you need: if (test_bit(i, &mcled_cdev->available_colors))

Then I can get rid of the color_id and just use test_bit.

Then your other request for color_mask is not needed because we can just 
test against the incremental 'i'

Dan

>> +			ret = led_multicolor_init_color(data, mcled_cdev, i, j);
>> +			if (ret)
>> +				break;
>> +
>> +			j++;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
