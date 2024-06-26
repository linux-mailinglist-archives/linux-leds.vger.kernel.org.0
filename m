Return-Path: <linux-leds+bounces-2153-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AD29186FB
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD8112882C2
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E7D190679;
	Wed, 26 Jun 2024 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPXjaDhw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1E419066F;
	Wed, 26 Jun 2024 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418171; cv=none; b=ZzCcT2ErePof1+BSRyidGtIsgc9wD/TESJ9JDwTsHlcoSGXFHaFh+kLeUqDNkqwwjlAF3KUiy+cs3pfIT6fFBWExp94I+N57LCzDASgv1jDOTEz6TIhSWy5jA+2tJBMFCrW3jkSQ57/klQtUThfxYugtfsWbx3TO/RytAV4PRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418171; c=relaxed/simple;
	bh=9+zS7iXkm2wRxeLbdnT0CLcwumCn/BTnbb0kcugef4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dysVApLnzCWvMRK6Qq4GiaFhRZEqy137f7tWJJ6MsDAtfu+1y1fx5tBXr9sO1Ac4zKMdhSHUtvJmGCSExnOxbDkWnO1pczmLS+uU02JEut0If6wfl4l0T8JsCpDD6ZHdfsf2MVlp8IVJoL7ONP5zM8mBJPBPPcJtRZLOe41wZec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPXjaDhw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BF0C116B1;
	Wed, 26 Jun 2024 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719418171;
	bh=9+zS7iXkm2wRxeLbdnT0CLcwumCn/BTnbb0kcugef4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPXjaDhwgDeCtogEvWtJMG3vlZIjZoyySuauj+mpRYa+oXax8vkRe3fTlNyO79kXn
	 r2xat/ie4SS2pyjyF9rs4tZVwa6q5xx86t1QDdZqWRT9H8Vbgr10WHJjG+ZNW6qiWL
	 gvLKKvE6nS7SJcpPPap2hmiWHbgVmJ2X7QXkUmmK8tF3vVlg5GGXN7bfHIt1CK2I7C
	 OTbeP19MN65MCcSmWZ8qkmso+psWwDRsDSr2/6X2PAKEBumKmAj5Rb/Jo3JN/3Igko
	 4KFOl0tHrHSG/AGTBmdBE11IM3m3/fOKvmt1we8+mNEiLvtcUSBQY+S0EttN4YUwRx
	 9reZHlenBbtyg==
Date: Wed, 26 Jun 2024 17:09:26 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/20] leds: leds-lp55xx: overhaul driver
Message-ID: <20240626160926.GB2532839@google.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
 <20240626154255.GC2504017@google.com>
 <667c3a4a.5d0a0220.bf738.7cca@mx.google.com>
 <20240626160735.GA2532839@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626160735.GA2532839@google.com>

On Wed, 26 Jun 2024, Lee Jones wrote:

> On Wed, 26 Jun 2024, Christian Marangi wrote:
> 
> > On Wed, Jun 26, 2024 at 04:42:55PM +0100, Lee Jones wrote:
> > > On Thu, 20 Jun 2024, Christian Marangi wrote:
> > > 
> > > > This long series is (as requested) a big overhaul of the lp55xx based
> > > > LED driver.
> > > > 
> > > > As notice for these kind of LED chip there was the bad habit of copy
> > > > the old driver and just modify it enough to make it work with the new
> > > > model. Till v4 I was also doing the same by following the pattern and
> > > > the code format of previous driver.
> > > > 
> > > > Since Lee didn't like this, here is the BIG series that generalize
> > > > pretty much anything in the 4 model currently supported.
> > > > 
> > > > Indeed, although the LED chip have fundamental difference (page
> > > > support), things can be generalized and produce slimmer drivers by
> > > > putting everything in the lp55xx-common shared module.
> > > > 
> > > > This result in the new model lp5569 being very small with only the
> > > > selftest portion to be custom.
> > > > 
> > > > Lee also wasn't clear by the meaning of ENGINE in these LED driver,
> > > > so here some simple explaination. This is very common on these TI LED
> > > > chip. The ENGINE (there are always 3) is just some kind of processor
> > > > that execute a program (precompiled code ASM like) loaded in the SRAM.
> > > > Sysfs is used to load the pattern, and to start and stop the engine.
> > > > 
> > > > These pattern can do all kind of complex thing with LEDs. Old LED chip
> > > > had 32bytes of space for the pattern but newer one (like lp5569) have
> > > > pages and if correctly configured can have massive pattern.
> > > > These pattern can do all kind of magic like loops that make the LED
> > > > pulse, change color and all kind of stuff.
> > > > 
> > > > (For Lee, sorry if you will have to repeat some review that I might
> > > >  have missed in the lp5569 driver)
> > > > 
> > > > Changes v7:
> > > > - Add Suggested-by tag
> > > > - Fix checkpatch error for complex macro (rework define)
> > > > - Add missing values for fader conversion
> > > > - Align some function with redundant new line
> > > > - Capitalize every commit title
> > > > Changes v6:
> > > > - Fix compilation warning for ret unused in read_poll_timeout
> > > >   (no idea why this is flagged only on some particular arch...)
> > > > - Fix missing bitfield.h in lp55x-common.c (again it seems this
> > > >   header gets included in the flow if the arch use them or not...)
> > > > Changes v5:
> > > > - Big generalization patch
> > > > - Rework lp5569 driver with new generalized functions
> > > > - Drop all copyright header in lp5569 as the driver got reworked
> > > >   entirely and it's not based on previous one anymore.
> > > > Changes v4:
> > > > - Fix reported buffer overflow due to a copypaste error
> > > > - Add comments to describe fw size logic
> > > > Changes v3:
> > > > - Add ACK tag to DT patch
> > > > - Enlarge and support program size up to 128bytes
> > > > Changes v2:
> > > > - Add ACK tag to DT patch
> > > > - Fix compilation error with target that doesn't
> > > >   include bitfield.h
> > > > 
> > > > Christian Marangi (20):
> > > >   dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
> > > >   dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
> > > >   leds: leds-lp55xx: Generalize stop_all_engine OP
> > > >   leds: leds-lp55xx: Generalize probe/remove functions
> > > >   leds: leds-lp55xx: Generalize load_engine function
> > > >   leds: leds-lp55xx: Generalize load_engine_and_select_page function
> > > >   leds: leds-lp55xx: Generalize run_engine function
> > > >   leds: leds-lp55xx: Generalize update_program_memory function
> > > >   leds: leds-lp55xx: Generalize firmware_loaded function
> > > >   leds: leds-lp55xx: Generalize led_brightness function
> > > >   leds: leds-lp55xx: Generalize multicolor_brightness function
> > > >   leds: leds-lp55xx: Generalize set_led_current function
> > > >   leds: leds-lp55xx: Generalize turn_off_channels function
> > > >   leds: leds-lp55xx: Generalize stop_engine function
> > > >   leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
> > > >   leds: leds-lp55xx: Generalize sysfs engine_leds
> > > >   leds: leds-lp55xx: Generalize sysfs master_fader
> > > >   leds: leds-lp55xx: Support ENGINE program up to 128 bytes
> > > >   leds: leds-lp55xx: Drop deprecated defines
> > > >   leds: leds-lp5569: Add support for Texas Instruments LP5569
> > > > 
> > > >  .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
> > > >  drivers/leds/Kconfig                          |  16 +-
> > > >  drivers/leds/Makefile                         |   1 +
> > > >  drivers/leds/leds-lp5521.c                    | 405 +---------
> > > >  drivers/leds/leds-lp5523.c                    | 734 ++---------------
> > > >  drivers/leds/leds-lp5562.c                    | 261 +-----
> > > >  drivers/leds/leds-lp5569.c                    | 544 +++++++++++++
> > > >  drivers/leds/leds-lp55xx-common.c             | 743 +++++++++++++++++-
> > > >  drivers/leds/leds-lp55xx-common.h             | 163 ++--
> > > >  drivers/leds/leds-lp8501.c                    | 313 +-------
> > > >  10 files changed, 1540 insertions(+), 1651 deletions(-)
> > > >  create mode 100644 drivers/leds/leds-lp5569.c
> > > 
> > > For whatever reason, this no longer applies.
> > > 
> > > Please rebase it on Linux -next or for-leds-next and resubmit.
> > >
> > 
> > Hi Lee.,
> > 
> > I just checked and yes there is to rebase the series due to
> > c0e3d2beeb03 ("leds: Drop explicit initialization of struct
> > i2c_device_id::driver_data to 0")
> > 
> > But I notice that something went bad in reverting some commits from the
> > v7 series and in for-leds-next there are still 3 commit to drop
> > 
> > mainly 
> > - 3bed6364ffd0057bd10c081d2e24aa7e8555e0a8
> > - 3bcc6d6ad7821aa459826592f830d76a3dc6f79f
> > - 5a402b40c651baf758ad884aed36c0ea70cd8b1e
> > 
> > I'm sending v8 with everything rebased but please keep in mind that
> > those commits needs to be reverted as the leds one also somehow got half
> > applied (no idea what happen)
> 
> This must be related to the tooling error that happened recently.
> 
> I have removed those 3 patches from the tree and re-pushed the branch.
> 
> If you need to rebase again for-leds-next is now up-to-date.

Okay v8 applied without issues.

Thank you.

-- 
Lee Jones [李琼斯]

