Return-Path: <linux-leds+bounces-4250-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E9AA60A73
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 08:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3BC53AF750
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 07:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF2F13C689;
	Fri, 14 Mar 2025 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/gBAzQV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375298632B
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938872; cv=none; b=pPg6f2ZHqfWaiIYYU85A5DnJRVZ9TY+khLBkoB47GuDQbVZIU2NuxE0uWayrgCPCvEQskPNdp9cIwfT2K7vcVh+RNxVbgEUiZso+3dTpTRG/mF9LFT04DUImF0dKRoR9tB3oU5ln/HUWgApk2+1qfUQYSm/FkbD0dJljEi+tOUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938872; c=relaxed/simple;
	bh=rPbd7xBn+2m54A7z8qESfG5E/D4AFKQfFejkCIIFGXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiJLtHo9jE7I6Higtm/OzGnZw788ZN8x8ej3VkHiyKrth9cUA8Bqv4swZ1E4QJXZWFmM3DbUE3wqj4YL68hNeDobpkHsWfK73dCBg9thM6UJpjNRxMaVhpXrRlFiFNym4o4pmugivA9TKkwcHX7QQ8sbSi93CaiZjySHO1Wb6KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/gBAzQV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D31C4CEE3;
	Fri, 14 Mar 2025 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741938870;
	bh=rPbd7xBn+2m54A7z8qESfG5E/D4AFKQfFejkCIIFGXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/gBAzQVXibRnoiakxfoQDAJVQb6mlfPuZ3/2vhWybDzdYKDRZFT6i5B+NTQp7wUh
	 o0oZd5aAAXN8RuGOdDmODq8LV9RlUuoSA5x0H1ScV2u59S9nJS5BUpfeY7FTgB4Pan
	 QBYVvDldjOF4+3+oyU/IZA2XTUvlI5DlQB0EfVPrYz17/AfelcG4/tPHHYzZ4CIjjj
	 RPsOLWhU5ozHsz6W8trT8EohY1Q2bD9MGSk5m7HA/xStGKV47Mm3UbH/YGZw3nQnje
	 Bm8wcBjG3Z7vDl0AC/oij7n4ry3B9epI9jtFRo1J59U03hasL3yaxcdOp1pIyeoxay
	 OOElatL/ftX4w==
Date: Fri, 14 Mar 2025 07:54:27 +0000
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com
Subject: Re: [PATCH v3] leds: led-triggers: Improvements for default trigger
Message-ID: <20250314075427.GG3645863@google.com>
References: <20250313235626.402788-1-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313235626.402788-1-craig@mcqueen.au>

On Fri, 14 Mar 2025, Craig McQueen wrote:

> Accept "default" written to sysfs trigger attr.
> If the text "default" is written to the LED's sysfs 'trigger' attr, then
> call led_trigger_set_default() to set the LED to its default trigger.
> 
> If the default trigger is set to "none", then led_trigger_set_default()
> will remove a trigger. This is in contrast to the default trigger being
> unset, in which case led_trigger_set_default() does nothing.

I can't take this without a SoB.

It would be nice to have Jacek's Reviewed-by at this point too.

> ---
>  Documentation/ABI/testing/sysfs-class-led |  6 ++++++
>  drivers/leds/led-triggers.c               | 13 +++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 2e24ac3bd7ef..0313b82644f2 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -72,6 +72,12 @@ Description:
>  		/sys/class/leds/<led> once a given trigger is selected. For
>  		their documentation see `sysfs-class-led-trigger-*`.
>  
> +		Writing "none" removes the trigger for this LED.
> +
> +		Writing "default" sets the trigger to the LED's default trigger
> +		(which would often be configured in the device tree for the
> +		hardware).
> +
>  What:		/sys/class/leds/<led>/inverted
>  Date:		January 2011
>  KernelVersion:	2.6.38
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index b2d40f87a5ff..3799dcc1cf07 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  		goto unlock;
>  	}
>  
> +	if (sysfs_streq(buf, "default")) {
> +		led_trigger_set_default(led_cdev);
> +		goto unlock;
> +	}
> +
>  	down_read(&triggers_list_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
>  		if (sysfs_streq(buf, trig->name) && trigger_relevant(led_cdev, trig)) {
> @@ -98,6 +103,9 @@ static int led_trigger_format(char *buf, size_t size,
>  	int len = led_trigger_snprintf(buf, size, "%s",
>  				       led_cdev->trigger ? "none" : "[none]");
>  
> +	if (led_cdev->default_trigger)
> +		len += led_trigger_snprintf(buf + len, size - len, " default");
> +
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
>  		bool hit;
>  
> @@ -281,6 +289,11 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>  	if (!led_cdev->default_trigger)
>  		return;
>  
> +	if (!strcmp(led_cdev->default_trigger, "none")) {
> +		led_trigger_remove(led_cdev);
> +		return;
> +	}
> +
>  	down_read(&triggers_list_lock);
>  	down_write(&led_cdev->trigger_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
> -- 
> 2.48.1
> 
> 

-- 
Lee Jones [李琼斯]

