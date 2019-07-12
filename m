Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702D567090
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2019 15:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfGLNwt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Jul 2019 09:52:49 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40956 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbfGLNwt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Jul 2019 09:52:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6CDqd9i084341;
        Fri, 12 Jul 2019 08:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562939559;
        bh=meFXgNrWFMAJFlDbssv3deEMf3ehyrCBz7/CcuE5Iis=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=i638SYldqyQVmOzdQj9fgCo6Ip9tBbbaugPy7+4iWUJX+5FD2/OnPE+WB8Tu4m5X1
         xm8U+xfWBVHzJRSfXkikGu/PLMWx4kNyb/kN0ancSag5/jNuepDwKQopHubhAZGCPI
         H8kxSwtZomlLTNq7YGRiBNcJW00QF5TkMCN5AYjw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6CDqd3F094482
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Jul 2019 08:52:39 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Jul 2019 08:52:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Jul 2019 08:52:39 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6CDqabN012751;
        Fri, 12 Jul 2019 08:52:37 -0500
Subject: Re: [PATCH v3 1/4] leds: Add of_led_get() and led_put()
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
        <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-2-jjhiblot@ti.com> <20190710190949.GA22995@amd>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <da911df6-876e-802e-2953-5293b01789f7@ti.com>
Date:   Fri, 12 Jul 2019 15:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710190949.GA22995@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

hi Pavel

On 10/07/2019 21:09, Pavel Machek wrote:
> On Wed 2019-07-10 14:39:29, Jean-Jacques Hiblot wrote:
>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> This patch adds basic support for a kernel driver to get a LED device.
>> This will be used by the led-backlight driver.
>>
>> Only OF version is implemented for now, and the behavior is similar to
>> PWM's of_pwm_get() and pwm_put().
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>>
>>
>> @@ -214,6 +215,55 @@ static int led_resume(struct device *dev)
>>   
>>   static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
>>   
>> +static int led_match_led_node(struct device *led_dev, const void *data)
>> +{
>> +	return led_dev->of_node == data ? 1 : 0;
>> +}
> Get rid of the "? 1 : 0"?
OK
>
>
>> +	led_node = of_parse_phandle(np, "leds", index);
>> +	if (!led_node)
>> +		return ERR_PTR(-ENOENT);
>> +	led_dev = class_find_device(leds_class, NULL, led_node,
>> +		led_match_led_node);
>> +	of_node_put(led_node);
>> +
>> +	if (!led_dev)
>> +		return ERR_PTR(-EPROBE_DEFER);
> Won't this defer probe "forever" when the driver is not available?

Yes it will.

However I don't see how we can fix this because we don't know for sure 
that the LED driver will not become available at a later time.

JJ



>
