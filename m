Return-Path: <linux-leds+bounces-1814-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9477B8D79FB
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 03:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 561C82813BD
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 01:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9354A08;
	Mon,  3 Jun 2024 01:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOcSQl4V"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC974696;
	Mon,  3 Jun 2024 01:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717379673; cv=none; b=XGXKj3cGyTGdsCw6cD5OFC59ensplBGlMg8stegYzSyd6NnC0CKhPrgVVcqQDNFQY2xTal23+nMJebrtJn75TtPiTVH9WahIMu+AhKFKF5spVz+V5UpYw2iSJtIrbCvm7QPrSLr93WvbA3CywvJ79bKpmvmtW43LAna3hE3Rpg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717379673; c=relaxed/simple;
	bh=hMsbcjB+aZSQFprtJrmCsK/CYdACyU8P6CaHxqgJLFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMm4NhUesHrh7XWqHyahO4M6TtKhNFcB6TDoy4wvqDJX99OKIlo81gFLhnnmeqOGPMSh8qYF6UrFc0lZpsgFtaO8hfdW6wQFl4XplQNCm2iF9d2VP1rgyOLPlFi9nZpjAr4ZOfKWX1fzgzD9oEzh3z7nW/hLVLFAUCEXDhQa7tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOcSQl4V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87522C2BBFC;
	Mon,  3 Jun 2024 01:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717379673;
	bh=hMsbcjB+aZSQFprtJrmCsK/CYdACyU8P6CaHxqgJLFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOcSQl4V1Y3Hkv/l8RT1lkEhhWoLjVeywWPA1rpZ4B5PuvsbU2ZNjApHA8UMyCtYu
	 g3uUg85YZVmH3xSfpV3abASaw20bjsy79S7uSDlx3/P5Zcmj06c1DKs3KKbb9ZYLHE
	 U0Go7YxKVs5RUq6O4KCvkFg6/auaIHGkp/sEtfc9ZtjuFJT6td0SOXPsWeof6Iq0Ai
	 6LRZTk1Wy/ngVfkPfjMLk0WLBuaneHFCSMh74w/WgNdsfpTDxyEiY58A02KYIkUZY5
	 FOWoKfUrhAMwUu5wHVHdLK7VaYORm+4CWjVredH5KUnQ1wXosAPz6zCkoZYVjcMV62
	 4t2IVVejAvwQA==
Date: Mon, 3 Jun 2024 01:54:29 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Pavel Machek <pavel@ucw.cz>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-leds@vger.kernel.org,
	Rajas Paranjpe <paranjperajas@gmail.com>
Subject: Re: [PATCH v3 0/4] cros_kbd_led_backlight: allow binding through
 cros_ec mfd device
Message-ID: <Zl0iVcb0ChMbiWzS@google.com>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240531153530.GP1005600@google.com>
 <0172f4a6-27da-43ca-8df3-93279d1ef903@t-8ch.de>
 <20240531155356.GR1005600@google.com>
 <edc637ff-d26d-4500-8ad3-23bf7a9d527e@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edc637ff-d26d-4500-8ad3-23bf7a9d527e@t-8ch.de>

