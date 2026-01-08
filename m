Return-Path: <linux-leds+bounces-6584-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF63D03C91
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 16:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E31DC302A7FA
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1CB3E8333;
	Thu,  8 Jan 2026 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ1JeUjb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779703A6415;
	Thu,  8 Jan 2026 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874307; cv=none; b=OFSM+lHTlH8URxGiwvgXEE5gtTcJhdwGZwGZKIsKtCMp50me5NwggGblURk2GSl1Ah8B6ozBiFB/eRCxyI4qkTfSrGdATVeNj+LH24EPvA6M/9fX2tAux9Rt3pWeQWFXgKWUYZK3B0mE2/P85RNL4Kxv6in1WvbvMwvw1xZ+O6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874307; c=relaxed/simple;
	bh=oWil5V5JKtcGYYnILpc+uSBX2TY01VMvZkh3e956rro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phVKBWfIq61z10QekeKKpxSms0BphZYLbepKCnbBCZDV7o8RHl6Kr3SIy8148hd6IAi4HD9kaZAx7rvbgP6zWRT0fsIj1MSB5eaCiQpSIdMZx89e3kMgNN4iFOdi8eL1+Co9Yh/VGFj1gfafCkzoNnF8ZO+fJV9B/ln37Zav4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ1JeUjb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF038C116C6;
	Thu,  8 Jan 2026 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767874307;
	bh=oWil5V5JKtcGYYnILpc+uSBX2TY01VMvZkh3e956rro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJ1JeUjb6KGLz9Pq0Xgp8Uk06xQJae1zqfkFsjHU5KML23a/EtnpDgmTX+h4n8YfX
	 x/1LmTofCDp3JyOgTSiP6oLHur8hj3NxA6MfSdFu+F4Pq1YBPu+8ttDf8WesSq7Td6
	 PI692qUqkFSsTnZpvy/q1cGBPsWHShA9b97SyxbemauR0qnTqZiAQs3lGUfD2RroSy
	 q2TyEgvT5Uzyx8kN02/nTHq6zhX2cog+bLw5B6BuuhVdOmFolX7yodWpEwMErxi1qD
	 anVivMkD5wqf6WJsPwTq3ESHOnm6EUak35NfQzclplLGVCD67dwF44YBpEm1Bhh0r1
	 v6HtiyVBWi08w==
Date: Thu, 8 Jan 2026 12:11:42 +0000
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] leds: led-class: Only Add LED to leds_list when it is
 fully ready
Message-ID: <20260108121142.GI302752@google.com>
References: <20251211163727.366441-1-johannes.goede@oss.qualcomm.com>
 <2bbtf7out2t52pge4hezfc7dryu6te2qstfm5kzez7zrw3dvqq@wxvqnjbulxc4>
 <585dc6a5-64e3-4f54-8ff3-9b9f1fc3d54d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <585dc6a5-64e3-4f54-8ff3-9b9f1fc3d54d@oss.qualcomm.com>

On Fri, 12 Dec 2025, Hans de Goede wrote:

> Hi,
> 
> On 12-Dec-25 07:49, Sebastian Reichel wrote:
> > Hi,
> > 
> > On Thu, Dec 11, 2025 at 05:37:27PM +0100, Hans de Goede wrote:
> >> Before this change the LED was added to leds_list before led_init_core()
> >> gets called adding it the list before led_classdev.set_brightness_work gets
> >> initialized.
> >>
> >> This leaves a window where led_trigger_register() of a LED's default
> >> trigger will call led_trigger_set() which calls led_set_brightness()
> >> which in turn will end up queueing the *uninitialized*
> >> led_classdev.set_brightness_work.
> >>
> >> This race gets hit by the lenovo-thinkpad-t14s EC driver which registers
> >> 2 LEDs with a default trigger provided by snd_ctl_led.ko in quick
> >> succession. The first led_classdev_register() causes an async modprobe of
> >> snd_ctl_led to run and that async modprobe manages to exactly hit
> >> the window where the second LED is on the leds_list without led_init_core()
> >> being called for it, resulting in:
> >>
> >>  ------------[ cut here ]------------
> >>  WARNING: CPU: 11 PID: 5608 at kernel/workqueue.c:4234 __flush_work+0x344/0x390
> >>  Hardware name: LENOVO 21N2S01F0B/21N2S01F0B, BIOS N42ET93W (2.23 ) 09/01/2025
> >>  ...
> >>  Call trace:
> >>   __flush_work+0x344/0x390 (P)
> >>   flush_work+0x2c/0x50
> >>   led_trigger_set+0x1c8/0x340
> >>   led_trigger_register+0x17c/0x1c0
> >>   led_trigger_register_simple+0x84/0xe8
> >>   snd_ctl_led_init+0x40/0xf88 [snd_ctl_led]
> >>   do_one_initcall+0x5c/0x318
> >>   do_init_module+0x9c/0x2b8
> >>   load_module+0x7e0/0x998
> >>
> >> Close the race window by moving the adding of the LED to leds_list to
> >> after the led_init_core() call.
> >>
> >> Cc: Sebastian Reichel <sre@kernel.org>
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >> ---
> > 
> > heh, I've never hit this. But I guess that is not too surprising
> > considering it is a race condition. The change looks good to me:
> > 
> > Reviewed-by: Sebastian Reichel <sre@kernel.org>
> 
> Thx.
>  
> >> Note no Fixes tag as this problem has been around for a long long time,
> >> so I could not really find a good commit for the Fixes tag.
> > 
> > My suggestion would be:
> > 
> > Fixes: d23a22a74fde ("leds: delay led_set_brightness if stopping soft-blink")
> 
> Ack, that works for me.
> 
> Lee can you add this Fixes tag while merging ?
> 
> Also (in case it is not obvious) this is a bugfix so it would be
> nice if this could go in a fixes pull-request for 6.19.

Yes, I can add the Fixes: tag and no, I have no plans to send this for
-fixes.  As you rightly mentioned, this issue has been around for a long
time already.  I tend to only send -fixes pull-requests for things that
broke in -rc1 of the same release.

That said, however, if I end up sending one for something else, I will
try to remember to add this one to it as well.

-- 
Lee Jones [李琼斯]

