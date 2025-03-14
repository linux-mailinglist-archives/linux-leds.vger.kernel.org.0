Return-Path: <linux-leds+bounces-4252-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D06ADA60BEA
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 09:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5855B7A35DA
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 08:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3BA1AAA1B;
	Fri, 14 Mar 2025 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="VX7H3XTv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9C1953A2
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941605; cv=none; b=d4MfaxKEILmHPIWiZ2tXn4Xw1w4xh4MIswtw+sswJcm/U5XwAHXdyqyO9j+b+Rajo2YfYracSTBlKrB0kmypM/q/RPa7MOrVka3ZqNPtnpb8WdPzgHiKv8xO9vmi1DwKHTmPRST4ID0HL49vGllCcQF+Pbd8VFxFI05Y98N6PLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941605; c=relaxed/simple;
	bh=5i8E/MG/ET8Y/f8RgRL9nj5/2/2eqNKKd+MBxazAWD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzVTgjKVAgRBlt1p6xwrMw2L9aYAXV0i8X/LtQTKOsRp++YyjY5BC11tYEa+jKkoKxsUYUuH1hlxIoc4HHif7PfetFLF1f1yziQsnLnJNCUam2X0Nl8l4mdkXlXUrF6ZjuLg8jhId+SiKR9AiIDKFlvmCIdr0QvT9ycugTOZsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=VX7H3XTv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1883041f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741941602; x=1742546402; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zTD8i7ehrtWGXAGvlrD7ICGK3PvUyLJ6pHY0HnCJJW4=;
        b=VX7H3XTvtr4WB15Af/SGQVpQ5E7er5KY9WmsCUlVwiMGuur0jlMUht9KT4eEUcbjNu
         MR072FjmITNThvn3SkfqU3vMB44XVPLuZi32nzb1unXn6Eeu7UeNixztTOMFDuDKE8cU
         7lF1Mh6ERMWuSASij1GGNylKHUPiO+PTsUqjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941602; x=1742546402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTD8i7ehrtWGXAGvlrD7ICGK3PvUyLJ6pHY0HnCJJW4=;
        b=Oeigh8LwhO3HQhqYzin9IwNLWnX9IzKAXG+yS7QiOIwOQnVWIIWMrOi2Lf2zPy7Xnv
         lMVwR1EtqryOcMn7m/Y0hx1l2uZrTcTSf+hu6hzkWvmLFGiFM4oWkb4xCgfmQquIFrCl
         be7lu22u9jrwBMJ+8XLBdALsPxlbNrPU9qOyJW1T/uFPUhg8xl+VAmJRUorn98N++NeH
         hjVjQvfNByh0aW9nBIhv7RqxSIvmo8gue1DEB+TdbwNeYySbdhER+2zpbU92IdJgHL3A
         QHbjGDBJ5u71m/nVqR5k547F5Ao0wrUEQ/FErNK6M6DhTCOGox5CRFpmm49nRLZ/0e2G
         42Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU3iTf3ImL3GBcH2B3QZjvdgyB6LTRJ0aFAhgfDjSxNX3F61/NmcuR1ZWp/bOy6LDoXS+yykBerXZNW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywym+A77Uf8QLauagmvrCo4azfVH0fOpRo2nZySWaYiddxmjCeY
	OFC/0FejjC0fW3cYgsGtQOnB7xaxsSqgLIey39w2w7gl7tAWn7sDLuDg2tzXEE4=
X-Gm-Gg: ASbGncuODKWV584FLDsvKDOA7UxrR4Di6eg6mKWqq3QDD2WqZSgcgsTCHcbwIRm+P0O
	WyufOm2ZqIKveH6n+Gp9/L+64SKrZFl9KfmWPWrNCFI6Y9mnbYn5DJCAU6OQ7Kg4nW1SAo2sEvW
	83VrFjnOVrqkRd9m0oWs+YTpQsZ46X077/CrRw0BsGtPcq5V8H6baCblSULDQaO6W/F9GnX8Ko6
	hNvbIHnETbf4UYjIp5/w6ArmVVMDirtOAfvHfHNge+8fDbxvAxjbsFcNSdcvnaR5O9FErTmJywB
	Q1VRGyoSuUVPCGcq2RKAdyDHZjr39apwH7u8MArGCkwP+XlqqzNd+aUg
