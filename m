Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88141A2753
	for <lists+linux-leds@lfdr.de>; Wed,  8 Apr 2020 18:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbgDHQjI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Apr 2020 12:39:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35066 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728443AbgDHQjI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Apr 2020 12:39:08 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 038Gd2Bh049648;
        Wed, 8 Apr 2020 11:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586363942;
        bh=at0QoQUcc6+11ygTvc8A0xY0vvTEhpKksvaBjMecc1A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=DLYTr2Y4hT9b+xlOu5w6LklK6S3BKbLqWXgCy/gVXI2I4EIsXcHPxXRj/7r+hE1pC
         NkjuUo5yVsQl99Q0KlDE0c6FXMkzBI8st165IlAEn0zBRYmAFVxsZDSBAB8KFWp67j
         +zu9XgTCXTrPVvPRjSvR685vL2VS9c8OAtwaawgw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 038Gd2Kb045097
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Apr 2020 11:39:02 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Apr
 2020 11:39:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Apr 2020 11:39:01 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 038Gd11T091526;
        Wed, 8 Apr 2020 11:39:01 -0500
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
 <b27b21bf-9a7a-8233-d033-17bae43b297d@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <56b1cc39-a17e-0fe5-565b-7f42b6e1dcf1@ti.com>
Date:   Wed, 8 Apr 2020 11:33:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b27b21bf-9a7a-8233-d033-17bae43b297d@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/7/20 4:08 PM, Jacek Anaszewski wrote:
> Dan,
>
> One more nit below.
>
> On 4/2/20 10:42 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via <color>_intensity files and the latter is controlled
>> via brightness file.
> [...]
>>   # LED Platform Drivers
>> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
>> new file mode 100644
>> index 000000000000..838b1d679647
>> --- /dev/null
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -0,0 +1,206 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// LED Multi Color class interface
>> +// Copyright (C) 2019-20 Texas Instruments Incorporated - http://www.ti.com/
>> +// Author: Dan Murphy <dmurphy@ti.com>
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
>> +int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>> +				 enum led_brightness brightness)
>> +{
>> +	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
>> +	int i;
>> +
>> +	for (i = 0; i < mcled_cdev->num_colors; i++)
>> +		mcled_cdev->multicolor_info[i].color_brightness = (brightness *
> If you passed temporary array for collecting calculated brightness
> items to this function then you could remove this color_brightness
> field from struct multicolor_info.

I thought about doing it that way but I liked how each LEDs properties 
were stored in a single element in the array.

There would be no issues with referencing the array element and knowing 
everything about the specific LED like the

intensity, brightness, output channel and ID.   This eliminates any need 
for a channel map or mapping brightness to IDs or channels.

Dan

