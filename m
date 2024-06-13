Return-Path: <linux-leds+bounces-1893-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F2590743F
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 15:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEE401C23BF4
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 13:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE46BE4E;
	Thu, 13 Jun 2024 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdm65rHI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EF3161
	for <linux-leds@vger.kernel.org>; Thu, 13 Jun 2024 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286578; cv=none; b=D3DqMVdsjZ4iCuNioDYsoDBLzjf9Ep5sTdG53QGzEY3mVK42rDQRFew47nOH9DahDGarxBBHQ84S1Byz1LW5mjdQeKB4UXAmk9yHUBvR05isMY+wZA3EN56gQqRv838Vpp++8OvsSOOE1ORomKVqNtMGx/S/bP2T4iz7T7FQu2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286578; c=relaxed/simple;
	bh=7UkX5jhCQbyLeSS+OZoOwECX0qmnFLt3BSxEUPkSYh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fm8p0MfrD22lbIGnkh+u1/76aTflPhZMQ4ppQ9ux1u+OoDws/ix2G0hW/7ygshAzCAv/lexgKLmehkBEnMKKCSoVWRo6kFH5oHEq7MbA59kj9GBrDzjJqxQTXBbnWzAwkVbiFVzC3e6qkdaHPYn26F1JPFkllkLzFhmM0I/Trsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdm65rHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3CEC2BBFC;
	Thu, 13 Jun 2024 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718286577;
	bh=7UkX5jhCQbyLeSS+OZoOwECX0qmnFLt3BSxEUPkSYh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdm65rHItFTjRCMr+a3Zi9ZTGusEddJlEHwhKC99vl8Oohqw3c0/0PFNLPtZVCmY7
	 MPhZv0JNOWYHZQHkOAppTz+kNjEcleelNNTgTgA1JZAarwEQIDV8RsqFW53d2WG2vd
	 c3YLxFyQdBY5Q6NmaCM7513JY+hurSsPEAkd1anEwNKhDL02YPWGmL5cXUtzosFmHX
	 aBcNifKmHCjpY4GqnJg3m+S6BGFH2Ab92yL9AoYdGKdVENc8KCk3RMm91XrhYqYr/g
	 y39hOrSDCp8yc4caprmR18t2w0IZNSzOoCscN4BTlFm/5N0NgZo8w+MrIohQVDiTq/
	 s6KfV+KUm0RDA==
Date: Thu, 13 Jun 2024 14:49:33 +0100
From: Lee Jones <lee@kernel.org>
To: Joseph Strauss <jstrauss@mailbox.org>
Cc: pavel@ucw.cz, jansimon.moeller@gmx.de, conor@kernel.org,
	christophe.jaillet@wanadoo.fr, linux-leds@vger.kernel.org
Subject: Re: [PATCH v7] Add multicolor support to BlinkM LED driver
Message-ID: <20240613134933.GC2561462@google.com>
References: <20240506201905.789376-1-jstrauss@mailbox.org>
 <20240531103840.GC1005600@google.com>
 <20240531232031.u5mphuqrwin533rj@libretux>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531232031.u5mphuqrwin533rj@libretux>

On Fri, 31 May 2024, Joseph Strauss wrote:

