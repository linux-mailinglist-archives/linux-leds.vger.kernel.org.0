Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCFA123471
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 19:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbfLQSIy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 13:08:54 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40539 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbfLQSIx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 13:08:53 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so12348624wrn.7;
        Tue, 17 Dec 2019 10:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r9TxEKTKV+WHR54DZ1924CbMt0ryZfE415vfJWMvv+0=;
        b=djrHoyBT+oplZ3HABt5VPpt8gPdQz5+5DnxP8s9YyZbg2UNTRrRtNqNpEEipviBDHy
         xSK6A0XoROR/W+YdF4pSQYDSXZL3kJHfY85XWvXOIM/BTBZh7bzWEpx3dUSWsJf6ZH8l
         pU/USvmqdUjHGauMBAf7iyp5qfbzOrAKfVkmiBNLSkDuzbIMn38WPmBMIYnBnmvGVcAm
         WoN69pQzyrxedYd4wAqYuxqweGcPYz5RVJKqtNlNlOpUXo4JKzM9nxn6WXzQ26TfiZTw
         iI4WBz7F9NZrxxiozIdwumpUgwHzyCs0BTSqe2JMLMsEJvU38N5V88TPLsBgWdBeiTZw
         Jq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=r9TxEKTKV+WHR54DZ1924CbMt0ryZfE415vfJWMvv+0=;
        b=cRKQzkNpwE4m6QcCowket1+lQVsCYhyisW5eOt+Bt2K7/UI1LAFb4EDJt7okmQ9WK2
         KhH9N9e0LbEb/TlkX+zJtxgkx6Chex4rvg320QBJ3NhzZWaBuootRSGyiNl1g+mlOSgK
         u2iMMNJViZefnSHaA9jphM4MS3eKWCEA0mB/TWqwNYkKBCfhCpPjnPfBUKBz0RuRX6Fe
         EKc3zKt0tZ8TZQ1iCMBVr3gy7xknLeD2Lu37szZHF8A8tEgvn7qpIfQXBXU4nhdXsVzx
         fZdIgV9FkOpUTszRqzf6gDA2mygrKiLoz+6zhcSfXrC+qAL1HgsKSbkbBBoYxTDGNowv
         Cl6Q==
X-Gm-Message-State: APjAAAUpuQxi3dZOVKmVbA6uqc41JJ1od3Jl13Ya5pkGwN1Q4PyotV/+
        ev2c+BQoQH+erdAYhaqILZ24+pNr
X-Google-Smtp-Source: APXvYqyZUTHcAHb7cAcrt2OINc1mthG8lPtEvUjVO0nndec49key7Ecs6sd1Pu4TqcYQyAkS3vfIKA==
X-Received: by 2002:a05:6000:1187:: with SMTP id g7mr39726419wrx.109.1576606129788;
        Tue, 17 Dec 2019 10:08:49 -0800 (PST)
Received: from [192.168.1.19] (bfn146.neoplus.adsl.tpnet.pl. [83.28.51.146])
        by smtp.gmail.com with ESMTPSA id y139sm4069359wmd.24.2019.12.17.10.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 10:08:49 -0800 (PST)
Subject: Re: [PATCH v4 1/3] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
References: <20191217165816.19324-1-u.kleine-koenig@pengutronix.de>
 <20191217165816.19324-2-u.kleine-koenig@pengutronix.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c83b364b-3494-cf3d-0429-61ec3b502be0@gmail.com>
Date:   Tue, 17 Dec 2019 19:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191217165816.19324-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Uwe,

I wanted to test the set but unfortunately this
patch does not apply. See below for the apparent reason.

On 12/17/19 5:58 PM, Uwe Kleine-König wrote:
> Introduce a new function tty_kopen_shared() that yields a struct
> tty_struct. The semantic difference to tty_kopen() is that the tty is
> expected to be used already. So rename tty_kopen() to
> tty_kopen_exclusive() for clearness, adapt the single user and put the
> common code in a new static helper function.
> 
> tty_kopen_shared is to be used to implement an LED trigger for tty
> devices in one of the next patches.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/staging/speakup/spk_ttyio.c |  2 +-
>  drivers/tty/tty_io.c                | 58 ++++++++++++++++++++---------
>  include/linux/tty.h                 |  5 ++-
>  3 files changed, 44 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/speakup/spk_ttyio.c b/drivers/staging/speakup/spk_ttyio.c
> index 5a9eff08cb96..e9db06eae875 100644
> --- a/drivers/staging/speakup/spk_ttyio.c
> +++ b/drivers/staging/speakup/spk_ttyio.c
> @@ -147,7 +147,7 @@ static int spk_ttyio_initialise_ldisc(struct spk_synth *synth)
>  	if (ret)
>  		return ret;
>  
> -	tty = tty_kopen(dev);
> +	tty = tty_kopen_exclusive(dev);
>  	if (IS_ERR(tty))
>  		return PTR_ERR(tty);
>  
> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index a1453fe10862..b718666ce73c 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -1875,22 +1875,7 @@ static struct tty_driver *tty_lookup_driver(dev_t device, struct file *filp,
>  	return driver;
>  }
>  
> -/**
> - *	tty_kopen	-	open a tty device for kernel
> - *	@device: dev_t of device to open
> - *
> - *	Opens tty exclusively for kernel. Performs the driver lookup,
> - *	makes sure it's not already opened and performs the first-time
> - *	tty initialization.
> - *
> - *	Returns the locked initialized &tty_struct
> - *
> - *	Claims the global tty_mutex to serialize:
> - *	  - concurrent first-time tty initialization
> - *	  - concurrent tty driver removal w/ lookup
> - *	  - concurrent tty removal from driver table
> - */
> -struct tty_struct *tty_kopen(dev_t device)
> +static struct tty_struct *tty_kopen(dev_t device, int shared)
>  {
>  	struct tty_struct *tty;
>  	struct tty_driver *driver;

In mainline, even in v5.5-rc2 we have here NULL assignment:

struct tty_driver *driver = NULL;

> @@ -1905,7 +1890,7 @@ struct tty_struct *tty_kopen(dev_t device)
>  


-- 
Best regards,
Jacek Anaszewski
