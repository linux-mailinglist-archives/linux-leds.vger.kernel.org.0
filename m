Return-Path: <linux-leds+bounces-4609-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99131AB0DC3
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 10:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E5055015E4
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 08:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6FA2797BF;
	Fri,  9 May 2025 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2DjfQz6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A132749F9;
	Fri,  9 May 2025 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780418; cv=none; b=iK3r0yEUAPttnHUl3HuS8vwAa8GVPquqhYUT1HMteObtyBia4mkXLfKMdw9muAlJHxQtpILop1jGiJrofErD1+5PnZoWHuX2UZYI9C3Qxw3gyVxewuaYiuV1wYfXCsOBbkxO/aNzxhKOwpgRwN7p4D0VlJZAvvEbW9CwuD9GvnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780418; c=relaxed/simple;
	bh=pMHYGnRHELxFia/MAGVgWzMYD/pngfkgxW/XHM9ufMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBqa5WxMDD5+Tl/00+K4sFFl6H044UH0qXaJAMYJ7h14Rt2vkDjFXHX81aW3zj24gUCWylSNR8iRQsd7PEUBMQ4jqpH4+b0R6o5/pwJPGTnrmpRzMW5VXStOcCLabzWIx94RmAG6jUPX6vun50zXF51FI9iqr7bIcSX5+9nxQ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2DjfQz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1086C4CEE4;
	Fri,  9 May 2025 08:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746780417;
	bh=pMHYGnRHELxFia/MAGVgWzMYD/pngfkgxW/XHM9ufMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2DjfQz6oSyktGTnZMp3v8EEf/WxvZLSateR0ZNivF22NaHzTLcO/eZc9FkeVIXRS
	 p9gn4ylValhULj4SiGja/fKdzvajwUshC+b798+rkYKGLNVkfkiZOi8PhYy/O5NAPR
	 gVmELm2YEnSs/gItyMKrO5X8fG3rCf2zinZAZUKu+WbBW6b1MYRHEUv/7u39cgxT/d
	 i6bLXYZnpJ1YYpGyHiAoTwkq3D3HDBAlKXbjw527kVEKXQd9Ur7t21qXoX8M6D4Tw6
	 KOrtY08FLYcoAsuu9W85vQHd5X5w3bMaCrewi/9rW2Zgi4fwooM6xd673afkTvJWHa
	 bywY0JAlTmY1w==
Date: Fri, 9 May 2025 09:46:52 +0100
From: Lee Jones <lee@kernel.org>
To: David Lechner <david@lechnology.com>
Cc: Ivan Stepchenko <sid@itb.spb.ru>, Pavel Machek <pavel@kernel.org>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] leds: uleds: fix unchecked copy_to_user() in uleds_read()
Message-ID: <20250509084652.GA2492385@google.com>
References: <20250505081342.3855-1-sid@itb.spb.ru>
 <20250508143451.GQ3865826@google.com>
 <037fc605-3401-4e68-b452-b5e4882d56bc@lechnology.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <037fc605-3401-4e68-b452-b5e4882d56bc@lechnology.com>

On Thu, 08 May 2025, David Lechner wrote:

> On 5/8/25 9:34 AM, Lee Jones wrote:
> > On Mon, 05 May 2025, Ivan Stepchenko wrote:
> > 
> >> The copy_to_user() is annotated with __must_check, indicating that
> >> its return value must be checked by the caller. Currently, uleds_read()
> >> ignores it. If the userspace buffer is invalid and copy_to_user() fails,
> >> the userspace application may assume it has received fresh data, while
> >> in fact copying has failed. This can leave applications out of sync
> >> with the actual device state.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >>
> >> Fixes: e381322b0190 ("leds: Introduce userspace LED class driver")
> >> Signed-off-by: Ivan Stepchenko <sid@itb.spb.ru>
> >> ---
> >>  drivers/leds/uleds.c | 11 +++++++----
> >>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
> >> index 374a841f18c3..41bfce43136c 100644
> >> --- a/drivers/leds/uleds.c
> >> +++ b/drivers/leds/uleds.c
> >> @@ -147,10 +147,13 @@ static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
> >>  		} else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
> >>  			retval = -EAGAIN;
> >>  		} else if (udev->new_data) {
> >> -			retval = copy_to_user(buffer, &udev->brightness,
> >> -					      sizeof(udev->brightness));
> >> -			udev->new_data = false;
> >> -			retval = sizeof(udev->brightness);
> >> +			if (copy_to_user(buffer, &udev->brightness,
> >> +					 sizeof(udev->brightness))) {
> > 
> > This is not good.
> > 
> > Please store the result into a variable and return that instead.
> 
> Every other caller of copy_to_user() in the kernel I've seen ignores the actual
> return value and returns -EFAULT, so I thought this looked correct and it was
> just a quirk of copy_to_user().

Yes, I think you're right.  Interesting.

So my counterproposal is as follows:

--- a/drivers/leds/uleds.c
+++ b/drivers/leds/uleds.c
@@ -147,10 +147,11 @@ static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
                } else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
                        retval = -EAGAIN;
                } else if (udev->new_data) {
-                       retval = copy_to_user(buffer, &udev->brightness,
-                                             sizeof(udev->brightness));
-                       udev->new_data = false;
-                       retval = sizeof(udev->brightness);
+                       ssize_t size = retval = sizeof(udev->brightness);
+                       if (copy_to_user(buffer, &udev->brightness, size))
+                               retval = -EFAULT;
+                       else
+                               udev->new_data = false;
                }

                mutex_unlock(&udev->mutex);

> >> +				retval = -EFAULT;
> >> +			} else {
> >> +				udev->new_data = false;
> >> +				retval = sizeof(udev->brightness);
> >> +			}
> >>  		}
> >>  
> >>  		mutex_unlock(&udev->mutex);
> >> -- 
> >> 2.39.5
> >>
> > 
> 

-- 
Lee Jones [李琼斯]

