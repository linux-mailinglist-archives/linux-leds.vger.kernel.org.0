Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BE623F5A7
	for <lists+linux-leds@lfdr.de>; Sat,  8 Aug 2020 02:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgHHAxK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Aug 2020 20:53:10 -0400
Received: from m12-18.163.com ([220.181.12.18]:47268 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbgHHAxJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 7 Aug 2020 20:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=nRtYJ
        XoFhjBTmnR7isAG1Uh5+HC6OQId+GHWfmRaIus=; b=hKcfOSaVcP8GsaxcUk99E
        VAg9HwyesM6XnLUp0gR/YLb+ifBtKLCamXKT+0FCl0i2esBhFIYx6dBZ09gmenm7
        W5lSizHz55q99n7osRoLodjj71sj6J0A52e5J6Hls12SeqrUHpv+o9pMo4T7Z/XY
        X3vFWOjvtcTZoftbtz0lBo=
Received: from [192.168.1.166] (unknown [58.33.79.182])
        by smtp14 (Coremail) with SMTP id EsCowADHI7hJ9y1fTAJCIA--.4765S2;
        Sat, 08 Aug 2020 08:52:25 +0800 (CST)
Subject: Re: [PATCH 1/2] leds: is31fl319x: Add sdb pin and generate a 5ms low
 pulse when startup
To:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200806062130.25187-1-von81@163.com>
 <7c828160-bef6-45b5-60d1-85c6074953c4@ti.com>
From:   Grant Feng <von81@163.com>
Message-ID: <9904b022-d3ff-3714-d0e6-30d93b4dcfd0@163.com>
Date:   Sat, 8 Aug 2020 08:52:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <7c828160-bef6-45b5-60d1-85c6074953c4@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowADHI7hJ9y1fTAJCIA--.4765S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1DJFW7XF13XF4fAryxKrg_yoW8WF4kpF
        4DCF1rCrsxJryIgr17uFy7ZFy5ta18Kr1DJrWIqa4av3WYgF1kWFykJFn09F13ZrWxuF4Y
        vF4rtFWrurs7ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b7_-PUUUUU=
X-Originating-IP: [58.33.79.182]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/xtbBSQl6OlaD7rrhBQAAsl
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thanks for the review, I will rewrit it.

Grant

On 2020-08-06 23:00, Dan Murphy wrote:
> Grant
>
> On 8/6/20 1:21 AM, Grant Feng wrote:
>> generate a 5ms low pulse on sdb pin when startup, then the chip
>> becomes more stable in the complex EM environment.
>>
>> Signed-off-by: Grant Feng <von81@163.com>
>> ---
>>   drivers/leds/leds-is31fl319x.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/leds/leds-is31fl319x.c 
>> b/drivers/leds/leds-is31fl319x.c
>> index ca6634b8683c..b4f70002cec9 100644
>> --- a/drivers/leds/leds-is31fl319x.c
>> +++ b/drivers/leds/leds-is31fl319x.c
>> @@ -16,6 +16,8 @@
>>   #include <linux/of_device.h>
>>   #include <linux/regmap.h>
>>   #include <linux/slab.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>>     /* register numbers */
>>   #define IS31FL319X_SHUTDOWN        0x00
>> @@ -61,6 +63,7 @@
>>   struct is31fl319x_chip {
>>       const struct is31fl319x_chipdef *cdef;
>>       struct i2c_client               *client;
>> +    struct gpio_desc        *sdb_pin;
>>       struct regmap                   *regmap;
>>       struct mutex                    lock;
>>       u32                             audio_gain_db;
>> @@ -265,6 +268,15 @@ static int is31fl319x_parse_dt(struct device *dev,
>>           is31->audio_gain_db = min(is31->audio_gain_db,
>>                         IS31FL319X_AUDIO_GAIN_DB_MAX);
>>   +    is31->sdb_pin = gpiod_get(dev, "sdb", GPIOD_ASIS);
>
> Since this is optional maybe use devm_gpiod_get_optional.
>
> If this is required for stability then if the GPIO is not present then 
> the parse_dt should return the error.
>
> And use the devm_gpiod_get call.  Otherwise you are missing the 
> gpiod_put when exiting or removing the driver.
>
> Dan
>

