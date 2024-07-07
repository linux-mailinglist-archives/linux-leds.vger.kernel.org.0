Return-Path: <linux-leds+bounces-2210-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5F929927
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jul 2024 19:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09C8281613
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jul 2024 17:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF263FBA5;
	Sun,  7 Jul 2024 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhFi0bS8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1C1DFEB;
	Sun,  7 Jul 2024 17:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720373039; cv=none; b=pOyfwFS3SrQerrfPaMRDk66H9M6Gh4f8NCFX1YVrcp8YrMd2AUKOAZTgKSoZ82aK4iHiyi5qzihLtqEBZanCGs8vlbrgEJYoB/5y3+H0YDDdQsymndTKWZ1fZ5Ob0rrpAv8iloicFWjp8/dU/bS+Sh+SXdLH9YrLjgvYH/9o/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720373039; c=relaxed/simple;
	bh=ZQmbDHsQvjQBDmkJ+Fa6JDDQBZQvzQIiuk1mPEYhXrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uA0KmmZ2xJ8xZ2HaqdbJo9gawU4eZZMxLvbKQmgAso0mzU9lceewV6zigwTUNWFr2/drxbw/AVMN4gE3PqsT0zkz5r1v9J9k5edS2TYACKQMyNmjGogH8QDC21Yk+7ZusM3v85auCfATd+H7hixeihdWiHKz7179mEWVXvopNwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhFi0bS8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3678aa359b7so2594263f8f.1;
        Sun, 07 Jul 2024 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720373036; x=1720977836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJCjdfrQ8aPWVCj5Ds9uLJdxgkaWdZl/hGofw0fBJ2E=;
        b=hhFi0bS8gLao2zyY5MzqyfOUPJ1Ht4+m2SO21RKjLwEP4iMD3y4fN2wKhUuQAvV5Bc
         /lQa2WdKsATHH95taO5mSqL0bml0qwMwXPkNIWAA3LWrhVFW58Ze+zA5hIGLYhhbuwz4
         PsrQ21r3b4uV8N1UnXiBPjLecIfMfiW3sTrMXVVXfc4HyLn91UI78P4wvO8YQ7vNfN9L
         EYS5ZFovh232a1QoDmK7TxuKXr6oZA4lKhnwn3XwHDJhUmVspaF3O4ys6joZoWkwD21j
         CMfNdMEqil6QFfj7Eb5NCeyIofsla1Q/XhMx8TfNPrVQnd74W6MRBBOgWyOey3aai5x0
         l4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720373036; x=1720977836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJCjdfrQ8aPWVCj5Ds9uLJdxgkaWdZl/hGofw0fBJ2E=;
        b=t2kHfzZnvuMgtc3mhj07vo8VQf5xw1MRieEDU7LKxcp1aW2HIyVEUubwssm+rYDiZb
         PgLo22AaZ+D74l6fNilMvRnv1ixexkNMIOVeScYi2ObEr/iX8VXW9w6QEJcITy0EuEvM
         w/Gxges8A+tz5GRaWpQ6gRbRKrh56oy/x7t3K77RU5KgwGp+M7oP5JLS411MAx/tzv/t
         fSy2S4AtIgLgeaH3NtO3icxVW9u/adyOzUKCFqoEDnnuRNTR/0yu7IrhSfg9pJ2IBW7t
         dD+m3Xgt+2X5GlOderD5aCLvWpcSnGl74lAyp/2lqOy5cnhtdA5OlUo6R0PG4EoyhW9R
         0f0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXopiZJ8HVAVPEge7TebTSlyLJv5ZmcZIQ3QfiCZ9PPVnhXgsBy0xgpic0Tb/1pbjoCUkNuPeM4gVXPZ7ym/2EuqAIEB145ZTnVrnIOrZ4Q1/cIgPfAalzcij7MBYN2BYuDZ87uPotU45XP/bazTHkT51zKP1GM+oye9EBg3e/18IYTNqqPlg/5GFijyDs=
X-Gm-Message-State: AOJu0YysGfDitaN2HlbFlINWTs6B1VapBfI5eFmFFd1X6BRfaVTSTPtB
	Q7QmKgHUoHcx2igaJMv2Vn9dQwOXR3ATiXJfyzyMtiQAUPXLA/mL
X-Google-Smtp-Source: AGHT+IFZOzod0Y2BwmwPeiFLAmKCFJLGdNREpGGJpTiyGT9P3/8Klvh5SH6BxWnb9Y4xfPl3At/AcA==
X-Received: by 2002:adf:ce0d:0:b0:366:eadc:573f with SMTP id ffacd0b85a97d-3679f75c4eemr9234958f8f.27.1720373035359;
        Sun, 07 Jul 2024 10:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:ed72:2800:17de:b512:9f9e:464b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367961a507csm11039720f8f.77.2024.07.07.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 10:23:55 -0700 (PDT)
