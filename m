Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459A029BD18
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 17:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1811717AbgJ0Qkw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 12:40:52 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:43616 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1811706AbgJ0Qkv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 12:40:51 -0400
Received: by mail-ej1-f68.google.com with SMTP id k3so3134302ejj.10;
        Tue, 27 Oct 2020 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=whgiE5mkniKGwNlADQ4aF2iRZstl2eVAqQyrroOhp7I=;
        b=ouxnTOZqdyiymOCtooGaHR1k5LkYLpUX/UawsmhwKB8H1inu1JvjXQH7JCFxzfAJ8b
         uxSwd/kxhxFSHOUAKKrooIjxaBUhXMlc7Zx77067JCZcdk1P13Z+b3ctWxZJShJqyFQz
         gEFjuLEO1+2iqNZHcQrUF85/yQBTLpPEf8eEem16ie+4TU0VZ8Sh4zM8ssRTDNsg4yu6
         HS5vvvI3l/GkRhvewvzew5lBtH3IkL4drrYzU+zleLr5KgCyMHGDcbaYl7rHTtbln0tm
         sBLZXG7hga+QEXKnPIG9QUFWYd6r5qPmPkvNrZA19LwZdkyBznZvt/GDyVIGwoGhbLTC
         oSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=whgiE5mkniKGwNlADQ4aF2iRZstl2eVAqQyrroOhp7I=;
        b=SinYjZ8VatrNEggUJzOcGYz3tmRVlHBvG/pplXyuzhvYaA66I2vjUcxhB8UPd/Wo7z
         dVm370eaNiPNac0cQtsFMJO+c+6Ht2yMqlqKw7pYJjjGb1iCxyEqMiBhD45iJ5cweo0N
         kdnSLSkOnyAXbMiaMAo5sj8XkfIU3QCWiOhy5qUBOSKhViF/6nqpoEp+iT7J8chy0nvC
         LYYuCM25b2ghucIeupiR8KU2tbmnvgAB9DomLyGhG+WyHkI6pnp3v/CB0Pj2UfgSOpxH
         5iFAm3C6ZfC0HC5lfX9MtH6oxK8zH/kTubOoegMFn82+p18sOp8LD5BiOBUcs2C+vh6X
         MGUA==
X-Gm-Message-State: AOAM532KtQ+iSPrSaQEpRn6JOhMLIfNMm4p3v9V507uBjjJ6kU7YktWo
        EYWfcEl9saqeaavyzXaPOj4jCOeIS/8=
X-Google-Smtp-Source: ABdhPJziJBh4R8Lb8wVZR6jDy/SW8hlkuj/6Q45kiU19NRiXBgFuGFkfYROxwksv9OquKfS2d/h/tQ==
X-Received: by 2002:a17:906:7e43:: with SMTP id z3mr3380288ejr.143.1603816848730;
        Tue, 27 Oct 2020 09:40:48 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:659b:3847:24e3:b881? ([2a01:110f:b59:fd00:659b:3847:24e3:b881])
        by smtp.gmail.com with ESMTPSA id ss7sm1372379ejb.28.2020.10.27.09.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 09:40:47 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 led controller
To:     Pavel Machek <pavel@ucw.cz>, cy_huang <u0084500@gmail.com>
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, cy_huang@richtek.com,
        devicetree@vger.kernel.org
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b0f5b3c8-bebd-eeb6-20b2-15529816720c@gmail.com>
Date:   Tue, 27 Oct 2020 17:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027082900.GA21354@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel, ChiYuan,

On 10/27/20 9:29 AM, Pavel Machek wrote:
> Hi!
> 
>> From: ChiYuan Huang <cy_huang@richtek.com>
>>
>> Add support for RT4505 flash led controller. It can support up to 1.5A
>> flash current with hardware timeout and low input voltage
>> protection.
> 
> Please use upper-case "LED" everywhere.
> 
> This should be 2nd in the series, after DT changes.
> 
>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>> ---
>>   drivers/leds/Kconfig       |  11 ++
>>   drivers/leds/Makefile      |   1 +
>>   drivers/leds/leds-rt4505.c | 397 +++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 409 insertions(+)
>>   create mode 100644 drivers/leds/leds-rt4505.c
[...]
>> +static int rt4505_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
>> +{
> 
> 80 columns, where easy.
> 
>> +	struct rt4505_priv *priv = container_of(lcdev, struct rt4505_priv, flash.led_cdev);
>> +	u32 val = 0;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->lock);
>> +
>> +	if (level != LED_OFF) {
>> +		ret = regmap_update_bits(priv->regmap, RT4505_REG_ILED, RT4505_ITORCH_MASK,
>> +					 (level - 1) << RT4505_ITORCH_SHIFT);
>> +		if (ret)
>> +			goto unlock;
>> +
>> +		val = RT4505_TORCH_SET;
>> +	}
>> +
>> +	ret = regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, RT4505_ENABLE_MASK, val);
>> +
>> +unlock:
>> +	mutex_unlock(&priv->lock);
>> +	return ret;
>> +}
> 
> Why is the locking needed? What will the /sys/class/leds interface
> look like on system with your flash?

The locking is needed since this can be called via led_set_brightness()
from any place in the kernel, and especially from triggers.

-- 
Best regards,
Jacek Anaszewski
