Return-Path: <linux-leds+bounces-4063-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C31A40FB0
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2025 17:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7B1B3B50A6
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2025 16:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A40E3A8F7;
	Sun, 23 Feb 2025 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Ew5/7edu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18E3C147;
	Sun, 23 Feb 2025 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740327706; cv=none; b=mhgwf05RN66P34I/FXK0xRMpcBDoErL5UwIptxXTyqY/YMs73WHn/XYXsEtBMUKc8oL6ZLIk4TuS9Z1X6uyYrNaYvHLPTyHmGJPrickVKk1M19rOLw9wejmp7UwG3x8MKhDrU+SI33cXY91tyqpTISrAhLSSCb/aCgXrDZ03NAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740327706; c=relaxed/simple;
	bh=uQHylJiGWpWv+OFe0SJrTGmVrmvVCC/A0qTI/oln8E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mS6aPjmKb+Dc42xiZsEuTivBYTkYBFEwcXodWpnwNwzIZGcIkrtguMP7etSUetj7OEAZNmjjoe2fZoQdpaRSujNIfuUKy1Sq0/iHqFmKDWWKi3tsamIQ1RRmdesAG3ci2M0IQJPkLvkIhWsU0Kcbj+cj7ZppV5b8biW+7RTKhfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Ew5/7edu; arc=none smtp.client-ip=80.12.242.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mEiUtDhsZh8ztmEiXtisio; Sun, 23 Feb 2025 17:20:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740327634;
	bh=GIbxGeVegwsNyU0rjQ/yquRPHNh4ItGGzQfdM+YcwYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Ew5/7eduaFqs0Htr8V9RSx1o8UEXidF4+nVwjrdZgeZzf+BgewBPIN09cN9vS76ki
	 /ddL4GMw1Ylpn+DIC/91sJRDgPSVU3IXqXLrxBonp+PGgzxHoPswiYvOPkVSDuBNkq
	 4CwfX5dfEiDR0XeEmwR2EvyI224pcdLP71pBRz4LbgO0zlXcGmcmrW9eLaX02Ggujr
	 Dl43SjRxJrq5YsEaWBhTbZlJT1qrr6vzEVOeMF6Dom4Ht0fOVcHf+94OaPSzGKs5fi
	 bA3D7fr+oPfz32RYPfd2ruJbwl4dC+zrQOmol4Oo9Cu2b+nDx8JRMMrfmiSTxumtyk
	 g1gUsSUNYbj/w==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 23 Feb 2025 17:20:34 +0100
X-ME-IP: 90.11.132.44
Message-ID: <307b6cbe-6079-4995-b395-b63de69edb4b@wanadoo.fr>
Date: Sun, 23 Feb 2025 17:20:29 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: st1202: Fix an error handling path in
 st1202_probe()
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <4afa457713874729eb61eec533a4674a51d1d242.1739985599.git.christophe.jaillet@wanadoo.fr>
 <20250220155834.GA824852@google.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250220155834.GA824852@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 20/02/2025 à 16:58, Lee Jones a écrit :
> On Wed, 19 Feb 2025, Christophe JAILLET wrote:
> 
>> devm_mutex_init() may return -ENOMEM.
>> So this error should be handled in st1202_probe().
> 
> The start of a new sentence shouldn't warrant a line break.
> 
>> Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/leds/leds-st1202.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
>> index b691c4886993..4fc17d518292 100644
>> --- a/drivers/leds/leds-st1202.c
>> +++ b/drivers/leds/leds-st1202.c
>> @@ -356,7 +356,10 @@ static int st1202_probe(struct i2c_client *client)
>>   	if (!chip)
>>   		return -ENOMEM;
>>   
>> -	devm_mutex_init(&client->dev, &chip->lock);
>> +	ret = devm_mutex_init(&client->dev, &chip->lock);
>> +	if (ret < 0)
> 
> My assumption is that anything but 0 would be bad, thus:
> 
> 	if (ret)

Matter of taste. All other tests in this driver are "if (ret < 0)" or 
"if (ret != 0)".

What do you prefer: consistency or concision? (my own choice goes to 
consistency)

If you confirm concision, I'll send a v2 that also fix your other 
comment above.

CJ

> 
>> +		return ret;
>> +
>>   	chip->client = client;
>>   
>>   	ret = st1202_dt_init(chip);
>> -- 
>> 2.48.1
>>
> 


