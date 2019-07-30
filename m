Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E0A7B4D2
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jul 2019 23:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbfG3VLo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Jul 2019 17:11:44 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35424 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387589AbfG3VLo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jul 2019 17:11:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6ULBePr036898;
        Tue, 30 Jul 2019 16:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564521100;
        bh=j8vwJxYp9fEJPZvYLToogU9rNIiEXf4hQoMCYz58si0=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=PAgAvkjfG37whuYaF8SHxbQXI3FdY5n0JK+mmEWXj8okARoqz/ulx2Tt3ykGMgkXT
         fJ9Y/wOTtOdS9H3k59UdMxbWwvh+PqWjtgD1s311o7gRQKW42tAgGJPfX+ssClrALe
         zxrQ9vFarycJ0WjZxTE6fOtk52WstjOYOB+WhnPo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6ULBexL096774
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Jul 2019 16:11:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Jul 2019 16:11:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Jul 2019 16:11:40 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6ULBdde118259;
        Tue, 30 Jul 2019 16:11:40 -0500
Subject: Re: LEDs next branch
From:   Dan Murphy <dmurphy@ti.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
References: <99b075d0-e230-35bc-06c5-712a69fab91d@ti.com>
 <5be9a3a2-810b-c08a-e631-b7afa005a136@gmail.com>
 <aa841c27-d3af-01bf-6a90-afeea83e3775@ti.com>
Message-ID: <0aa100fc-70d1-e391-9196-4e987bd24d34@ti.com>
Date:   Tue, 30 Jul 2019 16:11:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <aa841c27-d3af-01bf-6a90-afeea83e3775@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 7/30/19 3:47 PM, Dan Murphy wrote:
> Jacek
>
> On 7/30/19 3:30 PM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> On 7/30/19 8:40 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> Did you see/fix this on the led-next branch?
>>>
>>> I saw this when booting trying to fix the lm3532
>>>
>>> [    8.651461] led_class: exports duplicate symbol
>>> devm_led_classdev_register_ext (owned by kernel)
>>>
>>> [    8.730063] led_class: exports duplicate symbol
>>> devm_led_classdev_register_ext (owned by kernel)
>> I've just tried next-20190730 and haven't noticed anything like that.
>> I've checked both with driver compiled-in and loaded as a module. 
>
[...]

Try configuring the LEDS_CLASS as a built-in module.

-CONFIG_LEDS_CLASS=m
+CONFIG_LEDS_CLASS=y

I am also on for-next

Dan

