Return-Path: <linux-leds+bounces-1775-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E28D6625
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 17:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105AD1F23637
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE1D6F2EB;
	Fri, 31 May 2024 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIK5Vxsb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83824A0E;
	Fri, 31 May 2024 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717170842; cv=none; b=szcjUzDPIOUgUNmlCkdMsshMVcvfqQObG4jXlZQbhFYXEpF3Jzwd5rxeZUZP4TfVtQ5FSJqh14mXH+PUEepPc+5sqx/1U83RyNSGETJvDaiG2PNZp8D/8EuoER1AotvJMTCgfI0pFvLBTRMvhw/VceLKlJEQc9TQLMcrdaY8eXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717170842; c=relaxed/simple;
	bh=clEhMBQhOnc6VlQ3Vti0004ynxmiz0137WRaFdl3z30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtXUkM6PGvhGda3xhrLvs1tL6RomCB81vPAfbOSwa9kDFzN8mGz3+wc0l94/2zqCFhxXAFDFwfHr9CShRaPjmsipSdenYlLCZPzenla1aGXgpwK+DL+PfgnHcuH7T1N0ePttxZ9J+4PqWZ9hR8FUIBuBmpzbAMkKxlQ6CiZ+W+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIK5Vxsb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE19C116B1;
	Fri, 31 May 2024 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717170841;
	bh=clEhMBQhOnc6VlQ3Vti0004ynxmiz0137WRaFdl3z30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIK5VxsbfTIt8AEMpSZe/8oKBm48koiX8Ef4GdDO7CUlgpChyoyJvrK2lA8Ho2W7e
	 MzA9URB9m8hEfWT+DcFONjlKiAS6zDovz4VYTWSOCer/JHqT6Gp+B1Q+LUjxoxDIK+
	 uSAFVoSOizpc7jHCnF4AOKAIxgWZfH5ZOLtnsSroygJmLF3/DR16AzXXYnPU/UsoDQ
	 5nCRcGMFeM04O0zLDDeMOS1BQvPevH9dyVOh25ayi7jpCydMc6/FhMrLDOJ0+L5dfy
	 hVRiwe0pOHsYDeqRx3qvNuJa1RZu6lX3adZPpzzbB8zFWmiBkEebUywokzOt9a+CgE
	 bVQlqLdvoGNwg==
Date: Fri, 31 May 2024 16:53:56 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-leds@vger.kernel.org,
	Rajas Paranjpe <paranjperajas@gmail.com>
Subject: Re: [PATCH v3 0/4] cros_kbd_led_backlight: allow binding through
 cros_ec mfd device
Message-ID: <20240531155356.GR1005600@google.com>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240531153530.GP1005600@google.com>
 <0172f4a6-27da-43ca-8df3-93279d1ef903@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0172f4a6-27da-43ca-8df3-93279d1ef903@t-8ch.de>

On Fri, 31 May 2024, Thomas Weißschuh wrote:

> On 2024-05-31 16:35:30+0000, Lee Jones wrote:
> > On Sun, 26 May 2024, Thomas Weißschuh wrote:
> > 
> > > Extend the cros_ec MFD device to also load cros_kbd_led_backlight
> > > when the EC reports EC_FEATURE_PWM_KEYB.
> > > As the driver can now be probed multiple times, some preparation in the
> > > LED core is necessary to avoid name collisions.
> > > 
> > > Patch 1 is a general cleanup for the LED core.
> > > Patch 2 modifies the LED core to skip the default collision handling.
> > > Patch 3 adds the new probing logic to cros_kbd_led_backlight.
> > > Patch 4 wires up the driver to the cros_ec mfd devices.
> > > 
> > > The helper keyboard_led_is_mfd_device is a bit iffy.
> > > But using match data doesn't work.
> > > 
> > > * driver_data from platform_device_id is overwritten by the mfd platform data
> > > * Setting the driver_data in drivers/mfd/cros_ec_dev.c would expose the
> > > internals of cros_kbd_led_backlight
> > > 
> > > Tested on a Framework 13 AMD, Firmware 3.05, and a Jinlon Chromebook.
> > > 
> > > To: Lee Jones <lee@kernel.org>
> > > To: Benson Leung <bleung@chromium.org>
> > > To: Guenter Roeck <groeck@chromium.org>
> > > To: Tzung-Bi Shih <tzungbi@kernel.org>
> > > To: Pavel Machek <pavel@ucw.cz>
> > > Cc: chrome-platform@lists.linux.dev
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: Dustin Howett <dustin@howett.net>
> > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > Cc: linux-leds@vger.kernel.org
> > > Cc: Rajas Paranjpe <paranjperajas@gmail.com>
> > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > 
> > > Changes in v3:
> > > - Avoid probing multiple times (Confirmed by Rajas)
> > > - Add Kconfig dependency on MFD_CROS_EC_DEV
> > > - Link to v2: https://lore.kernel.org/r/20240511-cros_ec-kbd-led-framework-v2-0-b20c48109e46@weissschuh.net
> > > 
> > > Changes in v2:
> > > - Fix build with CONFIG_MFD_CROS_EC_DEV=n (kernel test robot)
> > > - Split out mfd registration into own commit (Lee)
> > > - Simplify keyboard_led_is_mfd_device() with mfd_get_cell()
> > > - Link to v1: https://lore.kernel.org/r/20240505-cros_ec-kbd-led-framework-v1-1-bfcca69013d2@weissschuh.net
> > > 
> > > ---
> > > Thomas Weißschuh (4):
> > >       leds: class: warn about name collisions earlier
> > >       leds: add flag to avoid automatic renaming of led devices
> > >       platform/chrome: cros_kbd_led_backlight: allow binding through mfd device
> > >       mfd: cros_ec: Register keyboard backlight subdevice
> > > 
> > >  drivers/leds/led-class.c                         |  9 +++---
> > >  drivers/mfd/cros_ec_dev.c                        |  9 ++++++
> > >  drivers/platform/chrome/Kconfig                  |  2 +-
> > >  drivers/platform/chrome/cros_kbd_led_backlight.c | 40 ++++++++++++++++++++++--
> > >  include/linux/leds.h                             |  1 +
> > >  5 files changed, 54 insertions(+), 7 deletions(-)
> > 
> > Looks okay.
> 
> Thanks.
> 
> > Does the platform patch need to be applied with the others?
> 
> Each patch depends on all its predecessors.
> (but I'm not sure I understood your question)

Does the Platform patch have 'build-time' deps on the others?

-- 
Lee Jones [李琼斯]