X-Google-Smtp-Source: AGHT+IF3El0IcCegrk7kxsLbPhk6T5yA/RlbcCrLwdVepuvGVFRDQsO8rTnEsFvIbEpHMtRzd+Cu8w==
X-Received: by 2002:a5d:64e8:0:b0:390:df83:1f22 with SMTP id ffacd0b85a97d-395b9b10ed6mr5683819f8f.25.1741941601570;
        Fri, 14 Mar 2025 01:40:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbfa90sm9932745e9.16.2025.03.14.01.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:40:00 -0700 (PDT)
Date: Fri, 14 Mar 2025 09:39:59 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, pavel@ucw.cz,
	danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 00/11] backlight, lcd, led: Remove fbdev dependencies
Message-ID: <Z9PrX6Qz4io3M9xs@phenom.ffwll.local>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250313165151.GE3645863@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313165151.GE3645863@google.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Mar 13, 2025 at 04:51:51PM +0000, Lee Jones wrote:
> On Thu, 06 Mar 2025, Thomas Zimmermann wrote:
> 
> > This series removes the remaining dependencies on fbdev from the
> > backlight, lcd and led subsystems. Each depends on fbdev events to
> > track display state. Make fbdev inform each subsystem via a dedicated
> > interface instead.
> > 
> > Patches 1 to 3 make fbdev track blank state for each display, so that
> > backlight code doesn't have to.
> > 
> > Patches 4 to 6 remove fbdev event handling from backlight code. Patches
> > 7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
> > do the same for led's backlight trigger.
> > 
> > The final patch removes the event constants from fbdev.
> > 
> > With the series applied, the three subsystems do no longer depend on
> > fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
> > number of events. That mechanism has been deprecated for some time and
> > converted call to dedicated functions instead.
> > 
> > Testing is very welcome, as I don't have the hardware to test this
> > series.
> > 
> > v3:
> > - export several symbols
> > - static-inline declare empty placeholders
> > v2:
> > - avoid IS_REACHABLE() in source file (Lee)
> > - simplify several interfaces and helpers
> > - use lock guards
> > - initialize global lists and mutices
> > 
> > Thomas Zimmermann (11):
> >   fbdev: Rework fb_blank()
> >   fbdev: Track display blanking state
> >   fbdev: Send old blank state in FB_EVENT_BLANK
> >   backlight: Implement fbdev tracking with blank state from event
> >   backlight: Move blank-state handling into helper
> >   backlight: Replace fb events with a dedicated function call
> >   backlight: lcd: Move event handling into helpers
> >   backlight: lcd: Replace fb events with a dedicated function call
> >   leds: backlight trigger: Move blank-state handling into helper
> >   leds: backlight trigger: Replace fb events with a dedicated function
> >     call
> >   fbdev: Remove constants of unused events
> > 
> >  drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
> >  drivers/video/backlight/backlight.c      |  93 +++++--------------
> >  drivers/video/backlight/lcd.c            | 108 +++++++++--------------
> >  drivers/video/fbdev/core/fb_backlight.c  |  12 +++
> >  drivers/video/fbdev/core/fb_info.c       |   1 +
> >  drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
> >  drivers/video/fbdev/core/fbsysfs.c       |   8 +-
> >  include/linux/backlight.h                |  22 ++---
> >  include/linux/fb.h                       |  12 +--
> >  include/linux/lcd.h                      |  21 ++++-
> >  include/linux/leds.h                     |   6 ++
> >  11 files changed, 205 insertions(+), 208 deletions(-)
> 
> No immediately obvious issues from the LEDs side.
> 
> Still needs reviews from Backlight and fbdev.

I looked throught the series and it's a small step, but I think it's the
right direction for where we want backlight/fbdev/drm-kms to head towards
long-term. So on the series:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima

> 
> -- 
> Lee Jones [李琼斯]

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

