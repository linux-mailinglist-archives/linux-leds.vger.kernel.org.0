Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F56C2A5CE
	for <lists+linux-leds@lfdr.de>; Sat, 25 May 2019 19:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfEYRct (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 May 2019 13:32:49 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37450 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfEYRcs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 May 2019 13:32:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id r10so11488764otd.4
        for <linux-leds@vger.kernel.org>; Sat, 25 May 2019 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Gy9W1697bnJcZZYL9JPR13RWL43dUSo9hT4REu7ye88=;
        b=iFWPNFkW/msjuLBcH1597P5z4p04Oh2a5rg9i23EXl8eHTZLZ8x4Xb7VKbO5ERrBOc
         Ou3T1kdVwVnvAIkwRx2aXrnqOhf0BWokJrU6ARtpeKnimQXrZQLpT7lqNJz1u6ohw3N7
         RhkW4oggrur4UWZjaTO/qI3TEp2qhkkWMr2XYG6e1zwXV26WmH8YQPSXDgnCMkAHJAOD
         YqC2eDGARMY45KF6aPgL1PyeYkr6Fo5cqJLekG5Aw8a7F5pRUv5ISEqj3x141FTuSGh9
         GMuq2ORD/QbFkD66n3C1Q6F/OAEHhdvZ0ix/DorC2vHmJB8t0ntym9/U1RaomsyKoq2o
         vXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Gy9W1697bnJcZZYL9JPR13RWL43dUSo9hT4REu7ye88=;
        b=Osq630yS8mB+IUh5yRzL34cyYtSPCOLyL2nqJqM/J2j31zBdJyVEwgQb+rqx0cxZ7w
         naxeOsxmi/LA7d3oRE7PZyfjjRqcLxJXfK4MVyHvTIyZRqlfPaUkCdiAnjSMqLEP/4hl
         LnZ1MrT/qTW9gR6DWw7LHjLgNZAi9oZxIfbb1Z3UVlu8zpb3w+iTT/hG639z1/nG/P9Y
         qLK/l0x2WSulhvqkmXwMOTP/BjDZxjZl9lr0pS8GfK4ppj7+sSLmKJhB0hLULfzxvo4X
         MNl684SjiloIeP8ahoEU7VpPSCs4X2sd9pQfRXCRct2jKsoX0vdpeXnVD80Q9lIB71mg
         tncQ==
X-Gm-Message-State: APjAAAWLGWAHgnr/GF7p5c+Ovrrzl3AJc734NRMOuqoGWBirVNhX2wDO
        cd5cwNeq8Q2ARlyMTNtIzvJyCg==
X-Google-Smtp-Source: APXvYqwHPDK5YDX5n1VmM8qsxD8m2BvhBoawwa+maja28PntVCqHAA2nLLN3ZPpUVp/9axALAfH3gQ==
X-Received: by 2002:a05:6830:1545:: with SMTP id l5mr32208199otp.69.1558805567517;
        Sat, 25 May 2019 10:32:47 -0700 (PDT)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b127sm2413034oih.43.2019.05.25.10.32.46
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 25 May 2019 10:32:46 -0700 (PDT)
Date:   Sat, 25 May 2019 10:32:31 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Pavel Machek <pavel@ucw.cz>
cc:     Hugh Dickins <hughd@google.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Revert "leds: avoid races with workqueue"?
In-Reply-To: <20190525093759.GA17767@amd>
Message-ID: <alpine.LSU.2.11.1905251025300.1112@eggly.anvils>
References: <alpine.LSU.2.11.1905241540080.1674@eggly.anvils> <20190525093759.GA17767@amd>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 25 May 2019, Pavel Machek wrote:

> Hi!
> 
> > I'm having to revert 0db37915d912 ("leds: avoid races with workqueue")
> > from my 5.2-rc testing tree, because lockdep and other debug options
> > don't like it: net/mac80211/led.c arranges for led_blink_setup() to be
> > called at softirq time, and flush_work() is not good for calling
> > then.
> 
> This should keep X60 working (as well as it is now; X60 will still
> have problems with lost events in setup like yours).
> 
> Can you test this instead of the revert?

Thanks, Pavel: yes, that works fine for me on the T420s, no debug
complaints, good and silent; and the wifi LED is blinking as before.

Hugh

> 
> Thanks,
> 								Pavel
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index aefac4d..ebaac4d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -158,19 +159,14 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>  	}
>  
>  	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
> -	mod_timer(&led_cdev->blink_timer, jiffies + 1);
> +	mod_timer(&led_cdev->blink_timer, jiffies + 1); /* Why oh why? Just call it directly? */
>  }
>  
> -
> +/* May not block */
>  static void led_blink_setup(struct led_classdev *led_cdev,
>  		     unsigned long *delay_on,
>  		     unsigned long *delay_off)
>  {
> -	/*
> -	 * If "set brightness to 0" is pending in workqueue, we don't
> -	 * want that to be reordered after blink_set()
> -	 */
> -	flush_work(&led_cdev->set_brightness_work);
>  	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>  	    led_cdev->blink_set &&
>  	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
> diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
> index ca898c1..427fc3c 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -113,6 +113,11 @@ static int timer_trig_activate(struct led_classdev *led_cdev)
>  		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
>  	}
>  
> +	/*
> +	 * If "set brightness to 0" is pending in workqueue, we don't
> +	 * want that to be reordered after blink_set()
> +	 */
> +	flush_work(&led_cdev->set_brightness_work);
>  	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
>  		      &led_cdev->blink_delay_off);
>  
> 
> 
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
