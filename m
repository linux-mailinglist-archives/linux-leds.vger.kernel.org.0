Return-Path: <linux-leds+bounces-574-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885482AA69
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 10:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 945302845A9
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 09:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0CC107A9;
	Thu, 11 Jan 2024 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Asv+gY7K"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9931078D
	for <linux-leds@vger.kernel.org>; Thu, 11 Jan 2024 09:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86773C433F1;
	Thu, 11 Jan 2024 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704963812;
	bh=ti7ng7KO2QO0kzS6LDfTNBnSHo9weAbZiJaCfjR5GKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Asv+gY7KWy8HLXSKIxrIuvtEeLgzpRHEYupCAvd4b6byD9qMK3yx2cJXQxkEvtvQ8
	 9NK6+rLH9n3MBiEQWpkpXdpOMcRuCS3gEnMD8XoptooTV9LEg1uT7knF8ONPXXiKQm
	 K/phoIIPl3uwSRJVyHxjwfT/tFf/KIVGecXW9c3kP2XdSRCmqW7W2XePKUl++hXqJm
	 BRfEAyPRh+bh/9P5Wf1hJx6Zou5SZCjs0ElFAgyNOTpPxwdhCxShr9sRdZnttUOTtd
	 4o2MT9IUVeisJUYLazBoipUwxkyiijle8fLxDcDTIziH6GNs2j1otXXM5c95ZR7z9u
	 bxi6fM3E/+oAw==
Date: Thu, 11 Jan 2024 09:03:28 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, ezequiel@vanguardiasur.com.ar
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: panic: simplify led_trigger_set_panic
Message-ID: <20240111090328.GK7948@google.com>
References: <84c0fa67-2f03-4474-aa75-914d65d88dd0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84c0fa67-2f03-4474-aa75-914d65d88dd0@gmail.com>

On Sat, 09 Dec 2023, Heiner Kallweit wrote:

> I don't see why we iterate over all triggers to find the panic trigger.
> We *are* the panic trigger. Therefore we also know that the panic
> trigger doesn't have an activate() hook. So we can simplify the code
> significantly.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-panic.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)

I would like to take a little advice from the author here who should
have been Cc:ed.  In case there is information we're missing or
overseeing.

> diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
> index 72297a845..c646a3cbc 100644
> --- a/drivers/leds/trigger/ledtrig-panic.c
> +++ b/drivers/leds/trigger/ledtrig-panic.c
> @@ -21,24 +21,15 @@ static struct led_trigger *trigger;
>   */
>  static void led_trigger_set_panic(struct led_classdev *led_cdev)
>  {
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
>  }
>  
>  static int led_trigger_panic_notifier(struct notifier_block *nb,
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

