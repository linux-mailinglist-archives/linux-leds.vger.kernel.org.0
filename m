Return-Path: <linux-leds+bounces-1925-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9217C90878E
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 11:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07B28B20ED8
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 09:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0C11922C2;
	Fri, 14 Jun 2024 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSgyyPeO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32C2146D60;
	Fri, 14 Jun 2024 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357690; cv=none; b=a7EnXz22TUaMVcFgkgazN641mDpdG1c61RKKimq96xI1JeqWQRkEEw1v7CNY1xmVBrfbeo0I1hxIuOOtyghUJltevZ2f16HYm5Pnk49w4mvubhasjnjtiywRTWS5lVN+UyODr7yYMg0P/Zs145Wppi9rl6EjUpCf4kGXoaGupxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357690; c=relaxed/simple;
	bh=EXGjT4Sv9PATO+VPB+5i1m4DQR0M8M6/8Vk0s8Hztvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4aZrYVVfn7oMGhDnxB6/Gnw9q8OJjaH8Z1QCjiBEm+gj5PY/K0NTOOt2XhCAx1zCNCQqF58N1n1Ed1A30i2S97pa5Dbl/LBiIXLHef79cZHGmAFW5sBjZ45NTPAs74ObGoy6xP/kpAkSpsfwH8fJACEZnexx4rGz6t9C7x5+JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSgyyPeO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E11AC2BD10;
	Fri, 14 Jun 2024 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718357690;
	bh=EXGjT4Sv9PATO+VPB+5i1m4DQR0M8M6/8Vk0s8Hztvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSgyyPeO7vl+IF85ijGSKa2yj0nMP0AfzEqfvKd/3pqiBbj/DsiU3hOj87rp9hZnK
	 Vw5nF6JHXoPOi4Hy+4D7eC4csbv2z2OpjiAZR1o0+TziH3oQvVhjF3dbTQh9heGArb
	 krgek6efVY50iXtiMJ9rwMzgAz/65X2YZyDj8BzHZe1J2QRgV4V2DI2axflLGh069a
	 ezPWncjE4apzY5rktmMmxpf64C6Yz4Dgj4d68JoEb1TXlxcXFcEwoCVPpm1V/1raPj
	 M5F9xkEKA40jXwgfcQZMdtAlQ9JQYiCIhFys5CdgLoWX+feYkkeXMr8c+DaFecwTxi
	 W6TohMJXvEZkA==
Date: Fri, 14 Jun 2024 10:34:45 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 0/5] ChromeOS Embedded Controller LED driver
Message-ID: <20240614093445.GF3029315@google.com>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
 <20240614091220.GA3029315@google.com>
 <047fa978-d0a5-47d3-adb2-4b49e45b7ed4@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <047fa978-d0a5-47d3-adb2-4b49e45b7ed4@t-8ch.de>

On Fri, 14 Jun 2024, Thomas Weißschuh wrote:

> On 2024-06-14 10:12:20+0000, Lee Jones wrote:
> > On Thu, 13 Jun 2024, Thomas Weißschuh wrote:
> > 
> > > Add a LED driver that supports the LED devices exposed by the
> > > ChromeOS Embedded Controller.
> > > 
> > > Patch 1-3 add a utility function to the led subsystem.
> > > Patch 4 introduces the actual driver.
> > > Patch 5 registers the driver through the cros_ec mfd devices.
> > > 
> > > Currently the driver introduces some non-standard LED functions.
> > > (See "cros_ec_led_functions")
> > > 
> > > Tested on a Framework 13 AMD, Firmware 3.05.
> > > 
> > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > ---
> > > Changes in v3:
> > > - Set default_trigger explicitly as the LED core doesn't do this anymore
> > > - Only set intensity for first subled by default
> > > - Link to v2: https://lore.kernel.org/r/20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net
> > > 
> > > Changes in v2:
> > > - Cosmetic cleanups (Tzung-Bi)
> > > - Add trailing comma to MFD cell array
> > > - Rename LEDs and trigger to "chromeos" prefix, to align with kbd
> > >   backlight driver
> > > - Don't use type "rgb" anymore, they are only "multicolor"
> > > - Align commit messages and subject to subsystem standards (Lee)
> > > - Rename led_color_name() to led_get_color_name()
> > > - The same for cros_ec_led_color_name()
> > > - Link to v1: https://lore.kernel.org/r/20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net
> > > 
> > > ---
> > > Thomas Weißschuh (5):
> > >       leds: core: Introduce led_get_color_name() function
> > >       leds: multicolor: Use led_get_color_name() function
> > >       leds: core: Unexport led_colors[] array
> > >       leds: Add ChromeOS EC driver
> > >       mfd: cros_ec: Register LED subdevice
> > > 
> > >  MAINTAINERS                         |   5 +
> > >  drivers/leds/Kconfig                |  15 ++
> > >  drivers/leds/Makefile               |   1 +
> > >  drivers/leds/led-class-multicolor.c |   2 +-
> > >  drivers/leds/led-core.c             |  12 +-
> > >  drivers/leds/leds-cros_ec.c         | 299 ++++++++++++++++++++++++++++++++++++
> > >  drivers/leds/leds.h                 |   1 -
> > >  drivers/mfd/cros_ec_dev.c           |   9 ++
> > >  include/linux/leds.h                |  10 ++
> > >  9 files changed, 350 insertions(+), 4 deletions(-)
> > > ---
> > > base-commit: 2ccbdf43d5e758f8493a95252073cf9078a5fea5
> > > change-id: 20240519-cros_ec-led-3efa24e3991e
> > 
> > Applied and submitted for testing.
> > 
> > All being well, I'll follow-up with a cross-subsystem pull-request shortly
> 
> Thanks!
> 
> I'm not sure which effect this application has on the review comments
> you gave to patch 4 (thanks for those, too).
> 
> After implementing your requests, should I
> * resubmit the whole series
> * resubmit only patch 4
> * send an incremental patch on top of the series

Incremental patch please.

-- 
Lee Jones [李琼斯]

