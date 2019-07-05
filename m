Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62EDC6048D
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2019 12:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbfGEKdu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Jul 2019 06:33:50 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49188 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbfGEKdu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Jul 2019 06:33:50 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65AXdMJ045769;
        Fri, 5 Jul 2019 05:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562322819;
        bh=a+9kqxFBb4ONOgcxUqkn+qLv8UCr52lzZuc0RccW2Xw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LRqAfRzKxnl2Xipdm3VYCpApjQIdqkeD3HVFzK3CMyriOURvthKE7CBvCshT8CPUs
         Dt82c+aEXJXv3DOLCQY5F2is2/Qv/i1CG16L38FsjLfJH4wYPcgghxh1lQQi0yOfxz
         T46mSNHK/la9A84zPIDoWZ+iMD8wfHKvnjw6eNr4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65AXdgj019071
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Jul 2019 05:33:39 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 05:33:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 05:33:38 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65AXa3F125307;
        Fri, 5 Jul 2019 05:33:36 -0500
Subject: Re: [PATCH 3/4] backlight: add led-backlight driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     Daniel Thompson <daniel.thompson@linaro.org>,
        <jacek.anaszewski@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <jingoohan1@gmail.com>, <dmurphy@ti.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-4-jjhiblot@ti.com>
 <20190702095434.d426lichmaffz7a5@holly.lan>
 <531e237c-b570-5270-6fc3-6629a8bf7acd@ti.com>
 <20190702130434.frbx7jkec27ejbpo@holly.lan>
 <72c45311-c710-dc2d-a6de-68e44ea8436a@ti.com>
 <20190703094457.etmbbjhhssbdkveo@holly.lan>
 <a8886ae9-31ec-de4c-0a83-5f681582a0b9@ti.com>
 <20190705100851.zn2jkipj4fxq5we6@devuan>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <6c21af33-8c3b-58a8-0a1b-f85fb9f80050@ti.com>
Date:   Fri, 5 Jul 2019 12:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705100851.zn2jkipj4fxq5we6@devuan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 05/07/2019 12:08, Pavel Machek wrote:
> Hi!
>
>>>>> Also still relevant is whether the LED device is being correctly
>>>>> modelled if the act of turning on the LED doesn't, in fact, turn the LED
>>>>> on. Is it *really* a correct implementation of an LED device that
>>>>> setting it to LED_FULL using sysfs doesn't cause it to light up?
>>>> What I understood from the discussion between Rob and Tomi is that the
>>>> child-node of the LED controller should be considered a backlight device,
>>>> not a simple LED. I'm not sure if the sysfs interface is still relevant in
>>>> that case. Maybe it should just be disabled by the backlight driver
>>>> (possible with led_sysfs_disable())
>>> led_sysfs_disable() sounds like a sensible change but that's not quite
>>> what I mean.
>>>
>>> It is more a thought experiment to see if the power control *should* be
>>> implemented by the backlight. Consider what happens if we *don't*
>>> enable CONFIG_BACKLIGHT_LED in the kernel: we would still have an LED
>>> device and it would not work correctly.
>>>
>>> In other words I naively expect turning on an LED using the LED API
>>> (any of them, sysfs or kernel) to result in the LED turning on.
>>> Implementing a workaround in the client for what appears to be
>>> something missing in the LED driver strikes me as odd. Why shouldn't
>>> the regulator be managed in the LED driver?
>> I see your point. Indeed having the regulator handled in the LED-core makes
>> sense in a lot of situations
>>
>> I'll think about it.
> For the record, I also believe regulator and enable gpio should be
> handled in the core.

I am working on adding the regulator to the led core.

I don't really want to add a GPIO enable to the core though. If needed 
it can be described as a GPIO-enabled regulator up(/down)stream the 
regular regulator.

JJ


>
> 									Pavel
> PS please trim down the quoted text.									
