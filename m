Return-Path: <linux-leds+bounces-1796-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4FB8D6CD0
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 01:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07F60B20B8D
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 23:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EDA80032;
	Fri, 31 May 2024 23:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vhWKp5wO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568708C06
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 23:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717197650; cv=none; b=tQZ6SSORFnPsG1h2DxAfDLfynDOtk5rJcpYQ6G4liZ9ShulgIMp4WEaYL3K/IEDQUwOWgPHsJTNv6ODv2u9TN40ULE652a4Hun0sbX1ZjkJb6Gs1q5e46jzecA9EJ5EU/6fQW+xLCEdQWPMZyAxN10mEoJJ6sR8QloKV+OpWkNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717197650; c=relaxed/simple;
	bh=QM2xc2d4GuVLVUyWO8sKv4Mof/dZ63yGpWwVNW4kQow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDrxhZ3ptA/E4E9zP6o/rQ20vl0EOhYP2culUi5R+ozSMaXwoBE5h68F1/rAo/Ur8axfGQiC5ShJOf9xQj9SWTGXR2JlF0MgOvAfcqAqJLTW497SRI344vG83N4m9D7i+zSIsqDdtPV5v2N2SWZT44T2HF8MvbRJmBq5Bb2Rdh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vhWKp5wO; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4VrfHS0Mn5z9scV;
	Sat,  1 Jun 2024 01:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1717197636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8Ant7/X6GwAG4+7U4wspkLXR8+I3V11VX/H6x/AvhY=;
	b=vhWKp5wOYSC+kUvN4RPTAZdr2ww9XdMrs4NT9ZywyUt0+VAPiV+M94pSsJX0fYND6xjliQ
	YC1qga5S1ijb7OlHU7XT0bA/YFGjP44t/0KT5mvocRLkgD2u5C/aGXPcuIKz2HaFMhZeFC
	Ek5rjMAMOhHDTx8PpGPOxLuFizpKSOquTFzT8VDSCGdWtvE0jmJfpvVhwxAvi9xpHzwd1h
	tjWokwV79aguksG5X0wvFHaU7zNrj4xoTySZ9wJlQ7hwjW6w2Dk+gsWHrA2WI/ubOmFCxO
	3j+Q/1I2cMiJA4tcJQ+WyUI5ui9kdRAg0gtm1McOw1+xM8CvVy2HtPynoCb1RA==
Date: Fri, 31 May 2024 18:20:31 -0500
From: Joseph Strauss <jstrauss@mailbox.org>
To: Lee Jones <lee@kernel.org>
Cc: pavel@ucw.cz, jansimon.moeller@gmx.de, conor@kernel.org,
	christophe.jaillet@wanadoo.fr, linux-leds@vger.kernel.org
Subject: Re: [PATCH v7] Add multicolor support to BlinkM LED driver
Message-ID: <20240531232031.u5mphuqrwin533rj@libretux>
References: <20240506201905.789376-1-jstrauss@mailbox.org>
 <20240531103840.GC1005600@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531103840.GC1005600@google.com>
X-MBO-RS-META: i7qsdox5896i1tk4dmtycoqpckkuz3op
X-MBO-RS-ID: 2c5e2976e6d9e1db543

On 24/05/31 11:38AM, Lee Jones wrote:
> On Mon, 06 May 2024, Joseph Strauss wrote:
> 
> > Add multicolor support to the BlinkM driver, making it easier to control
> > from userspace. The BlinkM LED is a programmable RGB LED. The driver
> > currently supports only the regular LED sysfs class, resulting in the
> > creation of three distinct classes, one for red, green, and blue. The
> > user then has to input three values into the three seperate brightness
> > files within those classes. The multicolor LED framework makes the
> > device easier to control with the multi_intensity file: the user can
> > input three values at once to form a color, while still controlling the
> > lightness with the brightness file.
> > 
> > The main struct blinkm_led has changed slightly. The struct led_classdev
> > for the regular sysfs classes remain. The blinkm_probe function checks
> > CONFIG_LEDS_BLINKM_MULTICOLOR to decide whether to load the seperate
> > sysfs classes or the single multicolor one, but never both. The
> > blinkm_set_mc_brightness() function had to be added to calculate the
> > three color components and then set the fields of the blinkm_data
> > structure accordingly.
> > 
> > Signed-off-by: Joseph Strauss <jstrauss@mailbox.org>
> > ---
> > Changes in v2:
> > - Replaced instances of the constant 3 with NUM_LEDS, where applicable
> > - Fixed formatting errors
> > - Replaced loop inside of blinkm_set_mc_brightness() with equivalent
> >   statements
> > - Changed id of multicolor class from 4 to 3
> > - Replaced call to devm_kmalloc_array() with devm_kcalloc()
> > Changes in v3:
> > - Add CONFIG_LEDS_BLINKM_MULTICOLOR to check whether to use multicolor
> >   funcitonality
> > - Extend well-known-leds.txt to include standard names for RGB and indicator
> >   LEDS
> > - Change name of Blinkm sysfs class according to well-known-leds.txt
> > - Simplify struct blinkm_led and struct blinkm_data
> > - Remove magic numbers
> > - Fix formatting errors
> > - Remove unrelated changes
> > Changes in v4:
> > - Fix indentation
> > - Add default case to switch statement
> > Changes in v5:
> > - Fix warnings related to snprintf on s390 architecture, reported by
> >   0-DAY CI Kernel Test Service
> > Changes in v6:
> > - Refactored struct blinkm_led to use a union
> > - Refactored blinkm_probe()
> > - Clarified documentation
> > Changes in v7:
> > - Fix formatting and spelling errors
> > 
> >  Documentation/leds/leds-blinkm.rst     |  31 +++-
> >  Documentation/leds/well-known-leds.txt |   8 +
> >  drivers/leds/Kconfig                   |   8 +
> >  drivers/leds/leds-blinkm.c             | 224 +++++++++++++++++--------
> >  4 files changed, 199 insertions(+), 72 deletions(-)
> 
> Applying patch(es)
> Applying: Add multicolor support to BlinkM LED driver
> Using index info to reconstruct a base tree...
> M	Documentation/leds/well-known-leds.txt
> M	drivers/leds/Kconfig
> M	drivers/leds/leds-blinkm.c
> Checking patch Documentation/leds/leds-blinkm.rst...
> Checking patch Documentation/leds/well-known-leds.txt...
> Checking patch drivers/leds/Kconfig...
> Checking patch drivers/leds/leds-blinkm.c...
> Applied patch Documentation/leds/leds-blinkm.rst cleanly.
> Applied patch Documentation/leds/well-known-leds.txt cleanly.
> Applied patch drivers/leds/Kconfig cleanly.
> Applied patch drivers/leds/leds-blinkm.c cleanly.
> Falling back to patching base and 3-way merge...
> error: Your local changes to the following files would be overwritten by merge:
> 	Documentation/leds/leds-blinkm.rst
> 	Documentation/leds/well-known-leds.txt
> 	drivers/leds/Kconfig
> 	drivers/leds/leds-blinkm.c
> Please commit your changes or stash them before you merge.
> Aborting
> error: Failed to merge in the changes.
> Patch failed at 0001 Add multicolor support to BlinkM LED driver
> 
> -- 
> Lee Jones [李琼斯]
Hi,
I am having trouble recreating this issue. Maybe I am misunderstanding
the maintainer workflow. I am working on the for-next branch of
pavel/linux-leds.git. When I apply my generated patch file on a
freshly cloned repository with `git am`, I don't get any errors. Any
help is appreciated.

Joe Strauss