From: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
To: hdegoede@redhat.com
Cc: carlosmiguelferreira.2003@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mustafa.eskieksi@gmail.com,
	pavel@ucw.cz,
	platform-driver-x86@vger.kernel.org,
	rishitbansal0@gmail.com,
	wse@tuxedocomputers.com
Subject: Re: Re: [PATCH] HP: wmi: added support for 4 zone keyboard rgb
Date: Sun,  7 Jul 2024 18:20:00 +0100
Message-ID: <20240707172000.19723-1-carlosmiguelferreira.2003@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <473d8897-7b97-4175-b171-42fd2c8de0d6@redhat.com>
References: <473d8897-7b97-4175-b171-42fd2c8de0d6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, sorry for the (big) delay

> Hi Carlos,
> 
> On 3/24/24 7:05 PM, Carlos Ferreira wrote:
> > Added support for 4 zone keyboard rgb on omen laptops.
> > 
> > Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
> 
> Thank you for your patch and sorry for being slow with replying to this.
> 
> There actually already was a previous attemp to add support for
> the 4 zone keyboard to hp-wmi by Rishit Bansal:
> 
> https://lore.kernel.org/platform-driver-x86/20230131235027.36304-1-rishitbansal0@gmail.com/
> 
> As discussed there we really want to define a new standardized
> userspace API for the backlight functionality of these zoned
> RGB keyboards. Using driver specific sysfs attributes for this
> is undesirable, since that will never get wide support in userspace.
> 
> OTOH if we define and document a new standard userspace API for this
> then hopefully standard userspace stacks like KDE and GNOME will
> eventually get support for this and then for the next zoned rgb
> keyboard things will just work using the new standard API once
> kernel support is merged.
> 
> I realize that using a single LED class device with kbd_backlight
> in the name to tap into the existing userspace support to at least
> control the overall backlight brightness is useful and tempting but
> 
> IMHO this really is a case where we need a new userspace API and then
> emulating just a single brightness control for compatilbility with
> existing userspace UI code can be done in powerdevil (KDE) or
> upower (GNOME and others) in combination with offereing a more
> complete DBUS API to also allow controlling the zones separately.
> 

That makes sense. I should post my first implementation using the
multicolor led api soon.

> Recently another (laptop) driver for Casper Excalibur laptops has
> been posted and this also include support for a 4 zone rgb keyboard:
> https://lore.kernel.org/platform-driver-x86/20240324181201.87882-2-mustafa.eskieksi@gmail.com/
> 
> This driver actually already implements the userspace API proposed in
> the discussion surrounding the earlier "[PATCH V3] platform/x86: hp-wmi:
> Support omen backlight control wmi-acpi methods" patch.
> 
> This driver creates 4 LED class devices using the multi-color LED API
> for RGB. One LED class device per zone. These are named:
> 
> casper:rgb:kbd_zoned_backlight-right
> casper:rgb:kbd_zoned_backlight-middle
> casper:rgb:kbd_zoned_backlight-left
> casper:rgb:kbd_zoned_backlight-corners
> 
> Where as for the HP laptop case I believe the 4 multi-color LED
> class devices should have the following names since the zones
> are different:
> 
> hp:rgb:kbd_zoned_backlight-main
> hp:rgb:kbd_zoned_backlight-wasd
> hp:rgb:kbd_zoned_backlight-cursor
> hp:rgb:kbd_zoned_backlight-numpad
> 

For this driver i think it should be something more like this:

hp:rgb:kbd_zoned_backlight-right
hp:rgb:kbd_zoned_backlight-middle
hp:rgb:kbd_zoned_backlight-left
hp:rgb:kbd_zoned_backlight-wasd

> As I mentioned in my review of the Casper Excalibur laptop driver
> as part of adding support for these zoned rgb keyboards to various
> laptop vendor specific drivers we should also document how these
> devices are presented to userspace:
> 
> A separate patch needs to be written to add documentation about
> the use of these names for zoned RGB backlit kbds in a new paragraph /
> subsection of the "LED Device Naming" section of:
> 
> Documentation/leds/leds-class.rst 
> 
> And this should document at least the 2 currently known
> zone sets:
> 
> :rgb:kbd_zoned_backlight-right
> :rgb:kbd_zoned_backlight-middle
> :rgb:kbd_zoned_backlight-left
> :rgb:kbd_zoned_backlight-corners
> 
> :rgb:kbd_zoned_backlight-main
> :rgb:kbd_zoned_backlight-wasd
> :rgb:kbd_zoned_backlight-cursor
> :rgb:kbd_zoned_backlight-numpad
> 
> with a comment that in the future different zone names are possible
> if keyboards with a different zoning scheme show up.
> 
> Perhaps you can work together with Mustafa on writing a patch for:
> Documentation/leds/leds-class.rst ?
> 

I am open to it if it was not done yet. But could you please
be a bit more specific about what exactly
needs to be documented about my patch?
Zone names, brightness control, userspace interaction?

> for this and then hopefully Pavel can review + ack this patch
> and then we can move forward with both the hp and the casper
> laptop zoned rgb keyboard support.
> 
> Regards,
> 
> Hans

