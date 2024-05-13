Return-Path: <linux-leds+bounces-1666-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F58C3ADF
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2024 07:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 452B8B20CAB
	for <lists+linux-leds@lfdr.de>; Mon, 13 May 2024 05:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E7614600B;
	Mon, 13 May 2024 05:10:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97E1146583;
	Mon, 13 May 2024 05:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715577000; cv=none; b=j6sIyF3np+T+GrueyCiGgZxIpSzTB9XJqWZ7DFO45X46ou/PH6F1DaZdkN4QVVfTT+AH5Oj7QaRjrGsoeMeG1G22kiA8y9IjROgeCgL/VgzueShryB+tBZcQY8t0zrKI55JNnaLkSuftv4+BFq8yTbf7Oa7xMuZLVZlqClC8NwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715577000; c=relaxed/simple;
	bh=m7BRxFRNJ/i5qEvdpvMAo/4WiXJ+xVDbUAjCQFpbrh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljKGERldvTPdRiiq5pa4NECqvZiKKZ2mqJISBOExRux2Vb+mREKeiyWZ4ZGRxXP7asTxZI5mI2ej3OeE/f/yJeJz7PpdeTGkr6C7oPA1UWb/eouCJzIWFTvuPd2lPKP6rG1Ct2E9hzxl+q4LCCAEVCz0HlRwO0QoxPOjGilPAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59a609dd3fso669118566b.0;
        Sun, 12 May 2024 22:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715576997; x=1716181797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1AR7KFIR0Zv8q1Vup6Xfc1aVtPcvMbs2Yj9nMuS/xE=;
        b=l5EIMbAwoRvzyzI/fYFZLQuovykbbAF4I/mEcIxNmiJ3xXJXbjF+0n8+pi86NIo9mt
         DxG5ybZblT9RzNUoSqJ18p6cSHCl7XTNGNlir05oIhuAXxJIyHUn2dKgiUugd04SOz6f
         gEwSMB/qx2fxS7V96gf4fC1RR7hWSvnHZ/TEr4yBifOFDd8Gau3hys5+3+v4Tnnw+5OD
         bvJC+ki+BRJ//B5Eixmm1phkAfgQBYdg4xWTq0ddIbPmNeX4uxMsMjUFpalCldhcBPcR
         5pbh3kKiCE0KbdzEUp/eQ7YD4Fk4n0jj7vFn5MQ4H5IHOd0PzwqQhp2mnIseXQV0GHmL
         X97g==
X-Forwarded-Encrypted: i=1; AJvYcCVMOGFk9oLt2NrrqpFiye5sIb4zUPnHQzr8swcCP0w+yjxufCYvvErTOoi4THe8L8ijKE8ovXVU7r/mhK1U/+uCy1L8133VFthzJMbb0DiTfeCeKsMQwYDbT7zJMgZSqY8B4hH5Q6B+4w==
X-Gm-Message-State: AOJu0YwWaU61JtMRknT1y2bKzvHcZQjYGTDmA6Cps+YrfEdiN9EIHrl7
	EAPccy17L91hrREWilqH4HnY8tADTjUgp7zl7OEZFqUPB03H+NLo
X-Google-Smtp-Source: AGHT+IFbZk5FlUpnAareploZlBObFiaRcWQNSYsHULOhmW1YV/nhzjocxw/+pxJzm1CnScqTV236iA==
X-Received: by 2002:a17:906:5649:b0:a59:aa7a:3b16 with SMTP id a640c23a62f3a-a5a2d18a9a1mr733159166b.4.1715576997093;
        Sun, 12 May 2024 22:09:57 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a74367a36sm18178766b.169.2024.05.12.22.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 May 2024 22:09:56 -0700 (PDT)
Message-ID: <3658e1d0-913c-4f31-aa92-06fbd8b717c1@kernel.org>
Date: Mon, 13 May 2024 07:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vt: keyboard: Use led_set_brightness() in LED trigger
 activate() callback
To: Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
References: <20240511152030.4848-1-hdegoede@redhat.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240511152030.4848-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11. 05. 24, 17:20, Hans de Goede wrote:
> A LED trigger's activate() callback gets called when the LED trigger
> gets activated for a specific LED, so that the trigger code can ensure
> the LED state matches the current state of the trigger condition.
> 
> led_trigger_event() is intended for trigger condition state changes and
> iterates over _all_ LEDs which are controlled by this trigger changing
> the brightness of each of them.
> 
> In the activate() case only the brightness of the LED which is being
> activated needs to change and that LED is passed as an argument to
> activate(), switch to led_set_brightness() to only change the brightness
> of the LED being activated.

LGTM, but could you elaborate on what behavior this fixes? Should it be 
backported to stable?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/tty/vt/keyboard.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
> index a2116e135a82..804355da46f5 100644
> --- a/drivers/tty/vt/keyboard.c
> +++ b/drivers/tty/vt/keyboard.c
> @@ -1033,9 +1033,7 @@ static int kbd_led_trigger_activate(struct led_classdev *cdev)
>   
>   	tasklet_disable(&keyboard_tasklet);
>   	if (ledstate != -1U)
> -		led_trigger_event(&trigger->trigger,
> -				  ledstate & trigger->mask ?
> -					LED_FULL : LED_OFF);
> +		led_set_brightness(cdev, ledstate & trigger->mask ? LED_FULL : LED_OFF);
>   	tasklet_enable(&keyboard_tasklet);
>   
>   	return 0;

thanks,
-- 
js


