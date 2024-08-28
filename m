Return-Path: <linux-leds+bounces-2539-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D9962834
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2024 15:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505C71F2155D
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2024 13:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50AD176FDB;
	Wed, 28 Aug 2024 13:06:17 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0115FCE6
	for <linux-leds@vger.kernel.org>; Wed, 28 Aug 2024 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724850377; cv=none; b=ig2sLe5lY8XyXpczQhwUBjFw5dl6PydM/+L/Ki3N+IceC2dLbSnUCIIeTqW2J2I++ZEP3wny5w0IbicWQbLfbw+DySWr4gnMNelMhnnEW1KM0NDWd0JiCjPsgeLkB2c3fWcJE6HbZJJAhYvHk5h26+iQ58MxnGF/Q56LQVteivE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724850377; c=relaxed/simple;
	bh=geMKNUGvohoDzl7U0oJqWynjN1zkRjIHCVrRkFc3UNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BG2F1te8dYvRFB9Zc3HM0BgVxPfX2PmCS/vYK5B1HOrqA7cpCTmMjEAFYX13FS+7WRnx12I/zGr2FM3s4mNDxpgV/Lt7G57Q+ecCFrQzrEj/A9B3ETzmVJpIHdyMoQwnPyY5Aw3Tdz3maiV7nlX63wudLNvY5cANWOuvvczQbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wv4R22Ddbz1S9J4;
	Wed, 28 Aug 2024 21:05:50 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 575BE180019;
	Wed, 28 Aug 2024 21:06:02 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 21:06:02 +0800
Message-ID: <75103474-0cb1-40d9-9e7a-c9e9e351cfed@huawei.com>
Date: Wed, 28 Aug 2024 21:06:01 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] leds: gpio: make use of dev_err_cast_probe()
To: Pavel Machek <pavel@ucw.cz>
CC: <lee@kernel.org>, <linux-leds@vger.kernel.org>
References: <20240828121353.3696414-1-lihongbo22@huawei.com>
 <Zs8cmTyrfWq2+YLD@duo.ucw.cz>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <Zs8cmTyrfWq2+YLD@duo.ucw.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)



On 2024/8/28 20:48, Pavel Machek wrote:
> Hi!
> 
>> Using dev_err_cast_probe() to simplify the code.
>>
>> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
>> ---
>>   drivers/leds/leds-gpio.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>> index 83fcd7b6afff..d323c2954234 100644
>> --- a/drivers/leds/leds-gpio.c
>> +++ b/drivers/leds/leds-gpio.c
>> @@ -172,10 +172,9 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
>>   		led.gpiod = devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
>>   						  NULL);
>>   		if (IS_ERR(led.gpiod)) {
>> -			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get GPIO '%pfw'\n",
>> -				      child);
>>   			fwnode_handle_put(child);
>> -			return ERR_CAST(led.gpiod);
>> +			return dev_err_cast_probe(dev, led.gpiod,
>> +					"Failed to get GPIO '%pfw'\n", child);
>>   		}
> 
> Is that correct? child should not be used after put(child) would be my
> first guess.
> 
oh, that's wrong. My mistake. It seems cannot be simplified due to the 
printed child variable.

Thanks,
Hongbo
> BR,
> 								Pavel

