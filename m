Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E48A1B8DFD
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2020 10:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgDZIkA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 Apr 2020 04:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgDZIkA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 Apr 2020 04:40:00 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1938AC061A0C
        for <linux-leds@vger.kernel.org>; Sun, 26 Apr 2020 01:40:00 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u16so16776662wmc.5
        for <linux-leds@vger.kernel.org>; Sun, 26 Apr 2020 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NsKIaDO3ErqktmI+cP5tBjB2+ousWfcWcfhD2ZavC3k=;
        b=shgbrysWbZcfHlGfgtcAIb/OvxSyQ+i/bbnBDN0SuMMGmWOOzOp3yWOCVjoILZHowa
         fQ2nF2DpTeky34jRX+5eJBpYlfkykmpV/aCB2cxSoVBBC5+Kr/2fwjWRQ8lxtcAan27o
         Cm64H7ZchwsAovF/DNugkQFrGDBhEJ1VrU3s+iJ/qTjkmHmMt3fcI7xN8hqgpk5lt3WM
         DOb3h8Rb/dAqJdKgGcQEaD490TBKC1/lgBv2tmIw0CtHrhUbfIKxfH4bUJ4Psx2WEUZt
         HdbAm1j+tBbsZ2kpUZOt77kgC5kqacZCWYVn5QN2uV4jF95uWAmUIvAZ9F2Zhd9+hrEV
         7o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NsKIaDO3ErqktmI+cP5tBjB2+ousWfcWcfhD2ZavC3k=;
        b=FxK+zCooXZGivEJ7/4yTcVnClAehiKYlrgY/jYF/n4yr8Qiwg4p9ZVIpvD7lWdlRnG
         /f7eCg8xSiI9R2ZNZmOoguR/AKpL3WjVtD+MjziRdO2D2uXBWOVInt6aVo5zmtrNSXp4
         FBgj7rab0onSk6xcxlKUsrWFzltHnkIYISm6WXD8Bu09T/X8PhEUT5uQ9v3U3cHwuOGw
         Us3jPztNL80cuF0Da0+vw1/teKu0fqIkQeQP56iWa77DRoIfkSi7eX8qB8FXA5zWKjNN
         BRwap+4v6ae7xlad4WV3PvMKwNjHrmsUVmBeSIAElnRZnNAVN1Wl4TG12UtIdjKo49un
         rH3Q==
X-Gm-Message-State: AGi0PuaF+PsZH5yv+dmI+KIoDX4vRTUZ2Vet0R4KUggzmaAPmWI9Z8ZL
        XVJLwRBxvOguiWetCPlVpJ1bSpBQ
X-Google-Smtp-Source: APiQypLE0KkDn3SsFhNU/zUelWjez2/H2hYesV92hq9yzs3af+YYvxbNVr2p2Kk8F0lT9g5pRAvRow==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr20934164wmb.155.1587890398489;
        Sun, 26 Apr 2020 01:39:58 -0700 (PDT)
Received: from [192.168.1.10] (33.red-2-137-27.dynamicip.rima-tde.net. [2.137.27.33])
        by smtp.gmail.com with ESMTPSA id z18sm15594169wrw.41.2020.04.26.01.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 01:39:58 -0700 (PDT)
Subject: Re: [PATCH v2] leds-bcm6328: support second hw blinking interval
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        jonas.gorski@gmail.com, rpurdie@rpsys.net
References: <20200424124621.23005-1-noltari@gmail.com>
 <20200424133243.27303-1-noltari@gmail.com> <20200425211450.GA27781@amd>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <c0b2bec5-2c27-fc43-0b92-3bf09aabe8a5@gmail.com>
Date:   Sun, 26 Apr 2020 10:39:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425211450.GA27781@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Two different HW blinking intervals can be configured in the controller, 
but we were only using one of them until now.

These blinking intervals are labeled as FAST_INTV and SLOW_INTV in the 
sources provided by Broadcom:
https://github.com/jameshilliard/gfiber-gflt100/blob/master/shared/opensource/include/bcm963xx/63268_map_part.h#L1077 

However, there are no fast/slow blinking intervals, since the 
configurable delay range is exactly the same for both of them.