On Fri, May 31, 2024 at 05:59:01PM +0200, Thomas Weiﬂschuh wrote:
> On 2024-05-31 16:53:56+0000, Lee Jones wrote:
> > On Fri, 31 May 2024, Thomas Weiﬂschuh wrote:
> > 
> > > On 2024-05-31 16:35:30+0000, Lee Jones wrote:
> > > > On Sun, 26 May 2024, Thomas Weiﬂschuh wrote:
> > > > 
> > > > > Extend the cros_ec MFD device to also load cros_kbd_led_backlight
> > > > > when the EC reports EC_FEATURE_PWM_KEYB.
> > > > > As the driver can now be probed multiple times, some preparation in the
> > > > > LED core is necessary to avoid name collisions.
> > > > > 
> > > > > Patch 1 is a general cleanup for the LED core.
> > > > > Patch 2 modifies the LED core to skip the default collision handling.
> > > > > Patch 3 adds the new probing logic to cros_kbd_led_backlight.
> > > > > Patch 4 wires up the driver to the cros_ec mfd devices.
> > > > > 
> > > > > The helper keyboard_led_is_mfd_device is a bit iffy.
> > > > > But using match data doesn't work.
> > > > > 
> > > > > * driver_data from platform_device_id is overwritten by the mfd platform data
> > > > > * Setting the driver_data in drivers/mfd/cros_ec_dev.c would expose the
> > > > > internals of cros_kbd_led_backlight
> > > > > 
> > > > > Tested on a Framework 13 AMD, Firmware 3.05, and a Jinlon Chromebook.
> > > > > 
> > > > > To: Lee Jones <lee@kernel.org>
> > > > > To: Benson Leung <bleung@chromium.org>
> > > > > To: Guenter Roeck <groeck@chromium.org>
> > > > > To: Tzung-Bi Shih <tzungbi@kernel.org>
> > > > > To: Pavel Machek <pavel@ucw.cz>
> > > > > Cc: chrome-platform@lists.linux.dev
> > > > > Cc: linux-kernel@vger.kernel.org
> > > > > Cc: Dustin Howett <dustin@howett.net>
> > > > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > > > Cc: linux-leds@vger.kernel.org
> > > > > Cc: Rajas Paranjpe <paranjperajas@gmail.com>
> > > > > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > > > > 
> > > > > Changes in v3:
> > > > > - Avoid probing multiple times (Confirmed by Rajas)
> > > > > - Add Kconfig dependency on MFD_CROS_EC_DEV
> > > > > - Link to v2: https://lore.kernel.org/r/20240511-cros_ec-kbd-led-framework-v2-0-b20c48109e46@weissschuh.net
> > > > > 
> > > > > Changes in v2:
> > > > > - Fix build with CONFIG_MFD_CROS_EC_DEV=n (kernel test robot)
> > > > > - Split out mfd registration into own commit (Lee)
> > > > > - Simplify keyboard_led_is_mfd_device() with mfd_get_cell()
> > > > > - Link to v1: https://lore.kernel.org/r/20240505-cros_ec-kbd-led-framework-v1-1-bfcca69013d2@weissschuh.net
> > > > > 
> > > > > ---
> > > > > Thomas Weiﬂschuh (4):
> > > > >       leds: class: warn about name collisions earlier
> > > > >       leds: add flag to avoid automatic renaming of led devices
> > > > >       platform/chrome: cros_kbd_led_backlight: allow binding through mfd device
> > > > >       mfd: cros_ec: Register keyboard backlight subdevice
> > > > > 
> > > > >  drivers/leds/led-class.c                         |  9 +++---
> > > > >  drivers/mfd/cros_ec_dev.c                        |  9 ++++++
> > > > >  drivers/platform/chrome/Kconfig                  |  2 +-
> > > > >  drivers/platform/chrome/cros_kbd_led_backlight.c | 40 ++++++++++++++++++++++--
> > > > >  include/linux/leds.h                             |  1 +
> > > > >  5 files changed, 54 insertions(+), 7 deletions(-)
> > > > 
> > > > Looks okay.
> > > 
> > > Thanks.
> > > 
> > > > Does the platform patch need to be applied with the others?
> > > 
> > > Each patch depends on all its predecessors.
> > > (but I'm not sure I understood your question)
> > 
> > Does the Platform patch have 'build-time' deps on the others?
> 
> Yes.
> 
> Patch 3 makes use of LED_REJECT_NAME_CONFLICT which was introduced in Patch 2.
> 
> Patch 1, 2, 3 have build-time deps on their predecessors.
> Patch 4 has a run-time deps on Patch 3.

Patch 1 is independent actually.

