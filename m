Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E204AA48E8
	for <lists+linux-leds@lfdr.de>; Sun,  1 Sep 2019 13:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfIALg4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Sep 2019 07:36:56 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55003 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfIALgz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Sep 2019 07:36:55 -0400
Received: by mail-wm1-f65.google.com with SMTP id k2so10241256wmj.4
        for <linux-leds@vger.kernel.org>; Sun, 01 Sep 2019 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0Ryn8xkD46aPHk9NTqumf6/x6PYPa78dOFkBNP88kJA=;
        b=UpibGMnimDWrcV0X3ZrWmgB/dMjFcOPadSjKik/2iY9nRYxRx1PfyXQ9qPUG6B1Jdj
         2IVOY+JIMbIDsPoONf4hsZd7WWK1ANomwRjb/sK54DEnB3soUb8dxLjWi3kpr+eoIfyl
         g575Vyx2VSCueTyvd0Eq1lZ17aK1C3WRhoCggYz7o1F1YcpdEb0T+0Zyu6OgXOfAoItg
         WAWI0LIa0k19lXpdJYu+n4/JIf5CZZ4lA2Ig76LUVLBjqSg+q/gorwyWZzS9ALAvrvcY
         oe2+LwENQpumnT8oIr4lyN5WxW4hHl0Pe1I2bErr5UEXrm9nolfuHv7Hw0coP9DYly5q
         P9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0Ryn8xkD46aPHk9NTqumf6/x6PYPa78dOFkBNP88kJA=;
        b=I37xiZBmaaiHE7V8c80wyphmlTNT+iDrQOycuAPuZ8MwIFQP3lpFkhIj/nSFbYSw30
         W1e8WuqGTOqNh9j793B/io4DQ3A03Y17YxGCc2X+KQ1GnXyZZEoY3M7T4e3H225GwE2j
         dvBM5mVpIzeWF5OCSCLoKFj3LxdzvtiEswmfzkNV/h/X1AMNTS5SfGakVLLUr81AwRQ4
         w9iVutpPXfcxsw/hpxiM+DRsu70Ckl1Qk1xlTqc4T62MK8i8vVhuvIOL6AJ/MeP5Pc6x
         ygXz7qFio0PkPL54TKcMWY4Zq+bHOJwjwjO2UHCenbONcbExzXaZDUFNkxSKXKVGdem6
         k6TA==
X-Gm-Message-State: APjAAAWdoYMbj16MNdD/hQ+JxSfrVoROfm1AAdh1P8e3a1lzdpDJ9JWF
        aOvW21NNOvUq4HbAdlsJDOPqJNP4
X-Google-Smtp-Source: APXvYqwDSh8sGsBiu7S9SVe8Xy7q4UsLCIo2diEGvdj4T04F0YROyt142lPOcNBNIITDKUEmqzKAqg==
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr29522826wmf.1.1567337812534;
        Sun, 01 Sep 2019 04:36:52 -0700 (PDT)
Received: from [192.168.1.19] (ckf20.neoplus.adsl.tpnet.pl. [83.31.81.20])
        by smtp.gmail.com with ESMTPSA id f17sm14917473wmj.27.2019.09.01.04.36.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 04:36:51 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] leds: trigger: gpio: Convert to use kstrtox()
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <20190830150820.63450-1-andriy.shevchenko@linux.intel.com>
 <20190830150820.63450-2-andriy.shevchenko@linux.intel.com>
 <20190901102316.GA29681@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b55b68cb-0c0b-ff5b-a4c3-d98c41b70b9f@gmail.com>
Date:   Sun, 1 Sep 2019 13:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901102316.GA29681@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 9/1/19 12:23 PM, Pavel Machek wrote:
> On Fri 2019-08-30 18:08:20, Andy Shevchenko wrote:
>> sscanf() is a heavy one and moreover requires additional boundary checks.
>> Convert driver to use kstrtox() and replace kstrtoul() by kstrtobool()
>> in gpio_trig_inverted_store().
>>
>> While here, check the desired brightness against maximum defined for
>> a certain LED.
> 
> One change per patch, please.
> 
> Because this one will not end well.
> 
>> @@ -60,10 +60,10 @@ static ssize_t gpio_trig_brightness_store(struct device *dev,
>>  	unsigned desired_brightness;
>>  	int ret;
>>  
>> -	ret = sscanf(buf, "%u", &desired_brightness);
>> -	if (ret < 1 || desired_brightness > 255) {
>> +	ret = kstrtouint(buf, 10, &desired_brightness);
>> +	if (ret || desired_brightness > gpio_data->led->max_brightness) {
>>  		dev_err(dev, "invalid value\n");
>> -		return -EINVAL;
>> +		return ret ? ret : -EINVAL;
>>  	}
> 
> We have people writing 255 into brightness, because that's what we
> used to do even for on/off LEDS. It is expected to work even for leds
> with max_brightness of 1.
> 
> So... we want to saturate here, not return -EINVAL. (And we will
> eventually want to switch on/off leds to max_brightness = 1...)

Good point. We shouldn't fail here but proceed similarly as in case
of setting brightness for a LED in led_set_brightness_nosleep(), i.e.
here it should be:

desired_brightness = min(desired_brightness,
                         gpio_data->led->->max_brightness);

So the condition should be limited to checking error code.

>> @@ -86,16 +86,13 @@ static ssize_t gpio_trig_inverted_store(struct device *dev,
>>  {
>>  	struct led_classdev *led = led_trigger_get_led(dev);
>>  	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
>> -	unsigned long inverted;
>> +	bool inverted;
>>  	int ret;
>>  
>> -	ret = kstrtoul(buf, 10, &inverted);
>> -	if (ret < 0)
>> +	ret = kstrtobool(buf, &inverted);
>> +	if (ret)
>>  		return ret;
>>  
>> -	if (inverted > 1)
>> -		return -EINVAL;
>> -
>>  	gpio_data->inverted = inverted;
>>  
>>  	/* After inverting, we need to update the LED. */
> 
> So, this accepted 0/1. Now it also accepts true false and many other pairs.
> 
> Which... might be ok. But probably should be separated.
> 
> Best regards,
> 									Pavel
> 									
> 

-- 
Best regards,
Jacek Anaszewski
