Return-Path: <linux-leds+bounces-470-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA681BD31
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 18:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CB741C24086
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 17:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7D6634E0;
	Thu, 21 Dec 2023 17:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+toe9DZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CFA6281B
	for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 17:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e239c49d0so1345495e87.2
        for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 09:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703179612; x=1703784412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1RBwFM6XciV/sQb+7pliqUMDrbhrJO9jUPbcv12er2Y=;
        b=G+toe9DZGGwt9oYkWtA6aGDeDkUOXTg6Nm/Ule2LsfomXrwaD/lRHfounl4PP6TwzQ
         P53VXQSHBKZ4p89Db4xxx+WcgGU+S+0r/IlfizSUzzyzSfubLfTChK+eUF/3kw+8NV9W
         5ajt/nTlebjkE/EvxavHFVPoSgc4zX+IcWKJNQYrLnEXu9fdHD1cNrNPcG5Db9i14H9b
         tuZ/8cp8Sr38hf3jBr6JDl8pFwm0uthqaYqLotkgKTnEZkAdPvViQrBx0c6+UcN1Ni6d
         0qoy99bFXReGwCuydpZJRkaa40NfeAp6SEZ/dje48OjOR8s/3xeEPGNdsppMjTf2gZJ0
         9dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703179612; x=1703784412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1RBwFM6XciV/sQb+7pliqUMDrbhrJO9jUPbcv12er2Y=;
        b=lwtf3oKa/7KyMcORM/AqPYe5tT/KOJyWRztR70nR/p3/kwUalQiyiS2fRdbJC/sg8X
         c9XvApPZdVpFhkxYIMc5lFhb0+Ge8GWRHIonNnXh5Iv6GBAKoEFRmH8mw/bJkH+UL6Te
         80cRfdhOZV6EfICVZYEL9kja9qSPXd8OtaIN1LPHDUbvpWbmOizMdF27m4uf1etYwe38
         wdH4mXyJ7R131CY4+mu0bbbT3ljNc5GZtIPbTm/0vwoOG75N6aVmXHCP/gHYNphtm4Qy
         eR060mszG2urdwKheIdD2IxorM91m0pmBYCT0duauVQbQU3XNLwQu07idb3R5fG7x1l+
         Jxhw==
X-Gm-Message-State: AOJu0Yzch7BYwke7GgIn13VbcmDD2FuunpxGLaTryvrST45Eptrd2iLk
	MhV3nMhrs+dOL/DNdbi0arg=
X-Google-Smtp-Source: AGHT+IHWcdenOJ6tVF5qsiLIxU+doR7OL6QCGfys/cEtOnW49fBUFQV7bwYSCIOAsE/mxfW4EqSv1g==
X-Received: by 2002:ac2:596a:0:b0:50e:3a19:7a8e with SMTP id h10-20020ac2596a000000b0050e3a197a8emr3256905lfp.108.1703179611989;
        Thu, 21 Dec 2023 09:26:51 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870? (dynamic-2a01-0c23-b8a5-3600-c010-4b2f-ccc7-a870.c23.pool.telefonica.de. [2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870])
        by smtp.googlemail.com with ESMTPSA id xo3-20020a170907bb8300b00a2534aebc21sm1165214ejc.40.2023.12.21.09.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 09:26:50 -0800 (PST)
Message-ID: <ec4b2852-9b76-4f0a-b296-cc5577ca4647@gmail.com>
Date: Thu, 21 Dec 2023 18:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>
References: <4be46f91-f8b9-4c5f-8434-c7cae83eec93@gmail.com>
 <20231221162731.GQ10102@google.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20231221162731.GQ10102@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.12.2023 17:27, Lee Jones wrote:
> On Thu, 21 Dec 2023, Heiner Kallweit wrote:
> 
>> The current codes uses the sw_control path in set_baseline_state() when
>> called from netdev_trig_activate() even if we're hw-controlled. This
>> may result in errors when led_set_brightness() is called because we may
>> not have set_brightness led ops (if hw doesn't support setting a "LED"
>> to ON). In addition this path may schedule trigger_data->work which
>> doesn't make sense when being hw-controlled.
>>
>> Therefore set trigger_data->hw_control = true before calling
>> set_device_name() from netdev_trig_activate(). In this call chain we
>> have to prevent set_baseline_state() from being called, because this
>> would call hw_control_set(). Use led_cdev->trigger_data == NULL as
>> indicator for being called from netdev_trig_activate().
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v2:
>> - improve commit message
>> v3:
>> - spelling and style fixes
>> ---
>>  drivers/leds/trigger/ledtrig-netdev.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> Doesn't apply.  Please rebase it on top of the LEDs repo.
> 
It's because fe2b1226656a ("leds: trigger: netdev: fix RTNL handling to
prevent potential deadlock") was applied via the netdev tree.
I'll rebase on top of for-leds-next.

> https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/
> 
>> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
>> index 09e75fd9f..6cbba44dd 100644
>> --- a/drivers/leds/trigger/ledtrig-netdev.c
>> +++ b/drivers/leds/trigger/ledtrig-netdev.c
>> @@ -267,7 +267,10 @@ static int set_device_name(struct led_netdev_data *trigger_data,
>>  
>>  	trigger_data->last_activity = 0;
>>  
>> -	set_baseline_state(trigger_data);
>> +	/* Skip if we're called from netdev_trig_activate() and hw_control is true */
>> +	if (!trigger_data->hw_control || led_get_trigger_data(trigger_data->led_cdev))
>> +		set_baseline_state(trigger_data);
>> +
>>  	mutex_unlock(&trigger_data->lock);
>>  	rtnl_unlock();
>>  
>> @@ -602,8 +605,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
>>  		if (dev) {
>>  			const char *name = dev_name(dev);
>>  
>> -			set_device_name(trigger_data, name, strlen(name));
>>  			trigger_data->hw_control = true;
>> +			set_device_name(trigger_data, name, strlen(name));
>>  
>>  			rc = led_cdev->hw_control_get(led_cdev, &mode);
>>  			if (!rc)
>> -- 
>> 2.43.0
> 


