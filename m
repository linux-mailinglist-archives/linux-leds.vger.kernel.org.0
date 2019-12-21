Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A299F128B73
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 21:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfLUUSA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 15:18:00 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51535 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfLUUSA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 15:18:00 -0500
Received: by mail-wm1-f65.google.com with SMTP id d73so12198526wmd.1;
        Sat, 21 Dec 2019 12:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2lLX3yIQeXXP7FLpx1+E5wtRT/tqet9QEfxDN9904Oo=;
        b=MEZhPkj/kpS21k/jnelmsp0v4dF6KLG6qBF2x0C6nXH3lXw2DHF9v0iY6P2bMSj11g
         SbMiOL8DwYoCmj/7k29a3ScIlq7I4bnFzgzJ30i4gSJtHG6NYNZS31X7dlzyS5QYfSow
         pYXiHmfMa0nQGtwUwTeFblDUpJy0/bDzBRXEHRD0pDzvpfpdLVWJWHCdcliGsWYmDX0R
         7aq2QWKBay1t1arpWQaf0yL2cu05yF5Pau7jlKZX6OQcGiRDmiDTjmZpiRI1oB7uVFAK
         cbvueIPXwd5eZVd6R36HcV6QTXGvnm338KxYb4U28PpxNtlCXQ4s4llX9jeM0l0qIvzj
         PGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2lLX3yIQeXXP7FLpx1+E5wtRT/tqet9QEfxDN9904Oo=;
        b=AiAjxRvscIYGm7lcnTAe2JtkPDgOdb+7kViH+SgsMDbsiuBZhhE2IIYYffhHworzYF
         lG+RXUukIPqf42i7SOrVo4S/iFrxQaM+JAEzPKrnl3ecGwuTj4fefGrlWuOAkLmqEWfF
         lMOQnPub3EosdI9JROJREuOXFc3ae9Femf6xBGMiol6/jt4e2QrZmRjKp067QWIq2pT8
         7WT4IU+fGmDPn2IYrJtPms+Y6Q+9iZJwkawhyedDAnP9CICrqbnrDw1kORjuJbemDmNC
         cnheumjKDOoUTP3V/X3+wrjyk9iioX0xrJbHuFI8Io/jX+GyrBpR16KOCDRPqPXN2A0t
         iqiw==
X-Gm-Message-State: APjAAAUcjjUq+YALC96Snr+SMhhUFKK6ykTCQYDzsTy7ZTGBsvZ9poRk
        ZrbwiZJD6UI+8me8mhsds4c=
X-Google-Smtp-Source: APXvYqz7EsmjZdxdSBtmqsbRtpMCmy9Il3Yr8ClYwED3m8uo4SijuL7qk7m99EeG2oERpChroHcN+g==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr24627282wmc.78.1576959476997;
        Sat, 21 Dec 2019 12:17:56 -0800 (PST)
Received: from [192.168.1.19] (bfd180.neoplus.adsl.tpnet.pl. [83.28.41.180])
        by smtp.gmail.com with ESMTPSA id n10sm14048030wrt.14.2019.12.21.12.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2019 12:17:56 -0800 (PST)
Subject: Re: [PATCH] leds: gpio: Fix uninitialized gpio label for fwnode based
 probe
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>
References: <20191205212501.9163-1-jacek.anaszewski@gmail.com>
 <20191221184957.GD32732@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7ff6e22f-537a-e205-db19-a75d33af8487@gmail.com>
Date:   Sat, 21 Dec 2019 21:17:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191221184957.GD32732@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/21/19 7:49 PM, Pavel Machek wrote:
> Hi!
> 
>> When switching to using generic LED name composition mechanism via
>> devm_led_classdev_register_ext() API the part of code initializing
>> struct gpio_led's template name property was removed alongside.
>> It was however overlooked that the property was also passed to
>> devm_fwnode_get_gpiod_from_child() in place of "label" parameter,
>> which when set to NULL, results in gpio label being initialized to '?'.
>>
>> It could be observed in debugfs and failed to properly identify
>> gpio association with LED consumer.
>>
>> Fix this shortcoming by updating the GPIO label after the LED is
>> registered and its final name is known.
>>
>> Fixes: d7235f5feaa0 ("leds: gpio: Use generic support for composing LED names")
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> Patch looks good, except:
> 
>> @@ -151,9 +151,14 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>>  		struct gpio_led led = {};
>>  		const char *state = NULL;
>>  
>> +		/**
>> +		 * Acquire gpiod from DT with uninitialized label, which
>> +		 * will be updated after LED class device is registered,
>> +		 * Only then the final LED name is known.
>> +		 */
>>  		led.gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
>>  							     GPIOD_ASIS,
>> -							     led.name);
>> +							     NULL);
> 
> This is not linuxdoc, so comment should beging with /* AFAICT.

Right.

> I'll probably hand-edit the patch.

Sure, thanks.

-- 
Best regards,
Jacek Anaszewski
