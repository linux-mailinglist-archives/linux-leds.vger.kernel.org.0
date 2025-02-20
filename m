Return-Path: <linux-leds+bounces-4026-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C77B7A3DD8D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 16:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0846189762F
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635BE1F9F75;
	Thu, 20 Feb 2025 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jhwuq73G"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369051F584F;
	Thu, 20 Feb 2025 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063621; cv=none; b=qcQlwdj2W3d7x3BMikJ29ns+Lt4fRHmkCe6HnvboL4scwyNM3FikInY+6xD/uTBYbG+fO9A6qvipxdHTnc7BSIWbzWDeuPV1gJtEkeED5lTHygXiAaIS/T9jQsWl/7JMIyyqaYPt8nlUUY78K55cKaiytbQ1/dUabZdksR2+A8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063621; c=relaxed/simple;
	bh=4bckTq02vaYkp80bkNFN6Mdl+bCKGs+xiMduy7+da4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUKdxmMg9GDKgFMkMcYHHI6mF9VJOWu62XCPu3jGOkI9cUyav8r2z0sVbWxKKliDTfQfYz14reBc0NtqluFc1PfiuFprV91q/tO6lGXFQ99JrUTg93yCCtp567XRbrsI0it4e/uMWHX0+edePsBhg2tByNXOlrXZZpWSUcYB1FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jhwuq73G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE99CC4CEDD;
	Thu, 20 Feb 2025 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740063620;
	bh=4bckTq02vaYkp80bkNFN6Mdl+bCKGs+xiMduy7+da4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jhwuq73GiLIkP8rLFDZ5sCdKaip/pnIr9jbsMzBNwAs+ue9U8dPoCj2Q5KHnqqEA+
	 BNrRsPfS5NuNTMIuhQ82f9lgYHb1B/fJ2HCE99s5nkqFkHch3VnlINwJGlusQ4W93O
	 sKLKUUB1XZzYTpD7tf5CQUK8Q1+JPlQNhinQFi1sF8trYC/7QkO8gaW4sVsANDz/KX
	 rQYFuw55EW9GIZxmjxzvdBh8VYX5DtfoLQ+8BaWgO5uKFKF/9aK1fitTO0Uh5t2IJd
	 qIUE5J87X/5KIXUUzE4/KzugfK8YRYmvzZYEbsJBR+E6ozfJJQ5luh9gDAdRLFgGlG
	 yQ0ZkagfPiy7w==
Date: Thu, 20 Feb 2025 15:00:16 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 12/13] leds: backlight trigger: Replace fb events with a
 dedicated function call
Message-ID: <20250220150016.GC778229@google.com>
References: <20250206154033.697495-1-tzimmermann@suse.de>
 <20250206154033.697495-13-tzimmermann@suse.de>
 <20250211135752.GT1868108@google.com>
 <f4652dbd-7544-4a6d-98d0-f4b64d60a435@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4652dbd-7544-4a6d-98d0-f4b64d60a435@suse.de>

On Thu, 13 Feb 2025, Thomas Zimmermann wrote:

