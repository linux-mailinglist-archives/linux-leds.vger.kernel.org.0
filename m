Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDB2C4253
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 23:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfJAVKH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 17:10:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43522 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfJAVKH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 17:10:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id q17so17161970wrx.10;
        Tue, 01 Oct 2019 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZVCUEuQ5s6ltgorohDrhsE140d4XNXoA6pC4Ti9MiFc=;
        b=JMOdLiWKIE+LyArrTHwikIbyGyfVxRR6hohBLJwZ2FIs+JyK1L3+s1/ryqXvI8mYjR
         hnWToL+H1Ge+sjv2lDR3A49+BqTg2UeX8HTbMzGNE/9Ye7gd04NgthKPpKXn98Pcpt/i
         9RkpBU9uGkkRA41adpOBCff8ceklQZkwVo44tvlx411ekdWIyK/gceXlV+2gi8yt6Xdi
         V20uSzIRkVk7Mo/dhUg0opC2WZqHTqCF3tCro8h8DVwQnBJNU6NvqbT1PhDaPFGgRqCC
         p92L9pG/x0J4zzc5smTkjuXQrZJNCe/4Dt9i41mFZHLWD4XtRACO2DIEhIP3rI6D846G
         DqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZVCUEuQ5s6ltgorohDrhsE140d4XNXoA6pC4Ti9MiFc=;
        b=A9NlITDCWnbyUod9wxDn/0BGEjipvX041NJW2/HolLICuvd9taMSsZYnwu23gdpmZQ
         AyDy6CD1hDGUr1hARzFHGDvbOS7FFZgSxHZGZ/pVKgqECKXUehOwctVjeI2IBCR7rnYq
         OtxQvDtfmisrxMOD16/WOz7ovtHZOfW4rRKbZarpajskQzE3GmsdG0/Q8neCFg+lIT+5
         U1RibMjX0uQ/9Lip8JUdjfnHmNtDDxq17Rnbv9XdhWtth3Yk5tMMGKw2jsw3lbktUzvl
         NrrPVqU6opWPDzmOgskiwIg9K7NU2Kl7VY2+VnBqw2HxigXe2i0r1slPA3s7pw0bQKRN
         q4vQ==
X-Gm-Message-State: APjAAAW5E9WZTpRiZCWivhBVyrelcBVOv3pLJSwiYH6P7ZRtmqmttTeh
        5oPxc7Q592XuLGTT0TpL6F2n+rMg
X-Google-Smtp-Source: APXvYqwjg8YTz8m5Qi1/78H0Mnhy4b8ozGGCU/mce9rj9ubbb+p+t3uSIylxtlXMysUJFqRcfXSiQQ==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr20779061wrq.194.1569964203895;
        Tue, 01 Oct 2019 14:10:03 -0700 (PDT)
Received: from [192.168.1.19] (bgt101.neoplus.adsl.tpnet.pl. [83.28.83.101])
        by smtp.gmail.com with ESMTPSA id f143sm8620278wme.40.2019.10.01.14.10.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 14:10:03 -0700 (PDT)
Subject: Re: [PATCH 4/5] leds: flash: Add devm_* functions to the flash class
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191001180439.8312-1-dmurphy@ti.com>
 <20191001180439.8312-4-dmurphy@ti.com>
 <218b33ac-506b-2014-d37f-3da2da323388@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ab274710-2d6a-7a2a-6261-bfdff5ade466@gmail.com>
Date:   Tue, 1 Oct 2019 23:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <218b33ac-506b-2014-d37f-3da2da323388@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Moreover, checkpatch.pl complains about whitespaces
in two places of this patch.

