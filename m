Return-Path: <linux-leds+bounces-4297-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A96C8A65A91
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 18:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB5C33A9C98
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 17:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9BC1A7AF7;
	Mon, 17 Mar 2025 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="d6pwUbth"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574C2046A2
	for <linux-leds@vger.kernel.org>; Mon, 17 Mar 2025 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231660; cv=none; b=OMTTgWPILay5q3t1pxu+rUk0W8noqqqH8zmbtzMsKrgsWzIvEf7ynYw/1pqSztMKGj/Is5pSa/ilPKXp/nQdujQ6KQ2cWbVBSYWRk9BFPo+F8pXyFP6Ds54dl/9vfKF7B6GxDEwsNGXr+vYWJ3H4n5VFGnv4TtKLfn/8/wpgD4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231660; c=relaxed/simple;
	bh=+jPeFoGNXioGjBUoxk5UC37tXUcl6Q+Xub93zb2WEnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwQv1PW+TbC7EOCpX19ryLqxGJCkcev3jCCU2tSyDWTImK2FAi0PqVci9Sq91Sc19wpWvRxeu5KTIB6BP08s5nJEzNXFnjxtktnmr6ZuOc4jwIE6cSujBMlIR8jvPN4WHxHzv+o3Xo8M+MdUHOFxRwasVMRMDWzPSfKoG/kCp24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=d6pwUbth; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so12181565e9.1
        for <linux-leds@vger.kernel.org>; Mon, 17 Mar 2025 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742231657; x=1742836457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gd/helYOE9uVmXuMlkncjSq63BGQQdsjbLjgrGPTsCU=;
        b=d6pwUbthtNFMt7WXWjtt89OHbij4hXtMwqqxWmIKUzd3LgCAG3//XUWafN2S3dOHi5
         N+iiWgjKNWN749kBqMY3lE8SEJ1VLkv1dR4s4ZwHPUob8+YS11O8bsVugew5w/WZk9Cv
         3W8RFuYw7Ra0J2r+oMApoIoNpJAJHE1JBpfqhhbU0ug4WejGaPM/6cGehGt5ooN0CoFa
         Bf7bRg5rHlRAPH2io70o9H4cpufmbUVsc0gc5wNC5377ghQ9ZstDFMo7xIChTqEn/Ng5
         0ML5keoFPSlah1VxIHM9R+bui7EbvvK0yXx4X6Pi+EzfHwOi9pf9HVYga3dDf7KADtTl
         NMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231657; x=1742836457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gd/helYOE9uVmXuMlkncjSq63BGQQdsjbLjgrGPTsCU=;
        b=UevBgInGmuDgZR/TwQFO5ZQeRxhOMPnfC2k1gs/RixbWt8bmqu2ga4OLiDOZ+OdLCe
         D83hNMkU3wBg3eZYkoHmyVE1D0VnGSSn/EF1U9QyNUjtnIk2QhCq7+mV++B7sw64pOLh
         BOEocCa7ZLT1xwHp9rvYxbET9pclDJRuIXAQ1hPyD3Iu90Xh5zGRA6O5G+P0DMhVOppC
         qk4fP4VIEa12vO/fMN1TMydARZthtkTpJwFN3T9BY34IYtceqcGfznhB0ZYbK0zhAUW/
         bLN98P22PmkHoTwmIp0I91d8T/LKLkL+zqu3gvoKxLWOjG74wbTC/QSNYQJOeEPVJi6Y
         Vf1w==
X-Forwarded-Encrypted: i=1; AJvYcCXQfGS+NjWRqF3shAC7mEiFP9vOXgRz6OUVXtYT1F97ktdyTamzfNGTtV5GlOgwuR0QktQmR3UPool3@vger.kernel.org
X-Gm-Message-State: AOJu0YzY3FKBvbJBKxAtg+IFKraYRk/XXzyd7dMiLklBzIeskEoE06QJ
	vRwR3oU0lAiZLb2L8okch0HZ2j4z4xiOsTR3RAZ5W/syOlaYjbuALraROsZQ7vc=
X-Gm-Gg: ASbGncvhrAHW64CvMqn8v5iZQ0/oYcwgr9cycpWtUrSWrakNQ5r03pQBRjBzPZw0ezY
	hVZK5j0mtAwCM7CWLHq2jRQHzwzKkuwEI0zMWVYf26hFaI3Kc40oPRsJvOuvGoVcpdMYgVAaEbE
	nLAWYn+GJ8z2gF9tjpRwsSMnsI5W5gT/ZH1q0KYyK0vkrXXFOAjzQkeL4188WgGWV8p9EH4hRdl
	Ryg0tQmzr0dS9C/nG0JrvjWwjvZcPeJRdvzHZt+cS+YPAKW31zETw2JnW0LPwBB/u4zh4Nt5glY
	CxnZxOKYWDT50oMWcKBZmf/AH0X4WYQTqXZVaoZuOeUwxsyocOsfBJxPtIOesWkkVnyuIe/GeTy
	Uhu2vLATFcWsRr85SfEHyW3tOkR4=