Therefore, a LED can have 4 states 
(https://github.com/jameshilliard/gfiber-gflt100/blob/master/shared/opensource/include/bcm963xx/63268_map_part.h#L1085): 
Off, Blinking Interval 1, Blinking Interval 2 and On.

P.S: sorry for the previous emails, but my email client wasn't properly 
configured... (It should be now :$)

Best regards,
Álvaro.

El 25/04/2020 a las 23:14, Pavel Machek escribió:
> Hi!
> 
>> Add support for both configurable HW blinking intervals.
> 
> The code could use ... better documentation and better changelog. What
> is the current blinking interval and what other interval does this
> add?
> 
> Best regards,
> 								Pavel
> 
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>> ---
>>   v2: remove LED from the other interval
>>
>>   drivers/leds/leds-bcm6328.c | 56 ++++++++++++++++++++++++++-----------
>>   1 file changed, 40 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
>> index 42e1b7598c3a..a5a57a8d2a1c 100644
>> --- a/drivers/leds/leds-bcm6328.c
>> +++ b/drivers/leds/leds-bcm6328.c
>> @@ -24,12 +24,16 @@
>>   
>>   #define BCM6328_LED_MAX_COUNT		24
>>   #define BCM6328_LED_DEF_DELAY		500
>> +#define BCM6328_LED_INTERVAL_NUM	2
>>   #define BCM6328_LED_INTERVAL_MS		20
>>   
>>   #define BCM6328_LED_INTV_MASK		0x3f
>> -#define BCM6328_LED_FAST_INTV_SHIFT	6
>> -#define BCM6328_LED_FAST_INTV_MASK	(BCM6328_LED_INTV_MASK << \
>> -					 BCM6328_LED_FAST_INTV_SHIFT)
>> +#define BCM6328_LED_INTV1_SHIFT		0
>> +#define BCM6328_LED_INTV1_MASK		(BCM6328_LED_INTV_MASK << \
>> +					 BCM6328_LED_INTV1_SHIFT)
>> +#define BCM6328_LED_INTV2_SHIFT		6
>> +#define BCM6328_LED_INTV2_MASK		(BCM6328_LED_INTV_MASK << \
>> +					 BCM6328_LED_INTV2_SHIFT)
>>   #define BCM6328_SERIAL_LED_EN		BIT(12)
>>   #define BCM6328_SERIAL_LED_MUX		BIT(13)
>>   #define BCM6328_SERIAL_LED_CLK_NPOL	BIT(14)
>> @@ -45,8 +49,8 @@
>>   
>>   #define BCM6328_LED_MODE_MASK		3
>>   #define BCM6328_LED_MODE_ON		0
>> -#define BCM6328_LED_MODE_FAST		1
>> -#define BCM6328_LED_MODE_BLINK		2
>> +#define BCM6328_LED_MODE_INTV1		1
>> +#define BCM6328_LED_MODE_INTV2		2
>>   #define BCM6328_LED_MODE_OFF		3
>>   #define BCM6328_LED_SHIFT(X)		((X) << 1)
>>   
>> @@ -127,7 +131,8 @@ static void bcm6328_led_set(struct led_classdev *led_cdev,
>>   	unsigned long flags;
>>   
>>   	spin_lock_irqsave(led->lock, flags);
>> -	*(led->blink_leds) &= ~BIT(led->pin);
>> +	led->blink_leds[0] &= ~BIT(led->pin);
>> +	led->blink_leds[1] &= ~BIT(led->pin);
>>   	if ((led->active_low && value == LED_OFF) ||
>>   	    (!led->active_low && value != LED_OFF))
>>   		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
>> @@ -176,20 +181,37 @@ static int bcm6328_blink_set(struct led_classdev *led_cdev,
>>   	}
>>   
>>   	spin_lock_irqsave(led->lock, flags);
>> -	if (*(led->blink_leds) == 0 ||
>> -	    *(led->blink_leds) == BIT(led->pin) ||
>> -	    *(led->blink_delay) == delay) {
>> +	if (led->blink_leds[0] == 0 ||
>> +	    led->blink_leds[0] == BIT(led->pin) ||
>> +	    led->blink_delay[0] == delay) {
>>   		unsigned long val;
>>   
>> -		*(led->blink_leds) |= BIT(led->pin);
>> -		*(led->blink_delay) = delay;
>> +		led->blink_leds[0] |= BIT(led->pin);
>> +		led->blink_leds[1] &= ~BIT(led->pin);
>> +		led->blink_delay[0] = delay;
>>   
>>   		val = bcm6328_led_read(led->mem + BCM6328_REG_INIT);
>> -		val &= ~BCM6328_LED_FAST_INTV_MASK;
>> -		val |= (delay << BCM6328_LED_FAST_INTV_SHIFT);
>> +		val &= ~BCM6328_LED_INTV1_MASK;
>> +		val |= (delay << BCM6328_LED_INTV1_SHIFT);
>>   		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
>>   
>> -		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK);
>> +		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV1);
>> +		rc = 0;
>> +	} else if (led->blink_leds[1] == 0 ||
>> +		   led->blink_leds[1] == BIT(led->pin) ||
>> +		   led->blink_delay[1] == delay) {
>> +		unsigned long val;
>> +
>> +		led->blink_leds[0] &= ~BIT(led->pin);
>> +		led->blink_leds[1] |= BIT(led->pin);
>> +		led->blink_delay[1] = delay;
>> +
>> +		val = bcm6328_led_read(led->mem + BCM6328_REG_INIT);
>> +		val &= ~BCM6328_LED_INTV2_MASK;
>> +		val |= (delay << BCM6328_LED_INTV2_SHIFT);
>> +		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
>> +
>> +		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV2);
>>   		rc = 0;
>>   	} else {
>>   		dev_dbg(led_cdev->dev,
>> @@ -358,11 +380,13 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
>>   	if (!lock)
>>   		return -ENOMEM;
>>   
>> -	blink_leds = devm_kzalloc(dev, sizeof(*blink_leds), GFP_KERNEL);
>> +	blink_leds = devm_kcalloc(dev, BCM6328_LED_INTERVAL_NUM,
>> +				  sizeof(*blink_leds), GFP_KERNEL);
>>   	if (!blink_leds)
>>   		return -ENOMEM;
>>   
>> -	blink_delay = devm_kzalloc(dev, sizeof(*blink_delay), GFP_KERNEL);
>> +	blink_delay = devm_kcalloc(dev, BCM6328_LED_INTERVAL_NUM,
>> +				   sizeof(*blink_delay), GFP_KERNEL);
>>   	if (!blink_delay)
>>   		return -ENOMEM;
>>   
> 