> On 24/05/31 11:38AM, Lee Jones wrote:
> > On Mon, 06 May 2024, Joseph Strauss wrote:
> > 
> > > Add multicolor support to the BlinkM driver, making it easier to control
> > > from userspace. The BlinkM LED is a programmable RGB LED. The driver
> > > currently supports only the regular LED sysfs class, resulting in the
> > > creation of three distinct classes, one for red, green, and blue. The
> > > user then has to input three values into the three seperate brightness
> > > files within those classes. The multicolor LED framework makes the
> > > device easier to control with the multi_intensity file: the user can
> > > input three values at once to form a color, while still controlling the
> > > lightness with the brightness file.
> > > 
> > > The main struct blinkm_led has changed slightly. The struct led_classdev
> > > for the regular sysfs classes remain. The blinkm_probe function checks
> > > CONFIG_LEDS_BLINKM_MULTICOLOR to decide whether to load the seperate
> > > sysfs classes or the single multicolor one, but never both. The
> > > blinkm_set_mc_brightness() function had to be added to calculate the
> > > three color components and then set the fields of the blinkm_data
> > > structure accordingly.
> > > 
> > > Signed-off-by: Joseph Strauss <jstrauss@mailbox.org>
> > > ---
> > > Changes in v2:
> > > - Replaced instances of the constant 3 with NUM_LEDS, where applicable
> > > - Fixed formatting errors
> > > - Replaced loop inside of blinkm_set_mc_brightness() with equivalent
> > >   statements
> > > - Changed id of multicolor class from 4 to 3
> > > - Replaced call to devm_kmalloc_array() with devm_kcalloc()
> > > Changes in v3:
> > > - Add CONFIG_LEDS_BLINKM_MULTICOLOR to check whether to use multicolor
> > >   funcitonality
> > > - Extend well-known-leds.txt to include standard names for RGB and indicator
> > >   LEDS
> > > - Change name of Blinkm sysfs class according to well-known-leds.txt
> > > - Simplify struct blinkm_led and struct blinkm_data
> > > - Remove magic numbers
> > > - Fix formatting errors
> > > - Remove unrelated changes
> > > Changes in v4:
> > > - Fix indentation
> > > - Add default case to switch statement
> > > Changes in v5:
> > > - Fix warnings related to snprintf on s390 architecture, reported by
> > >   0-DAY CI Kernel Test Service
> > > Changes in v6:
> > > - Refactored struct blinkm_led to use a union
> > > - Refactored blinkm_probe()
> > > - Clarified documentation
> > > Changes in v7:
> > > - Fix formatting and spelling errors
> > > 
> > >  Documentation/leds/leds-blinkm.rst     |  31 +++-
> > >  Documentation/leds/well-known-leds.txt |   8 +
> > >  drivers/leds/Kconfig                   |   8 +
> > >  drivers/leds/leds-blinkm.c             | 224 +++++++++++++++++--------
> > >  4 files changed, 199 insertions(+), 72 deletions(-)
> > 
> > Applying patch(es)
> > Applying: Add multicolor support to BlinkM LED driver
> > Using index info to reconstruct a base tree...
> > M	Documentation/leds/well-known-leds.txt
> > M	drivers/leds/Kconfig
> > M	drivers/leds/leds-blinkm.c
> > Checking patch Documentation/leds/leds-blinkm.rst...
> > Checking patch Documentation/leds/well-known-leds.txt...
> > Checking patch drivers/leds/Kconfig...
> > Checking patch drivers/leds/leds-blinkm.c...
> > Applied patch Documentation/leds/leds-blinkm.rst cleanly.
> > Applied patch Documentation/leds/well-known-leds.txt cleanly.
> > Applied patch drivers/leds/Kconfig cleanly.
> > Applied patch drivers/leds/leds-blinkm.c cleanly.
> > Falling back to patching base and 3-way merge...
> > error: Your local changes to the following files would be overwritten by merge:
> > 	Documentation/leds/leds-blinkm.rst
> > 	Documentation/leds/well-known-leds.txt
> > 	drivers/leds/Kconfig
> > 	drivers/leds/leds-blinkm.c
> > Please commit your changes or stash them before you merge.
> > Aborting
> > error: Failed to merge in the changes.
> > Patch failed at 0001 Add multicolor support to BlinkM LED driver
> > 
> > -- 
> > Lee Jones [李琼斯]
> Hi,
> I am having trouble recreating this issue. Maybe I am misunderstanding
> the maintainer workflow. I am working on the for-next branch of
> pavel/linux-leds.git. When I apply my generated patch file on a
> freshly cloned repository with `git am`, I don't get any errors. Any
> help is appreciated.

Pavel's for-next branch is 18 months old.

Use Linux -next.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/

-- 
Lee Jones [李琼斯]