X-Google-Smtp-Source: AGHT+IEvhbfXifzPVNQRpvuqSbPm83CJxXhCqmpCNZkF+yY+5ZvGojK1oVkGDDRJOqUBKsdKLDhpeQ==
X-Received: by 2002:a05:6000:2a8:b0:391:10c5:d1c6 with SMTP id ffacd0b85a97d-3996b43e7ffmr584748f8f.2.1742231656991;
        Mon, 17 Mar 2025 10:14:16 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffc49adsm110267575e9.24.2025.03.17.10.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:14:16 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:14:14 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lee Jones <lee@kernel.org>, pavel@ucw.cz, danielt@kernel.org,
	jingoohan1@gmail.com, deller@gmx.de, simona@ffwll.ch,
	linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 00/11] backlight, lcd, led: Remove fbdev dependencies
Message-ID: <Z9hYZnbxvJSi29d1@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250313165151.GE3645863@google.com>
 <f3c245a4-d932-417e-a0e8-f0453c9bc2ef@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3c245a4-d932-417e-a0e8-f0453c9bc2ef@suse.de>

On Mon, Mar 17, 2025 at 09:42:11AM +0100, Thomas Zimmermann wrote:
> Hi
>
> Am 13.03.25 um 17:51 schrieb Lee Jones:
> > On Thu, 06 Mar 2025, Thomas Zimmermann wrote:
> >
> > > This series removes the remaining dependencies on fbdev from the
> > > backlight, lcd and led subsystems. Each depends on fbdev events to
> > > track display state. Make fbdev inform each subsystem via a dedicated
> > > interface instead.
> > >
> > > Patches 1 to 3 make fbdev track blank state for each display, so that
> > > backlight code doesn't have to.
> > >
> > > Patches 4 to 6 remove fbdev event handling from backlight code. Patches
> > > 7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
> > > do the same for led's backlight trigger.
> > >
> > > The final patch removes the event constants from fbdev.
> > >
> > > With the series applied, the three subsystems do no longer depend on
> > > fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
> > > number of events. That mechanism has been deprecated for some time and
> > > converted call to dedicated functions instead.
> > >
> > > Testing is very welcome, as I don't have the hardware to test this
> > > series.
> > >
> > > v3:
> > > - export several symbols
> > > - static-inline declare empty placeholders
> > > v2:
> > > - avoid IS_REACHABLE() in source file (Lee)
> > > - simplify several interfaces and helpers
> > > - use lock guards
> > > - initialize global lists and mutices
> > >
> > > Thomas Zimmermann (11):
> > >    fbdev: Rework fb_blank()
> > >    fbdev: Track display blanking state
> > >    fbdev: Send old blank state in FB_EVENT_BLANK
> > >    backlight: Implement fbdev tracking with blank state from event
> > >    backlight: Move blank-state handling into helper
> > >    backlight: Replace fb events with a dedicated function call
> > >    backlight: lcd: Move event handling into helpers
> > >    backlight: lcd: Replace fb events with a dedicated function call
> > >    leds: backlight trigger: Move blank-state handling into helper
> > >    leds: backlight trigger: Replace fb events with a dedicated function
> > >      call
> > >    fbdev: Remove constants of unused events
> > >
> > >   drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
> > >   drivers/video/backlight/backlight.c      |  93 +++++--------------
> > >   drivers/video/backlight/lcd.c            | 108 +++++++++--------------
> > >   drivers/video/fbdev/core/fb_backlight.c  |  12 +++
> > >   drivers/video/fbdev/core/fb_info.c       |   1 +
> > >   drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
> > >   drivers/video/fbdev/core/fbsysfs.c       |   8 +-
> > >   include/linux/backlight.h                |  22 ++---
> > >   include/linux/fb.h                       |  12 +--
> > >   include/linux/lcd.h                      |  21 ++++-
> > >   include/linux/leds.h                     |   6 ++
> > >   11 files changed, 205 insertions(+), 208 deletions(-)
> > No immediately obvious issues from the LEDs side.
> >
> > Still needs reviews from Backlight and fbdev.
>
> I'm confused. Are you not the backlight maintainer?

Lee is, yes, but this kind of comment is usually a hint that I've
been delinquent in my backlight reviews and records that he hasn't
looked at the backlight code yet ;-).

I'll get on it tomorrow!


Daniel.

