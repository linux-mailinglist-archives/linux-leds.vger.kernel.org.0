Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA39CBFB8
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 17:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390104AbfJDPti (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 11:49:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59584 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389773AbfJDPti (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 11:49:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94FnTC0127993;
        Fri, 4 Oct 2019 10:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570204169;
        bh=K2QJeimlTTZ7Vlcc5fU4ztnPh1BdaHhigV1zt6llveQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MceddM7tVhfjnijXQPlzee+PrYIj5TQHXXmvtTimldCkYckgbzzD/IiSJNOjUB/F9
         HkX+Zo1wUIFsLeRFaMeaNPs/bMPknN7cLboOPdxB2YNLyapnjl3bA7qnvYBheq790+
         cRXhm6Xp7qPepLbuswiQDUYrMAtWTtTCWVCjy77E=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94FnTru015563
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 10:49:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 10:49:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 10:49:28 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94FnRPB101449;
        Fri, 4 Oct 2019 10:49:27 -0500
Subject: Re: [PATCH v7 5/5] backlight: add led-backlight driver
To:     Lee Jones <lee.jones@linaro.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>,
        <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-6-jjhiblot@ti.com> <20191004143900.GO18429@dell>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <cef282ee-3659-3bc3-da25-db02f843d61c@ti.com>
Date:   Fri, 4 Oct 2019 17:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004143900.GO18429@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

On 04/10/2019 16:39, Lee Jones wrote:
> On Wed, 18 Sep 2019, Jean-Jacques Hiblot wrote:
>
>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> This patch adds a led-backlight driver (led_bl), which is similar to
>> pwm_bl except the driver uses a LED class driver to adjust the
>> brightness in the HW. Multiple LEDs can be used for a single backlight.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>> ---
>>   drivers/video/backlight/Kconfig  |   7 +
>>   drivers/video/backlight/Makefile |   1 +
>>   drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++
>>   3 files changed, 268 insertions(+)
>>   create mode 100644 drivers/video/backlight/led_bl.c
> Applied, thanks.

It will break the build because it relies on functions not yet in the 
LED core (devm_led_get() for v7 or devm_of_led_get() for v8)

JJ

>
