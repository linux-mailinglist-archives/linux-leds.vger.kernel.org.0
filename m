Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE986A48EE
	for <lists+linux-leds@lfdr.de>; Sun,  1 Sep 2019 13:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfIALlQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Sep 2019 07:41:16 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37796 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfIALlP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Sep 2019 07:41:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id d16so11818847wme.2
        for <linux-leds@vger.kernel.org>; Sun, 01 Sep 2019 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ASjI5kSbnghS3V3HHhK6os95Rno4aPtdVAay1ELo/v0=;
        b=gq+Q+vuM1W1Syqo/j8N9vpCL6Qpt2LpM5tOgFtFD6jgnu78XSCZTnjYCyn9IYKEHT+
         9Zzum6Na2MDLm273GFAqphEh+x/YeUitmTmIBWdwqSBxXYvc12ji3cXplQI1D6Sru4Ft
         pXly15wjjhsQfemQz61FMlzH4y9LHXljCB19U5fnEAE+/qEQr8zgf73lfv4xOblephTg
         emTcVzB8jwPqK388R9mbHF4goiQL9N9QCdzE5sbwximfns1h9vnBp6UeBn7ncZw3GgUW
         tLAUUzRgAjpOQB+42g8N/Oue8aOIJyiCXB52Wxd4UiGPO0avWzRMAT+d+T6iL1UcjVBr
         37LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ASjI5kSbnghS3V3HHhK6os95Rno4aPtdVAay1ELo/v0=;
        b=Sp3+UpTrXSBuuvBWiv8M0eDL9eDTFs7cqbP6Lrj5qHiodQLW7eC2uWzNsTDNUP8Hg8
         GHxIze6P2L1yo5nmHK4qeeceLgJZLVNo6+nnbbKIlwPNKWuedED3+vyGQrYSMFIh7swg
         A+nrx+bFRoPFXDrk6+5Ok68+crrIOoK5Tfado41pCvLknsLzEzYCOprB9/s9ZEjiUTvo
         unhFIYTrZFFC2IBz3jTo+v720EiqDFRX4iLHa6r9U12CVdkV2nwKmuT1+PEx88zZS5AD
         jHpdEzVL5ctnKhUGkDcf3IW+ijxwoJWoNs7Mf+/2ZizYqnegdjmR7CgwqPIRvsssc+sg
         baFQ==
X-Gm-Message-State: APjAAAUZlt1VXqr6Q4cQfySNqIpzrW0BZvZTnmGiBFUMWZlHCciDebtU
        0cK2n6QSM+4OXaKHtZQ4v9cNQPTf
X-Google-Smtp-Source: APXvYqzVVtSFUz/rIrkUKcG9fo7KINH2P9MK/XX+0ur2Mvvl1vGCgV2B9pLXmSbV7WLL1WkZvGawHw==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr30888466wmj.142.1567338072699;
        Sun, 01 Sep 2019 04:41:12 -0700 (PDT)
Received: from [192.168.1.19] (ckf20.neoplus.adsl.tpnet.pl. [83.31.81.20])
        by smtp.gmail.com with ESMTPSA id n12sm15617535wmc.24.2019.09.01.04.41.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 04:41:12 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] leds: trigger: gpio: Convert to use kstrtox()
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <20190830150820.63450-1-andriy.shevchenko@linux.intel.com>
 <20190830150820.63450-2-andriy.shevchenko@linux.intel.com>
 <20190901102316.GA29681@amd> <b55b68cb-0c0b-ff5b-a4c3-d98c41b70b9f@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <afd5eeae-5b83-f9d0-f689-aa49c628a514@gmail.com>
Date:   Sun, 1 Sep 2019 13:41:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b55b68cb-0c0b-ff5b-a4c3-d98c41b70b9f@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/1/19 1:36 PM, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 9/1/19 12:23 PM, Pavel Machek wrote:
>> On Fri 2019-08-30 18:08:20, Andy Shevchenko wrote:
>>> sscanf() is a heavy one and moreover requires additional boundary checks.
>>> Convert driver to use kstrtox() and replace kstrtoul() by kstrtobool()
>>> in gpio_trig_inverted_store().
>>>
>>> While here, check the desired brightness against maximum defined for
>>> a certain LED.
>>
>> One change per patch, please.
>>
>> Because this one will not end well.
>>
>>> @@ -60,10 +60,10 @@ static ssize_t gpio_trig_brightness_store(struct device *dev,
>>>  	unsigned desired_brightness;
>>>  	int ret;
>>>  
>>> -	ret = sscanf(buf, "%u", &desired_brightness);
>>> -	if (ret < 1 || desired_brightness > 255) {
>>> +	ret = kstrtouint(buf, 10, &desired_brightness);
>>> +	if (ret || desired_brightness > gpio_data->led->max_brightness) {
>>>  		dev_err(dev, "invalid value\n");
>>> -		return -EINVAL;
>>> +		return ret ? ret : -EINVAL;
>>>  	}
>>
>> We have people writing 255 into brightness, because that's what we
>> used to do even for on/off LEDS. It is expected to work even for leds
>> with max_brightness of 1.
>>
>> So... we want to saturate here, not return -EINVAL. (And we will
>> eventually want to switch on/off leds to max_brightness = 1...)
> 
> Good point. We shouldn't fail here but proceed similarly as in case
> of setting brightness for a LED in led_set_brightness_nosleep(), i.e.
> here it should be:
> 
> desired_brightness = min(desired_brightness,
>                          gpio_data->led->->max_brightness);

PS. Dropped the patch.

-- 
Best regards,
Jacek Anaszewski
