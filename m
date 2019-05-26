Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0592AB4E
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2019 18:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbfEZQ5q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 May 2019 12:57:46 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33428 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbfEZQ5q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 May 2019 12:57:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so4730664wmh.0;
        Sun, 26 May 2019 09:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=n2hs+YvjV76ctUXsqlZjlfSiFrqgNxOOpQSUXQbPvxA=;
        b=cXwvb/ufIpMdbl6aRjMUZNsyECgC+w+b6uijRG8qPVfSeWY5WWzITURLHF2foryWPN
         tcMo2c2hpjVN27h6/dm8vTBQda2znayvIEwElBRG5q/U6yRrh+w6Icahv+mPuUCmUJgj
         NbuXxLxnUf2l5GjdVlLrVEtGsd/JKABqatBehafYoOF4rCS1hoJdrgyaLwVQkLnWb0jw
         PCYkcthZazrz958JM8eOft5uHJzXnJ1gb0fn+VbEFJ/zE9hEG4QCsRZWv1JkOLSl385S
         3MXXTkllLpEDwPQWloLGF8GsKLWo4y4y7dvybZsU+P+5vgjFzHZHOJlAiaFb43faBwOS
         V/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n2hs+YvjV76ctUXsqlZjlfSiFrqgNxOOpQSUXQbPvxA=;
        b=ubMOMPx8SJ2zQvONZeH3nGBhMTk8eon/XCu3Fj3VR6QDd+HjB8iN9j+wesUGWJkH32
         hTG1hzewMVFJvfz7dXy5fEpZwaeTy+wj3GNNTfwboFJDrmZIiqELyjLHZOYG8wYJlR4D
         vgUlAWCIH5ZjXCgN69rVluifsqBcjuw6l7UCBysT/otVjgAIrZnYCZ1pF+CchRhVeplx
         aqoYzHeSpgefD10odSSmJdANtjpbcLOrA8ILrAHyBdxLmHJNz4eaPvepqaITY1NqIBOX
         pyHcRfMr0dzKcyjMlnD/+7RKgQqcZDSJqwVI/AGUxOshFiNYBVOgFw24MAANOAJumzCh
         ka7w==
X-Gm-Message-State: APjAAAXl3qKUxzc+JdzTZDs0+nxY/KuNAYwOHgItmAFABygWqRZanE3C
        i0lBOpOJOIZqfePj+xa95+8cgHpp
X-Google-Smtp-Source: APXvYqxQ5moE9eS/Rn0QwMhETpg6hTy8BxNprOyIzjwrdLJpL8eYixPHWlsBZbUIEVaTxrpKuHyINg==
X-Received: by 2002:a1c:a50e:: with SMTP id o14mr9967998wme.77.1558889864526;
        Sun, 26 May 2019 09:57:44 -0700 (PDT)
Received: from [192.168.1.17] (dnl167.neoplus.adsl.tpnet.pl. [83.24.93.167])
        by smtp.gmail.com with ESMTPSA id e14sm8480763wma.41.2019.05.26.09.57.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 09:57:43 -0700 (PDT)
Subject: Re: leds: avoid flush_work in atomic context
To:     Pavel Machek <pavel@ucw.cz>, hughd@google.com,
        linux-leds@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
References: <20190526073854.GA13681@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5a741b3c-cf45-3577-9b6c-653f083ca96b@gmail.com>
Date:   Sun, 26 May 2019 18:57:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190526073854.GA13681@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Thank you for the patch.

I've applied it however I'm not sure if it is an official
submission, since it doesn't look like (no [PATCH] tag
in the subject).

Beside that 'Fixes' tag is somewhat incomplete - it should be
generated using following git command:

git log -1 0db37915d912 --format='Fixes: %h ("%s")'

Fixed that and applied to the for-next branch and will push
it upstream after a bit of testing for rc3 or rc4.

Best regards,
Jacek Anaszewski

On 5/26/19 9:38 AM, Pavel Machek wrote:
> 
> It turns out that various triggers use led_blink_setup() from atomic
> context, so we can't do a flush_work there. Flush is still needed for
> slow LEDs, but we can move it to sysfs code where it is safe.
>      
>      WARNING: inconsistent lock state
>      5.2.0-rc1 #1 Tainted: G        W
>      --------------------------------
>      inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
>      swapper/1/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
>      000000006e30541b
>      ((work_completion)(&led_cdev->set_brightness_work)){+.?.}, at:
>      +__flush_work+0x3b/0x38a
>      {SOFTIRQ-ON-W} state was registered at:
>        lock_acquire+0x146/0x1a1
>       __flush_work+0x5b/0x38a
>       flush_work+0xb/0xd
>       led_blink_setup+0x1e/0xd3
>       led_blink_set+0x3f/0x44
>       tpt_trig_timer+0xdb/0x106
>       ieee80211_mod_tpt_led_trig+0xed/0x112
>      
> Fixes: 0db37915d912
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> Tested-by: Hugh Dickins <hughd@google.com>
>      
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index aefac4d..9f8da39 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -166,11 +166,6 @@ static void led_blink_setup(struct led_classdev *led_cdev,
>   		     unsigned long *delay_on,
>   		     unsigned long *delay_off)
>   {
> -	/*
> -	 * If "set brightness to 0" is pending in workqueue, we don't
> -	 * want that to be reordered after blink_set()
> -	 */
> -	flush_work(&led_cdev->set_brightness_work);
>   	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>   	    led_cdev->blink_set &&
>   	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
> diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
> index ca898c1..427fc3c 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -113,6 +113,11 @@ static int timer_trig_activate(struct led_classdev *led_cdev)
>   		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
>   	}
>   
> +	/*
> +	 * If "set brightness to 0" is pending in workqueue, we don't
> +	 * want that to be reordered after blink_set()
> +	 */
> +	flush_work(&led_cdev->set_brightness_work);
>   	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
>   		      &led_cdev->blink_delay_off);
>   
> 

