Return-Path: <linux-leds+bounces-609-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921B82FD4C
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jan 2024 23:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 357F829267C
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jan 2024 22:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281D5200DD;
	Tue, 16 Jan 2024 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8uIE/uc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7694F200A4
	for <linux-leds@vger.kernel.org>; Tue, 16 Jan 2024 22:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705445081; cv=none; b=DM7SJEZQnwK+ZFl5FiZhHQzByZVp3YjbgNh99JcfGb3Hrlq9ERTjnNGwqCww/rvl2nW8Ocn6pEIsbm/JTdY/yLCsuyvGKA02p4wBc2yNVqAvRxhae42nRfYxacVOlsVticrUtS+5I4JNiC5yVCcZvRIfK1WNQmrHE5ja4AxPQdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705445081; c=relaxed/simple;
	bh=plDNZqc5Wxd6xO8aXTBHrD6LXGsskOkW/I5D4ZWg504=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=JkmfgNQm3bdEKFMrcySAURh290qD51ofnKf8NctzK/sAaKulAgEMcsSkQ/1ArylhAaHXfOZm+EduY/4wHWZTJ00hunSkTyALA4OYyVkuHJyhlQ94v6iVcKaZcionvId2zGQQoMMjcfjreXPndbtXc83uuIxTsQM4QfR0Fheg8gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8uIE/uc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-559c1396ecfso745157a12.3
        for <linux-leds@vger.kernel.org>; Tue, 16 Jan 2024 14:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705445077; x=1706049877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHYaruvX0B94/S1tmxOPKI5zZWtSUSPk9gXwqGP6BV8=;
        b=e8uIE/ucqOI6CaajN91yIShXN+7BYbgxlz3QqTZ5WrPekfStss4RBH8uOeBrA7vE7n
         DbNjoHgDpj8t8LHFCPmK34TpghAIwH06g0n1lohhNHWyXVAwtkBNnPgc2CXxcOLkzpK1
         CS9gL95x38oRNwZeVkWpqbjaXcuJoL7422YS5TDmGEjwnM0SdZmzyvqDjBe1rbn4+MWE
         +4fDCJ1WxY1iB83ddlt6B12tcJmakoEFJxR3EefDAz4+jEnETNuDCz3JTrBhmEhpG0Ws
         6TOjUK/+unmzKwmyUgoSOzY8JZtWmHwD1xtOWyxrTXGJskQbj6xyFopORS2zr0tYIDQP
         VKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705445077; x=1706049877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHYaruvX0B94/S1tmxOPKI5zZWtSUSPk9gXwqGP6BV8=;
        b=Xnl4miYGrG2PeEto9OM+BDn0vtSz6MU+34iBgE4s80poPe2RUDmPJq99YCTHu5vwzh
         Imau062Fc2HAd4q7l8e3gcj1xm91svrfNE7KkRopp2+OHYI6sFKJ6SoQBn3mrlu/9llb
         w246L3rKPz+iP+Uk95t95vO6hbd6NddGM4LGkKI2sVweJcObAVpc7RCY3v24K8AULKyC
         iqQ9n8X/LOuwMPFTH+W53pLC/FtPj+Fs8msHfB548NsbOi5I4rbUUukxsNTQG60z3h9v
         QUXAWFuLtx1IU+OuVXBN4BCXqjXnB4kQHsK1rBizKJvki2ezdotb3iylNepLF7Mhs+87
         lDPQ==
X-Gm-Message-State: AOJu0YzgtqGledsNOS27aOQ2ZvO2Zwmw1YuV6HMbsLLRHGmJKHjQFl8i
	kkdG0Lafj9KcXXzXU5CiSucFs9U6J4w=
X-Google-Smtp-Source: AGHT+IFGphKohxi6itzuX/oU9Q7e5WHKink6zVHZUFKcjGPpdDkliXIOfcrKRCdzdmudmCOCPwX1AQ==
X-Received: by 2002:a05:6402:22a1:b0:559:4db2:80a8 with SMTP id cx1-20020a05640222a100b005594db280a8mr1862246edb.2.1705445077419;
        Tue, 16 Jan 2024 14:44:37 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id p14-20020a056402044e00b0055773fb50fbsm7236202edw.15.2024.01.16.14.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 14:44:36 -0800 (PST)
Message-ID: <3067e362-eee3-f338-9b64-49a33547bd3b@gmail.com>
Date: Tue, 16 Jan 2024 23:44:34 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] leds: trigger: panic: simplify led_trigger_set_panic
To: Heiner Kallweit <hkallweit1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <84c0fa67-2f03-4474-aa75-914d65d88dd0@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <84c0fa67-2f03-4474-aa75-914d65d88dd0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/23 23:54, Heiner Kallweit wrote:
> I don't see why we iterate over all triggers to find the panic trigger.
> We *are* the panic trigger. Therefore we also know that the panic
> trigger doesn't have an activate() hook. So we can simplify the code
> significantly.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/trigger/ledtrig-panic.c | 23 +++++++----------------
>   1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
> index 72297a845..c646a3cbc 100644
> --- a/drivers/leds/trigger/ledtrig-panic.c
> +++ b/drivers/leds/trigger/ledtrig-panic.c
> @@ -21,24 +21,15 @@ static struct led_trigger *trigger;
>    */
>   static void led_trigger_set_panic(struct led_classdev *led_cdev)
>   {
> -	struct led_trigger *trig;
> +	if (led_cdev->trigger)
> +		list_del(&led_cdev->trig_list);
> +	list_add_tail(&led_cdev->trig_list, &trigger->led_cdevs);
>   
> -	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (strcmp("panic", trig->name))
> -			continue;
> -		if (led_cdev->trigger)
> -			list_del(&led_cdev->trig_list);
> -		list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
> +	/* Avoid the delayed blink path */
> +	led_cdev->blink_delay_on = 0;
> +	led_cdev->blink_delay_off = 0;
>   
> -		/* Avoid the delayed blink path */
> -		led_cdev->blink_delay_on = 0;
> -		led_cdev->blink_delay_off = 0;
> -
> -		led_cdev->trigger = trig;
> -		if (trig->activate)
> -			trig->activate(led_cdev);
> -		break;
> -	}
> +	led_cdev->trigger = trigger;
>   }
>   
>   static int led_trigger_panic_notifier(struct notifier_block *nb,

Looks good to me.

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

