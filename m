Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C38D476363
	for <lists+linux-leds@lfdr.de>; Wed, 15 Dec 2021 21:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236157AbhLOUgO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Dec 2021 15:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbhLOUgO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Dec 2021 15:36:14 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8A1C061574;
        Wed, 15 Dec 2021 12:36:13 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b22so857559lfb.9;
        Wed, 15 Dec 2021 12:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=mxQTpq9+SSfMCBuNLOEU7pPVfHQ9OviSls2iaBkKkiY=;
        b=nMJoLWrKBbib/S6bg5IG0ZK8VRyyOVM8QRpLYYrNHDGpeBvVb1x9AjihLfXwSaITzc
         NoAdCGjGfZevACEpw8hjzQx68xpqwLUGOaAyXKu7mdnTfvCyr5q1u2xWoqLXurNiXnp+
         j1TSFmlrTvj0xUpXs8rO7M/2x9RlKqR+u99ydYC0TWG6aTPOGXxeFTDNLKEeQVBE17H+
         vyX4KnWEc81y4ZIrNiXPuz8DtmYcwymvPPacCHTXelFLLbceZuobJWyi+wcw9WKP0eQI
         yQJzZzEjSmbXaPeTJg6+UU3K3xK+9d72nee4rvCVLa9QQk67sTU5N28sbGzbQCga1tKy
         4nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mxQTpq9+SSfMCBuNLOEU7pPVfHQ9OviSls2iaBkKkiY=;
        b=zOolVdXDBySuFC12YSwad9Tn7wIR135nufX2ZAnY0ya0ySaYcTZoPumZS9E+4gxhWD
         yS4GPRfXPL7AnM9enxyV1AKpqC/01QKT8N8yD/1HKvLRMqqDVHwv8FFmKdT0yKB8B8fI
         7xRAl0oJxNVJUJGri17JOIdagYqqJURNqNzurk5GrR38eO09cqLpLExvWlnrYVdf02ty
         ssqdhgF9kAfQCeKox8bb1A7nmv7qjxpy8+ydmI1csommQrKCI6+icz7QFxCzh1Laukas
         /ERnkFZtSet6NbnBKgkIxJZRXMIX1xVbdwOpZTisygccYKac+5X+bd3TGQoVAWE86RVK
         u2Ag==
X-Gm-Message-State: AOAM532OCxOBLfF62DT6eLfIq8RxKUCVFC5bVf+AUPhuwE3cowoAsGm4
        KP7utLE9ah/27cWnSBmHciE=
X-Google-Smtp-Source: ABdhPJy2dh59pjZ/ubrHcMTH+WMaPRTZFF7qQkrKcsDYpm8+aJj5sr+bHrVhQB98P/naBwKpMiCyuQ==
X-Received: by 2002:a05:6512:118e:: with SMTP id g14mr11752902lfr.561.1639600571853;
        Wed, 15 Dec 2021 12:36:11 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id z8sm483242lfu.128.2021.12.15.12.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 12:36:11 -0800 (PST)
Message-ID: <213808f6-af00-6738-b634-b99aca9c4903@gmail.com>
Date:   Wed, 15 Dec 2021 21:36:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2 2/2] leds: bcm63xxx: add support for BCM63138
 controller
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211124111952.22419-1-zajec5@gmail.com>
 <20211124111952.22419-2-zajec5@gmail.com> <20211215202616.GB28336@duo.ucw.cz>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20211215202616.GB28336@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 15.12.2021 21:26, Pavel Machek wrote:
>> It's a new controller first introduced in BCM63138 SoC. Later it was
>> also used in BCM4908, some BCM68xx and some BCM63xxx SoCs.
>>
> 
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index ed800f5da7d8..3bde795f0951 100644
>> --- a/drivers/leds/Kconfig
> 
> Lets put it into drivers/leds/blink/, please.
> 
>> --- /dev/null
>> +++ b/drivers/leds/leds-bcm63138.c
>> @@ -0,0 +1,314 @@
> 
>> +#define BCM63138_LED_BITS				4				/* how many bits control a single LED */
>> +#define BCM63138_LED_MASK				((1 << BCM63138_LED_BITS) - 1)	/* 0xf */
>> +#define BCM63138_LEDS_PER_REG				(32 / BCM63138_LED_BITS)	/* 8 */
> 
> I'm not sure these kinds of defines are useful.

What do you suggest? I think defines are prefered in Linux kernel
compared to magic values in code.


>> +static void bcm63138_leds_create_led(struct bcm63138_leds *leds,
>> +				     struct device_node *np)
>> +{
>> +	struct led_init_data init_data = {
>> +		.fwnode = of_fwnode_handle(np),
>> +	};
>> +	struct device *dev = leds->dev;
>> +	struct bcm63138_led *led;
>> +	struct pinctrl *pinctrl;
>> +	const char *state;
>> +	u32 bit;
>> +	int err;
>> +
>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>> +	if (!led)
>> +		return;
> 
> At least warn. User wants to know why his leds don't work.

That would be against Linux's rule. I'm not sure if/where it's explained
in Documentation/ but scripts/checkpatch.pl will complain about that for
sure. OOM errors are loud enough not to require an extra error at driver
level.


>> +	if (!of_property_read_string(np, "default-state", &state)) {
>> +		if (!strcmp(state, "on"))
>> +			led->cdev.brightness = LED_FULL;
>> +		else
>> +			led->cdev.brightness = LED_OFF;
>> +	} else {
>> +		led->cdev.brightness = LED_OFF;
>> +	}
> 
> Do you actually need default-state support? Just remove it if not.
> 
> You support 4 bit brightness. You should set max_brightness to
> 15. LED_FULL is mistake (or very old API) in your case.
