Return-Path: <linux-leds+bounces-1545-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB88F8B9E43
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2024 18:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189AF1C21A6D
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2024 16:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D0415B56C;
	Thu,  2 May 2024 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXqiJTxg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B8E15359A
	for <linux-leds@vger.kernel.org>; Thu,  2 May 2024 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714666294; cv=none; b=aZIBqL+mH8YSgAATI+p3QFEMttBRfOT3xWhwmyVustJ56WsbAbKMrcT3nY/MiAXqVKA0CppmSZrfaJGus/xdexBe3TTcJK0qQD/Sh10poP/Kk4LhzJHigB927ZBJwO0558Q0vke8pYLRLyTFcYyEEb+vdpuRFCvmvxdJ4fMHHow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714666294; c=relaxed/simple;
	bh=pQLR8kQbzAZXj84IKYtgclR0kMmXd9zJdZ3YG3nIo5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gr3IQQufdadBViWpshOnKVfmbhkO8dkL0FzQGjpAqlZxnYURPuCbk24nZAvXP1UQMmvrKRi6d8ZwZTFiybc1h8lISDGWjJmxQK+XgpKgCh0Crw3tI2cWCozfSBPR5OETO1pqOlJB8sZSvT9MyobqV8qRd87EWxiiBExYn3CAT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXqiJTxg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C827AC113CC;
	Thu,  2 May 2024 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714666294;
	bh=pQLR8kQbzAZXj84IKYtgclR0kMmXd9zJdZ3YG3nIo5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXqiJTxgw7DrIkr+gShktpT0F35zeg0CaSPdUV9tBMk81LmDkYFgQKBBJ6PEWN+Fi
	 qiXN/gmqtvQI/zanW7OoeudbbgHh5Q1O8D8sMxHfsdzDP7/1FaJTazueST2/EbcfLa
	 vLMm4yci7ezih1BK8qX2WWAxS4g+ctx4enDTQg0ttelFV+QMBPEsV+QVcg9ZTFDA10
	 WXTCGiLB9GL8XVuB/uW8l9mTDK+Xmvs8n714oxISW6+014MpCx1LGUFbZ6K0ajqcL4
	 /Pnpz3X+bT6IF5euQ9n9r/GRwKMoSnhRGcsUlMcEr3kv8EQEDGS4wFhgh1jKkXfRo4
	 9eXeGc/VccF8A==
Date: Thu, 2 May 2024 17:11:30 +0100
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: core: Omit set_brightness error message for a LED
 supporting hw trigger only
Message-ID: <20240502161130.GW5338@google.com>
References: <44177e37-9512-4044-8991-bb23b184bf37@gmail.com>
 <20240411142628.GB2399047@google.com>
 <1b425a70-48e2-4733-8e05-225695109ceb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b425a70-48e2-4733-8e05-225695109ceb@gmail.com>

On Thu, 11 Apr 2024, Heiner Kallweit wrote:

> On 11.04.2024 16:26, Lee Jones wrote:
> > On Fri, 05 Apr 2024, Heiner Kallweit wrote:
> > 
> >> If both set_brightness functions return -ENOTSUPP, then the LED doesn't
> >> support setting a fixed brightness value, and the error message isn't
> >> helpful. This can be the case e.g. for LEDs supporting a specific hw
> >> trigger only.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  drivers/leds/led-core.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> >> index 89c9806cc..9485f799f 100644
> >> --- a/drivers/leds/led-core.c
> >> +++ b/drivers/leds/led-core.c
> >> @@ -127,7 +127,8 @@ static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
> >>  	ret = __led_set_brightness(led_cdev, value);
> >>  	if (ret == -ENOTSUPP)
> >>  		ret = __led_set_brightness_blocking(led_cdev, value);
> >> -	if (ret < 0 &&
> >> +	/* Don't emit error message if LED supports a hw trigger like netdev only */
> >> +	if (ret < 0 && ret != -ENOTSUPP &&
> >>  	    /* LED HW might have been unplugged, therefore don't warn */
> >>  	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
> >>  	    (led_cdev->flags & LED_HW_PLUGGABLE)))
> > 
> > This function is already pretty messy.
> > 
> > How about something like:
> > 
> > static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
> >                                                   unsigned int value)
> > {
> >         int ret;
> > 
> >         ret = __led_set_brightness(led_cdev, value);
> >         if (ret == -ENOTSUPP) {
> >                 ret = __led_set_brightness_blocking(led_cdev, value);
> >                 if (ret == -ENOTSUPP)
> >                         /* No back-end support to set a fixed brightness value */
> >                         return;
> >         }
> > 
> >         if (ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING))
> >                 /* LED HW might have been unplugged, therefore don't warn */
> >                 return;
> > 
> >         if (ret < 0 && led_cdev->flags & LED_HW_PLUGGABLE)
> >                 dev_err(led_cdev->dev, "Setting an LED's brightness failed (%d)\n", ret);
> >  }
> > 
> I think this would be a functional change. If:
> ret = -ENODEV
> led_cdev->flags & LED_UNREGISTERING is true
> led_cdev->flags & LED_HW_PLUGGABLE is false
> 
> Current code would warn, proposed new code not.
> 
> But I like the idea. Proposal:
> 
> static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
>                                                   unsigned int value)
> {
>         int ret;
> 
>         ret = __led_set_brightness(led_cdev, value);
>         if (ret == -ENOTSUPP) {
>                 ret = __led_set_brightness_blocking(led_cdev, value);
>                 if (ret == -ENOTSUPP)
>                         /* No back-end support to set a fixed brightness value */
>                         return;
>         }
> 
>         /* LED HW might have been unplugged, therefore don't warn */
>         if (ret == -ENODEV && led_cdev->flags & LED_UNREGISTERING &&
>             led_cdev->flags & LED_HW_PLUGGABLE)
>                 return;
> 
>         if (ret < 0)
>                 dev_err(led_cdev->dev,
>                         "Setting an LED's brightness failed (%d)\n", ret);
> }
> 
> Fine with me if you submit the patch.

Sorry, it's been a busy few weeks.

Just so you know, this is still on my radar.

I plan on submitting this for the next cycle.

-- 
Lee Jones [李琼斯]

