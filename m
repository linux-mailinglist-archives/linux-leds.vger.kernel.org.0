Return-Path: <linux-leds+bounces-4420-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55614A7CDD7
	for <lists+linux-leds@lfdr.de>; Sun,  6 Apr 2025 14:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 701A97A4445
	for <lists+linux-leds@lfdr.de>; Sun,  6 Apr 2025 12:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B569321773D;
	Sun,  6 Apr 2025 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbnKyLyF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7B217666;
	Sun,  6 Apr 2025 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743942055; cv=none; b=WmXit8Z+mhhyDFUpi9YFlBdpbdEHb84vwZg8vi35WHLpTuv4BRa8X67tk4PgRyenbMWaqJcfm4su8awbX7ZrIe8gaEcRCWiSlixVKm6ypRrFjG7LB1sOOYpIuFDet7l5k73nzaBuOtoeL3sdQNCMuy4v/CyLmGvBSKjTrPpzW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743942055; c=relaxed/simple;
	bh=DnM46jWhUg1L8UXNlPgFVYi1A+ruLQXnjhaJY6gJyqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJztmL/UhxWp5EoWCTGo4xNLpcp6ceeIPaeB4OWpxjF8fAuHMu4yqw0/mDdj3H3sQOSZFF2YVIbhqkrz1QPpdtwDqpU5EV8PF+PFc/hxr9ipYex3j/qPtk5NykCLquRPdKWt0cldJW/LiGJ4/gMaAHEKLSGYGX0xtPC7O/jQZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbnKyLyF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6F3C4CEE3;
	Sun,  6 Apr 2025 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743942055;
	bh=DnM46jWhUg1L8UXNlPgFVYi1A+ruLQXnjhaJY6gJyqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WbnKyLyFLoAmN4sggRgJTWUVO2qcn9YN6acZiN/8MvUyGB7gSPq9jSm49hXidBS8X
	 HISg6PQfWw3VvxGL8nBPcuWdLcfM2V/BoKvlFeTOFJWa5++j2PFI8TP387I5BjgAlb
	 VmWwDDDR0Hi95Gi0A0aZ6OCo1UfEaCJTA95th25HgPwBYgeQP1Mdun54MHdc6jZPVo
	 67WBInJ79NC2Vutlc9gwDBU4eli6G04uIC3OmSTVZh6Xgm8NPX8OBAdkzYDGbHxbd0
	 9vlfdrSqAbHqAnRdkxFAfrtFRtPHXsVqbkhUagI2Nh905rk7itUvtKWDtbZLQEWjNI
	 yMuwIXSkI+txw==
Date: Sun, 6 Apr 2025 14:20:49 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>, lxu@maxlinear.com, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, 
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next,v2 2/2] net: phy: mxl-gpy: add LED dimming
 support
Message-ID: <ne2yghzgmsvmucepsvdfpcobumucoijtbgczdhb64kuvkbk7d3@3s5xew72bri4>
References: <20250405190954.703860-1-olek2@wp.pl>
 <20250405190954.703860-2-olek2@wp.pl>
 <36ab1cd6-65fa-4124-b9a0-f4082936e04f@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36ab1cd6-65fa-4124-b9a0-f4082936e04f@lunn.ch>

On Sat, Apr 05, 2025 at 09:52:43PM +0200, Andrew Lunn wrote:
> On Sat, Apr 05, 2025 at 09:09:54PM +0200, Aleksander Jan Bajkowski wrote:
> > Some PHYs support LED dimming. The use case is a router that dims LEDs
> > at night. In the GPY2xx series, the PWM control register is common to
> > all LEDs. To avoid confusing users, only the first LED used has
> > brightness control enabled.
> 
> I don't know the LED subsystem very well. But struct led_classdev has:
> 
>         /* Get LED brightness level */
>         enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
> 
> The fact this exists, suggests the LED brightness can change outside
> of the control of Linux. Maybe even your very use cases of one PWM for
> multiple LEDs? You might get a more consistent user experience if you
> allow the brightness bet set with all the LEDs, and implement this
> callback so the current brightness can be reported per LED?
> 
> Lets see what the LED subsystem people say?

Regardless of whether LED class device blinking is offloaded to HW or
not, it should behave the same way as it does when controlled by
software.

The sysfs brightness file controls the brightness of the LED.
When no trigger is enabled on the LED, this is very simple:
- setting brightness to 0 disables the LED
- setting brightness to the value max_brightness lights the LED
  to maximum possible brightness
- values between 0 and max_brightness can be also used, to light
  the LED in some in-between value

When a trigger is set, this can get a little bit more complicated,
but not for the netdev trigger. The netdev trigger only blinks
the LED, which means that it changes it between two states:
- disabled
- brightness that was set into sysfs brightness file

So if netdev is blinking with LED, you are supposed to be able to
change the ON state brightness by writing to the sysfs brightness
file.

If you enable the netdev trigger on a LED (echo netdev >trigger)
while current brightness is set to a non-zero value, then this
non-zero value should be used for the ON state when blinking.
If you enable it while current brightness is zero, then
max_brightness is used. This is done in the set_baseline_state()
function, the blinking brightness is stored into the
led_cdev->blink_brightness member.

And also, when writing new code, or refactoring old one, stop using
the LED_OFF, LED_ON and LED_HALF and LED_FULL constants.
They are deprecated.

We should get rid of the whole enum led_brightness and use an
unsigned int instead.

Marek

