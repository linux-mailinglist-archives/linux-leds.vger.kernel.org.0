Return-Path: <linux-leds+bounces-1774-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0BD8D660F
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 17:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D621C21014
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2028130AFC;
	Fri, 31 May 2024 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QswN9q1H"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D222F78289;
	Fri, 31 May 2024 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717170574; cv=none; b=t1BzKpkDjj/lXawJFwydUY6L6XlktgG7d3HowhGtGfF67BBS5Rnx4SECKH/AitvqR8MajKWtsa92oP6jgZgvXJX4L4PJDCgD503/3coPcttQi11UpS7IzrTVfdOfTsBWAAJBsxtBlxjP5guvE+61shI8+rG9VNKOhN43963tqEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717170574; c=relaxed/simple;
	bh=dSdUjRaem32dqr4ztrjnA5+hEez5uX6uiblldcVZCww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sM9KDiD+8DsNUB0gGugMfJ12ZHLM5y1AyYRmRZWEdIpF1JrK1Zy6xXueB6Ds4LzP/p/C9y1CimCtxwdaLf7qddUzT4MKlHodA9kbPLwoyR78F44rmPwPKxEteBJ7X9jzqf4QpR1twHKVXMH0cS/blg+0ErPkuFbuycgxFxT/5go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=QswN9q1H; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717170566;
	bh=dSdUjRaem32dqr4ztrjnA5+hEez5uX6uiblldcVZCww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QswN9q1H/RFpOpZIhJMukW4xN0xYF8NvsMBDg4UUJ1HCZSkEuDadiUO78PUyg9Zef
	 lvuMy7ouIeto76BaUEAm2glyuFG+gYOIELkKw7ltvwztQieNivVpbGENMlkJtVqfmu
	 QMNryCFCReYDYhYE0R2KI/Sexl0WVbnL574XFio4=
Date: Fri, 31 May 2024 17:49:26 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, linux-leds@vger.kernel.org, 
	Rajas Paranjpe <paranjperajas@gmail.com>
Subject: Re: [PATCH v3 0/4] cros_kbd_led_backlight: allow binding through
 cros_ec mfd device
Message-ID: <0172f4a6-27da-43ca-8df3-93279d1ef903@t-8ch.de>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240531153530.GP1005600@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531153530.GP1005600@google.com>

On 2024-05-31 16:35:30+0000, Lee Jones wrote:
> On Sun, 26 May 2024, Thomas Weißschuh wrote:
> 
> > Extend the cros_ec MFD device to also load cros_kbd_led_backlight
> > when the EC reports EC_FEATURE_PWM_KEYB.
> > As the driver can now be probed multiple times, some preparation in the
> > LED core is necessary to avoid name collisions.
> > 
> > Patch 1 is a general cleanup for the LED core.
> > Patch 2 modifies the LED core to skip the default collision handling.
> > Patch 3 adds the new probing logic to cros_kbd_led_backlight.
> > Patch 4 wires up the driver to the cros_ec mfd devices.
> > 
> > The helper keyboard_led_is_mfd_device is a bit iffy.
> > But using match data doesn't work.
> > 
> > * driver_data from platform_device_id is overwritten by the mfd platform data
> > * Setting the driver_data in drivers/mfd/cros_ec_dev.c would expose the
> > internals of cros_kbd_led_backlight
> > 
> > Tested on a Framework 13 AMD, Firmware 3.05, and a Jinlon Chromebook.
> > 
> > To: Lee Jones <lee@kernel.org>
> > To: Benson Leung <bleung@chromium.org>
> > To: Guenter Roeck <groeck@chromium.org>
> > To: Tzung-Bi Shih <tzungbi@kernel.org>
> > To: Pavel Machek <pavel@ucw.cz>
> > Cc: chrome-platform@lists.linux.dev
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Dustin Howett <dustin@howett.net>
> > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > Cc: linux-leds@vger.kernel.org
> > Cc: Rajas Paranjpe <paranjperajas@gmail.com>
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > 
> > Changes in v3:
> > - Avoid probing multiple times (Confirmed by Rajas)
> > - Add Kconfig dependency on MFD_CROS_EC_DEV
> > - Link to v2: https://lore.kernel.org/r/20240511-cros_ec-kbd-led-framework-v2-0-b20c48109e46@weissschuh.net
> > 
> > Changes in v2:
> > - Fix build with CONFIG_MFD_CROS_EC_DEV=n (kernel test robot)
> > - Split out mfd registration into own commit (Lee)
> > - Simplify keyboard_led_is_mfd_device() with mfd_get_cell()
> > - Link to v1: https://lore.kernel.org/r/20240505-cros_ec-kbd-led-framework-v1-1-bfcca69013d2@weissschuh.net
> > 
> > ---
> > Thomas Weißschuh (4):
> >       leds: class: warn about name collisions earlier
> >       leds: add flag to avoid automatic renaming of led devices
> >       platform/chrome: cros_kbd_led_backlight: allow binding through mfd device
> >       mfd: cros_ec: Register keyboard backlight subdevice
> > 
> >  drivers/leds/led-class.c                         |  9 +++---
> >  drivers/mfd/cros_ec_dev.c                        |  9 ++++++
> >  drivers/platform/chrome/Kconfig                  |  2 +-
> >  drivers/platform/chrome/cros_kbd_led_backlight.c | 40 ++++++++++++++++++++++--
> >  include/linux/leds.h                             |  1 +
> >  5 files changed, 54 insertions(+), 7 deletions(-)
> 
> Looks okay.

Thanks.

> Does the platform patch need to be applied with the others?

Each patch depends on all its predecessors.
(but I'm not sure I understood your question)

