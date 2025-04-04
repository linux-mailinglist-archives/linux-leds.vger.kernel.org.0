Return-Path: <linux-leds+bounces-4404-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E6A7C0EB
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 17:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2EF11B60CD9
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 15:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604B2D517;
	Fri,  4 Apr 2025 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYiAKcrP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A9C54652
	for <linux-leds@vger.kernel.org>; Fri,  4 Apr 2025 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743781585; cv=none; b=bA+SwonHtA4qYwhfvLbYoRme3qcs+n9rPqV4biWQH5e3SwHR0RYf9V5btmz4OGTT5gX+dkyMz7rGYY5k3MOiMmK3zin4AIwM16UXInhbesV+IbgqoB5VgXUOqn3RpfM9zCSk5oTyTRwUF0J5gcLH779QVI0HBywgr6vTrpXhPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743781585; c=relaxed/simple;
	bh=0ywh0epZzO/pHnqaU4tKOh9YQHcf6ePZX4xYDx6fV2o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lp/y8FXoatxZtqTtgo7SG7/gOJsV8iwbmQNFVW6OQkvIY0wQfOZkM5bHl5W9Zlh5LO6DXfEo6uUhfXkOg4iM9gU50zfmrfSfp2yiQeZIfMv2fT/V3B+YfuDoiE7gHX2cB3qSrXNkF1WdA6spnBOda+7ixzTZ1E2KL/cZ5F1uarc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYiAKcrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B44C4CEDD;
	Fri,  4 Apr 2025 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743781584;
	bh=0ywh0epZzO/pHnqaU4tKOh9YQHcf6ePZX4xYDx6fV2o=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=qYiAKcrPtXeV83ZvQklyiixfWvr6Op1R8btK2zAFd6gYr8QdbvO6MkGPfvXRSGMgp
	 WaaWPm3Wse1LCRIfv5cO7HAQ8YBa/h7BYL/7OgcvymK6sB1PyPvyOUxMvxD3SGwuug
	 Li3Y1lLdkWEcvy4rsEo8N/LljP1bboJQOgb6OpCo5Ruj9fnnhnI1K9b0uNREhTtYtx
	 6Sw4DuNzBgwQr/gIpQb4c0BBsc0Q1O5095IwXibECAPMzZIg1UXNV0mt1eOLGvEyMR
	 PcRXCpHFEm+O+r1T4SCBeQp5grGpUt2BEhpwsgAHDiZn8ECbUgaLRey5SmOMdnFIob
	 wa1u4akZqhABg==
Date: Fri, 4 Apr 2025 16:46:21 +0100
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Subject: Re: [PATCH RESEND v2] led: multicolor: Fix intensity setting while
 SW blinking
Message-ID: <20250404154621.GI372032@google.com>
References: <20220627133110.271455-1-sven@svenschwermer.de>
 <20250402205340.qdp5dw3p2cxv2pvq@schlupp.tec.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402205340.qdp5dw3p2cxv2pvq@schlupp.tec.linutronix.de>

On Wed, 02 Apr 2025, Tobias Deiminger wrote:

> Hi Lee and Pavel,
> 
> this is still an issue. Sven's patch still applies and fixes the bug.
> Would you mind having another look?

I don't have Sven's patch in my inbox.  Please resubmit it.

> Minimal reproducer:
> 
>  echo timer > trigger
>  echo 255 > brightness
>  echo 255 255 255 > multi_intensity  # stops blinking with 50% probability
> 
> I encountered this independently and found the thread in hindsight. See review
> comments below.
> 
> Am Mo, 27. Jun 22 15:31 schrieb Sven Schwermer <sven@svenschwermer.de>:
> > From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> > 
> > When writing to the multi_intensity file, don't unconditionally call
> > led_set_brightness. By only doing this if blinking is inactive we
> > prevent blinking from stopping if the blinking is in its off phase while
> > the file is written.
> > 
> > Instead, if blinking is active, the changed intensity values are applied
> > upon the next blink. This is consistent with changing the brightness on
> > monochrome LEDs with active blinking.
> > 
> > Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> > ---
> > 
> > Notes:
> >     V1->V2: Change title, add tags
> > 
> >  drivers/leds/led-class-multicolor.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> > index e317408583df..5b1479b5d32c 100644
> > --- a/drivers/leds/led-class-multicolor.c
> > +++ b/drivers/leds/led-class-multicolor.c
> > @@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device *dev,
> >  	for (i = 0; i < mcled_cdev->num_colors; i++)
> >  		mcled_cdev->subled_info[i].intensity = intensity_value[i];
> >  
> > -	led_set_brightness(led_cdev, led_cdev->brightness);
> > +	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
> > +		led_set_brightness(led_cdev, led_cdev->brightness);
> 
> Had my own debugging session and ended up with the very same conclusion. Seems
> solid and consistent.
> 
> Reviewed-by: Tobias Deiminger <tobias.deiminger@linutronix.de>
> 
> Btw, my initial attempt to fix it was to have two led_get_brightness variants.
> The existing variant gets the timer-aware momentary brightness, and a new one
> would get the timer-agnostic on-value. The latter variant could then be used to
> call led_set_brightness without the risk of resetting blinking. Worked, but got
> overly complicated.
> 
> Best regards
> Tobias
> 
> >  	ret = size;
> >  err_out:
> >  	mutex_unlock(&led_cdev->led_access);
> > 
> > base-commit: 210e04ff768142b96452030c4c2627512b30ad95
> > -- 
> > 2.36.1
> > 

-- 
Lee Jones [李琼斯]

