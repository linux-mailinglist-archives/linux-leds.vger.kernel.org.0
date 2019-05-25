Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6170E2A5B1
	for <lists+linux-leds@lfdr.de>; Sat, 25 May 2019 19:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfEYRCv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 May 2019 13:02:51 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:34481 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfEYRCv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 May 2019 13:02:51 -0400
Received: by mail-wr1-f47.google.com with SMTP id f8so12881762wrt.1;
        Sat, 25 May 2019 10:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FJMoSwtFQuobGh2l0B0WBCf8j6tqYKncVNKUYyAji8A=;
        b=CpGmafQ+qVpsOQbVUKOQiNc7xR6tV3cpqn54YbP2vby9m+RfFwdE3eDkyfUhj/rEqi
         QvCq7yR5VjkzzRQxo9rr+Qf5krJLS/DsSKN697XolV1hDjiCym8l7C+YTAH8JT3sEDUD
         v9NhEytvdj6junaHrffRXg3xJ6yYddujZp7h03kzOM/JcdNTnsBNEkNePw79yYFTMN1F
         4/euU/n3t+jSnUvgTEpViipWbvRnRx+S9ZGE8ZD1AQVEos8jW2jB2c2xR+QHZ4LdOQky
         I/feJ4+c5mGxPWSK8avwHCM1bSKtUYqeRFhcMwrRYNQ9bwU/mPzMaLSNicTIXWJUEArM
         j9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FJMoSwtFQuobGh2l0B0WBCf8j6tqYKncVNKUYyAji8A=;
        b=EgX5dFzhiXEQKqVye2gaweGEVoTR9FMMeBj+GZNrl2pKeTWnrvJBh3EcrSnTKDGWXx
         8yzObDU2Tsz7sUVPJkxnH7ldbF8jYZek9Gmf55b2j5XnyOUZnLD94W6kL997Q5RYmmEm
         LBoddzkrt6T2xahPHQFW4nT74PTb13m1sF5U5r7Ly6Jm8Ok3lHOuiMMUZDMDNzyWpEwy
         YaOVkQmjUQzSm02aXGZaexqEgmpEUzZgKqhX7aUaeNaQx4UzE6vfhMPhoMONjHaJmHcB
         U3X3rQBX4T6aU/nqIIl1CAqrcS11bPhvMcY2eePFPDxkMVM6WA0bIHxr3uDbAqr83rEs
         3hsw==
X-Gm-Message-State: APjAAAWEJCjdVx+m3wyoEKgZCdqmAB76nYWxOE7uJpkDnS8brKlUy+Oz
        5BA3ZBcp1u/4/a9OnGzbgWw=
X-Google-Smtp-Source: APXvYqw5P1CelOdOgtr1cAg0hcd5NyvRppNxOrlMEyRrdwvj6F5tqZXNxYWNGReNCE5zz1JHSRW/Ag==
X-Received: by 2002:a5d:4302:: with SMTP id h2mr21205957wrq.137.1558803769874;
        Sat, 25 May 2019 10:02:49 -0700 (PDT)
Received: from [192.168.1.17] (dku44.neoplus.adsl.tpnet.pl. [83.24.24.44])
        by smtp.gmail.com with ESMTPSA id l14sm5335503wrt.57.2019.05.25.10.02.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 10:02:49 -0700 (PDT)
Subject: Re: Disk activity trigger: keeps blinking under full load
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, linz@li-pro.net, rpurdie@rpsys.net
References: <20190523214301.GA14788@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <67fee5a8-cba1-79aa-104c-84bbe0e168e9@gmail.com>
Date:   Sat, 25 May 2019 19:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523214301.GA14788@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 5/23/19 11:43 PM, Pavel Machek wrote:
> Hi!
> 
> I'm trying to use disk activity trigger on a scrollock LED... but it
> significantly differs from "usual" disk LED: even under "full" disk
> activity (linear read) where it should be solidly "on", it keeps
> blinking.
> 
> I guess that's what led_trigger_blink_oneshot() does. I tried to
> change the parameters... off_delay == 0 breaks it completely, and even
> with delay of 1 it behaves very weirdly.
> 
> Is there better helper I should use?

It seems this is the way how led_blink_set_oneshot() works.
It initially checks whether timer is pending and doesn't
reset the timer in this case:

         if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
              timer_pending(&led_cdev->blink_timer))
                 return;

In effect you get gaps between timer expiration and setting of a new
blink shot.

Best regards,
Jacek Anaszewski

> 
> 								Pavel
> 
> diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/ledtrig-disk.c
> index 9816b0d..cf40ef2 100644
> --- a/drivers/leds/trigger/ledtrig-disk.c
> +++ b/drivers/leds/trigger/ledtrig-disk.c
> @@ -15,7 +15,7 @@
>   #include <linux/init.h>
>   #include <linux/leds.h>
>   
> -#define BLINK_DELAY 30
> +#define BLINK_DELAY 10
>   
>   DEFINE_LED_TRIGGER(ledtrig_disk);
>   DEFINE_LED_TRIGGER(ledtrig_disk_read);
> @@ -25,17 +25,18 @@ DEFINE_LED_TRIGGER(ledtrig_ide);
>   void ledtrig_disk_activity(bool write)
>   {
>   	unsigned long blink_delay = BLINK_DELAY;
> +	unsigned long off_delay = 1;
>   
>   	led_trigger_blink_oneshot(ledtrig_disk,
> -				  &blink_delay, &blink_delay, 0);
> +				  &blink_delay, &off_delay, 0);
>   	led_trigger_blink_oneshot(ledtrig_ide,
> -				  &blink_delay, &blink_delay, 0);
> +				  &blink_delay, &off_delay, 0);
>   	if (write)
>   		led_trigger_blink_oneshot(ledtrig_disk_write,
> -					  &blink_delay, &blink_delay, 0);
> +					  &blink_delay, &off_delay, 0);
>   	else
>   		led_trigger_blink_oneshot(ledtrig_disk_read,
> -					  &blink_delay, &blink_delay, 0);
> +					  &blink_delay, &off_delay, 0);
>   }
>   EXPORT_SYMBOL(ledtrig_disk_activity);
>   
> @@ -44,6 +45,7 @@ static int __init ledtrig_disk_init(void)
>   	led_trigger_register_simple("disk-activity", &ledtrig_disk);
>   	led_trigger_register_simple("disk-read", &ledtrig_disk_read);
>   	led_trigger_register_simple("disk-write", &ledtrig_disk_write);
> +	/* deprecate? */
>   	led_trigger_register_simple("ide-disk", &ledtrig_ide);
>   
>   	return 0;
> 
> 
> 
> 

