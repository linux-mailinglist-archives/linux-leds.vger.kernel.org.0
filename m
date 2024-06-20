Return-Path: <linux-leds+bounces-2067-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA01C910DCD
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 18:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0C5DB225E3
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 16:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293241B3737;
	Thu, 20 Jun 2024 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QV97QRFE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23F21AF6B5;
	Thu, 20 Jun 2024 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902672; cv=none; b=ZXC+ngoiNpWiIg0duW0aAIXAqYkvO3kTORVCHGOdnX5NDc9OFGLxbBbdESBuPa493HCP6MCW1QcWSJXHb9k5IS6hwp0nlmLR5S+v16IMbrECzTIbsPMIw2JnVmj5AaDi1RndAKi9McXKnbAPWctm9ccMHfUU6GxOM073ucJRNZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902672; c=relaxed/simple;
	bh=PvieDRKwurS2TTgLTxkTTMq9UgXkDZRPb62RE1TKa1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCQnmH80gZpZnk+RPTEIPj49zAXjT79kt+fFgOSGhCtGmoNQ/NQx2J0YAPLHn51dApYsvQN43x3wVAEkLOBwtPoQQT1lifMB5AIAQ8R3I/8Kv5IgpODjIRdcFxM5XQc4R8Gn5h2xnV8tSo8eaRYv3g1WT2RK/TGaTpItQRV7OeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QV97QRFE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFAAC2BD10;
	Thu, 20 Jun 2024 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718902671;
	bh=PvieDRKwurS2TTgLTxkTTMq9UgXkDZRPb62RE1TKa1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QV97QRFEnWrTtX3oL+STaz9soRMvrujyiXcWMEVmDfNgil0LnIJbADzXB2Bmc2wSN
	 e6VEvRSMi/b56whC1qPj+2WhAjjrR7sSJ3vBVJGHKYt14//H9xdknhj2S0KESFAbob
	 gOTyW+0wuDM+IPwc2dkzCKdn7cOX3+aHHqvx75hix8FPlRtT2tV3nSrumk8c1ccWfI
	 1E2ic9ZkxnihGR3WpsA0Z5EQQJRvC9B5x50jHbr2TRZHRo/lQKidwB3g1+mx/6CKnk
	 g4FqfM13BkUW+UovnbXlKIk1Fa0c2Engpo7e/BC3rsLoMHqIxv6I4SLQ8fN1irfe/D
	 ACnhkIMqCPCJA==
Date: Thu, 20 Jun 2024 17:57:46 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/20] leds: leds-lp55xx: overhaul driver
Message-ID: <20240620165746.GS3029315@google.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
 <20240620160907.GP3029315@google.com>
 <6674559e.050a0220.14848.cb8f@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6674559e.050a0220.14848.cb8f@mx.google.com>

On Thu, 20 Jun 2024, Christian Marangi wrote:

