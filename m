Return-Path: <linux-leds+bounces-467-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C9081BBEC
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 17:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 339951F26077
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 16:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4C555E71;
	Thu, 21 Dec 2023 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzSPob8j"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EAD55E63
	for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 16:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D410BC433C7;
	Thu, 21 Dec 2023 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703176056;
	bh=nd6qVnGn9zj6Ej90gDHzwzDlRIOWZbeM7rH3rmy/otU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzSPob8jkeXC50uJ/WXdHQcyc/p9fl7zlrXYBV0qdOjQZuYaVs60fGE915cVZtJCZ
	 +OPOZB1jkJx9ftdQ4Lrc4ZaTcWmwvZpDebFo3laAqauuaVDhqZix8VPNlp2pZrQAW5
	 NTkMtQpUG7EhqtbtrfB0a+/5S2M3nr9pn8JUNcKA39YKViPj3rUkLSCrlIBXZ8E1xa
	 6Kjz4iJ93E9CDu+HPO9yLQ0R91tP9u7hE4S41oT8q7rNYsXi0y26uQliB9/h61ap57
	 uS6WxZozXrLkIUjr2tSwxkcaJG4JPwKv/071yXN+9DSiHiXVBvdMX4yUKUnPMow3lK
	 HdiT8k1hgQ4CA==
Date: Thu, 21 Dec 2023 16:27:31 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH v3] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Message-ID: <20231221162731.GQ10102@google.com>
References: <4be46f91-f8b9-4c5f-8434-c7cae83eec93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4be46f91-f8b9-4c5f-8434-c7cae83eec93@gmail.com>

On Thu, 21 Dec 2023, Heiner Kallweit wrote:

> The current codes uses the sw_control path in set_baseline_state() when
> called from netdev_trig_activate() even if we're hw-controlled. This
> may result in errors when led_set_brightness() is called because we may
> not have set_brightness led ops (if hw doesn't support setting a "LED"
> to ON). In addition this path may schedule trigger_data->work which
> doesn't make sense when being hw-controlled.
> 
> Therefore set trigger_data->hw_control = true before calling
> set_device_name() from netdev_trig_activate(). In this call chain we
> have to prevent set_baseline_state() from being called, because this
> would call hw_control_set(). Use led_cdev->trigger_data == NULL as
> indicator for being called from netdev_trig_activate().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - improve commit message
> v3:
> - spelling and style fixes
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Doesn't apply.  Please rebase it on top of the LEDs repo.

https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 09e75fd9f..6cbba44dd 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -267,7 +267,10 @@ static int set_device_name(struct led_netdev_data *trigger_data,
>  
>  	trigger_data->last_activity = 0;
>  
> -	set_baseline_state(trigger_data);
> +	/* Skip if we're called from netdev_trig_activate() and hw_control is true */
> +	if (!trigger_data->hw_control || led_get_trigger_data(trigger_data->led_cdev))
> +		set_baseline_state(trigger_data);
> +
>  	mutex_unlock(&trigger_data->lock);
>  	rtnl_unlock();
>  
> @@ -602,8 +605,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
>  		if (dev) {
>  			const char *name = dev_name(dev);
>  
> -			set_device_name(trigger_data, name, strlen(name));
>  			trigger_data->hw_control = true;
> +			set_device_name(trigger_data, name, strlen(name));
>  
>  			rc = led_cdev->hw_control_get(led_cdev, &mode);
>  			if (!rc)
> -- 
> 2.43.0

-- 
Lee Jones [李琼斯]

