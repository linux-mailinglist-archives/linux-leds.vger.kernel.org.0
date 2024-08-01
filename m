Return-Path: <linux-leds+bounces-2374-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A004B944B6B
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 14:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE97E1C216BD
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 12:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA5018950D;
	Thu,  1 Aug 2024 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJBU6vh8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78561187FFD
	for <linux-leds@vger.kernel.org>; Thu,  1 Aug 2024 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722515799; cv=none; b=Y9ggnI1rufPZsRFGrLAlWX59V2Ecx23aOWNF9t0s5TtvD8UoDNUvgFKRCFxPKbb66iC2OLUObs0RdjnSBxYEnGPL6ixotRxSnhnNJJ+s4R/ocmX4Wfa7iRDAcQQOdeO9xz4uJ+babSo7YPKPGgFTzagRVdufAYyXBi6mzFtaTFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722515799; c=relaxed/simple;
	bh=x/dZFDqqlzseeKPqYlMiqzuEYtZjhm6mdctePPVYkR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKKd80YuCGj2BywTn13DZhJ7fpyZlXOARNOzBWzY3NhFd2A9ZECdwfcJ87B8YL1srbk2AUKKfg+XVmGYrU41bj9bnOiUDVjcz3QTsQ0wEK2xaBhax2KdefBAl2iR3laZmCKyDhZMFTGPfuLMeDiN/IY17t6NnaMywZFuwgj6NvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJBU6vh8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C95C32786;
	Thu,  1 Aug 2024 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722515799;
	bh=x/dZFDqqlzseeKPqYlMiqzuEYtZjhm6mdctePPVYkR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJBU6vh8963bMgx05A0nSWIZ9RJNOFvV+67yamHEHgU5L4Sg0AGv+cLSSXVxCOqrP
	 2rl/LlvdpSVh6YcnFGGRHs6TN8c+Z2PZV5JftNfDKFBxgO441C2vRlfsCQcFPN34bt
	 hFCVDqbNQHxtnDYaT1t4D5HWb0HUhquEKJBPPq3eDheyZjS3DL1CUqfJY7d7D/hoJ8
	 BTBMCCrNwQgJtFbc8YNPUTvJ8eQjwJHTUfX48XXVg6JTlPZ4u2b02eTTqKHXCobqke
	 J6a9M1+WPDVG4OtzAwNIu++Q+1ZfbsQowfNgT5toEAB3oNwO0qMkChYvx9mN2SqeU6
	 +3XIxmPtUQHTA==
Date: Thu, 1 Aug 2024 13:36:35 +0100
From: Lee Jones <lee@kernel.org>
To: Guilherme =?iso-8859-1?Q?Gi=E1como_Sim=F5es?= <trintaeoitogc@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [RESEND LEDs] leds: remove led_brightness
Message-ID: <20240801123635.GB6756@google.com>
References: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>
 <20240725102623.GF501857@google.com>
 <CAM_RzfZhySkzDZF-RV=+8rtx0yTs-+qmsRNwwa31nsWRAc40-g@mail.gmail.com>
 <ZqJHEdxwEpr5W605@duo.ucw.cz>
 <CAM_RzfbkPN+Wjuj5y60jnAO_w5iSU68TLErcpuyJ=z0kX4RFrA@mail.gmail.com>
 <CAM_RzfY4GR1Jkym4mpGUVtsew3T--nqKWJD_sb_0tc5hDFBiSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM_RzfY4GR1Jkym4mpGUVtsew3T--nqKWJD_sb_0tc5hDFBiSw@mail.gmail.com>

Please do not top-post (moving your comments down to the bottom).

On Mon, 29 Jul 2024, Guilherme Giácomo Simões wrote:
> Em qui., 25 de jul. de 2024 às 10:07, Guilherme Giácomo Simões
> <trintaeoitogc@gmail.com> escreveu:
> 
> >
> > Pavel Machek <pavel@ucw.cz> writes:
> > >
> > > Hi!
> > >
> > > > > > The includes/linux/leds.h diff:
> > > > > > -/* This is obsolete/useless. We now support variable maximum brightness. */
> > > > > > -enum led_brightness {
> > > > > > -       LED_OFF         = 0,
> > > > > > -       LED_ON          = 1,
> > > > > > -       LED_HALF        = 127,
> > > > > > -       LED_FULL        = 255,
> > > > > > -};
> > > > > > +// default values for leds brightness
> > > > > > +#define LED_OFF  0
> > > > > > +#define LED_ON   1
> > > > > > +#define LED_HALF 127
> > > > > > +#define LED_FULL 255
> > > > > >
> > > > > I'm not aware of the history of this, however I'm even less sure how
> > > > > converting these from an enum to #defines makes this any better.
> > > > >
> > > >
> > > > Yeah. The TODO says:
> > > > -* On/off LEDs should have max_brightness of 1
> > > > -* Get rid of enum led_brightness
> > > > -
> > > > -It is really an integer, as maximum is configurable. Get rid of it, or
> > > > -make it into typedef or something.
> > > >
> > > > I could only remove enum led_brightness, but in some places, the
> > > > LED_FULL, LED_HALF...
> > > > are used. This is why I created this #defines.
> > > > I don't know what we can do in these cases that LED_FULL, FULL_HALF is used.
> > > > For example, in the drivers/leds/leds-ss4200.c on line 223 have this code
> > > >
> > > > u32 setting = 0;
> > > > if (brightness >= LED_HALF)
> > > >     setting = 1;
> > >
> > > Yep. Such drivers should be modified to set max_brightness to real
> > > number of steps hardware can do... then we can remove LED_HALF,
> > > LED_FULL and such defines.
> > >
> > > Best regards,
> > >                                                                 Pavel
> >
> > but this will require the effort of everyone who has already written drivers
> > for some LED hardware. Because only the driver author himself will know
> > all the steps for that specific LED.
> >
> > or, maybe we can adapt this drivers for understand the brightness as a 0 or 1.
> > 0 for OFF and 1 for HALF and FULL. This is possble ?

> In the drivers/leds/leds-clevo-mail.c for example, the LED_HALF is
> used on line 102.
> In drivers/leds/leds-pca955x.c the LED_HALF is used in line 260.
> 
> How can I remove these keywords if manufacturers still use them?

And now you see why no one has removed them before now.

Once all uses have been converted, we can remove the enum.

-- 
Lee Jones [李琼斯]