> Hi
> 
> Am 11.02.25 um 14:57 schrieb Lee Jones:
> > On Thu, 06 Feb 2025, Thomas Zimmermann wrote:
> > 
> > > Remove support for fb events from the led backlight trigger. Provide the
> > > helper ledtrig_backlight_blank() instead. Call it from fbdev to inform
> > > the trigger of changes to a display's blank state.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/leds/trigger/ledtrig-backlight.c | 31 +++++-------------------
> > >   drivers/video/fbdev/core/fbmem.c         | 21 +++++++++-------
> > >   include/linux/leds.h                     |  6 +++++
> > >   3 files changed, 24 insertions(+), 34 deletions(-)
> > > 
> > > diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
> > > index f9317f93483b..e3ae4adc29e3 100644
> > > --- a/drivers/leds/trigger/ledtrig-backlight.c
> > > +++ b/drivers/leds/trigger/ledtrig-backlight.c
> > > @@ -10,7 +10,6 @@
> > >   #include <linux/kernel.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/init.h>
> > > -#include <linux/fb.h>
> > >   #include <linux/leds.h>
> > >   #include "../leds.h"
> > > @@ -21,7 +20,6 @@ struct bl_trig_notifier {
> > >   	struct led_classdev *led;
> > >   	int brightness;
> > >   	int old_status;
> > > -	struct notifier_block notifier;
> > >   	unsigned invert;
> > >   	struct list_head entry;
> > > @@ -30,7 +28,7 @@ struct bl_trig_notifier {
> > >   static struct list_head ledtrig_backlight_list;
> > >   static struct mutex ledtrig_backlight_list_mutex;
> > > -static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
> > > +static void __ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
> > I'm confused.  Didn't you just introduce this?
> 
> It's being renamed here; probably something to avoid.
> 
> 
> > 
> > >   {
> > >   	struct led_classdev *led = n->led;
> > >   	int new_status = !on ? BLANK : UNBLANK;
> > > @@ -48,23 +46,14 @@ static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
> > >   	n->old_status = new_status;
> > >   }
> > > -static int fb_notifier_callback(struct notifier_block *p,
> > > -				unsigned long event, void *data)
> > > +void ledtrig_backlight_blank(bool on)
> > >   {
> > > -	struct bl_trig_notifier *n = container_of(p,
> > > -					struct bl_trig_notifier, notifier);
> > > -	struct fb_event *fb_event = data;
> > > -	int *blank;
> > > -
> > > -	/* If we aren't interested in this event, skip it immediately ... */
> > > -	if (event != FB_EVENT_BLANK)
> > > -		return 0;
> > > -
> > > -	blank = fb_event->data;
> > > +	struct bl_trig_notifier *n;
> > > -	ledtrig_backlight_blank(n, !blank[0]);
> > > +	guard(mutex)(&ledtrig_backlight_list_mutex);
> > > -	return 0;
> > > +	list_for_each_entry(n, &ledtrig_backlight_list, entry)
> > > +		__ledtrig_backlight_blank(n, on);
> > >   }
> > >   static ssize_t bl_trig_invert_show(struct device *dev,
> > > @@ -110,8 +99,6 @@ ATTRIBUTE_GROUPS(bl_trig);
> > >   static int bl_trig_activate(struct led_classdev *led)
> > >   {
> > > -	int ret;
> > > -
> > >   	struct bl_trig_notifier *n;
> > >   	n = kzalloc(sizeof(struct bl_trig_notifier), GFP_KERNEL);
> > > @@ -122,11 +109,6 @@ static int bl_trig_activate(struct led_classdev *led)
> > >   	n->led = led;
> > >   	n->brightness = led->brightness;
> > >   	n->old_status = UNBLANK;
> > > -	n->notifier.notifier_call = fb_notifier_callback;
> > > -
> > > -	ret = fb_register_client(&n->notifier);
> > > -	if (ret)
> > > -		dev_err(led->dev, "unable to register backlight trigger\n");
> > >   	mutex_lock(&ledtrig_backlight_list_mutex);
> > >   	list_add(&n->entry, &ledtrig_backlight_list);
> > > @@ -143,7 +125,6 @@ static void bl_trig_deactivate(struct led_classdev *led)
> > >   	list_del(&n->entry);
> > >   	mutex_unlock(&ledtrig_backlight_list_mutex);
> > > -	fb_unregister_client(&n->notifier);
> > >   	kfree(n);
> > >   }
> > > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > > index fb7ca143a996..92c3fe2a7aff 100644
> > > --- a/drivers/video/fbdev/core/fbmem.c
> > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > @@ -16,6 +16,7 @@
> > >   #include <linux/fb.h>
> > >   #include <linux/fbcon.h>
> > >   #include <linux/lcd.h>
> > > +#include <linux/leds.h>
> > >   #include <video/nomodeset.h>
> > > @@ -373,11 +374,19 @@ static void fb_lcd_notify_blank(struct fb_info *info)
> > >   #endif
> > >   }
> > > +static void fb_ledtrig_backlight_notify_blank(struct fb_info *info)
> > > +{
> > > +#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_BACKLIGHT)
> > #iferry is generally discouraged in C files.
> > 
> > Does is_defined() work for you?
> 
> I don't think so. This ifdef covers the case that fbdev is built in, but led
> is a module (i.e., fbdev=y && led=m).
> 
> > /
> > > +	if (info->blank == FB_BLANK_UNBLANK)
> > > +		ledtrig_backlight_blank(true);
> > If !CONFIG_LEDS_TRIGGER_BACKLIGHT(), then ledtrig_backlight_blank() is a
> > noop anyway, right?  So why encompass it in the #if at all?
> 
> Because of (fbdev=y && led=m) again. ledtrig_backlight_blank() would be
> defined then, but not linkable from fbdev. Preferably, I'd rather leave out
> the ifdef in the led header file.

#ifdefs are not generally welcome in C-files.  Please rework it.

-- 
Lee Jones [李琼斯]

