Return-Path: <linux-leds+bounces-1772-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198E8D65DC
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 17:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 211D0B25EC8
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D262E7710B;
	Fri, 31 May 2024 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToNkfuVf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F8768F0;
	Fri, 31 May 2024 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717169735; cv=none; b=SG4bW2/NYio7aIgLfbVp2OP0xP66Yinr25qocOq4pGlKvLSFW4yQBSFCeS7r83PTO+Eff8mWHhMLyrJqXwUAp7XMi/V97nVKYIzZS3e4wpoRDNLvFoI11e7ZjxJ9TFtPsnD5EYfDxyKNTbDVaHpPVCwodiCjYeeuigTdJrrcrXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717169735; c=relaxed/simple;
	bh=5ES2tLEvuBkg9uq4oaUjnzmWyJH9et9b5IG7ptJ9X70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IckXDk7VWt9BxAxLaJ5SMEtQTu81k75NLtkbpGw/UOsrkqrz9p3TiSFrc4s1yGw4eDpHu+mRBQAIoWO4g+ayK8AxYme/TfAoc7Sjod4aL/tSGKKc/D0e3+xqMHJqRDVaFda19aqpMyv3rjibYNXoQ8iFqTxK3mc/JwSih3s3KQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToNkfuVf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77EBC116B1;
	Fri, 31 May 2024 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717169735;
	bh=5ES2tLEvuBkg9uq4oaUjnzmWyJH9et9b5IG7ptJ9X70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ToNkfuVf3H0Efp9veYa2ld7qGbzHFbFRPC/gN56lffu9WPfG1QwyzsIGXGPjYlVRT
	 EKbQtVaeRb9psOf5GIv+WJ6vYEgs3EpcXUZu0CxfXr7J9GKfDr1weAvH93GGQNqAVI
	 vbofgP5GN94o1vrFjbc4nKZooZE3vjupSJcoLCeY7lDPJnagJIgCjYxfLeAAjeSCX/
	 PkFxTLfE7goWimj0/lq+I5X+LvKnbrr8st0UfmhVbkfk4ICLX8FTexjMuBsuINlllL
	 WWqjaRSOOhej6UO9Qj/CJkjH8WaIk6OyuJsky/4wadyLIHntNrRTdBrUHT1yaMs4Gk
	 SLo5qg9TuHSYg==
Date: Fri, 31 May 2024 16:35:30 +0100
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
Message-ID: <20240531153530.GP1005600@google.com>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>

On Sun, 26 May 2024, Thomas Weißschuh wrote:

> Extend the cros_ec MFD device to also load cros_kbd_led_backlight
> when the EC reports EC_FEATURE_PWM_KEYB.
> As the driver can now be probed multiple times, some preparation in the
> LED core is necessary to avoid name collisions.
> 
> Patch 1 is a general cleanup for the LED core.
> Patch 2 modifies the LED core to skip the default collision handling.
> Patch 3 adds the new probing logic to cros_kbd_led_backlight.
> Patch 4 wires up the driver to the cros_ec mfd devices.
> 
> The helper keyboard_led_is_mfd_device is a bit iffy.
> But using match data doesn't work.
> 
> * driver_data from platform_device_id is overwritten by the mfd platform data
> * Setting the driver_data in drivers/mfd/cros_ec_dev.c would expose the
> internals of cros_kbd_led_backlight
> 
> Tested on a Framework 13 AMD, Firmware 3.05, and a Jinlon Chromebook.
> 
> To: Lee Jones <lee@kernel.org>
> To: Benson Leung <bleung@chromium.org>
> To: Guenter Roeck <groeck@chromium.org>
> To: Tzung-Bi Shih <tzungbi@kernel.org>
> To: Pavel Machek <pavel@ucw.cz>
> Cc: chrome-platform@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: Dustin Howett <dustin@howett.net>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: linux-leds@vger.kernel.org
> Cc: Rajas Paranjpe <paranjperajas@gmail.com>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> Changes in v3:
> - Avoid probing multiple times (Confirmed by Rajas)
> - Add Kconfig dependency on MFD_CROS_EC_DEV
> - Link to v2: https://lore.kernel.org/r/20240511-cros_ec-kbd-led-framework-v2-0-b20c48109e46@weissschuh.net
> 
> Changes in v2:
> - Fix build with CONFIG_MFD_CROS_EC_DEV=n (kernel test robot)
> - Split out mfd registration into own commit (Lee)
> - Simplify keyboard_led_is_mfd_device() with mfd_get_cell()
> - Link to v1: https://lore.kernel.org/r/20240505-cros_ec-kbd-led-framework-v1-1-bfcca69013d2@weissschuh.net
> 
> ---
> Thomas Weißschuh (4):
>       leds: class: warn about name collisions earlier
>       leds: add flag to avoid automatic renaming of led devices
>       platform/chrome: cros_kbd_led_backlight: allow binding through mfd device
>       mfd: cros_ec: Register keyboard backlight subdevice
> 
>  drivers/leds/led-class.c                         |  9 +++---
>  drivers/mfd/cros_ec_dev.c                        |  9 ++++++
>  drivers/platform/chrome/Kconfig                  |  2 +-
>  drivers/platform/chrome/cros_kbd_led_backlight.c | 40 ++++++++++++++++++++++--
>  include/linux/leds.h                             |  1 +
>  5 files changed, 54 insertions(+), 7 deletions(-)

Looks okay.

Does the platform patch need to be applied with the others?

-- 
Lee Jones [李琼斯]

