Return-Path: <linux-leds+bounces-4304-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB707A66FA5
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 10:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B22A3BCE34
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 09:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45C7206F3E;
	Tue, 18 Mar 2025 09:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZeo/pra"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0C204F8A;
	Tue, 18 Mar 2025 09:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289825; cv=none; b=czm2vZ0NhulXkALStjDbISRAvV2VdCd0mHEZ6NLxSZBH9COR2TQOfZnj7lMZGWv8pFisLlxW6nzChuhlKQOOJjB3SCFAAte6j8BlqcCOvLJVJT4SuXups3B+ZW1fNm7yunvA/8ABGgtrkzGj+btbXpHERpnCJMV1uLltNaDId58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289825; c=relaxed/simple;
	bh=THt3n65begFC7mRXcpqMKfETD/zI0kv3aBId5rq7qak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tr9r15Bw26vaWXCXh1eqrIZ/OO56qGxO2xyGvm2xMEDz4w6QaI2BFEhz1x9aUqanyPZgW6WewHBWsFRmQpChIfOyI5/Geu5gcEup7pY1pvlAiDa+qtT5esbfJt60tHmG0gMXtubHjiDRFRW42FbKwPjZoQXVBWWLGVr6IAtjoAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZeo/pra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3004CC4CEDD;
	Tue, 18 Mar 2025 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742289825;
	bh=THt3n65begFC7mRXcpqMKfETD/zI0kv3aBId5rq7qak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZeo/prakOw98jlFIa2Pxf/0bOf1zrAYLKo1eg0mtl9XMHyiJ1Qc8TeY+xaFBSTX9
	 5jSqxto0NqweY9eyBIA1olF+mxoWRvUmfA2S/v7b3F8C/cwa05PoCYB67BLpZfca/5
	 cHvCDsnWQsJ47QV0H4f8JjZTa7pF3z0dGdrnhaaq2bYJtkquTJKR+S/UEkWhgEbVc2
	 PmiSufz54Kk4n1ystYPs41iVWD1xlWLuBZ5TmGIQgCJByrsdxPhb1+uwRO+fZrww/5
	 jZB1579CEQ4SQaMR0QrCTZaQox4fUM7+RMq+mLyZuNUADxOhDrnFC9oASucyN1xWrR
	 6WHGy9x7+QYdw==
Date: Tue, 18 Mar 2025 09:23:40 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <Z9k7nAXNGDaQMnMO@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-7-tzimmermann@suse.de>

On Thu, Mar 06, 2025 at 03:05:48PM +0100, Thomas Zimmermann wrote:
> Remove support for fb events from backlight subsystem. Provide the
> helper backlight_notify_blank_all() instead. Also export the existing
> helper backlight_notify_blank() to update a single backlight device.
>
> In fbdev, call either helper to inform the backlight subsystem of
> changes to a display's blank state. If the framebuffer device has a
> specific backlight, only update this one; otherwise update all.
>
> v3:
> - declare empty fb_bl_notify_blank() as static inline (kernel test robot)

Looks like there are still configs where we get build failure.


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Other than the build issues, generally this looks great. Just a couple
of small issues below.


> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 1c43f579396f..9dc93c5e480b 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -78,11 +77,8 @@ static const char *const backlight_scale_types[] = {
>  	[BACKLIGHT_SCALE_NON_LINEAR]	= "non-linear",
>  };
>
> -#if defined(CONFIG_FB_CORE) || (defined(CONFIG_FB_CORE_MODULE) && \
> -				defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
> -static void backlight_notify_blank(struct backlight_device *bd,
> -				   struct device *display_dev,
> -				   bool fb_on, bool prev_fb_on)
> +void backlight_notify_blank(struct backlight_device *bd, struct device *display_dev,
> +			    bool fb_on, bool prev_fb_on)
>  {
>  	guard(mutex)(&bd->ops_lock);
>
> @@ -103,68 +99,18 @@ static void backlight_notify_blank(struct backlight_device *bd,
>  		}
>  	}
>  }
> +EXPORT_SYMBOL(backlight_notify_blank);

Should this be EXPORT_SYMBOL_GPL()?


>
> -/*
> - * fb_notifier_callback
> - *
> - * This callback gets called when something important happens inside a
> - * framebuffer driver. The backlight core only cares about FB_BLANK_UNBLANK
> - * which is reported to the driver using backlight_update_status()
> - * as a state change.
> - *
> - * There may be several fbdev's connected to the backlight device,
> - * in which case they are kept track of. A state change is only reported
> - * if there is a change in backlight for the specified fbdev.
> - */
> -static int fb_notifier_callback(struct notifier_block *self,
> -				unsigned long event, void *data)
> +void backlight_notify_blank_all(struct device *display_dev, bool fb_on, bool prev_fb_on)
>  {
>  	struct backlight_device *bd;
> -	struct fb_event *evdata = data;
> -	struct fb_info *info = evdata->info;
> -	const int *fb_blank = evdata->data;
> -	struct backlight_device *fb_bd = fb_bl_device(info);
> -	bool fb_on, prev_fb_on;
> -
> -	/* If we aren't interested in this event, skip it immediately ... */
> -	if (event != FB_EVENT_BLANK)
> -		return 0;
> -
> -	bd = container_of(self, struct backlight_device, fb_notif);
> -
> -	if (fb_bd && fb_bd != bd)
> -		return 0;
> -
> -	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
> -	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
> -
> -	backlight_notify_blank(bd, info->device, fb_on, prev_fb_on);
> -
> -	return 0;
> -}
> -
> -static int backlight_register_fb(struct backlight_device *bd)
> -{
> -	memset(&bd->fb_notif, 0, sizeof(bd->fb_notif));
> -	bd->fb_notif.notifier_call = fb_notifier_callback;
>
> -	return fb_register_client(&bd->fb_notif);
> -}
> +	guard(mutex)(&backlight_dev_list_mutex);
>
> -static void backlight_unregister_fb(struct backlight_device *bd)
> -{
> -	fb_unregister_client(&bd->fb_notif);
> -}
> -#else
> -static inline int backlight_register_fb(struct backlight_device *bd)
> -{
> -	return 0;
> +	list_for_each_entry(bd, &backlight_dev_list, entry)
> +		backlight_notify_blank(bd, display_dev, fb_on, prev_fb_on);
>  }
> -
> -static inline void backlight_unregister_fb(struct backlight_device *bd)
> -{
> -}
> -#endif /* CONFIG_FB_CORE */
> +EXPORT_SYMBOL(backlight_notify_blank_all);

Same here.


Daniel.