On 10/1/19 11:06 PM, Jacek Anaszewski wrote:
> Dan,
> 
> Thank you for the patch. One funny omission caught my
> eye here and in led-class.c when making visual comparison.
> Please refer below.
> 
> On 10/1/19 8:04 PM, Dan Murphy wrote:
>> Add the missing device managed API for registration and
>> unregistration for the LED flash class.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  drivers/leds/led-class-flash.c  | 50 +++++++++++++++++++++++++++++++++
>>  include/linux/led-class-flash.h | 14 +++++++++
>>  2 files changed, 64 insertions(+)
>>
>> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
>> index 60c3de5c6b9f..c2b4fd02a1bc 100644
>> --- a/drivers/leds/led-class-flash.c
>> +++ b/drivers/leds/led-class-flash.c
>> @@ -327,6 +327,56 @@ void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev)
>>  }
>>  EXPORT_SYMBOL_GPL(led_classdev_flash_unregister);
>>  
>> +static void devm_led_classdev_flash_release(struct device *dev, void *res)
>> +{
>> +	led_classdev_flash_unregister(*(struct led_classdev_flash **)res);
>> +}
>> +
>> +int devm_led_classdev_flash_register_ext(struct device *parent,
>> +				     struct led_classdev_flash *fled_cdev,
>> +				     struct led_init_data *init_data)
>> +{
>> +	struct led_classdev_flash **dr;
>> +	int ret;
>> +
>> +	dr = devres_alloc(devm_led_classdev_flash_release, sizeof(*dr),
>> +			  GFP_KERNEL);
>> +	if (!dr)
>> +		return -ENOMEM;
>> +
>> +	ret = led_classdev_flash_register_ext(parent, fled_cdev, init_data);
>> +	if (ret) {
>> +		devres_free(dr);
>> +		return ret;
>> +	}
>> +
>> +	*dr = fled_cdev;
>> +	devres_add(parent, dr);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_flash_register_ext);
>> +
>> +static int devm_led_classdev_flash_match(struct device *dev,
>> +					      void *res, void *data)
>> +{
>> +	struct fled_cdev **p = res;
> 
> We don't have struct fled_cdev. This name is used for variables
> of struct led_clssdev_flash type in drivers.
> 
> We don't get even compiler warning here because this is cast
> from void pointer.
> 
> Funny thing is that you seem to have followed similar flaw in
> devm_led_classdev_match() where struct led_cdev has been
> introduced.
> 
> We need to fix both cases.
> 
>> +
>> +	if (WARN_ON(!p || !*p))
>> +		return 0;
>> +
>> +	return *p == data;
>> +}
>> +
>> +void devm_led_classdev_flash_unregister(struct device *dev,
>> +				  	     struct led_classdev_flash *fled_cdev)
>> +{
>> +	WARN_ON(devres_release(dev,
>> +			       devm_led_classdev_flash_release,
>> +			       devm_led_classdev_flash_match, fled_cdev));
>> +}
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_flash_unregister);
>> +
>>  static void led_clamp_align(struct led_flash_setting *s)
>>  {
>>  	u32 v, offset;
>> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
>> index 1bd83159fa4c..21a3358a1731 100644
>> --- a/include/linux/led-class-flash.h
>> +++ b/include/linux/led-class-flash.h
>> @@ -113,6 +113,20 @@ static inline int led_classdev_flash_register(struct device *parent,
>>   */
>>  void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev);
>>  
>> +int devm_led_classdev_flash_register_ext(struct device *parent,
>> +				     struct led_classdev_flash *fled_cdev,
>> +				     struct led_init_data *init_data);
>> +
>> +
>> +static inline int devm_led_classdev_flash_register(struct device *parent,
>> +				     struct led_classdev_flash *fled_cdev)
>> +{
>> +	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
>> +}
>> +
>> +void devm_led_classdev_flash_unregister(struct device *parent,
>> +					struct led_classdev_flash *fled_cdev);
>> +
>>  /**
>>   * led_set_flash_strobe - setup flash strobe
>>   * @fled_cdev: the flash LED to set strobe on
>>
> 

-- 
Best regards,
Jacek Anaszewski
