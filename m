Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858B33B96F
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 18:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfFJQ3a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 12:29:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50408 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbfFJQ3a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 12:29:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so11467wmf.0
        for <linux-leds@vger.kernel.org>; Mon, 10 Jun 2019 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uIv2uO6ElhZgfwMPtGScT+OV4CF0zYe0J8NP5SmVits=;
        b=LXLrbsbVJ3aHZBUZvBvxwSdMYFfowM7KARVyBTRNut8vzaFiE++0WGjhzTEOotSR85
         +f6tCLMjGUo7ohsfVIyGud7aDnt6KPTIkMSXYPuMoXsmElrt7HVOXGqGzgzouUpwulN3
         3Nu1pkTjM0J4iWwuD/t0RZeW3txVztYbl94kdFYQxNsW3b6qQ5UGu6pJvn67epfDeoop
         0RSgstsE3f705aTjS30YwtsTSv7UcsLRnA9xxQt4pgQ7yBNbFtp7f3ErJhmSWjxBvHfc
         iUfMBkHsFWUjIwEYKog8Tbw++6XTbpPTjtz/dSsmOrOTVYegCQAeuosVI2JdftSQGZSh
         7y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uIv2uO6ElhZgfwMPtGScT+OV4CF0zYe0J8NP5SmVits=;
        b=opEpOUdZIRxGDmZk/h075JPCQ8QWjbp7OmfFXiasD2t587hu8WGXbpEt6eG9lIlpNi
         nMWbYn4gX/REQy0tzrtb2VzJkU+E2ppVAuesxe5dogUVlXFaRVJVVZ2BvPy4EGsyfTdQ
         gRliC2RbAHfasOuZPs7mzb104pQ8xvZcQog6puVKTfXkPAcm0f+zAxA3ZbffIwp8KGAs
         MODYqvXTH3+G92NyVVImh/tV7ObYgM/n2Mm7MPqxsQ1dRNBxbiDWbffR5lR6yfajTPGT
         mVaQ81IrmNBM6vwIYIqO/PDm+PhVsrbGJLgdn5Fz2PcSvHpjP8YTeeDl/i/BeZI/SiVB
         O+Ag==
X-Gm-Message-State: APjAAAXeHV9ESAQ7fJV/V1zDc7K5KHcqkeevCotmrJJCxXD8Ur/ToZOT
        +D4Dl2sUcnPm5AC0qnT2+3kcZEi8
X-Google-Smtp-Source: APXvYqzDYe4xkQO+KrnV4rR6JlKiKh9dSddyNiobYMu1uKi/bgL1ahs/Lkp1Ha4hQChUTsPPGmjzrg==
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr9259312wme.29.1560184168101;
        Mon, 10 Jun 2019 09:29:28 -0700 (PDT)
Received: from [192.168.1.17] (chq222.neoplus.adsl.tpnet.pl. [83.31.14.222])
        by smtp.gmail.com with ESMTPSA id f26sm9602wmh.8.2019.06.10.09.29.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 09:29:27 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] Simplify LED registeration by
 devm_led_classdev_register()
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, Oleh Kravchenko <oleg@kaa.org.ua>,
        linux-leds@vger.kernel.org
References: <20190608143039.13454-1-oleg@kaa.org.ua>
 <20190608143039.13454-2-oleg@kaa.org.ua>
 <ab1404dc-0a1f-ec23-3e3d-8eec86d24c8b@ti.com> <20190610143626.GA7475@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b285cb11-f00d-482d-ce89-4c02ee351bfe@gmail.com>
Date:   Mon, 10 Jun 2019 18:29:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610143626.GA7475@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

Thank you for the patch. I am addressing that already in the
patch 17/26 [0] of my LED naming v5 series, so I will hold on
this for a while - maybe the series will be accepted in greater part
this time, so the improvement will go alongside.

On 6/10/19 4:36 PM, Pavel Machek wrote:
> On Mon 2019-06-10 09:26:14, Dan Murphy wrote:
>> Oleh
>>
>> On 6/8/19 9:30 AM, Oleh Kravchenko wrote:
>>> Then there is no need to set np or store it.
>>
>> Huh?  This does not really explain much about what this patch is
> doing.
> 
> ledm_ variant does not need np, so it can be deleted. Sounds like a
> good cleanup to me.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> 
>>> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
>>> index 91deb40db307..880089ef9a9b 100644
>>> --- a/drivers/leds/leds-cr0014114.c
>>> +++ b/drivers/leds/leds-cr0014114.c
>>> @@ -183,12 +183,10 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>>>   	size_t			i = 0;
>>>   	struct cr0014114_led	*led;
>>>   	struct fwnode_handle	*child;
>>> -	struct device_node	*np;
>>>   	int			ret;
>>>   	const char		*str;
>>>   	device_for_each_child_node(priv->dev, child) {
>>> -		np = to_of_node(child);
>>>   		led = &priv->leds[i];
>>>   		ret = fwnode_property_read_string(child, "label", &str);
>>> @@ -207,8 +205,7 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>>>   		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
>>>   		led->ldev.brightness_set_blocking = cr0014114_set_sync;
>>> -		ret = devm_of_led_classdev_register(priv->dev, np,
>>> -						    &led->ldev);
>>> +		ret = devm_led_classdev_register(priv->dev, &led->ldev);
>>>   		if (ret) {
>>>   			dev_err(priv->dev,
>>>   				"failed to register LED device %s, err %d",
>>> @@ -217,8 +214,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
>>>   			return ret;
>>>   		}
>>> -		led->ldev.dev->of_node = np;
>>> -
>>>   		i++;
>>>   	}
> 

[0] https://lkml.org/lkml/2019/6/9/709

-- 
Best regards,
Jacek Anaszewski
