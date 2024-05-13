Return-Path: <linux-leds+bounces-1668-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D88C3C35
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2024 09:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB456281716
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2024 07:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACEC33985;
	Mon, 13 May 2024 07:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XCbYRd6v"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A7D52F9B
	for <linux-leds@vger.kernel.org>; Mon, 13 May 2024 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715586257; cv=none; b=oI+SZpENIg+aPRYWbBVOQ4D6BtNkRvN+UVyLlXBgDkUGZ7u3Tndujs/NAc7D6rXxUtnou399Nd9L0iHEmocmPdEXI2vz4znMk+Ns50GUXm1qejoXbFvwxZum0coXIUj7clZx5az83sRzXGYbgHxWw7zATfGGZ3sdaptR7+wlFWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715586257; c=relaxed/simple;
	bh=sd8RwfCQQ0625j7c4dL2YanT9l001o+OAibE/UMt+kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCCsR7X2z5B0Q3oBprPzvbRSJ3xXD1FmbhieeZRojslowBtxdxBwH1t0Zw9ccv9E5saihxhyGPHAAl2d4uem7qIj2benbyLrkgeJvslBmfOutkW/ii5D7zwDNwSzKpx4j8i2nyn0nrBTOdNsdqF/k3/iW6uI3vKdeH+azgspy/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XCbYRd6v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715586254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ij7Ce+1vjj4AF4LhtW6l4Sryy06Ixrd5OMMpflY/6vc=;
	b=XCbYRd6v0VqJJSFVJiAA+z/EXJZwoRhINZE9+F3mpAqE7MrTKoSsm/uPuHVOfwYE5K22Gl
	I9C8uXP1c7mHIMzoZE905YQ4zqGv86wq8bAynNs5VLdwaS7jROK1v4bT2pxRgv/ttmQNVD
	hSskSj/RXUexB7P+oXjI7IGhC2U/Hvs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-WkKd2HFuPuaIdeBJFVKU8A-1; Mon, 13 May 2024 03:44:11 -0400
X-MC-Unique: WkKd2HFuPuaIdeBJFVKU8A-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-51f8aadbf04so3967626e87.0
        for <linux-leds@vger.kernel.org>; Mon, 13 May 2024 00:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715586250; x=1716191050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij7Ce+1vjj4AF4LhtW6l4Sryy06Ixrd5OMMpflY/6vc=;
        b=Ae24oi7T6DHmygC9k3BzGZbYnE57tNENiOMa11m/qH99pkE5+O36lYqHdOmpIqrCTV
         0RaoXAXlVoOPeJpDX/bz7qkVUPv/H+sla2NR5daePp5wYgfMC+1UQ7atsGNPcAmscFT5
         CU4plUyPIxaAVrFFhVn44fl5vYh8ARBsvNdkWsjxRAjgvfqLRx8vCouQ9Ku3M3yNHotO
         qD4kj7d5FnSe0QvFg8osbI+moTypZUvc3zrci/BykXFcmv1AJ/3DSq77j1m9x8O9I6to
         E5+1N6S5vpXJs6QZ/k34LwIgvR6oFhRVzrgzRTbK6leEFQIpCOUXkCPdFv7BeydeV0qL
         1Drw==
X-Forwarded-Encrypted: i=1; AJvYcCUnlO3fi/AOSnqa7pP+gGgZzKH8q+kQOAg4F211fY4fL7MkRsibdcSnot4mvv3PVjRKV3Ct0GM3bSzzs33g4KfLeogji1oZKMv4pg==
X-Gm-Message-State: AOJu0YyoUXuEnyrAK/tt6G6JLtGiD8XK0Xghwt62ZMyVqmDhrMYjyHNt
	cJxmBPF7sEzpgMgTxPNSzKRuqhXUvWuU4iMe0hkADoNiwQo3sOiFFUeubTGYm6cjfqao3+iNc5Q
	S/l1mEs8nz4R4WZ+Mp8A1rQDSUN+kgKz6pP4awe/RJtm0CVn7DhX3Y+jdSM4cKl4FDPo=
X-Received: by 2002:a05:6512:3441:b0:51e:150e:2c45 with SMTP id 2adb3069b0e04-5220ff738acmr4529286e87.63.1715586250200;
        Mon, 13 May 2024 00:44:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnqbDyj1A/OtnPBMpsqzH5/1o5Scx5us7rY3h0CnOagZbIoLYrkcSHKWYZjEYdW6zPUFrv2w==
X-Received: by 2002:a05:6512:3441:b0:51e:150e:2c45 with SMTP id 2adb3069b0e04-5220ff738acmr4529270e87.63.1715586249741;
        Mon, 13 May 2024 00:44:09 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2c7e18sm5890099a12.76.2024.05.13.00.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 00:44:09 -0700 (PDT)
Message-ID: <02d826fe-2db6-4d7c-a599-0af4b4740a07@redhat.com>
Date: Mon, 13 May 2024 09:44:08 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vt: keyboard: Use led_set_brightness() in LED trigger
 activate() callback
To: Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
References: <20240511152030.4848-1-hdegoede@redhat.com>
 <3658e1d0-913c-4f31-aa92-06fbd8b717c1@kernel.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3658e1d0-913c-4f31-aa92-06fbd8b717c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jiri,

On 5/13/24 7:09 AM, Jiri Slaby wrote:
> On 11. 05. 24, 17:20, Hans de Goede wrote:
>> A LED trigger's activate() callback gets called when the LED trigger
>> gets activated for a specific LED, so that the trigger code can ensure
>> the LED state matches the current state of the trigger condition.
>>
>> led_trigger_event() is intended for trigger condition state changes and
>> iterates over _all_ LEDs which are controlled by this trigger changing
>> the brightness of each of them.
>>
>> In the activate() case only the brightness of the LED which is being
>> activated needs to change and that LED is passed as an argument to
>> activate(), switch to led_set_brightness() to only change the brightness
>> of the LED being activated.
> 
> LGTM, but could you elaborate on what behavior this fixes? Should it be backported to stable?

It does not really fix any user visible behavior. This is just something which
I noticed while looking at all LED trigger activate callbacks because of some
LED core patches I was writing.

The code before this patch gets the job done, it syncs the VT capslock/numlock/etc
status to the LEDs of a newly registered input device.

But it also ends up calling led_set_brightness() on all already registered
capslock/numlock/etc LEDs which is not necessary.

So this is just a small optimization, not a bug fix.

Regards,

Hans


> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/tty/vt/keyboard.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
>> index a2116e135a82..804355da46f5 100644
>> --- a/drivers/tty/vt/keyboard.c
>> +++ b/drivers/tty/vt/keyboard.c
>> @@ -1033,9 +1033,7 @@ static int kbd_led_trigger_activate(struct led_classdev *cdev)
>>         tasklet_disable(&keyboard_tasklet);
>>       if (ledstate != -1U)
>> -        led_trigger_event(&trigger->trigger,
>> -                  ledstate & trigger->mask ?
>> -                    LED_FULL : LED_OFF);
>> +        led_set_brightness(cdev, ledstate & trigger->mask ? LED_FULL : LED_OFF);
>>       tasklet_enable(&keyboard_tasklet);
>>         return 0;
> 
> thanks,


