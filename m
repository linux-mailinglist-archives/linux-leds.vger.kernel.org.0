Return-Path: <linux-leds+bounces-1423-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA789C44F
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 15:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E0B31C22A35
	for <lists+linux-leds@lfdr.de>; Mon,  8 Apr 2024 13:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91ACC129E86;
	Mon,  8 Apr 2024 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HOydUxe9"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D471292FC;
	Mon,  8 Apr 2024 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712583853; cv=none; b=ZOnzbOfYjiDjySahU0BbWUmm/kgFdFZ3bFXN1DYmiezuAT4DxHnbyPv/O41J+F0ksn9VaNTNc9yadjZt4kxmzmnsvJmfxtDyr/CJgqZJD675QNnmx/fkvq9yCXtWMEhDig1ONuRjM6O4e4kQRs5DM3NjAVDEIP1aXyUssdsjYgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712583853; c=relaxed/simple;
	bh=KUCbhlX3wcsQmPwAru7ZPERm//vLmfFFHqmh1fEhbIU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ir13ATfs+yGy34Tg0to+YAXPUPuyEFW2hIYzc+1xvKzchwUAG8Ca/4dhxlyZoBBAOOWFSbhfHXriKUcBMK35/+ePJz4PMic5PfwpzsugMc43ru6Q/9ozE9nEPnBKhTqk9KdnMlvI9+PyprnU6GMCfgUkHuyThGiV351ijCikw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HOydUxe9; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96E8620008;
	Mon,  8 Apr 2024 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712583849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBqmEBenZUQ/4iAbGHaHJV+1t6aW5OMI+rOt8q34zEU=;
	b=HOydUxe9TYXJY4k85e2X9PXbYH+pWKo7G1TV/lwpT0r68vaA67gUcRUA3zXum8GNJNC9R8
	PWekFHMNduKaPFM7r47glHYAsrwGCTTxpetu3pN7sFjX4ZeN46FKeLWHbJjdtayXW0IhAj
	zii2bA2cA3Yc3Ri4n5uSCh4CIozSXy+HMgOx3pIc5JtQmkwg0APUP5DWOkZI/HPKm79dgt
	Z4wEj2/QHkfYDmPZvXhgglVCue06AFoMPssXRkhpWnarOVuTSe8OmWZlnPA/ZOz0GVHmJQ
	OiUT6/ZvBFjgB4TWhGcz6OmgBOQAaFd9ZZ/6jYKp/pPTP3fxSvOn9BYdBIZ8zg==
Date: Mon, 8 Apr 2024 15:44:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Android Kernel Team
 <kernel-team@android.com>
Subject: Re: [PATCH RESEND 0/2] leds: gpio: Add devlink between the
 leds-gpio device and the gpio used.
Message-ID: <20240408154407.3a90a518@bootlin.com>
In-Reply-To: <CAGETcx_=g1dCH=YMUkc7VquUmLs=bNZMspUxH+V49uhcV0Bx2w@mail.gmail.com>
References: <20240220133950.138452-1-herve.codina@bootlin.com>
	<CAMRc=MfWPEOHeNvAwra-JxHZBFMrQbP+273zbFLDZfxi7fx8Yg@mail.gmail.com>
	<20240220155347.693e46e1@bootlin.com>
	<CAMRc=MeSgCOLZvFOXF4eQOp=bTz38K5Krzuy9r569-jnDx1zFA@mail.gmail.com>
	<20240220164730.03412479@bootlin.com>
	<CAGETcx_=g1dCH=YMUkc7VquUmLs=bNZMspUxH+V49uhcV0Bx2w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Saravana,

On Tue, 20 Feb 2024 19:28:17 -0800
Saravana Kannan <saravanak@google.com> wrote:

...
> > >
> > > Do I understand correctly that the devlink is created between "led-5"
> > > and "tca6424_dock_2" but actually should also be created between
> > > "leds-dock" and "tca6424_dock_2"?
> > >  
> >
> > Yes, that's my understanding too.  
> 
> I'm replying here instead of the RESEND because here's where the
> context and example are provided.
> 
> I quickly poked into the gpio-leds driver. Please correct me if I'm
> misunderstanding anything.
> 
> It looks like led-5 will be added as a class device. But the
> dev->fwnode is not set before it's added because it uses
> device_create_with_groups(). So, fw_devlink doesn't create a link
> between led-5 and tca6424_dock_2 unless tca6424_dock_2 is added after
> led-5. Which coincidentally seems to be the case here. Might want to
> explicitly create the device in gpio-leds driver.
> 
> The issue you are trying to fix is a generic issue that I'd like to
> fix in a generic fashion. It's one of my TODOs which I've mentioned
> before in conferences/emails to LKML: device links framework has a
> bunch of gaps when it comes to class devices. I've been thinking about
> it for a while, but it needs a lot more work and testing. I'll roll in
> this case when I deal with it in a generic fashion. But here's the
> general idea of things that need to be addressed:
> 
> 1. "Managed" device links allow having a class device as a supplier,
> but that'll mean the consumer will never probe.
> 2. What if a class device is a consumer and the supplier isn't ready.
> What does it mean for the class device to be added? Is it available
> for use? Probably not. Can we do something here that'll be useful for
> the class implementation?
> 3. What if the supplier and consumer are class devices, when does the
> consumer class device become "available" (do we check the suppliers of
> the supplier?)?
> 4. What happens if the supplier of a class device gets removed? Do we
> notify the class so it can do the right thing? Do we force unbind the
> first ancestor that's on a bus? (your case).
> 5. What if a supplier class device is removed, should we unbind the
> consumer (if it's a bus device)?
> 
> I'm currently working on a patch to break dependency cycles. Once
> that's in, the next TODO item I work on is going to be this or clock
> framework sync_state() support.
> 
> So, I'd recommend waiting this out if it's not urgent.
> 
> Heh, here's my commit on my local repo from a year ago when I touched
> on this and realised the scope of the work.
> 
> commit 7dcaad52e569209104408f3e472fde4ef8cd5585 (class-devlinks-v1)
> Author: Saravana Kannan <saravanak@google.com>
> Date:   Mon Feb 13 13:40:43 2023 -0800
> 
>     add class support to device links
> 
> 
> Thanks,
> Saravana

Did you move forward on this topic ?

Best regards,
Hervé

