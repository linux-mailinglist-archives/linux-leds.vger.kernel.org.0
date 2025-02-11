Return-Path: <linux-leds+bounces-3926-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA602A30D89
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 15:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105E4188921A
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 14:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9F324CECB;
	Tue, 11 Feb 2025 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRfwNCXv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E024CEC2;
	Tue, 11 Feb 2025 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282451; cv=none; b=fndLA2jWtLUHQz37swYe4aNUSqxOKVpJTMBReQHp4f3/fQmHQ21AEPAwExC7CB23/gcQvUgLCIR+0IHLyTrvNEu5IxinLph4xLaAL5VLtxv46mdeKfmhH9Q3ddVtCLOSDqM4TZBlmsxnHMYtgTCeY4Ax5RT5arZMk/Br6qGR4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282451; c=relaxed/simple;
	bh=YiB9whoNKM1H3gMhzkN3emRsT4XFNu21k9bVsUDkNgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDCue2gOq0M2HgqQ2ypBpog4ugXkuxEo5aL8o5PqqsRq3x87GknWlESPkeMhFl6pZOqmsdGBxXGC52YXyzzRb0en+n8w6Lip+D9N/t+gO6mWxggqoaa/jCRdLbc3DTynabAGNzbA9jfpTHqCzi2dnUteeotSBNcArasv4FvwryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRfwNCXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F95FC4CEE6;
	Tue, 11 Feb 2025 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739282450;
	bh=YiB9whoNKM1H3gMhzkN3emRsT4XFNu21k9bVsUDkNgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRfwNCXvCqJx0Y/pz/0juCzTceuOU1Bx4RA7QeDf0MXZjeEI5dTNvfKFIQtw5eel7
	 qtR+59sbmC+vqzLfIL2ekkpeIwl5wJeG28JqqPpQGtz1OusuSORS5DXrzvQF77q33W
	 LTOEgf4i40ExWQ82ywNPFE9nCmh+4vNUNI0v5OZJ9ZrZM64UucCBxcG6LcGEnmzixZ
	 3yrnUIJTte0/ep0uVoyphHKgbkBawANi1Qc6u1qJpJ7qkkh/cvF7hxSQYOHUjdekAq
	 +Ix8fYOku0wKIJPQZ402IONRfrDe5eHwFdRDrHeNpUqBiryiTloSklC/imKphLLTAR
	 Uj5OS/KV5Szeg==
Date: Tue, 11 Feb 2025 14:00:46 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 10/13] leds: backlight trigger: Maintain global list of
 led backlight triggers
Message-ID: <20250211140046.GU1868108@google.com>
References: <20250206154033.697495-1-tzimmermann@suse.de>
 <20250206154033.697495-11-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206154033.697495-11-tzimmermann@suse.de>

On Thu, 06 Feb 2025, Thomas Zimmermann wrote:

> Maintain a list of led backlight triggers. This will replace the
> fbdev notifiers that all backlight triggers currently subscribe to.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/leds/trigger/ledtrig-backlight.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
> index 487577d22cfc..c1c1aa60cf07 100644
> --- a/drivers/leds/trigger/ledtrig-backlight.c
> +++ b/drivers/leds/trigger/ledtrig-backlight.c
> @@ -23,8 +23,13 @@ struct bl_trig_notifier {
>  	int old_status;
>  	struct notifier_block notifier;
>  	unsigned invert;
> +
> +	struct list_head entry;

You don't appear to be doing anything with the list here.

It would be better if you introduced the list when it's first utilised.

>  };
>  
> +static struct list_head ledtrig_backlight_list;
> +static struct mutex ledtrig_backlight_list_mutex;
> +
>  static int fb_notifier_callback(struct notifier_block *p,
>  				unsigned long event, void *data)
>  {
> @@ -118,6 +123,10 @@ static int bl_trig_activate(struct led_classdev *led)
>  	if (ret)
>  		dev_err(led->dev, "unable to register backlight trigger\n");
>  
> +	mutex_lock(&ledtrig_backlight_list_mutex);
> +	list_add(&n->entry, &ledtrig_backlight_list);
> +	mutex_unlock(&ledtrig_backlight_list_mutex);
> +
>  	return 0;
>  }
>  
> @@ -125,6 +134,10 @@ static void bl_trig_deactivate(struct led_classdev *led)
>  {
>  	struct bl_trig_notifier *n = led_get_trigger_data(led);
>  
> +	mutex_lock(&ledtrig_backlight_list_mutex);
> +	list_del(&n->entry);
> +	mutex_unlock(&ledtrig_backlight_list_mutex);
> +
>  	fb_unregister_client(&n->notifier);
>  	kfree(n);
>  }
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

