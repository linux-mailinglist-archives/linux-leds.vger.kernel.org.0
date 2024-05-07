Return-Path: <linux-leds+bounces-1622-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88798BDD37
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 10:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A525C2849ED
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 08:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36F713C9A2;
	Tue,  7 May 2024 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4hpFepO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1EE197;
	Tue,  7 May 2024 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715071059; cv=none; b=h7Yz8k85OokL0wP66LPl3GZjKwzJ4PrdU0sMSiLKS4CDaOeWVO/QoxGV2IzHJqGWpU93UYp1PLHy98gOUsrO6Fg4hCE2hwWEgiHjgrA0Bly5SCwm4Zkt2FnTozdh3QBFwhVs8dQvCboxiod3SJIdhCAcJXDodgHL/XJ//idqfng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715071059; c=relaxed/simple;
	bh=vi9YOV5qG9HXcW2k/I0KiZGqA7SE9VSwft0G8L/iFhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMzcgGUIGDje8Z+DQqogPYWd+t6rhdYFkdFdAa+/Aohqu6aJhFNzvRx54tKXfT/TuRRGGE5SMXCH43R0YgPCEVgNBj5zOeCIJAWFtMHSFE3bNJPz2D6KSu8rzqYjAaVpBN41BgKhG2D3eHzW8XqTLmqwE6K5q1ed0B1HAmToHSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4hpFepO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFDCC2BBFC;
	Tue,  7 May 2024 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715071059;
	bh=vi9YOV5qG9HXcW2k/I0KiZGqA7SE9VSwft0G8L/iFhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4hpFepOraGCAv2dQXic6FYIBIztIKWbS33m4jm/h7+ftAUojUVY3FXg6D9ajjXyg
	 V6IagW7AoMAGy6wlnSuEp703/u8OIm8YV3bRVhu0h7W/Bz50u7+GCAlOh94QM3ED+9
	 uJLGgLbAXXUWF5znr/cI3DCYNM1B98tJlSitXD0TjyvXCJ05y0x5t/n0Xf71bY6DnJ
	 ktn4PpGouvMP0m5RJ78J0gevZ/0A1EwErQYOgT90Na9oollfL0mkx4lr/K/YglqjUY
	 jNWTNcsEXlH2d2PbkEWua99UK/A21+9Q29B7zD0ul0MGq1xwJR4GU6XvJehSe7TRRh
	 7tM5Z7Q+vKbaQ==
Date: Tue, 7 May 2024 09:37:35 +0100
From: Lee Jones <lee@kernel.org>
To: Joseph Strauss <jstrauss@mailbox.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Add multicolor support to BlinkM LED driver
Message-ID: <20240507083735.GV1227636@google.com>
References: <20240428162309.32111-1-jstrauss@mailbox.org>
 <20240503085724.GL1227636@google.com>
 <20240503232636.kbygwgo6h2c5evqc@libretux>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503232636.kbygwgo6h2c5evqc@libretux>

On Fri, 03 May 2024, Joseph Strauss wrote:

> On 24/05/03 09:57AM, Lee Jones wrote:
> > On Sun, 28 Apr 2024, Joseph Strauss wrote:
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
> > > 
> > >  Documentation/leds/leds-blinkm.rst     |  31 +++-
> > >  Documentation/leds/well-known-leds.txt |   8 +
> > >  drivers/leds/Kconfig                   |   8 +
> > >  drivers/leds/leds-blinkm.c             | 223 +++++++++++++++++--------
> > >  4 files changed, 198 insertions(+), 72 deletions(-)
> > 
> > Just tried to apply this, but checkpatch.pl has some complaints.
> > 
> > Please fix them and resubmit, thanks.
> > 
> > -- 
> > Lee Jones [李琼斯]
> I fixed the errors and warnings that resulted from my patch, but am I correct in assuming I am not responsible for fixing the warnings from other parts of the file? It would make the patch messier is my concern.

[line wrap?]

Yes, you are correct.  It's not on you to fix existing issues.

-- 
Lee Jones [李琼斯]