> On Thu, Jun 20, 2024 at 05:09:07PM +0100, Lee Jones wrote:
> > On Sun, 16 Jun 2024, Christian Marangi wrote:
> > 
> > > This long series is (as requested) a big overhaul of the lp55xx based
> > > LED driver.
> > > 
> > > As notice for these kind of LED chip there was the bad habit of copy
> > > the old driver and just modify it enough to make it work with the new
> > > model. Till v4 I was also doing the same by following the pattern and
> > > the code format of previous driver.
> > > 
> > > Since Lee didn't like this, here is the BIG series that generalize
> > > pretty much anything in the 4 model currently supported.
> > > 
> > > Indeed, although the LED chip have fundamental difference (page
> > > support), things can be generalized and produce slimmer drivers by
> > > putting everything in the lp55xx-common shared module.
> > > 
> > > This result in the new model lp5569 being very small with only the
> > > selftest portion to be custom.
> > > 
> > > Lee also wasn't clear by the meaning of ENGINE in these LED driver,
> > > so here some simple explaination. This is very common on these TI LED
> > > chip. The ENGINE (there are always 3) is just some kind of processor
> > > that execute a program (precompiled code ASM like) loaded in the SRAM.
> > > Sysfs is used to load the pattern, and to start and stop the engine.
> > > 
> > > These pattern can do all kind of complex thing with LEDs. Old LED chip
> > > had 32bytes of space for the pattern but newer one (like lp5569) have
> > > pages and if correctly configured can have massive pattern.
> > > These pattern can do all kind of magic like loops that make the LED
> > > pulse, change color and all kind of stuff.
> > > 
> > > (For Lee, sorry if you will have to repeat some review that I might
> > >  have missed in the lp5569 driver)
> > > 
> > > Changes v6:
> > > - Fix compilation warning for ret unused in read_poll_timeout
> > >   (no idea why this is flagged only on some particular arch...)
> > > - Fix missing bitfield.h in lp55x-common.c (again it seems this
> > >   header gets included in the flow if the arch use them or not...)
> > > Changes v5:
> > > - Big generalization patch
> > > - Rework lp5569 driver with new generalized functions
> > > - Drop all copyright header in lp5569 as the driver got reworked
> > >   entirely and it's not based on previous one anymore.
> > > Changes v4:
> > > - Fix reported buffer overflow due to a copypaste error
> > > - Add comments to describe fw size logic
> > > Changes v3:
> > > - Add ACK tag to DT patch
> > > - Enlarge and support program size up to 128bytes
> > > Changes v2:
> > > - Add ACK tag to DT patch
> > > - Fix compilation error with target that doesn't
> > >   include bitfield.h
> > > 
> > > Christian Marangi (20):
> > >   dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
> > >   dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
> > >   leds: leds-lp55xx: generalize stop_all_engine OP
> > >   leds: leds-lp55xx: generalize probe/remove functions
> > >   leds: leds-lp55xx: generalize load_engine function
> > >   leds: leds-lp55xx: generalize load_engine_and_select_page function
> > >   leds: leds-lp55xx: generalize run_engine function
> > >   leds: leds-lp55xx: generalize update_program_memory function
> > >   leds: leds-lp55xx: generalize firmware_loaded function
> > >   leds: leds-lp55xx: generalize led_brightness function
> > >   leds: leds-lp55xx: generalize multicolor_brightness function
> > >   leds: leds-lp55xx: generalize set_led_current function
> > >   leds: leds-lp55xx: generalize turn_off_channels function
> > >   leds: leds-lp55xx: generalize stop_engine function
> > >   leds: leds-lp55xx: generalize sysfs engine_load and engine_mode
> > >   leds: leds-lp55xx: generalize sysfs engine_leds
> > >   leds: leds-lp55xx: generalize sysfs master_fader
> > >   leds: leds-lp55xx: support ENGINE program up to 128 bytes
> > >   leds: leds-lp55xx: drop deprecated defines
> > >   leds: leds-lp5569: Add support for Texas Instruments LP5569
> > > 
> > >  .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
> > >  drivers/leds/Kconfig                          |  16 +-
> > >  drivers/leds/Makefile                         |   1 +
> > >  drivers/leds/leds-lp5521.c                    | 405 +---------
> > >  drivers/leds/leds-lp5523.c                    | 728 ++---------------
> > >  drivers/leds/leds-lp5562.c                    | 261 +------
> > >  drivers/leds/leds-lp5569.c                    | 542 +++++++++++++
> > >  drivers/leds/leds-lp55xx-common.c             | 730 +++++++++++++++++-
> > >  drivers/leds/leds-lp55xx-common.h             | 133 +++-
> > >  drivers/leds/leds-lp8501.c                    | 313 +-------
> > >  10 files changed, 1523 insertions(+), 1617 deletions(-)
> > >  create mode 100644 drivers/leds/leds-lp5569.c
> > 
> > Generally, I love it - what a difference!
> > 
> > Couple of small things within the patches and few general points.
> > 
> > * Ensure scripts/checkpatch.pl is happy before resubmitting.
> 
> Eh I always run patch with checkpatch.pl --strict but this time is quite
> problematic to fix the single error for the complex macro.
> 
> I will check what I can do but I think I'm really stretching the C
> precompiler there... That is really one of the very few case where error
> might be acceptable.
> 
> If I manage to mute that error, it might result in very bad code...

Just do whatever you think is the right thing and we'll roll with it.

-- 
Lee Jones [李琼斯]

