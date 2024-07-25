Return-Path: <linux-leds+bounces-2316-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A873193BFE0
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 12:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDEB71C20FF0
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 10:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A929197A76;
	Thu, 25 Jul 2024 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arI4HdkV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2C41741F0
	for <linux-leds@vger.kernel.org>; Thu, 25 Jul 2024 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721903186; cv=none; b=I+TjPNB1EXaL2EQ/WZ4rcJbF/mQs+0KKjV/6J0GMTJ93/gBbfqR6hozIs+lpAHia1zC2EXgdX9aloWQZBLk5adq12Tf0wJjf/Fc3yePNVvWK6HnzWe1m3i+DRy4107juJwOtEdetggsX5sXVjIvpzRq3W5hWLyPjantBJVXfubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721903186; c=relaxed/simple;
	bh=rwZX2uJ+7oSPrsbqN1JU+OOZNqjwoDW2H4Yxojyk++8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kf2Sb+KrrdacCR7Suh/4PPZJtkuVEYWLM05bW6ooP9zNv1S4+WNskEMcJ3p3Qay0WRUvntX4y/bYpt6Vj5Yp1EIYey9P366Gm/uCYyUkzNCXGIcQpW7BF7K3rVbXkbhFmpp53dF2ILIADr49R/ewBI8PtOrDr4Get7NkWwq80Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arI4HdkV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D867C116B1;
	Thu, 25 Jul 2024 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721903186;
	bh=rwZX2uJ+7oSPrsbqN1JU+OOZNqjwoDW2H4Yxojyk++8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arI4HdkVxYIML/ejslRSdYT400YB6unZg+eON71qyzqTL6mDhdHOZnoipRU1pdVnc
	 YNSVZk7tWCcNxwQ3u5ofrlnd3Je1SO5VZcTsBDhxqpbibh2RvcxEMZ1Q+06n/ALrJ8
	 Tn6U0gRG48cA+GtnDteKOFjuwZ+dZn8MgxBoZ4VtH4CjsIzdyEqSFu6DdXOw8OrpC2
	 KSClWijNFIpfRSlSFske33O4oAwTOUFJNg8eJ16qqZBev7GCIYEPFnMI1qUdpc8SJR
	 33iljy5xFy7ArR8rmxL/XkukBCnEwUj3ugEa/t093ImilJGsfU9pVnFcci5VQs8+xe
	 wZgxC87uK+Dlg==
Date: Thu, 25 Jul 2024 11:26:23 +0100
From: Lee Jones <lee@kernel.org>
To: Guilherme =?iso-8859-1?Q?Gi=E1como_Sim=F5es?= <trintaeoitogc@gmail.com>
Cc: linux-leds@vger.kernel.org
Subject: Re: [RESEND LEDs] leds: remove led_brightness
Message-ID: <20240725102623.GF501857@google.com>
References: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>

On Sun, 21 Jul 2024, Guilherme Giácomo Simões wrote:

> Hi community, I hope this email finds you well
> I maked a change in kernel linux, for fulfill a TODO in
> drivers/leds/TODO that say:
> >* On/off LEDs should have max_brightness of 1
> >* Get rid of enum led_brightness
> >
> >It is really an integer, as maximum is configurable. Get rid of it, or
> >make it into typedef or something.
> 
> Then I removed the led_brightness. And in the files that enum
> led_brightness was used i replace to "int" ... And in the file
> "include/linux/leds.h" I created constants like:
> +#define LED_OFF  0
> +#define LED_ON   1
> +#define LED_HALF 127
> +#define LED_FULL 255
> 
> because in some files when has a compare like "brightness == LED_OFF"
> it will work yet.
> 
> The includes/linux/leds.h diff:
> -/* This is obsolete/useless. We now support variable maximum brightness. */
> -enum led_brightness {
> -       LED_OFF         = 0,
> -       LED_ON          = 1,
> -       LED_HALF        = 127,
> -       LED_FULL        = 255,
> -};

I'm not aware of the history of this, however I'm even less sure how
converting these from an enum to #defines makes this any better.

> +// default values for leds brightness
> +#define LED_OFF  0
> +#define LED_ON   1
> +#define LED_HALF 127
> +#define LED_FULL 255
> 
>  enum led_default_state {
>         LEDS_DEFSTATE_OFF       = 0,
> @@ -127,15 +125,15 @@ struct led_classdev {
>          * that can sleep while setting brightness.
>          */
>         void            (*brightness_set)(struct led_classdev *led_cdev,
> -                                         enum led_brightness brightness);
> +                                         int brightness);
>         /*
>          * Set LED brightness level immediately - it can block the caller for
>          * the time required for accessing a LED device register.
>          */
>         int (*brightness_set_blocking)(struct led_classdev *led_cdev,
> -                                      enum led_brightness brightness);
> +                                      int brightness);
>         /* Get LED brightness level */
> -       enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
> +       int (*brightness_get)(struct led_classdev *led_cdev);
> 
>         /*
>          * Activate hardware accelerated blink, delays are in milliseconds
> @@ -486,7 +484,7 @@ int devm_led_trigger_register(struct device *dev,
>  void led_trigger_register_simple(const char *name,
>                                 struct led_trigger **trigger);
>  void led_trigger_unregister_simple(struct led_trigger *trigger);
> -void led_trigger_event(struct led_trigger *trigger,  enum
> led_brightness event);
> +void led_trigger_event(struct led_trigger *trigger,  int event);
>  void led_trigger_blink(struct led_trigger *trigger, unsigned long delay_on,
>                        unsigned long delay_off);
> 
> 
> 
> How the kernel has a lot of files that use this led_brightness, the
> change is very very big.
> I have some questions:
> 
> Does my change make sense?
> 
> How can I split the change into several patches for sending to
> different email lists and still have the split change make sense in
> the email lists I'm going to send it to? can I reference the commit in
> which I delete the enum?
> 

-- 
Lee Jones [李琼斯]

