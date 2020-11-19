Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BFC2B8BFA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 08:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgKSHFW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 02:05:22 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7702 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgKSHFU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 02:05:20 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cc9fd5C6JzkWt8;
        Thu, 19 Nov 2020 15:04:57 +0800 (CST)
Received: from [10.174.177.149] (10.174.177.149) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 15:05:14 +0800
Subject: Re: [PATCH] leds: lp50xx: add missing fwnode_handle_put in error
 handling case
To:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20201111032159.17833-1-miaoqinglang@huawei.com>
 <e803008d-2d68-6048-90dc-d05c311a5fb9@ti.com>
From:   Qinglang Miao <miaoqinglang@huawei.com>
Message-ID: <9ddeebab-85c2-3597-4cea-4129b1d7f8ae@huawei.com>
Date:   Thu, 19 Nov 2020 15:05:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e803008d-2d68-6048-90dc-d05c311a5fb9@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.149]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



在 2020/11/11 21:27, Dan Murphy 写道:
> Hello
> 
> On 11/10/20 9:21 PM, Qinglang Miao wrote:
>> Fix to goto child_out to do fwnode_handle_put(child)
>> from the error handling case rather than simply return,
>> as done elsewhere in this function.
>>
>> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB 
>> LED driver")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
>> ---
>>   drivers/leds/leds-lp50xx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
>> index 5fb4f24aeb2e..49a997b2c781 100644
>> --- a/drivers/leds/leds-lp50xx.c
>> +++ b/drivers/leds/leds-lp50xx.c
>> @@ -488,7 +488,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>>           mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
>>                          sizeof(*mc_led_info), GFP_KERNEL);
>>           if (!mc_led_info)
>> -            return -ENOMEM;
>> +            goto child_out;
> 
> Thanks for the patch.
> 
> Need to set ret = -ENOMEM; then do child_out so the error is reported 
> properly
> 
> Dan
> .
Hi Dan,

I've sent v2 on this fix, setting ret as well.

Thanks!
