Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA59E19F6
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 14:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389112AbfJWMXv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 08:23:51 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46452 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731061AbfJWMXu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Oct 2019 08:23:50 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9NCNlt2107907;
        Wed, 23 Oct 2019 07:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571833427;
        bh=1grGix7INnquJ+nCoUdro+vIkLychKSPVJAg0lZ8wk0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PVPvSHOtEG25iwu/5SPmVOwCgEW2vtGv44Dp5ZzLmoNhpqoyRT0NdflYU8XmkGLke
         DmX521l0GQ9XsCKEwdDXvc6g905Ps+bYvDgZxtEGwxO+P8lagC8/u41fXsgeHcTucL
         YOi8Utk/caqmJYVeJjHxh4roqPDEc4GH7WdvgdYQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9NCNkx5021415
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Oct 2019 07:23:46 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 07:23:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 07:23:36 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9NCNkEf000439;
        Wed, 23 Oct 2019 07:23:46 -0500
Subject: Re: [PATCH v14 04/19] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-5-dmurphy@ti.com>
 <8a9084d2-184d-fa12-fd29-56bbc74c58b3@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <051c6448-ef98-0a23-4761-10a754e489a5@ti.com>
Date:   Wed, 23 Oct 2019 07:23:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8a9084d2-184d-fa12-fd29-56bbc74c58b3@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 10/18/19 4:44 PM, Jacek Anaszewski wrote:
> Dan,
>
> Thank you for the update.
>
> On 10/18/19 2:25 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via <color>_intensity files and the latter is controlled
>> via brightness file.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    |  36 +++
>>   Documentation/leds/index.rst                  |   1 +
>>   Documentation/leds/leds-class-multicolor.rst  | 100 +++++++
>>   drivers/leds/Kconfig                          |  10 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/led-class-multicolor.c           | 271 ++++++++++++++++++
>>   include/linux/led-class-multicolor.h          |  97 +++++++
>>   7 files changed, 516 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
> [...]
>>   # LED Platform Drivers
>> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
>> new file mode 100644
>> index 000000000000..453fd8e913e9
>> --- /dev/null
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -0,0 +1,271 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// LED Multi Color class interface
>> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> +
>> +#include <linux/device.h>
>> +#include <linux/init.h>
>> +#include <linux/led-class-multicolor.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include "leds.h"
>> +
>> +#define INTENSITY_NAME		"_intensity"
>> +#define MAX_INTENSITY_NAME	"_max_intensity"
>> +
>> +int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>> +				 enum led_brightness brightness,
>> +			       struct led_mc_color_conversion color_component[])
>> +{
>> +	struct led_mc_color_entry *priv;
>> +	int i = 0;
>> +
>> +	list_for_each_entry(priv, &mcled_cdev->color_list, list) {
>> +		color_component[i].color_id = priv->led_color_id;
>> +		color_component[i].brightness = brightness *
>> +					  priv->intensity / priv->max_intensity;
>> +		i++;
>> +	}
> For lines in the function above:
>
> s/component/components/

Ack


>
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
>
