Return-Path: <linux-leds+bounces-2150-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD319186E6
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 857751F213F3
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8698D18FC87;
	Wed, 26 Jun 2024 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIErzIgi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121318FC63;
	Wed, 26 Jun 2024 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418060; cv=none; b=L3kSG3NzSOusn8ZXinKXY92CvhxcJYqW4O1MuRKzBBC4rnLu+PK1u1aKeS7arn9Mp2bug5KMoSpqfRAv1wmlSX4mBpjPVxfGm3Zn4J/c2FWvQSejoT0gUDL2ZjGCzR0/gFiNbKGrL3PfH0YPJkbPZW7BqJIMwJerXJrTOVPpvnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418060; c=relaxed/simple;
	bh=D4ho1l/pL1FkcDyqexKhT96WP/ewWmoAMjdYJVweRPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPR8XijWJhl3GHePFVFPnu8NARJQQ7xDELCY5mlhnI4LZ4LvVrHK5FmWpT8BKkyd3NjRSEukXi97MfcHeh3iE6HIS6toED0LepIZIk1Z4oPdXjnyB5KtzJqdonq+m+BDtfBqLqIcajwETC1Z/uZwFB7F4OePxzWnOHf8F+YhxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIErzIgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE09C32789;
	Wed, 26 Jun 2024 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719418059;
	bh=D4ho1l/pL1FkcDyqexKhT96WP/ewWmoAMjdYJVweRPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIErzIgiRGFGbT0IZnhD/Hgq/RBSJ1PmnPsiU2XN+yYTeh8XY+woAEs9i4bLE/OLo
	 BLR1CW9ECLiExQg5QKklCU5OcA569AB1o86i+kycwXJ1YbxTJkN64PmqMbbVw/HoLv
	 2cjUQsEQVc+bxHCNiiatFooezjpDvt9iplU3AzOAkmMpubzdeC7ypv5OdUqb4UW4OS
	 dpZ9j7IIBxaAxMgc/i3i2w4jRc0nYv3b+JTgesqad9f/oxskiZcnEtZRC1Gl20bam7
	 CrzPbb6RC+vN8il5y738cojC+ApKEP7Ilx3PjiwNg0S8DCBwtVxS2sjpIQFbGZg0w4
	 0P7A/f7Ohv3WQ==
Date: Wed, 26 Jun 2024 17:07:35 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/20] leds: leds-lp55xx: overhaul driver
Message-ID: <20240626160735.GA2532839@google.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
 <20240626154255.GC2504017@google.com>
 <667c3a4a.5d0a0220.bf738.7cca@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <667c3a4a.5d0a0220.bf738.7cca@mx.google.com>

On Wed, 26 Jun 2024, Christian Marangi wrote:

> On Wed, Jun 26, 2024 at 04:42:55PM +0100, Lee Jones wrote:
> > On Thu, 20 Jun 2024, Christian Marangi wrote:
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
> > > Changes v7:
> > > - Add Suggested-by tag
> > > - Fix checkpatch error for complex macro (rework define)
> > > - Add missing values for fader conversion
> > > - Align some function with redundant new line
> > > - Capitalize every commit title
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
> > >   dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
> > >   dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
> > >   leds: leds-lp55xx: Generalize stop_all_engine OP
> > >   leds: leds-lp55xx: Generalize probe/remove functions
> > >   leds: leds-lp55xx: Generalize load_engine function
> > >   leds: leds-lp55xx: Generalize load_engine_and_select_page function
> > >   leds: leds-lp55xx: Generalize run_engine function
> > >   leds: leds-lp55xx: Generalize update_program_memory function
> > >   leds: leds-lp55xx: Generalize firmware_loaded function
> > >   leds: leds-lp55xx: Generalize led_brightness function
> > >   leds: leds-lp55xx: Generalize multicolor_brightness function
> > >   leds: leds-lp55xx: Generalize set_led_current function
> > >   leds: leds-lp55xx: Generalize turn_off_channels function
> > >   leds: leds-lp55xx: Generalize stop_engine function
> > >   leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
> > >   leds: leds-lp55xx: Generalize sysfs engine_leds
> > >   leds: leds-lp55xx: Generalize sysfs master_fader
> > >   leds: leds-lp55xx: Support ENGINE program up to 128 bytes
> > >   leds: leds-lp55xx: Drop deprecated defines
> > >   leds: leds-lp5569: Add support for Texas Instruments LP5569
> > > 
> > >  .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
> > >  drivers/leds/Kconfig                          |  16 +-
> > >  drivers/leds/Makefile                         |   1 +
> > >  drivers/leds/leds-lp5521.c                    | 405 +---------
> > >  drivers/leds/leds-lp5523.c                    | 734 ++---------------
> > >  drivers/leds/leds-lp5562.c                    | 261 +-----
> > >  drivers/leds/leds-lp5569.c                    | 544 +++++++++++++
> > >  drivers/leds/leds-lp55xx-common.c             | 743 +++++++++++++++++-
> > >  drivers/leds/leds-lp55xx-common.h             | 163 ++--
> > >  drivers/leds/leds-lp8501.c                    | 313 +-------
> > >  10 files changed, 1540 insertions(+), 1651 deletions(-)
> > >  create mode 100644 drivers/leds/leds-lp5569.c
> > 
> > For whatever reason, this no longer applies.
> > 
> > Please rebase it on Linux -next or for-leds-next and resubmit.
> >
> 
> Hi Lee.,
> 
> I just checked and yes there is to rebase the series due to
> c0e3d2beeb03 ("leds: Drop explicit initialization of struct
> i2c_device_id::driver_data to 0")
> 
> But I notice that something went bad in reverting some commits from the
> v7 series and in for-leds-next there are still 3 commit to drop
> 
> mainly 
> - 3bed6364ffd0057bd10c081d2e24aa7e8555e0a8
> - 3bcc6d6ad7821aa459826592f830d76a3dc6f79f
> - 5a402b40c651baf758ad884aed36c0ea70cd8b1e
> 
> I'm sending v8 with everything rebased but please keep in mind that
> those commits needs to be reverted as the leds one also somehow got half
> applied (no idea what happen)

This must be related to the tooling error that happened recently.

I have removed those 3 patches from the tree and re-pushed the branch.

If you need to rebase again for-leds-next is now up-to-date.

-- 
Lee Jones [李琼斯]

