Return-Path: <linux-leds+bounces-1924-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F5908770
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 11:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EBE31C24348
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 09:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3F4148828;
	Fri, 14 Jun 2024 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="J9dp0fEv"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30EE481D0;
	Fri, 14 Jun 2024 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357477; cv=none; b=QPdfEU4IIP+8i0MVvDv3CkGn2A06m+JzowKS2mWAiXs5gV+QkK4BWMVI7mhgcKgIbr6yS/atHW+rHY9Ul1Z4QR4mmNqmRsTqx3Yzo7W4l14geT8xq+GAJPbIElZkPkB2jb/Y6AAEClxCfMRoySnHbxubm/r4hV+tdb8KqKOyeVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357477; c=relaxed/simple;
	bh=4ceCkLbXRmlPcpC7DXa3ORY5EqwpZcjocMUx6eOdwqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmu8oC0JPLGgxZB2tAPOfIlmcN7Zef42O/2ygjK2u5Cj56gz9GHruJVFOiDwdPhK3nP8VGbwoSv1so1Sbs2E1wRzKgcQXjiq3MoFeo/f4eJ0TYW4gD8ZD+IL8PV2gd+S6u4N0DnmGlK+tFRw0CRvmyRllNq89FJ+d/frge9rZuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=J9dp0fEv; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718357471;
	bh=4ceCkLbXRmlPcpC7DXa3ORY5EqwpZcjocMUx6eOdwqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9dp0fEv+bRHXP/2V/m0DI6PsfWRGV6mPr5DFmcLtsGZiZGdmrGk9IcYCejxZ0u5G
	 zzeKROMeYX7RxmjadVogL9bcPGUHf2EWgzKCN1qPahxksBq601tZIzUhFr0JajqFU4
	 4PjYvWWCcQiGlCMcB0QiOCwZuiMYtxleVCDmGvtA=
Date: Fri, 14 Jun 2024 11:31:11 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dustin Howett <dustin@howett.net>, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 0/5] ChromeOS Embedded Controller LED driver
Message-ID: <047fa978-d0a5-47d3-adb2-4b49e45b7ed4@t-8ch.de>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
 <20240614091220.GA3029315@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614091220.GA3029315@google.com>

On 2024-06-14 10:12:20+0000, Lee Jones wrote:
> On Thu, 13 Jun 2024, Thomas Weißschuh wrote:
> 
> > Add a LED driver that supports the LED devices exposed by the
> > ChromeOS Embedded Controller.
> > 
> > Patch 1-3 add a utility function to the led subsystem.
> > Patch 4 introduces the actual driver.
> > Patch 5 registers the driver through the cros_ec mfd devices.
> > 
> > Currently the driver introduces some non-standard LED functions.
> > (See "cros_ec_led_functions")
> > 
> > Tested on a Framework 13 AMD, Firmware 3.05.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > Changes in v3:
> > - Set default_trigger explicitly as the LED core doesn't do this anymore
> > - Only set intensity for first subled by default
> > - Link to v2: https://lore.kernel.org/r/20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net
> > 
> > Changes in v2:
> > - Cosmetic cleanups (Tzung-Bi)
> > - Add trailing comma to MFD cell array
> > - Rename LEDs and trigger to "chromeos" prefix, to align with kbd
> >   backlight driver
> > - Don't use type "rgb" anymore, they are only "multicolor"
> > - Align commit messages and subject to subsystem standards (Lee)
> > - Rename led_color_name() to led_get_color_name()
> > - The same for cros_ec_led_color_name()
> > - Link to v1: https://lore.kernel.org/r/20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net
> > 
> > ---
> > Thomas Weißschuh (5):
> >       leds: core: Introduce led_get_color_name() function
> >       leds: multicolor: Use led_get_color_name() function
> >       leds: core: Unexport led_colors[] array
> >       leds: Add ChromeOS EC driver
> >       mfd: cros_ec: Register LED subdevice
> > 
> >  MAINTAINERS                         |   5 +
> >  drivers/leds/Kconfig                |  15 ++
> >  drivers/leds/Makefile               |   1 +
> >  drivers/leds/led-class-multicolor.c |   2 +-
> >  drivers/leds/led-core.c             |  12 +-
> >  drivers/leds/leds-cros_ec.c         | 299 ++++++++++++++++++++++++++++++++++++
> >  drivers/leds/leds.h                 |   1 -
> >  drivers/mfd/cros_ec_dev.c           |   9 ++
> >  include/linux/leds.h                |  10 ++
> >  9 files changed, 350 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 2ccbdf43d5e758f8493a95252073cf9078a5fea5
> > change-id: 20240519-cros_ec-led-3efa24e3991e
> 
> Applied and submitted for testing.
> 
> All being well, I'll follow-up with a cross-subsystem pull-request shortly

Thanks!

I'm not sure which effect this application has on the review comments
you gave to patch 4 (thanks for those, too).

After implementing your requests, should I
* resubmit the whole series
* resubmit only patch 4
* send an incremental patch on top of the series
?


Thomas

