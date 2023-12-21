Return-Path: <linux-leds+bounces-464-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66E81BA66
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 16:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71E7F1C24CBD
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 15:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F044AF75;
	Thu, 21 Dec 2023 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyhQoWuG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F9360BC
	for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 15:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98919C433C7;
	Thu, 21 Dec 2023 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703171817;
	bh=6r4TjLwKwlHy+PVEM6OXVk5sI/e2f0dVPkCqbwZxlDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyhQoWuG0WnWFOD7q56+/y5EezIlwMiK38KLewYl+iyHZ+pLeshiuWM9VAwlYtc76
	 Fmk1h5bm95jKD9dVu3xV+T5jXPnYE8af6/QTio5ubZmJ4ioz8cNikEMSHccijQhJBn
	 CrdXWD2Any5KNY5H3TCI0RfuinvuU0oGbp+K2D6myfO/ePlzlwSPee4qEN5H4RxIFu
	 y3IWm8jbvlH+9rHUCVOIxycNDEune3JblGPMpShMYZy8YFHIH4x1UyP2RkOKCKvhtk
	 BUn1m2U9LPeWw0UeyF2C3l2My/zwhcDirB5SLeeYeWenBkpZxiNxDCJaeKCySahQBt
	 ekNK0g5j4skJA==
Date: Thu, 21 Dec 2023 15:16:53 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Message-ID: <20231221151653.GK10102@google.com>
References: <91f7f2aa-b666-450a-b970-967b1b06fe9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91f7f2aa-b666-450a-b970-967b1b06fe9a@gmail.com>

On Mon, 18 Dec 2023, Heiner Kallweit wrote:

> The current codes uses the sw_control path in set_baseline_state() when
> called from netdev_trig_activate() even if we're hw-controlled. This
> may result in errors when led_set_brightness() is called because we may
> not have set_brightness led ops (if hw doesn't support setting a LED

"LED"

> to ON). In addition this path may schedule trigger_data->work what

s/what/which/

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
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 7ed2d0b64..b58396600 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -251,7 +251,11 @@ static int set_device_name(struct led_netdev_data *trigger_data,
>  
>  	trigger_data->last_activity = 0;
>  
> -	set_baseline_state(trigger_data);
> +	/* skip if we're called from netdev_trig_activate() and hw_control is true */

Nit: Sentences start with an uppercase char.

> +	if (!trigger_data->hw_control ||
> +	    led_get_trigger_data(trigger_data->led_cdev))

Nit: Place this all on a single line.

> +		set_baseline_state(trigger_data);
> +
>  	mutex_unlock(&trigger_data->lock);
>  	rtnl_unlock();
>  
> @@ -568,8 +572,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
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
> 
> 

-- 
Lee Jones [李琼斯]

