Return-Path: <linux-leds+bounces-1457-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE78A1722
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 16:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 730691C21FC4
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 14:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF9D14EC4F;
	Thu, 11 Apr 2024 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3MEbMSL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C777214F103
	for <linux-leds@vger.kernel.org>; Thu, 11 Apr 2024 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712845652; cv=none; b=gKAlNTo7eGvHfNstGuOJBg1Rr8Bzdj0tTIWTe6H2urUdL55CzGIgvFEMX6eQwfTacayFVSR12djfTCocksY8c2I5zOklcCfA4hmnNgZrIXGGo/PYOLKFY2cW7syWzNDrtIUtDYrIQJXCnLEXJbkO70XGbSIteiqMdg79MsFXmUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712845652; c=relaxed/simple;
	bh=exRRTpELMAURnLVpz23F2ZXMXXRsqNqb0Foej6zhNBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/p9+3/HILx5SZaVPcythF83cd1MX0yHLADaS/UFKEifbuOZPfGcA7bgrncPjeZxGv0nN5v6SVKiNTwH+OhA/K94mcOolWa+NepINO+4RjltZDz6+IqBqMN4l/oaWWP+84E8j9Ju037CC804M0rrj0XA0DakPCVsQxrDYNHsxgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3MEbMSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF8CC113CD;
	Thu, 11 Apr 2024 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712845652;
	bh=exRRTpELMAURnLVpz23F2ZXMXXRsqNqb0Foej6zhNBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3MEbMSLORUjJcm661K7zAW0RQIch3o+hLnXPv9N1sQvqpWsCLq8L1tSQdK6MldEH
	 eXK9LWyUqjphi2dM1dl/1dxliMgm1C40dsN0XC7aHGQufn4n46mQzxbbmEhSsEi4sy
	 qs8Ez1v8xZZHDYYcTY94gEWv9ILfRqlQa/g7FUz4ZDIWzPq78H2e/+2uOwENfatadr
	 /VAR0VUvM+qjR4wOZO+MrCBRARIVKiHxs+NC7B1IwvWddFMXHYAfjZgE0J/w3LnuhM
	 w5dCQCnoiqFNgvN6AmO7kRq/45lXUnFPbiCfs/VUbeG3dD8ChbooujViNkmIGa+goZ
	 usi1F3a65KCPw==
Date: Thu, 11 Apr 2024 15:27:28 +0100
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: core: Omit set_brightness error message for a LED
 supporting hw trigger only
Message-ID: <20240411142728.GC2399047@google.com>
References: <44177e37-9512-4044-8991-bb23b184bf37@gmail.com>
 <20240411142628.GB2399047@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240411142628.GB2399047@google.com>

On Thu, 11 Apr 2024, Lee Jones wrote:

> On Fri, 05 Apr 2024, Heiner Kallweit wrote:
> 
> > If both set_brightness functions return -ENOTSUPP, then the LED doesn't
> > support setting a fixed brightness value, and the error message isn't
> > helpful. This can be the case e.g. for LEDs supporting a specific hw
> > trigger only.
> > 
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >  drivers/leds/led-core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > index 89c9806cc..9485f799f 100644
> > --- a/drivers/leds/led-core.c
> > +++ b/drivers/leds/led-core.c
> > @@ -127,7 +127,8 @@ static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
> >  	ret = __led_set_brightness(led_cdev, value);
> >  	if (ret == -ENOTSUPP)
> >  		ret = __led_set_brightness_blocking(led_cdev, value);
> > -	if (ret < 0 &&
> > +	/* Don't emit error message if LED supports a hw trigger like netdev only */
> > +	if (ret < 0 && ret != -ENOTSUPP &&
> >  	    /* LED HW might have been unplugged, therefore don't warn */
> >  	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
> >  	    (led_cdev->flags & LED_HW_PLUGGABLE)))
> 
> This function is already pretty messy.
> 
> How about something like:
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
>         if (ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING))
>                 /* LED HW might have been unplugged, therefore don't warn */
>                 return;
> 
>         if (ret < 0 && led_cdev->flags & LED_HW_PLUGGABLE)
>                 dev_err(led_cdev->dev, "Setting an LED's brightness failed (%d)\n", ret);
>  }

If it looks reasonable to you, I'd e happy to submit it as a patch.

-- 
Lee Jones [李琼斯]

