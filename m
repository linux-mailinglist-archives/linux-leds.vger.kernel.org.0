Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9D8917D519
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 18:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgCHRHL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 13:07:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38326 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgCHRHL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Mar 2020 13:07:11 -0400
Received: by mail-wr1-f66.google.com with SMTP id t11so8156760wrw.5;
        Sun, 08 Mar 2020 10:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4ZqWEYlPziQMq37adZu1Jxzcf317Ics47fpCFbaLNoM=;
        b=tJZB7jTWYCrkx3gW2Uij2xs5FaB7PLp2DXlMOteAzKBOQcWAJhjpjxVIZNhW7OOWFt
         1nH5vUFKTHbm3aX90iKZ8cQQk+XloNqwN/KLyQ9WNYYTSmX2i6Neer2kojJLMLxLLWoc
         cRETYPBYPkJ8iGmnL8j9WoEC4K8NwZ8i6XZhP3ahbaQbPLEzXfimzQnFkfCFnzm1Qnlm
         VVvXoCBMG/ap0MK+4a2/SzjHi3+xmYOQnPRNXDy5hJ5N8mwcNiGs1jrN1/KW3vodAhGM
         ugZYv3wuVc7bU9ZZKw/lo3R2/x6p2iwSngFUPd5KKAXadXe4WdG7XZWs0E+cLs3JmZjP
         BL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4ZqWEYlPziQMq37adZu1Jxzcf317Ics47fpCFbaLNoM=;
        b=Y8hF/c3IVxs10TXhXlHZIGk3elhq8WxRSuQ4V1/RuceZyXI6FrNgqlLsvcRUJVYzNA
         N9ex6YScmS8c5DRbwel77yttBKUm3sH3tDNaJyF/E3KrqLpIizHmkUx0q5DU9/yJrrWx
         oFQ3WfFBlm4azhcdEe9yXfVRORTVXelDm4kxiFFh6v3l14XnGn1XMcb4CBqrI+asIgKN
         9sFSBvZK/p7VKXL4p5JQ70gdAOvlNuJOawNeG+ibBQzK134qfPi5eGyq8eWQcdINzneE
         RZX5qDUFIjThgKP1EWG3vMLBQoN5zFsvJb+vhNv4Ic5zJrhsF8x2UAk8gPeJxN+SjOTZ
         li2Q==
X-Gm-Message-State: ANhLgQ3jmCrVUDaawD4/+YRWPDEdPjlGHjZhjeQ0iql16fK99Kumfkrh
        Ks2zwayYITuwOJab6F8kJEa9mBkK
X-Google-Smtp-Source: ADFU+vs0nqPKoU0Luzh5sRpNnR1tjbIjObVwnbYAJxMuKlDe4QBQK0BGOtcOUxlIBQDqXiHwhVlGIg==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr9200918wrp.214.1583687226972;
        Sun, 08 Mar 2020 10:07:06 -0700 (PDT)
Received: from [192.168.1.23] (affz13.neoplus.adsl.tpnet.pl. [95.49.155.13])
        by smtp.gmail.com with ESMTPSA id v16sm40905622wrp.84.2020.03.08.10.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2020 10:07:06 -0700 (PDT)
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
To:     Pavel Machek <pavel@ucw.cz>, Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-leds@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org
References: <20200227185015.212479-1-luca@z3ntu.xyz>
 <20200308120855.GA29321@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1e28bc6e-3316-46b1-e8b3-6cf252b4939c@gmail.com>
Date:   Sun, 8 Mar 2020 18:07:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200308120855.GA29321@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 3/8/20 1:08 PM, Pavel Machek wrote:
> Hi!
> 
>> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> 
> That's pinephone, right?
> 
>> This device is controller by two GPIO lines, one for enabling the LED
>> and the second one for switching between torch and flash mode.
>>
>> The device will automatically switch to torch mode after being in flash
>> mode for about 250-300ms, so after that time the driver will turn the
>> LED off again automatically.
> 
> I don't quite see how this is supposed to work.
> 
>> Hi, this driver is controllable via sysfs and v4l2 APIs (as documented
>> in Documentation/leds/leds-class-flash.rst).
>>
>> The following is possible:
>>
>> # Torch on
>> echo 1 > /sys/class/leds/white\:flash/brightness
>> # Torch off
>> echo 0 > /sys/class/leds/white\:flash/brightness
>> # Activate flash
>> echo 1 > /sys/class/leds/white\:flash/flash_strobe
> 
> So.. "activate flash" will turn the LED on in very bright mode, then
> put it back to previous brightness after a timeout?
> 
> What happens if some kind of malware does flash_strobe every 300msec?
> 
>> # Torch on
>> v4l2-ctl -d /dev/video1 -c led_mode=2
>> # Torch off
>> v4l2-ctl -d /dev/video1 -c led_mode=0
>> # Activate flash
>> v4l2-ctl -d /dev/video1 -c strobe=1
>>
>> Unfortunately the last command (enabling the 'flash' via v4l2 results in
>> the following being printed and nothing happening:
>>
>>   VIDIOC_S_EXT_CTRLS: failed: Resource busy
>>   strobe: Resource busy
>>
>> Unfortunately I couldn't figure out the reason so I'm hoping to get some
>> guidance for this. iirc it worked at some point but then stopped.
> 
> Actually, LED flash drivers are getting quite common. Having common
> code (so we could just say this is led flash, register it to both v4l
> and LED) might be quite interesting.
> 
> Unfortunately, some LED flashes also have integrated red LED for
> indication, further complicating stuff.

Everything you're talking about here is already implemented
and Luca makes use of that.

Indicator LEDs are covered as well.

>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 2da39e896ce8..38d57dd53e4b 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
>>  obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>>  obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
>>  obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
>> +obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
> 
> I would not mind "flash" drivers going to separate directory.
> 
>> +int sgm3140_brightness_set(struct led_classdev *led_cdev,
>> +			   enum led_brightness brightness)
>> +{
>> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
>> +	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
>> +
>> +	if (brightness == LED_OFF)
>> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
>> +	else
>> +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
>> +
>> +	return 0;
>> +}
> 
> Umm. So this cancels running strobe?
> 
>> +static void sgm3140_powerdown_timer(struct timer_list *t)
>> +{
>> +	struct sgm3140 *priv = from_timer(priv, t, powerdown_timer);
>> +
>> +	gpiod_set_value_cansleep(priv->enable_gpio, 0);
>> +	gpiod_set_value_cansleep(priv->flash_gpio, 0);
>> +}
> 
> And this does not return to previous brightness.
> 
> Do we want to provide the "strobe" functionality through sysfs at all?
> Should we make it v4l-only, and independend of the LED stuff?

It was being discussed six years ago and the interface is in place.

Have you looked at drivers/leds/led-class-flash.c?

-- 
Best regards,
Jacek Anaszewski
