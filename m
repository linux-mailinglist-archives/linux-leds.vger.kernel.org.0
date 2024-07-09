Return-Path: <linux-leds+bounces-2223-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66192B3CD
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2024 11:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC1691F220A7
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2024 09:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E5915530B;
	Tue,  9 Jul 2024 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWH01lHC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD0155310;
	Tue,  9 Jul 2024 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517153; cv=none; b=bnPqpsYnieBfGAWkwPZYF+UZ4/GuEJeez/alI8gU6qr92xuxS5pcLTTt9DDPg9v5KE/TPw5Lxin95dUEWefy5TNy106cY2mDqCUsOz1xJAGNWKSEWizSfkMGLEZ7w5+fcozzzlS5ZzjfTkMnORvayWS/lZVsz4kP26EwJfhbgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517153; c=relaxed/simple;
	bh=QBQ3Vf3AsBCxVX0Ial0oaRT12iQXKMU1CCuUwuqKGGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOR5O2y4O8et0y0vgbUvbezlOA72sd8d+dTfFiR8lmzESDqQ5m92fdtJzwmPXkBk/rL4JxGcDbm9d9wmx/FuII1BDPel7PzFH8wX+Tv9ZQbIC4lFxRuE9e3E3ZgGMPfW2nakkLBYNzBpCpSV3T3YoCW1u+gXA+4hYeotUadbhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWH01lHC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801C7C3277B;
	Tue,  9 Jul 2024 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517152;
	bh=QBQ3Vf3AsBCxVX0Ial0oaRT12iQXKMU1CCuUwuqKGGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWH01lHC26cPJsw/X+HBenWlEpFJJfJltpYufo4Nwc+j21AG+AgSd0mO35ip/x55X
	 1j3wMkPD4jxOL9TWXbtvtIQpK+r5OevcF9GrmWkPk6CyxPTlJhwGyvfrSQpodhNU9T
	 Ej5H2PNhkrvX3NwrYtw2gYhZg99SIq3DOU0O7SqXa+cuujYzDd5SUzD8zYIMTnYep1
	 cIUi8500jcB+ittL3URif7r3qBocfl1W3F80r2sNTH5NJflOYtX8H98NBCeE2cMMLB
	 HXmWdNfbJvJ6qLoehzpkJxb2fWCkI12TVgucRPshBHD2ku/q3Q9I9YQbQNDZx50ZBE
	 BAe9M3W+wYjVQ==
Date: Tue, 9 Jul 2024 10:25:47 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-leds@vger.kernel.org,
	Rajas Paranjpe <paranjperajas@gmail.com>
Subject: [GIT PULL] Immutable branch between MFD, LEDs and Platform due for
 the v6.11 merge window[GIT PULL] Immutable branch between MFD, LEDs and
 Platform due for the v6.11 merge window
Message-ID: <20240709092547.GC501857@google.com>
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

Enjoy!

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-leds-platform-v6.11

for you to fetch changes up to 970c3a6b7aa3c68ccdf5af2562c3d39533dd62a9:

  mfd: cros_ec: Register keyboard backlight subdevice (2024-06-14 10:09:40 +0100)

----------------------------------------------------------------
Immutable branch between MFD, LEDs and Platform due for the v6.11 merge window

----------------------------------------------------------------
Thomas Weißschuh (4):
      leds: class: Warn about name collisions earlier
      leds: class: Add flag to avoid automatic renaming of LED devices
      platform/chrome: cros_kbd_led_backlight: allow binding through MFD
      mfd: cros_ec: Register keyboard backlight subdevice

 drivers/leds/led-class.c                         |  9 +++---
 drivers/mfd/cros_ec_dev.c                        |  9 ++++++
 drivers/platform/chrome/Kconfig                  |  2 +-
 drivers/platform/chrome/cros_kbd_led_backlight.c | 40 ++++++++++++++++++++++--
 include/linux/leds.h                             |  1 +
 5 files changed, 54 insertions(+), 7 deletions(-)

-- 
Lee Jones [李琼斯]

