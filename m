Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93480AE942
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 13:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730996AbfIJLic (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 07:38:32 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40648 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbfIJLic (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 07:38:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ABcM1W128774;
        Tue, 10 Sep 2019 06:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568115502;
        bh=voPq94gyTYBJharks+/kgS8tgNA07rMeqP3KLw0SvmU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=acvOFDjh8pz/X1m1a2mb53mPM1XTchkC7mjBSqZthh7TnCiY99+8awOVF0GL4c5wK
         6fnO5UiVd4CxVEtQNQ1WGlVCHfMxdprkB09sTLD+w8nyoU+gGImeZluIecCpoK9hiw
         MzFyNy3J+tB/+Q3lU84BMNxU60+tIz83SW/h8ZoI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ABcMRi079886
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Sep 2019 06:38:22 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 06:38:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 06:38:21 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ABcJdD005202;
        Tue, 10 Sep 2019 06:38:19 -0500
Subject: Re: [PATCH v5 4/4] backlight: add led-backlight driver
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>, <dmurphy@ti.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dridevel@lists.freedesktop.org>, <tomi.valkeinen@ti.com>
References: <20190910105946.23057-1-jjhiblot@ti.com>
 <20190910105946.23057-5-jjhiblot@ti.com>
 <20190910112622.iflmknh5qplbfoyu@holly.lan>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <8c80495a-440e-05c6-22c8-cf05d4f6b611@ti.com>
Date:   Tue, 10 Sep 2019 13:38:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910112622.iflmknh5qplbfoyu@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 10/09/2019 13:26, Daniel Thompson wrote:
>
>>   endmenu
>> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
>> index 63c507c07437..2a67642966a5 100644
>> --- a/drivers/video/backlight/Makefile
>> +++ b/drivers/video/backlight/Makefile
>> @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
>>   obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>>   obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>>   obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
>> +obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
>> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
>> new file mode 100644
>> index 000000000000..a72456e11fb9
>> --- /dev/null
>> +++ b/drivers/video/backlight/led_bl.c
>> @@ -0,0 +1,264 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
>> + * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> + *
>> + * Based on pwm_bl.c
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/gpio/consumer.h>
> Maybe this is a nitpick but it is one I have now raised three times and
> I don't recall any response, what symbols from this header are used in
> this file?
>
> AFAICT everything defined in this header includes the string "gpio" and
> that string doesn't appear anywhere in the file (except this line).
>
>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
> Come to think of it, are you sure you need this include? devm_kzalloc()
> doesn't comes from this file.
>
>
>> +#define BKL_FULL_BRIGHTNESS 255
> This is unused. Please remove.
>
>
> Other than that, looks good!

Thanks for the quick review. I forgot to cleanup the headers. I'll fix 
that now

JJ

>
>
> Daniel.
